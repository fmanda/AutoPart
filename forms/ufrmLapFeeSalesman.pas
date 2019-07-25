unit ufrmLapFeeSalesman;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, uDXUtils, uDButils, uAppUtils,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxCheckBox,
  Datasnap.DBClient, cxRadioGroup;

type
  TfrmLapFeeSalesman = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxLabel3: TcxLabel;
    dtStart: TcxDateEdit;
    dtEnd: TcxDateEdit;
    cxLabel5: TcxLabel;
    ckSalesman: TcxCheckBox;
    cxLookupSalesman: TcxExtLookupComboBox;
    styleCancel: TcxStyle;
    styleProcess: TcxStyle;
    stylePaid: TcxStyle;
    rbPeriode: TcxRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure ckSalesmanPropertiesEditValueChanged(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure cxGrdMainStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
  private
    CDS: TClientDataset;
    { Private declarations }
  public
    function GetGroupName: string; override;
    { Public declarations }
  end;

var
  frmLapFeeSalesman: TfrmLapFeeSalesman;

implementation

uses
  System.DateUtils;

{$R *.dfm}

procedure TfrmLapFeeSalesman.btnRefreshClick(Sender: TObject);
var
  S: string;
begin
  inherited;
  S := 'SELECT A.REFNO, A.TRANSDATE AS TGL_FAKTUR, B.NAMA AS SALESMAN, E.NAMA AS CUSTOMER,'
      +' A.SALESAMT, A.RETURAMT, (A.SALESAMT - A.RETURAMT) AS NETSALES, ' // A.SALESCOST, A.RETURCOST, A.NETPROFIT,'
      +' D.PAIDOFFDATE AS TGL_PELUNASAN, C.NAMA AS SETTINGFEE,'
      +' CASE WHEN A.STATUS = 1 THEN ''PROSES'' WHEN A.STATUS = 2 THEN ''TERBAYAR'' '
      +' WHEN A.STATUS = 3 THEN ''HANGUS'' ELSE ''OPEN'' END AS STATUS, A.FEE'
      +' FROM TSALESFEE A'
      +' INNER JOIN TSALESMAN B ON A.SALESMAN_ID = B.ID'
      +' LEFT JOIN TSETTINGFEE C ON A.SETTINGFEE_ID = C.ID'
      +' LEFT JOIN TSALESINVOICE D ON A.SALESINVOICE_ID = D.ID'
      +' LEFT JOIN TCUSTOMER E ON D.CUSTOMER_ID = E.ID ';

  if rbPeriode.ItemIndex = 0 then
    S := S +' WHERE D.PAIDOFFDATE BETWEEN ' + TAppUtils.QuotD(dtStart.Date)
           +' AND ' + TAppUtils.QuotD(dtEnd.Date)
  else
    S := S +' WHERE A.TRANSDATE BETWEEN ' + TAppUtils.QuotD(dtStart.Date)
           +' AND ' + TAppUtils.QuotD(dtEnd.Date);

  if ckSalesman.Checked then
    S := S + ' AND A.SALESMAN_ID = ' + IntToStr(VarToInt(cxLookupSalesman.EditValue));

  if CDS <> nil then FreeAndNil(CDS);
  CDS := TDBUtils.OpenDataset(S, Self);
  cxGrdMain.LoadFromCDS(CDS);
  cxGrdMain.SetSummaryByColumns(['SalesAmt','ReturAmt', 'NetSales','Fee']);
end;

procedure TfrmLapFeeSalesman.ckSalesmanPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cxLookupSalesman.Enabled := ckSalesman.Checked;
  if not cxLookupSalesman.Enabled then
    cxLookupSalesman.Clear;
end;

procedure TfrmLapFeeSalesman.cxGrdMainStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  iIndex : Integer;
  iStatus: String;
begin
  inherited;
  if ARecord = nil then exit;

  if cxGrdMain.GetColumnByFieldName('Status') = nil then exit;
  iIndex := cxGrdMain.GetColumnByFieldName('Status').Index;

  iStatus := VarToStr(ARecord.Values[iIndex]);

  if iStatus = 'PROSES' then AStyle := styleProcess;
  if iStatus = 'TERBAYAR' then AStyle := stylePaid;
  if iStatus = 'HANGUS' then AStyle := styleCancel;


end;

procedure TfrmLapFeeSalesman.FormCreate(Sender: TObject);
begin
  inherited;
  cxLookupSalesman.Properties.LoadFromSQL(Self,
    'select id, nama from tsalesman','nama');

  dtStart.Date  := StartOfTheMonth(Now());
  dtEnd.Date    := EndOfTheMonth(Now());

  ckSalesmanPropertiesEditValueChanged(Self);

end;

procedure TfrmLapFeeSalesman.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

function TfrmLapFeeSalesman.GetGroupName: string;
begin
  Result := 'Penjualan & Kas';
end;

end.
