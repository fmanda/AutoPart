unit ufrmItemGroup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGroupBox, uItem, uAppUtils, uDXUtils,
  cxTextEdit, cxLabel, Vcl.ExtCtrls, cxStyles, cxClasses;

type
  TfrmItemGroup = class(TfrmDefaultInput)
    cxLabel1: TcxLabel;
    edKode: TcxTextEdit;
    cxLabel2: TcxLabel;
    edNama: TcxTextEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FItemGroup: TItemGroup;
    function GetItemGroup: TItemGroup;
    procedure UpdateData;
    function ValidateData: Boolean;
    property ItemGroup: TItemGroup read GetItemGroup write FItemGroup;
    { Private declarations }
  public
    function GetGroupName: string; override;
    procedure LoadByID(AID: Integer);
    { Public declarations }
  end;

var
  frmItemGroup: TfrmItemGroup;

implementation

{$R *.dfm}

procedure TfrmItemGroup.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if ItemGroup.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmItemGroup.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
end;

function TfrmItemGroup.GetGroupName: string;
begin
  Result := 'Master Data';
end;

function TfrmItemGroup.GetItemGroup: TItemGroup;
begin
  if FItemGroup = nil then
    FItemGroup := TItemGroup.Create;

  Result := FItemGroup;
end;

procedure TfrmItemGroup.LoadByID(AID: Integer);
begin
  ItemGroup.LoadByID(AID);
  edKode.Text   := ItemGroup.Kode;
  edNama.Text   := ItemGroup.Nama;
end;

procedure TfrmItemGroup.UpdateData;
begin
  ItemGroup.Kode := edKode.Text;
  ItemGroup.Nama := edNama.Text;
end;

function TfrmItemGroup.ValidateData: Boolean;
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
