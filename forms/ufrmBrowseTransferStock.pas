unit ufrmBrowseTransferStock;

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
  cxGridTableView, cxGridDBTableView, cxGrid, ufrmDefaultServerBrowse,
  cxGridServerModeTableView;

type
  TfrmBrowseTransferStock = class(TfrmDefaultServerBrowse)
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
  frmBrowseTransferStock: TfrmBrowseTransferStock;

implementation

uses
  uAppUtils, uDXUtils, uDBUtils, uTransDetail, ufrmTransferStock,
  System.DateUtils;

{$R *.dfm}

procedure TfrmBrowseTransferStock.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmTransferStock.Create(Application) do
  begin
    Try
      if ShowModalDlg = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseTransferStock.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmTransferStock.Create(Application) do
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

procedure TfrmBrowseTransferStock.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;

  with TTransferStock.Create do
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

procedure TfrmBrowseTransferStock.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmTransferStock.Create(Application) do
  begin
    LoadByID(Self.cxGrdMain.GetID, True);
    Try
      ShowModalDlg;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseTransferStock.FormCreate(Sender: TObject);
begin
//  StartDate.Date := StartOfTheMonth(Now());
//  EndDate.Date := EndOfTheMonth(Now());
  inherited;
end;

function TfrmBrowseTransferStock.GetGroupName: string;
begin
  Result := 'Inventory';
end;

function TfrmBrowseTransferStock.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseTransferStock.GetSQL: string;
begin
  Result := 'SELECT A.ID, A.REFNO, A.TRANSDATE, B.NAMA AS GUDANG_ASAL, C.NAMA AS GUDANG_TUJUAN,'
           +' A.NOTES, A.CLOSED, A.MODIFIEDDATE, A.MODIFIEDBY'
           +' FROM TTRANSFERSTOCK A'
           +' INNER JOIN TWAREHOUSE B ON A.WH_ASAL_ID = B.ID'
           +' INNER JOIN TWAREHOUSE C ON A.WH_TUJUAN_ID = C.ID'
           +' WHERE A.TRANSDATE BETWEEN ' + TAppUtils.QuotD(StartDate.Date)
           +' AND ' + TAppUtils.QuotD(EndDate.Date);

end;

end.
