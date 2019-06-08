unit ufrmMerk;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGroupBox, cxTextEdit, cxLabel, uItem,
  uAppUtils, uDXUtils;

type
  TfrmMerk = class(TfrmDefaultInput)
    cxLabel1: TcxLabel;
    edKode: TcxTextEdit;
    cxLabel2: TcxLabel;
    edNama: TcxTextEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FMerk: TMerk;
    function GetMerk: TMerk;
    procedure UpdateData;
    function ValidateData: Boolean;
    property Merk: TMerk read GetMerk write FMerk;
    { Private declarations }
  public
    procedure LoadByID(AID: Integer);
    { Public declarations }
  end;

var
  frmMerk: TfrmMerk;

implementation

{$R *.dfm}

procedure TfrmMerk.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if Merk.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmMerk.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
end;

function TfrmMerk.GetMerk: TMerk;
begin
  if FMerk = nil then
    FMerk := TMerk.Create;

  Result := FMerk;
end;

procedure TfrmMerk.LoadByID(AID: Integer);
begin
  Merk.LoadByID(AID);
  edKode.Text   := Merk.Kode;
  edNama.Text   := Merk.Nama;
end;

procedure TfrmMerk.UpdateData;
begin
  Merk.Kode := edKode.Text;
  Merk.Nama := edNama.Text;
end;

function TfrmMerk.ValidateData: Boolean;
begin
  Result := True;

  if edKode.Text = '' then
  begin
    TAppUtils.Warning('Kode wajib diisi');
    edKode.SetFocus;
    Result := False;
    exit;
  end;

  if edNama.Text = '' then
  begin
    TAppUtils.Warning('Nama wajib diisi');
    edNama.SetFocus;
    Result := False;
    exit;
  end;

end;

end.
