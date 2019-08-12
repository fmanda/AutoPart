unit ufrmKKSO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons,
  cxGroupBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxButtonEdit, cxTextEdit, cxDBExtLookupComboBox, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxMaskEdit, cxCalendar,
  cxMemo, cxLabel, cxGridDBDataDefinitions, uItem, uTransDetail,
  Datasnap.DBClient;

type
  TfrmKKSO = class(TfrmDefaultInput)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edRefno: TcxTextEdit;
    cxLabel6: TcxLabel;
    edNotes: TcxMemo;
    dtSO: TcxDateEdit;
    cxLabel8: TcxLabel;
    cxLabel7: TcxLabel;
    cxLookupWH: TcxExtLookupComboBox;
    edPIC: TcxTextEdit;
    cxLabel2: TcxLabel;
    edRak: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colKode: TcxGridDBColumn;
    colNama: TcxGridDBColumn;
    colUOM: TcxGridDBColumn;
    colKonversi: TcxGridDBColumn;
    colQty: TcxGridDBColumn;
    colItemID: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    colNo: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure colUOMPropertiesCloseUp(Sender: TObject);
    procedure colUOMPropertiesEditValueChanged(Sender: TObject);
    procedure colUOMPropertiesInitPopup(Sender: TObject);
    procedure edRakKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
    procedure colKodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure colKodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure colNoGetDisplayText(Sender: TcxCustomGridTableItem; ARecord:
        TcxCustomGridRecord; var AText: string);
    procedure cxGrdMainEditKeyDown(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift:
        TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
  private
    FCDS: TClientDataset;
    FCDSClone: TClientDataset;
    FCDSUOM: TClientDataset;
    FKKSO: TKKSO;
    function DC: TcxGridDBDataController;
    procedure FocusToGrid;
    function GetCDS: TClientDataset;
    function GetCDSClone: TClientDataset;
    function GetCDSUOM: TClientDataset;
    function GetKKSO: TKKSO;
    procedure InitView;
    procedure LookupItem(aKey: string = '');
    procedure SetItemToGrid(aItem: TItem);
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSClone: TClientDataset read GetCDSClone write FCDSClone;
    property CDSUOM: TClientDataset read GetCDSUOM write FCDSUOM;
    property KKSO: TKKSO read GetKKSO write FKKSO;
    { Private declarations }
  public
    function GetGroupName: string; override;
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = True);
    { Public declarations }
  end;

var
  frmKKSO: TfrmKKSO;

implementation

uses
  uDBUtils, uDXUtils, uAppUtils, cxDataUtils, ufrmCXServerLookup,
  ufrmLookupItem, uWarehouse;

{$R *.dfm}

procedure TfrmKKSO.FormCreate(Sender: TObject);
begin
  inherited;
  InitView;
  Self.AssignKeyDownEvent;
  LoadByID(0, False);
end;

procedure TfrmKKSO.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if KKSO.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmKKSO.colKodePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  sKey: string;
  Edit: TcxCustomEdit;
begin
  inherited;
  Edit := Sender as TcxCustomEdit;
  sKey := VarToStr(Edit.EditingValue);
  LookupItem(sKey);
end;

procedure TfrmKKSO.colKodePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  lItem: TItem;
begin
  inherited;
  lItem := TItem.Create;
  Try
    if lItem.LoadByCode(VarToStr(DisplayValue)) then
      SetItemToGrid(lItem)
    else
    begin
      Error := True;
      ErrorText := 'Kode Barang : ' + VarToStr(DisplayValue) + ' tidak ditemukan';
    end;
  Finally
    lItem.Free;
  End;
end;

