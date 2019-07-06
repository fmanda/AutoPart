unit ufrmAccount;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons, cxGroupBox, cxRadioGroup,
  cxCheckBox, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxTextEdit, cxLabel, uAccount;

type
  TfrmAccount = class(TfrmDefaultInput)
    cxLabel1: TcxLabel;
    edKode: TcxTextEdit;
    cxLabel2: TcxLabel;
    edNama: TcxTextEdit;
    cxLookupAccount: TcxExtLookupComboBox;
    cxLabel3: TcxLabel;
    chkActive: TcxCheckBox;
    chkCredit: TcxCheckBox;
    chkIsDetail: TcxCheckBox;
    rbJenis: TcxRadioGroup;
    procedure btnSaveClick(Sender: TObject);
    procedure btnSaveClick1(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FAccount: TAccount;
    function GetAccount: TAccount;
    procedure UpdateData;
    function ValidateData: Boolean;
    property Account: TAccount read GetAccount write FAccount;
    { Private declarations }
  public
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = False);
    { Public declarations }
  end;

var
  frmAccount: TfrmAccount;

implementation

uses
  uAppUtils, uDXUtils;

{$R *.dfm}

procedure TfrmAccount.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if Account.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmAccount.btnSaveClick1(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if Account.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmAccount.FormCreate(Sender: TObject);
begin
  inherited;
  cxLookupAccount.LoadFromSQL('select id, kode + '' - '' + nama as nama from taccount where isdetail = 0','id','nama',Self);
  Self.AssignKeyDownEvent;
  LoadByID(0);
end;

function TfrmAccount.GetAccount: TAccount;
begin
  if FAccount = nil then
    FAccount := TAccount.Create;

  Result := FAccount;
end;

procedure TfrmAccount.LoadByID(aID: Integer; IsReadOnly: Boolean = False);
begin
  if FAccount <> nil then FreeAndNil(FAccount);

  Account.LoadByID(aID);
  edKode.Text           := Account.Kode;
  edNama.Text           := Account.Nama;
//  rbJenis.ItemIndex     := Account.Jenis;
  chkActive.Checked     := Account.IsActive = 1;
  chkIsDetail.Checked   := Account.IsDetail = 1;
  chkCredit.Checked     := Account.IsCredit = 1;
  if Account.Parent <> nil then
    cxLookupAccount.EditValue := Account.Parent.ID;

  btnSave.Enabled       := not IsReadOnly;
end;

procedure TfrmAccount.UpdateData;
begin
  Account.Kode        := edKode.Text;
  Account.Nama        := edNama.Text;
//  Account.Jenis       := rbJenis.ItemIndex;
  Account.IsActive    := TAppUtils.BoolToInt(chkActive.Checked);
  Account.IsDetail    := TAppUtils.BoolToInt(chkIsDetail.Checked);
  Account.IsCredit    := TAppUtils.BoolToInt(chkCredit.Checked);

  if Account.Parent = nil then
    Account.Parent := TAccount.Create;

  Account.Parent.ID   := VarToInt(cxLookupAccount.EditValue);

end;

function TfrmAccount.ValidateData: Boolean;
begin
  Result := False;

  if edKode.Text = '' then
  begin
    TAppUtils.Warning('Kode wajib diisi');
    edKode.SetFocus;
    exit;
  end;

  if edNama.Text = '' then
  begin
    TAppUtils.Warning('Nama wajib diisi');
    edNama.SetFocus;
    exit;
  end;

  if Account.ID <> 0 then
  begin
    if VarToInt(cxLookupAccount.EditValue) = Account.ID then
    begin
      TAppUtils.Warning('Induk Account tidak boleh menunjuk dirinya sendiri');
      exit;
    end;
  end;


  Result := True;

end;

end.
