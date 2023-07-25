unit ufrmBrowseItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultServerBrowse, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Datasnap.DBClient,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxContainer,
  Vcl.Menus, Vcl.ComCtrls, dxCore, cxDateUtils, cxClasses, cxLabel, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.StdCtrls, cxButtons, cxGroupBox,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridServerModeTableView, cxGrid, uDXUtils, cxMemo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, ufrmCXMsgInfo,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.Phys.ODBCBase, IdBaseComponent, IdComponent, IdRawBase, IdRawClient,
  IdIcmpClient, uDBThread;

type
  TfrmBrowseItem = class(TfrmDefaultServerBrowse)
    styleNonActive: TcxStyle;
    btnStock: TcxButton;
    cxMemo1: TcxMemo;
    btnStockCabang: TcxButton;
    FDConnection1: TFDConnection;
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
    FCDSStockCabang: TClientDataSet;
    function GetCDSStockCabang: TClientDataSet;
    property CDSStockCabang: TClientDataSet read GetCDSStockCabang write
        FCDSStockCabang;
    { Private declarations }
  protected
    function GetKeyField: string; override;
    function GetSQL: string; override;
    procedure GetStockCabang(aIP, aDB, aUser, aPass, aProjectCode, aItemCode,
        aProjectName: String);
    procedure StockCabang;
    procedure StockCabangThread;
  public
    function GetGroupName: string; override;
    { Public declarations }
  end;

function IPValid(aIPAddr: String): Boolean;

var
  frmBrowseItem: TfrmBrowseItem;
  frmInfo : TfrmCXMsgInfo;

implementation

uses
  ufrmItem, uDBUtils, uAppUtils, uItem, uVariable, ufrmStockCabang;

{$R *.dfm}

function IPValid(aIPAddr: String): Boolean;
var
  I: TIdIcmpClient;
  Rec: Integer;
begin
  Result:= False;
  I:= TIdIcmpClient.Create(nil);
  try
    I.Host:= aIPAddr;
    I.Ping();
    Sleep(2000);
    Rec:= I.ReplyStatus.BytesReceived;
    if Rec > 0 then Result:= True else Result:= False;
  finally
    I.Free;
  end;
end;

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
begin
  inherited;
  TfrmStockCabang.ShowForm(cxGrdMain.GetColumnValue('KODE'));
//  StockCabangThread;
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

function TfrmBrowseItem.GetCDSStockCabang: TClientDataSet;
begin
  if FCDSStockCabang = nil then
  begin
    FCDSStockCabang := TClientDataset.Create(Self);
    FCDSStockCabang.AddField('Cabang',ftString);
    FCDSStockCabang.AddField('Kode',ftString);
    FCDSStockCabang.AddField('Nama',ftString);
    FCDSStockCabang.AddField('Warehouse',ftString);
    FCDSStockCabang.AddField('UOM',ftString);
    FCDSStockCabang.AddField('Stock',ftFloat);
    FCDSStockCabang.AddField('Status',ftString);
    FCDSStockCabang.CreateDataSet;
  end;
  Result := FCDSStockCabang;
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

procedure TfrmBrowseItem.GetStockCabang(aIP, aDB, aUser, aPass, aProjectCode,
    aItemCode, aProjectName: String);

  procedure StopDrawing(Handle: HWND);
  const
    cnStopDrawing = 0;
  begin
    SendMessage(Handle, WM_SETREDRAW, cnStopDrawing, 0);
  end;

  procedure ContinueDrawing(Handle: HWND);
  const
    cnStartDrawing = 1;
  begin
    SendMessage(Handle, WM_SETREDRAW, cnStartDrawing, 0);
    RedrawWindow(Handle, nil, 0,
      RDW_ERASE or RDW_FRAME or RDW_INVALIDATE or RDW_ALLCHILDREN);
  end;

var
  lCDSStockCabang: TClientDataSet;
  lConn: TFDConnection;
  lQ: TFDQUery;
  S: string;
