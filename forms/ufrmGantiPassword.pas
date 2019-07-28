unit ufrmGantiPassword;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons,
  cxGroupBox, cxLabel, cxTextEdit;

type
  TfrmGantiPassword = class(TfrmDefaultInput)
    edNewPass: TcxTextEdit;
    cxLabel3: TcxLabel;
    edNewPass2: TcxTextEdit;
    cxLabel4: TcxLabel;
    edOldPass: TcxTextEdit;
    cxLabel1: TcxLabel;
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    function IsRegistered: Boolean; override;
    { Public declarations }
  end;

var
  frmGantiPassword: TfrmGantiPassword;

implementation

uses
  uUser, uDBUtils, uAppUtils;

{$R *.dfm}

procedure TfrmGantiPassword.btnSaveClick(Sender: TObject);
var
  lUser: TUser;
begin
  inherited;
  lUser := TUser.Create;
  Try
    if not lUser.LoadByCode(UserLogin) then exit;

    if edOldPass.Text = '' then
    begin
      TAppUtils.Warning('Password lama wajib diisi');
      exit;
    end;

    if lUser.Password <> edOldPass.Text then
    begin
      TAppUtils.Warning('Password lama tidak sesuai');
      exit;
    end;

    if edNewPass.Text = '' then
    begin
      TAppUtils.Warning('Password Baru wajib diisi');
      exit;
    end;

    if edNewPass.Text <> edNewPass2.Text then
    begin
      TAppUtils.Warning('Password tidak sama');
      exit;
    end;

    lUser.Password := edNewPass2.Text;
    if lUser.SaveToDB then
    begin
      TAppUtils.Information('Password berhasil diupdate');
      Self.ModalResult := mrOK;
    end;

  Finally
    lUser.Free;
  End;
end;

function TfrmGantiPassword.IsRegistered: Boolean;
begin
  Result := False;
end;

end.
