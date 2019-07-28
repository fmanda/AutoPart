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
  Datasnap.DBClient, cxRadioGroup, uItem, cxGridDBDataDefinitions, cxDataUtils,
  cxCheckBox;

type
  TfrmPurchaseRetur = class(TfrmDefaultInput)
    Label2: TLabel;
    Label1: TLabel;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edNoRetur: TcxTextEdit;
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
    colPriceList: TcxGridDBColumn;
    colDisc: TcxGridDBColumn;
    colSubTotal: TcxGridDBColumn;
    colWarehouse: TcxGridDBColumn;
    colItemID: TcxGridDBColumn;
    colKonversi: TcxGridDBColumn;
    colPPN: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxLabel9: TcxLabel;
    dtInvoice: TcxDateEdit;
    cxLabel11: TcxLabel;
    rbJenis: TcxRadioGroup;
    edSupp: TcxButtonEdit;
    ckReferensiFaktur: TcxCheckBox;
    cxMemo1: TcxMemo;
    colNo: TcxGridDBColumn;
    colHrgBeli: TcxGridDBColumn;
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
    procedure colQtyPropertiesEditValueChanged(Sender: TObject);
    procedure colDiscPropertiesEditValueChanged(Sender: TObject);
    procedure rbJenisPropertiesEditValueChanged(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edNotesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edSuppKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edSuppPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ckReferensiFakturPropertiesEditValueChanged(Sender: TObject);
    procedure colNoGetDisplayText(Sender: TcxCustomGridTableItem; ARecord:
        TcxCustomGridRecord; var AText: string);
    procedure btnPrintClick(Sender: TObject);
  private
    FCDS: TClientDataset;
    FCDSValidate: TClientDataset;
    FCDSClone: TClientDataset;
    FCDSUOM: TClientDataset;
    FDisableEvent: Boolean;
    FPurchRetur: TPurchaseRetur;
    procedure CalculateAll;
    procedure CDSAfterDelete(DataSet: TDataSet);
    procedure CDSAfterInsert(DataSet: TDataSet);
    function DC: TcxGridDBDataController;
    procedure FocusToGrid;
    function GetCDS: TClientDataset;
    function GetCDSValidate: TClientDataset;
    function GetCDSClone: TClientDataset;
    function GetCDSUOM: TClientDataset;
    function GetPurchRetur: TPurchaseRetur;
    procedure InitView;
    procedure LoadAllInvoiceItem;
    procedure LookupInvoice(sKey: string = '');
    procedure LookupItem(aKey: string = '');
    procedure LookupSupplier(sKey: string = '');
    procedure SetItemToGrid(aItem: TItem);
    procedure UpdateData;
    function ValidateData: Boolean;
    function ValidateItem: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSValidate: TClientDataset read GetCDSValidate write FCDSValidate;
    property CDSClone: TClientDataset read GetCDSClone write FCDSClone;
    property CDSUOM: TClientDataset read GetCDSUOM write FCDSUOM;
    property DisableEvent: Boolean read FDisableEvent write FDisableEvent;
    property PurchRetur: TPurchaseRetur read GetPurchRetur write FPurchRetur;
    { Private declarations }
  public
    function GetGroupName: string; override;
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean);
    { Public declarations }
  end;

var
  frmPurchaseRetur: TfrmPurchaseRetur;

implementation

uses
  uDBUtils, uDXUtils, uAppUtils, Strutils, ufrmCXServerLookup,
  System.DateUtils, uSupplier, ufrmCXMsgInfo, uWarehouse;

{$R *.dfm}

procedure TfrmPurchaseRetur.btnPrintClick(Sender: TObject);
begin
  inherited;
  TPurchaseRetur.PrintData(PurchRetur.ID);
end;

procedure TfrmPurchaseRetur.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if PurchRetur.SaveRepeat(False) then
  begin
    btnPrint.Click;
//    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

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
      CDSClone.FieldByName('Harga').AsFloat :=
        (1 - (CDSClone.FieldByName('DiscP').AsFloat /100))
        * CDSClone.FieldByName('PriceList').AsFloat;


      CDSClone.FieldByName('SubTotal').AsFloat :=
        CDSClone.FieldByName('Harga').AsFloat * CdSClone.FieldByName('QTY').AsFloat;
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

