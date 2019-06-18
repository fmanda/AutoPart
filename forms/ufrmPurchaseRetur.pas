unit ufrmPurchaseRetur;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons, cxGroupBox, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB,
  cxDBData, cxButtonEdit, cxTextEdit, cxDBExtLookupComboBox, cxCurrencyEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxMaskEdit, cxCalendar, cxMemo, cxLabel, uTransDetail,
  Datasnap.DBClient, cxRadioGroup, uItem, cxGridDBDataDefinitions, cxDataUtils;

type
  TfrmPurchaseRetur = class(TfrmDefaultInput)
    Label2: TLabel;
    Label1: TLabel;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edNoInv: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel6: TcxLabel;
    edNotes: TcxMemo;
    dtRetur: TcxDateEdit;
    cxLabel8: TcxLabel;
    edInv: TcxButtonEdit;
    crSubTotal: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    crPPN: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    crTotal: TcxCurrencyEdit;
    cxLabel7: TcxLabel;
    cxLookupGudang: TcxExtLookupComboBox;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colKode: TcxGridDBColumn;
    colNama: TcxGridDBColumn;
    colUOM: TcxGridDBColumn;
    colQty: TcxGridDBColumn;
    colHrgBeli: TcxGridDBColumn;
    colDisc: TcxGridDBColumn;
    colSubTotal: TcxGridDBColumn;
    colWarehouse: TcxGridDBColumn;
    colItemID: TcxGridDBColumn;
    colKonversi: TcxGridDBColumn;
    colPPN: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxLabel9: TcxLabel;
    edSupp: TcxTextEdit;
    dtInvoice: TcxDateEdit;
    cxLabel11: TcxLabel;
    rbJenis: TcxRadioGroup;
    procedure edInvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edInvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure colKodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxGrdMainEditKeyDown(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift:
        TShiftState);
    procedure colUOMPropertiesCloseUp(Sender: TObject);
    procedure colUOMPropertiesEditValueChanged(Sender: TObject);
    procedure colUOMPropertiesInitPopup(Sender: TObject);
    procedure colKodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    FCDS: TClientDataset;
    FCDSClone: TClientDataset;
    FCDSUOM: TClientDataset;
    FPurchRetur: TPurchaseRetur;
    procedure CalculateAll;
    procedure CDSAfterInsert(DataSet: TDataSet);
    function DC: TcxGridDBDataController;
    procedure FocusToGrid;
    function GetCDS: TClientDataset;
    function GetCDSClone: TClientDataset;
    function GetCDSUOM: TClientDataset;
    function GetPurchRetur: TPurchaseRetur;
    procedure InitView;
    procedure LookupInvoice(sKey: string = '');
    procedure LookupItem(aKey: string = '');
    procedure SetItemToGrid(aItem: TItem);
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSClone: TClientDataset read GetCDSClone write FCDSClone;
    property CDSUOM: TClientDataset read GetCDSUOM write FCDSUOM;
    property PurchRetur: TPurchaseRetur read GetPurchRetur write FPurchRetur;
    { Private declarations }
  public
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean);
    { Public declarations }
  end;

var
  frmPurchaseRetur: TfrmPurchaseRetur;

implementation

uses
  uDBUtils, uDXUtils, uAppUtils, Strutils, ufrmCXServerLookup,
  System.DateUtils, uSupplier;

{$R *.dfm}

procedure TfrmPurchaseRetur.CalculateAll;
var
  dPPN: Double;
  dSubTotal: Double;
begin
  if CDS.State in [dsInsert, dsEdit] then
    CDS.Post;

  CDS.DisableControls;
//  DisableTrigger := True;
  Try
    dSubTotal := 0;
    dPPN := 0;

    CDSClone.First;
    while not CDSClone.Eof do
    begin
      CDSClone.Edit;
      CDSClone.FieldByName('SubTotal').AsFloat :=
        (CDSClone.FieldByName('Harga').AsFloat - CDSClone.FieldByName('Discount').AsFloat)
        * CdSClone.FieldByName('QTY').AsFloat;
      dSubTotal := dSubTotal +  CDSClone.FieldByName('SubTotal').AsFloat;
      dPPN :=  dPPN + (CDSClone.FieldByName('PPN').AsFloat * CDSClone.FieldByName('SubTotal').AsFloat / 100);

      CDSClone.Post;
      CDSClone.Next;
    end;

    crSubTotal.Value  := dSubTotal;
    crPPN.Value       := dPPN;
    crTotal.Value     := crSubTotal.Value + crPPN.Value;
  Finally
    CDS.EnableControls;
