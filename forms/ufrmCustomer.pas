unit ufrmCustomer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGroupBox, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxRadioGroup, cxCheckBox, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxCurrencyEdit, cxMemo, cxTextEdit, cxLabel, uItem, uCustomer, cxSpinEdit,
  Vcl.ExtCtrls, cxStyles, cxClasses;

type
  TfrmCustomer = class(TfrmDefaultInput)
    cxLabel1: TcxLabel;
    edKode: TcxTextEdit;
    cxLabel2: TcxLabel;
    edNama: TcxTextEdit;
    cxLabel6: TcxLabel;
    edAlamat: TcxMemo;
    cxLabel7: TcxLabel;
    lbModifiedBy: TcxLabel;
    edModifiedBy: TcxTextEdit;
    lbModified: TcxLabel;
    dtModified: TcxDateEdit;
    chkActive: TcxCheckBox;
    cxLabel4: TcxLabel;
    edTelp: TcxTextEdit;
    rbHarga: TcxRadioGroup;
    cxLabel3: TcxLabel;
    crTempo: TcxSpinEdit;
    crCreditLimit: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FCustomer: TCustomer;
    function GetCustomer: TCustomer;
    procedure UpdateData;
    function ValidateData: Boolean;
    property Customer: TCustomer read GetCustomer write FCustomer;
    { Private declarations }
  public
    function GetGroupName: string; override;
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = False);
    { Public declarations }
  end;

var
  frmCustomer: TfrmCustomer;

implementation

uses
  uDXUtils, uDBUtils, uAppUtils;

{$R *.dfm}

procedure TfrmCustomer.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if Customer.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmCustomer.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  LoadByID(0);
end;

procedure TfrmCustomer.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_F5 then
  begin
    if Customer.ID = 0 then
      edKode.Text := Customer.GenerateNo;
  end;
end;

function TfrmCustomer.GetCustomer: TCustomer;
begin
  if FCustomer = nil then
    FCustomer := TCustomer.Create;

  Result := FCustomer;
end;

function TfrmCustomer.GetGroupName: string;
begin
  Result := 'Master Data';
end;

procedure TfrmCustomer.LoadByID(aID: Integer; IsReadOnly: Boolean = False);
begin
  if FCustomer <> nil then FreeAndNil(FCustomer);

  Customer.LoadByID(aID);
  if aID = 0 then
  begin
    Customer.IsActive := 1;
    Customer.Kode     := Customer.GenerateNo;
  end;

  edKode.Text       := Customer.Kode;
  edNama.Text       := Customer.Nama;
  edAlamat.Text     := Customer.Alamat;
  edTelp.Text       := Customer.Telp;
  crTempo.Value     := Customer.Tempo;
  rbHarga.ItemIndex := Customer.TipeHarga;
  chkActive.Checked := Customer.IsActive = 1;
  btnSave.Enabled   := not IsReadOnly;

  crCreditLimit.Value := Customer.CreditLimit;

  dtModified.Date   := Customer.ModifiedDate;
  edModifiedBy.Text := Customer.ModifiedBy;
end;

procedure TfrmCustomer.UpdateData;
begin
  Customer.Kode         := edKode.Text;
  Customer.Nama         := edNama.Text;
  Customer.Alamat       := edAlamat.Text;
  Customer.Telp         := edTelp.Text;
  Customer.Tempo        := VarToInt(crTempo.Value);
  Customer.TipeHarga    := rbHarga.ItemIndex;
  Customer.ModifiedBy   := UserLogin;
  Customer.ModifiedDate := Now();
  Customer.CreditLimit  := crCreditLimit.Value;
  Customer.IsActive := 1;
  if not chkActive.Checked then Customer.IsActive := 0;
end;

function TfrmCustomer.ValidateData: Boolean;
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


  Result := True;

end;

end.
