unit ufrmLabaRugi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCurrencyEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid,
  Datasnap.DBClient, System.DateUtils, uDMReport;

type
  TfrmLabaRugi = class(TfrmDefaultReport)
    dtDate: TcxDateEdit;
    cxLabel3: TcxLabel;
    cxGrid2: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    clDesription: TcxGridDBColumn;
    clMTD: TcxGridDBColumn;
    clYTD: TcxGridDBColumn;
    clReportFlag: TcxGridDBColumn;
    clHasValue: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    styleBold: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure clDesriptionStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure btnPrintClick(Sender: TObject);
  private
    FCDS: TClientDataset;
    procedure LoadData;
    property CDS: TClientDataset read FCDS write FCDS;
    { Private declarations }
  public
    function GetGroupName: string; override;
    { Public declarations }
  end;

var
  frmLabaRugi: TfrmLabaRugi;

implementation

uses
  uAppUtils, uDXUtils, uDBUtils;

{$R *.dfm}

procedure TfrmLabaRugi.FormCreate(Sender: TObject);
begin
  inherited;
  dtDate.Date := EndOfTheMonth(Now());
end;

procedure TfrmLabaRugi.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmLabaRugi.btnPrintClick(Sender: TObject);
begin
  inherited;
  DMReport.AddReportVariable('LR_Periode', dtDate.Text);
  DMReport.ExecuteReport('LapLabaRugi', CDS);
end;

procedure TfrmLabaRugi.btnRefreshClick(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TfrmLabaRugi.clDesriptionStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord = nil then exit;
  if VarToStr(ARecord.Values[clReportFlag.Index]) = 'Header' then
    AStyle := styleBold;
  if VarToStr(ARecord.Values[clReportFlag.Index]) = 'SubTotal' then
    AStyle := styleBold;
end;

function TfrmLabaRugi.GetGroupName: string;
begin
  Result := 'Accounting';
end;

procedure TfrmLabaRugi.LoadData;
var
  S: string;
begin
  if CDS <> nil then
    FreeAndNil(FCDS);

  S := 'SELECT * FROM FN_PROFITLOSS_MTD_YTD(' + TAppUtils.QuotD(dtDate.Date) +')';

  CDS := TDBUtils.OpenDataset(S, Self);

  cxGrdMain.PrepareFromCDS(CDS);

end;

end.