//    DisableTrigger := False;
  End;
end;

procedure TfrmPurchaseRetur.FormCreate(Sender: TObject);
begin
  inherited;
  InitView;
  Self.AssignKeyDownEvent;
  LoadByID(0, False);
end;

procedure TfrmPurchaseRetur.CDSAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('Warehouse').AsInteger := VarToInt(cxLookupGudang.EditValue);
end;

procedure TfrmPurchaseRetur.colKodePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  LookupItem();
end;

procedure TfrmPurchaseRetur.colKodePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  lDetail: TTransDetail;
  lFound: Boolean;
  lItem: TItem;
begin
  inherited;
  if PurchRetur.Invoice = nil then
  begin
    TAppUtils.Warning('Nomor Faktur belum dipilih');
    exit;
  end;

  if PurchRetur.Invoice.ID = 0 then
  begin
    TAppUtils.Warning('Nomor Faktur belum dipilih');
    exit;
  end;

  lItem := TItem.Create;
  Try
    if lItem.LoadByCode(VarToStr(DisplayValue)) then
    begin
      //find item
      if PurchRetur.Invoice.Items.Count = 0 then
        PurchRetur.Invoice.ReLoad(True);

      lFound := False;
      for lDetail in PurchRetur.Invoice.Items do
      begin
        lFound := lDetail.Item.ID = lItem.ID;
        if lFound then break;
      end;

      if not lFound then
      begin        
        Error := True;
        ErrorText := 'Kode Barang ' + VarToStr(DisplayValue)
          + ' tidak ditemukan di faktur pembelian';
//        exit;        
      end;                                        

      SetItemToGrid(lItem);
    end
    else
    begin
      Error := True;
      ErrorText := 'Kode Barang : ' + VarToStr(DisplayValue) + ' tidak ditemukan';
    end;
  Finally
    lItem.Free;
  End;
end;

procedure TfrmPurchaseRetur.colUOMPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  with TcxExtLookup(colUOM.Properties).DataController.filter do
  begin
    BeginUpdate;
    Root.Clear;
    EndUpdate;
  end;
end;

procedure TfrmPurchaseRetur.colUOMPropertiesEditValueChanged(Sender: TObject);
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
    DC.SetEditValue(colHrgBeli.Index, lItemUOM.HargaBeli, evsValue);

    CalculateAll;
    colQty.FocusWithSelection;
    cxGrdMain.Controller.EditingController.ShowEdit;
  Finally
    FreeAndNil(lItemUOM);
  End;

end;

procedure TfrmPurchaseRetur.colUOMPropertiesInitPopup(Sender: TObject);
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

procedure TfrmPurchaseRetur.cxGrdMainEditKeyDown(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit:
    TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) and (aItem = colKode) then
  begin
    LookupItem(VarToStr(AEdit.EditingValue));
  end;
end;

function TfrmPurchaseRetur.DC: TcxGridDBDataController;
begin
  Result := cxGrdMain.DataController;
end;

procedure TfrmPurchaseRetur.edInvKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
var
  Edit: TcxCustomEdit;
  sKey: string;
begin
  inherited;
  if Key = VK_F5 then
  begin
    Edit := Sender as TcxCustomEdit;
    sKey := VarToStr(Edit.EditingValue);
    LookupInvoice(sKey);
  end else if Key = VK_RETURN then
  begin
    SelectNext(Screen.ActiveControl, True, True);
  end;
end;

procedure TfrmPurchaseRetur.edInvPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  LookupInvoice;
end;

procedure TfrmPurchaseRetur.FocusToGrid;
begin
  cxGrid1.SetFocus;
  cxGrid1.FocusedView := cxGrdMain;
  if CDS.RecordCount = 0 then
  begin
    CDS.Append;
    cxGrdMain.Controller.EditingController.ShowEdit;
  end;
