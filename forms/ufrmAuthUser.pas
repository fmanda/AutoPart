unit ufrmAuthUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, cxGroupBox, cxTextEdit, cxLabel, Vcl.ExtCtrls, dxGDIPlusClasses,
  cxImage, cxMemo, uUser;

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
    cxLabel3: TcxLabel;
    txtNotes: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    FSpv: TUser;
    FTransNo: String;
    FTransDate: TDatetime;
    procedure DoAuthorize;
    function GetSpv: TUser;
    procedure SaveToLog;
    property Spv: TUser read GetSpv write FSpv;
    { Private declarations }
  public
    destructor Destroy; override;
    class function Authorize(aDefaultNotes: String = ''; aTransNo: String = '';
        aTransDate: TDatetime = 0): Boolean;
    property TransNo: String read FTransNo write FTransNo;
    property TransDate: TDatetime read FTransDate write FTransDate;
    { Public declarations }
  end;

var
  frmAuthUser: TfrmAuthUser;

implementation

uses
  uDXUtils, uAppUtils;

{$R *.dfm}

destructor TfrmAuthUser.Destroy;
begin
  inherited;
  if FSpv <> nil then
    FreeAndNil(FSpv);
end;

class function TfrmAuthUser.Authorize(aDefaultNotes: String = ''; aTransNo:
    String = ''; aTransDate: TDatetime = 0): Boolean;
var
  lfrm: TfrmAuthUser;
begin
  lfrm := TfrmAuthUser.Create(Application);
  Try
    lfrm.txtNotes.Text := aDefaultNotes;
    lfrm.TransNo := aTransNo;
    lfrm.TransDate := aTransDate;
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
  DoAuthorize;
end;

procedure TfrmAuthUser.DoAuthorize;
begin
  if Spv.LoadByCode(txtUser.Text) then
  begin
    if UpperCase(txtPassword.Text) = UpperCase(Spv.Password) then
    begin
      if (Spv.IsSupervisor = 1)
        or (Spv.SuperUser = 1)
      then
      begin
        SaveToLog;
        Self.ModalResult := mrOK;
      end
      else
        TAppUtils.Warning('User bukan Supervisor');
    end else
      TAppUtils.Warning('Password user tidak sesuai');
  end
  else
    TAppUtils.Warning('User ' + txtUser.Text + ' tidak ditemukan');
end;

procedure TfrmAuthUser.FormCreate(Sender: TObject);
begin
  txtUser.Clear;
  txtPassword.Clear;
  txtNotes.Clear;
  Self.AssignKeyDownEvent;
end;

procedure TfrmAuthUser.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  If Key = VK_ESCAPE then Self.ModalResult := mrCancel;
  if (ssCtrl in Shift) and (Key = VK_RETURN) then
  begin
    DoAuthorize;
  end;
end;

procedure TfrmAuthUser.FormShow(Sender: TObject);
begin
  txtUser.SetFocus;
end;

function TfrmAuthUser.GetSpv: TUser;
begin
  if FSpv = nil then
    FSpv := TUser.Create();
  Result := FSpv;
end;

procedure TfrmAuthUser.SaveToLog;
var
  lAutUser: TAuthUser;
begin
  Try
    lAutUser := TAuthUser.Create;
    Try
      lAutUser.User := TUser.CreateID(Spv.ID);
      lAutUser.Notes := txtNotes.Text;
      lAutUser.TransDate := TransDate;
      lAutUser.TransNo := TransNo;
      lAutUser.SaveToDB(True);
    Finally
      lAutUser.Free;
    End;
  except
  End;
end;

end.
