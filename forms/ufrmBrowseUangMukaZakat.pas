unit ufrmBrowseUangMukaZakat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultBrowse, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxContainer, Vcl.Menus, Vcl.ComCtrls, dxCore, cxDateUtils, cxClasses, cxLabel,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.StdCtrls, cxButtons,
  cxGroupBox, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, uAppUtils, uFinancialTransaction,
  ufrmUangMukaZakat, uDXUtils, uDBUtils, ufrmDefaultServerBrowse,
  cxGridServerModeTableView;

type
  TfrmBrowseUangMukaZakat = class(TfrmDefaultServerBrowse)
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
  frmBrowseUangMukaZakat: TfrmBrowseUangMukaZakat;

implementation

uses
  System.DateUtils;

{$R *.dfm}

procedure TfrmBrowseUangMukaZakat.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmUangMukaZakat.Create(Application) do
  begin
    Try
      if ShowModalDlg = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseUangMukaZakat.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmUangMukaZakat.Create(Application) do
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

procedure TfrmBrowseUangMukaZakat.btnHapusClick(Sender: TObject);
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

procedure TfrmBrowseUangMukaZakat.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmUangMukaZakat.Create(Application) do
  begin
    LoadByID(Self.cxGrdMain.GetID, True);
    Try
      ShowModalDlg;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseUangMukaZakat.FormCreate(Sender: TObject);
begin
//  inherited;
  lblTitle.Caption  := Self.Caption;
  StartDate.Date    := StartOfTheYear(Now());
  EndDate.Date      := EndOfTheYear(Now());
  RefreshData;
end;

function TfrmBrowseUangMukaZakat.GetGroupName: string;
begin
  Result := 'Penjualan & Kas';
end;

function TfrmBrowseUangMukaZakat.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseUangMukaZakat.GetSQL: string;
begin
  Result := 'SELECT A.ID, A.REFNO, A.TAHUNZAKAT, A.TRANSDATE, B.NAMA AS REKENING_ASAL, A.AMOUNT, A.NOTES, A.MODIFIEDDATE, A.MODIFIEDBY'
           +' FROM TCASHPAYMENT A'
           +' LEFT JOIN TREKENING B ON A.REKENING_ID = B.ID'
           +' WHERE ISNULL(A.TAHUNZAKAT,0) > 0 AND A.TRANSDATE BETWEEN ' + TAppUtils.QuotD(StartDate.Date)
           +' AND ' + TAppUtils.QuotD(EndDate.Date);

end;

end.
