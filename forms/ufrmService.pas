unit ufrmService;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGroupBox, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxCheckBox, cxDropDownEdit, cxCalendar, cxCurrencyEdit, cxMemo,
  cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxTextEdit,
  cxLabel, uItem, Datasnap.DBClient, Vcl.ExtCtrls;

type
  TfrmService = class(TfrmDefaultInput)
    cxLabel1: TcxLabel;
    edKode: TcxTextEdit;
    cxLabel2: TcxLabel;
    edNama: TcxTextEdit;
    crPPN: TcxCurrencyEdit;
    cxLabel7: TcxLabel;
    lbModifiedBy: TcxLabel;
    edModifiedBy: TcxTextEdit;
    lbModified: TcxLabel;
    dtModified: TcxDateEdit;
    chkActive: TcxCheckBox;
    crBiaya: TcxCurrencyEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLookupUOM: TcxExtLookupComboBox;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCDSUOM: TClientDataset;
    FService: TService;
    function GetCDSUOM: TClientDataset;
    function GetService: TService;
    procedure InitView;
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDSUOM: TClientDataset read GetCDSUOM write FCDSUOM;
    property Service: TService read GetService write FService;
    { Private declarations }
  public
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = True);
    { Public declarations }
  end;

var
  frmService: TfrmService;

implementation

uses
  uDBUtils, uDXUtils, uAppUtils;

{$R *.dfm}

procedure TfrmService.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if Service.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmService.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  initView;
end;

function TfrmService.GetCDSUOM: TClientDataset;
begin
  if FCDSUOM = nil then
    FCDSUOM := TDBUtils.OpenDataset(
        'select id, uom from tuom', Self
      );
  Result := FCDSUOM;
end;

function TfrmService.GetService: TService;
begin
  if FService = nil then
    FService := TService.Create;

  Result := FService;
end;

procedure TfrmService.InitView;
begin
  cxLookupUOM.LoadFromCDS(CDSUOM, 'id','uom', Self);
  LoadByID(0, False);
end;

procedure TfrmService.LoadByID(aID: Integer; IsReadOnly: Boolean = True);
begin
  if FService <> nil then
    FreeAndNil(FService);

  Service.LoadByID(aID);

  //def uom
  if aID = 0 then
  begin
    Service.UOM       := TUOM.CreateID(1);
    Service.IsActive  := 1;
  end;

  edKode.Text       := Service.Kode;
  edNama.Text       := Service.Nama;
  crBiaya.Value     := Service.Biaya;
  crPPN.Value       := Service.PPN;
  dtModified.Date   := Service.ModifiedDate;
  edModifiedBy.Text := Service.ModifiedBy;

  if Service.UOM <> nil then
    cxLookupUOM.EditValue := Service.UOM.ID;

  chkActive.Checked := Service.IsActive = 1;
  btnSave.Enabled   := not IsReadOnly;


end;

procedure TfrmService.UpdateData;
begin
  Service.Kode          := edKode.Text;
  Service.Nama          := edNama.Text;
  Service.UOM           := TUOM.CreateID(VarToInt(cxLookupUOM.EditValue));
  Service.Biaya         := crBiaya.Value;
  Service.PPN           := crPPN.Value;
  Service.ModifiedBy    := UserLogin;
  Service.ModifiedDate  := Now();
  Service.IsActive      := 1;

  if not chkActive.Checked then
    Service.IsActive    := 0;


end;

function TfrmService.ValidateData: Boolean;
begin
  Result := False;

  if VarIsNull(cxLookupUOM.EditValue) then
  begin
    TAppUtils.Warning('Satuan wajib diisi');
    cxLookupUOM.SetFocus;
    exit;
  end;

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
