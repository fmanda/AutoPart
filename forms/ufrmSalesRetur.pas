unit ufrmSalesRetur;

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
  cxClasses, cxGridCustomView, cxGrid, cxCheckBox, cxRadioGroup, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxMaskEdit, cxCalendar, cxMemo, cxLabel,
  cxGridDBDataDefinitions, Datasnap.DBClient, uItem, uTransDetail, cxDataUtils,
  uDBUtils, uApputils, ufrmAuthUser;

type
  TfrmSalesRetur = class(TfrmDefaultInput)
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
    cxLabel9: TcxLabel;
    dtInvoice: TcxDateEdit;
    cxLabel11: TcxLabel;
    rbJenis: TcxRadioGroup;
    edCustomer: TcxButtonEdit;
    ckReferensiFaktur: TcxCheckBox;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colKode: TcxGridDBColumn;
    colNama: TcxGridDBColumn;
    colUOM: TcxGridDBColumn;
    colQty: TcxGridDBColumn;
    colHrgJual: TcxGridDBColumn;
    colDisc: TcxGridDBColumn;
    colSubTotal: TcxGridDBColumn;
    colWarehouse: TcxGridDBColumn;
    colItemID: TcxGridDBColumn;
    colKonversi: TcxGridDBColumn;
    colPPN: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Label2: TLabel;
    Label1: TLabel;
    rbHarga: TcxRadioGroup;
    cxMemo1: TcxMemo;
    pmMain: TPopupMenu;
    UpdateKeHargaUmum1: TMenuItem;
    UpdatekeHargaGrosir1: TMenuItem;
    UpdatekeHargaGrosir2: TMenuItem;
    UpdatekeHargaKeliling1: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    styleUmum: TcxStyle;
    styleBengkel: TcxStyle;
    styleGrosir: TcxStyle;
    styleKeliling: TcxStyle;
    colPriceType: TcxGridDBColumn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    colDiscP: TcxGridDBColumn;
    procedure btnSaveClick(Sender: TObject);
    procedure ckReferensiFakturPropertiesEditValueChanged(Sender: TObject);
    procedure colDiscPropertiesEditValueChanged(Sender: TObject);
    procedure colKodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure colKodePropertiesValidate(Sender: TObject; var DisplayValue: Variant;
        var ErrorText: TCaption; var Error: Boolean);
    procedure colQtyPropertiesEditValueChanged(Sender: TObject);
    procedure colUOMPropertiesCloseUp(Sender: TObject);
    procedure colUOMPropertiesEditValueChanged(Sender: TObject);
    procedure colUOMPropertiesInitPopup(Sender: TObject);
    procedure cxGrdMainEditKeyDown(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift:
        TShiftState);
    procedure edInvKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edInvPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edNotesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCustomerKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rbJenisPropertiesEditValueChanged(Sender: TObject);
    procedure edCustomerPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure rbHargaOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure colHrgJualStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure UpdatekeHargaGrosir1Click(Sender: TObject);
    procedure UpdatekeHargaGrosir2Click(Sender: TObject);
    procedure UpdatekeHargaKeliling1Click(Sender: TObject);
    procedure UpdateKeHargaUmum1Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure colDiscPPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure colDiscPPropertiesEditValueChanged(Sender: TObject);
    procedure colDiscPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    FCDS: TClientDataset;
    FCDSClone: TClientDataset;
    FCDSUOM: TClientDataset;
    FCDSValidate: TClientDataset;
    FDisableEvent: Boolean;
    FSalesRetur: TSalesRetur;
    procedure CalculateAll;
    procedure CDSAfterInsert(DataSet: TDataSet);
    procedure CDSAfterDelete(DataSet: TDataSet);
    function DC: TcxGridDBDataController;
    procedure FocusToGrid;
    function GetCDS: TClientDataset;
    function GetCDSClone: TClientDataset;
    function GetCDSUOM: TClientDataset;
    function GetCDSValidate: TClientDataset;
    function GetSalesRetur: TSalesRetur;
    procedure InitView;
    procedure LoadAllInvoiceItem;
    procedure LookupInvoice(sKey: string = '');
    procedure LookupItem(aKey: string = '');
    procedure LookupCustomer(sKey: string = '');
    procedure SetItemToGrid(aItem: TItem);
    procedure UpdateData;
    procedure UpdateHarga(aPriceType: Integer);
    function ValidateData: Boolean;
    function ValidateItem: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSClone: TClientDataset read GetCDSClone write FCDSClone;
    property CDSUOM: TClientDataset read GetCDSUOM write FCDSUOM;
    property CDSValidate: TClientDataset read GetCDSValidate write FCDSValidate;
    property DisableEvent: Boolean read FDisableEvent write FDisableEvent;
    property SalesRetur: TSalesRetur read GetSalesRetur write FSalesRetur;
    { Private declarations }
  public
    function GetGroupName: string; override;
    function GetItemPriceType(aItemID: Integer): Integer;
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean);
    { Public declarations }
  end;

