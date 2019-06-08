unit ufrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus,
  dxGDIPlusClasses, cxImage, Vcl.StdCtrls, cxButtons, cxGroupBox, cxTextEdit,
  cxLabel;

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
    procedure btnLoginClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  protected
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  uAppUtils, uDBUtils;

{$R *.dfm}

procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
  inherited;
  Self.ModalResult := mrCancel;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
  S: string;
begin
  inherited;
  if (LowerCase(txtUser.Text) = 'admin') and (LowerCase(txtPassword.Text) = 'admin') then
  begin
//    User.ID := 0;
//    User.UserName := 'admin';
//    User.Nama     := 'admin';
//    User.Jabatan  := 'admin';
    Self.ModalResult := mrOK;
    exit;
  end;
//
//  S := 'select * from temployee where username = '+ QuotedStr(txtUser.Text)
//      +' and password = ' + QuotedStr(txtPassword.Text);
//
//  with TDBUtils.OpenQuery(S) do
//  begin
//    Try
//      if not eof then
//      begin
////        User.LoadByID(FieldByName('ID').AsInteger);
//        Self.ModalResult := mrOK;
//        exit;
//      end;
//    Finally
//      Free;
//    End;
//  end;

  TAppUtils.Warning('User dan Password tidak ditemukan di database');
end;



end.
