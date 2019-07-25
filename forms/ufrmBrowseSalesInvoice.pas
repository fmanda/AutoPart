unit ufrmBrowseSalesInvoice;

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
  TfrmBrowseSalesInvoice = class(TfrmDefaultServerBrowse)
    procedure btnBaruClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnLihatClick(Sender: TObject);
    procedure cxGrdMainStylesGetContentStyle(Sender: TcxCustomGridTableView;
        ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle:
        TcxStyle);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetKeyField: string; override;
    function GetSQL: string; override;
  public
    { Public declarations }
  end;

var
  frmBrowseSalesInvoice: TfrmBrowseSalesInvoice;

implementation

uses
  uDXUtils, uDBUtils, uAppUtils, ufrmSalesInvoice, System.DateUtils,
  uTransDetail, uPrintStruk;

{$R *.dfm}

procedure TfrmBrowseSalesInvoice.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmSalesInvoice.Create(Application) do
  begin
    Try
      if ShowModal = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseSalesInvoice.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmSalesInvoice.Create(Application) do
  begin
    LoadByID(Self.cxGrdMain.GetID, 0, False);
    Try
      if ShowModal = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseSalesInvoice.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;

  with TSalesInvoice.Create do
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

procedure TfrmBrowseSalesInvoice.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmSalesInvoice.Create(Application) do
  begin
    LoadByID(Self.cxGrdMain.GetID, 0, True);
    Try
      ShowModal;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseSalesInvoice.btnPrintClick(Sender: TObject);
var
  lInv: TSalesInvoice;
begin
  inherited;
  lInv := TSalesInvoice.Create;
  Try
    if lInv.LoadByID(Self.cxGrdMain.GetID) then
    begin
      if lInv.PaymentFlag = PaymentFlag_Cash then
        TPrintStruk.Print(lInv);

      if lInv.PaymentFlag = PaymentFlag_Credit then
        TSalesInvoice.PrintData(lInv.ID);

    end;
  finally
    lInv.Free;
  end;
end;

procedure TfrmBrowseSalesInvoice.cxGrdMainStylesGetContentStyle(Sender:
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

procedure TfrmBrowseSalesInvoice.FormCreate(Sender: TObject);
begin
  StartDate.Date := StartOfTheMonth(Now());
  EndDate.Date := EndOfTheMonth(Now());
  inherited;
end;

function TfrmBrowseSalesInvoice.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseSalesInvoice.GetSQL: string;
begin
  Result := 'SELECT A.ID, A.INVOICENO, A.TRANSDATE, B.NAMA AS CUSTOMER, A.DUEDATE,'
           +' CASE WHEN A.PAYMENTFLAG = 1 THEN ''TEMPO'' ELSE ''CASH'' END AS CARABAYAR,'
           +' CASE WHEN A.SALESTYPE = 1 THEN ''SALESMAN'' '
           +' ELSE ''FRONT END'' END AS JENIS,'
           +' A.SUBTOTAL, A.PPN, A.AMOUNT AS TOTAL, C.NAMA AS GUDANG,'
           +' D.NAMA AS SALESMAN, A.STATUS, A.CLOSED, A.MODIFIEDBY, A.MODIFIEDDATE'
           +' FROM TSALESINVOICE A'
           +' LEFT JOIN TCUSTOMER B ON A.CUSTOMER_ID = B.ID'
           +' LEFT JOIN TWAREHOUSE C ON A.WAREHOUSE_ID = C.ID'
           +' LEFT JOIN TSALESMAN D ON A.SALESMAN_ID = D.ID'
           +' WHERE A.TRANSDATE BETWEEN ' + TAppUtils.QuotD(StartDate.Date)
           +' AND ' + TAppUtils.QuotD(EndDate.Date);

end;

end.
