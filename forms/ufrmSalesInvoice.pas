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
    crSubTotal: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    crPPN: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    crTotal: TcxCurrencyEdit;
    cxLabel7: TcxLabel;
    cxLookupSalesman: TcxExtLookupComboBox;
    rbHarga: TcxRadioGroup;
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
  private
    DisableTrigger: Boolean;
    FCDS: TClientDataset;
    FCDSService: TClientDataset;
    FCDSClone: TClientDataset;
    FCDSCloneServ: TClientDataset;
    FCDSUOM: TClientDataset;
    FCDSMasterService: TClientDataset;
    FSalesInv: TSalesInvoice;
    procedure CalculateAll;
    procedure CDSAfterInsert(DataSet: TDataSet);
    function DC: TcxGridDBDataController;
    function DCService: TcxGridDBDataController;
    procedure FocusToGrid;
    procedure FocusToService;
    function GetCDS: TClientDataset;
    function GetCDSService: TClientDataset;
    function GetCDSClone: TClientDataset;
    function GetCDSCloneServ: TClientDataset;
    function GetCDSUOM: TClientDataset;
    function GetCDSMasterService: TClientDataset;
    function GetSalesInv: TSalesInvoice;
    procedure InitView;
    procedure LookupItem(aKey: string = '');
    procedure LookupCustomer(sKey: string = '');
    procedure SetDefaultValueTipeHarga;
    procedure SetItemToGrid(aItem: TItem);
    procedure UpdateData;
    procedure UpdateHarga;
    function ValidateData: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSService: TClientDataset read GetCDSService write FCDSService;
    property CDSClone: TClientDataset read GetCDSClone write FCDSClone;
    property CDSCloneServ: TClientDataset read GetCDSCloneServ write FCDSCloneServ;
    property CDSUOM: TClientDataset read GetCDSUOM write FCDSUOM;
    property CDSMasterService: TClientDataset read GetCDSMasterService write
        FCDSMasterService;
    property SalesInv: TSalesInvoice read GetSalesInv write FSalesInv;
    { Private declarations }
  public
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = True);
    { Public declarations }
  published
  end;

var
  frmSalesInvoice: TfrmSalesInvoice;

implementation

uses
  uDXUtils, uDBUtils, uAppUtils, ufrmCXServerLookup, uCustomer, cxDataUtils,
  uWarehouse, uMekanik, uSalesman, uVariable, uAccount;

{$R *.dfm}

procedure TfrmSalesInvoice.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if SalesInv.SaveRepeat then
  begin
//    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmSalesInvoice.CalculateAll;
var
  dPPN: Double;
  dSubTotal: Double;
begin
  if CDS.State in [dsInsert, dsEdit] then
    CDS.Post;

  if CDSService.State in [dsInsert, dsEdit] then
    CDSService.Post;

  CDS.DisableControls;
  CDSService.DisableControls;
  DisableTrigger := True;
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

    crSubTotal.Value  := dSubTotal;
    crPPN.Value       := dPPN;
    crTotal.Value     := crSubTotal.Value + crPPN.Value;
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

procedure TfrmSalesInvoice.CDSAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('Warehouse').AsInteger := VarToInt(cxLookupGudang.EditValue);
end;

procedure TfrmSalesInvoice.colDiscPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalculateAll;
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

procedure TfrmSalesInvoice.colQtyPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalculateAll;
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
  edCustomer.Text := SalesInv.Customer.Nama;
end;

procedure TfrmSalesInvoice.edNotesKeyDown(Sender: TObject; var Key: Word;
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
  if CDS.RecordCount = 0 then
  begin
    CDS.Append;
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
  LoadByID(0, False);
end;

procedure TfrmSalesInvoice.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_F1 then
    edNoInv.SetFocus;

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
  end;

end;

function TfrmSalesInvoice.GetCDS: TClientDataset;
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
    'select id, nama from twarehouse','nama');
  TcxExtLookup(colUOM.Properties).LoadFromCDS(CDSUOM, 'id', 'uom', ['id'], Self);
  cxLookupGudang.Properties.LoadFromSQL(Self,
    'select id, nama from twarehouse','nama');

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
    'select id, nama from TSALESFEE','nama');

  if SalesInv.Rekening = nil then
    SalesInv.Rekening := TRekening.Create;

  SalesInv.Rekening.LoadByCode(AppVariable.Def_Rekening);
  cxLookupRekening.EditValue := SalesInv.Rekening.ID;
