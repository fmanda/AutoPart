unit ufrmSetKoneksi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxGroupBox, cxTextEdit, cxLabel;

type
  TfrmSetKoneksi = class(TfrmDefault)
    cxGroupBox2: TcxGroupBox;
    btnTutup: TcxButton;
    btnTest: TcxButton;
    btnSave: TcxButton;
    cxLabel1: TcxLabel;
    txtServer: TcxTextEdit;
    cxLabel2: TcxLabel;
    txtDatabase: TcxTextEdit;
    cxLabel3: TcxLabel;
    txtUser: TcxTextEdit;
    cxLabel4: TcxLabel;
    txtPassword: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    function IsRegistered: Boolean; dynamic;
    { Public declarations }
  end;

var
  frmSetKoneksi: TfrmSetKoneksi;

implementation

uses
  uAppUtils, uDBUtils;

{$R *.dfm}

procedure TfrmSetKoneksi.FormCreate(Sender: TObject);
begin
  inherited;
  txtServer.Text    := TAppUtils.BacaRegistry('server');
  txtDatabase.Text  := TAppUtils.BacaRegistry('database');
  txtUser.Text      := TAppUtils.BacaRegistry('user');
  txtPassword.Text  := TAppUtils.BacaRegistry('password');
end;

procedure TfrmSetKoneksi.btnSaveClick(Sender: TObject);
begin
  inherited;
  TAppUtils.TulisRegistry('server', txtServer.Text);
  TAppUtils.TulisRegistry('database', txtDatabase.Text);
  TAppUtils.TulisRegistry('user', txtUser.Text);
  TAppUtils.TulisRegistry('password', txtPassword.Text);

  TAppUtils.Information('Informasi Koneksi berhasil diudpate');
  Self.ModalResult := mrOK;
end;

procedure TfrmSetKoneksi.btnTestClick(Sender: TObject);
begin
  inherited;
  if TDBUtils.ConnectDB('MSSQL', txtServer.Text, txtDatabase.Text, txtUser.Text, txtPassword.Text, '1433')
  then
    TAppUtils.Information('Connected')
  else
    TAppUtils.Warning('Gagal Koneksi Database');
end;

procedure TfrmSetKoneksi.btnTutupClick(Sender: TObject);
begin
  inherited;
  Self.ModalResult := mrCancel;
end;

function TfrmSetKoneksi.IsRegistered: Boolean;
begin
  Result := False;
end;

end.
