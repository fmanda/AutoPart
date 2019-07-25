unit ufrmBrowseStockOpname;

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
  TfrmBrowseStockOpname = class(TfrmDefaultServerBrowse)
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
  frmBrowseStockOpname: TfrmBrowseStockOpname;

implementation

uses
  ufrmStockOpname, uDXUtils, uAppUtils, uDBUtils, uTransDetail, Dateutils;

{$R *.dfm}

procedure TfrmBrowseStockOpname.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmStockOpname.Create(Application) do
  begin
    Try
      if ShowModal = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseStockOpname.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmStockOpname.Create(Application) do
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

procedure TfrmBrowseStockOpname.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;

  with TStockOpname.Create do
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

procedure TfrmBrowseStockOpname.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmStockOpname.Create(Application) do
  begin
    LoadByID(Self.cxGrdMain.GetID, True);
    Try
      ShowModal;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseStockOpname.FormCreate(Sender: TObject);
begin
  StartDate.Date := StartOfTheMonth(Now());
  EndDate.Date := EndOfTheMonth(Now());
  inherited;
end;

function TfrmBrowseStockOpname.GetGroupName: string;
begin
  Result := 'Inventory';
end;

function TfrmBrowseStockOpname.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseStockOpname.GetSQL: string;
begin
  Result := 'SELECT A.ID, A.REFNO, A.TRANSDATE, B.NAMA AS GUDANG, A.NOTES, A.CLOSED,'
           +' CASE WHEN A.TRANSTYPE = 1 THEN ''FULL'' ELSE ''PARSIAL'' END AS JENIS,'
           +' A.MODIFIEDDATE, A.MODIFIEDBY'
           +' FROM TSTOCKOPNAME A'
           +' INNER JOIN TWAREHOUSE B ON A.WAREHOUSE_ID =B.ID'
           +' WHERE A.TRANSDATE BETWEEN ' + TAppUtils.QuotD(StartDate.Date)
           +' AND ' + TAppUtils.QuotD(EndDate.Date);

end;

end.
