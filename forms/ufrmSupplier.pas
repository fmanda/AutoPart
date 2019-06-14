unit ufrmSupplier;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGroupBox, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxSpinEdit, cxCheckBox, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxMemo, cxTextEdit, cxLabel, uCustomer, uSupplier, Vcl.ExtCtrls;

type
  TfrmSupplier = class(TfrmDefaultInput)
    cxLabel3: TcxLabel;
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
    crTempo: TcxSpinEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FSupplier: TSupplier;
    function GetSupplier: TSupplier;
    procedure UpdateData;
    function ValidateData: Boolean;
    property Supplier: TSupplier read GetSupplier write FSupplier;
    { Private declarations }
  public
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = False);
    { Public declarations }
  end;

var
  frmSupplier: TfrmSupplier;

implementation

uses
  uDXUtils, uDBUtils, uAppUtils;

{$R *.dfm}

procedure TfrmSupplier.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if Supplier.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmSupplier.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  LoadByID(0);
end;

procedure TfrmSupplier.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_F5 then
  begin
    if Supplier.ID = 0 then
      edKode.Text := Supplier.GenerateNo;
  end;
end;

function TfrmSupplier.GetSupplier: TSupplier;
begin
  if FSupplier = nil then
    FSupplier := TSupplier.Create;

  Result := FSupplier;
end;

procedure TfrmSupplier.LoadByID(aID: Integer; IsReadOnly: Boolean = False);
begin
  if FSupplier <> nil then FreeAndNil(FSupplier);

  Supplier.LoadByID(aID);
  if aID = 0 then
  begin
    Supplier.IsActive := 1;
    Supplier.Kode     := Supplier.GenerateNo;
  end;

  edKode.Text       := Supplier.Kode;
  edNama.Text       := Supplier.Nama;
  edAlamat.Text     := Supplier.Alamat;
  edTelp.Text       := Supplier.Telp;
  crTempo.Value     := Supplier.Tempo;
  chkActive.Checked := Supplier.IsActive = 1;
  btnSave.Enabled   := not IsReadOnly;

  dtModified.Date   := Supplier.ModifiedDate;
  edModifiedBy.Text := Supplier.ModifiedBy;
end;

procedure TfrmSupplier.UpdateData;
begin
  Supplier.Kode         := edKode.Text;
  Supplier.Nama         := edNama.Text;
  Supplier.Alamat       := edAlamat.Text;
  Supplier.Telp         := edTelp.Text;
  Supplier.Tempo        := VarToInt(crTempo.Value);
  Supplier.ModifiedBy   := UserLogin;
  Supplier.ModifiedDate := Now();
  Supplier.IsActive := 1;
  if not chkActive.Checked then Supplier.IsActive := 0;
end;

function TfrmSupplier.ValidateData: Boolean;
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