procedure TfrmPurchaseRetur.CDSAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmPurchaseRetur.FormCreate(Sender: TObject);
begin
  inherited;
  InitView;
  Self.AssignKeyDownEvent;
  LoadByID(0, False);
  DisableEvent := False;
end;

procedure TfrmPurchaseRetur.CDSAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('Warehouse').AsInteger := VarToInt(cxLookupGudang.EditValue);
end;

procedure TfrmPurchaseRetur.ckReferensiFakturPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  edInv.Enabled := ckReferensiFaktur.Checked;
  dtInvoice.Enabled := ckReferensiFaktur.Checked;
  if not DisableEvent then
  begin
    if not ckReferensiFaktur.Checked then
    begin
      PurchRetur.ClearInvoice;
      edInv.Clear;
      dtInvoice.Clear;
    end;
  end;
end;

procedure TfrmPurchaseRetur.colDiscPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalculateAll;
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
  if ckReferensiFaktur.Checked then
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
  end;

  lItem := TItem.Create;
  Try
    if lItem.LoadByCode(VarToStr(DisplayValue)) then
    begin
      //find item
      if ckReferensiFaktur.Checked then
      begin

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

procedure TfrmPurchaseRetur.colNoGetDisplayText(Sender: TcxCustomGridTableItem;
    ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if ARecord = nil then exit;
  AText := VarToStr(ARecord.RecordIndex + 1);
end;

procedure TfrmPurchaseRetur.colQtyPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalculateAll;
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
    DC.SetEditValue(colPriceList.Index, lItemUOM.PriceList, evsValue);
    DC.SetEditValue(colDisc.Index, lItemUOM.GetPriceListMargin(0), evsValue);

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

procedure TfrmPurchaseRetur.edNotesKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    FocusToGrid;
  end;
end;

procedure TfrmPurchaseRetur.edSuppKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
var
  Edit: TcxCustomEdit;
  sKey: string;
begin
  inherited;
  if Key = VK_F5 then
  begin
    Edit := Sender as TcxCustomEdit;
    sKey := VarToStr(Edit.EditingValue);
    LookupSupplier(sKey);
  end else if Key = VK_RETURN then
  begin
    SelectNext(Screen.ActiveControl, True, True);
  end;
end;

procedure TfrmPurchaseRetur.edSuppPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  LookupSupplier();
end;

procedure TfrmPurchaseRetur.FocusToGrid;
begin
  cxGrid1.SetFocus;
  cxGrid1.FocusedView := cxGrdMain;
  if CDS.RecordCount = 0 then
  begin
    CDS.Append;
    colKode.FocusWithSelection;
    cxGrdMain.Controller.EditingController.ShowEdit;
  end;
end;

procedure TfrmPurchaseRetur.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
   if Key = VK_F1 then
    edInv.SetFocus;

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
    FCDS.AddField('DiscP',ftFloat);
    FCDS.AfterInsert := CDSAfterInsert;
    FCDS.AfterDelete := CDSAfterDelete;
//    FCDS.AfterPost := CDSAfterPost;
//    FCDS.AddField('ItemObject',ftInteger);
    FCDS.CreateDataSet;
//    DisableTrigger := False;
  end;
  Result := FCDS;
end;

function TfrmPurchaseRetur.GetCDSValidate: TClientDataset;
begin
  if FCDSValidate = nil then
  begin
    FCDSValidate := TClientDataSet.Create(Self);
    FCDSValidate.AddField('ItemID',ftInteger);
    FCDSValidate.AddField('Kode',ftString);
    FCDSValidate.AddField('Nama',ftString);
    FCDSValidate.AddField('TotalPCS_Faktur',ftFloat);
    FCDSValidate.AddField('TotalPCS_Retur',ftFloat);
    FCDSValidate.CreateDataSet;
  end;
  Result := FCDSValidate;
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

function TfrmPurchaseRetur.GetGroupName: string;
begin
  Result := 'Inventory';
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
    'select id, nama from twarehouse where is_external = 0','nama');
  TcxExtLookup(colUOM.Properties).LoadFromCDS(CDSUOM, 'id', 'uom', ['id'], Self);
  cxLookupGudang.Properties.LoadFromSQL(Self,
    'select id, nama from twarehouse where is_external = 0','nama');

  cxLookupGudang.SetDefaultValue();
