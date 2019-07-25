unit ufrmAuthUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, cxGroupBox, cxTextEdit, cxLabel, Vcl.ExtCtrls, dxGDIPlusClasses,
  cxImage;

type
  TfrmAuthUser = class(TForm)
    cxImage1: TcxImage;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    txtUser: TcxTextEdit;
    cxLabel2: TcxLabel;
    txtPassword: TcxTextEdit;
    cxGroupBox2: TcxGroupBox;
    btnCancel: TcxButton;
    btnLogin: TcxButton;
    cxGroupBox1: TcxGroupBox;
    lblTitle: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    class function Authorize(aCaption: String = ''): Boolean;
    { Public declarations }
  end;

var
  frmAuthUser: TfrmAuthUser;

implementation

uses
  uDXUtils;

{$R *.dfm}

class function TfrmAuthUser.Authorize(aCaption: String = ''): Boolean;
var
  lfrm: TfrmAuthUser;
begin
  lfrm := TfrmAuthUser.Create(Application);
  Try
    if aCaption <> '' then
      lfrm.lblTitle.Caption
    Result := lfrm.ShowModal = mrOK;
  Finally
    lfrm.Free;
  End;
end;

procedure TfrmAuthUser.btnCancelClick(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
end;

procedure TfrmAuthUser.btnLoginClick(Sender: TObject);
begin
  Self.ModalResult := mrOK;
end;

procedure TfrmAuthUser.FormCreate(Sender: TObject);
begin
  Self.AssignKeyDownEvent;
end;

procedure TfrmAuthUser.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  If Key = VK_ESCAPE then Self.ModalResult := mrCancel;
end;

end.
