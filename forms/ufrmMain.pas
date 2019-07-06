unit ufrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxPC,
  dxBarBuiltInMenu, dxRibbonSkins, dxRibbonCustomizationForm, cxClasses,
  dxRibbon, dxTabbedMDI, dxStatusBar, dxRibbonStatusBar, dxBar,
  dxBarApplicationMenu, System.ImageList, Vcl.ImgList, System.Actions,
  Vcl.ActnList, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, Vcl.StdCtrls, dxRibbonBackstageView,
  cxImageList, dxNavBarOfficeNavigationBar, Vcl.Menus, cxButtons;

type
  TfrmMain = class(TForm)
    dxBarManager: TdxBarManager;
    dxStatusBar: TdxRibbonStatusBar;
    dxRTApp: TdxRibbonTab;
    dxRBMain: TdxRibbon;
    dxRTMaster: TdxRibbonTab;
    dxRTSales: TdxRibbonTab;
    dxRTInventory: TdxRibbonTab;
    ActionManager: TActionManager;
    actLogin: TAction;
    actSettingKoneksi: TAction;
    actUOM: TAction;
    dxBarManagerBar1: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    ImageList: TcxImageList;
    cxLookAndFeelController1: TcxLookAndFeelController;
    FDConnection1: TFDConnection;
    dxBarManagerBar2: TdxBar;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarManagerBar3: TdxBar;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    dxBarButton16: TdxBarButton;
    dxBarButton17: TdxBarButton;
    dxBarButton18: TdxBarButton;
    dxBarButton19: TdxBarButton;
    dxBarButton20: TdxBarButton;
    dxBarButton21: TdxBarButton;
    dxBarButton22: TdxBarButton;
    dxBarButton23: TdxBarButton;
    dxBarButton24: TdxBarButton;
    dxBarButton25: TdxBarButton;
    dxBarButton26: TdxBarButton;
    dxBarButton27: TdxBarButton;
    actHelp: TAction;
    dxBarButton28: TdxBarButton;
    dxBarButton29: TdxBarButton;
    actItemGroup: TAction;
    actMerk: TAction;
    actItem: TAction;
    actQuotation: TAction;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton30: TdxBarButton;
    dxBarButton31: TdxBarButton;
    dxBarButton32: TdxBarButton;
    actService: TAction;
    dxBarButton33: TdxBarButton;
    dxRTARAP: TdxRibbonTab;
    dxRTManagement: TdxRibbonTab;
    dxBarButton34: TdxBarButton;
    dxBarButton35: TdxBarButton;
    actCustomer: TAction;
    actSupplier: TAction;
    dxBarManagerBar4: TdxBar;
    actWarehouse: TAction;
    dxBarButton36: TdxBarButton;
    actRekening: TAction;
    dxBarButton37: TdxBarButton;
    dxBarManagerBar5: TdxBar;
    actPurchaseInvoice: TAction;
    actPurchaseRetur: TAction;
    actTransferStock: TAction;
    dxBarButton38: TdxBarButton;
    dxBarButton39: TdxBarButton;
    dxBarButton40: TdxBarButton;
    dxBarManagerBar6: TdxBar;
    actStockOpname: TAction;
    actStockAdjustment: TAction;
    dxBarButton41: TdxBarButton;
    dxBarButton42: TdxBarButton;
    actKartuStock: TAction;
    actLapStock: TAction;
    dxBarButton43: TdxBarButton;
    dxBarButton44: TdxBarButton;
    actLapStockOpname: TAction;
    dxBarButton45: TdxBarButton;
    actSalesman: TAction;
    dxBarButton46: TdxBarButton;
    actMekanik: TAction;
    dxBarButton47: TdxBarButton;
    dxBarButton48: TdxBarButton;
    actAccount: TAction;
    dxBarButton49: TdxBarButton;
    dxBarManagerBar7: TdxBar;
    dxBarManagerBar9: TdxBar;
    dxBarManagerBar10: TdxBar;
    dxBarManagerBar11: TdxBar;
    dxBarManagerBar12: TdxBar;
    dxBarManagerBar14: TdxBar;
    actVariable: TAction;
    actUser: TAction;
    dxBarButton50: TdxBarButton;
    dxBarButton51: TdxBarButton;
    actSales: TAction;
    dxBarButton52: TdxBarButton;
    actSalesRetur: TAction;
    dxBarButton53: TdxBarButton;
    actCashIn: TAction;
    actCashOut: TAction;
    actInternalTransfer: TAction;
    dxBarButton54: TdxBarButton;
    dxBarButton55: TdxBarButton;
    dxBarButton56: TdxBarButton;
    actCashOpname: TAction;
    dxBarButton57: TdxBarButton;
    actSaldoKas: TAction;
    actLapCashOpname: TAction;
    actMutasiKas: TAction;
    actLapPenjualan: TAction;
    actBiaya: TAction;
    dxBarButton58: TdxBarButton;
    dxBarButton59: TdxBarButton;
    dxBarButton60: TdxBarButton;
    dxBarButton61: TdxBarButton;
    dxBarButton62: TdxBarButton;
    dxBarButton63: TdxBarButton;
    actPurchPayment: TAction;
    actSalesPayment: TAction;
    dxBarButton64: TdxBarButton;
    dxBarButton65: TdxBarButton;
    actSaldoHutang: TAction;
    actPurchaseInvoiceHistory: TAction;
    actSaldoPiutang: TAction;
    actSalesInvoiceHistory: TAction;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton66: TdxBarButton;
    dxBarButton67: TdxBarButton;
    dxBarButton68: TdxBarButton;
    dxBarButton69: TdxBarButton;
    actClosingHarian: TAction;
    dxBarButton70: TdxBarButton;
    dxBarManagerBar8: TdxBar;
    dxBarButton71: TdxBarButton;
    actSettingFee: TAction;
    dxBarButton72: TdxBarButton;
    dxBarButton73: TdxBarButton;
    dxTabbedMDIManager: TdxTabbedMDIManager;
    actPurchaseReturHistory: TAction;
    dxBarButton74: TdxBarButton;
    actSalesReturHistory: TAction;
    dxBarButton75: TdxBarButton;
    procedure actCustomerExecute(Sender: TObject);
    procedure actInternalTransferExecute(Sender: TObject);
    procedure actItemExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actItemGroupExecute(Sender: TObject);
    procedure actKartuStockExecute(Sender: TObject);
    procedure actLapStockExecute(Sender: TObject);
    procedure actLoginExecute(Sender: TObject);
    procedure actMekanikExecute(Sender: TObject);
    procedure actMerkExecute(Sender: TObject);
    procedure actMutasiKasExecute(Sender: TObject);
    procedure actPurchaseInvoiceExecute(Sender: TObject);
    procedure actPurchaseInvoiceHistoryExecute(Sender: TObject);
    procedure actPurchaseReturExecute(Sender: TObject);
    procedure actPurchaseReturHistoryExecute(Sender: TObject);
    procedure actPurchPaymentExecute(Sender: TObject);
    procedure actQuotationExecute(Sender: TObject);
    procedure actRekeningExecute(Sender: TObject);
    procedure actSaldoHutangExecute(Sender: TObject);
    procedure actSaldoKasExecute(Sender: TObject);
    procedure actSaldoPiutangExecute(Sender: TObject);
    procedure actSalesExecute(Sender: TObject);
    procedure actSettingFeeExecute(Sender: TObject);
    procedure actSalesInvoiceHistoryExecute(Sender: TObject);
    procedure actSalesmanExecute(Sender: TObject);
    procedure actSalesPaymentExecute(Sender: TObject);
    procedure actSalesReturExecute(Sender: TObject);
    procedure actSalesReturHistoryExecute(Sender: TObject);
    procedure actServiceExecute(Sender: TObject);
    procedure actUOMExecute(Sender: TObject);
    procedure actSettingKoneksiExecute(Sender: TObject);
    procedure actSupplierExecute(Sender: TObject);
    procedure actTransferStockExecute(Sender: TObject);
    procedure actVariableExecute(Sender: TObject);
    procedure actWarehouseExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function ConnectDB: Boolean;
    { Private declarations }
  public
    procedure DoLogin;
    { Public declarations }
  end;