end;

procedure TfrmPurchaseRetur.LoadAllInvoiceItem;
var
  lItem: TTransDetail;
begin
  for lItem in PurchRetur.Invoice.Items do
  begin
    CDS.Append;
    lItem.UpdateToDataset(CDS);
    lItem.Item.ReLoad(False);
    CDS.FieldByName('Kode').AsString := lItem.Item.Kode;
    CDS.FieldByName('Nama').AsString := lItem.Item.Nama;

    if lItem.PriceList > 0 then
      CDS.FieldByName('DiscP').AsFloat :=
        (CDS.FieldByName('PriceList').AsFloat - CDS.FieldByName('Harga').AsFloat)
          /CDS.FieldByName('PriceList').AsFloat*100;

    CDS.Post;
  end;
  CalculateAll;
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

  if (aID <> 0) and (not IsReadOnly) then
  begin
    IsReadOnly := not IsValidTransDate(PurchRetur.TransDate);
  end;

  edNoRetur.Text  := PurchRetur.Refno;
  
  DisableEvent := True;
  Try
    rbJenis.ItemIndex := PurchRetur.ReturFlag;
    rbJenisPropertiesEditValueChanged(Self);
  Finally
    DisableEvent := False;
  End;
  
  crSubTotal.Value := Abs(PurchRetur.SubTotal);
  crPPN.Value := Abs(PurchRetur.PPN);
  crTotal.Value := Abs(PurchRetur.Amount);
  edNotes.Text := PurchRetur.Notes;
  dtRetur.Date  := PurchRetur.TransDate;

  edInv.Text := '';
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
    lItem.MakePositive;     
    lItem.UpdateToDataset(CDS);
    lItem.Item.ReLoad(False);             
    CDS.FieldByName('Kode').AsString := lItem.Item.Kode;
    CDS.FieldByName('Nama').AsString := lItem.Item.Nama;

    CDS.FieldByName('DiscP').AsFloat := 0;

    if lItem.PriceList > 0 then
      CDS.FieldByName('DiscP').AsFloat :=
        (CDS.FieldByName('PriceList').AsFloat - CDS.FieldByName('Harga').AsFloat)
          /CDS.FieldByName('PriceList').AsFloat*100;

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
  if PurchRetur.Supplier = nil then
  begin
    TAppUtils.Warning('Supplier Harus dipilih terlebih dahulu');
    exit;
  end;

  if PurchRetur.Supplier.ID = 0 then
  begin
    TAppUtils.Warning('Supplier Harus dipilih terlebih dahulu');
    exit;
  end;


  S := 'SELECT A.ID, A.INVOICENO, A.TRANSDATE AS TANGGAL,'
      +' B.NAMA AS SUPPLIER, A.AMOUNT AS TOTAL, C.NAMA AS GUDANG'
      +' FROM TPURCHASEINVOICE A'
      +' INNER JOIN TSUPPLIER B ON A.SUPPLIER_ID = B.ID'
      +' INNER JOIN TWAREHOUSE C ON A.WAREHOUSE_ID = C.ID'
      +' WHERE A.TRANSDATE BETWEEN :startdate AND :enddate'
      +' AND A.SUPPLIER_ID = ' + IntToStr(PurchRetur.Supplier.ID);

  if rbJenis.ItemIndex = 1 then
    S := S + 'AND PAIDAMOUNT = 0 AND RETURAMOUNT = 0';

  cxLookup := TfrmCXServerLookup.Execute(S, 'ID', StartOfTheMonth(Now()), EndOfTheMonth(Now()) );
  Try
    cxLookup.PreFilter('INVOICENO', sKey);
    if cxLookup.ShowModal = mrOK then
    begin
      if PurchRetur.Invoice = nil then
        PurchRetur.Invoice := TPurchaseInvoice.Create;
