unit ufrmBrowseCashReceipt;

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
  TfrmBrowseCashReceipt = class(TfrmDefaultServerBrowse)
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
    { Public declarations }
  end;

var
  frmBrowseCashReceipt: TfrmBrowseCashReceipt;

implementation

uses
  uAppUtils, ufrmCashReceipt, uDXUtils, System.DateUtils, uFinancialTransaction;

{$R *.dfm}

procedure TfrmBrowseCashReceipt.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmCashReceipt.Create(Application) do
  begin
    Try
      if ShowModal = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseCashReceipt.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmCashReceipt.Create(Application) do
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

procedure TfrmBrowseCashReceipt.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;

  with TCashReceipt.Create do
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

procedure TfrmBrowseCashReceipt.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmCashReceipt.Create(Application) do
  begin
    LoadByID(Self.cxGrdMain.GetID, True);
    Try
      ShowModal;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseCashReceipt.FormCreate(Sender: TObject);
begin
  StartDate.Date := StartOfTheMonth(Now());
  EndDate.Date := EndOfTheMonth(Now());
  inherited;
end;

function TfrmBrowseCashReceipt.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseCashReceipt.GetSQL: string;
begin
  Result := 'SELECT A.ID, A.REFNO, A.TRANSDATE, B.NAMA AS REKENING_ASAL, A.AMOUNT, A.NOTES, A.MODIFIEDDATE, A.MODIFIEDBY'
           +' FROM TCASHRECEIPT A'
           +' LEFT JOIN TREKENING B ON A.REKENING_ID = B.ID'
           +' WHERE A.TRANSDATE BETWEEN ' + TAppUtils.QuotD(StartDate.Date)
           +' AND ' + TAppUtils.QuotD(EndDate.Date);

end;

end.
