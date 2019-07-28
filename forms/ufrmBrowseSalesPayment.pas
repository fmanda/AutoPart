unit ufrmBrowseSalesPayment;

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
  cxGridServerModeTableView, cxGrid, cxCheckBox;

type
  TfrmBrowseSalesPayment = class(TfrmDefaultServerBrowse)
    chkFrontEnd: TcxCheckBox;
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
  frmBrowseSalesPayment: TfrmBrowseSalesPayment;

implementation

uses
  ufrmSalesPayment, uAppUtils, uDXUtils, uFinancialTransaction,
  System.DateUtils, uDBUtils;

{$R *.dfm}

procedure TfrmBrowseSalesPayment.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmSalesPayment.Create(Application) do
  begin
    Try
      if ShowModalDlg = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseSalesPayment.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmSalesPayment.Create(Application) do
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

procedure TfrmBrowseSalesPayment.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;

  with TSalesPayment.Create do
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

procedure TfrmBrowseSalesPayment.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmSalesPayment.Create(Application) do
  begin
    LoadByID(Self.cxGrdMain.GetID, True);
    Try
      ShowModalDlg;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseSalesPayment.cxGrdMainStylesGetContentStyle(Sender:
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

procedure TfrmBrowseSalesPayment.FormCreate(Sender: TObject);
begin
//  StartDate.Date := StartOfTheMonth(Now());
//  EndDate.Date := EndOfTheMonth(Now());
  inherited;
end;

function TfrmBrowseSalesPayment.GetGroupName: string;
begin
  Result := 'Hutang & Piutang';
end;

function TfrmBrowseSalesPayment.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseSalesPayment.GetSQL: string;
begin
  Result := 'SELECT A.ID, A.REFNO, A.TRANSDATE, A.NOTES,'
           +' B.NAMA AS SALESMAN, C.NAMA AS REKENING, A.AMOUNT, A.RETURAMOUNT,'
           +' CASE WHEN A.MEDIA=1 THEN ''TRANSFER'' WHEN A.MEDIA = 2 THEN ''BG/CEK'' ELSE ''TUNAI'' END AS MEDIA,'
           +' A.MEDIANO, A.DUEDATE'
           +' FROM TSALESPAYMENT A'
           +' LEFT JOIN TSALESMAN B ON A.SALESMAN_ID = B.ID'
           +' LEFT JOIN TREKENING C ON A.REKENING_ID = C.ID'
           +' WHERE A.TRANSDATE BETWEEN ' + TAppUtils.QuotD(StartDate.Date)
           +' AND ' + TAppUtils.QuotD(EndDate.Date);

  if not chkFrontEnd.Checked then
    Result := Result + ' AND (A.REFNO NOT LIKE ''%FK%'' AND  A.REFNO NOT LIKE ''%FT%'')';

end;

end.