//      if PurchRetur.Supplier = nil then
//        PurchRetur.Supplier := TSupplier.Create;

      PurchRetur.Invoice.LoadByID(cxLookup.FieldValue('id'));
//      PurchRetur.Supplier.LoadByID(PurchRetur.Invoice.Supplier.ID);

      edInv.Text := PurchRetur.Invoice.InvoiceNo;
      dtInvoice.Date := PurchRetur.Invoice.TransDate;
//      edSupp.Text := PurchRetur.Supplier.Nama;
      cxLookupGudang.EditValue := PurchRetur.Invoice.Warehouse.ID;

      CDS.EmptyDataSet;

      if rbJenis.ItemIndex = 1 then
        LoadAllInvoiceItem;
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

  if ckReferensiFaktur.Checked then
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
  end;

  lItem  := TItem.Create;
  Try
    if True then

    s := 'SELECT distinct A.ID, A.KODE, A.NAMA, C.NAMA AS MERK, B.NAMA AS ITEMGROUP, A.RAK'
        +' FROM TITEM A'
        +' LEFT JOIN TITEMGROUP B ON A.GROUP_ID = B.ID'
        +' LEFT JOIN TMERK C ON A.MERK_ID = C.ID';

    if ckReferensiFaktur.Checked then
      S := S +' INNER JOIN TTRANSDETAIL D ON D.HEADER_FLAG = ' + IntToStr(HeaderFlag_PurchaseInvoice)
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