end;

procedure TfrmPurchaseRetur.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
   if Key = VK_F1 then
    edNoInv.SetFocus;

  if Key = VK_F2 then
  begin
    FocusToGrid;
  end;
end;

function TfrmPurchaseRetur.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TTransDetail.CreateDataSet(Self, False);
    FCDS.AddField('Kode',ftString);
    FCDS.AddField('Nama',ftString);
    FCDS.AddField('SubTotal',ftFloat);
    FCDS.AfterInsert := CDSAfterInsert;
//    FCDS.AfterPost := CDSAfterPost;
//    FCDS.AddField('ItemObject',ftInteger);
    FCDS.CreateDataSet;
//    DisableTrigger := False;
  end;
  Result := FCDS;
end;

function TfrmPurchaseRetur.GetCDSClone: TClientDataset;
begin
  if FCDSClone = nil then
  begin
    FCDSClone := CDS.ClonedDataset(Self);
  end;
  Result := FCDSClone;
end;

function TfrmPurchaseRetur.GetCDSUOM: TClientDataset;
begin
  if FCDSUOM = nil then
  begin
    FCDSUOM := TDBUtils.OpenDataset('select id, uom from tuom',Self);
  end;
  Result := FCDSUOM;
end;

function TfrmPurchaseRetur.GetPurchRetur: TPurchaseRetur;
begin
  if FPurchRetur = nil then
    FPurchRetur := TPurchaseRetur.Create;
  Result := FPurchRetur;
end;

procedure TfrmPurchaseRetur.InitView;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  TcxExtLookup(colWarehouse.Properties).LoadFromSQL(Self,
    'select id, nama from twarehouse','nama');
  TcxExtLookup(colUOM.Properties).LoadFromCDS(CDSUOM, 'id', 'uom', ['id'], Self);
  cxLookupGudang.Properties.LoadFromSQL(Self,
    'select id, nama from twarehouse','nama');

  cxLookupGudang.SetDefaultValue();
end;

procedure TfrmPurchaseRetur.LoadByID(aID: Integer; IsReadOnly: Boolean);
var
  lItem: TTransDetail;
begin
  if FPurchRetur <> nil then
    FreeAndNil(FPurchRetur);

  PurchRetur.LoadByID(aID);

  //def uom
  if aID = 0 then
  begin
    PurchRetur.TransDate  := Now();
    PurchRetur.ReturFlag  := 0;
    PurchRetur.Refno      := PurchRetur.GenerateNo;
  end;

  edNoInv.Text  := PurchRetur.Refno;
  rbJenis.ItemIndex := PurchRetur.ReturFlag;
  crSubTotal.Value := PurchRetur.SubTotal;
  crPPN.Value := PurchRetur.PPN;
  crTotal.Value := PurchRetur.Amount;
  edNotes.Text := PurchRetur.Notes;
  dtRetur.Date  := PurchRetur.TransDate;

  edNoInv.Text := '';
  edSupp.Text := '';
  dtInvoice.Clear;
  if PurchRetur.Invoice <> nil then
  begin
    PurchRetur.Invoice.ReLoad(False);
    edInv.Text      := PurchRetur.Invoice.InvoiceNo;
    dtInvoice.Date  := PurchRetur.Invoice.TransDate;
  end;

  if PurchRetur.Supplier <> nil then
  begin
    PurchRetur.Supplier.ReLoad(False);
    edSupp.Text := PurchRetur.Supplier.Nama;
  end;

  if PurchRetur.Warehouse <> nil then
    cxLookupGudang.EditValue := PurchRetur.Warehouse.ID;


  for lItem in PurchRetur.Items do
  begin
    CDS.Append;
    lItem.UpdateToDataset(CDS);
    lItem.Item.ReLoad(False);
    CDS.FieldByName('Kode').AsString := lItem.Item.Kode;
    CDS.FieldByName('Nama').AsString := lItem.Item.Nama;

    CDS.Post;
  end;
  CalculateAll;
  btnSave.Enabled := not IsReadOnly;
end;