procedure TfrmKKSO.colNoGetDisplayText(Sender: TcxCustomGridTableItem; ARecord:
    TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if ARecord = nil then exit;
  AText := VarToStr(ARecord.RecordIndex + 1);
end;

procedure TfrmKKSO.colUOMPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  with TcxExtLookup(colUOM.Properties).DataController.filter do
  begin
    BeginUpdate;
    Root.Clear;
    EndUpdate;
  end;
end;

procedure TfrmKKSO.colUOMPropertiesEditValueChanged(Sender: TObject);
var
  lItemUOM: TItemUOM;
begin
  inherited;

  lItemUOM := TItemUOM.GetItemUOM(
    VarToInt(cxGrdMain.Controller.FocusedRecord.Values[colItemID.Index]),
    VarToInt(cxGrdMain.Controller.FocusedRecord.Values[colUOM.Index])
  );
  if lItemUOM = nil then exit;
  Try
    DC.SetEditValue(colKonversi.Index, lItemUOM.Konversi, evsValue);

    colQty.FocusWithSelection;
    cxGrdMain.Controller.EditingController.ShowEdit;
  Finally
    FreeAndNil(lItemUOM);
  End;
end;

procedure TfrmKKSO.colUOMPropertiesInitPopup(Sender: TObject);
var
  lItem: TItem;
  lItemUOM: TItemUOM;
begin
  inherited;
  if cxGrdMain.Controller.FocusedRecord = nil then exit;
  lItem := TItem.Create;
  Try
    lItem.LoadByID(VarToInt(cxGrdMain.Controller.FocusedRecord.Values[colItemID.Index]));
    with TcxExtLookup(colUOM.Properties).DataController.filter do
    begin
      BeginUpdate;
      Root.Clear;
      Root.BoolOperatorKind := fboOr;

      for lItemUOM in lItem.ItemUOMs do
      begin
        Root.AddItem(
          TcxGridDBTableView(TcxExtLookup(colUOM.Properties).View).GetColumnByFieldName('ID'),
          foEqual, lItemUOM.UOM.ID, '');
      end;
      Active := True;
      EndUpdate;
    end;
  Finally
    lItem.Free;
  End;
end;

procedure TfrmKKSO.cxGrdMainEditKeyDown(Sender: TcxCustomGridTableView; AItem:
    TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if (Key = VK_F5) and (aItem = colKode) then
  begin
    LookupItem(VarToStr(AEdit.EditingValue));
  end;
end;

procedure TfrmKKSO.edRakKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if Key = VK_RETURN then
  begin
    FocusToGrid;
  end;
end;

function TfrmKKSO.DC: TcxGridDBDataController;
begin
  Result := cxGrdMain.DataController;
end;

procedure TfrmKKSO.FocusToGrid;
begin
  cxGrid1.SetFocus;
  cxGrid1.FocusedView := cxGrdMain;
  if cxGrdMain.DataController.RecordCount = 0 then
  begin
    CDS.Append;
    cxGrdMain.Controller.EditingController.ShowEdit;
  end;
end;

procedure TfrmKKSO.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_F1 then
    edRefno.SetFocus;

  if Key = VK_F2 then
  begin
    FocusToGrid;
  end;
end;

function TfrmKKSO.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TKKSOItem.CreateDataSet(Self, False);
    FCDS.AddField('Kode',ftString);
    FCDS.AddField('Nama',ftString);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmKKSO.GetCDSClone: TClientDataset;
begin
  if FCDSClone = nil then
  begin
    FCDSClone := CDS.ClonedDataset(Self);
  end;
  Result := FCDSClone;
end;

function TfrmKKSO.GetCDSUOM: TClientDataset;
begin
  if FCDSUOM = nil then
  begin
    FCDSUOM := TDBUtils.OpenDataset('select id, uom from tuom',Self);
  end;
  Result := FCDSUOM;
end;

function TfrmKKSO.GetGroupName: string;
begin
  Result := 'Inventory';
end;

function TfrmKKSO.GetKKSO: TKKSO;
begin
  if FKKSO = nil then
    FKKSO := TKKSO.Create;
  Result := FKKSO;
end;

procedure TfrmKKSO.InitView;
var
  s: string;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  TcxExtLookup(colUOM.Properties).LoadFromCDS(CDSUOM, 'id', 'uom', ['id'], Self);

  s := 'SELECT A.ID, A.KODE, A.NAMA, B.PROJECT_NAME AS CABANG, A.IS_EXTERNAL'
      +' FROM TWAREHOUSE A'
      +' LEFT JOIN TPROJECT B ON A.PROJECT_CODE = B.PROJECT_CODE'
      +' WHERE ISNULL(A.IS_EXTERNAL,0) = 0';

  cxLookupWH.Properties.LoadFromSQL(Self,s,'nama');
end;

procedure TfrmKKSO.LoadByID(aID: Integer; IsReadOnly: Boolean = True);
var
  lItem: TKKSOItem;
begin
  if FKKSO <> nil then
    FreeAndNil(FKKSO);

  KKSO.LoadByID(aID);

  //def uom
  if aID = 0 then
  begin
    KKSO.TransDate := Now();
    KKSO.RefNo := KKSO.GenerateNo;
  end;

  if (aID > 0) and (not IsReadOnly) then
  begin
    if KKSO.StockOpname <> nil then
    begin
      if KKSO.StockOpname.ID > 0 then
      begin
        TAppUtils.Warning('KKSO sudah diproses stock opname, tidak bisa diedit lagi');
        IsReadOnly := True;
      end;
    end;
  end;


  edRefno.Text := KKSO.RefNo;
  dtSO.Date := KKSO.TransDate;
  edNotes.Text := KKSO.Notes;
  edPIC.Text := KKSO.PIC;
  edRak.Text := KKSO.Rak;

  if KKSO.Warehouse <> nil then
    cxLookupWH.EditValue := KKSO.Warehouse.ID;
  CDS.EmptyDataSet;


  for lItem in KKSO.Items do
  begin
    CDS.Append;
    lItem.UpdateToDataset(CDS);
    lItem.Item.ReLoad(False);
    CDS.FieldByName('Kode').AsString := lItem.Item.Kode;
    CDS.FieldByName('Nama').AsString := lItem.Item.Nama;
    CDS.Post;
  end;
  btnSave.Enabled := not IsReadOnly;
end;

procedure TfrmKKSO.LookupItem(aKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  lItem: TItem;
  s: string;
begin
  lItem  := TItem.Create;
  Try
    s := 'SELECT A.ID, A.KODE, A.NAMA, D.NAMA AS MERK, A.RAK, B.UOM AS UOMSTOCK,'
        +' C.PRICELIST, C.HARGAJUAL1 AS HARGAUMUM, C.HARGAJUAL2 AS HARGABENGKEL,'
        +' C.HARGAJUAL3 AS HARGAGROSIR, C.HARGAJUAL4 AS HARGAKELILING'
        +' FROM TITEM A'
        +' INNER JOIN TUOM B ON A.STOCKUOM_ID = B.ID'
        +' LEFT JOIN TITEMUOM C ON A.ID = C.ITEM_ID AND C.UOM_ID = B.ID'
        +' LEFT JOIN TMERK D ON A.MERK_ID = C.ID';

    cxLookup := TfrmLookupItem.Execute(S,'ID');
    if aKey <> '' then
      cxLookup.PreFilter('Nama', aKey)
    else
      cxLookup.cxGrdMain.GetColumnByFieldName('NAMA').Focused := True;
    try
      if cxLookup.ShowModal = mrOK then
      begin
        lItem.LoadByID(cxLookup.FieldValue('ID'));
        SetItemToGrid(lItem);
      end;
    finally
      cxLookup.Free;
    end;
  Finally
    FreeAndNil(lItem);
  End;
end;

procedure TfrmKKSO.SetItemToGrid(aItem: TItem);
var
  lItemUOM: TItemUOM;
begin
  if VarToInt(cxLookupWH.EditValue) = 0 then
    raise Exception.Create('Gudang belum dipilih');

  if aItem = nil then exit;

  DC.SetEditValue(colItemID.Index, aItem.ID, evsValue);
//  DC.SetEditValue(colItemObject, Integer(aItem), evsValue);
  DC.SetEditValue(colKode.Index, aItem.Kode, evsValue);
  DC.SetEditValue(colNama.Index, aItem.Nama, evsValue);
  DC.SetEditValue(colUOM.Index, 0, evsValue);
  DC.SetEditValue(colQty.Index, 0, evsValue);
  DC.SetEditValue(colKonversi.Index, 0, evsValue);

  //def uom
  if aItem.StockUOM <> nil then
  begin
    DC.SetEditValue(colUOM.Index, aItem.StockUOM.ID, evsValue);
//    colUOMPropertiesEditValueChanged(nil);
    lItemUOM := TItemUOM.GetItemUOM(
      VarToInt(cxGrdMain.Controller.FocusedRecord.Values[colItemID.Index]),
      VarToInt(cxGrdMain.Controller.FocusedRecord.Values[colUOM.Index])
    );
    if lItemUOM = nil then exit;
    Try
      DC.SetEditValue(colKonversi.Index, lItemUOM.Konversi, evsValue);
    Finally
      FreeAndNil(lItemUOM);
    End;
  end else
  begin
    raise Exception.Create('Satuan Stock atas Item : '+ aItem.Nama + ' belum didefinisikan') ;
  end;
end;

procedure TfrmKKSO.UpdateData;
var
  lItem: TKKSOItem;
begin
  KKSO.RefNo := edRefno.Text;
  KKSO.TransDate := dtSO.Date;
  KKSO.Notes := edNotes.Text;
  KKSO.ModifiedDate := Now();
  KKSO.ModifiedBy := UserLogin;
  KKSO.PIC := edPIC.Text;
  KKSO.Rak := edRak.Text;

  if KKSO.Warehouse = nil then
    KKSO.Warehouse := TWarehouse.Create;

  KKSO.Warehouse.LoadByID(VarToInt(cxLookupWH.EditValue));
  KKSO.Items.Clear;


  CDS.First;
  while not CDS.Eof do
  begin
    lItem := TKKSOItem.Create;
    lItem.SetFromDataset(CDS);
    KKSO.Items.Add(lItem);
    CDS.Next;
  end;
end;

function TfrmKKSO.ValidateData: Boolean;
begin
  Result := False;

  if VarToInt(cxLookupWH.EditValue) = 0 then
  begin
    TAppUtils.Warning('Gudang tidak boleh kosong');
    exit;
  end;

  if cxGrdMain.DataController.RecordCount = 0 then
  begin
    TAppUtils.Warning('Data Item tidak boleh kosong');
    exit;
  end;

  if CDS.Locate('Item', null, []) or CDS.Locate('Item', 0, []) then
  begin
    TAppUtils.Warning('Item tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;

  if CDS.Locate('UOM', null, []) or CDS.Locate('UOM', 0, []) then
  begin
    TAppUtils.Warning('Satuan tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;


  Result := TAppUtils.Confirm('Anda yakin data sudah sesuai?');
end;

end.