procedure TfrmPurchaseRetur.LookupSupplier(sKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  S: string;
begin
  S := 'select * from TSUPPLIER';
  cxLookup := TfrmCXServerLookup.Execute(S, 'ID');
  Try
    cxLookup.PreFilter('Nama', sKey);
    if cxLookup.ShowModal = mrOK then
    begin
      if PurchRetur.Supplier = nil then
        PurchRetur.Supplier := TSupplier.Create;
      PurchRetur.Supplier.LoadByID(cxLookup.FieldValue('id'));
      edSupp.Text := PurchRetur.Supplier.Nama;

      PurchRetur.ClearInvoice;
      edInv.Clear;
      dtInvoice.Clear;

      CDS.EmptyDataSet;
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmPurchaseRetur.rbJenisPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  cxGrdMain.OptionsData.Editing   := rbJenis.ItemIndex = 0;
  cxGrdMain.OptionsData.Appending := rbJenis.ItemIndex = 0;
  cxGrdMain.OptionsData.Inserting := rbJenis.ItemIndex = 0;
  cxGrdMain.OptionsData.Deleting  := rbJenis.ItemIndex = 0;
  ckReferensiFaktur.Enabled       := rbJenis.ItemIndex = 0;

  if (rbJenis.ItemIndex = 1) and (not DisableEvent) then
  begin
//    PurchRetur.Invoice.Free;
    PurchRetur.ClearInvoice;
    PurchRetur.ClearSupplier;

    edInv.Clear;
    dtInvoice.Clear;
    edSupp.Clear;
    CDS.EmptyDataSet;
  end;

//  if not DisableEvent then
  ckReferensiFaktur.Checked := rbJenis.ItemIndex = 1;
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
      DC.SetEditValue(colPriceList.Index, lItemUOM.PriceList, evsValue);
      DC.SetEditValue(colDisc.Index, lItemUOM.GetPriceListMargin(0), evsValue);
      DC.SetEditValue(colHrgBeli.Index, lItemUOM.HargaBeli, evsValue);
    Finally
      FreeAndNil(lItemUOM);
    End;
  end;
end;

procedure TfrmPurchaseRetur.UpdateData;
var
  lItem: TTransDetail;
begin

  PurchRetur.Refno := edNoRetur.Text;
  PurchRetur.TransDate := dtRetur.Date;
  PurchRetur.Notes := edNotes.Text;
  PurchRetur.ReturFlag := rbJenis.ItemIndex;
  PurchRetur.SubTotal := crSubTotal.Value;
  PurchRetur.PPN := crPPN.Value;
  PurchRetur.Amount := crTotal.Value;
  PurchRetur.ModifiedDate := Now();
  PurchRetur.ModifiedBy := UserLogin;

  if PurchRetur.Warehouse = nil then
    PurchRetur.Warehouse := TWarehouse.Create;

  PurchRetur.Warehouse.LoadByID(VarToInt(cxLookupGudang.EditValue));
  PurchRetur.Items.Clear;

  CDS.First;
  while not CDS.Eof do
  begin
    lItem := TTransDetail.Create;
    lItem.SetFromDataset(CDS);

    lItem.MakeNegative;
    PurchRetur.Items.Add(lItem);
    CDS.Next;
  end;    
end;

function TfrmPurchaseRetur.ValidateData: Boolean;
begin
  Result := False;

  if ckReferensiFaktur.Checked then
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
  end;


  if crTotal.Value <= 0 then
  begin
    TAppUtils.Warning('Total <= 0');
    exit;
  end;

//  if CDS.State in [dsInsert, dsEdit] then CDS.Post;

  if CDS.RecordCount = 0 then
  begin
    TAppUtils.Warning('Data Item tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
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

  if CDS.Locate('Qty', 0, []) then
  begin
    TAppUtils.Warning('Qty tidak boleh 0' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;

  if CDS.Locate('Warehouse', 0, []) or CDS.Locate('Warehouse', null, []) then
  begin
    TAppUtils.Warning('Warehouse tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;

  //validate Inv
  if ckReferensiFaktur.Checked then
  begin
    if not ValidateItem then exit;
    if crTotal.Value > PurchRetur.Invoice.Amount then
    begin
      TAppUtils.Warning('Nilai Total Retur melebihi Total Faktur');
      exit;
    end;
  end;

  if not IsValidTransDate(dtRetur.Date) then exit;

  Result := TAppUtils.Confirm('Anda yakin data sudah sesuai?');

end;

function TfrmPurchaseRetur.ValidateItem: Boolean;
var
  lItem: TTransDetail;
begin
//  Result := ;

  CDSValidate.Filtered := False;
  CDSValidate.EmptyDataSet;

  CDSClone.First;
  while not CDSClone.Eof do
  begin
    if not CDSValidate.Locate('ItemID',CDSClone.FieldByName('Item').AsInteger,[]) then
    begin
      CDSValidate.Append;
      CDSValidate.FieldByName('ItemID').AsInteger := CDSClone.FieldByName('Item').AsInteger;
      CDSValidate.FieldByName('Kode').AsString := CDSClone.FieldByName('Nama').AsString;
      CDSValidate.FieldByName('Nama').AsString := CDSClone.FieldByName('Kode').AsString;   
      CDSValidate.FieldByName('TotalPCS_Faktur').AsFloat := 0;
      CDSValidate.FieldByName('TotalPCS_Retur').AsFloat := 0;                  
    end else
    begin
      CDSValidate.Edit;
    end;

    CDSValidate.FieldByName('TotalPCS_Retur').AsFloat := 
      CDSValidate.FieldByName('TotalPCS_Retur').AsFloat 
       + (CDSClone.FieldByName('Qty').AsFloat * CDSClone.FieldByName('Konversi').AsFloat);

    CDSValidate.Post;
    CDSClone.Next;
  end;

  if PurchRetur.Invoice.Items.Count = 0 then
    PurchRetur.Invoice.ReLoad(True);

  for lItem in PurchRetur.Invoice.Items do
  begin       
    if not CDSValidate.Locate('ItemID',lItem.Item.ID,[]) then
      continue;
      
    CDSValidate.Edit;
    CDSValidate.FieldByName('TotalPCS_Faktur').AsFloat := 
      CDSValidate.FieldByName('TotalPCS_Faktur').AsFloat 
       + (lItem.Qty * lItem.Konversi);  
    CDSValidate.Post;
  end;       

  CDSValidate.Filtered := True;
  CDSValidate.Filter := 'TotalPCS_Retur > TotalPCS_Faktur';

  Result := CDSValidate.Eof;

  CDSValidate.Filtered := False;
  if not Result then
    TfrmCXMsgInfo.ShowWarning('Qty Retur tidak boleh melebihi Qty Faktur', CDSValidate, ['ItemID']);
 
end;

end.
