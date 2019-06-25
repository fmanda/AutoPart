unit ufrmSalesFee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons, cxGroupBox, cxMaskEdit,
  cxSpinEdit, cxCurrencyEdit, cxCheckBox, cxLabel, cxTextEdit, uCustomer,
  uSalesFee;

type
  TfrmSalesFee = class(TfrmDefaultInput)
    edNama: TcxTextEdit;
    cxLabel2: TcxLabel;
    chkActive: TcxCheckBox;
    crFee1: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    spTempo1: TcxSpinEdit;
    cxLabel7: TcxLabel;
    cxLabel1: TcxLabel;
    crFee2: TcxCurrencyEdit;
    cxLabel3: TcxLabel;
    spTempo2: TcxSpinEdit;
    cxLabel4: TcxLabel;
    cxLabel6: TcxLabel;
    crFee3: TcxCurrencyEdit;
    cxLabel8: TcxLabel;
    spTempo3: TcxSpinEdit;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FSalesFee: TSalesFee;
    function GetSalesFee: TSalesFee;
    procedure UpdateData;
    function ValidateData: Boolean;
    property SalesFee: TSalesFee read GetSalesFee write FSalesFee;
    { Private declarations }
  public
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = False);
    { Public declarations }
  end;

var
  frmSalesFee: TfrmSalesFee;

implementation

uses
  uAppUtils, uDBUtils, uDXUtils;

{$R *.dfm}

procedure TfrmSalesFee.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if SalesFee.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmSalesFee.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  LoadByID(0);
end;

function TfrmSalesFee.GetSalesFee: TSalesFee;
begin
  if FSalesFee = nil then
    FSalesFee := TSalesFee.Create;

  Result := FSalesFee;
end;

procedure TfrmSalesFee.LoadByID(aID: Integer; IsReadOnly: Boolean = False);
begin
  if FSalesFee <> nil then FreeAndNil(FSalesFee);

  SalesFee.LoadByID(aID);
  if aID = 0 then
    SalesFee.IsActive := 1;

  edNama.Text     := SalesFee.Nama;
  crFee1.Value    := SalesFee.Fee_1;
  crFee2.Value    := SalesFee.Fee_2;
  crFee3.Value    := SalesFee.Fee_3;
  spTempo1.Value  := SalesFee.MaxTempo_1;
  spTempo2.Value  := SalesFee.MaxTempo_2;
  spTempo3.Value  := SalesFee.MaxTempo_3;

end;

procedure TfrmSalesFee.UpdateData;
begin
  SalesFee.Nama         := edNama.Text;
  SalesFee.Fee_1        := crFee1.Value;
  SalesFee.Fee_2        := crFee2.Value;
  SalesFee.Fee_3        := crFee3.Value;
  SalesFee.MaxTempo_1   := spTempo1.Value;
  SalesFee.MaxTempo_2   := spTempo2.Value;
  SalesFee.MaxTempo_3   := spTempo3.Value;
  SalesFee.IsActive := 1;
  if not chkActive.Checked then SalesFee.IsActive := 0;
end;

function TfrmSalesFee.ValidateData: Boolean;
begin
  Result := False;

  if edNama.Text = '' then
  begin
    TAppUtils.Warning('Nama wajib diisi');
    edNama.SetFocus;
    exit;
  end;

  Result := True;

end;

end.
