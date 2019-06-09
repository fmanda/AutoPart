unit ufrmItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGroupBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxGridLevel,
  cxGrid, cxMemo, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxTextEdit, cxLabel, cxCurrencyEdit, dxBarBuiltInMenu,
  cxPC, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, Datasnap.DBClient, uItem;

type
  TfrmItem = class(TfrmDefaultInput)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edKode: TcxTextEdit;
    cxLabel2: TcxLabel;
    edNama: TcxTextEdit;
    cxLookupGroup: TcxExtLookupComboBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLookupMerk: TcxExtLookupComboBox;
    cxLabel5: TcxLabel;
    edRak: TcxTextEdit;
    cxLabel6: TcxLabel;
    edNotes: TcxMemo;
    crPPN: TcxCurrencyEdit;
    cxLabel7: TcxLabel;
    btnDel: TcxButton;
    btnAdd: TcxButton;
    cxPageControl1: TcxPageControl;
    tsUOM: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGrdUOM: TcxGridDBBandedTableView;
    colSatuan: TcxGridDBBandedColumn;
    colKonversi: TcxGridDBBandedColumn;
    colHrgBeli: TcxGridDBBandedColumn;
    colMargin1: TcxGridDBBandedColumn;
    colHrgJual1: TcxGridDBBandedColumn;
    colMargin2: TcxGridDBBandedColumn;
    clHrgJual2: TcxGridDBBandedColumn;
    colMargin3: TcxGridDBBandedColumn;
    colHrgJual3: TcxGridDBBandedColumn;
    colMargin4: TcxGridDBBandedColumn;
    colHrgJual4: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    tsHistory: TcxTabSheet;
    lbModifiedBy: TcxLabel;
    edModifiedBy: TcxTextEdit;
    lbModified: TcxLabel;
    dtModified: TcxDateEdit;
    cxStyleRepository1: TcxStyleRepository;
    styleMoney: TcxStyle;
    styleInfoBk: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure edRakKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
  private
    FCDS: TClientDataset;
    FCDSUOM: TClientDataset;
    FItem: TItem;
    function GetCDS: TClientDataset;
    function GetCDSUOM: TClientDataset;
    function GetItem: TItem;
    procedure InitView;
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSUOM: TClientDataset read GetCDSUOM write FCDSUOM;
    property Item: TItem read GetItem write FItem;
    { Private declarations }
  public
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = True);
    { Public declarations }
  end;

var
  frmItem: TfrmItem;

implementation

uses
  uDBUtils, uDXUtils, uAppUtils;

{$R *.dfm}

procedure TfrmItem.btnAddClick(Sender: TObject);
var
  iRec: Integer;
begin
  inherited;
  iRec := cxGrdUOM.DataController.AppendRecord;
  cxGrdUOM.DataController.FocusedRecordIndex  := iRec;
  colSatuan.Focused := True;
//  cxGrdUOM.Focused := True;
  cxGrid1.SetFocus;
  cxGrid1.FocusedView := cxGrdUOM;
end;

procedure TfrmItem.btnDelClick(Sender: TObject);
begin
  inherited;
  if not CDSUOM.EOf then
    CDSUOM.Delete;
end;

procedure TfrmItem.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if Item.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmItem.edRakKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    cxGrid1.SetFocus;
end;

procedure TfrmItem.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  initView;
end;

function TfrmItem.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TItemUOM.CreateDataSet(Self, False);
    FCDS.AddField('Margin1',ftFloat);
    FCDS.AddField('Margin2',ftFloat);
    FCDS.AddField('Margin3',ftFloat);
    FCDS.AddField('Margin4',ftFloat);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmItem.GetCDSUOM: TClientDataset;
begin
  if FCDSUOM = nil then
    FCDSUOM := TDBUtils.OpenDataset(
        'select id, uom from tuom', Self
      );
  Result := FCDSUOM;
end;

