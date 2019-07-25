unit ufrmBrowseService;

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
  TfrmBrowseService = class(TfrmDefaultServerBrowse)
    styleNonActive: TcxStyle;
    procedure btnBaruClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnLihatClick(Sender: TObject);
    procedure cxGrdMainStylesGetContentStyle(Sender: TcxCustomGridTableView;
        ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem; var AStyle:
        TcxStyle);
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
  frmBrowseService: TfrmBrowseService;

implementation

uses
  ufrmService, uAppUtils, uDXUtils, uDBUtils, uItem;

{$R *.dfm}

procedure TfrmBrowseService.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmService.Create(Application) do
  begin
    Try
      if ShowModalDlg = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseService.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmService.Create(Application) do
  begin
    LoadByID(cxGrdMain.GetID, False);
    Try
      if ShowModalDlg = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseService.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;

  with TService.Create do
  begin
    if LoadByID(cxGrdMain.GetID) then
      if DeleteFromDB then
      begin
        TAppUtils.Information('Berhasil menghapus data');
        RefreshData;
      end;
    Free;
  end;
end;

procedure TfrmBrowseService.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmService.Create(Application) do
  begin
    LoadByID(cxGrdMain.GetID, True);
    Try
      ShowModalDlg;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseService.cxGrdMainStylesGetContentStyle(Sender:
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
    AStyle := styleNonActive;

end;

function TfrmBrowseService.GetGroupName: string;
begin
  Result := 'Master Data';
end;

function TfrmBrowseService.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseService.GetSQL: string;
begin
  Result := 'SELECT A.ID, A.KODE, A.NAMA, B.UOM, A.BIAYA, A.PPN, A.ISACTIVE, A.MODIFIEDDATE, A.MODIFIEDBY'
           +' FROM TSERVICE A'
           +' LEFT JOIN TUOM B ON A.UOM_ID = B.ID';
end;

end.
