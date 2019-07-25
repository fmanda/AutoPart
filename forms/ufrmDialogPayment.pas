unit ufrmDialogPayment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, cxTextEdit, cxCurrencyEdit, cxLabel, cxGroupBox;

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
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure crBayarPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure btnSaveClick(Sender: TObject);
    procedure crBayarPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    function IsRegistered: Boolean; override;
    class function ShowPayment(ATotal: Double; var ACashAmt: Double): Boolean;
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
end;

procedure TfrmDialogPayment.btnCancelClick(Sender: TObject);
begin
  inherited;
  Self.ModalResult := mrCancel;
end;

procedure TfrmDialogPayment.btnSaveClick(Sender: TObject);
begin
  inherited;
  if crBayar.Value < crTotal.Value then
  begin
    TAppUtils.Warning('Nilai Bayar <= Nilai Total');
    exit;
  end;
  Self.ModalResult := mrOk;
end;

procedure TfrmDialogPayment.crBayarPropertiesChange(Sender: TObject);
begin
  inherited;
  crKembali.Value := crBayar.Value - crTotal.Value;
end;

procedure TfrmDialogPayment.crBayarPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if VarToFloat(DisplayValue) < crTotal.Value then
  begin
    ErrorText := 'Nilai Bayar <= Nilai Total';
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

class function TfrmDialogPayment.ShowPayment(ATotal: Double; var ACashAmt:
    Double): Boolean;
var
  lfrm: TfrmDialogPayment;
begin
  Result := False;

  lfrm := TfrmDialogPayment.Create(Application);
  Try
    lfrm.crTotal.Value := ATotal;
    if lfrm.ShowModal = mrOk then
    begin
      ACashAmt := lfrm.crBayar.Value;
      Result := True;
    end;
  Finally
    lfrm.Free;
  End;
end;

end.
