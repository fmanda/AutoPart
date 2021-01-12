unit ufrmPurchasePayment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons, cxGroupBox, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB,
  cxDBData, cxButtonEdit, cxCalendar, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxDropDownEdit, cxMaskEdit, cxMemo, cxTextEdit, cxLabel,
  uFinancialTransaction, Datasnap.DBClient, uTransDetail,
  cxGridDBDataDefinitions, uItem, cxDataUtils, uAppUtils, cxSpinEdit;

type
  TfrmPurchasePayment = class(TfrmDefaultInput)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edRefno: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel6: TcxLabel;
    edNotes: TcxMemo;
    dtTransDate: TcxDateEdit;
    cxLabel8: TcxLabel;
    dtDueDate: TcxDateEdit;
    cxLabel9: TcxLabel;
    edSupplier: TcxButtonEdit;
    crRetur: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    crTotal: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    crCash: TcxCurrencyEdit;
    cbMedia: TcxComboBox;
    cxLabel10: TcxLabel;
    lbRekening: TcxLabel;
    cxLookupRekening: TcxExtLookupComboBox;
    lbNoMedia: TcxLabel;
    edNoMedia: TcxTextEdit;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colInvoiceNo: TcxGridDBColumn;
    colInvoiceDate: TcxGridDBColumn;
    colInvoiceAmt: TcxGridDBColumn;
    colInvoiceRemain: TcxGridDBColumn;
    colPaidAmt: TcxGridDBColumn;
    colReturAmt: TcxGridDBColumn;
    colReturNo: TcxGridDBColumn;
    colInvoiceID: TcxGridDBColumn;
    colReturID: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Label1: TLabel;
    Label2: TLabel;
    colReturRemain: TcxGridDBColumn;
    cxGrid1Level2: TcxGridLevel;
    cxGrdCost: TcxGridDBTableView;
    colCostAccount: TcxGridDBColumn;
    colCostNotes: TcxGridDBColumn;
    colCostAmount: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cbMediaPropertiesEditValueChanged(Sender: TObject);
    procedure edSupplierKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edSupplierPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure colInvoiceNoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxGrdMainEditKeyDown(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift:
        TShiftState);
    procedure dtDueDateKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure colPaidAmtPropertiesEditValueChanged(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure colCostAmountPropertiesEditValueChanged(Sender: TObject);
    procedure colReturAmtPropertiesEditValueChanged(Sender: TObject);
    procedure colInvoiceNoPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure colReturNoPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure colReturNoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    FCDS: TClientDataset;
    FCDSCost: TClientDataset;
    FCDSClone: TClientDataset;
    FCDSCloneCost: TClientDataset;
    FPayment: TPurchasePayment;
    procedure CalculateAll;
    procedure CDSAfterDelete(DataSet: TDataSet);
    function DC: TcxGridDBDataController;
    function DCCost: TcxGridDBDataController;
    procedure FocusToGrid;
    procedure FocusToGridCost;
    function GetCDS: TClientDataset;
    function GetCDSCost: TClientDataset;
    function GetCDSClone: TClientDataset;
    function GetCDSCloneCost: TClientDataset;
    function GetPayment: TPurchasePayment;
    procedure InitView;
    procedure LookupInvoice(sKey: string = '');
    procedure LookupRetur(sKey: string = '');
    procedure LookupSupplier(sKey: string = '');
    procedure SetInvoiceToGrid(AInvoice: TPurchaseInvoice);
    procedure SetReturToGrid(aRetur: TPurchaseRetur);
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSCost: TClientDataset read GetCDSCost write FCDSCost;
    property CDSClone: TClientDataset read GetCDSClone write FCDSClone;
    property CDSCloneCost: TClientDataset read GetCDSCloneCost write FCDSCloneCost;
    { Private declarations }
  public
    function GetGroupName: string; override;
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = False);
    property Payment: TPurchasePayment read GetPayment write FPayment;
    { Public declarations }
  end;

var
  frmPurchasePayment: TfrmPurchasePayment;

implementation

uses
  uDBUtils, uDXUtils, System.DateUtils,
  ufrmCXServerLookup, uSupplier, uAccount, uVariable, ufrmCXLookup;

