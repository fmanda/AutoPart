unit ufrmBrowseItem;

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
  cxGridServerModeTableView, cxGrid, uDXUtils, cxMemo;

type
  TfrmBrowseItem = class(TfrmDefaultServerBrowse)
    styleNonActive: TcxStyle;
    btnStock: TcxButton;
    cxMemo1: TcxMemo;
    procedure btnBaruClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnLihatClick(Sender: TObject);
    procedure cxGrdMainStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure btnHapusClick(Sender: TObject);
    procedure btnStockClick(Sender: TObject);
    procedure cxGrdMainCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo:
        TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
        var AHandled: Boolean);
    procedure cxGrdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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
  frmBrowseItem: TfrmBrowseItem;

implementation

uses
  ufrmItem, uDBUtils, uAppUtils, uItem, ufrmCXMsgInfo, Datasnap.DBClient;

{$R *.dfm}

procedure TfrmBrowseItem.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmItem.Create(Application) do
  begin
    Try
      if ShowModalDlg = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseItem.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmItem.Create(Application) do
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

procedure TfrmBrowseItem.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;

  with TItem.Create do
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

procedure TfrmBrowseItem.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmItem.Create(Application) do
  begin
    LoadByID(cxGrdMain.GetID, True);
    Try
      ShowModalDlg;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseItem.btnStockClick(Sender: TObject);
var
  lCDS: TClientDataset;
  S: string;
begin
  inherited;
  S := 'SELECT * FROM FN_VIEW_STOCKBYITEM('+ IntToStr(cxGrdMain.GetID) +',GETDATE())';

  lCDS := TDBUtils.OpenDataset(S, Self);
  Try
    TfrmCXMsgInfo.ShowSimpleMsg('Stock Gudang', lCDS, []);
  Finally
    lCDS.Free;
  End;
end;

procedure TfrmBrowseItem.cxGrdMainCellDblClick(Sender: TcxCustomGridTableView;
    ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
    TShiftState; var AHandled: Boolean);
begin
//  inherited;
  btnStock.Click;
end;

procedure TfrmBrowseItem.cxGrdMainKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if (cxGrdMain.Controller.FocusedRecord is TcxGridFilterRow ) then exit;
  if (Key = VK_Return) then
  begin
    btnStock.Click;
  end;
end;

procedure TfrmBrowseItem.cxGrdMainStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
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

function TfrmBrowseItem.GetGroupName: string;
begin
  Result := 'Master Data';
end;

function TfrmBrowseItem.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseItem.GetSQL: string;
begin
  Result := 'SELECT * FROM V_ITEM';
end;

end.
