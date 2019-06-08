unit ufrmUOM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox, cxTextEdit, uUOM,
  uAppUtils, uDXUtils;

type
  TfrmUOM = class(TfrmDefaultInput)
    cxLabel1: TcxLabel;
    edUOM: TcxTextEdit;
    cxLabel2: TcxLabel;
    edDesc: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    FUOM: TUOM;
    function GetUOM: TUOM;
    procedure UpdateData;
    function ValidateData: Boolean;
    property UOM: TUOM read GetUOM write FUOM;
    { Private declarations }
  public
    procedure LoadByID(AID: Integer);
    { Public declarations }
  end;

var
  frmUOM: TfrmUOM;

implementation

{$R *.dfm}

procedure TfrmUOM.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
end;

procedure TfrmUOM.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if UOM.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

function TfrmUOM.GetUOM: TUOM;
begin
  if FUOM = nil then
    FUOM := TUOM.Create;

  Result := FUOM;
end;

procedure TfrmUOM.LoadByID(AID: Integer);
begin
  UOM.LoadByID(AID);
  edUOM.Text  := UOM.UOM;
  edDesc.Text := UOM.Deskripsi;
end;

procedure TfrmUOM.UpdateData;
begin
  UOM.UOM := edUOM.Text;
  UOM.Deskripsi := edDesc.Text;
end;

function TfrmUOM.ValidateData: Boolean;
begin
  Result := True;

  if edUOM.Text = '' then
  begin
    TAppUtils.Warning('UOM belum diisi');
    edUOM.SetFocus;
    Result := False;
    exit;
  end;

end;

end.
