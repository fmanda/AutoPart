unit ufrmBrowseStockAdjustment;

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
  cxGridServerModeTableView, cxGrid, System.DateUtils, ufrmStockAdjustment;

type
  TfrmBrowseStockAdjustment = class(TfrmDefaultServerBrowse)
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
  frmBrowseStockAdjustment: TfrmBrowseStockAdjustment;

implementation

uses
  uAppUtils, uDXUtils, uTransDetail, uDBUtils;

{$R *.dfm}

procedure TfrmBrowseStockAdjustment.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmStockAdjustment.Create(Application) do
  begin
    Try
      if ShowModalDlg = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseStockAdjustment.btnEditClick(Sender: TObject);
begin
  inherited;
//  with TfrmStockAdjustment.Create(Application) do
//  begin
//    LoadByID(Self.cxGrdMain.GetID, False);
//    Try
//      if ShowModal = mrOK then
//        RefreshData;
//    Finally
//      Free;
//    End;
//  end;
end;

procedure TfrmBrowseStockAdjustment.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;

  with TStockAdjustment.Create do
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

procedure TfrmBrowseStockAdjustment.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmStockAdjustment.Create(Application) do
  begin
    LoadByID(Self.cxGrdMain.GetID, True);
    Try
      ShowModalDlg;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseStockAdjustment.FormCreate(Sender: TObject);
begin
  StartDate.Date := StartOfTheMonth(Now());
  EndDate.Date := EndOfTheMonth(Now());
  inherited;
end;

function TfrmBrowseStockAdjustment.GetGroupName: string;
begin
  Result := 'Inventory';
end;

function TfrmBrowseStockAdjustment.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseStockAdjustment.GetSQL: string;
begin
  Result := 'SELECT A.ID, A.REFNO, A.TRANSDATE, B.NAMA AS GUDANG, A.NOTES, A.CLOSED,'
           +' A.MODIFIEDDATE, A.MODIFIEDBY'
           +' FROM TSTOCKADJUSTMENT A'
           +' INNER JOIN TWAREHOUSE B ON A.WAREHOUSE_ID =B.ID'
           +' WHERE A.TRANSDATE BETWEEN ' + TAppUtils.QuotD(StartDate.Date)
           +' AND ' + TAppUtils.QuotD(EndDate.Date);

end;

end.