end;

procedure TfrmSalesInvoice.LoadByID(aID: Integer; IsReadOnly: Boolean = True);
var
  lItem: TTransDetail;
  lService: TServiceDetail;
begin
  if FSalesInv <> nil then
    FreeAndNil(FSalesInv);

  SalesInv.LoadByID(aID);

  //def uom
  if aID = 0 then
  begin
    SalesInv.TransDate    := Now();
    SalesInv.DueDate      := Now();
    SalesInv.PaymentFlag  := 0;
    SalesInv.InvoiceNo    := SalesInv.GenerateNo;
  end;

  edNoInv.Text := SalesInv.InvoiceNo;

  cbBayar.ItemIndex := SalesInv.PaymentFlag;
  cbBayarPropertiesEditValueChanged(Self);

  rbHarga.ItemIndex := SalesInv.SalesType;
  rbHargaPropertiesEditValueChanged(Self);

  dtInvoice.Date := SalesInv.TransDate;
  dtJtTempo.Date := SalesInv.DueDate;
  spTempo.Value := SalesInv.DueDate - SalesInv.TransDate;

  crSubTotal.Value := SalesInv.SubTotal;
  crPPN.Value := SalesInv.PPN;
  crTotal.Value := SalesInv.Amount;
  edNotes.Text := SalesInv.Notes;

  if SalesInv.Customer <> nil then
  begin
    SalesInv.Customer.ReLoad(False);
    edCustomer.Text := SalesInv.Customer.Nama;
  end;

  if SalesInv.Warehouse <> nil then
    cxLookupGudang.EditValue := SalesInv.Warehouse.ID;

  if SalesInv.Salesman <> nil then
    cxLookupSalesman.EditValue := SalesInv.Salesman.ID;

  if SalesInv.Mekanik <> nil then
     cxLookupMekanik.EditValue := SalesInv.Mekanik.ID;


  CDS.EmptyDataSet;
  CDSService.EmptyDataSet;

  for lItem in SalesInv.Items do
  begin
    CDS.Append;
    lItem.MakePositive;
    lItem.UpdateToDataset(CDS);
    lItem.Item.ReLoad(False);
    CDS.FieldByName('Kode').AsString := lItem.Item.Kode;
    CDS.FieldByName('Nama').AsString := lItem.Item.Nama;
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
    s := 'SELECT A.ID, A.KODE, A.NAMA, C.NAMA AS MERK, B.NAMA AS ITEMGROUP, A.RAK'
        +' FROM TITEM A'
        +' LEFT JOIN TITEMGROUP B ON A.GROUP_ID = B.ID'
        +' LEFT JOIN TMERK C ON A.MERK_ID = C.ID';

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

procedure TfrmSalesInvoice.rbHargaPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  if CDS.RecordCount > 0 then
  begin
    if SalesInv.SalesType <> rbHarga.ItemIndex then
    begin
      //update harga
      if TAppUtils.Confirm('Anda yakin harga diubah menjadi : ' + rbHarga.Properties.Items[rbHarga.ItemIndex].Caption + '?')
      then
      begin
        UpdateHarga;
//        SalesInv.SalesType := rbHarga.ItemIndex;
      end else
      begin
        rbHarga.ItemIndex := SalesInv.SalesType;
        exit;
      end;
    end;
  end;

  SalesInv.SalesType := rbHarga.ItemIndex;
  SetDefaultValueTipeHarga;
  cxLookupMekanik.Enabled := rbHarga.ItemIndex in [0,1];
  cxGridService.Visible := rbHarga.ItemIndex in [0,1];

