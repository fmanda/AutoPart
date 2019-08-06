unit ufrmSalesInvoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons, cxGroupBox, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxCurrencyEdit, cxButtonEdit, cxMaskEdit, cxCalendar,
  cxMemo, cxTextEdit, cxLabel, cxRadioGroup, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, uTransDetail,
  cxGridDBDataDefinitions, uItem, Datasnap.DBClient, cxSpinEdit;

type
  TfrmSalesInvoice = class(TfrmDefaultInput)
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
    edCustomer: TcxButtonEdit;
    crAmount: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    crRetur: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    crTotal: TcxCurrencyEdit;
    cxLabel7: TcxLabel;
    cxLookupSalesman: TcxExtLookupComboBox;
    cxLookupGudang: TcxExtLookupComboBox;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLookupMekanik: TcxExtLookupComboBox;
    cxGridItem: TcxGrid;
    cxGrdItem: TcxGridDBTableView;
    colKode: TcxGridDBColumn;
    colNama: TcxGridDBColumn;
    colUOM: TcxGridDBColumn;
    colQty: TcxGridDBColumn;
    colHarga: TcxGridDBColumn;
    colDisc: TcxGridDBColumn;
    colSubTotal: TcxGridDBColumn;
    colWarehouse: TcxGridDBColumn;
    colItemID: TcxGridDBColumn;
    colKonversi: TcxGridDBColumn;
    colPPN: TcxGridDBColumn;
    cxGridItemLevel1: TcxGridLevel;
    cxSplitter: TcxSplitter;
    cxGridService: TcxGrid;
    cxGrdService: TcxGridDBTableView;
    colSrvKode: TcxGridDBColumn;
    colSrvName: TcxGridDBColumn;
    colSrvQty: TcxGridDBColumn;
    colSrvHarga: TcxGridDBColumn;
    colSrvDisc: TcxGridDBColumn;
    colSrvSubTotal: TcxGridDBColumn;
    colSrvID: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Label1: TLabel;
    cbBayar: TcxComboBox;
    cxLabel10: TcxLabel;
    cxLabel13: TcxLabel;
    cxLookupRekening: TcxExtLookupComboBox;
    Label2: TLabel;
    colSrvPPN: TcxGridDBColumn;
    cxLookupFee: TcxExtLookupComboBox;
    cxLabel14: TcxLabel;
    spTempo: TcxSpinEdit;
    cxLabel15: TcxLabel;
    crCreditLimit: TcxCurrencyEdit;
    crCreditUsed: TcxCurrencyEdit;
    cxLabel16: TcxLabel;
    rbHarga: TcxRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    colPriceType: TcxGridDBColumn;
    styleUmum: TcxStyle;
    styleBengkel: TcxStyle;
    styleGrosir: TcxStyle;
    styleKeliling: TcxStyle;
    rbJenis: TcxRadioGroup;
    pmMain: TPopupMenu;
    UpdateKeHargaUmum1: TMenuItem;
    UpdatekeHargaGrosir1: TMenuItem;
    UpdatekeHargaGrosir2: TMenuItem;
    UpdatekeHargaKeliling1: TMenuItem;
    colNo: TcxGridDBColumn;
    cxLabel17: TcxLabel;
    edRetur: TcxButtonEdit;
    crPPN: TcxCurrencyEdit;
    Label7: TLabel;
    btnPayment: TcxButton;
    Label8: TLabel;
    colDiscP: TcxGridDBColumn;
    procedure edCustomerKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edNotesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure colKodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure colKodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure colUOMPropertiesCloseUp(Sender: TObject);
    procedure colUOMPropertiesEditValueChanged(Sender: TObject);
    procedure colUOMPropertiesInitPopup(Sender: TObject);
    procedure colQtyPropertiesEditValueChanged(Sender: TObject);
    procedure colDiscPropertiesEditValueChanged(Sender: TObject);
    procedure edCustomerPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnSaveClick(Sender: TObject);
    procedure cxGrdItemEditKeyDown(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift:
        TShiftState);
    procedure rbHargaPropertiesEditValueChanged(Sender: TObject);
    procedure edCustomerPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cbBayarPropertiesEditValueChanged(Sender: TObject);
    procedure colSrvKodePropertiesEditValueChanged(Sender: TObject);
    procedure colSrvNamePropertiesEditValueChanged(Sender: TObject);
    procedure colSrvQtyPropertiesEditValueChanged(Sender: TObject);
    procedure spTempoPropertiesEditValueChanged(Sender: TObject);
    procedure dtInvoicePropertiesEditValueChanged(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure colDiscPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure colSrvDiscPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure colHargaStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure colNoGetDisplayText(Sender: TcxCustomGridTableItem; ARecord:
        TcxCustomGridRecord; var AText: string);
    procedure edReturKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rbHargaOnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rbJenisPropertiesEditValueChanged(Sender: TObject);
    procedure UpdatekeHargaGrosir1Click(Sender: TObject);
    procedure UpdatekeHargaGrosir2Click(Sender: TObject);
    procedure UpdatekeHargaKeliling1Click(Sender: TObject);
    procedure UpdateKeHargaUmum1Click(Sender: TObject);
    procedure edReturPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edReturPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnPaymentClick(Sender: TObject);
    procedure colDiscPPropertiesEditValueChanged(Sender: TObject);
    procedure colDiscPPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    DisableTrigger: Boolean;
    FCDS: TClientDataset;
    FCDSService: TClientDataset;
    FCDSClone: TClientDataset;
    FCDSCloneServ: TClientDataset;
    FCDSDummy: TClientDataset;
    FCDSUOM: TClientDataset;
    FCDSMasterService: TClientDataset;
    FCDSValidate: TClientDataset;
    FSalesInv: TSalesInvoice;
    procedure CalculateAll;
    procedure CDSAfterDelete(DataSet: TDataSet);
    procedure CDSAfterInsert(DataSet: TDataSet);
    function CheckCreditLimit: Boolean;
    function CheckStock: Boolean;
    function DC: TcxGridDBDataController;
    function DCService: TcxGridDBDataController;
    procedure FocusToGrid;
    procedure FocusToService;
    function GetCDS: TClientDataset;
    function GetCDSService: TClientDataset;
    function GetCDSClone: TClientDataset;
    function GetCDSCloneServ: TClientDataset;
    function GetCDSDummy: TClientDataset;
    function GetCDSUOM: TClientDataset;
    function GetCDSMasterService: TClientDataset;
    function GetSalesInv: TSalesInvoice;
    procedure InitView;
    procedure LoadCreditLimitUsed(ResetCreditLimit: Boolean = False; AEditedValue:
        Double = 0);
    procedure LookupItem(aKey: string = '');
    procedure LookupCustomer(sKey: string = '');
    procedure LookupRetur(aKey: string = '');
    procedure SetCDSValidate(const Value: TClientDataset);
    procedure SetDefaultValueTipeHarga;
    procedure SetItemToGrid(aItem: TItem);
    procedure UpdateData;
    procedure UpdateHarga(aPriceType: Integer);
    function ValidateData(WithPaymentDlg: Boolean = False): Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSService: TClientDataset read GetCDSService write FCDSService;
    property CDSClone: TClientDataset read GetCDSClone write FCDSClone;
    property CDSCloneServ: TClientDataset read GetCDSCloneServ write FCDSCloneServ;
    property CDSDummy: TClientDataset read GetCDSDummy write FCDSDummy;
    property CDSUOM: TClientDataset read GetCDSUOM write FCDSUOM;
    property CDSMasterService: TClientDataset read GetCDSMasterService write
        FCDSMasterService;
    property SalesInv: TSalesInvoice read GetSalesInv write FSalesInv;
    { Private declarations }
  protected
    procedure GenerateDummy;
    property CDSValidate: TClientDataset read FCDSValidate write SetCDSValidate;
  public
    function GetGroupName: string; override;
    procedure LoadByID(aID: Integer; SalesType: Integer = -1; IsReadOnly: Boolean =
        True);
    { Public declarations }
  published
  end;

var
  frmSalesInvoice: TfrmSalesInvoice;

implementation

uses
  uDXUtils, uDBUtils, uAppUtils, ufrmCXServerLookup, uCustomer, cxDataUtils,
  uWarehouse, uMekanik, uSalesman, uVariable, uAccount, uSettingFee,
  ufrmDialogPayment, uPrintStruk, ufrmAuthUser, uStockCheck, ufrmLookupItem;

{$R *.dfm}

procedure TfrmSalesInvoice.btnPaymentClick(Sender: TObject);
begin
  inherited;
  btnSaveClick(Sender);
end;

procedure TfrmSalesInvoice.btnPrintClick(Sender: TObject);
begin
  inherited;
  if SalesInv.SalesType = SalesType_FrontEnd then
    TPrintStruk.Print(SalesInv)
  else
    TSalesInvoice.PrintData(SalesInv.ID);
end;

procedure TfrmSalesInvoice.btnSaveClick(Sender: TObject);
var
  lWithPaymentDlg: Boolean;
begin
  inherited;
  lWithPaymentDlg := Sender = btnPayment;

  if not ValidateData(lWithPaymentDlg) then exit;
  UpdateData;
  if SalesInv.SaveRepeat(False) then
  begin
//    TAppUtils.InformationBerhasilSimpan;
//    Self.ModalResult := mrOK;
    btnPrint.Click;
    LoadByID(0, rbHarga.ItemIndex, False);
  end;
end;

procedure TfrmSalesInvoice.CalculateAll;
var
  dPPN: Double;
  dSubTotal: Double;
begin
  DisableTrigger := True;
  if CDS.State in [dsInsert, dsEdit] then
    CDS.Post;

  if CDSService.State in [dsInsert, dsEdit] then
    CDSService.Post;

  CDS.DisableControls;
  CDSService.DisableControls;

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

    CDSCloneServ.First;
    while not CDSCloneServ.Eof do
    begin
      CDSCloneServ.Edit;
      CDSCloneServ.FieldByName('SubTotal').AsFloat :=
        (CDSCloneServ.FieldByName('Harga').AsFloat - CDSCloneServ.FieldByName('Discount').AsFloat)
        * CDSCloneServ.FieldByName('QTY').AsFloat;
      dSubTotal := dSubTotal +  CDSCloneServ.FieldByName('SubTotal').AsFloat;
      dPPN :=  dPPN + (CDSCloneServ.FieldByName('PPN').AsFloat * CDSCloneServ.FieldByName('SubTotal').AsFloat / 100);

      CDSCloneServ.Post;
      CDSCloneServ.Next;
    end;

    crPPN.Value       := dPPN;
    crAmount.Value    := dSubTotal + dPPN;
    crTotal.Value     := crAmount.Value - crRetur.Value;
  Finally
    CDS.EnableControls;
    CDSService.EnableControls;
    DisableTrigger := False;
  End;
end;

procedure TfrmSalesInvoice.cbBayarPropertiesEditValueChanged(Sender: TObject);
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

end;

procedure TfrmSalesInvoice.CDSAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmSalesInvoice.CDSAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('Warehouse').AsInteger := VarToInt(cxLookupGudang.EditValue);
end;

function TfrmSalesInvoice.CheckCreditLimit: Boolean;
var
  lRemain: Double;
begin
  Result := AppVariable.Check_CreditLimit <> 1;
  if Result then exit;

  Result := cbBayar.ItemIndex = PaymentFlag_Cash;
  if Result then exit;

  Result := SalesInv.Customer.CreditLimit = 0;
  if Result then exit;

  lRemain := crCreditLimit.Value - crCreditUsed.Value;
  lRemain := lRemain - crTotal.Value;

  if lRemain < -1 then
  begin
//    Result := TAppUtils.Confirm('Nilai Faktur melebihi Sisa Credit Limit'
//      +#13 +'Anda yakin melanjutkan simpan?'
//    );

//    if Result then
//    begin
      Result := TfrmAuthUser.Authorize('Autorisasi Credit Limit');
//    end;

  end else
    Result := True;
end;

function TfrmSalesInvoice.CheckStock: Boolean;
var
  lCalc: TStockCheck;
  lCDS: TClientDataSet;
  lItem: TTransDetail;
  lOldSalesInv: TSalesInvoice;
  QTYPCS: Integer;
begin
  Result := AppVariable.Check_Stock <> 1;
  if Result then exit;

  lCalc := TStockCheck.Create(dtInvoice.Date);
  lOldSalesInv := TSalesInvoice.Create;
  Application.ProcessMessages;

  lCDS := TClientDataSet.Create(Self);
  Try
    lCDS.CloneCursor(CDS, True);
    lCDS.First;
    while not lCDS.Eof do
    begin
      QTYPCS   := lCDS.FieldByName('QTY').AsInteger * lCDS.FieldByName('Konversi').AsInteger;
      lCalc.AddCalcItem(
        lCDS.FieldByName('Item').AsInteger,
        lCDS.FieldByName('Warehouse').AsInteger,
        QTYPCS
      );
      lCDS.Next;
    end;

    //apabila edit
    If SalesInv.ID <> 0 then
    begin
      lOldSalesInv.LoadByID(SalesInv.ID);
      for lItem in lOldSalesInv.Items do
      begin
        lCalc.AddOnHandPCS(
            lItem.Item.ID,
            lItem.Warehouse.ID,
            lItem.Qty * lItem.Konversi
          );
      end;
    end;
    Result := lCalc.CheckStockIgnore(True);
  finally
    lCDS.Free;
    lOldSalesInv.Free;
    lCalc.Free;
  End;
end;

procedure TfrmSalesInvoice.colDiscPPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmSalesInvoice.colDiscPPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  lDiscRp: Double;
  lHarga: Double;
begin
  inherited;
  if DisableTrigger then exit;

  if VarToFloat(DisplayValue) = 0 then
  begin
    DC.SetEditValue(colDisc.Index, 0 , evsValue);
    DC.SetEditValue(colDiscP.Index, 0 , evsValue);
    exit;
  end;

  if not TfrmAuthUser.Authorize then
  begin
    ErrorText := 'User tidak mendapatkan autorisasi diskon';
    Error := True;
  end else
  begin
    lHarga    := VarToFloat(cxGrdItem.Controller.FocusedRecord.Values[colHarga.Index]);
    lDiscRp   := VarToFloat(DisplayValue)/100 * lHarga;
    DC.SetEditValue(colDisc.Index, lDiscRp , DisplayValue);
    DC.SetEditValue(colDiscP.Index, DisplayValue , evsValue);
    Error := False;
  end;
end;

procedure TfrmSalesInvoice.colDiscPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmSalesInvoice.colDiscPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  lDiscP: Double;
  lHarga: Double;
begin
  inherited;
  if DisableTrigger then exit;
  if VarToFloat(DisplayValue) = 0 then
  begin
    DC.SetEditValue(colDiscP.Index, 0 , evsValue);
    exit;
  end;
  if not TfrmAuthUser.Authorize then
  begin
    ErrorText := 'User tidak mendapatkan autorisasi diskon';
    Error := True;
  end else
  begin
    Error     := False;
    lHarga    := VarToFloat(cxGrdItem.Controller.FocusedRecord.Values[colHarga.Index]);
    if lHarga = 0 then
      lDiscP := 0
    else
      lDiscP := VarToFloat(DisplayValue)/lHarga*100;
    DC.SetEditValue(colDiscP.Index, lDiscP , evsValue);
    DC.SetEditValue(colDisc.Index, DisplayValue , evsValue);
  end;

end;

procedure TfrmSalesInvoice.colHargaStylesGetContentStyle(
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

procedure TfrmSalesInvoice.colKodePropertiesButtonClick(Sender: TObject;
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

procedure TfrmSalesInvoice.colKodePropertiesValidate(Sender: TObject;
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

procedure TfrmSalesInvoice.colNoGetDisplayText(Sender: TcxCustomGridTableItem;
    ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if ARecord = nil then exit;
  AText := VarToStr(ARecord.RecordIndex + 1);
end;

procedure TfrmSalesInvoice.colQtyPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmSalesInvoice.colSrvDiscPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if VarToFloat(DisplayValue) = 0 then exit;

  if not TfrmAuthUser.Authorize then
  begin
    ErrorText := 'User tidak mendapatkan autorisasi diskon';
    Error := True;
  end;
end;

procedure TfrmSalesInvoice.colSrvKodePropertiesEditValueChanged(
  Sender: TObject);
var
  iServiceID: Integer;
begin
  inherited;
  iServiceID := VarToInt(DCService.Controller.FocusedRecord.Values[colSrvKode.Index]);
  DCService.SetEditValue(colSrvName.Index, DCService.Controller.FocusedRecord.Values[colSrvKode.Index], evsValue);
  if VarToInt(DCService.Controller.FocusedRecord.Values[colSrvQty.Index]) = 0 then
    DCService.SetEditValue(colSrvQty.Index, 1, evsValue);

  if CDSMasterService.Locate('id', iServiceID, []) then
  begin
    DCService.SetEditValue(colSrvHarga.Index, CDSMasterService.FieldByName('Biaya').AsFloat, evsValue);
    DCService.SetEditValue(colSrvPPN.Index, CDSMasterService.FieldByName('PPN').AsFloat, evsValue);
    DCService.SetEditValue(colSrvDisc.Index, 0, evsValue);
  end;
  colSrvQty.FocusWithSelection;
  cxGrdService.Controller.EditingController.ShowEdit;
  CalculateAll;
end;

procedure TfrmSalesInvoice.colSrvNamePropertiesEditValueChanged(
  Sender: TObject);
var
  iServiceID: Integer;
begin
  inherited;
  iServiceID := VarToInt(DCService.Controller.FocusedRecord.Values[colSrvName.Index]);
  DCService.SetEditValue(colSrvKode.Index, DCService.Controller.FocusedRecord.Values[colSrvName.Index], evsValue);
  if VarToInt(DCService.Controller.FocusedRecord.Values[colSrvQty.Index]) = 0 then
    DCService.SetEditValue(colSrvQty.Index, 1, evsValue);

  if CDSMasterService.Locate('id', iServiceID, []) then
  begin
    DCService.SetEditValue(colSrvHarga.Index, CDSMasterService.FieldByName('Biaya').AsFloat, evsValue);
    DCService.SetEditValue(colSrvPPN.Index, CDSMasterService.FieldByName('PPN').AsFloat, evsValue);
    DCService.SetEditValue(colSrvDisc.Index, 0, evsValue);
  end;
  colSrvQty.FocusWithSelection;
  cxGrdService.Controller.EditingController.ShowEdit;
  CalculateAll;
end;

procedure TfrmSalesInvoice.colSrvQtyPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmSalesInvoice.colUOMPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  with TcxExtLookup(colUOM.Properties).DataController.filter do
  begin
    BeginUpdate;
    Root.Clear;
    EndUpdate;
  end;
end;

procedure TfrmSalesInvoice.colUOMPropertiesEditValueChanged(Sender: TObject);
var
  lItemUOM: TItemUOM;
begin
  inherited;

  lItemUOM := TItemUOM.GetItemUOM(
    VarToInt(cxGrdItem.Controller.FocusedRecord.Values[colItemID.Index]),
    VarToInt(cxGrdItem.Controller.FocusedRecord.Values[colUOM.Index])
  );
  if lItemUOM = nil then exit;
  Try
    DC.SetEditValue(colKonversi.Index, lItemUOM.Konversi, evsValue);
    DC.SetEditValue(colHarga.Index, lItemUOM.GetHarga(rbHarga.ItemIndex), evsValue);
    DC.SetEditValue(colPriceType.Index, rbHarga.ItemIndex , evsValue);

    CalculateAll;
    colQty.FocusWithSelection;
    cxGrdItem.Controller.EditingController.ShowEdit;
  Finally
    FreeAndNil(lItemUOM);
  End;
end;

procedure TfrmSalesInvoice.colUOMPropertiesInitPopup(Sender: TObject);
var
  lItem: TItem;
  lItemUOM: TItemUOM;
begin
  inherited;
  if cxGrdItem.Controller.FocusedRecord = nil then exit;
  lItem := TItem.Create;
  Try
    lItem.LoadByID(VarToInt(cxGrdItem.Controller.FocusedRecord.Values[colItemID.Index]));
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

procedure TfrmSalesInvoice.cxGrdItemEditKeyDown(Sender: TcxCustomGridTableView;
    AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if (Key = VK_F5) and (aItem = colKode) then
  begin
    LookupItem(VarToStr(AEdit.EditingValue));
  end;
end;

function TfrmSalesInvoice.DC: TcxGridDBDataController;
begin
  Result := cxGrdItem.DataController;
end;

function TfrmSalesInvoice.DCService: TcxGridDBDataController;
begin
  Result := cxGrdService.DataController;
end;

procedure TfrmSalesInvoice.dtInvoicePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  dtJtTempo.Date := dtInvoice.Date + spTempo.Value;
end;

procedure TfrmSalesInvoice.edCustomerKeyDown(Sender: TObject; var Key: Word;
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
    LookupCustomer(sKey);
  end else if Key = VK_RETURN then
  begin
    SelectNext(Screen.ActiveControl, True, True);
  end;
end;

procedure TfrmSalesInvoice.edCustomerPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  LookupCustomer;
end;

procedure TfrmSalesInvoice.edCustomerPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if SalesInv.Customer = nil then
    SalesInv.Customer := TCustomer.Create;
  SalesInv.Customer.LoadByCode(VarToStr(DisplayValue));
  LoadCreditLimitUsed;
  edCustomer.Text := SalesInv.Customer.Nama;
end;

procedure TfrmSalesInvoice.edNotesKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    rbHarga.SetFocus;
  end;
end;

procedure TfrmSalesInvoice.edReturKeyDown(Sender: TObject; var Key: Word;
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
    LookupRetur(sKey);
  end else if Key = VK_RETURN then
  begin
    SelectNext(Screen.ActiveControl, True, True);
  end;
end;

procedure TfrmSalesInvoice.edReturPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  LookupRetur();
end;

procedure TfrmSalesInvoice.edReturPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if SalesInv.SalesRetur = nil then
    SalesInv.SalesRetur := TSalesRetur.Create;
  if SalesInv.SalesRetur.LoadByCode(VarToStr(DisplayValue)) then
  begin
    edRetur.Text := SalesInv.SalesRetur.Refno;
    crRetur.Value := SalesInv.SalesRetur.Amount;// - SalesInv.SalesRetur.PaidAmount;
  end else
  begin
    SalesInv.ClearRetur;
    edRetur.Clear;
    crRetur.Value := 0;
  end;
  crTotal.Value := crAmount.Value - crRetur.Value;
end;

procedure TfrmSalesInvoice.rbHargaOnKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    FocusToGrid;
  end;
end;

procedure TfrmSalesInvoice.FocusToGrid;
begin
  cxGridItem.SetFocus;
  cxGridItem.FocusedView := cxGrdItem;
  if cxGrdItem.DataController.RecordCount = 0 then
  begin
    CDS.Append;
    colKode.FocusWithSelection;
    cxGrdItem.Controller.EditingController.ShowEdit;
  end;
end;

procedure TfrmSalesInvoice.FocusToService;
begin
  cxGridService.SetFocus;
  cxGridService.FocusedView := cxGrdService;
  if CDSService.RecordCount = 0 then
  begin
    CDSService.Append;
    cxGrdService.Controller.EditingController.ShowEdit;
  end;
end;

procedure TfrmSalesInvoice.FormCreate(Sender: TObject);
begin
  inherited;
  InitView;
  Self.AssignKeyDownEvent;
  LoadByID(0, 0, False);
end;

procedure TfrmSalesInvoice.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_F1 then
    dtInvoice.SetFocus;

  if Key = VK_F2 then
  begin
    FocusToGrid;
  end
  else if Key = VK_F3 then
  begin
    FocusToService;
  end
  else if Key = VK_F12 then
  begin
    if cxSplitter.State = ssOpened  then
      cxSplitter.CloseSplitter
    else
      cxSplitter.OpenSplitter;
  end else if Key = VK_F9 then
  begin
    btnPayment.Click;

  end;

end;

procedure TfrmSalesInvoice.GenerateDummy;
var
  i: Integer;
  iCount: Integer;
  lItem: TItem;
begin
  LoadByID(0, 0, False);
  rbJenis.ItemIndex := Random(2);
  cxLookupSalesman.SetDefaultValue();
  cxLookupFee.SetDefaultValue();
  cxLookupMekanik.SetDefaultValue();

  cbBayar.ItemIndex := PaymentFlag_Credit;
  dtInvoice.Date := Now() - (Random(60));

  if SalesInv.Customer = nil then
    SalesInv.Customer := TCustomer.Create;
  while true do
  begin
    if SalesInv.Customer.LoadByID(Random(409)) then
      break;
  end;
  edCustomer.Text := SalesInv.Customer.Nama;
  dtJtTempo.Date := dtInvoice.Date + Random(14);
  cxLookupGudang.SetDefaultValue();
  cxLookupRekening.SetDefaultValue();
  edNotes.Text := 'Dummy Data';

  iCount := 10;
  lItem := TItem.Create;
  Try
    CDSDummy.First;
    for i := 0 to iCount do
    begin
//      DC.FocusedRecordIndex := DC.AppendRecord;


      if not lItem.LoadByID(CDSDummy.FieldByName('ID').AsInteger) then continue;
      if lItem.ItemUOMs[0].HargaBeli = 0 then continue;

      if i>0 then DC.Append;

      SetItemToGrid(lItem);
      DC.SetEditValue(colQty.Index, Random(9) + 1, evsValue);
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
//  SalesInv.SaveRepeat();

end;

function TfrmSalesInvoice.GetCDS: TClientDataset;
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

function TfrmSalesInvoice.GetCDSService: TClientDataset;
begin
  if FCDSService = nil then
  begin
    FCDSService := TServiceDetail.CreateDataSet(Self, False);
    FCDSService.AddField('SubTotal',ftFloat);
    FCDSService.AfterDelete := CDSAfterDelete;
    FCDSService.CreateDataSet;
  end;
  Result := FCDSService;
end;

function TfrmSalesInvoice.GetCDSClone: TClientDataset;
begin
  if FCDSClone = nil then
  begin
    FCDSClone := CDS.ClonedDataset(Self);
  end;
  Result := FCDSClone;
end;

function TfrmSalesInvoice.GetCDSCloneServ: TClientDataset;
begin
  if FCDSCloneServ = nil then
  begin
    FCDSCloneServ := CDSService.ClonedDataset(Self);
  end;
  Result := FCDSCloneServ;
end;

function TfrmSalesInvoice.GetCDSDummy: TClientDataset;
begin
  if FCDSDummy = nil then
  begin
    FCDSDummy := TDBUtils.OpenDataset('select * from titem where nama like ''oli%'' ',Self);
  end;
  Result := FCDSDummy;
end;

function TfrmSalesInvoice.GetCDSUOM: TClientDataset;
begin
  if FCDSUOM = nil then
  begin
    FCDSUOM := TDBUtils.OpenDataset('select id, uom from tuom',Self);
  end;
  Result := FCDSUOM;
end;

function TfrmSalesInvoice.GetCDSMasterService: TClientDataset;
begin
  if FCDSMasterService = nil then
  begin
    FCDSMasterService := TDBUtils.OpenDataset('select id, kode, nama, biaya, ppn from tservice',Self);
  end;
  Result := FCDSMasterService;
end;

function TfrmSalesInvoice.GetGroupName: string;
begin
  Result := 'Penjualan & Kas';
end;

function TfrmSalesInvoice.GetSalesInv: TSalesInvoice;
begin
  if FSalesInv = nil then
    FSalesInv := TSalesInvoice.Create;
  Result := FSalesInv;
end;

procedure TfrmSalesInvoice.InitView;
begin
  cxGrdItem.PrepareFromCDS(CDS);
  cxGrdService.PrepareFromCDS(CDSService);

  TcxExtLookup(colSrvKode.Properties).LoadFromCDS(CDSMasterService,'id','kode',['id','nama'], Self);
  TcxExtLookup(colSrvName.Properties).LoadFromCDS(CDSMasterService,'id','nama',['id','kode'], Self);

  TcxExtLookup(colWarehouse.Properties).LoadFromSQL(Self,
    'select id, nama from twarehouse where is_external = 0','nama');
  TcxExtLookup(colUOM.Properties).LoadFromCDS(CDSUOM, 'id', 'uom', ['id'], Self);
  cxLookupGudang.Properties.LoadFromSQL(Self,
    'select id, nama from twarehouse where is_external = 0','nama');

  cxLookupGudang.SetDefaultValue();

  cxLookupSalesman.Properties.LoadFromSQL(Self,
    'select id, nama from tsalesman','nama');
//  cxLookupSalesman.SetDefaultValue();

  cxLookupMekanik.Properties.LoadFromSQL(Self,
    'select id, nama from tmekanik','nama');
//  cxLookupMekanik.SetDefaultValue();

  cxLookupRekening.Properties.LoadFromSQL(Self,
    'select id, nama from trekening','nama');

  cxLookupFee.Properties.LoadFromSQL(Self,
    'select id, nama from TSettingFee','nama');

  if SalesInv.Rekening = nil then
    SalesInv.Rekening := TRekening.Create;

  SalesInv.Rekening.LoadByCode(AppVariable.Def_Rekening);
  cxLookupRekening.EditValue := SalesInv.Rekening.ID;

  rbHarga.OnKeyDown := rbHargaOnKeyDown;
end;

procedure TfrmSalesInvoice.LoadByID(aID: Integer; SalesType: Integer = -1;
    IsReadOnly: Boolean = True);
var
  lEditedVal: Double;
  lItem: TTransDetail;
  lService: TServiceDetail;
begin
  if FSalesInv <> nil then
    FreeAndNil(FSalesInv);

  SalesInv.LoadByID(aID);
  CDS.EmptyDataSet;
  CDSService.EmptyDataSet;

  if aID = 0 then
  begin
    SalesInv.TransDate    := Now();
    SalesInv.DueDate      := Now();
    SalesInv.PaymentFlag  := 0;
    SalesInv.InvoiceNo    := SalesInv.GenerateNo(rbJenis.ItemIndex);

    if SalesType = -1 then
      SalesType := SalesType_FrontEnd;

    rbJenis.ItemIndex     := SalesType;
    rbJenisPropertiesEditValueChanged(Self);
  end;
//  else
//  begin
//    rbJenis.ItemIndex     := SalesInv.SalesType;
//    rbJenisPropertiesEditValueChanged(Self);
//  end;

  if (aID <> 0) and (not IsReadOnly) then
  begin
    IsReadOnly := not IsValidTransDate(SalesInv.TransDate);
  end;

  edNoInv.Text := SalesInv.InvoiceNo;

  if aID <> 0 then DisableTrigger := True;
  Try
    cbBayar.ItemIndex := SalesInv.PaymentFlag;
    cbBayarPropertiesEditValueChanged(Self);

//    if SalesType = -1 then
      SalesType := SalesInv.SalesType;

    rbJenis.ItemIndex := SalesType;
    rbJenisPropertiesEditValueChanged(Self);
  Finally
    DisableTrigger := False;
  End;

  dtInvoice.Date := SalesInv.TransDate;
  dtJtTempo.Date := SalesInv.DueDate;
  spTempo.Value := SalesInv.DueDate - SalesInv.TransDate;

  crAmount.Value := SalesInv.Amount;

  if SalesInv.HasRetur then
  begin
    SalesInv.SalesRetur.ReLoad(False);
    crRetur.Value := Salesinv.SalesRetur.Amount;
  end;

  crPPN.Value := SalesInv.PPN;
  crTotal.Value := crAmount.Value - crRetur.Value;
  edNotes.Text := SalesInv.Notes;

//  edCustomer.Clear;
  if SalesInv.Customer <> nil then
  begin
    SalesInv.Customer.ReLoad(False);
    edCustomer.Text := SalesInv.Customer.Nama;

    lEditedVal := 0;
    if SalesInv.PaymentFlag = PaymentFlag_Credit then
      lEditedVal := SalesInv.Amount;

    LoadCreditLimitUsed(False, lEditedVal);
  end;

//  cxLookupGudang.Clear;
  if SalesInv.Warehouse <> nil then
    cxLookupGudang.EditValue := SalesInv.Warehouse.ID;

  cxLookupSalesman.Clear;
  if SalesInv.Salesman <> nil then
    cxLookupSalesman.EditValue := SalesInv.Salesman.ID;

  cxLookupMekanik.Clear;
  if SalesInv.Mekanik <> nil then
     cxLookupMekanik.EditValue := SalesInv.Mekanik.ID;

  cxLookupFee.Clear;
  if SalesInv.SettingFee <> nil then
     cxLookupFee.EditValue := SalesInv.SettingFee.ID;

  for lItem in SalesInv.Items do
  begin
    CDS.Append;
    lItem.MakePositive;
    lItem.UpdateToDataset(CDS);
    lItem.Item.ReLoad(False);
    CDS.FieldByName('Kode').AsString := lItem.Item.Kode;
    CDS.FieldByName('Nama').AsString := lItem.Item.Nama;

    if lItem.Harga <> 0 then
      CDS.FieldByName('DiscP').AsFloat := lItem.Discount / lItem.Harga * 100;

    CDS.Post;
  end;

  for lService in SalesInv.Services do
  begin
    CDSService.Append;
    lService.UpdateToDataset(CDSService);
    CDSService.Post;
  end;

  CalculateAll;
  btnSave.Enabled := not IsReadOnly;

  if Self.Visible then
  begin
    if rbJenis.ItemIndex = 0 then
      FocusToGrid
    else
      dtInvoice.SetFocus;
  end;

end;

procedure TfrmSalesInvoice.LoadCreditLimitUsed(ResetCreditLimit: Boolean =
    False; AEditedValue: Double = 0);
var
  S: string;
begin
  if ResetCreditLimit then
  begin
    crCreditLimit.Value := 0;
    crCreditUsed.Value  := 0;
  end else
  begin
    crCreditLimit.Value := 0;
    crCreditUsed.Value  := 0;

    S := 'SELECT * FROM FN_GETCREDITLIMIT(' + IntToStr(SalesInv.Customer.ID)+')';
    with TDBUtils.OpenQuery(S) do
    begin
      Try
        if not eof then
        begin
          crCreditLimit.Value := FieldByName('CREDITLIMIT').AsFloat;
          crCreditUsed.Value  := FieldByName('CREDITUSED').AsFloat;
        end;
      Finally
        Free;
      End;
    end;

    crCreditUsed.Value := crCreditUsed.Value - AEditedValue;
  end;
end;

procedure TfrmSalesInvoice.LookupItem(aKey: string = '');
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

procedure TfrmSalesInvoice.rbHargaPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
//  if CDS.RecordCount > 0 then
//  begin
//    if SalesInv.SalesType <> rbHarga.ItemIndex then
//    begin
//      //update harga
//      if TAppUtils.Confirm('Anda yakin harga diubah menjadi : ' + rbHarga.Properties.Items[rbHarga.ItemIndex].Caption + '?')
//      then
//      begin
//        UpdateHarga;
//        cxLookupFee.Clear;
//        cxLookupSalesman.Clear;
////        SalesInv.SalesType := rbHarga.ItemIndex;
//      end else
//      begin
//        rbHarga.ItemIndex := SalesInv.SalesType;
//        exit;
//      end;
//    end;
//  end;


  
end;

procedure TfrmSalesInvoice.rbJenisPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  SalesInv.SalesType := rbJenis.ItemIndex;

  if not DisableTrigger then
    SetDefaultValueTipeHarga;
  cxLookupMekanik.Enabled := rbJenis.ItemIndex = 0;
  cxGridService.Visible := rbJenis.ItemIndex = 0;

//  cxLookupSalesman.TabStop := rbHarga.ItemIndex in [2,3];
  cxLookupMekanik.TabStop := rbJenis.ItemIndex = 0;

  cxLookupSalesman.Enabled := rbJenis.ItemIndex = 1;
  cxLookupFee.Enabled := rbJenis.ItemIndex = 1;

//  cxLookupRekening.TabOrder := cbBayar.ItemIndex = 0;

  if not cxGridService.Visible then
  begin
//    CDSService.EmtpyDataSet;
  end;

end;

procedure TfrmSalesInvoice.LookupCustomer(sKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  S: string;
begin
  S := 'select * from TCUSTOMER';
  cxLookup := TfrmCXServerLookup.Execute(S, 'ID');
  Try
    cxLookup.PreFilter('Nama', sKey);
    if cxLookup.ShowModal = mrOK then
    begin
      if SalesInv.Customer = nil then
        SalesInv.Customer := TCustomer.Create;
      SalesInv.Customer.LoadByID(cxLookup.FieldValue('id'));
      LoadCreditLimitUsed;
      edCustomer.Text := SalesInv.Customer.Nama;
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmSalesInvoice.LookupRetur(aKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  S: string;
begin
  if SalesInv.Customer = nil then
  begin
    TAppUtils.Warning('Customer belum terisi');
    exit;
  end;

  S := 'SELECT A.ID, A.REFNO, A.TRANSDATE,  B.NAMA AS CUSTOMER,'
      +' A.AMOUNT, A.NOTES'
      +' FROM TSALESRETUR A'
      +' INNER JOIN TCUSTOMER B ON A.CUSTOMER_ID = B.ID'
      +' WHERE ISNULL(A.PAIDAMOUNT,0) = 0 '
//      + FloatToStr(AppVariable.Toleransi_Piutang)
      +' AND A.CUSTOMER_ID = ' + IntToStr(SalesInv.Customer.ID);


  cxLookup := TfrmCXServerLookup.Execute(S, 'ID', (Now()), (Now()) );
  Try
    cxLookup.PreFilter('REFNO', aKey);
    if cxLookup.ShowModal = mrOK then
    begin
      SalesInv.ClearRetur;
      SalesInv.SalesRetur := TSalesRetur.Create;
      SalesInv.SalesRetur.LoadByID(VarToInt(cxLookup.FieldValue('ID')), False);
      edRetur.Text := SalesInv.SalesRetur.Refno;
      crRetur.Value := SalesInv.SalesRetur.Amount;// - SalesInv.SalesRetur.PaidAmount;
      crTotal.Value := crAmount.Value - crRetur.Value;
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmSalesInvoice.SetCDSValidate(const Value: TClientDataset);
begin
  if FCDSValidate = nil then
  begin
    FCDSValidate := TClientDataset.Create(Self);
    FCDSValidate.AddField('Item_ID', ftInteger);
    FCDSValidate.AddField('Kode', ftString);
    FCDSValidate.AddField('Nama', ftString);
    FCDSValidate.AddField('UOM', ftString);
    FCDSValidate.AddField('Stock', ftFloat);
    FCDSValidate.AddField('OnHand', ftFloat);
    FCDSValidate.AddField('Qty', ftFloat);
    FCDSValidate.CreateDataSet;
  end;
  FCDSValidate := Value;
end;

procedure TfrmSalesInvoice.SetDefaultValueTipeHarga;
begin
  if SalesInv.Customer = nil then
    SalesInv.Customer := TCustomer.Create;

  Case rbJenis.ItemIndex of
    0 :
    begin
      SalesInv.Customer.LoadByCode(AppVariable.Def_Cust_Umum);
      LoadCreditLimitUsed(True);
      edCustomer.Text := SalesInv.Customer.Nama;
      cbBayar.ItemIndex := PaymentFlag_Cash;
      rbHarga.ItemIndex := 0;
//      cxLookupFee.Clear;
//      cxLookupSalesman.Clear;
    end;
    1 :
    begin
      cbBayar.ItemIndex := PaymentFlag_Credit;
      rbHarga.ItemIndex := 3;
//      SalesInv.Customer.LoadByCode(AppVariable.Def_Cust_Bengkel);
//      LoadCreditLimitUsed(True);
//      edCustomer.Text := SalesInv.Customer.Nama;
//      cbBayar.ItemIndex := PaymentFlag_Cash;
    end;
//    3 :
//    begin
////      SalesInv.Customer.LoadByCode(AppVariable.Def_Cust_Bengkel);
////      edCustomer.Text := SalesInv.Customer.Nama;
//      cbBayar.ItemIndex := PaymentFlag_Credit;
//    end;
  end
end;

procedure TfrmSalesInvoice.SetItemToGrid(aItem: TItem);
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
  DC.SetEditValue(colHarga.Index, 0, evsValue);
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
      VarToInt(cxGrdItem.Controller.FocusedRecord.Values[colItemID.Index]),
      VarToInt(cxGrdItem.Controller.FocusedRecord.Values[colUOM.Index])
    );
    if lItemUOM = nil then exit;
    Try
      DC.SetEditValue(colKonversi.Index, lItemUOM.Konversi, evsValue);
      DC.SetEditValue(colHarga.Index, lItemUOM.GetHarga(rbHarga.ItemIndex), evsValue);
      DC.SetEditValue(colPriceType.Index, rbHarga.ItemIndex , evsValue);
    Finally
      FreeAndNil(lItemUOM);
    End;
  end;
end;

procedure TfrmSalesInvoice.spTempoPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  dtJtTempo.Date := dtInvoice.Date + spTempo.Value;
end;

procedure TfrmSalesInvoice.UpdateData;
var
  lItem: TTransDetail;
  lService: TServiceDetail;
begin
  CalculateAll;

  SalesInv.InvoiceNo := edNoInv.Text;
  SalesInv.TransDate := dtInvoice.Date;
  SalesInv.DueDate  := dtJtTempo.Date;
  SalesInv.Notes := edNotes.Text;
  SalesInv.PaymentFlag := cbBayar.ItemIndex;
  SalesInv.SalesType := rbJenis.ItemIndex;

  SalesInv.SubTotal := crAmount.Value - crPPN.Value;
  SalesInv.PPN := crPPN.Value;
  SalesInv.Amount := crAmount.Value;

  SalesInv.ModifiedDate := Now();
  SalesInv.ModifiedBy := UserLogin;

  if SalesInv.Warehouse = nil then
    SalesInv.Warehouse := TWarehouse.Create;
  SalesInv.Warehouse.ID := VarToInt(cxLookupGudang.EditValue);

  if SalesInv.Mekanik = nil then
    SalesInv.Mekanik := TMekanik.Create;
  SalesInv.Mekanik.ID := VarToInt(cxLookupMekanik.EditValue);

  if SalesInv.Salesman = nil then
    SalesInv.Salesman := TSalesman.Create;
  SalesInv.Salesman.ID := VarToInt(cxLookupSalesman.EditValue);

  if SalesInv.Rekening = nil then
    SalesInv.Rekening := TRekening.Create;
  SalesInv.Rekening.ID := VarToInt(cxLookupRekening.EditValue);

  if SalesInv.SettingFee = nil then
    SalesInv.SettingFee := TSettingFee.Create;
  SalesInv.SettingFee.ID := VarToInt(cxLookupFee.EditValue);

  SalesInv.Items.Clear;
  CDS.First;
  while not CDS.Eof do
  begin
    lItem := TTransDetail.Create;
    lItem.SetFromDataset(CDS);

    //user tidak memilih gudang lagi
    if lItem.Warehouse = nil then
      lItem.Warehouse := TWarehouse.Create;

    lItem.Warehouse.ID := SalesInv.Warehouse.ID;

    SalesInv.Items.Add(lItem);
    CDS.Next;
  end;

  SalesInv.Services.Clear;
  CDSService.First;
  while not CDSService.Eof do
  begin
    lService := TServiceDetail.Create;
    lService.SetFromDataset(CDSService);
    SalesInv.Services.Add(lService);
    CDSService.Next;
  end;

end;

procedure TfrmSalesInvoice.UpdateHarga(aPriceType: Integer);
var
  lItemUOM: TItemUOM;
begin
  if CDS.Eof then exit;
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

procedure TfrmSalesInvoice.UpdatekeHargaGrosir1Click(Sender: TObject);
begin
  inherited;
  UpdateHarga(1);
end;

procedure TfrmSalesInvoice.UpdatekeHargaGrosir2Click(Sender: TObject);
begin
  inherited;
  UpdateHarga(2);
end;

procedure TfrmSalesInvoice.UpdatekeHargaKeliling1Click(Sender: TObject);
begin
  inherited;
  UpdateHarga(3);
end;

procedure TfrmSalesInvoice.UpdateKeHargaUmum1Click(Sender: TObject);
begin
  inherited;
  UpdateHarga(0);
end;

function TfrmSalesInvoice.ValidateData(WithPaymentDlg: Boolean = False):
    Boolean;
//var
//  lCashAmt: Double;
var
  lCardAmt: Double;
  lCardRekID: Integer;
  lCashAmt: Double;
begin
  CalculateAll;
  Result := False;

  if SalesInv.Customer = nil then
  begin
    TAppUtils.Warning('Customer belum dipilih');
    edCustomer.SetFocus;
    exit;
  end;

  if SalesInv.Customer.ID = 0 then
  begin
    TAppUtils.Warning('Customer belum dipilih');
    edCustomer.SetFocus;
    exit;
  end;

  if crAmount.Value <= 0 then
  begin
    TAppUtils.Warning('Sub Total <= 0');
    exit;
  end;

  if (cbBayar.ItemIndex = 0) and (VarToInt(cxLookupRekening.EditValue) = 0) then
  begin
    TAppUtils.Warning('Untuk Pembayaran Cash, Rekening Kas wajib diisi');
    exit;
  end;


  if (rbJenis.ItemIndex = 1) and (VarToInt(cxLookupSalesman.EditValue) = 0) then
  begin
    TAppUtils.Warning('Untuk Penjualan Salesman, Salesman wajib dipilih');
    exit;
  end;


  if (SalesInv.Customer.Kode = AppVariable.Def_Cust_Umum) and (cbBayar.ItemIndex = PaymentFlag_Credit)
  then
  begin
    TAppUtils.Warning('Customer : ' + SalesInv.Customer.Nama + ' hanya diperbolehkan melakukan pembayaran CASH');
    exit
  end;

  if (SalesInv.Customer.Kode = AppVariable.Def_Cust_Bengkel) and (cbBayar.ItemIndex = PaymentFlag_Credit)
  then
  begin
    TAppUtils.Warning('Customer : ' + SalesInv.Customer.Nama + ' hanya diperbolehkan melakukan pembayaran CASH');
    exit
  end;

  CDSClone.Last;
  if CDSClone.RecordCount > 0 then
  begin
    if (CDSClone.FieldByName('Item').AsInteger = 0)
      and (CDSCLone.FieldByName('UOM').AsInteger = 0)
      and (CDSClone.FieldByName('Qty').AsFloat = 0)
    then
    begin
      CDSClone.Delete;
    end;
  end;

//  if CDS.State in [dsInsert, dsEdit] then CDS.Post;

//  if CDS.RecordCount = 0 then
//  begin
//    TAppUtils.Warning('Data Item tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
//    exit;
//  end;

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

  if CDS.Locate('Harga', 0, []) then
  begin
    TAppUtils.Warning('Harga tidak boleh 0' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;

  if CDS.Locate('Qty', 0, []) then
  begin
    TAppUtils.Warning('Qty tidak boleh 0' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;

//  if CDS.Locate('Warehouse', 0, []) or CDS.Locate('Warehouse', null, []) then
//  begin
//    TAppUtils.Warning('Warehouse tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
//    exit;
//  end;

  if not IsValidTransDate(dtInvoice.Date) then exit;
  if not CheckStock then exit;

  if not CheckCreditLimit then
  begin
//    TAppUtils.Warning('Credit Limit Customer tidak cukup');
//    edCustomer.SetFocus;
    exit;
  end;

  if (rbJenis.ItemIndex = 1) and (VarToInt(cxLookupFee.EditValue) = 0) then
  begin
    if not TAppUtils.Confirm('Anda yakin mengkosongkan Jenis Fee atas Penjualan Salesman ini?') then  exit;
  end;

  lCashAmt := 0;
  lCardAmt := 0;
  lCardRekID := 0;
//
  if WithPaymentDlg then
  begin
    Result := TfrmDialogPayment.ShowPayment(crTotal.Value, lCashAmt, lCardAmt, lCardRekID);
    SalesInv.CashAmount := lCashAmt;
    SalesInv.CardAmount := lCardAmt;
    SalesInv.CardRekening := TRekening.CreateID(lCardRekID);
  end
  else
    Result := TAppUtils.Confirm('Anda yakin data sudah sesuai?');

end;

end.