{$R *.dfm}

procedure TfrmPurchasePayment.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if Payment.SaveRepeat() then
  begin
//    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmPurchasePayment.CalculateAll;
var
  dRetur: Double;
  dCash: Double;
begin
  if CDS.State in [dsInsert, dsEdit] then
    CDS.Post;

  CDS.DisableControls;
  CDSCost.DisableControls;
//  DisableTrigger := True;
  Try
    dCash := 0;
    dRetur := 0;

    CDSClone.First;
    while not CDSClone.Eof do
    begin
      dCash   := dCash +  CDSClone.FieldByName('Amount').AsFloat;
      dRetur  := dRetur +  CDSClone.FieldByName('ReturAmt').AsFloat;
      CDSClone.Next;
    end;

    CDSCloneCost.First;
    while not CDSCloneCost.Eof do
    begin
      dCash   := dCash +  CDSCloneCost.FieldByName('Amount').AsFloat;
      CDSCloneCost.Next;
    end;

    crCash.Value  := dCash;
    crRetur.Value := dRetur;
    crTotal.Value := crCash.Value + crRetur.Value;
  Finally
    CDS.EnableControls;
    CDSCost.EnableControls;
//    DisableTrigger := False;
  End;
end;

procedure TfrmPurchasePayment.cbMediaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if cbMedia.ItemIndex = Media_Cash then
  begin
    edNoMedia.Enabled := False;
    dtDueDate.Enabled := False;
    edNoMedia.Clear;
    dtDueDate.Clear;
    lbNoMedia.Caption := 'Referensi';
    lbRekening.Caption := 'Rekening Asal';

    if Payment.Rekening = nil then
      Payment.Rekening := TRekening.Create;

    Payment.Rekening.LoadByCode(AppVariable.Def_Rekening);
    cxLookupRekening.EditValue := Payment.Rekening.ID;

    cxLookupRekening.CDS.Filtered := True;
    cxLookupRekening.CDS.Filter := 'Jenis = 0 or NAMA = ''OWNER'' ';

  end;
  if cbMedia.ItemIndex = Media_Tranfer then
  begin
    edNoMedia.Enabled := True;
    dtDueDate.Enabled := False;
    edNoMedia.Clear;
    dtDueDate.Clear;
    lbNoMedia.Caption := 'No Referensi';
    lbRekening.Caption := 'Rekening Asal';

    cxLookupRekening.CDS.Filtered := True;
    cxLookupRekening.CDS.Filter := 'Jenis = 1';
  end;
  if cbMedia.ItemIndex = Media_Cek then
  begin
    edNoMedia.Enabled := True;
    dtDueDate.Enabled := True;
    edNoMedia.Clear;
    dtDueDate.Clear;
    lbNoMedia.Caption := 'No BG/Cek';
    lbRekening.Caption := 'Bank';

    cxLookupRekening.CDS.Filtered := True;
    cxLookupRekening.CDS.Filter := 'Jenis = 1';
  end;
end;

procedure TfrmPurchasePayment.CDSAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmPurchasePayment.colCostAmountPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  DCCost.Post;
  CalculateAll;
end;

procedure TfrmPurchasePayment.colInvoiceNoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  LookupInvoice;
end;

procedure TfrmPurchasePayment.colInvoiceNoPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  lPurch: TPurchaseInvoice;
begin
  inherited;
  lPurch := TPurchaseInvoice.Create;
  Try
    lPurch.LoadByCode(VarToStr(DisplayValue));
    SetInvoiceToGrid(lPurch);
  Finally
    lPurch.Free;
  End;
end;

procedure TfrmPurchasePayment.colPaidAmtPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateAll;
end;procedure TfrmPurchasePayment.colReturAmtPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  DC.Post;
  CalculateAll;
end;


procedure TfrmPurchasePayment.colReturNoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  LookupRetur();
end;

procedure TfrmPurchasePayment.colReturNoPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  lRet: TPurchaseRetur;
begin
  inherited;
  lRet := TPurchaseRetur.Create;
  Try
    lRet.LoadByCode(VarToStr(DisplayValue));
    SetReturToGrid(lRet);
  Finally
    lRet.Free;
  End;