//  cxLookupSalesman.TabStop := rbHarga.ItemIndex in [2,3];
  cxLookupMekanik.TabStop := rbHarga.ItemIndex = 1;

  cxLookupSalesman.Enabled := rbHarga.ItemIndex = 3;
  cxLookupFee.Enabled := rbHarga.ItemIndex = 3;

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
      edCustomer.Text := SalesInv.Customer.Nama;
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmSalesInvoice.SetDefaultValueTipeHarga;
begin
  if SalesInv.Customer = nil then
    SalesInv.Customer := TCustomer.Create;

  Case rbHarga.ItemIndex of
    0 :
    begin
      SalesInv.Customer.LoadByCode(AppVariable.Def_Cust_Umum);
      edCustomer.Text := SalesInv.Customer.Nama;
      cbBayar.ItemIndex := PaymentFlag_Cash;
    end;
    1 :
    begin
      SalesInv.Customer.LoadByCode(AppVariable.Def_Cust_Bengkel);
      edCustomer.Text := SalesInv.Customer.Nama;
      cbBayar.ItemIndex := PaymentFlag_Cash;
    end;
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

  SalesInv.InvoiceNo := edNoInv.Text;
  SalesInv.TransDate := dtInvoice.Date;
  SalesInv.DueDate  := dtJtTempo.Date;
  SalesInv.Notes := edNotes.Text;
  SalesInv.PaymentFlag := rbHarga.ItemIndex;
  SalesInv.SubTotal := crSubTotal.Value;
  SalesInv.PPN := crPPN.Value;
  SalesInv.Amount := crTotal.Value;
  SalesInv.ModifiedDate := Now();
  SalesInv.ModifiedBy := UserLogin;

  if SalesInv.Warehouse = nil then
    SalesInv.Warehouse := TWarehouse.Create;
  SalesInv.Warehouse.LoadByID(VarToInt(cxLookupGudang.EditValue));

  if SalesInv.Mekanik = nil then
    SalesInv.Mekanik := TMekanik.Create;
  SalesInv.Mekanik.LoadByID(VarToInt(cxLookupMekanik.EditValue));

  if SalesInv.Salesman = nil then
    SalesInv.Salesman := TSalesman.Create;
  SalesInv.Salesman.LoadByID(VarToInt(cxLookupSalesman.EditValue));

  if SalesInv.Rekening = nil then
    SalesInv.Rekening := TRekening.Create;
  SalesInv.Rekening.LoadByID(VarToInt(cxLookupRekening.EditValue));

  SalesInv.Items.Clear;
  CDS.First;
  while not CDS.Eof do
  begin
    lItem := TTransDetail.Create;
    lItem.SetFromDataset(CDS);
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

procedure TfrmSalesInvoice.UpdateHarga;
var
  lItemUOM: TItemUOM;
begin
  CDSClone.First;
  while not CDSClone.Eof do
  begin
    lItemUOM := TItemUOM.GetItemUOM(
      CDSClone.FieldByName('Item').AsInteger,
      CDSClone.FieldByName('UOM').AsInteger
    );
    if lItemUOM <> nil then
    begin
      Try
        CDSClone.Edit;
        CDSClone.FieldByName('Harga').AsFloat := lItemUOM.GetHarga(rbHarga.ItemIndex);
        CDSClone.Post;
      Finally
        FreeAndNil(lItemUOM);
      End;
    end;
    CDSClone.Next;
  end;
  CalculateAll;
end;

function TfrmSalesInvoice.ValidateData: Boolean;
begin
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

//  if (rbHarga.ItemIndex = 1) and (VarToInt(cxLookupMekanik.EditValue) = 0) then
//  begin
//    TAppUtils.Warning('Untuk Harga Bengkel, Mekanik wajib diisi');
//    exit;
//  end;

  if (rbHarga.ItemIndex = 3) and (VarToInt(cxLookupSalesman.EditValue) = 0) then
  begin
    TAppUtils.Warning('Untuk Harga Keliling Salesman wajib diisi');
    exit;
  end;

  if (rbHarga.ItemIndex = 3) and (VarToInt(cxLookupFee.EditValue) = 0) then
  begin
    TAppUtils.Warning('Untuk Harga Keliling Jenis Fee wajib diisi');
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

  Result := TAppUtils.Confirm('Anda yakin data sudah sesuai?');

end;

end.
