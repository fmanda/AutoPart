unit ufrmBrowseCashPayment;

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
  TfrmBrowseCashPayment = class(TfrmDefaultServerBrowse)
    procedure btnBaruClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnLihatClick(Sender: TObject);
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
  frmBrowseCashPayment: TfrmBrowseCashPayment;

implementation

uses
  uAppUtils, uDXUtils, Dateutils, ufrmCashPayment, uFinancialTransaction,
  uDBUtils;

{$R *.dfm}

procedure TfrmBrowseCashPayment.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmCashPayment.Create(Application) do
  begin
    Try
      if ShowModalDlg = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseCashPayment.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmCashPayment.Create(Application) do
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

procedure TfrmBrowseCashPayment.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;

  with TCashPayment.Create do
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

procedure TfrmBrowseCashPayment.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmCashPayment.Create(Application) do
  begin
    LoadByID(Self.cxGrdMain.GetID, True);
    Try
      ShowModalDlg;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseCashPayment.FormCreate(Sender: TObject);
begin
  StartDate.Date := (Now());
  EndDate.Date := (Now());
  inherited;
end;

function TfrmBrowseCashPayment.GetGroupName: string;
begin
  Result := 'Penjualan & Kas';
end;

function TfrmBrowseCashPayment.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseCashPayment.GetSQL: string;
begin
  Result := 'SELECT A.ID, A.REFNO, A.TRANSDATE, B.NAMA AS REKENING_ASAL, A.AMOUNT, A.NOTES, A.MODIFIEDDATE, A.MODIFIEDBY'
           +' FROM TCASHPAYMENT A'
           +' LEFT JOIN TREKENING B ON A.REKENING_ID = B.ID'
           +' WHERE ISNULL(A.TAHUNZAKAT,0) = 0 AND A.TRANSDATE BETWEEN ' + TAppUtils.QuotD(StartDate.Date)
           +' AND ' + TAppUtils.QuotD(EndDate.Date);

end;

end.