function ShowForm(AFormClass: TFormClass): TForm;

var
  frmMain: TfrmMain;

implementation

uses
  uDBUtils, uApputils, uDXUtils, ufrmLogin, ufrmSetKoneksi, ufrmTest,
  ufrmBrowseUOM, ufrmBrowseItemGroup, ufrmBrowseMerk, uItem, ufrmBrowseItem,
  ufrmBrowseService, ufrmBrowseCustomer, ufrmBrowseSupplier,
  ufrmBrowseWarehouse, ufrmBrowseRekening, ufrmCXServerLookup,
  ufrmBrowsePurchaseInvoice, uTransDetail, ufrmKartuStock,
  ufrmBrowsePurchaseRetur, ufrmBrowseTransferStock, ufrmLapStock,
  ufrmBrowseSalesman, ufrmBrowseMekanik, ufrmBrowseSalesInvoice, ufrmVariable,
  uVariable, ufrmSalesInvoiceHistory, ufrmPurchaseInvoiceHistory,
  ufrmBrowseSettingFee, ufrmSaldoRekening, ufrmBrowseSalesRetur,
  ufrmMutasiRekening, ufrmBrowsePurchasePayment, ufrmPurchaseReturHistory,
  ufrmBrowseSalesPayment, ufrmSalesReturHistory, ufrmLapHutang, ufrmLapPiutang,
  ufrmBrowseCashTransfer, ufrmBrowsePriceQuotation;

