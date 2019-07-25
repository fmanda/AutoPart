unit ufrmSettingFee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons, cxGroupBox, cxMaskEdit,
  cxSpinEdit, cxCurrencyEdit, cxCheckBox, cxLabel, cxTextEdit, uCustomer,
  uSettingFee, cxStyles, cxClasses;

type
  TfrmSettingFee = class(TfrmDefaultInput)
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
    FSettingFee: TSettingFee;
    function GetSettingFee: TSettingFee;
    procedure UpdateData;
    function ValidateData: Boolean;
    property SettingFee: TSettingFee read GetSettingFee write FSettingFee;
    { Private declarations }
  public
    function GetGroupName: string; override;
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = False);
    { Public declarations }
  end;

var
  frmSettingFee: TfrmSettingFee;

implementation

uses
  uAppUtils, uDBUtils, uDXUtils;

{$R *.dfm}

procedure TfrmSettingFee.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if SettingFee.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmSettingFee.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  LoadByID(0);
end;

function TfrmSettingFee.GetGroupName: string;
begin
  Result := 'Master Data';
end;

function TfrmSettingFee.GetSettingFee: TSettingFee;
begin
  if FSettingFee = nil then
    FSettingFee := TSettingFee.Create;

  Result := FSettingFee;
end;

procedure TfrmSettingFee.LoadByID(aID: Integer; IsReadOnly: Boolean = False);
begin
  if FSettingFee <> nil then FreeAndNil(FSettingFee);

  SettingFee.LoadByID(aID);
  if aID = 0 then
    SettingFee.IsActive := 1;

  edNama.Text     := SettingFee.Nama;
  crFee1.Value    := SettingFee.Fee_1;
  crFee2.Value    := SettingFee.Fee_2;
  crFee3.Value    := SettingFee.Fee_3;
  spTempo1.Value  := SettingFee.MaxTempo_1;
  spTempo2.Value  := SettingFee.MaxTempo_2;
  spTempo3.Value  := SettingFee.MaxTempo_3;

end;

procedure TfrmSettingFee.UpdateData;
begin
  SettingFee.Nama         := edNama.Text;
  SettingFee.Fee_1        := crFee1.Value;
  SettingFee.Fee_2        := crFee2.Value;
  SettingFee.Fee_3        := crFee3.Value;
  SettingFee.MaxTempo_1   := spTempo1.Value;
  SettingFee.MaxTempo_2   := spTempo2.Value;
  SettingFee.MaxTempo_3   := spTempo3.Value;
  SettingFee.IsActive := 1;
  if not chkActive.Checked then SettingFee.IsActive := 0;
end;

function TfrmSettingFee.ValidateData: Boolean;
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
