unit ufrmWarehouse;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGroupBox, cxRadioGroup, cxCheckBox,
  cxTextEdit, cxLabel, uSupplier, uWarehouse;

type
  TfrmWarehouse = class(TfrmDefaultInput)
    cxLabel1: TcxLabel;
    edKode: TcxTextEdit;
    cxLabel2: TcxLabel;
    edNama: TcxTextEdit;
    chkActive: TcxCheckBox;
    rbJenis: TcxRadioGroup;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FWarehouse: TWarehouse;
    function GetWarehouse: TWarehouse;
    procedure UpdateData;
    function ValidateData: Boolean;
    property Warehouse: TWarehouse read GetWarehouse write FWarehouse;
    { Private declarations }
  public
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = False);
    { Public declarations }
  end;

var
  frmWarehouse: TfrmWarehouse;

implementation

uses
  uAppUtils, uDXUtils;

{$R *.dfm}

procedure TfrmWarehouse.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if Warehouse.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmWarehouse.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  LoadByID(0);
end;

function TfrmWarehouse.GetWarehouse: TWarehouse;
begin
  if FWarehouse = nil then
    FWarehouse := TWarehouse.Create;

  Result := FWarehouse;
end;

procedure TfrmWarehouse.LoadByID(aID: Integer; IsReadOnly: Boolean = False);
begin
  if FWarehouse <> nil then FreeAndNil(FWarehouse);

  Warehouse.LoadByID(aID);
  if aID = 0 then
  begin
    Warehouse.IsActive := 1;
  end;

  edKode.Text       := Warehouse.Kode;
  edNama.Text       := Warehouse.Nama;
  rbJenis.ItemIndex := Warehouse.Jenis;
  chkActive.Checked := Warehouse.IsActive = 1;
  btnSave.Enabled   := not IsReadOnly;

end;

procedure TfrmWarehouse.UpdateData;
begin
  Warehouse.Kode          := edKode.Text;
  Warehouse.Nama          := edNama.Text;
  Warehouse.Jenis         := rbJenis.ItemIndex;
  Warehouse.IsActive      := 1;
  if not chkActive.Checked then Warehouse.IsActive := 0;
end;

function TfrmWarehouse.ValidateData: Boolean;
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