{$R *.dfm}

function ShowForm(AFormClass: TFormClass): TForm;
var
  i: Integer;
begin
  //check form akses here
  try
    for i := 0 to frmMain.MDIChildCount-1 do
    begin
      if frmMain.MDIChildren[i].ClassName = AFormClass.ClassName then
      begin
        Result := frmMain.MDIChildren[i];
        Result.Show;
        exit;
      end;
    end;
    Result := AFormClass.Create(Application);
  except
    Result := AFormClass.Create(Application);
  end;
end;


procedure TfrmMain.actCustomerExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowseCustomer);
end;

procedure TfrmMain.actInternalTransferExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowseCashTransfer);
end;

procedure TfrmMain.actItemExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowseItem);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  iIndex: Integer;
begin
  if not ConnectDB then
  begin
    with TfrmSetKoneksi.Create(Self) do
    begin
      ShowModal;
//      EnableDisableAction(False);
    end;
  end else
  begin
    AppVariable := TVariable.Create(Application);
    AppVariable.LoadVariable;
    DoLogin;
  end;


  TryStrToInt(TAppUtils.BacaRegistry('LastRibbonTabIndex'), iIndex);
  Try
    dxRBMain.ActiveTab := dxRBMain.Tabs[iIndex];
  except
  End;
end;

procedure TfrmMain.actItemGroupExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowseItemGroup);
end;

procedure TfrmMain.actKartuStockExecute(Sender: TObject);
begin
  ShowForm(TfrmKartuStock);
end;

procedure TfrmMain.actLapStockExecute(Sender: TObject);
begin
  ShowForm(TfrmLapStock);
end;

procedure TfrmMain.actLoginExecute(Sender: TObject);
begin
  DoLogin;
end;

procedure TfrmMain.actMekanikExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowseMekanik);
end;

procedure TfrmMain.actMerkExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowseMerk);
end;

procedure TfrmMain.actMutasiKasExecute(Sender: TObject);
begin
  ShowForm(TfrmMutasiRekening);
end;

procedure TfrmMain.actPurchaseInvoiceExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowsePurchaseInvoice);
end;

procedure TfrmMain.actPurchaseInvoiceHistoryExecute(Sender: TObject);
begin
  ShowForm(TfrmPurchaseInvoiceHistory);
end;

procedure TfrmMain.actPurchaseReturExecute(Sender: TObject);
begin
  Showform(TfrmBrowsePurchaseRetur);
end;

procedure TfrmMain.actPurchaseReturHistoryExecute(Sender: TObject);
begin
  ShowForm(TfrmPurchaseReturHistory);
end;

procedure TfrmMain.actPurchPaymentExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowsePurchasePayment);
end;

procedure TfrmMain.actQuotationExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowsePriceQuotation);
end;

procedure TfrmMain.actRekeningExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowseRekening);
end;

procedure TfrmMain.actSaldoHutangExecute(Sender: TObject);
begin
  ShowForm(TfrmLapHutang);
end;

