unit ufrmStockCabang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDBThread, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxContainer, Vcl.Menus, cxTextEdit, cxMemo, Vcl.StdCtrls, cxButtons,
  cxGroupBox, cxClasses, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCurrencyEdit, uDXUtils,
  uDBUtils, uVariable, uAppUtils;

type
  TfrmStockCabang = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    styleEven: TcxStyle;
    styleDefault: TcxStyle;
    styleInfoBk: TcxStyle;
    pnButtom: TcxGroupBox;
    btnOK: TcxButton;
    pnTop: TcxGroupBox;
    mmPesan: TcxMemo;
    PopupMenu1: TPopupMenu;
    CheckAll1: TMenuItem;
    UnCheckAll1: TMenuItem;
    SaveDialog1: TSaveDialog;
    cxGrdMain: TcxGridTableView;
    colCabang: TcxGridColumn;
    colGudang: TcxGridColumn;
    colKode: TcxGridColumn;
    colNama: TcxGridColumn;
    colStock: TcxGridColumn;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure LoadDataIntoGrid(Dataset: TLightDataset);
    { Private declarations }
  public
    procedure ClearGrid;
    procedure ExecuteThread(aItemCode: String);
    class procedure ShowForm(aItemCode: String);
    procedure ThreadData(Sender: TObject; Dataset: TLightDataset);
    procedure ThreadException(Sender: TObject; E: Exception);
    { Public declarations }
  end;

var
  frmStockCabang: TfrmStockCabang;

implementation

uses
  FireDAC.Comp.Client;

{$R *.dfm}

procedure TfrmStockCabang.btnOKClick(Sender: TObject);
begin
//  Self.Close;
end;

procedure TfrmStockCabang.ClearGrid;
begin
  cxGrdMain.ClearRows;
end;

procedure TfrmStockCabang.ExecuteThread(aItemCode: String);
var
  lDB: string;
  lIP: string;
  lPass: string;
  lProjCode: string;
  lProjName: string;
  lUser: string;
  QProj: TFDQUery;
  T: TDatabaseThread;
begin
  inherited;

  ClearGrid;

  QProj := TDBUtils.OpenQuery('select * from TProject');
  try


    while not QProj.eof do
    begin
      lIP         := QProj.FieldByName('IP_ADDRESS').AsString;
      lDB         := QProj.FieldByName('DB_NAME').AsString;
      lUser       := QProj.FieldByName('DB_USER').AsString;
      lPass       := QProj.FieldByName('DB_PASSWORD').AsString;
      lProjCode   := QProj.FieldByName('PROJECT_CODE').AsString;
      lProjName   := QProj.FieldByName('Project_Name').AsString;

      if lProjCode = AppVariable.Kode_Cabang then
      begin
        lIP       := TAppUtils.BacaRegistry('server');
        lDB       := TAppUtils.BacaRegistry('database');
        lUser     := TAppUtils.BacaRegistry('user');
        lPass     := TAppUtils.BacaRegistry('password');
      end;

      With TDatabaseThread.Create do
      begin
        SQL             := 'SELECT '  + QuotedStr(lProjName) + ' as Cabang,'
          +' WAREHOUSE, KODE, NAMA, STOCK '
          +' FROM FN_VIEW_STOCKBYITEM((SELECT DISTINCT ID FROM TITEM WHERE KODE='
          + QuotedStr(aItemCode) +'),getdate())';

        IPAddr          := lIP;
        Database        := lDB;
        User            := lUser;
        Password        := lPass;
        FreeOnTerminate := True;
        OnData          := ThreadData;
        OnException     := ThreadException;
        Start;
      end;



      QProj.Next;
    end;

  finally
    QProj.Free;
  end;


end;

procedure TfrmStockCabang.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmStockCabang.LoadDataIntoGrid(Dataset: TLightDataset);
var
  i: Integer;
  iRow: Integer;
  Rows: TStrings;
begin
  if DataSet = nil then exit;
  cxGrdMain.BeginUpdate;
  Try
    for i := 0 to DataSet.RowCount-1 do
    begin
      iRow := cxGrdMain.DataController.AppendRecord;
      Rows := Dataset.Rows[i];

      cxGrdMain.SetValue(iRow, colCabang.Index , Rows[0] );
      cxGrdMain.SetValue(iRow, colGudang.Index , Rows[1]);
      cxGrdMain.SetValue(iRow, colKode.Index ,Rows[2]);
      cxGrdMain.SetValue(iRow, colNama.Index , Rows[3]);
      cxGrdMain.SetValue(iRow, colStock.Index , Rows[4]);

    end;
  Finally
    cxGrdMain.EndUpdate;
  End;
end;

class procedure TfrmStockCabang.ShowForm(aItemCode: String);
var
  lfrm: TfrmStockCabang;
begin
  lfrm := TfrmStockCabang.Create(Application);
  Try
    lfrm.ExecuteThread(aItemCode);
    lfrm.ShowModal;
  Finally
    //
  End;
end;

procedure TfrmStockCabang.ThreadData(Sender: TObject; Dataset: TLightDataset);
begin
  LoadDataIntoGrid(Dataset);
//  SetEnabledState(True);
end;

procedure TfrmStockCabang.ThreadException(Sender: TObject; E: Exception);
begin
  MessageDlg('EXCEPTION: '+E.Message, mtError, [mbOK], 0);
//  SetEnabledState(True);
end;

end.