procedure TfrmPurchaseRetur.LookupInvoice(sKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  S: string;
begin
  S := 'SELECT A.ID, A.INVOICENO, A.TRANSDATE AS TANGGAL,'
      +' B.NAMA AS SUPPLIER, A.AMOUNT AS TOTAL, C.NAMA AS GUDANG'
      +' FROM TPURCHASEINVOICE A'
      +' INNER JOIN TSUPPLIER B ON A.SUPPLIER_ID = B.ID'
      +' INNER JOIN TWAREHOUSE C ON A.WAREHOUSE_ID = C.ID'
      +' WHERE A.TRANSDATE BETWEEN :startdate AND :enddate';

  cxLookup := TfrmCXServerLookup.Execute(S, 'ID', StartOfTheMonth(Now()), EndOfTheMonth(Now()) );
  Try
    cxLookup.PreFilter('INVOICENO', sKey);
    if cxLookup.ShowModal = mrOK then
    begin
      if PurchRetur.Invoice = nil then
        PurchRetur.Invoice := TPurchaseInvoice.Create;
      if PurchRetur.Supplier = nil then
        PurchRetur.Supplier := TSupplier.Create;

      PurchRetur.Invoice.LoadByID(cxLookup.FieldValue('id'));
      PurchRetur.Supplier.LoadByID(PurchRetur.Invoice.Supplier.ID);

      edInv.Text := PurchRetur.Invoice.InvoiceNo;
      dtInvoice.Date := PurchRetur.Invoice.TransDate;
      edSupp.Text := PurchRetur.Supplier.Nama;
      cxLookupGudang.EditValue := PurchRetur.Invoice.Warehouse.ID;

      CDS.EmptyDataSet;
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmPurchaseRetur.LookupItem(aKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  lItem: TItem;
  s: string;
//  sKey: string;
begin

  if PurchRetur.Invoice = nil then
  begin
    TAppUtils.Warning('Nomor Faktur belum dipilih');
    exit;
  end;

  if PurchRetur.Invoice.ID = 0 then
  begin
    TAppUtils.Warning('Nomor Faktur belum dipilih');
    exit;
  end;

  lItem  := TItem.Create;
  Try
    s := 'SELECT distinct A.ID, A.KODE, A.NAMA, C.NAMA AS MERK, B.NAMA AS ITEMGROUP, A.RAK'
        +' FROM TITEM A'
        +' LEFT JOIN TITEMGROUP B ON A.GROUP_ID = B.ID'
        +' LEFT JOIN TMERK C ON A.MERK_ID = C.ID'
        +' INNER JOIN TTRANSDETAIL D ON D.HEADER_FLAG = ' + IntToStr(HeaderFlag_PurchaseInvoice)
        +' AND D.ITEM_ID = A.ID AND D.HEADER_ID = ' + IntToStr(PurchRetur.Invoice.ID);

    cxLookup := TfrmCXServerLookup.Execute(S,'ID');
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

procedure TfrmPurchaseRetur.SetItemToGrid(aItem: TItem);
var
  lItemUOM: TItemUOM;
begin
  if aItem = nil then exit;

  DC.SetEditValue(colItemID.Index, aItem.ID, evsValue);
//  DC.SetEditValue(colItemObject, Integer(aItem), evsValue);
  DC.SetEditValue(colKode.Index, aItem.Kode, evsValue);
  DC.SetEditValue(colNama.Index, aItem.Nama, evsValue);
  DC.SetEditValue(colUOM.Index, 0, evsValue);
  DC.SetEditValue(colQty.Index, 0, evsValue);
  DC.SetEditValue(colKonversi.Index, 0, evsValue);
  DC.SetEditValue(colHrgBeli.Index, 0, evsValue);
  DC.SetEditValue(colDisc.Index, 0, evsValue);
  DC.SetEditValue(colSubTotal.Index, 0, evsValue);
  DC.SetEditValue(colPPN.Index, aItem.PPN, evsValue);

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
      DC.SetEditValue(colHrgBeli.Index, lItemUOM.HargaBeli, evsValue);
    Finally
      FreeAndNil(lItemUOM);
    End;
  end;
end;

end.
