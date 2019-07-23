unit ufrmSalesPayment;

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
  cxGridDBDataDefinitions, uItem, cxDataUtils, uAppUtils, cxSpinEdit, cxCheckBox;
type
  TfrmSalesPayment = class(TfrmDefaultInput)
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
    colReturNo: TcxGridDBColumn;
    colReturRemain: TcxGridDBColumn;
    colReturAmt: TcxGridDBColumn;
    colInvoiceID: TcxGridDBColumn;
    colReturID: TcxGridDBColumn;
    cxGrdCost: TcxGridDBTableView;
    colCostAccount: TcxGridDBColumn;
    colCostNotes: TcxGridDBColumn;
    colCostAmount: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1Level2: TcxGridLevel;
    Label1: TLabel;
    Label2: TLabel;
    cxLookupSalesman: TcxExtLookupComboBox;
    colCustomer: TcxGridDBColumn;
    ckFilterSalesman: TcxCheckBox;
    colCustomerID: TcxGridDBColumn;
    procedure btnSaveClick(Sender: TObject);
    procedure cxGrdMainEditKeyDown(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift:
        TShiftState);
    procedure dtDueDateKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbMediaPropertiesEditValueChanged(Sender: TObject);
    procedure colCostAmountPropertiesEditValueChanged(Sender: TObject);
    procedure colInvoiceNoPropertiesButtonClick(Sender: TObject; AButtonIndex:
        Integer);
    procedure colInvoiceNoPropertiesValidate(Sender: TObject; var DisplayValue:
        Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure colPaidAmtPropertiesEditValueChanged(Sender: TObject);
    procedure colReturAmtPropertiesEditValueChanged(Sender: TObject);
    procedure colReturNoPropertiesButtonClick(Sender: TObject; AButtonIndex:
        Integer);
    procedure colReturNoPropertiesValidate(Sender: TObject; var DisplayValue:
        Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    FCDS: TClientDataset;
    FCDSClone: TClientDataset;
    FCDSCloneCost: TClientDataset;
    FCDSCost: TClientDataset;
    FPayment: TSalesPayment;
    procedure CalculateAll;
    procedure CDSAfterDelete(DataSet: TDataSet);
    function DC: TcxGridDBDataController;
    function DCCost: TcxGridDBDataController;
    procedure FocusToGrid;
    procedure FocusToGridCost;
    function GetCDS: TClientDataset;
    function GetCDSClone: TClientDataset;
    function GetCDSCloneCost: TClientDataset;
    function GetCDSCost: TClientDataset;
    function GetPayment: TSalesPayment;
    procedure InitView;
    procedure LookupInvoice(sKey: string = '');
    procedure LookupRetur;
    procedure SetInvoiceToGrid(AInvoice: TSalesInvoice);
    procedure SetReturToGrid(aRetur: TSalesRetur);
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSClone: TClientDataset read GetCDSClone write FCDSClone;
    property CDSCloneCost: TClientDataset read GetCDSCloneCost write FCDSCloneCost;
    property CDSCost: TClientDataset read GetCDSCost write FCDSCost;
    { Private declarations }
  public
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = False);
    property Payment: TSalesPayment read GetPayment write FPayment;
    { Public declarations }
  end;

var
  frmSalesPayment: TfrmSalesPayment;

implementation

uses
  uDBUtils, uDXUtils, System.DateUtils,
  ufrmCXServerLookup, uSupplier, uAccount, uVariable, uSalesman;

{$R *.dfm}

procedure TfrmSalesPayment.btnSaveClick(Sender: TObject);
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

procedure TfrmSalesPayment.CalculateAll;
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



procedure TfrmSalesPayment.cbMediaPropertiesEditValueChanged(Sender: TObject);
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
    cxLookupRekening.CDS.Filter := 'Jenis = 0';

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

procedure TfrmSalesPayment.CDSAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmSalesPayment.colCostAmountPropertiesEditValueChanged(Sender:
    TObject);
begin
  inherited;
  DCCost.Post;
  CalculateAll;
end;

procedure TfrmSalesPayment.colInvoiceNoPropertiesButtonClick(Sender: TObject;
    AButtonIndex: Integer);
begin
  inherited;
  LookupInvoice;
end;

procedure TfrmSalesPayment.colInvoiceNoPropertiesValidate(Sender: TObject; var
    DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  lSales: TSalesInvoice;
begin
  inherited;
  lSales := TSalesInvoice.Create;
  Try
    lSales.LoadByCode(VarToStr(DisplayValue));
    SetInvoiceToGrid(lSales);
  Finally
    lSales.Free;
  End;
end;

procedure TfrmSalesPayment.colPaidAmtPropertiesEditValueChanged(Sender:
    TObject);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmSalesPayment.colReturAmtPropertiesEditValueChanged(Sender:
    TObject);
begin
  inherited;
  DC.Post;
  CalculateAll;
end;

procedure TfrmSalesPayment.colReturNoPropertiesButtonClick(Sender: TObject;
    AButtonIndex: Integer);
begin
  inherited;
  LookupRetur();
end;

procedure TfrmSalesPayment.colReturNoPropertiesValidate(Sender: TObject; var
    DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
//var
//  lRet: TPurchaseRetur;
begin
  inherited;
//  lRet := TPurchaseRetur.Create;
//  Try
//    lRet.LoadByCode(VarToStr(DisplayValue));
//    SetReturToGrid(lRet);
//  Finally
//    lRet.Free;
//  End;
end;

procedure TfrmSalesPayment.cxGrdMainEditKeyDown(Sender: TcxCustomGridTableView;
    AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if (Key = VK_F5) and (aItem = colInvoiceNo) then
  begin
    LookupInvoice(VarToStr(AEdit.EditingValue));
  end;
end;

function TfrmSalesPayment.DC: TcxGridDBDataController;
begin
  Result := cxGrdMain.DataController;
end;

function TfrmSalesPayment.DCCost: TcxGridDBDataController;
begin
  Result := cxGrdCost.DataController;
end;

procedure TfrmSalesPayment.dtDueDateKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    FocusToGrid;
  end;
end;

procedure TfrmSalesPayment.FocusToGrid;
begin
  cxGrid1.SetFocus;
  cxGrid1.FocusedView := cxGrdMain;
  if CDS.RecordCount = 0 then
  begin
    CDS.Append;
    cxGrdMain.Controller.EditingController.ShowEdit;
  end;
end;

procedure TfrmSalesPayment.FocusToGridCost;
begin
  cxGrid1.SetFocus;
  cxGrid1.FocusedView := cxGrdCost;
  if CDSCost.RecordCount = 0 then
  begin
    CDSCost.Append;
    cxGrdCost.Controller.EditingController.ShowEdit;
  end;
end;

procedure TfrmSalesPayment.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  InitView;
  cxGrid1.FocusedView := cxGrdMain;
  LoadByID(0);
end;

procedure TfrmSalesPayment.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_F1 then
    edRefno.SetFocus;

  if Key = VK_F2 then
    FocusToGrid
  else if Key = VK_F3 then
    FocusToGridCost
  else if Key = VK_F4 then
    ckFilterSalesman.Checked := not ckFilterSalesman.Checked;

end;

function TfrmSalesPayment.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TFinancialTransaction.CreateDataSet(Self, False);
    FCDS.AddField('InvoiceNo',ftString);
    FCDS.AddField('Customer',ftString);
    FCDS.AddField('CustomerID',ftInteger);
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

function TfrmSalesPayment.GetCDSClone: TClientDataset;
begin
  if FCDSClone = nil then
  begin
    FCDSClone := CDS.ClonedDataset(Self);
  end;
  Result := FCDSClone;
end;

function TfrmSalesPayment.GetCDSCloneCost: TClientDataset;
begin
  if FCDSCloneCost = nil then
  begin
    FCDSCloneCost := CDSCost.ClonedDataset(Self);
  end;
  Result := FCDSCloneCost;
end;

function TfrmSalesPayment.GetCDSCost: TClientDataset;
begin
  if FCDSCost = nil then
  begin
    FCDSCost := TFinancialTransaction.CreateDataSet(Self, False);
    FCDSCost.AfterDelete := CDSAfterDelete;
    FCDSCost.CreateDataSet;
  end;
  Result := FCDSCost;
end;

function TfrmSalesPayment.GetPayment: TSalesPayment;
begin
  if FPayment = nil then
    FPayment := TSalesPayment.Create;
  Result := FPayment;
end;

procedure TfrmSalesPayment.InitView;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  cxGrdCost.PrepareFromCDS(CDSCost);
  cxLookupRekening.Properties.LoadFromSQL(Self,
    'select id, nama, jenis from trekening','nama');
  cxLookupSalesman.Properties.LoadFromSQL(Self,
    'select id, nama from tsalesman','nama');
  TcxExtLookup(colCostAccount.Properties).LoadFromSQL(Self,
    'select id, kode + '' - '' + nama as nama from taccount where isdetail = 1','nama');
end;

procedure TfrmSalesPayment.LoadByID(aID: Integer; IsReadOnly: Boolean = False);
var
  lItem: TFinancialTransaction;
  lSalesInv: TSalesInvoice;
  lSalesRet: TSalesRetur;
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

  edRefno.Text        := Payment.Refno;
  cbMedia.ItemIndex   := Payment.Media;
  cbMediaPropertiesEditValueChanged(Self);

  dtTransDate.Date    := Payment.TransDate;

  if dtTransDate.Date <= 0 then dtTransDate.Clear;

  cxLookupSalesman.Clear;
  if Payment.Salesman <> nil then
    cxLookupSalesman.EditValue := Payment.Salesman.ID;

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

  lSalesInv := TSalesInvoice.Create;
  lSalesRet := TSalesRetur.Create;
  Try
    for lItem in Payment.Items do
    begin
      if lItem.DebetAmt > 0 then continue;
      if lItem.SalesInvoice = nil then
      begin
        CDSCost.Append;
        lItem.UpdateToDataset(CDSCost);
        CDSCost.Post;
      end else
      begin
        CDS.Append;
        lItem.UpdateToDataset(CDS);
        if lItem.SalesInvoice <> nil then
        begin
          if lSalesInv.LoadByID(lItem.SalesInvoice.ID) then
          begin
            CDS.FieldByName('InvoiceNo').AsString     := lSalesInv.InvoiceNo;
            CDS.FieldByName('InvoiceDate').AsDateTime := lSalesInv.TransDate;
            CDS.FieldByName('InvoiceAmt').AsFloat     := lSalesInv.Amount;
            CDS.FieldByName('InvoiceRemain').AsFloat  := lSalesInv.GetRemain + lItem.Amount + lItem.ReturAmt;
            if lSalesInv.Customer <> nil then
            begin
              lSalesInv.Customer.ReLoad(False);
              CDS.FieldByName('CustomerID').AsInteger := lSalesInv.Customer.ID;
              CDS.FieldByName('Customer').AsString    := lSalesInv.Customer.Nama;
            end;
          end;
        end;
        if lItem.SalesRetur <> nil then
        begin
          if lSalesRet.LoadByID(lItem.SalesRetur.ID) then
          begin
            CDS.FieldByName('ReturNo').AsString       := lSalesRet.Refno;
            CDS.FieldByName('ReturRemain').AsFloat    := lSalesRet.Amount - lSalesRet.PaidAmount + lItem.ReturAmt;
          end;
        end;
        CDS.Post;
      end;
    end;
    CalculateAll;
  Finally
    CDS.EnableControls;
    CDSCost.EnableControls;
    FreeAndNil(lSalesInv);
    FreeAndNil(lSalesRet);
  End;

  btnSave.Enabled := not IsReadOnly;
end;

procedure TfrmSalesPayment.LookupInvoice(sKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  lInvoice: TSalesInvoice;
  S: string;
begin
  if (ckFilterSalesman.Checked) and (VarToInt(cxLookupSalesman.EditValue) = 0) then
  begin
    TAppUtils.Warning('Salesman harus dipilih terlebih dahulu'
      +#13 + 'Atau non aktifkan [Filter Faktur atas Salesman] agar bisa memilih faktur tanpa salesman'
    );
    exit;
  end;


  S := 'SELECT A.ID, A.INVOICENO, B.NAMA AS CUSTOMER,'
      +' A.TRANSDATE, A.DUEDATE, B.NAMA AS SUPPLIER,'
      +' A.AMOUNT, A.PAIDAMOUNT, A.RETURAMOUNT, A.NOTES,'
      +' (A.AMOUNT - A.PAIDAMOUNT - A.RETURAMOUNT) AS REMAIN,'
      +' C.NAMA AS SALESMAN'
      +' FROM TSALESINVOICE A'
      +' INNER JOIN TCUSTOMER B ON A.CUSTOMER_ID = B.ID'
      +' LEFT JOIN TSALESMAN C ON A.SALESMAN_ID = C.ID'
      +' WHERE (A.AMOUNT - ISNULL(A.PAIDAMOUNT,0) - ISNULL(A.RETURAMOUNT,0)) > '
      + FloatToStr(AppVariable.Toleransi_Piutang);

  if ckFilterSalesman.Checked then
    S := S + ' and a.salesman_id = ' + IntToStr(VarToInt(cxLookupSalesman.EditValue));

  cxLookup := TfrmCXServerLookup.Execute(S, 'ID', 0, 0 );
  Try
    cxLookup.PreFilter('INVOICENO', sKey);
    if cxLookup.ShowModal = mrOK then
    begin
      lInvoice := TSalesInvoice.Create;
      Try
        lInvoice.LoadByID(VarToInt(cxLookup.FieldValue('ID')));
        SetInvoiceToGrid(lInvoice);
      Finally
        lInvoice.Free;
      End;
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmSalesPayment.LookupRetur;
var
  aCustomerID: Integer;
  cxLookup: TfrmCXServerLookup;
  lRetur: TSalesRetur;
  S: string;
begin
  aCustomerID  := VarToInt(cxGrdMain.Controller.FocusedRecord.Values[colCustomerID.Index]);
  if aCustomerID = 0 then
  begin
    TAppUtils.Warning('Customer belum terisi');
    exit;
  end;

  S := 'SELECT A.ID, A.REFNO, A.TRANSDATE,  B.NAMA AS CUSTOMER,'
      +' A.AMOUNT, A.PAIDAMOUNT, A.NOTES,'
      +' (A.AMOUNT - A.PAIDAMOUNT) AS REMAIN'
      +' FROM TSALESRETUR A'
      +' INNER JOIN TCUSTOMER B ON A.CUSTOMER_ID = B.ID'
      +' WHERE (A.AMOUNT - ISNULL(A.PAIDAMOUNT,0)) > '
      + FloatToStr(AppVariable.Toleransi_Piutang)
      +' AND A.CUSTOMER_ID = ' + IntToStr(aCustomerID);


  cxLookup := TfrmCXServerLookup.Execute(S, 'ID', StartOfTheMonth(Now()), EndOfTheMonth(Now()) );
  Try
//    cxLookup.PreFilter('REFNO', '');
    if cxLookup.ShowModal = mrOK then
    begin
      lRetur := TSalesRetur.Create;
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

procedure TfrmSalesPayment.SetInvoiceToGrid(AInvoice: TSalesInvoice);
begin
  if AInvoice = nil then exit;
  DC.SetEditValue(colInvoiceID.Index, AInvoice.ID, evsValue);
  DC.SetEditValue(colInvoiceNo.Index, AInvoice.InvoiceNo, evsValue);

  AInvoice.Customer.ReLoad(False);
  DC.SetEditValue(colCustomerID.Index, AInvoice.Customer.ID, evsValue);
  DC.SetEditValue(colCustomer.Index, AInvoice.Customer.Nama, evsValue);

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

procedure TfrmSalesPayment.SetReturToGrid(aRetur: TSalesRetur);
begin
  if aRetur = nil then exit;
  DC.SetEditValue(colReturID.Index, aRetur.ID, evsValue);
  DC.SetEditValue(colReturNo.Index, aRetur.Refno, evsValue);
  DC.SetEditValue(colReturRemain.Index, aRetur.Amount - aRetur.PaidAmount, evsValue);
  DC.SetEditValue(colReturAmt.Index, aRetur.Amount - aRetur.PaidAmount, evsValue);
  CalculateAll;
end;

procedure TfrmSalesPayment.UpdateData;
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

  if Payment.Salesman = nil then
    Payment.Salesman := TSalesman.Create;

  if Payment.Rekening = nil then
    Payment.Rekening    := TRekening.Create;

  Payment.Salesman.ID := VarToInt(cxLookupSalesman.EditValue);
  Payment.Rekening.ID := VarToInt(cxLookupRekening.EditValue);
  Payment.Items.Clear;

  //header credit
  lItem                 := TFinancialTransaction.Create;
  lItem.DebetAmt        := Payment.Amount;
  lItem.CreditAmt       := 0;
  lItem.Amount          := Payment.Amount;
  lItem.TransDate       := Payment.TransDate;
  lItem.Notes           := 'Sales Payment : ' + Payment.Refno;
  lItem.TransType       := Payment.PaymentFlag;
  lItem.Rekening        := TRekening.CreateID(Payment.Rekening.ID);
  Payment.Items.Add(lItem);

  CDS.First;
  while not CDS.Eof do
  begin
    lItem               := TFinancialTransaction.Create;
    lItem.SetFromDataset(CDS);
    lItem.SetToCredit; //pembayaran piutang
    lItem.TransType     := Payment.PaymentFlag;
    lItem.TransDate     := Payment.TransDate;
    lItem.Notes         := 'Sales Payment : ' + Payment.Refno;
    Payment.Items.Add(lItem);
    CDS.Next;
  end;

  CDSCost.First;
  while not CDSCost.Eof do
  begin
    lItem               := TFinancialTransaction.Create;
    lItem.SetFromDataset(CDSCost);
    lItem.SetToCredit; //pembayaran biaya (sebagai pendapatan)
    lItem.TransType     := Payment.PaymentFlag;
    lItem.TransDate     := Payment.TransDate;
//    lItem.Notes         := 'Sales Payment : ' + Payment.Refno;
    Payment.Items.Add(lItem);
    CDSCost.Next;
  end;
end;

function TfrmSalesPayment.ValidateData: Boolean;
begin
  Result := False;

  if (ckFilterSalesman.Checked) and (VarToInt(cxLookupSalesman.EditValue) = 0) then
  begin
    TAppUtils.Warning('Salesman harus dipilih terlebih dahulu'
      +#13 + 'Atau non aktifkan [Filter Faktur atas Salesman] agar bisa menyimpan data'
    );
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


  if CDS.RecordCount = 0 then
  begin
    TAppUtils.Warning('Data Faktur tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;

  if CDS.Locate('SalesInvoice', null, []) or CDS.Locate('SalesInvoice', 0, []) then
  begin
    TAppUtils.Warning('Invoice tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;

  CDS.First;
  while not CDS.Eof do
  begin
    if (CDS.FieldByName('SalesRetur').AsInteger = 0)
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

  Result := TAppUtils.Confirm('Anda yakin data sudah sesuai?');
end;

end.