var
  frmSalesRetur: TfrmSalesRetur;

implementation

uses
  uDXUtils, ufrmVariable, uVariable, ufrmCXServerLookup, System.DateUtils,
  uCustomer, uWarehouse, ufrmCXMsgInfo, ufrmLookupItem, uPrintStruk;

{$R *.dfm}

procedure TfrmSalesRetur.btnPrintClick(Sender: TObject);
begin
  inherited;
  if SalesRetur.Invoice <> nil then
  begin
    if SalesRetur.Invoice.SalesType = SalesType_FrontEnd then
    begin
      TPrintStruk.Print(SalesRetur);
      exit;
    end;
  end;
  TSalesRetur.PrintData(SalesRetur.ID);
end;

procedure TfrmSalesRetur.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if SalesRetur.SaveRepeat(False) then
  begin
    btnPrint.Click;
//    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmSalesRetur.CalculateAll;
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

procedure TfrmSalesRetur.CDSAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('Warehouse').AsInteger := VarToInt(cxLookupGudang.EditValue);
end;

procedure TfrmSalesRetur.CDSAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmSalesRetur.ckReferensiFakturPropertiesEditValueChanged(Sender:
    TObject);
begin
  inherited;
  edInv.Enabled := ckReferensiFaktur.Checked;
  dtInvoice.Enabled := ckReferensiFaktur.Checked;
  if not DisableEvent then
  begin
    if not ckReferensiFaktur.Checked then
    begin
      SalesRetur.ClearInvoice;
      edInv.Clear;
      dtInvoice.Clear;
    end;
  end;
end;

procedure TfrmSalesRetur.colDiscPPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmSalesRetur.colDiscPPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  lDiscRp: Double;
  lHarga: Double;
begin
  inherited;
  lHarga    := VarToFloat(cxGrdMain.Controller.FocusedRecord.Values[colHrgJual.Index]);
  lDiscRp   := VarToFloat(DisplayValue)/100 * lHarga;
  DC.SetEditValue(colDisc.Index, lDiscRp , DisplayValue);
  DC.SetEditValue(colDiscP.Index, DisplayValue , evsValue);
end;

procedure TfrmSalesRetur.colDiscPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmSalesRetur.colDiscPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  lDiscP: Double;
  lHarga: Double;
begin
  inherited;
  lHarga    := VarToFloat(cxGrdMain.Controller.FocusedRecord.Values[colHrgJual.Index]);
  if lHarga = 0 then
    lDiscP := 0
  else
    lDiscP := VarToFloat(DisplayValue)/lHarga*100;
  DC.SetEditValue(colDiscP.Index, lDiscP , evsValue);
  DC.SetEditValue(colDisc.Index, DisplayValue , evsValue);
end;

procedure TfrmSalesRetur.colHrgJualStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
var
  iPriceType: Integer;
