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
  cxGridServerModeTableView, cxGrid, uDXUtils, cxMemo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmBrowseItem = class(TfrmDefaultServerBrowse)
    styleNonActive: TcxStyle;
    btnStock: TcxButton;
    cxMemo1: TcxMemo;
    btnStockCabang: TcxButton;
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
    procedure btnStockCabangClick(Sender: TObject);
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
  ufrmItem, uDBUtils, uAppUtils, uItem, ufrmCXMsgInfo, Datasnap.DBClient,
  uVariable;

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

procedure TfrmBrowseItem.btnStockCabangClick(Sender: TObject);
var
  lCDS: TClientDataset;
  lConn: TFDConnection;
  QProj: TFDQuery;
  lQ: TFDQuery;
  S: string;
begin
  inherited;
  lCDS := TClientDataSet.Create(Self);
  Try
    lCDS.AddField('Cabang',ftString);
    lCDS.AddField('Kode',ftString);
    lCDS.AddField('Nama',ftString);
    lCDS.AddField('Warehouse',ftString);
    lCDS.AddField('UOM',ftString);
    lCDS.AddField('Stock',ftFloat);
    lCDS.CreateDataSet;

    QProj := TDBUtils.OpenQuery('select * from TProject');
    while not QProj.Eof do
    begin
      if (QProj.FieldByName('IP_ADDRESS').AsString = '')
        or (QProj.FieldByName('DB_NAME').AsString = '')
        or (QProj.FieldByName('DB_USER').AsString = '')
        or (QProj.FieldByName('DB_PASSWORD').AsString = '')
      then
      begin
        QProj.Next;
        continue;
      end;

      Try
        lConn := TDBUtils.CreateMSSQLConn(
            QProj.FieldByName('IP_ADDRESS').AsString,
            QProj.FieldByName('DB_NAME').AsString,
            QProj.FieldByName('DB_USER').AsString,
            QProj.FieldByName('DB_PASSWORD').AsString
          );

        S := 'SELECT * FROM FN_VIEW_STOCKBYITEM((SELECT DISTINCT ID FROM TITEM WHERE KODE='
          + QuotedStr(VarToStr(cxGrdMain.GetColumnValue('KODE') )) +'),getdate())';

        if QProj.FieldByName('PROJECT_CODE').AsString = AppVariable.Kode_Cabang then
          lQ := TDBUtils.OpenQuery(S)
        else
          lQ := TDBUtils.OpenQueryConn(lConn, S );
        Try

          while not lQ.Eof do
          begin
            lCDS.Append;
            lCDS.FieldByName('Cabang').AsString := QProj.FieldByName('Project_Name').AsString;
            lCDS.FieldByName('Kode').AsString := lQ.FieldByName('Kode').AsString;
            lCDS.FieldByName('Nama').AsString := lQ.FieldByName('Nama').AsString;
            lCDS.FieldByName('Warehouse').AsString := lQ.FieldByName('Warehouse').AsString;
            lCDS.FieldByName('UOM').AsString := lQ.FieldByName('UOM').AsString;
            lCDS.FieldByName('Stock').AsFloat := lQ.FieldByName('Stock').AsFloat;
            lCDS.Post;
            lQ.Next;
          end;
        Finally
          lQ.Free;
          lConn.Free;
        End;
      except
        on  E:Exception do
        begin
          TAppUtils.Error(E.Message);
        end;
      End;
      QProj.Next;
    end;

    if lCDS.RecordCount > 0 then
      TfrmCXMsgInfo.ShowSimpleMsg('Stock Gudang', lCDS, []);
  Finally
    lCDS.Free;
  End;


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