end;

procedure TfrmPurchasePayment.cxGrdMainEditKeyDown(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit:
    TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) and (aItem = colInvoiceNo) then
  begin
    LookupInvoice(VarToStr(AEdit.EditingValue));
  end;
end;

function TfrmPurchasePayment.DC: TcxGridDBDataController;
begin
  Result := cxGrdMain.DataController;
end;

function TfrmPurchasePayment.DCCost: TcxGridDBDataController;
begin
  Result := cxGrdCost.DataController;
end;

procedure TfrmPurchasePayment.dtDueDateKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    FocusToGrid;
  end;
end;

procedure TfrmPurchasePayment.edSupplierKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmPurchasePayment.edSupplierPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  LookupSupplier;
end;

procedure TfrmPurchasePayment.FocusToGrid;
begin
  cxGrid1.SetFocus;
  cxGrid1.FocusedView := cxGrdMain;
  if cxGrdMain.DataController.RecordCount = 0 then
  begin
    CDS.Append;
    cxGrdMain.Controller.EditingController.ShowEdit;
  end;
end;

procedure TfrmPurchasePayment.FocusToGridCost;
begin
  cxGrid1.SetFocus;
  cxGrid1.FocusedView := cxGrdCost;
  if CDSCost.RecordCount = 0 then
  begin
    CDSCost.Append;
    cxGrdCost.Controller.EditingController.ShowEdit;
  end;
end;

procedure TfrmPurchasePayment.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  InitView;
  cxGrid1.FocusedView := cxGrdMain;
  LoadByID(0);
end;

procedure TfrmPurchasePayment.FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if Key = VK_F1 then
    edRefno.SetFocus;

  if Key = VK_F2 then
    FocusToGrid
  else if Key = VK_F3 then
    FocusToGridCost;

end;

function TfrmPurchasePayment.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TFinancialTransaction.CreateDataSet(Self, False);
    FCDS.AddField('InvoiceNo',ftString);
    FCDS.AddField('InvoiceDate',ftDateTime);
    FCDS.AddField('ReturNo',ftString);
    FCDS.AddField('InvoiceAmt',ftFloat);
    FCDS.AddField('InvoiceRemain',ftFloat);
    FCDS.AddField('ReturRemain',ftFloat);
    FCDS.AfterDelete := CDSAfterDelete;
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmPurchasePayment.GetCDSCost: TClientDataset;
begin
  if FCDSCost = nil then
  begin
    FCDSCost := TFinancialTransaction.CreateDataSet(Self, False);
    FCDSCost.AfterDelete := CDSAfterDelete;
    FCDSCost.CreateDataSet;
  end;
  Result := FCDSCost;
end;

function TfrmPurchasePayment.GetCDSClone: TClientDataset;
begin
  if FCDSClone = nil then
  begin
    FCDSClone := CDS.ClonedDataset(Self);
  end;
  Result := FCDSClone;
end;

function TfrmPurchasePayment.GetCDSCloneCost: TClientDataset;
begin
  if FCDSCloneCost = nil then
  begin
    FCDSCloneCost := CDSCost.ClonedDataset(Self);
  end;
  Result := FCDSCloneCost;
end;

function TfrmPurchasePayment.GetGroupName: string;
begin
  Result := 'Hutang & Piutang';
end;

function TfrmPurchasePayment.GetPayment: TPurchasePayment;
begin
  if FPayment = nil then
    FPayment := TPurchasePayment.Create;
  Result := FPayment;
end;

procedure TfrmPurchasePayment.InitView;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  cxGrdCost.PrepareFromCDS(CDSCost);
  cxLookupRekening.Properties.LoadFromSQL(Self,
    'select id, nama, jenis from trekening','nama');

  TcxExtLookup(colCostAccount.Properties).LoadFromSQL(Self,
    'select id, kode + '' - '' + nama as nama from taccount where isdetail = 1','nama');

end;

procedure TfrmPurchasePayment.LoadByID(aID: Integer; IsReadOnly: Boolean =
    False);
var
  lItem: TFinancialTransaction;
  lPurchaseInv: TPurchaseInvoice;
  lPurchaseRet: TPurchaseRetur;
