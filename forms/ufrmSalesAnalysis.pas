unit ufrmSalesAnalysis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox,
  System.DateUtils, dxBarBuiltInMenu, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxPivotGridChartConnection, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxGridChartView, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGrid, cxCustomPivotGrid, cxDBPivotGrid, cxPC, Datasnap.DBClient,
  cxGridDBChartView;

type
  TfrmSalesAnalysis = class(TfrmDefaultReport)
    pgcMain: TcxPageControl;
    tsPivot: TcxTabSheet;
    tsChart: TcxTabSheet;
    tsRaw: TcxTabSheet;
    cxGrdPivot: TcxDBPivotGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid2: TcxGrid;
    cxGrdRaw: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxChart: TcxGridChartView;
    cxGroupBox3: TcxGroupBox;
    cxLabel3: TcxLabel;
    dtStart: TcxDateEdit;
    dtEnd: TcxDateEdit;
    cxLabel5: TcxLabel;
    cxGrid1DBChartView1: TcxGridDBChartView;
    cxPivotGridChartConnection1: TcxPivotGridChartConnection;
    cbTemplate: TcxComboBox;
    cxLabel1: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure cxPivotGridChartConnection1GetDataCells(Sender:
        TcxPivotGridChartConnection; ACol, ARow: Integer; ACell:
        TcxPivotGridCrossCellSummary; var AUseInCalculations: Boolean);
    procedure cbTemplatePropertiesEditValueChanged(Sender: TObject);
  private
    CDS: TClientDataset;
    procedure SetPivotTemplate;
    { Private declarations }
  public
    procedure RefreshData;
    { Public declarations }
  end;

var
  frmSalesAnalysis: TfrmSalesAnalysis;

implementation

uses
  uDXUtils, uDButils, uAppUtils;

{$R *.dfm}

procedure TfrmSalesAnalysis.btnExportClick(Sender: TObject);
begin
  inherited;
  if pgcMain.ActivePage = tsRaw then
    cxGrdRaw.ExportToXLS()
  else if pgcMain.ActivePage = tsPivot then
    cxGrdPivot.ExportToXLS();
end;

procedure TfrmSalesAnalysis.btnRefreshClick(Sender: TObject);
begin
  inherited;
  RefreshData;
//  SetPivotTemplate;
end;

procedure TfrmSalesAnalysis.cbTemplatePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  SetPivotTemplate;
end;

procedure TfrmSalesAnalysis.cxPivotGridChartConnection1GetDataCells(Sender:
    TcxPivotGridChartConnection; ACol, ARow: Integer; ACell:
    TcxPivotGridCrossCellSummary; var AUseInCalculations: Boolean);
begin
  inherited;
//  if ARow < cxGrdPivot.DataController.RecordCount-1 then
  Try
    AUseInCalculations := cxGrdPivot.ViewData.Rows[Arow].GetDisplayText <> 'Grand Total';
  except
  End;
//  AUseInCalculations := ARow <= cxGrdPivot.DataController.RecordCount-1; //True
//  else
//    AUseInCalculations := False;
end;

procedure TfrmSalesAnalysis.FormCreate(Sender: TObject);
begin
  inherited;
  dtStart.Date  := StartOfTheYear(Now());
  dtEnd.Date    := EndOfTheMonth(Now());
  pgcMain.ActivePage := tsPivot;
end;

procedure TfrmSalesAnalysis.RefreshData;
var
  s: string;
begin
  if CDS <> nil then
    FreeAndNil(CDS);

  s := 'SELECT * FROM FN_SALES_BYPERIOD('  + TAppUtils.QuotD(dtStart.Date)
      +', '+ TAppUtils.QuotD(dtEnd.Date)  +')';

  CDS := TDBUtils.OpenDataset(S, Self);
  cxGrdPivot.LoadFromCDS(CDS, True, False);
  cxGrdRaw.LoadFromCDS(CDS);
end;

procedure TfrmSalesAnalysis.SetPivotTemplate;
begin
  cxGrdPivot.ResetColumns;
  cxGrdPivot.SetDataColumns(['NetSales','GrossProfit']);

  case cbTemplate.ItemIndex of
    0 :
    begin
      cxGrdPivot.SetRowColumns(['Jenis']);
    end;
    1 :
    begin
      cxGrdPivot.SetRowColumns(['MonthPeriod']);
    end;
    2:
    begin
      cxGrdPivot.SetRowColumns(['Salesman']);
    end;
    3:
    begin
      cxGrdPivot.SetRowColumns(['ItemName']);
    end;
    4:
    begin
      cxGrdPivot.SetRowColumns(['Customer']);
    end;
  end;

end;

end.
