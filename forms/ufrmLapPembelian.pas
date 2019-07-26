unit ufrmLapPembelian;

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
  cxGridDBTableView, cxGrid, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfrmLapPembelian = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel3: TcxLabel;
    dtStart: TcxDateEdit;
    cxLabel1: TcxLabel;
    dtEnd: TcxDateEdit;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function GetGroupName: string; dynamic;
    { Public declarations }
  end;

var
  frmLapPembelian: TfrmLapPembelian;

implementation

uses
  uDXUtils, uDBUtils, uAppUtils, System.DateUtils;

{$R *.dfm}

procedure TfrmLapPembelian.FormCreate(Sender: TObject);
begin
  inherited;
  dtStart.Date := StartOfTheMonth(Now());
  dtEnd.Date := EndOfTheMonth(Now());
end;

function TfrmLapPembelian.GetGroupName: string;
begin
  Result := 'Inventory';
end;

end.


//SELECT A.INVOICENO, A.REFERENSI, A.TRANSDATE, A.DUEDATE,
//B.NAMA AS SUPPLIER, C.NAMA AS GUDANG, A.AMOUNT AS TOTAL
//FROM TPURCHASEINVOICE A
//INNER JOIN TSUPPLIER B ON A.SUPPLIER_ID = B.ID
//INNER JOIN TWAREHOUSE C ON A.WAREHOUSE_ID = C.ID
//
//
//
//SELECT A.INVOICENO, A.REFERENSI, A.TRANSDATE, A.DUEDATE,
//B.NAMA AS SUPPLIER, G.NAMA AS GUDANG, E.KODE AS KODEITEM,
//E.NAMA AS NAMAITEM, F.UOM, D.QTY, D.HARGA, D.DISCOUNT,
//(D.QTY*(D.HARGA-D.DISCOUNT)) AS SUBTOTAL
//FROM TPURCHASEINVOICE A
//INNER JOIN TSUPPLIER B ON A.SUPPLIER_ID = B.ID
//INNER JOIN TWAREHOUSE C ON A.WAREHOUSE_ID = C.ID
//INNER JOIN TTRANSDETAIL D ON A.ID = D.HEADER_ID AND D.HEADER_FLAG = 100
//INNER JOIN TITEM E ON D.ITEM_ID = E.ID
//INNER JOIN TUOM F ON D.UOM_ID = F.ID
//INNER JOIN TWAREHOUSE G ON D.WAREHOUSE_ID = G.ID
