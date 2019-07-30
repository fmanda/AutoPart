unit ufrmDialogPayment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxCurrencyEdit, cxLabel, cxGroupBox,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox;

type
  TfrmDialogPayment = class(TfrmDefault)
    cxLabel2: TcxLabel;
    cxLabel5: TcxLabel;
    crBayar: TcxCurrencyEdit;
    cxGroupBox1: TcxGroupBox;
    btnCancel: TcxButton;
    btnSave: TcxButton;
    crTotal: TcxCurrencyEdit;
    cxLabel1: TcxLabel;
    crKembali: TcxCurrencyEdit;
    cxGroupBox2: TcxGroupBox;
    cxLabel4: TcxLabel;
    cxLabel3: TcxLabel;
    crCard: TcxCurrencyEdit;
    cxLookupRekening: TcxExtLookupComboBox;
    cxLabel6: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure crBayarPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure btnSaveClick(Sender: TObject);
    procedure crBayarPropertiesChange(Sender: TObject);
    procedure crCardKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure crCardPropertiesChange(Sender: TObject);
    procedure crCardPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    { Private declarations }
  public
    function IsRegistered: Boolean; override;
    class function ShowPayment(ATotal: Double; var ACashAmt, aCardAmt: Double; var
        aRekeningID: Integer): Boolean;
    { Public declarations }
  end;

var
  frmDialogPayment: TfrmDialogPayment;

implementation

uses
  uDXUtils, uAppUtils;

{$R *.dfm}

procedure TfrmDialogPayment.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  cxLookupRekening.Properties.LoadFromSQL(Self,
    'select id, nama from trekening where jenis = 1 ','nama');
//  cxLookupRekening.SetDefaultValue();
end;

procedure TfrmDialogPayment.btnCancelClick(Sender: TObject);
begin
  inherited;
  Self.ModalResult := mrCancel;
end;

procedure TfrmDialogPayment.btnSaveClick(Sender: TObject);
begin
  inherited;
  if (crBayar.Value + crCard.Value) < crTotal.Value then
  begin
    TAppUtils.Warning('Nilai Bayar <= Nilai Total');
    exit;
  end;

  if (crCard.Value>0) and (VarToInt(cxLookupRekening.EditValue)=0) then
  begin
    TAppUtils.Warning('Untuk Pembayaran Kartu, Bank harus dipilih');
    exit;
  end;

  Self.ModalResult := mrOk;
end;

procedure TfrmDialogPayment.crBayarPropertiesChange(Sender: TObject);
begin
  inherited;
  crKembali.Value := (crBayar.Value+crCard.Value) - crTotal.Value;
end;

procedure TfrmDialogPayment.crBayarPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if VarToFloat(DisplayValue) < 0 then
  begin
    ErrorText := 'Nilai Bayar < 0 ';
    Error := True;
  end;

end;

procedure TfrmDialogPayment.crCardKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
  begin
    if (crCard.Value = 0) then
      btnSave.SetFocus
    else
      cxLookupRekening.SetFocus;
  end;

end;

procedure TfrmDialogPayment.crCardPropertiesChange(Sender: TObject);
begin
  inherited;
  crKembali.Value := (crBayar.Value+crCard.Value) - crTotal.Value;
end;

procedure TfrmDialogPayment.crCardPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if VarToFloat(DisplayValue) < 0 then
  begin
    ErrorText := 'Nilai Bayar < 0 ';
    Error := True;
  end;

  if (VarToFloat(DisplayValue) > crTotal.Value) then
  begin
    ErrorText := 'Pembayaran Kartu > Nilai Total';
    Error := True;
  end;
end;

procedure TfrmDialogPayment.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    Self.ModalResult := mrCancel;
end;

function TfrmDialogPayment.IsRegistered: Boolean;
begin
  Result := False;
end;

class function TfrmDialogPayment.ShowPayment(ATotal: Double; var ACashAmt,
    aCardAmt: Double; var aRekeningID: Integer): Boolean;
var
  lfrm: TfrmDialogPayment;
begin
  Result := False;

  lfrm := TfrmDialogPayment.Create(Application);
  Try
    lfrm.crTotal.Value := ATotal;
    lfrm.crBayar.Value := ATotal;
    if lfrm.ShowModal = mrOk then
    begin
      ACashAmt := lfrm.crBayar.Value;
      aCardAmt := lfrm.crCard.Value;
      aRekeningID := VarToInt(lfrm.cxLookupRekening.EditValue);
      Result := True;
    end;
  Finally
    lfrm.Free;
  End;
end;

end.
