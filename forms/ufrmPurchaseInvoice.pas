unit ufrmPurchaseInvoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGroupBox, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxButtonEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxMemo,
  cxTextEdit, cxLabel, cxCurrencyEdit, cxRadioGroup, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, Datasnap.DBClient,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, Vcl.ExtCtrls, uTransDetail, uDBUtils, uItem,
  cxGridDBDataDefinitions, cxSpinEdit;

type
  TfrmPurchaseInvoice = class(TfrmDefaultInput)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edNoInv: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel6: TcxLabel;
    edNotes: TcxMemo;
    dtInvoice: TcxDateEdit;
    cxLabel8: TcxLabel;
    dtJtTempo: TcxDateEdit;
    cxLabel9: TcxLabel;
    edSupplier: TcxButtonEdit;
    crSubTotal: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    crPPN: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    crTotal: TcxCurrencyEdit;
    cxGrdMain: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    colKode: TcxGridDBColumn;
    colNama: TcxGridDBColumn;
    colUOM: TcxGridDBColumn;
    colQty: TcxGridDBColumn;
    colPriceList: TcxGridDBColumn;
    colDisc: TcxGridDBColumn;
    colSubTotal: TcxGridDBColumn;
    cxLabel7: TcxLabel;
    cxLookupGudang: TcxExtLookupComboBox;
    cbBayar: TcxComboBox;
    cxLabel10: TcxLabel;
    colWarehouse: TcxGridDBColumn;
    Label2: TLabel;
    colItemID: TcxGridDBColumn;
    colKonversi: TcxGridDBColumn;
    colPPN: TcxGridDBColumn;
    Label1: TLabel;
    cxLabel13: TcxLabel;
    cxLookupRekening: TcxExtLookupComboBox;
    btnGenerate: TcxButton;
    spTempo: TcxSpinEdit;
    cxLabel11: TcxLabel;
    edReferensi: TcxTextEdit;
    cxLabel12: TcxLabel;
    cxGrdMainColumn1: TcxGridDBColumn;
    colHrgBeli: TcxGridDBColumn;
    pmMain: TPopupMenu;
    SetSebagaiBarangBonus1: TMenuItem;
    stylBonus: TcxStyle;
    Label3: TLabel;
    colPriceType: TcxGridDBColumn;
    procedure cxGrdMainEditKeyDown(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift:
        TShiftState);
    procedure edNotesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure colKodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure colKodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure colUOMPropertiesInitPopup(Sender: TObject);
    procedure colUOMPropertiesCloseUp(Sender: TObject);
    procedure colUOMPropertiesEditValueChanged(Sender: TObject);
    procedure edSupplierKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure colQtyPropertiesEditValueChanged(Sender: TObject);
    procedure colDiscPropertiesEditValueChanged(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edSupplierPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cbBayarPropertiesEditValueChanged(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure cxGrdMainColumn1GetDisplayText(Sender: TcxCustomGridTableItem;
        ARecord: TcxCustomGridRecord; var AText: string);
    procedure SetSebagaiBarangBonus1Click(Sender: TObject);
    procedure spTempoPropertiesEditValueChanged(Sender: TObject);
    procedure cxGrdMainStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
  private
    DisableTrigger: Boolean;
    FCDS: TClientDataset;
    FCDSClone: TClientDataset;
    FCDSUOM: TClientDataset;
    FCDSDummy: TClientDataset;
    FPurchInv: TPurchaseInvoice;
    procedure CalculateAll;
    procedure CDSAfterDelete(DataSet: TDataSet);
    procedure CDSAfterInsert(DataSet: TDataSet);
    function DC: TcxGridDBDataController;
    procedure FocusToGrid;
    procedure GenerateDummy;
    function GetCDS: TClientDataset;
    function GetCDSClone: TClientDataset;
    function GetCDSUOM: TClientDataset;
    function GetCDSDummy: TClientDataset;
    function GetPurchInv: TPurchaseInvoice;
    procedure InitView;
    procedure LookupItem(aKey: string = '');
    procedure LookupSupplier(sKey: string = '');
    procedure SetBarangBonus;
    procedure SetItemToGrid(aItem: TItem);
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSClone: TClientDataset read GetCDSClone write FCDSClone;
    property CDSUOM: TClientDataset read GetCDSUOM write FCDSUOM;
    property CDSDummy: TClientDataset read GetCDSDummy write FCDSDummy;
    property PurchInv: TPurchaseInvoice read GetPurchInv write FPurchInv;
    { Private declarations }
  protected
    procedure CDSAfterPost(DataSet: TDataSet);
  public
    function GetGroupName: string; override;
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = True);
    { Public declarations }
  end;

var
  frmPurchaseInvoice: TfrmPurchaseInvoice;

implementation

uses
  uAppUtils, uDXUtils, ufrmCXServerLookup, cxDataUtils, uSupplier, uWarehouse,
  uFinancialTransaction, uAccount, uVariable, ufrmLookupItem;

{$R *.dfm}

procedure TfrmPurchaseInvoice.btnGenerateClick(Sender: TObject);
begin
  inherited;
  GenerateDummy;
end;

procedure TfrmPurchaseInvoice.btnPrintClick(Sender: TObject);
begin
  inherited;
  TPurchaseInvoice.PrintData(PurchInv.ID);
end;

procedure TfrmPurchaseInvoice.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if PurchInv.SaveRepeat(False) then
  begin
    btnPrint.Click;
//    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmPurchaseInvoice.CalculateAll;
var
  dPPN: Double;
  dSubTotal: Double;
begin
  if CDS.State in [dsInsert, dsEdit] then
    CDS.Post;

  CDS.DisableControls;
  DisableTrigger := True;
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
    DisableTrigger := False;
  End;
end;

procedure TfrmPurchaseInvoice.cbBayarPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if cbBayar.ItemIndex = PaymentFlag_Cash then
  begin
    spTempo.Value   := 0;
    dtJtTempo.Date  := dtInvoice.Date;
  end;

  cxLookupRekening.Enabled := cbBayar.ItemIndex = PaymentFlag_Cash;
  dtJtTempo.Enabled := cbBayar.ItemIndex = PaymentFlag_Credit;
  spTempo.Visible := cbBayar.ItemIndex = PaymentFlag_Credit;

  cxLookupRekening.Enabled := cbBayar.ItemIndex = PaymentFlag_Cash
end;

procedure TfrmPurchaseInvoice.CDSAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('Warehouse').AsInteger := VarToInt(cxLookupGudang.EditValue);
end;

procedure TfrmPurchaseInvoice.CDSAfterPost(DataSet: TDataSet);
begin
  inherited;
  if DisableTrigger then exit;
  CalculateAll;
end;

procedure TfrmPurchaseInvoice.colDiscPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmPurchaseInvoice.colKodePropertiesButtonClick(Sender: TObject;
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

procedure TfrmPurchaseInvoice.colKodePropertiesValidate(Sender: TObject;
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

procedure TfrmPurchaseInvoice.colQtyPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmPurchaseInvoice.colUOMPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  with TcxExtLookup(colUOM.Properties).DataController.filter do
  begin
    BeginUpdate;
    Root.Clear;
    EndUpdate;
  end;
end;

procedure TfrmPurchaseInvoice.colUOMPropertiesEditValueChanged(Sender: TObject);
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

procedure TfrmPurchaseInvoice.colUOMPropertiesInitPopup(Sender: TObject);
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

procedure TfrmPurchaseInvoice.cxGrdMainEditKeyDown(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit:
    TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) and (aItem = colKode) then
  begin
    LookupItem(VarToStr(AEdit.EditingValue));
  end;
end;

procedure TfrmPurchaseInvoice.cxGrdMainStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord = nil then exit;
  if VarToFloat(ARecord.Values[colPriceType.Index]) = 1
   then
    AStyle := stylBonus;
end;

function TfrmPurchaseInvoice.DC: TcxGridDBDataController;
begin
  Result := cxGrdMain.DataController;
end;

procedure TfrmPurchaseInvoice.edNotesKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    FocusToGrid;
  end;
end;

procedure TfrmPurchaseInvoice.edSupplierKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmPurchaseInvoice.edSupplierPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  LookupSupplier;
end;

procedure TfrmPurchaseInvoice.FocusToGrid;
begin
  cxGrid1.SetFocus;
  cxGrid1.FocusedView := cxGrdMain;
  if cxGrdMain.DataController.RecordCount = 0 then
  begin
    CDS.Append;
    cxGrdMain.Controller.EditingController.ShowEdit;
  end;
end;

procedure TfrmPurchaseInvoice.FormCreate(Sender: TObject);
begin
  inherited;
  InitView;
  Self.AssignKeyDownEvent;
  LoadByID(0, False);
end;

procedure TfrmPurchaseInvoice.FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if Key = VK_F1 then
    edNoInv.SetFocus;

  if Key = VK_F2 then
  begin
    FocusToGrid;
  end;

  if Key = VK_F6 then
    SetBarangBonus;
end;

function TfrmPurchaseInvoice.GetCDS: TClientDataset;
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
    DisableTrigger := False;
  end;
  Result := FCDS;
end;

function TfrmPurchaseInvoice.GetCDSClone: TClientDataset;
begin
  if FCDSClone = nil then
  begin
    FCDSClone := CDS.ClonedDataset(Self);
  end;
  Result := FCDSClone;
end;

function TfrmPurchaseInvoice.GetCDSUOM: TClientDataset;
begin
  if FCDSUOM = nil then
  begin
    FCDSUOM := TDBUtils.OpenDataset('select id, uom from tuom',Self);
  end;
  Result := FCDSUOM;
end;

function TfrmPurchaseInvoice.GetPurchInv: TPurchaseInvoice;
begin
  if FPurchInv = nil then
    FPurchInv := TPurchaseInvoice.Create;
  Result := FPurchInv;
end;

procedure TfrmPurchaseInvoice.InitView;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  TcxExtLookup(colWarehouse.Properties).LoadFromSQL(Self,
    'select id, nama from twarehouse where is_external = 0','nama');
  TcxExtLookup(colUOM.Properties).LoadFromCDS(CDSUOM, 'id', 'uom', ['id'], Self);
  cxLookupGudang.Properties.LoadFromSQL(Self,
    'select id, nama from twarehouse where is_external = 0','nama');

  cxLookupRekening.Properties.LoadFromSQL(Self,
    'select id, nama from trekening','nama');

  cxLookupGudang.SetDefaultValue();

  if PurchInv.Rekening = nil then
    PurchInv.Rekening := TRekening.Create;

  PurchInv.Rekening.LoadByCode(AppVariable.Def_Rekening);
  cxLookupRekening.EditValue := PurchInv.Rekening.ID;
end;

procedure TfrmPurchaseInvoice.LoadByID(aID: Integer; IsReadOnly: Boolean =
    True);
var
  lItem: TTransDetail;
begin
  if FPurchInv <> nil then
    FreeAndNil(FPurchInv);

  PurchInv.LoadByID(aID);


  if (aID <> 0) and (not IsReadOnly) then
  begin
    if not IsValidTransDate(PurchInv.TransDate) then
      IsReadOnly := True;
  end;

  //def uom
  if aID = 0 then
  begin
    PurchInv.TransDate := Now();
    PurchInv.DueDate  := Now();
    PurchInv.PaymentFlag := PaymentFlag_Credit;
    PurchInv.InvoiceNo := PurchInv.GenerateNo;
  end;
  cbBayar.ItemIndex := PurchInv.PaymentFlag;
  cbBayarPropertiesEditValueChanged(Self);

  edNoInv.Text := PurchInv.InvoiceNo;
  dtInvoice.Date := PurchInv.TransDate;
  dtJtTempo.Date := PurchInv.DueDate;
  spTempo.Value := PurchInv.DueDate - PurchInv.TransDate;

  crSubTotal.Value := PurchInv.SubTotal;
  crPPN.Value := PurchInv.PPN;
  crTotal.Value := PurchInv.Amount;
  edNotes.Text := PurchInv.Notes;
  edReferensi.Text := PurchInv.Referensi;

  if PurchInv.Supplier <> nil then
  begin
    PurchInv.Supplier.ReLoad(False);
    edSupplier.Text := PurchInv.Supplier.Nama;
  end;

  if PurchInv.Warehouse <> nil then
    cxLookupGudang.EditValue := PurchInv.Warehouse.ID;

  CDS.EmptyDataSet;
  for lItem in PurchInv.Items do
  begin
    CDS.Append;
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

procedure TfrmPurchaseInvoice.LookupItem(aKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  lItem: TItem;
  s: string;
//  sKey: string;
begin
//  sKey := '';
//  if cxGrdMain.Controller.FocusedRecord <> nil then
//    sKey := VarToStr(cxGrdMain.Controller.FocusedRecord.Values[colKode.Index]);

  lItem  := TItem.Create;
  Try
    s := 'SELECT A.ID, A.KODE, A.NAMA, D.NAMA AS MERK, B.UOM AS UOMSTOCK,'
        +' C.PRICELIST, C.HARGABELI'
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

procedure TfrmPurchaseInvoice.CDSAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmPurchaseInvoice.cxGrdMainColumn1GetDisplayText(Sender:
    TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if ARecord = nil then exit;
  AText := VarToStr(ARecord.RecordIndex + 1);
end;

procedure TfrmPurchaseInvoice.GenerateDummy;
var
  i: Integer;
  iCount: Integer;
  lItem: TItem;
begin
  LoadByID(0, False);
  cbBayar.ItemIndex := PaymentFlag_Credit;
  dtInvoice.Date := Now() - (Random(90));

  if PurchInv.Supplier = nil then
    PurchInv.Supplier := TSupplier.Create;
  while true do
  begin
    if PurchInv.Supplier.LoadByID(Random(126)) then
      break;
  end;        
  edSupplier.Text := PurchInv.Supplier.Nama;        
  dtJtTempo.Date := dtInvoice.Date + Random(14);
  cxLookupGudang.SetDefaultValue();
  cxLookupRekening.SetDefaultValue();
  edNotes.Text := 'Dummy Data';

  iCount := 20; //Random(15)+3;
  lItem := TItem.Create;
  Try
    DC.RecordCount := 0;
    CDSDummy.First;
    for i := 0 to iCount do
    begin

      if not lItem.LoadByID(CDSDummy.FieldByName('ID').AsInteger) then continue;
      if lItem.ItemUOMs[0].HargaBeli = 0 then continue;


      if i>0 then DC.Append;

      SetItemToGrid(lItem);
      DC.SetEditValue(colQty.Index, 10*Random(9)+5 , evsValue);
      CalculateAll;
      DC.Post;

      CDSDummy.Next;
    end;
  Finally
    lItem.Free;
  End;

//  if not TAppUtils.Confirm('Is it Okay?') then exit;
//  if not ValidateData then exit;
//  UpdateData;
//  PurchInv.SaveRepeat();

end;

function TfrmPurchaseInvoice.GetCDSDummy: TClientDataset;
begin
  if FCDSDummy = nil then
  begin
    FCDSDummy := TDBUtils.OpenDataset('select * from titem where nama like ''oli%'' ',Self);
  end;
  Result := FCDSDummy;
end;

function TfrmPurchaseInvoice.GetGroupName: string;
begin
  Result := 'Inventory';
end;

procedure TfrmPurchaseInvoice.LookupSupplier(sKey: string = '');
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
      if PurchInv.Supplier = nil then
        PurchInv.Supplier := TSupplier.Create;
      PurchInv.Supplier.LoadByID(cxLookup.FieldValue('id'));
      edSupplier.Text := PurchInv.Supplier.Nama;
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmPurchaseInvoice.SetBarangBonus;
begin
  if not TAppUtils.Confirm('Anda yakin menjadikan Barang ini menjadi barang bonus?')  then exit;
  if CDS.State in [dsInsert, dsEdit] then CDS.Post;
  CDS.Edit;
  CDS.FieldByName('PriceType').AsInteger  := 1;
  CDS.FieldByName('PriceList').AsFloat    := 0;
  CDS.FieldByName('DiscP').AsInteger      := 0;
  CDS.FieldByName('Harga').AsInteger      := 0;
  CDS.Post;
  CalculateAll;
end;

procedure TfrmPurchaseInvoice.SetItemToGrid(aItem: TItem);
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

procedure TfrmPurchaseInvoice.SetSebagaiBarangBonus1Click(Sender: TObject);
begin
  SetBarangBonus;
end;

procedure TfrmPurchaseInvoice.spTempoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  dtJtTempo.Date := dtInvoice.Date + spTempo.Value;
end;

procedure TfrmPurchaseInvoice.UpdateData;
var
  lItem: TTransDetail;
begin

  PurchInv.InvoiceNo := edNoInv.Text;
  PurchInv.TransDate := dtInvoice.Date;
  PurchInv.DueDate  := dtJtTempo.Date;
  PurchInv.Notes := edNotes.Text;
  PurchInv.PaymentFlag := cbBayar.ItemIndex;
  PurchInv.SubTotal := crSubTotal.Value;
  PurchInv.PPN := crPPN.Value;
  PurchInv.Amount := crTotal.Value;
  PurchInv.ModifiedDate := Now();
  PurchInv.ModifiedBy := UserLogin;
  PurchInv.Referensi  := edReferensi.Text;

  if PurchInv.Warehouse = nil then
    PurchInv.Warehouse := TWarehouse.Create;

  PurchInv.Warehouse.LoadByID(VarToInt(cxLookupGudang.EditValue));

  if PurchInv.Rekening = nil then
    PurchInv.Rekening := TRekening.Create;

  if PurchInv.PaymentFlag = PaymentFlag_Cash then
    PurchInv.Rekening.LoadByID(VarToInt(cxLookupRekening.EditValue))
  else
    PurchInv.Rekening.ID := 0;

  PurchInv.Items.Clear;

  CDS.First;
  while not CDS.Eof do
  begin
    lItem := TTransDetail.Create;
    lItem.SetFromDataset(CDS);
    PurchInv.Items.Add(lItem);
    CDS.Next;
  end;

end;

function TfrmPurchaseInvoice.ValidateData: Boolean;
begin
  Result := False;
  CalculateAll;

  if PurchInv.Supplier = nil then
  begin
    TAppUtils.Warning('Supplier belum dipilih');
    edSupplier.SetFocus;
    exit;
  end;

  if PurchInv.Supplier.ID = 0 then
  begin
    TAppUtils.Warning('Supplier belum dipilih');
    edSupplier.SetFocus;
    exit;
  end;

  if crTotal.Value <= 0 then
  begin
    TAppUtils.Warning('Total <= 0');
    exit;
  end;

  if (cbBayar.ItemIndex = 0) and (VarToInt(cxLookupRekening.EditValue) = 0) then
  begin
    TAppUtils.Warning('Untuk Pembayaran Cash, Rekening Kas wajib diisi');
    exit;
  end;

  CDSClone.Last;
  if (CDSClone.FieldByName('Item').AsInteger = 0)
    and (CDSCLone.FieldByName('UOM').AsInteger = 0)
    and (CDSClone.FieldByName('Qty').AsFloat = 0)
  then
  begin
    CDSClone.Delete;
  end;

//  if CDS.State in [dsInsert, dsEdit] then CDS.Post;

//  if CDS.RecordCount = 0 then
//  begin
//    TAppUtils.Warning('Data Item tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
//    exit;
//  end;
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

  if CDS.Locate('Qty', 0, []) then
  begin
    TAppUtils.Warning('Qty tidak boleh 0' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;

//  if CDS.Locate('Harga', 0, []) then
//  begin
//    TAppUtils.Warning('Harga tidak boleh 0' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
//    exit;
//  end;

  if CDS.Locate('Warehouse', 0, []) or CDS.Locate('Warehouse', null, []) then
  begin
    TAppUtils.Warning('Warehouse tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;

  if edReferensi.Text = '' then
  begin
    TAppUtils.Warning('Referensi tidak boleh kosong');
    exit;
  end;

  if not IsValidTransDate(dtInvoice.Date) then exit;

  Result := TAppUtils.Confirm('Anda yakin data sudah sesuai?');

end;

end.