begin
  inherited;
  if ARecord = nil then exit;
//  if AItem = nil then exit;
  iPriceType := VarToInt(ARecord.Values[colPriceType.Index]);

  case iPriceType of
    0 : AStyle := styleUmum;
    1 : AStyle := styleBengkel;
    2 : AStyle := styleGrosir;
    3 : AStyle := styleKeliling;
  end;
end;

procedure TfrmSalesRetur.colKodePropertiesButtonClick(Sender: TObject;
    AButtonIndex: Integer);
begin
  inherited;
  LookupItem();
end;

procedure TfrmSalesRetur.colKodePropertiesValidate(Sender: TObject; var
    DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  lDetail: TTransDetail;
  lFound: Boolean;
  lItem: TItem;
begin
  inherited;
  if ckReferensiFaktur.Checked then
  begin
    if SalesRetur.Invoice = nil then
    begin
      TAppUtils.Warning('Nomor Faktur belum dipilih');
      exit;
    end;

    if SalesRetur.Invoice.ID = 0 then
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

        if SalesRetur.Invoice.Items.Count = 0 then
          SalesRetur.Invoice.ReLoad(True);

        lFound := False;
        for lDetail in SalesRetur.Invoice.Items do
        begin
          lFound := lDetail.Item.ID = lItem.ID;
          if lFound then break;
        end;

        if not lFound then
        begin
          Error := True;
          ErrorText := 'Kode Barang ' + VarToStr(DisplayValue)
            + ' tidak ditemukan di faktur penjualan';
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

procedure TfrmSalesRetur.colQtyPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmSalesRetur.colUOMPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  with TcxExtLookup(colUOM.Properties).DataController.filter do
  begin
    BeginUpdate;
    Root.Clear;
    EndUpdate;
  end;
end;

procedure TfrmSalesRetur.colUOMPropertiesEditValueChanged(Sender: TObject);
var
  aTipeHarga: Integer;
  lItemUOM: TItemUOM;
begin
  inherited;
  if SalesRetur.Invoice = nil then
    raise Exception.Create('Faktur belum dipilih');
  if SalesRetur.Invoice.ID = 0 then
    raise Exception.Create('Faktur belum dipilih');

  lItemUOM := TItemUOM.GetItemUOM(
    VarToInt(cxGrdMain.Controller.FocusedRecord.Values[colItemID.Index]),
    VarToInt(cxGrdMain.Controller.FocusedRecord.Values[colUOM.Index])
  );

  if lItemUOM = nil then
    raise Exception.Create('lItemUOM = nil');

  aTipeHarga := GetItemPriceType(lItemUOM.Item.ID);

  if lItemUOM = nil then exit;
  Try
    DC.SetEditValue(colKonversi.Index, lItemUOM.Konversi, evsValue);
    DC.SetEditValue(
      colHrgJual.Index,
      lItemUOM.GetHarga(aTipeharga),
      evsValue
    );

    DC.SetEditValue(colPriceType.Index, aTipeHarga, evsValue);

    CalculateAll;
    colQty.FocusWithSelection;
    cxGrdMain.Controller.EditingController.ShowEdit;
  Finally
    FreeAndNil(lItemUOM);
  End;

end;

procedure TfrmSalesRetur.colUOMPropertiesInitPopup(Sender: TObject);
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

procedure TfrmSalesRetur.cxGrdMainEditKeyDown(Sender: TcxCustomGridTableView;
    AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if (Key = VK_F5) and (aItem = colKode) then
  begin
    LookupItem(VarToStr(AEdit.EditingValue));
  end;
end;

function TfrmSalesRetur.DC: TcxGridDBDataController;
begin
  Result := cxGrdMain.DataController;
end;

procedure TfrmSalesRetur.edInvKeyDown(Sender: TObject; var Key: Word; Shift:
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

procedure TfrmSalesRetur.edInvPropertiesButtonClick(Sender: TObject;
    AButtonIndex: Integer);
begin
  inherited;
  LookupInvoice;
end;

procedure TfrmSalesRetur.edNotesKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    FocusToGrid;
  end;
end;

procedure TfrmSalesRetur.edCustomerKeyDown(Sender: TObject; var Key: Word; Shift:
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
    LookupCustomer(sKey);
  end else if Key = VK_RETURN then
  begin
    SelectNext(Screen.ActiveControl, True, True);
  end;
end;

procedure TfrmSalesRetur.edCustomerPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  LookupCustomer();
end;

procedure TfrmSalesRetur.FocusToGrid;
begin
  cxGrid1.SetFocus;
  cxGrid1.FocusedView := cxGrdMain;
  if cxGrdMain.DataController.RecordCount = 0 then
  begin
    CDS.Append;
    cxGrdMain.Controller.EditingController.ShowEdit;
  end;
end;

procedure TfrmSalesRetur.FormCreate(Sender: TObject);
begin
  inherited;
  InitView;
  Self.AssignKeyDownEvent;
  LoadByID(0, False);
  DisableEvent := False;
end;

procedure TfrmSalesRetur.FormKeyDown(Sender: TObject; var Key: Word; Shift:
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

function TfrmSalesRetur.GetCDS: TClientDataset;
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

function TfrmSalesRetur.GetCDSClone: TClientDataset;
begin
  if FCDSClone = nil then
  begin
    FCDSClone := CDS.ClonedDataset(Self);
  end;
  Result := FCDSClone;
end;

function TfrmSalesRetur.GetCDSUOM: TClientDataset;
begin
  if FCDSUOM = nil then
  begin
    FCDSUOM := TDBUtils.OpenDataset('select id, uom from tuom',Self);
  end;
  Result := FCDSUOM;
end;

function TfrmSalesRetur.GetCDSValidate: TClientDataset;
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

function TfrmSalesRetur.GetGroupName: string;
begin
  Result := 'Penjualan & Kas';
end;

function TfrmSalesRetur.GetItemPriceType(aItemID: Integer): Integer;
var
  lItem: TTransDetail;
begin
  Result := 0;
  if SalesRetur = nil then exit;
  if SalesRetur.Invoice = nil then exit;
  if SalesRetur.Invoice.Items.Count = 0 then
    SalesRetur.Invoice.ReLoad(True);

  for lItem in SalesRetur.Invoice.Items do
  begin
    if lItem.Item.ID = aItemID then
    begin
      Result := lItem.PriceType;
      break;
    end;
  end;
end;

function TfrmSalesRetur.GetSalesRetur: TSalesRetur;
begin
  if FSalesRetur = nil then
    FSalesRetur := TSalesRetur.Create;
  Result := FSalesRetur;
end;

procedure TfrmSalesRetur.InitView;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  TcxExtLookup(colWarehouse.Properties).LoadFromSQL(Self,
    'select id, nama from twarehouse where is_external = 0','nama');
  TcxExtLookup(colUOM.Properties).LoadFromCDS(CDSUOM, 'id', 'uom', ['id'], Self);
  cxLookupGudang.Properties.LoadFromSQL(Self,
    'select id, nama from twarehouse where is_external = 0','nama');

  cxLookupGudang.SetDefaultValue();
  rbHarga.OnKeyDown := rbHargaOnKeyDown;
end;

procedure TfrmSalesRetur.LoadAllInvoiceItem;
var
  lItem: TTransDetail;
begin
  for lItem in SalesRetur.Invoice.Items do
  begin
    CDS.Append;
    lItem.MakePositive;
    lItem.UpdateToDataset(CDS);
    lItem.Item.ReLoad(False);

    if lItem.Harga <> 0 then
      CDS.FieldByName('DiscP').AsFloat := lItem.Discount / lItem.Harga * 100;

    CDS.FieldByName('Kode').AsString := lItem.Item.Kode;
    CDS.FieldByName('Nama').AsString := lItem.Item.Nama;
    CDS.Post;
  end;
  CalculateAll;
end;

procedure TfrmSalesRetur.LoadByID(aID: Integer; IsReadOnly: Boolean);
var
  lItem: TTransDetail;
begin
  if FSalesRetur <> nil then
    FreeAndNil(FSalesRetur);

  SalesRetur.LoadByID(aID);

  //def uom
  if aID = 0 then
  begin
    SalesRetur.TransDate  := Now();
    SalesRetur.ReturFlag  := 0;
    SalesRetur.Refno      := SalesRetur.GenerateNo;
  end;

  if (aID <> 0) and (not IsReadOnly) then
  begin
    IsReadOnly := not IsValidTransDate(SalesRetur.TransDate);
  end;

  edNoRetur.Text  := SalesRetur.Refno;

  DisableEvent := True;
  Try
    rbJenis.ItemIndex := SalesRetur.ReturFlag;
    rbJenisPropertiesEditValueChanged(Self);
  Finally
    DisableEvent := False;
  End;

  crSubTotal.Value := Abs(SalesRetur.SubTotal);
  crPPN.Value := Abs(SalesRetur.PPN);
  crTotal.Value := Abs(SalesRetur.Amount);
  edNotes.Text := SalesRetur.Notes;
  dtRetur.Date  := SalesRetur.TransDate;

  edInv.Text := '';
  edCustomer.Text := '';
  dtInvoice.Clear;
  if SalesRetur.Invoice <> nil then
  begin
    SalesRetur.Invoice.ReLoad(False);
    edInv.Text      := SalesRetur.Invoice.InvoiceNo;
    dtInvoice.Date  := SalesRetur.Invoice.TransDate;
//    rbHarga.ItemIndex := SalesRetur.Invoice.SalesType;
  end;

  if SalesRetur.Customer <> nil then
  begin
    SalesRetur.Customer.ReLoad(False);
    edCustomer.Text := SalesRetur.Customer.Nama;
  end;

  if SalesRetur.Warehouse <> nil then
    cxLookupGudang.EditValue := SalesRetur.Warehouse.ID;


  for lItem in SalesRetur.Items do
  begin
    CDS.Append;
    lItem.MakePositive;
    lItem.UpdateToDataset(CDS);
    lItem.Item.ReLoad(False);
    if lItem.Harga <> 0 then
      CDS.FieldByName('DiscP').AsFloat := lItem.Discount / lItem.Harga * 100;

    CDS.FieldByName('Kode').AsString := lItem.Item.Kode;
    CDS.FieldByName('Nama').AsString := lItem.Item.Nama;
    CDS.Post;
  end;
  CalculateAll;
  btnSave.Enabled := not IsReadOnly;
end;

procedure TfrmSalesRetur.LookupInvoice(sKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  S: string;
begin
  if SalesRetur.Customer = nil then
  begin
    TAppUtils.Warning('Customer Harus dipilih terlebih dahulu');
    exit;
  end;

  if SalesRetur.Customer.ID = 0 then
  begin
    TAppUtils.Warning('Customer Harus dipilih terlebih dahulu');
    exit;
  end;


  S := 'SELECT A.ID, A.INVOICENO, A.TRANSDATE AS TANGGAL,'
      +' B.NAMA AS CUSTOMER, A.AMOUNT AS TOTAL, C.NAMA AS GUDANG'
      +' FROM TSALESINVOICE A'
      +' INNER JOIN TCUSTOMER B ON A.CUSTOMER_ID = B.ID'
      +' INNER JOIN TWAREHOUSE C ON A.WAREHOUSE_ID = C.ID'
      +' WHERE A.TRANSDATE BETWEEN :startdate AND :enddate'
      +' AND A.CUSTOMER_ID = ' + IntToStr(SalesRetur.Customer.ID);

  if rbJenis.ItemIndex = 1 then
    S := S + 'AND PAIDAMOUNT = 0 AND RETURAMOUNT = 0';

  cxLookup := TfrmCXServerLookup.Execute(S, 'ID', StartOfTheMonth(Now()), EndOfTheMonth(Now()) );
  Try
    cxLookup.PreFilter('INVOICENO', sKey);
    if cxLookup.ShowModal = mrOK then
    begin
      if SalesRetur.Invoice = nil then
        SalesRetur.Invoice := TSalesInvoice.Create;
//      if SalesRetur.Supplier = nil then
//        SalesRetur.Supplier := TSupplier.Create;


      SalesRetur.Invoice.LoadByID(cxLookup.FieldValue('id'));
//      SalesRetur.Supplier.LoadByID(SalesRetur.Invoice.Supplier.ID);

      edInv.Text := SalesRetur.Invoice.InvoiceNo;
      dtInvoice.Date := SalesRetur.Invoice.TransDate;
//      edSupp.Text := SalesRetur.Supplier.Nama;
      cxLookupGudang.EditValue := SalesRetur.Invoice.Warehouse.ID;

      if SalesRetur.Invoice.Items.Count > 0 then
        rbHarga.ItemIndex := SalesRetur.Invoice.Items[0].PriceType;

      CDS.EmptyDataSet;

      if rbJenis.ItemIndex = 1 then
        LoadAllInvoiceItem;
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmSalesRetur.LookupItem(aKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  lItem: TItem;
  s: string;
//  sKey: string;
begin

//  if ckReferensiFaktur.Checked then
//  begin
    if SalesRetur.Invoice = nil then
    begin
      TAppUtils.Warning('Nomor Faktur belum dipilih');
      exit;
    end;

    if SalesRetur.Invoice.ID = 0 then
    begin
      TAppUtils.Warning('Nomor Faktur belum dipilih');
      exit;
    end;
//  end;

  lItem  := TItem.Create;
  Try
    if True then

    s := 'SELECT A.ID, A.KODE, A.NAMA, D.NAMA AS MERK, B.UOM AS UOMSTOCK,'
        +' C.PRICELIST, C.HARGAJUAL1 AS HARGAUMUM, C.HARGAJUAL2 AS HARGABENGKEL,'
        +' C.HARGAJUAL3 AS HARGAGROSIR, C.HARGAJUAL4 AS HARGAKELILING'
        +' FROM TITEM A'
        +' INNER JOIN TUOM B ON A.STOCKUOM_ID = B.ID'
        +' LEFT JOIN TITEMUOM C ON A.ID = C.ITEM_ID AND C.UOM_ID = B.ID'
        +' LEFT JOIN TMERK D ON A.MERK_ID = C.ID';

    if ckReferensiFaktur.Checked then
      S := S +' INNER JOIN TTRANSDETAIL F ON F.HEADER_FLAG = ' + IntToStr(HeaderFlag_SalesInvoice)
        +' AND F.ITEM_ID = A.ID AND F.HEADER_ID = ' + IntToStr(SalesRetur.Invoice.ID);

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

procedure TfrmSalesRetur.LookupCustomer(sKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  S: string;
begin
  S := 'select * from TCustomer';
  cxLookup := TfrmCXServerLookup.Execute(S, 'ID');
  Try
    cxLookup.PreFilter('Nama', sKey);
    if cxLookup.ShowModal = mrOK then
    begin
      if SalesRetur.Customer = nil then
        SalesRetur.Customer := TCustomer.Create;
      SalesRetur.Customer.LoadByID(cxLookup.FieldValue('id'));
      edCustomer.Text := SalesRetur.Customer.Nama;

      SalesRetur.ClearInvoice;
      edInv.Clear;
      dtInvoice.Clear;

      CDS.EmptyDataSet;
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmSalesRetur.rbHargaOnKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    FocusToGrid;
  end;
end;

procedure TfrmSalesRetur.rbJenisPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  cxGrdMain.OptionsData.Editing   := rbJenis.ItemIndex = 0;
  cxGrdMain.OptionsData.Appending := rbJenis.ItemIndex = 0;
  cxGrdMain.OptionsData.Inserting := rbJenis.ItemIndex = 0;
  cxGrdMain.OptionsData.Deleting  := rbJenis.ItemIndex = 0;
//  ckReferensiFaktur.Enabled       := rbJenis.ItemIndex = 0;

  if (rbJenis.ItemIndex = 1) and (not DisableEvent) then
  begin
//    SalesRetur.Invoice.Free;
    SalesRetur.ClearInvoice;
    SalesRetur.ClearCustomer;

    edInv.Clear;
    dtInvoice.Clear;
    edCustomer.Clear;
    CDS.EmptyDataSet;
  end;

//  if not DisableEvent then
  ckReferensiFaktur.Checked := True; //rbJenis.ItemIndex = 1;
end;

procedure TfrmSalesRetur.SetItemToGrid(aItem: TItem);
var
  aTipeHarga: Integer;
  lItemUOM: TItemUOM;
begin
  if SalesRetur.Invoice = nil then
    raise Exception.Create('Faktur belum dipilih');
  if SalesRetur.Invoice.ID = 0 then
    raise Exception.Create('Faktur belum dipilih');

  if aItem = nil then exit;

  DC.SetEditValue(colItemID.Index, aItem.ID, evsValue);
//  DC.SetEditValue(colItemObject, Integer(aItem), evsValue);
  DC.SetEditValue(colKode.Index, aItem.Kode, evsValue);
  DC.SetEditValue(colNama.Index, aItem.Nama, evsValue);
  DC.SetEditValue(colUOM.Index, 0, evsValue);
  DC.SetEditValue(colQty.Index, 0, evsValue);
  DC.SetEditValue(colKonversi.Index, 0, evsValue);
  DC.SetEditValue(colHrgJual.Index, 0, evsValue);
  DC.SetEditValue(colDisc.Index, 0, evsValue);
  DC.SetEditValue(colDiscP.Index, 0, evsValue);
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

    aTipeHarga := GetItemPriceType(lItemUOM.Item.ID);
    if lItemUOM = nil then exit;
    Try
      DC.SetEditValue(colKonversi.Index, lItemUOM.Konversi, evsValue);
      DC.SetEditValue(colHrgJual.Index,
        lItemUOM.GetHarga(aTipeHarga),
        evsValue);
      DC.SetEditValue(colPriceType.Index, aTipeHarga, evsValue);
    Finally
      FreeAndNil(lItemUOM);
    End;
  end;
end;

procedure TfrmSalesRetur.UpdateData;
var
  lItem: TTransDetail;
begin

  SalesRetur.Refno := edNoRetur.Text;
  SalesRetur.TransDate := dtRetur.Date;
  SalesRetur.Notes := edNotes.Text;
  SalesRetur.ReturFlag := rbJenis.ItemIndex;
  SalesRetur.SubTotal := crSubTotal.Value;
  SalesRetur.PPN := crPPN.Value;
  SalesRetur.Amount := crTotal.Value;
  SalesRetur.ModifiedDate := Now();
  SalesRetur.ModifiedBy := UserLogin;

  if SalesRetur.Warehouse = nil then
    SalesRetur.Warehouse := TWarehouse.Create;

  SalesRetur.Warehouse.LoadByID(VarToInt(cxLookupGudang.EditValue));
  SalesRetur.Items.Clear;

  CDS.First;
  while not CDS.Eof do
  begin
    lItem := TTransDetail.Create;
    lItem.SetFromDataset(CDS);

//    lItem.MakeNegative;
    SalesRetur.Items.Add(lItem);
    CDS.Next;
  end;
end;

procedure TfrmSalesRetur.UpdateHarga(aPriceType: Integer);
var
  lItemUOM: TItemUOM;
begin
//  if CDS.Eof then exit;
  if CDS.State in [dsInsert, dsEdit] then CDS.Post;

  lItemUOM := TItemUOM.GetItemUOM(
    CDS.FieldByName('Item').AsInteger,
    CDS.FieldByName('UOM').AsInteger
  );
  if lItemUOM <> nil then
  begin
    Try
      CDS.Edit;
      CDS.FieldByName('Harga').AsFloat := lItemUOM.GetHarga(aPriceType);
      CDS.FieldByName('PriceType').AsInteger := aPriceType;
      CDS.Post;
    Finally
      FreeAndNil(lItemUOM);
    End;
  end;

  CalculateAll;
end;

procedure TfrmSalesRetur.UpdatekeHargaGrosir1Click(Sender: TObject);
begin
  inherited;
  UpdateHarga(1);
end;

procedure TfrmSalesRetur.UpdatekeHargaGrosir2Click(Sender: TObject);
begin
  inherited;
  UpdateHarga(2);
end;

procedure TfrmSalesRetur.UpdatekeHargaKeliling1Click(Sender: TObject);
begin
  inherited;
  UpdateHarga(3);
end;

procedure TfrmSalesRetur.UpdateKeHargaUmum1Click(Sender: TObject);
begin
  inherited;
  UpdateHarga(0);
end;

function TfrmSalesRetur.ValidateData: Boolean;
begin
  Result := False;

//  if ckReferensiFaktur.Checked then
//  begin
    if SalesRetur.Invoice = nil then
    begin
      TAppUtils.Warning('Nomor Faktur belum dipilih');
      exit;
    end;

    if SalesRetur.Invoice.ID = 0 then
    begin
      TAppUtils.Warning('Nomor Faktur belum dipilih');
      exit;
    end;
//  end;


  if crTotal.Value <= 0 then
  begin
    TAppUtils.Warning('Total <= 0');
    exit;
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

  if CDS.Locate('Warehouse', 0, []) or CDS.Locate('Warehouse', null, []) then
  begin
    TAppUtils.Warning('Warehouse tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;

  //validate Inv
//  if ckReferensiFaktur.Checked then
//  begin
    if not ValidateItem then exit;
    if crTotal.Value > SalesRetur.Invoice.Amount then
    begin
      TAppUtils.Warning('Nilai Total Retur melebihi Total Faktur');
      exit;
    end;
//  end;

  if not IsValidTransDate(dtRetur.Date) then exit;

  if (rbJenis.ItemIndex = 1) then
  begin
    if not TfrmAuthUser.Authorize('Autorisasi Retur Batal', edInv.Text, dtRetur.Date) then
    begin
      TAppUtils.Warning('User tidak mendapatkan autorisasi Retur Batal');
      exit;
    end;
  end;

  Result := TAppUtils.Confirm('Anda yakin data sudah sesuai?');

end;

function TfrmSalesRetur.ValidateItem: Boolean;
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

  if SalesRetur.Invoice.Items.Count = 0 then
    SalesRetur.Invoice.ReLoad(True);

  for lItem in SalesRetur.Invoice.Items do
  begin
    if not CDSValidate.Locate('ItemID',lItem.Item.ID,[]) then
      continue;

    CDSValidate.Edit;
    CDSValidate.FieldByName('TotalPCS_Faktur').AsFloat :=
      CDSValidate.FieldByName('TotalPCS_Faktur').AsFloat
       + Abs(lItem.Qty * lItem.Konversi);
    CDSValidate.Post;
  end;

  CDSValidate.Filtered := True;
  CDSValidate.Filter := 'TotalPCS_Retur > TotalPCS_Faktur';

  Result := CDSValidate.Eof;

  if not Result then
    TfrmCXMsgInfo.ShowWarning('Qty Retur tidak boleh melebihi Qty Faktur', CDSValidate, ['ItemID']);

end;

end.
