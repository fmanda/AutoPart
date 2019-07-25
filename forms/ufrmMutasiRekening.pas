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
  Datasnap.DBClient;

type
  TfrmMutasiRekening = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLookupRekening: TcxExtLookupComboBox;
    dtStart: TcxDateEdit;
    dtEnd: TcxDateEdit;
    cxLabel5: TcxLabel;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colTransDate: TcxGridDBColumn;
    colRefNo: TcxGridDBColumn;
    colNotes: TcxGridDBColumn;
    colQty: TcxGridDBColumn;
    colSaldo: TcxGridDBColumn;
    colUOM: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure btnExportClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCDS: TClientDataset;
    function GetCDS: TClientDataset;
    procedure InitView;
    procedure LoadData;
    property CDS: TClientDataset read GetCDS write FCDS;
    { Private declarations }
  public
    function GetGroupName: string; override;
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

procedure TfrmMutasiRekening.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  InitView;
  dtStart.Date  := StartOfTheMonth(Now());
  dtEnd.Date    := EndOfTheMonth(Now());
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

function TfrmMutasiRekening.GetGroupName: string;
begin
  Result := 'Penjualan & Kas';
end;

procedure TfrmMutasiRekening.InitView;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  cxLookupRekening.Properties.LoadFromSQL(Self,
    'select id, nama from trekening','nama');
  cxLookupRekening.SetDefaultValue();
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
  Try
    CDS.EmptyDataSet;

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
  Finally
    CDS.EnableControls;
  End;

end;

end.
