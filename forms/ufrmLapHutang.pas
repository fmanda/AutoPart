unit ufrmLapHutang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxCheckBox, cxButtonEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Datasnap.DBClient;

type
  TfrmLapHutang = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel3: TcxLabel;
    dtRefDate: TcxDateEdit;
    edKode: TcxButtonEdit;
    ckItem: TcxCheckBox;
    ckDueDate: TcxCheckBox;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    styleRed: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure cxGrdMainStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
  private
    CDS: TClientDataset;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapHutang: TfrmLapHutang;

implementation

uses
  uAppUtils, uDBUtils, uDXUtils, System.DateUtils;

{$R *.dfm}

procedure TfrmLapHutang.FormCreate(Sender: TObject);
begin
  inherited;
  dtRefDate.Date := (Now());
end;

procedure TfrmLapHutang.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmLapHutang.btnRefreshClick(Sender: TObject);
var
  S: string;
begin
  inherited;
  S := 'SELECT * FROM FN_AP_OUTSTANDING(' + TAppUtils.QuotD(dtRefDate.Date) +')'
      +' ORDER BY OVERDUE DESC, TRANSDATE ASC';
  if CDS <> nil then
    FreeAndNil(CDS);

  CDS := TDBUtils.OpenDataset(S, Self);
  cxGrdMain.LoadFromCDS(CDS);
  cxGrdMain.SetVisibleColumns(['PURCHASEINVOICE_ID','HEADERREMAIN'],False);
  cxGrdMain.SetSummaryByColumns(['REMAIN']);
end;

procedure TfrmLapHutang.cxGrdMainStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  iIndex: Integer;
begin
  inherited;
  if ARecord = nil then exit;
  if cxGrdMain.GetColumnByFieldName('OverDue') = nil then exit;
  iIndex := cxGrdMain.GetColumnByFieldName('OverDue').Index;
  if VarToInt(ARecord.Values[iIndex]) > 0
  then
    AStyle := styleRed;
end;

end.
