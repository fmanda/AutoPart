unit ufrmBrowseSalesRetur;

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
  TfrmBrowseSalesRetur = class(TfrmDefaultServerBrowse)
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
    { Public declarations }
  end;

var
  frmBrowseSalesRetur: TfrmBrowseSalesRetur;

implementation

uses
  uDBUtils, uDXUtils, Dateutils, uAppUtils, uTransDetail, ufrmSalesRetur;

{$R *.dfm}

procedure TfrmBrowseSalesRetur.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmSalesRetur.Create(Application) do
  begin
    Try
      if ShowModal = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseSalesRetur.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmSalesRetur.Create(Application) do
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

procedure TfrmBrowseSalesRetur.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;

  with TSalesRetur.Create do
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

procedure TfrmBrowseSalesRetur.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmSalesRetur.Create(Application) do
  begin
    LoadByID(Self.cxGrdMain.GetID, True);
    Try
      ShowModal;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseSalesRetur.cxGrdMainStylesGetContentStyle(Sender:
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

procedure TfrmBrowseSalesRetur.FormCreate(Sender: TObject);
begin
  StartDate.Date := StartOfTheMonth(Now());
  EndDate.Date := EndOfTheMonth(Now());
  inherited;
end;

function TfrmBrowseSalesRetur.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseSalesRetur.GetSQL: string;
begin
  Result := 'SELECT A.ID, A.REFNO AS NO_RETUR, A.TRANSDATE, B.NAMA AS CUSTOMER, D.INVOICENO AS NO_FAKTUR,'
           +' CASE WHEN A.RETURFLAG = 1 THEN ''PEMBATALAN'' ELSE ''RETUR'' END AS JENIS_RETUR,'
           +' A.SUBTOTAL, A.PPN, A.AMOUNT AS TOTAL, C.NAMA AS GUDANG,'
           +' A.STATUS, A.CLOSED, A.MODIFIEDBY, A.MODIFIEDDATE'
           +' FROM TSALESRETUR A'
           +' INNER JOIN TCUSTOMER B ON A.CUSTOMER_ID = B.ID'
           +' LEFT JOIN TWAREHOUSE C ON A.WAREHOUSE_ID = C.ID'
           +' LEFT JOIN TSALESINVOICE D ON A.INVOICE_ID = D.ID'
           +' WHERE A.TRANSDATE BETWEEN ' + TAppUtils.QuotD(StartDate.Date)
           +' AND ' + TAppUtils.QuotD(EndDate.Date);

end;

end.
