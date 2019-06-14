unit ufrmBrowsePurchaseInvoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultServerBrowse, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxContainer,
  Vcl.Menus, Vcl.ComCtrls, dxCore, cxDateUtils, cxClasses, cxLabel, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.StdCtrls, cxButtons, cxGroupBox,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridServerModeTableView, cxGrid;

type
  TfrmBrowsePurchaseInvoice = class(TfrmDefaultServerBrowse)
    procedure FormCreate(Sender: TObject);
    procedure btnBaruClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnLihatClick(Sender: TObject);
    procedure cxGrdMainStylesGetContentStyle(Sender: TcxCustomGridTableView;
        ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle:
        TcxStyle);
  private
    { Private declarations }
  protected
    function GetKeyField: string; override;
    function GetSQL: string; override;
  public
    { Public declarations }
  end;

var
  frmBrowsePurchaseInvoice: TfrmBrowsePurchaseInvoice;

implementation

uses
  uAppUtils, uDBUtils, uTransDetail, uDXUtils, System.DateUtils,
  ufrmPurchaseInvoice;

{$R *.dfm}

procedure TfrmBrowsePurchaseInvoice.FormCreate(Sender: TObject);
begin
  StartDate.Date := StartOfTheMonth(Now());
  EndDate.Date := EndOfTheMonth(Now());
  inherited;
end;

procedure TfrmBrowsePurchaseInvoice.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmPurchaseInvoice.Create(Application) do
  begin
    Try
      if ShowModal = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowsePurchaseInvoice.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmPurchaseInvoice.Create(Application) do
  begin
    LoadByID(Self.cxGrdMain.GetID, False);
    Try
      if ShowModal = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowsePurchaseInvoice.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;

  with TPurchaseInvoice.Create do
  begin
    if LoadByID(Self.cxGrdMain.GetID) then
      if DeleteFromDB then
      begin
        TAppUtils.Information('Berhasil menghapus data');
        RefreshData;
      end;
    Free;
  end;
end;

procedure TfrmBrowsePurchaseInvoice.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmPurchaseInvoice.Create(Application) do
  begin
    LoadByID(Self.cxGrdMain.GetID, True);
    Try
      ShowModal;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowsePurchaseInvoice.cxGrdMainStylesGetContentStyle(Sender:
    TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem:
    TcxCustomGridTableItem; var AStyle: TcxStyle);
//var
//  iCol: Integer;
begin
  inherited;
//  if cxGrdMain.GetColumnByFieldName('IsActive') = nil then exit;
//  if ARecord = nil then exit;
//
//  iCol := cxGrdMain.GetColumnByFieldName('IsActive').Index;
//  if VarToInt(ARecord.Values[iCol]) = 0 then
//    AStyle := styleNonActive;

end;

function TfrmBrowsePurchaseInvoice.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowsePurchaseInvoice.GetSQL: string;
begin
  Result := 'SELECT A.ID, A.INVOICENO, A.TRANSDATE, B.NAMA AS SUPPLIER, A.DUEDATE,'
           +' CASE WHEN A.PAYMENTFLAG = 1 THEN ''TEMPO'' ELSE ''CASH'' END AS CARABAYAR,'
           +' A.SUBTOTAL, A.PPN, A.AMOUNT AS TOTAL, C.NAMA AS GUDANG,'
           +' A.STATUS, A.CLOSED, A.MODIFIEDBY, A.MODIFIEDDATE'
           +' FROM TPURCHASEINVOICE A'
           +' INNER JOIN TSUPPLIER B ON A.SUPPLIER_ID = B.ID'
           +' LEFT JOIN TWAREHOUSE C ON A.WAREHOUSE_ID = C.ID'
           +' WHERE TRANSDATE BETWEEN ' + TAppUtils.QuotD(StartDate.Date)
           +' AND ' + TAppUtils.QuotD(EndDate.Date);

end;

end.
