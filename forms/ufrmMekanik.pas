unit ufrmMekanik;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons, cxGroupBox, cxCheckBox,
  cxMemo, cxTextEdit, cxLabel, uCustomer, uMekanik, cxStyles, cxClasses;

type
  TfrmMekanik = class(TfrmDefaultInput)
    cxLabel1: TcxLabel;
    edKode: TcxTextEdit;
    cxLabel2: TcxLabel;
    edNama: TcxTextEdit;
    cxLabel6: TcxLabel;
    edAlamat: TcxMemo;
    chkActive: TcxCheckBox;
    cxLabel4: TcxLabel;
    edTelp: TcxTextEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FMekanik: TMekanik;
    function GetMekanik: TMekanik;
    procedure UpdateData;
    function ValidateData: Boolean;
    property Mekanik: TMekanik read GetMekanik write FMekanik;
    { Private declarations }
  public
    function GetGroupName: string; override;
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = False);
    { Public declarations }
  end;

var
  frmMekanik: TfrmMekanik;

implementation

uses
  uDBUtils, uDXUtils, uAppUtils;

{$R *.dfm}

procedure TfrmMekanik.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if Mekanik.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmMekanik.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  LoadByID(0);
end;

function TfrmMekanik.GetGroupName: string;
begin
  Result := 'Master Data';
end;

function TfrmMekanik.GetMekanik: TMekanik;
begin
  if FMekanik = nil then
    FMekanik := TMekanik.Create;

  Result := FMekanik;
end;

procedure TfrmMekanik.LoadByID(aID: Integer; IsReadOnly: Boolean = False);
begin
  if FMekanik <> nil then FreeAndNil(FMekanik);

  Mekanik.LoadByID(aID);


  edKode.Text       := Mekanik.Kode;
  edNama.Text       := Mekanik.Nama;
  edAlamat.Text     := Mekanik.Alamat;
  edTelp.Text       := Mekanik.Telp;
  chkActive.Checked := Mekanik.IsActive = 1;
  btnSave.Enabled   := not IsReadOnly;
end;

procedure TfrmMekanik.UpdateData;
begin
  Mekanik.Kode         := edKode.Text;
  Mekanik.Nama         := edNama.Text;
  Mekanik.Alamat       := edAlamat.Text;
  Mekanik.Telp         := edTelp.Text;
  Mekanik.IsActive := 1;
  if not chkActive.Checked then Mekanik.IsActive := 0;
end;

function TfrmMekanik.ValidateData: Boolean;
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
