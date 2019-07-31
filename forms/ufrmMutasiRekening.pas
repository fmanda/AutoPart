unit ufrmMutasiRekening;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCalendar, cxTextEdit, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, cxDropDownEdit,
  cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  Datasnap.DBClient, dxBarBuiltInMenu, cxPC;

type
  TfrmMutasiRekening = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLookupRekening: TcxExtLookupComboBox;
    dtStart: TcxDateEdit;
    dtEnd: TcxDateEdit;
    cxLabel5: TcxLabel;
    pgcMain: TcxPageControl;
    tsDetail: TcxTabSheet;
    tsRekap: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colTransDate: TcxGridDBColumn;
    colRefNo: TcxGridDBColumn;
    colQty: TcxGridDBColumn;
    colSaldo: TcxGridDBColumn;
    colUOM: TcxGridDBColumn;
    colNotes: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrdRekap: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxLabel1: TcxLabel;
    crSaldo: TcxCurrencyEdit;
    colNo: TcxGridDBColumn;
    procedure btnExportClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure colNoGetDisplayText(Sender: TcxCustomGridTableItem; ARecord:
        TcxCustomGridRecord; var AText: string);
    procedure FormCreate(Sender: TObject);
  private
    FCDS: TClientDataset;
    FCDSRekap: TClientDataset;
    function GetCDS: TClientDataset;
    function GetCDSRekap: TClientDataset;
    procedure InitView;
    procedure LoadData;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSRekap: TClientDataset read GetCDSRekap write FCDSRekap;
    { Private declarations }
  public
    function GetGroupName: string; override;
    procedure LoadByID(aRekeningID: Integer; aDate: TDateTime);
    { Public declarations }
  end;

var
  frmMutasiRekening: TfrmMutasiRekening;

implementation

uses
  uDXUtils, uDBUtils, uAccount, System.DateUtils, uAppUtils;

{$R *.dfm}

procedure TfrmMutasiRekening.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmMutasiRekening.btnRefreshClick(Sender: TObject);
begin
  inherited;
  if YearOf(dtStart.Date) <> YearOf(dtEnd.Date) then
  begin
    TAppUtils.Warning('Tidak bisa lintas tahun');
    exit;
  end;

  LoadData;
end;

procedure TfrmMutasiRekening.colNoGetDisplayText(Sender:
    TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if ARecord = nil then exit;
  AText := IntToStr(ARecord.RecordIndex + 1);
end;

procedure TfrmMutasiRekening.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  InitView;
  dtStart.Date  := (Now());
  dtEnd.Date    := (Now());
  pgcMain.ActivePage := tsDetail;
end;

function TfrmMutasiRekening.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TClientDataSet.Create(Self);
    FCDS.AddField('TransDate', ftDate);
    FCDS.AddField('RefNo', ftString);
    FCDS.AddField('Notes', ftString);
    FCDS.AddField('Debet', ftFloat);
    FCDS.AddField('Credit', ftFloat);
    FCDS.AddField('Balance', ftFloat);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmMutasiRekening.GetCDSRekap: TClientDataset;
begin
  if FCDSRekap = nil then
  begin
    FCDSRekap := TClientDataSet.Create(Self);
    FCDSRekap.AddField('TransName', ftString);
    FCDSRekap.AddField('Total', ftFloat);
    FCDSRekap.CreateDataSet;
  end;
  Result := FCDSRekap;
end;

function TfrmMutasiRekening.GetGroupName: string;
begin
  Result := 'Penjualan & Kas';
end;

procedure TfrmMutasiRekening.InitView;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  cxGrdRekap.PrepareFromCDS(CDSRekap);
  cxLookupRekening.Properties.LoadFromSQL(Self,
    'select id, nama from trekening','nama');
  cxLookupRekening.SetDefaultValue();
end;

procedure TfrmMutasiRekening.LoadByID(aRekeningID: Integer; aDate: TDateTime);
begin
  dtStart.Date := aDate;
  dtEnd.Date := aDate;
  cxLookupRekening.EditValue := aRekeningID;
  LoadData;
end;

procedure TfrmMutasiRekening.LoadData;
var
  lSaldo: Double;
  S: string;
begin

  if VarToInt(cxLookupRekening.EditValue) = 0 then
  begin
    TAppUtils.Warning('Satuan belum dipilih');
    exit;
  end;


  CDS.DisableControls;
  CDSRekap.DisableControls;
  Try
    CDS.EmptyDataSet;
    CDSRekap.EmptyDataSet;

    S := 'SELECT * FROM FN_MUTASI_REKENING('
        + IntToStr(VarToInt(cxLookupRekening.EditValue))
        + ',' + TAppUtils.QuotD(dtStart.Date)
        + ',' + TAppUtils.QuotD(dtEnd.Date) + ')';

    lSaldo := 0;
    with TDBUtils.OpenQuery(S) do
    begin
      Try
        while not eof do
        begin
          CDS.Append;
          CDS.FieldByName('TransDate').AsDateTime := FieldByName('TransDate').AsDateTime;
          CDS.FieldByName('Refno').AsString       := FieldByName('Refno').AsString;
          CDS.FieldByName('Notes').AsString       := FieldByName('Notes').AsString;
          CDS.FieldByName('Debet').AsFloat        := FieldByName('Debet').AsFloat;
          CDS.FieldByName('Credit').AsFloat       := FieldByName('Credit').AsFloat;

          lSaldo := lSaldo + CDS.FieldByName('Debet').AsFloat - CDS.FieldByName('Credit').AsFloat;

          CDS.FieldByName('Balance').AsFloat      := lSaldo;
          CDS.Post;
          next;
        end;
      Finally
        Free;
      End;
    end;

    crSaldo.Value := lSaldo;

    S := 'SELECT TRANSNAME, SUM(TOTAL) AS TOTAL FROM FN_REKAPMUTASI_REKENING('
        + IntToStr(VarToInt(cxLookupRekening.EditValue))
        + ',' + TAppUtils.QuotD(dtStart.Date)
        + ',' + TAppUtils.QuotD(dtEnd.Date) + ')'
        + ' GROUP BY TRANSNAME';


    with TDBUtils.OpenQuery(S) do
    begin
      Try
        while not eof do
        begin
          CDSRekap.Append;
          CDSRekap.FieldByName('TransName').AsString   := FieldByName('TransName').AsString;
          CDSRekap.FieldByName('Total').AsFloat        := FieldByName('Total').AsFloat;
          CDSRekap.Post;
          next;
        end;
      Finally
        Free;
      End;
    end;
  Finally
    CDS.EnableControls;
    CDSRekap.EnableControls;
  End;

end;

end.
