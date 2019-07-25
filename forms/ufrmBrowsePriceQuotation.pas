unit ufrmBrowsePriceQuotation;

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
  TfrmBrowsePriceQuotation = class(TfrmDefaultServerBrowse)
    styleActive: TcxStyle;
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
  frmBrowsePriceQuotation: TfrmBrowsePriceQuotation;

implementation

uses
  uDXUtils, uAppUtils, ufrmPriceQuotation, uPriceQuotation, System.DateUtils;

{$R *.dfm}

procedure TfrmBrowsePriceQuotation.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmPriceQuotation.Create(Application) do
  begin
    Try
      if ShowModalDlg = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowsePriceQuotation.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmPriceQuotation.Create(Application) do
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

procedure TfrmBrowsePriceQuotation.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;

  with TPriceQuotation.Create do
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

procedure TfrmBrowsePriceQuotation.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmPriceQuotation.Create(Application) do
  begin
    LoadByID(Self.cxGrdMain.GetID, True);
    Try
      ShowModalDlg;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowsePriceQuotation.cxGrdMainStylesGetContentStyle(Sender:
    TcxCustomGridTableView; ARecord: TcxCustomGridRecord; AItem:
    TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  iCol: Integer;
begin
  inherited;
  if cxGrdMain.GetColumnByFieldName('IsActive') = nil then exit;
  if ARecord = nil then exit;

  iCol := cxGrdMain.GetColumnByFieldName('IsActive').Index;
  if VarToInt(ARecord.Values[iCol]) = 0 then
    AStyle := styleActive;

end;

procedure TfrmBrowsePriceQuotation.FormCreate(Sender: TObject);
begin
  StartDate.Date := StartOfTheMonth(Now());
  EndDate.Date := EndOfTheMonth(Now());
  inherited;
end;

function TfrmBrowsePriceQuotation.GetGroupName: string;
begin
  Result := 'Master Data';
end;

function TfrmBrowsePriceQuotation.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowsePriceQuotation.GetSQL: string;
begin
  Result := 'SELECT * FROM TPRICEQUOTATION'
           +' WHERE TRANSDATE BETWEEN ' + TAppUtils.QuotD(StartDate.Date)
           +' AND ' + TAppUtils.QuotD(EndDate.Date);

end;

end.