function TfrmItem.GetItem: TItem;
begin
  if FItem = nil then
    FItem := TItem.Create;

  Result := FItem;
end;

procedure TfrmItem.InitView;
begin
  cxGrdUOM.PrepareFromCDS(CDS);
  cxLookupGroup.LoadFromSQL('select id, nama from titemgroup','id','nama',Self);
  cxLookupMerk.LoadFromSQL('select id, nama from tmerk','id','nama',Self);
  TcxExtLookup(colSatuan.Properties).LoadFromCDS(CDSUOM, 'id','uom', Self);
  LoadByID(0);
end;

procedure TfrmItem.LoadByID(aID: Integer; IsReadOnly: Boolean = True);
var
  lItemUOM: TItemUOM;
begin
  if FItem <> nil then
    FreeAndNil(FItem);

  Item.LoadByID(aID);

  //def uom
  if aID = 0 then
  begin
    CDSUOM.First;
    if not CDSUOM.Eof then
    begin
      lItemUOM      := TItemUOM.Create;
      lItemUOM.UOM  := TUOM.CreateID(CDSUOM.FieldByName('ID').AsInteger);
      lItemUOM.Konversi := 1;
      FItem.ItemUOMs.Add(lItemUOM);
    end;
  end;

  edKode.Text   := Item.Kode;
  edNama.Text   := Item.Nama;
  edNotes.Text  := Item.Notes;
  edRak.Text    := Item.Rak;

  if Item.Merk <> nil then
    cxLookupMerk.EditValue := Item.Merk.Id;

  if Item.Group <> nil then
    cxLookupGroup.EditValue := Item.Group.ID;

  CDS.EmptyDataSet;
  for lItemUOM in Item.ItemUOMs do
  begin
    CDS.Append;
    lItemUOM.UpdateToDataset(CDS);
    CDS.Post;
  end;

  btnSave.Enabled := not IsReadOnly;
  btnAdd.Enabled  := not IsReadOnly;
  btnDel.Enabled  := not IsReadOnly;


end;

procedure TfrmItem.UpdateData;
var
  lUOM: TItemUOM;
begin
  Item.Kode := edKode.Text;
  Item.Nama := edNama.Text;
  Item.Group.Free;
  Item.Merk.Free;
  Item.Rak  := edRak.Text;

  if not VarIsNull(cxLookupGroup.EditValue) then
    Item.Group := TItemGroup.CreateID(VarToInt(cxLookupGroup.EditValue));

  if not VarIsNull(cxLookupMerk.EditValue) then
    Item.Merk := TMerk.CreateID(VarToInt(cxLookupMerk.EditValue));

  Item.Notes := edNotes.Text;

  Item.ModifiedBy := UserLogin;
  Item.PPN := crPPN.Value;
  Item.ModifiedDate := Now();
  Item.ItemUOMs.Clear;

  CDS.First;
  while not CDS.Eof do
  begin
    lUOM := TItemUOM.Create;
    lUOM.SetFromDataset(CDS);
    Item.ItemUOMs.Add(lUOM);
    CDS.Next;
  end;


end;

function TfrmItem.ValidateData: Boolean;
begin
  Result := False;

  if VarIsNull(cxLookupGroup.EditValue) then
  begin
    TAppUtils.Warning('Group wajib diisi');
    cxLookupGroup.SetFocus;
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

  if CDS.RecordCount = 0 then
  begin
    TAppUtils.Warning('Data Satuan tidak boleh kosong');
    exit;
  end;

  if CDS.Locate('HargaBeli', 0, []) then
  begin
    TAppUtils.Warning('Harga Beli tidak boleh 0');
    exit;
  end;

  CDS.First;
  while not CDS.Eof do
  begin
    if CDS.FieldByName('Konversi').AsFloat <=0 then
    begin
      TAppUtils.Warning('Konversi tidak boleh <= 0');
      exit;
    end;

    CDS.Next;
  end;


  Result := True;

end;

end.
