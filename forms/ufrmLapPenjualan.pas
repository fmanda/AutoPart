unit ufrmLapPenjualan;

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
  cxGridDBTableView, cxGrid, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Datasnap.DBClient;

type
  TfrmLapPenjualan = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel3: TcxLabel;
    dtStart: TcxDateEdit;
    cxLabel1: TcxLabel;
    dtEnd: TcxDateEdit;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
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
  frmLapPenjualan: TfrmLapPenjualan;

implementation

uses
  uAppUtils, uDBUtils, uDXUtils, System.DateUtils;

{$R *.dfm}

procedure TfrmLapPenjualan.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmLapPenjualan.btnRefreshClick(Sender: TObject);
var
  S: string;
begin
  inherited;
  S := 'SELECT A.INVOICENO, A.TRANSDATE, A.DUEDATE, B.NAMA AS CUSTOMER, E.KODE AS KODEITEM,'
      +' E.NAMA AS NAMAITEM, H.NAMA AS SALESMAN, F.UOM, ABS(D.QTY) AS QTY, D.HARGA, D.DISCOUNT,'
      +' (ABS(D.QTY)*(D.HARGA-D.DISCOUNT)) AS SUBTOTAL, G.NAMA AS GUDANG'
      +' FROM TSALESINVOICE A'
      +' INNER JOIN TCUSTOMER B ON A.CUSTOMER_ID = B.ID'
      +' INNER JOIN TWAREHOUSE C ON A.WAREHOUSE_ID = C.ID'
      +' INNER JOIN TTRANSDETAIL D ON A.ID = D.HEADER_ID AND D.HEADER_FLAG = 200'
      +' INNER JOIN TITEM E ON D.ITEM_ID = E.ID'
      +' INNER JOIN TUOM F ON D.UOM_ID = F.ID'
      +' INNER JOIN TWAREHOUSE G ON D.WAREHOUSE_ID = G.ID'
      +' LEFT JOIN TSALESMAN H ON H.ID = A.SALESMAN_ID'
      +' WHERE A.TRANSDATE BETWEEN ' + TAppUtils.QuotD(dtStart.Date)
      +' and ' + TAppUtils.QuotD(dtEnd.Date)
      +' ORDER BY A.ID, D.ID';

  if FCDS <> nil then
    FreeAndNil(FCDS);

  FCDS := TDBUtils.OpenDataset(S, Self);
  cxGrdMain.LoadFromCDS(CDS);
  cxGrdMain.EnableFiltering();
end;

procedure TfrmLapPenjualan.FormCreate(Sender: TObject);
begin
  inherited;
  dtStart.Date := StartOfTheMonth(Now());
  dtEnd.Date := EndOfTheMonth(Now());
end;

function TfrmLapPenjualan.GetGroupName: string;
begin
  Result := 'Penjualan & Kas';
end;

end.
