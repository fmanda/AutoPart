unit ufrmProfitLoss;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCheckBox, cxSpinEdit, cxDropDownEdit,
  cxTextEdit, cxMaskEdit, cxCalendar, cxCustomData, cxTL, cxCurrencyEdit,
  cxTLdxBarBuiltInMenu, cxDataControllerConditionalFormattingRulesManagerDialog,
  cxInplaceContainer, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxGridCustomView, cxGrid, Datasnap.DBClient, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox;

type
  TfrmProfitLoss = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    dtStart: TcxDateEdit;
    dtEnd: TcxDateEdit;
    cxLabel5: TcxLabel;
    cbBulan: TcxComboBox;
    cxLabel1: TcxLabel;
    spTahun: TcxSpinEdit;
    cxLabel2: TcxLabel;
    chkPeriode: TcxCheckBox;
    cxStyleRepository1: TcxStyleRepository;
    styleCaption: TcxStyle;
    styleFooter: TcxStyle;
    styleGrossProfit: TcxStyle;
    styleNetProfit: TcxStyle;
    styleBackGround: TcxStyle;
    cxGrid2: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    clDesription: TcxGridDBColumn;
    clMTD: TcxGridDBColumn;
    clYTD: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    clReportFlag: TcxGridDBColumn;
    clHasValue: TcxGridDBColumn;
    cxLookupCabang: TcxExtLookupComboBox;
    ckCabang: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure chkPeriodePropertiesEditValueChanged(Sender: TObject);
    procedure cbBulanPropertiesEditValueChanged(Sender: TObject);
    procedure spTahunPropertiesEditValueChanged(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure ckCabangClick(Sender: TObject);
  private
    CDS: TClientDataset;
    procedure LoadData;
    procedure UpdatePeriode;
    { Private declarations }
  public
    function GetGroupName: string; override;
    { Public declarations }
  end;

var
  frmProfitLoss: TfrmProfitLoss;

implementation

uses
  System.DateUtils, uAppUtils, uDBUtils, uDXUtils, uVariable;

{$R *.dfm}

procedure TfrmProfitLoss.FormCreate(Sender: TObject);
begin
  inherited;
  cbBulan.ItemIndex := MonthOf(Now())-1;
  spTahun.Value := YearOf(Now());
  chkPeriode.Checked := False;
  chkPeriodePropertiesEditValueChanged(Self);

  cxLookupCabang.LoadFromSQL('select project_code, project_name from tproject','project_code','project_name', Self);
  ckCabang.Checked := False;
  cxLookupCabang.Clear;
  ckCabangClick(Self);
end;

procedure TfrmProfitLoss.btnRefreshClick(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TfrmProfitLoss.cbBulanPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  UpdatePeriode;
end;

procedure TfrmProfitLoss.chkPeriodePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  cbBulan.Enabled := not chkPeriode.Checked;
  spTahun.Enabled := not chkPeriode.Checked;
  dtStart.Enabled := chkPeriode.Checked;
  dtEnd.Enabled   := chkPeriode.Checked;

  if not chkPeriode.Checked then
  begin
    UpdatePeriode;
  end;


end;

procedure TfrmProfitLoss.ckCabangClick(Sender: TObject);
begin
  inherited;
  cxLookupCabang.Enabled := ckCabang.Checked;
  if not ckCabang.Checked then
    cxLookupCabang.Clear
  else
    cxLookupCabang.EditValue := AppVariable.Kode_Cabang;
end;

function TfrmProfitLoss.GetGroupName: string;
begin
  Result := 'Manajemen';
end;

procedure TfrmProfitLoss.LoadData;
var
  S: string;
begin
  if CDS <> nil then
    FreeAndNil(CDS);

  S := 'SELECT * FROM FN_PROFITLOSS_MTD_YTD(' + TAppUtils.QuotD(dtEnd.Date) +',' +  QuotedStr(VarToStr(cxLookupCabang.EditValue))  +')';

  CDS := TDBUtils.OpenDataset(S, Self);

  cxGrdMain.PrepareFromCDS(CDS);
end;

procedure TfrmProfitLoss.spTahunPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  UpdatePeriode;
end;

procedure TfrmProfitLoss.UpdatePeriode;
var
  lDate: TDatetime;
begin
  lDate := EncodeDate(spTahun.Value, cbBulan.ItemIndex + 1, 1);
  dtStart.Date := StartOfTheMonth(lDate);
  dtEnd.Date := EndOfTheMonth(lDate);

end;

end.
