unit ufrmWarehouse;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGroupBox, cxRadioGroup, cxCheckBox,
  cxTextEdit, cxLabel, uSupplier, uWarehouse, Vcl.ExtCtrls, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxStyles,
  cxClasses, dxBarBuiltInMenu, cxPC, cxGridCustomTableView, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxButtonEdit, cxGridLevel, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, Datasnap.DBClient;

type
  TfrmWarehouse = class(TfrmDefaultInput)
    pgcMain: TcxPageControl;
    tsHeader: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxLabel1: TcxLabel;
    edKode: TcxTextEdit;
    cxLabel2: TcxLabel;
    edNama: TcxTextEdit;
    chkActive: TcxCheckBox;
    rbJenis: TcxRadioGroup;
    ckExternal: TcxCheckBox;
    cxLookupCabang: TcxExtLookupComboBox;
    cxLabel3: TcxLabel;
    cxGrid1: TcxGrid;
    cxGrdRak: TcxGridDBTableView;
    colKode: TcxGridDBColumn;
    colNama: TcxGridDBColumn;
    colNO: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ckExternalPropertiesEditValueChanged(Sender: TObject);
    procedure colNOGetDisplayText(Sender: TcxCustomGridTableItem; ARecord:
        TcxCustomGridRecord; var AText: string);
  private
    FCDS: TClientDataset;
    FWarehouse: TWarehouse;
    function GetCDS: TClientDataset;
    function GetWarehouse: TWarehouse;
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    property Warehouse: TWarehouse read GetWarehouse write FWarehouse;
    { Private declarations }
  public
    function GetGroupName: string; override;
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

procedure TfrmWarehouse.ckExternalPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  cxLookupCabang.Enabled := ckExternal.Checked;
  if not ckExternal.Checked then
    cxLookupCabang.Clear;
end;

procedure TfrmWarehouse.colNOGetDisplayText(Sender: TcxCustomGridTableItem;
    ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if ARecord = nil then exit;
  AText := VarToStr(ARecord.RecordIndex + 1);
end;

procedure TfrmWarehouse.FormCreate(Sender: TObject);
begin
  inherited;
  cxLookupCabang.LoadFromSQL('select * from tproject','project_code','project_name', Self);
  Self.AssignKeyDownEvent;
  cxGrdRak.PrepareFromCDS(CDS);
  LoadByID(0);
  pgcMain.ActivePage := tsHeader;
end;

function TfrmWarehouse.GetCDS: TClientDataset;
begin
  if FCDS = nil then
    FCDS := TRack.CreateDataSet(Self);
  Result := FCDS;
end;

function TfrmWarehouse.GetGroupName: string;
begin
  Result := 'Master Data';
end;

function TfrmWarehouse.GetWarehouse: TWarehouse;
begin
  if FWarehouse = nil then
    FWarehouse := TWarehouse.Create;

  Result := FWarehouse;
end;

procedure TfrmWarehouse.LoadByID(aID: Integer; IsReadOnly: Boolean = False);
var
  lRack: TRack;
begin
  if FWarehouse <> nil then FreeAndNil(FWarehouse);
  Warehouse.LoadByID(aID);
  if aID = 0 then
  begin
    Warehouse.IsActive := 1;
  end;

  edKode.Text               := Warehouse.Kode;
  edNama.Text               := Warehouse.Nama;
  rbJenis.ItemIndex         := Warehouse.Jenis;
  chkActive.Checked         := Warehouse.IsActive = 1;
  ckExternal.Checked        := Warehouse.Is_External = 1;
  cxLookupCabang.EditValue  := Warehouse.Project_Code;
  btnSave.Enabled           := not IsReadOnly;

  CDS.EmptyDataSet;
  CDS.DisableControls;
  Try
    for lRack in Warehouse.Racks do
    begin
      CDS.Append;
      lRack.UpdateToDataset(CDS);
      CDS.Post;
    end;
  Finally
    CDS.EnableControls;
  End;

end;

procedure TfrmWarehouse.UpdateData;
var
  lRack: TRack;
begin
  Warehouse.Kode          := edKode.Text;
  Warehouse.Nama          := edNama.Text;
  Warehouse.Jenis         := rbJenis.ItemIndex;
  Warehouse.Is_External   := TApputils.BoolToInt(ckExternal.Checked);
  Warehouse.Project_Code  := VartoStr(cxLookupCabang.EditValue);
  Warehouse.IsActive      := 1;
  Warehouse.Racks.Clear;

  CDS.DisableControls;
  Try
    CDS.First;
    while not CDS.Eof do
    begin
      lRack := TRack.Create;
      lRack.SetFromDataset(CDS);
      Warehouse.Racks.Add(lRack);

      CDS.Next;
    end;
  Finally
    CDS.EnableControls;
  End;
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
