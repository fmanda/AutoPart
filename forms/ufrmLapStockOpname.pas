unit ufrmLapStockOpname;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxClasses, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox, Datasnap.DBClient,
  dxBarBuiltInMenu, cxPC, cxCustomPivotGrid, cxDBPivotGrid;

type
  TfrmLapStockOpname = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel3: TcxLabel;
    dtStart: TcxDateEdit;
    cxLabel1: TcxLabel;
    dtEnd: TcxDateEdit;
    pgcMain: TcxPageControl;
    tsDetail: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrdPivot: TcxDBPivotGrid;
    procedure btnExportClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCDS: TClientDataset;
    property CDS: TClientDataset read FCDS write FCDS;
    { Private declarations }
  public
    function GetGroupName: string; override;
    { Public declarations }
  end;

var
  frmLapStockOpname: TfrmLapStockOpname;

implementation

uses
  uDXUtils, uDBUtils, uAppUtils, System.DateUtils;

{$R *.dfm}

procedure TfrmLapStockOpname.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmLapStockOpname.btnRefreshClick(Sender: TObject);
var
  S: string;
begin
  inherited;
  S := 'SELECT A.REFNO, E.NAMA AS GUDANG, A.TRANSDATE, C.KODE, C.NAMA, D.UOM,'
      +' B.QTY AS QTYFISIK, B.QTYSYS AS QTYSYTEM, B.VARIANT AS QTYSELISIH,'
      +' (B.QTY * B.HARGAAVG) AS NILAIFISIK, (B.QTYSYS * B.HARGAAVG) AS NILAISYSTEM,'
      +' (B.VARIANT * B.HARGAAVG) AS NILAISELISIH'
      +' from TSTOCKOPNAME a'
      +' INNER JOIN TSTOCKOPNAMEITEM b on a.id = b.STOCKOPNAME_ID'
      +' INNER JOIN TITEM C ON B.ITEM_ID = C.ID'
      +' INNER JOIN TUOM D ON B.UOM_ID = D.ID'
      +' INNER JOIN TWAREHOUSE E ON A.WAREHOUSE_ID = E.ID'
      +' WHERE A.TRANSDATE BETWEEN ' + TAppUtils.QuotD(dtStart.Date)
      +' and ' + TAppUtils.QuotD(dtEnd.Date);

  if FCDS <> nil then
    FreeAndNil(FCDS);

  FCDS := TDBUtils.OpenDataset(S, Self);
  cxGrdMain.LoadFromCDS(CDS);
  cxGrdMain.EnableFiltering();
  cxGrdMain.SetSummaryByColumns(['QTYFISIK','QTYSYSTEM','QTYSELISIH','NILAIFISIK','NILAISYSTEM','NILAISELISIH']);
  cxGrdPivot.LoadFromCDS(CDS, True, False);
  cxGrdPivot.SetDataColumns(['QTYSELISIH','NILAISELISIH']);
  cxGrdPivot.SetRowColumns(['REFNO','GUDANG']);
  cxGrdPivot.GetFieldByName('REFNO').ExpandAll;
end;

procedure TfrmLapStockOpname.FormCreate(Sender: TObject);
begin
  inherited;
  dtStart.Date := StartOfTheMonth(Now());
  dtEnd.Date := EndOfTheMonth(Now());
  pgcMain.ActivePage := tsDetail;
end;

function TfrmLapStockOpname.GetGroupName: string;
begin
  Result := 'Inventory';
end;

end.
