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
  cxImageList;

type
  TfrmMain = class(TForm)
    dxBarManager: TdxBarManager;
    dxStatusBar: TdxRibbonStatusBar;
    dxRTApp: TdxRibbonTab;
    dxRibbon1: TdxRibbon;
    dxRTMaster: TdxRibbonTab;
    dxRTTrans: TdxRibbonTab;
    dxRTReport: TdxRibbonTab;
    ActionManager: TActionManager;
    actLogin: TAction;
    actSettingKoneksi: TAction;
    actMasterUOM: TAction;
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
    dxBarManagerBar4: TdxBar;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarManagerBar5: TdxBar;
    dxBarManagerBar6: TdxBar;
    dxBarManagerBar7: TdxBar;
    dxBarButton13: TdxBarButton;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    dxBarButton16: TdxBarButton;
    dxBarButton17: TdxBarButton;
    dxBarButton18: TdxBarButton;
    dxBarButton19: TdxBarButton;
    dxBarManagerBar8: TdxBar;
    dxBarManagerBar9: TdxBar;
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
    procedure actLoginExecute(Sender: TObject);
    procedure actMasterUOMExecute(Sender: TObject);
    procedure actSettingKoneksiExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  ufrmBrowseUOM;

{$R *.dfm}

function ShowForm(AFormClass: TFormClass): TForm;
begin
  //check form akses here
  Result := AFormClass.Create(Application);
end;


procedure TfrmMain.actLoginExecute(Sender: TObject);
begin
  DoLogin;
end;

procedure TfrmMain.actMasterUOMExecute(Sender: TObject);
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
  dxStatusBar.Panels[2].Text := 'Status : Not Connected';

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

procedure TfrmMain.DoLogin;
begin
  exit;
  with TfrmLogin.Create(Self) do
  begin
    Try
      if ShowModal = mrOK then
      begin
//        EnableDisableAction(True);
//        SetPrivileges(User);
//        dxRTTrans.Active := True;
      end else
      begin
//        EnableDisableAction(False);
      end;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  if not ConnectDB then
  begin
    with TfrmSetKoneksi.Create(Self) do
    begin
      ShowModal;
//      EnableDisableAction(False);
    end;
  end else
    DoLogin;
end;

end.