begin
  StopDrawing(Handle);

  if aProjectCode = AppVariable.Kode_Cabang then
    lConn := FDConnection
  else
    lConn := TDBUtils.CreateMSSQLConn(aIP, aDB, aUser, aPass, 5, '', False);



  try
    lCDSStockCabang := TClientDataSet.Create(Self);
    lCDSStockCabang.DisableControls;
    lCDSStockCabang.CloneCursor(CDSStockCabang, True);

    try
      lConn.Connected := True;
    except
      lCDSStockCabang.Append;
      lCDSStockCabang.FieldByName('Cabang').AsString     := aProjectName;
      lCDSStockCabang.FieldByName('Status').AsString     := 'TIMEOUT';
      lCDSStockCabang.Post;
      exit;
    end;


    S := 'SELECT * FROM FN_VIEW_STOCKBYITEM((SELECT DISTINCT ID FROM TITEM WHERE KODE='
        + QuotedStr(aItemCode) +'),getdate())';

    lQ := TDBUtils.OpenQueryConn(lConn, S );

    Try
      while not lQ.Eof do
      begin
        lCDSStockCabang.Append;
        lCDSStockCabang.FieldByName('Cabang').AsString     := aProjectName;
        lCDSStockCabang.FieldByName('Kode').AsString       := lQ.FieldByName('Kode').AsString;
        lCDSStockCabang.FieldByName('Nama').AsString       := lQ.FieldByName('Nama').AsString;
        lCDSStockCabang.FieldByName('Warehouse').AsString  := lQ.FieldByName('Warehouse').AsString;
        lCDSStockCabang.FieldByName('UOM').AsString        := lQ.FieldByName('UOM').AsString;
        lCDSStockCabang.FieldByName('Stock').AsFloat       := lQ.FieldByName('Stock').AsFloat;
        lCDSStockCabang.Post;

        lQ.Next;
      end;

    finally
      lCDSStockCabang.EnableControls;
      lCDSStockCabang.Free;
      lQ.Free;
    end;


  finally
    if aProjectCode <> AppVariable.Kode_Cabang then
      lConn.Free;
    ContinueDrawing(Handle);
  end;
end;

procedure TfrmBrowseItem.StockCabang;
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

procedure TfrmBrowseItem.StockCabangThread;
var
  lDB: string;
  lIP: string;
  lItemCode: string;
  lPass: string;
  lProject: string;
  lProjName: string;
  QProj: TFDQuery;
  lUser: string;

  procedure StartThread(aIP, aDB, aUser, aPass, aProjectCode, aItemCode,
      aProjectName: String);
  begin
    TThread.CreateAnonymousThread(
      procedure
      begin
        GetStockCabang(aIP, aDB, aUser, aPass, aProjectCode, aItemCode, aProjectName);
      end
    ).Start;
  end;

begin
  inherited;
  //form first

  CDSStockCabang.EmptyDataSet;
  frmInfo := TfrmCXMsgInfo.ShowSimpleMsg('Stock Gudang', CDSStockCabang, ['Status'], False);
  frmInfo.cxGrdMain.SetColumnsWidth(
    ['Cabang', 'Kode', 'Nama', 'Warehouse', 'UOM', 'Stock'],
    [150,50,250,80,30,50]);
  frmInfo.Show;
  QProj := TDBUtils.OpenQuery('select * from TProject');
  try


    while not QProj.eof do
    begin
      lIP       := QProj.FieldByName('IP_ADDRESS').AsString;
      lDB       := QProj.FieldByName('DB_NAME').AsString;
      lUser     := QProj.FieldByName('DB_USER').AsString;
      lPass     := QProj.FieldByName('DB_PASSWORD').AsString;
      lItemCode := VarToStr(cxGrdMain.GetColumnValue('KODE'));
      lProject  := QProj.FieldByName('PROJECT_CODE').AsString;
      lProjName := QProj.FieldByName('Project_Name').AsString;

      StartThread(lIP, lDB, lUser, lPass, lProject, lItemCode, lProjName);

      QProj.Next;
    end;

  finally
    QProj.Free;
  end;
end;

end.