begin
  if FPayment <> nil then
    FreeAndNil(FPayment);

  Payment.LoadByID(aID);

  if aID = 0 then
  begin
    Payment.TransDate := Now();
    Payment.Refno     := Payment.GenerateNo;
    Payment.Media     := -1;
  end;

  if (aID <> 0) and (not IsReadOnly) then
  begin
    IsReadOnly := not IsValidTransDate(Payment.TransDate);
  end;

  edRefno.Text        := Payment.Refno;
  cbMedia.ItemIndex   := Payment.Media;
  cbMediaPropertiesEditValueChanged(Self);

  dtTransDate.Date    := Payment.TransDate;

  if dtTransDate.Date <= 0 then dtTransDate.Clear;

  edSupplier.Clear;
  if Payment.Supplier <> nil then
  begin
    Payment.Supplier.ReLoad();
    edSupplier.Text   := Payment.Supplier.Nama;
  end;

  edNotes.Text        := Payment.Notes;
  edNoMedia.Text      := Payment.MediaNo;
  dtDueDate.Date      := Payment.DueDate;

  cxLookupRekening.Clear;
  if Payment.Rekening <> nil then
  begin
    cxLookupRekening.EditValue := Payment.Rekening.ID;
  end;

  CDS.EmptyDataSet;
  CDSCost.EmptyDataSet;
  CDS.DisableControls;
  CDSCost.DisableControls;

  lPurchaseInv := TPurchaseInvoice.Create;
  lPurchaseRet := TPurchaseRetur.Create;
  Try
    for lItem in Payment.Items do
    begin
      if lItem.CreditAmt > 0 then continue;
      if lItem.PurchaseInvoice = nil then
      begin
        CDSCost.Append;
        lItem.UpdateToDataset(CDSCost);
        CDSCost.Post;
      end else
      begin
        CDS.Append;
        lItem.UpdateToDataset(CDS);
        if lItem.PurchaseInvoice <> nil then
        begin
          if lPurchaseInv.LoadByID(lItem.PurchaseInvoice.ID) then
          begin
            CDS.FieldByName('InvoiceNo').AsString     := lPurchaseInv.InvoiceNo;
            CDS.FieldByName('InvoiceDate').AsDateTime := lPurchaseInv.TransDate;
            CDS.FieldByName('InvoiceAmt').AsFloat     := lPurchaseInv.Amount;
            CDS.FieldByName('InvoiceRemain').AsFloat  := lPurchaseInv.GetRemain + lItem.Amount + lItem.ReturAmt;
          end;
        end;
        if lItem.PurchaseRetur <> nil then
        begin
          if lPurchaseRet.LoadByID(lItem.PurchaseRetur.ID) then
          begin
            CDS.FieldByName('ReturNo').AsString       := lPurchaseRet.Refno;
            CDS.FieldByName('ReturRemain').AsFloat    := lPurchaseRet.Amount - lPurchaseRet.PaidAmount + lItem.ReturAmt;
          end;
        end;
        CDS.Post;
      end;
    end;
    CalculateAll;
  Finally
    CDS.EnableControls;
    CDSCost.EnableControls;
    FreeAndNil(lPurchaseInv);
    FreeAndNil(lPurchaseRet);
  End;



  btnSave.Enabled := not IsReadOnly;
end;

procedure TfrmPurchasePayment.LookupInvoice(sKey: string = '');
var
  cxLookup: TfrmCXLookup;
  lInvoice: TPurchaseInvoice;
  S: string;
begin
  if Payment.Supplier = nil then
  begin
    TAppUtils.Warning('Supplier Harus dipilih terlebih dahulu');
    exit;
  end;

  if Payment.Supplier.ID = 0 then
  begin
    TAppUtils.Warning('Supplier Harus dipilih terlebih dahulu');
    exit;
  end;

  S := 'SELECT A.ID, A.INVOICENO, A.REFERENSI, A.TRANSDATE, A.DUEDATE, B.NAMA AS SUPPLIER,'
      +' A.AMOUNT, A.PAIDAMOUNT, A.RETURAMOUNT, A.NOTES,'
      +' (A.AMOUNT - A.PAIDAMOUNT - A.RETURAMOUNT) AS REMAIN'
      +' FROM TPURCHASEINVOICE A'
      +' INNER JOIN TSUPPLIER B ON A.SUPPLIER_ID = B.ID'
      +' WHERE (A.AMOUNT - ISNULL(A.PAIDAMOUNT,0) - ISNULL(A.RETURAMOUNT,0)) > '
      + FloatToStr(AppVariable.Toleransi_Piutang)
      +' AND A.SUPPLIER_ID = ' + IntToStr(Payment.Supplier.ID);