procedure TfrmMain.actSaldoKasExecute(Sender: TObject);
begin
  ShowForm(TfrmSaldoRekening);
end;

procedure TfrmMain.actSaldoPiutangExecute(Sender: TObject);
begin
  ShowForm(TfrmLapPiutang);
end;

procedure TfrmMain.actSalesExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowseSalesInvoice);
end;

procedure TfrmMain.actSettingFeeExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowseSettingFee);
end;

procedure TfrmMain.actSalesInvoiceHistoryExecute(Sender: TObject);
begin
  ShowForm(TfrmSalesInvoiceHistory); //.ShowModal;
end;

procedure TfrmMain.actSalesmanExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowseSalesman)
end;

procedure TfrmMain.actSalesPaymentExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowseSalesPayment);
end;

procedure TfrmMain.actSalesReturExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowseSalesRetur);
end;

procedure TfrmMain.actSalesReturHistoryExecute(Sender: TObject);
begin
  ShowForm(TfrmSalesReturHistory);
end;

procedure TfrmMain.actServiceExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowseService);
end;

procedure TfrmMain.actUOMExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowseUOM);
end;

procedure TfrmMain.actSettingKoneksiExecute(Sender: TObject);
begin
  with TfrmSetKoneksi.Create(Self) do
  begin
    ShowModal;
  end;
end;

procedure TfrmMain.actSupplierExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowseSupplier);
end;

procedure TfrmMain.actTransferStockExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowseTransferStock);
end;

procedure TfrmMain.actVariableExecute(Sender: TObject);
begin
  ShowForm(TfrmVariable).ShowModal;
end;

procedure TfrmMain.actWarehouseExecute(Sender: TObject);
begin
  ShowForm(TfrmBrowseWarehouse);
end;

function TfrmMain.ConnectDB: Boolean;
var
  lDB: string;
  lPassword: string;
  lServer: String;
  lUser: string;
begin
//  Result    := False;

  lServer   := TAppUtils.BacaRegistry('server');
  lDB       := TAppUtils.BacaRegistry('database');
  lUser     := TAppUtils.BacaRegistry('user');
  lPassword := TAppUtils.BacaRegistry('password');

  dxStatusBar.Panels[0].Text := 'Server : ' + lServer;
  dxStatusBar.Panels[1].Text := 'Database : ' + lDB;
  dxStatusBar.Panels[2].Text := 'UserLogin : ';

  Try
    if TDBUtils.ConnectDB('MSSQL',lServer,lDB,lUser,lPassword, '1433') then
    begin
      Result := True;
      dxStatusBar.Panels[2].Text := 'Connected'
    end
    else
    begin
      Result := False;
      TAppUtils.Warning('Gagal Koneksi Database, Pastikan Koneksi sudah disetting dengan benar');
    end;
  except
    on E:Exception do
    begin
      Result := False;
      TAppUtils.Warning('Gagal Koneksi Database, Pastikan Koneksi sudah disetting dengan benar, Exception :'
        +#13 + E.Message
      );
    end;

  End;

end;

procedure TfrmMain.cxButton1Click(Sender: TObject);
//var
//  cxLookup: TfrmCXServerLookup;
begin
//  cxLookup := TfrmCXServerLookup.Execute(
//    'select * from titem','id'
//  );
//  Try
//    cxLookup.PreFilter('nama','oli');
//    if cxLookup.ShowModal = mrOK then
//      ShowMessage( VarToStr(cxLookup.FieldValue('id')));
//
//  Finally
//    cxLookup.Free;
//  End;
end;

procedure TfrmMain.DoLogin;
begin
  TDBUtils.SetUserLogin('programmer');
  dxStatusBar.Panels[2].Text := 'UserLogin : ' + UserLogin;
  exit;
  with TfrmLogin.Create(Self) do
  begin
    Try
      if ShowModal = mrOK then
      begin

//        EnableDisableAction(True);
//        SetPrivileges(User);
//        dxRTTrans.Active := True;
        dxStatusBar.Panels[2].Text := 'UserLogin : ' + UserLogin;
      end else
      begin
//        EnableDisableAction(False);
      end;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  TAppUtils.TulisRegistry('LastRibbonTabIndex', IntToStr(dxRBMain.ActiveTab.Index));
end;

end.
