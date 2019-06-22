unit ufrmSalesman;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons, cxGroupBox, cxCheckBox,
  cxMemo, cxTextEdit, cxLabel, uCustomer, uSalesman, System.DateUtils;

type
  TfrmSalesman = class(TfrmDefaultInput)
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
    FSalesman: TSalesman;
    function GetSalesman: TSalesman;
    procedure UpdateData;
    function ValidateData: Boolean;
    property Salesman: TSalesman read GetSalesman write FSalesman;
    { Private declarations }
  public
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = False);
    { Public declarations }
  end;

var
  frmSalesman: TfrmSalesman;

implementation

uses
  uDXUtils, uDBUtils, uAppUtils;

{$R *.dfm}

procedure TfrmSalesman.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if Salesman.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmSalesman.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  LoadByID(0);
end;

function TfrmSalesman.GetSalesman: TSalesman;
begin
  if FSalesman = nil then
    FSalesman := TSalesman.Create;

  Result := FSalesman;
end;

procedure TfrmSalesman.LoadByID(aID: Integer; IsReadOnly: Boolean = False);
begin
  if FSalesman <> nil then FreeAndNil(FSalesman);

  Salesman.LoadByID(aID);

  edKode.Text       := Salesman.Kode;
  edNama.Text       := Salesman.Nama;
  edAlamat.Text     := Salesman.Alamat;
  edTelp.Text       := Salesman.Telp;
  chkActive.Checked := Salesman.IsActive = 1;
  btnSave.Enabled   := not IsReadOnly;
end;

procedure TfrmSalesman.UpdateData;
begin
  Salesman.Kode         := edKode.Text;
  Salesman.Nama         := edNama.Text;
  Salesman.Alamat       := edAlamat.Text;
  Salesman.Telp         := edTelp.Text;
  Salesman.IsActive     := 1;
  if not chkActive.Checked then Salesman.IsActive := 0;
end;

function TfrmSalesman.ValidateData: Boolean;
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
