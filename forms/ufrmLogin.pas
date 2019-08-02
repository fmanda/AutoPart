unit ufrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus,
  dxGDIPlusClasses, cxImage, Vcl.StdCtrls, cxButtons, cxGroupBox, cxTextEdit,
  cxLabel, uUser;

type
  TfrmLogin = class(TfrmDefault)
    cxLabel1: TcxLabel;
    txtUser: TcxTextEdit;
    cxLabel2: TcxLabel;
    txtPassword: TcxTextEdit;
    cxGroupBox2: TcxGroupBox;
    btnCancel: TcxButton;
    btnLogin: TcxButton;
    cxImage1: TcxImage;
    procedure FormCreate(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
  public
    function IsRegistered: Boolean; override;
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  uAppUtils, uDBUtils, uDXUtils;

{$R *.dfm}

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;

  txtUser.Text    := TAppUtils.BacaRegistry('devuser');
  txtPassword.Text  := TAppUtils.BacaRegistry('devpassword');
end;

procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
  inherited;
  Self.ModalResult := mrCancel;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  inherited;
  if User = nil then
    User := TUser.Create;     //idk access violation here.. please check
//  if User <> nil then
//    FreeAndNil(User);
//  User := TUser.Create;

  if User.LoadByCode(txtUser.Text) then
    if UpperCase(txtPassword.Text) = UpperCase(User.Password) then
    begin
      User.ReloadAll;
      Self.ModalResult := mrOK;
      exit;
    end;

  User.Clear;
  TAppUtils.Warning('User dan Password tidak ditemukan di database');
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  inherited;
  if (txtUser.Text <> '') and (txtPassword.Text <> '') then
    btnLogin.SetFocus;
end;

function TfrmLogin.IsRegistered: Boolean;
begin
  Result := False;
end;



end.