//  cxLookup := TfrmCXServerLookup.Execute(S, 'ID', 0, 0 );
  cxLookup := TfrmCXLookup.Execute(S, True );
  Try
    cxLookup.PreFilter('INVOICENO', sKey);
    cxLookup.HideFields(['ID']);
    cxLookup.cxGridView.EnableFiltering();
    if cxLookup.ShowModal = mrOK then
    begin
      while not cxLookup.Data.Eof do
      begin
        if CDSClone.Locate('PurchaseInvoice', cxLookup.Data.FieldByName('ID').AsInteger, [loCaseInsensitive]) then
        begin
          TAppUtils.Warning('Faktur : ' + cxLookup.Data.FieldByName('INVOICENO').AsString + ' sudah ada di Grid Input');
          cxLookup.Data.Next;
          continue;
        end;

        lInvoice := TPurchaseInvoice.Create;
        Try
          lInvoice.LoadByID(cxLookup.Data.FieldByName('ID').AsInteger);
          SetInvoiceToGrid(lInvoice);
        Finally
          lInvoice.Free;
        End;

        cxLookup.Data.Next;
        if not cxLookup.Data.Eof then DC.Append;
      end;
//      if CDSClone.Locate('PurchaseInvoice', VarToInt(cxLookup.FieldValue('ID')), [loCaseInsensitive]) then
//      begin
//        TAppUtils.Warning('Faktur : ' + VarToStr(cxLookup.FieldValue('INVOICENO'))
//          + ' sudah ada di Grid Input'
//        );
//        exit;
//      end;
//
//      lInvoice := TPurchaseInvoice.Create;
//      Try
//        lInvoice.LoadByID(VarToInt(cxLookup.FieldValue('ID')));
//        SetInvoiceToGrid(lInvoice);
//      Finally
//        lInvoice.Free;
//      End;
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmPurchasePayment.LookupRetur(sKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  lRetur: TPurchaseRetur;
  S: string;
begin
  if Payment.Supplier = nil then
  begin
    TAppUtils.Warning('Supplier Harus dipilih terlebih dahulu');
    exit;
  end;

  if Payment.Supplier.ID = 0 then
  begin
    TAppUtils.Warning('Supplier Harus dipilih terlebih dahulu');
    exit;
  end;

  S := 'SELECT A.ID, A.REFNO, A.TRANSDATE,  B.NAMA AS SUPPLIER,'
      +' A.AMOUNT, A.PAIDAMOUNT, A.NOTES,'
      +' (A.AMOUNT - A.PAIDAMOUNT) AS REMAIN'
      +' FROM TPURCHASERETUR A'
      +' INNER JOIN TSUPPLIER B ON A.SUPPLIER_ID = B.ID'
      +' WHERE (A.AMOUNT - ISNULL(A.PAIDAMOUNT,0)) > '
      + FloatToStr(AppVariable.Toleransi_Piutang)
      +' AND A.SUPPLIER_ID = ' + IntToStr(Payment.Supplier.ID);


  cxLookup := TfrmCXServerLookup.Execute(S, 'ID', 0, 0 );
  Try
    cxLookup.PreFilter('REFNO', sKey);
    if cxLookup.ShowModal = mrOK then
    begin
      lRetur := TPurchaseRetur.Create;
      Try
        lRetur.LoadByID(VarToInt(cxLookup.FieldValue('ID')));
        SetReturToGrid(lRetur);
      Finally
        lRetur.Free;
      End;
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmPurchasePayment.LookupSupplier(sKey: string = '');
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
      CDS.EmptyDataSet;
      if Payment.Supplier = nil then
        Payment.Supplier := TSupplier.Create;
      Payment.Supplier.LoadByID(cxLookup.FieldValue('id'));
      edSupplier.Text := Payment.Supplier.Nama;
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmPurchasePayment.SetInvoiceToGrid(AInvoice: TPurchaseInvoice);
begin
  if AInvoice = nil then exit;
  DC.SetEditValue(colInvoiceID.Index, AInvoice.ID, evsValue);
  DC.SetEditValue(colInvoiceNo.Index, AInvoice.InvoiceNo, evsValue);
  DC.SetEditValue(colInvoiceDate.Index, AInvoice.TransDate, evsValue);
  DC.SetEditValue(colInvoiceAmt.Index, AInvoice.Amount, evsValue);
  DC.SetEditValue(colPaidAmt.Index, AInvoice.GetRemain, evsValue);
  DC.SetEditValue(colReturAmt.Index, 0, evsValue);
  DC.SetEditValue(colInvoiceRemain.Index, AInvoice.GetRemain, evsValue);
  DC.SetEditValue(colReturID.Index, 0, evsValue);
  DC.SetEditValue(colReturNo.Index, '', evsValue);
  DC.SetEditValue(colReturAmt.Index, 0, evsValue);
  DC.SetEditValue(colReturRemain.Index, 0, evsValue);
  CalculateAll;
end;

procedure TfrmPurchasePayment.SetReturToGrid(aRetur: TPurchaseRetur);
begin
  if aRetur = nil then exit;
  DC.SetEditValue(colReturID.Index, aRetur.ID, evsValue);
  DC.SetEditValue(colReturNo.Index, aRetur.Refno, evsValue);
  DC.SetEditValue(colReturRemain.Index, aRetur.Amount - aRetur.PaidAmount, evsValue);
  DC.SetEditValue(colReturAmt.Index, aRetur.Amount - aRetur.PaidAmount, evsValue);
  CalculateAll;
end;

procedure TfrmPurchasePayment.UpdateData;
var
  lItem: TFinancialTransaction;
begin
  Payment.Refno         := edRefno.Text;
  Payment.TransDate     := dtTransDate.Date;
  Payment.DueDate       := dtDueDate.Date;
  Payment.Media         := cbMedia.ItemIndex;
  Payment.MediaNo       := edNoMedia.Text;
  Payment.PaymentFlag   := PaymentFlag_Credit; //
  Payment.Amount        := crCash.Value;
  Payment.ReturAmount   := crRetur.Value;
  Payment.Notes         := edNotes.Text;
  Payment.ModifiedBy    := UserLogin;
  Payment.ModifiedDate  := Now();

  if Payment.Rekening = nil then
    Payment.Rekening    := TRekening.Create;

  Payment.Rekening.LoadByID(VarToInt(cxLookupRekening.EditValue));
  Payment.Items.Clear;

  //header credit
  lItem                 := TFinancialTransaction.Create;
  lItem.DebetAmt        := 0;
  lItem.CreditAmt       := Payment.Amount;
  lItem.Amount          := Payment.Amount;
  lItem.TransDate       := Payment.TransDate;
  lItem.Notes           := 'Purchase Payment : ' + Payment.Refno;
  lItem.TransType       := Payment.PaymentFlag;
  lItem.Rekening        := TRekening.CreateID(Payment.Rekening.ID);
  Payment.Items.Add(lItem);

  CDS.First;
  while not CDS.Eof do
  begin
    lItem               := TFinancialTransaction.Create;
    lItem.SetFromDataset(CDS);
    lItem.SetToDebet; //pembayaran hutang
    lItem.TransType     := Payment.PaymentFlag;
    lItem.TransDate     := Payment.TransDate;
    lItem.Notes         := 'Purchase Payment : ' + Payment.Refno;
    Payment.Items.Add(lItem);
    CDS.Next;
  end;

  CDSCost.First;
  while not CDSCost.Eof do
  begin
    lItem               := TFinancialTransaction.Create;
    lItem.SetFromDataset(CDSCost);
    lItem.SetToDebet; //pembayaran biaya
    lItem.TransType     := Payment.PaymentFlag;
    lItem.TransDate     := Payment.TransDate;
//    lItem.Notes         := 'Purchase Payment : ' + Payment.Refno;
    Payment.Items.Add(lItem);
    CDSCost.Next;
  end;
end;

function TfrmPurchasePayment.ValidateData: Boolean;
begin
  Result := False;

  if Payment.Supplier = nil then
  begin
    TAppUtils.Warning('Supplier belum dipilih');
    edSupplier.SetFocus;
    exit;
  end;

  if Payment.Supplier.ID = 0 then
  begin
    TAppUtils.Warning('Supplier belum dipilih');
    edSupplier.SetFocus;
    exit;
  end;

  if cbMedia.ItemIndex < 0 then
  begin
    TAppUtils.Warning('Jenis Media belum dipilih');
    exit;
  end;

  if crTotal.Value <= 0 then
  begin
    TAppUtils.Warning('Total <= 0');
    exit;
  end;

  if (VarToInt(cxLookupRekening.EditValue) = 0) then
  begin
    TAppUtils.Warning('Rekening Kas / Bank belum diisi');
    exit;
  end;

  if (cbMedia.ItemIndex = Media_Cek) and (edNoMedia.Text = '') then
  begin
    TAppUtils.Warning('Untuk Media BG / Cek, nomor BG / Cek wajib diisi');
    exit;
  end;


//  if CDS.RecordCount = 0 then
//  begin
//    TAppUtils.Warning('Data Faktur tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
//    exit;
//  end;
  if cxGrdMain.DataController.RecordCount = 0 then
  begin
    TAppUtils.Warning('Data Item tidak boleh kosong');
    exit;
  end;

  if CDS.Locate('PurchaseInvoice', null, []) or CDS.Locate('PurchaseInvoice', 0, []) then
  begin
    TAppUtils.Warning('Invoice tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;

  CDS.First;
  while not CDS.Eof do
  begin
    if (CDS.FieldByName('PurchaseRetur').AsInteger = 0)
      and (CDS.FieldByName('ReturAmt').AsFloat > 0) then
    begin
      TAppUtils.Warning('Nomor Retur kosong, tetapi ada nominal Retur');
      exit;
    end;

    if (CDS.FieldByName('ReturAmt').AsFloat - CDS.FieldByName('ReturRemain').AsFloat) > 1
    then
    begin
      TAppUtils.Warning('Nilai Potong retur melebihi Sisa Retur yang bisa dipotongkan'
        + #13 + 'Baris : ' +IntTostr(CDS.RecNo)
      );
      exit;
    end;

    if (CDS.FieldByName('Amount').AsFloat
      + CDS.FieldByName('ReturAmt').AsFloat
      - CDS.FieldByName('InvoiceRemain').AsFloat) > AppVariable.Toleransi_Piutang
    then
    begin
      TAppUtils.Warning('Nilai Pembayaran melebihi Sisa Hutang'
        + #13 + 'Baris : ' +IntTostr(CDS.RecNo)
        + #13 + 'Setting Toleransi Sisa Hutang / Piutang : ' +FloatToStr(AppVariable.Toleransi_Piutang)
      );
      exit;
    end;

    if (CDS.FieldByName('Amount').AsFloat < 0) then
    begin
      TAppUtils.Warning('Nilai Pembayaran tidak boleh < 0'
        + #13 + 'Baris : ' +IntTostr(CDS.RecNo)
      );
      exit;
    end;

    if (CDS.FieldByName('ReturAmt').AsFloat < 0) then
    begin
      TAppUtils.Warning('Nilai Pembayaran tidak boleh < 0'
        + #13 + 'Baris : ' +IntTostr(CDS.RecNo)
      );
      exit;
    end;

    if (CDS.FieldByName('Amount').AsFloat <= 0) and (CDS.FieldByName('ReturAmt').AsFloat <= 0)
    then
    begin
      TAppUtils.Warning('Nilai Total Pembayaran (Cash & Retur) tidak boleh <= 0'
        + #13 + 'Baris : ' +IntTostr(CDS.RecNo)
      );
      exit;
    end;


    CDS.Next;
  end;

  if not IsValidTransDate(dtTransDate.Date) then exit;

  Result := TAppUtils.Confirm('Anda yakin data sudah sesuai?');
end;

end.
