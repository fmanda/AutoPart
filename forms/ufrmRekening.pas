unit ufrmRekening;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGroupBox, cxRadioGroup, cxCheckBox,
  cxTextEdit, cxLabel, uCustomer, uAccount, Vcl.ExtCtrls, cxStyles, cxClasses;

type
  TfrmRekening = class(TfrmDefaultInput)
    cxLabel1: TcxLabel;
    edKode: TcxTextEdit;
    cxLabel2: TcxLabel;
    edNama: TcxTextEdit;
    chkActive: TcxCheckBox;
    rbJenis: TcxRadioGroup;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FRekening: TRekening;
    function GetRekening: TRekening;
    procedure UpdateData;
    function ValidateData: Boolean;
    property Rekening: TRekening read GetRekening write FRekening;
    { Private declarations }
  public
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = False);
    { Public declarations }
  end;

var
  frmRekening: TfrmRekening;

implementation

uses
  uAppUtils, uDBUtils, uDXUtils;

{$R *.dfm}

procedure TfrmRekening.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if Rekening.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmRekening.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  LoadByID(0);
end;

function TfrmRekening.GetRekening: TRekening;
begin
  if FRekening = nil then
    FRekening := TRekening.Create;

  Result := FRekening;
end;

procedure TfrmRekening.LoadByID(aID: Integer; IsReadOnly: Boolean = False);
begin
  if FRekening <> nil then FreeAndNil(FRekening);

  Rekening.LoadByID(aID);
  edKode.Text       := Rekening.Kode;
  edNama.Text       := Rekening.Nama;
  rbJenis.ItemIndex := Rekening.Jenis;
  chkActive.Checked := Rekening.IsActive = 1;
  btnSave.Enabled   := not IsReadOnly;
end;

procedure TfrmRekening.UpdateData;
begin
  Rekening.Kode         := edKode.Text;
  Rekening.Nama         := edNama.Text;
  Rekening.Jenis        := rbJenis.ItemIndex;
  Rekening.IsActive     := TAppUtils.BoolToInt(chkActive.Checked);
end;

function TfrmRekening.ValidateData: Boolean;
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
