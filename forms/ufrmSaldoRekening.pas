unit ufrmSaldoRekening;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxTextEdit, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, cxCheckBox,
  cxDropDownEdit, cxCalendar, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, Datasnap.DBClient;

type
  TfrmSaldoRekening = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxLookupRekening: TcxExtLookupComboBox;
    dtSaldo: TcxDateEdit;
    ckRekening: TcxCheckBox;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colKode: TcxGridDBColumn;
    colNotes: TcxGridDBColumn;
    colHrgAvg: TcxGridDBColumn;
    colQty: TcxGridDBColumn;
    colValue: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    pmMain: TPopupMenu;
    LihatKartuStock1: TMenuItem;
    procedure btnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure ckRekeningPropertiesEditValueChanged(Sender: TObject);
    procedure LihatKartuStock1Click(Sender: TObject);
  private
    FCDS: TClientDataset;
    procedure InitView;
    procedure LoadData;
    property CDS: TClientDataset read FCDS write FCDS;
    { Private declarations }
  public
    function GetGroupName: string; override;
    { Public declarations }
  end;

var
  frmSaldoRekening: TfrmSaldoRekening;

implementation

uses
  uDXUtils, uAppUtils, uDBUtils, ufrmMutasiRekening;

{$R *.dfm}

procedure TfrmSaldoRekening.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmSaldoRekening.btnRefreshClick(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TfrmSaldoRekening.ckRekeningPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cxLookupRekening.Enabled := ckRekening.Checked;
  if not ckRekening.Checked then
    cxLookupRekening.Clear;
end;

procedure TfrmSaldoRekening.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  InitView;
  dtSaldo.Date  := Now();
  ckRekeningPropertiesEditValueChanged(Self);
end;

function TfrmSaldoRekening.GetGroupName: string;
begin
  Result := 'Penjualan & Kas';
end;

procedure TfrmSaldoRekening.InitView;
begin
  cxGrdMain.PrepareFromCDS(CDS);
//  cxLookupUOM.Properties.LoadFromSQL(Self,
//    'select id, uom from tuom','uom');
  cxLookupRekening.Properties.LoadFromSQL(Self,
    'select id, nama from trekening','nama');
//  cxLookupRekening.SetDefaultValue();
end;

procedure TfrmSaldoRekening.LihatKartuStock1Click(Sender: TObject);
var
  lfrm : TfrmMutasiRekening;
begin
  inherited;
  if FCDS = nil then
    exit;

  lfrm := TfrmMutasiRekening.Create(Application);
  lfrm.LoadByID(CDS.FieldByName('ID').AsInteger, dtSaldo.Date);
end;

procedure TfrmSaldoRekening.LoadData;
var
  S: string;
begin
  if (ckRekening.Checked) and (VarToInt(cxLookupRekening.EditValue) = 0) then
  begin
    TAppUtils.Warning('Rekening belum dipilih');
    exit;
  end;

  if FCDS <> nil then FreeAndNil(FCDS);

  S := 'SELECT B.ID, B.KODE, B.NAMA, A.DEBET, A.CREDIT, A.BALANCE'
      +' FROM FN_SALDO_REKENING(' + TAppUtils.QuotD(dtSaldo.Date)
      + ',' + IntToStr(VarToInt(cxLookupRekening.EditValue)) +  ') A'
      +' INNER JOIN TREKENING B ON A.REKENING_ID = B.ID'
      +' ORDER BY B.JENIS, B.KODE';

  FCDS := TDBUtils.OpenDataset(S);
  cxGrdMain.PrepareFromCDS(CDS);

//  cxGrdSrv.LoadFromSQL(S, 'ID');
//  cxGrdSrv.SetVisibleColumns(['HargaAvg','Total'], ckShowAvgCost.Checked);
//  cxGrdSrv.SetVisibleColumns(['Merk','ItemGroup'], ckGrupMerk.Checked);
end;

end.
