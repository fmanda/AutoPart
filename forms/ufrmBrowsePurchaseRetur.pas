unit ufrmBrowsePurchaseRetur;

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
  cxGridServerModeTableView, cxGrid, ufrmPurchaseRetur;

type
  TfrmBrowsePurchaseRetur = class(TfrmDefaultServerBrowse)
    procedure btnBaruClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnLihatClick(Sender: TObject);
    procedure cxGrdMainStylesGetContentStyle(Sender: TcxCustomGridTableView;
        ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle:
        TcxStyle);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetKeyField: string; override;
    function GetSQL: string; override;
  public
    function GetGroupName: string; override;
    { Public declarations }
  end;

var
  frmBrowsePurchaseRetur: TfrmBrowsePurchaseRetur;

implementation

uses
  uDBUtils, uDXUtils, Dateutils, uAppUtils, uTransDetail;

{$R *.dfm}

procedure TfrmBrowsePurchaseRetur.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmPurchaseRetur.Create(Application) do
  begin
    Try
      if ShowModalDlg = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowsePurchaseRetur.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmPurchaseRetur.Create(Application) do
  begin
    LoadByID(Self.cxGrdMain.GetID, False);
    Try
      if ShowModalDlg = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowsePurchaseRetur.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;

  with TPurchaseRetur.Create do
  begin
    if LoadByID(Self.cxGrdMain.GetID) then
    begin
      if not IsValidTransDate(TransDate) then exit;
      if DeleteFromDB then
      begin
        TAppUtils.Information('Berhasil menghapus data');
        RefreshData;
      end;
    end;
    Free;
  end;
end;

procedure TfrmBrowsePurchaseRetur.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmPurchaseRetur.Create(Application) do
  begin
    LoadByID(Self.cxGrdMain.GetID, True);
    Try
      ShowModalDlg;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowsePurchaseRetur.cxGrdMainStylesGetContentStyle(Sender:
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

procedure TfrmBrowsePurchaseRetur.FormCreate(Sender: TObject);
begin
  StartDate.Date := StartOfTheMonth(Now());
  EndDate.Date := EndOfTheMonth(Now());
  inherited;
end;

function TfrmBrowsePurchaseRetur.GetGroupName: string;
begin
  Result := 'Inventory';
end;

function TfrmBrowsePurchaseRetur.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowsePurchaseRetur.GetSQL: string;
begin
  Result := 'SELECT A.ID, A.REFNO AS NO_RETUR, A.TRANSDATE, B.NAMA AS SUPPLIER, D.INVOICENO AS NO_FAKTUR,'
           +' CASE WHEN A.RETURFLAG = 1 THEN ''PEMBATALAN'' ELSE ''RETUR'' END AS JENIS_RETUR,'
           +' A.SUBTOTAL, A.PPN, A.AMOUNT AS TOTAL, C.NAMA AS GUDANG,'
           +' A.STATUS, A.CLOSED, A.MODIFIEDBY, A.MODIFIEDDATE'
           +' FROM TPURCHASERETUR A'
           +' INNER JOIN TSUPPLIER B ON A.SUPPLIER_ID = B.ID'
           +' LEFT JOIN TWAREHOUSE C ON A.WAREHOUSE_ID = C.ID'
           +' LEFT JOIN TPURCHASEINVOICE D ON A.INVOICE_ID = D.ID'
           +' WHERE A.TRANSDATE BETWEEN ' + TAppUtils.QuotD(StartDate.Date)
           +' AND ' + TAppUtils.QuotD(EndDate.Date);

end;

end.
