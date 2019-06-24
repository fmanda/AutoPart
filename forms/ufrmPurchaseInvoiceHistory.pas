unit ufrmPurchaseInvoiceHistory;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox,
  uTransDetail, Datasnap.DBClient, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCalendar, cxTextEdit, cxCurrencyEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, cxDropDownEdit, cxMaskEdit,
  cxButtonEdit;

type
  TfrmPurchaseInvoiceHistory = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edSupplier: TcxTextEdit;
    edInvoice: TcxButtonEdit;
    cxLabel8: TcxLabel;
    dtInvoice: TcxDateEdit;
    cxLabel9: TcxLabel;
    dtJtTempo: TcxDateEdit;
    cxLabel10: TcxLabel;
    cbBayar: TcxComboBox;
    crAmount: TcxCurrencyEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    crPaid: TcxCurrencyEdit;
    cxLabel6: TcxLabel;
    crRemain: TcxCurrencyEdit;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colTransDate: TcxGridDBColumn;
    colRefNo: TcxGridDBColumn;
    colReturNo: TcxGridDBColumn;
    colNotes: TcxGridDBColumn;
    colAmount: TcxGridDBColumn;
    colReturAmt: TcxGridDBColumn;
    colSaldo: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxLabel7: TcxLabel;
    cxLookupGudang: TcxExtLookupComboBox;
    procedure btnExportClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure edInvoiceKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edInvoicePropertiesButtonClick(Sender: TObject; AButtonIndex:
        Integer);
    procedure edInvoicePropertiesValidate(Sender: TObject; var DisplayValue:
        Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    CashTerbayar: Double;
    FCDS: TClientDataset;
    FPurchaseInvoice: TPurchaseInvoice;
    ReturTerBayar: Double;
    function GetCDS: TClientDataset;
    function GetPurchaseInvoice: TPurchaseInvoice;
    procedure InitView;
    procedure LoadData;
    procedure LoadPurchaseInvoice;
    procedure LookupInvoice(sKey: string = '');
    property CDS: TClientDataset read GetCDS write FCDS;
    property PurchaseInvoice: TPurchaseInvoice read GetPurchaseInvoice write
        FPurchaseInvoice;
    { Private declarations }
  protected
    procedure ValidatePaidAmount;
  public
    { Public declarations }
  end;

var
  frmPurchaseInvoiceHistory: TfrmPurchaseInvoiceHistory;

implementation

uses
  uDBUtils, uDXUtils, uAppUtils, System.DateUtils,
  uFinancialTransaction, ufrmCXServerLookup, System.Math;

{$R *.dfm}

procedure TfrmPurchaseInvoiceHistory.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmPurchaseInvoiceHistory.btnRefreshClick(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TfrmPurchaseInvoiceHistory.edInvoiceKeyDown(Sender: TObject; var Key:
    Word; Shift: TShiftState);
var
  sKey: string;
  Edit: TcxCustomEdit;
begin
  inherited;
  Edit := Sender as TcxCustomEdit;
  sKey := VarToStr(Edit.EditingValue);

  if (Key = VK_F5) then
  begin
    LookupInvoice(sKey);
  end
  else if (Key = VK_RETURN) then
    SelectNext(Screen.ActiveControl, True, True);
end;

procedure TfrmPurchaseInvoiceHistory.edInvoicePropertiesButtonClick(Sender:
    TObject; AButtonIndex: Integer);
var
  sKey: string;
  Edit: TcxCustomEdit;
begin
  inherited;
  Edit := Sender as TcxCustomEdit;
  sKey := VarToStr(Edit.EditingValue);
  LookupInvoice(sKey);
end;

procedure TfrmPurchaseInvoiceHistory.edInvoicePropertiesValidate(Sender:
    TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error:
    Boolean);
begin
  inherited;
  if PurchaseInvoice.LoadByCode(VarToStr(DisplayValue)) then
  begin
    LoadPurchaseInvoice;
  end
  else
  begin
    Error := True;
    ErrorText := 'No Invoice : ' + VarToStr(DisplayValue) + ' tidak ditemukan';
  end;
end;

procedure TfrmPurchaseInvoiceHistory.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  InitView;
end;

function TfrmPurchaseInvoiceHistory.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TClientDataSet.Create(Self);
    FCDS.AddField('TransDate', ftDate);
    FCDS.AddField('RefNo', ftString);
    FCDS.AddField('ReturNo', ftString);
    FCDS.AddField('Notes', ftString);
    FCDS.AddField('Amount', ftFloat);
    FCDS.AddField('ReturAmt', ftFloat);
    FCDS.AddField('Saldo', ftFloat);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmPurchaseInvoiceHistory.GetPurchaseInvoice: TPurchaseInvoice;
begin
  if FPurchaseInvoice = nil then
    FPurchaseInvoice := TPurchaseInvoice.Create;
  Result := FPurchaseInvoice;
end;

procedure TfrmPurchaseInvoiceHistory.InitView;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  cxLookupGudang.Properties.LoadFromSQL(Self,
    'select id, nama from twarehouse','nama');
end;

procedure TfrmPurchaseInvoiceHistory.LoadData;
var
  S: string;
begin
  if PurchaseInvoice.ID = 0 then
  begin
    TAppUtils.Warning('Invoice belum dipilih');
    exit;
  end;

  crPaid.Value := 0;
  CashTerbayar := 0;
  ReturTerBayar := 0;
  crRemain.Value := crAmount.Value - crPaid.Value;

  CDS.EmptyDataSet;

  S := 'SELECT B.ID, B.TRANSDATE, B.REFNO, C.REFNO AS RETURNO,'
      + ' B.NOTES, B.AMOUNT, B.RETURAMT'
      + ' FROM TPURCHASEINVOICE A'
      + ' INNER JOIN TFINANCIALTRANSACTION B ON A.ID = B.PURCHASEINVOICE_ID'
      + ' LEFT JOIN TPURCHASERETUR C ON B.PURCHASERETUR_ID = C.ID'
      + ' WHERE A.ID = ' + IntToStr(PurchaseInvoice.ID) ;

  with TDBUtils.OpenQuery(S) do
  begin
    Try
      while not eof do
      begin
        CDS.Append;
        CDS.FieldByName('TransDate').AsDateTime := FieldByName('TransDate').AsDateTime;
        CDS.FieldByName('Refno').AsString       := FieldByName('Refno').AsString;
        CDS.FieldByName('ReturNo').AsString     := FieldByName('ReturNo').AsString;
        CDS.FieldByName('Notes').AsString       := FieldByName('Notes').AsString;
        CDS.FieldByName('Amount').AsFloat       := FieldByName('Amount').AsFloat;
        CDS.FieldByName('ReturAmt').AsFloat     := FieldByName('ReturAmt').AsFloat;

        CashTerbayar := CashTerbayar +  FieldByName('Amount').AsFloat;
        ReturTerBayar := ReturTerBayar +  FieldByName('ReturAmt').AsFloat;

        crPaid.Value := CashTerbayar + ReturTerBayar;
        crRemain.Value := crAmount.Value - crPaid.Value;

        CDS.FieldByName('Saldo').AsFloat        := crRemain.Value;
        CDS.Post;
        next;
      end;
    Finally
      Free;
    End;
  end;

  ValidatePaidAmount;
end;

procedure TfrmPurchaseInvoiceHistory.LoadPurchaseInvoice;
begin
  edInvoice.Text  := PurchaseInvoice.InvoiceNo;
  dtInvoice.Date  := PurchaseInvoice.TransDate;
  dtJtTempo.Date  := PurchaseInvoice.DueDate;

  edSupplier.Clear;
  cxLookupGudang.Clear;

  crAmount.Value  := PurchaseInvoice.Amount;
  crPaid.Value    := PurchaseInvoice.GetTotalBayar;
  crRemain.Value  := PurchaseInvoice.GetRemain;

  if PurchaseInvoice.Supplier <> nil then
  begin
    PurchaseInvoice.Supplier.ReLoad();
    edSupplier.Text := PurchaseInvoice.Supplier.Nama;
  end;

  if PurchaseInvoice.Warehouse <> nil then
  begin
    cxLookupGudang.EditValue := PurchaseInvoice.Warehouse.ID;
  end;

  btnRefreshClick(Self);
end;

procedure TfrmPurchaseInvoiceHistory.LookupInvoice(sKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  S: string;
begin
  sKey := '' ;  //NO PREFILTER
  S := 'SELECT A.ID, A.INVOICENO, A.TRANSDATE AS TANGGAL, A.DUEDATE AS JATUHTEMPO,'
      +' B.NAMA AS SUPPLIER, C.NAMA AS GUDANG,'
      +' CASE WHEN A.PAYMENTFLAG = 1 THEN ''TEMPO'' ELSE ''CASH'' END AS CARABAYAR,'
      +' A.AMOUNT AS TOTAL, A.PAIDAMOUNT, A.RETURAMOUNT,'
      +' (A.AMOUNT - ISNULL(A.PAIDAMOUNT,0) - ISNULL(A.RETURAMOUNT,0)) AS SISAPIUTANG,'
      +' A.NOTES'
      +' FROM TPURCHASEINVOICE A'
      +' INNER JOIN TSUPPLIER B ON A.SUPPLIER_ID = B.ID'
      +' LEFT JOIN TWAREHOUSE C ON A.WAREHOUSE_ID = C.ID'
      +' WHERE A.TRANSDATE BETWEEN :startdate AND :enddate';


  cxLookup := TfrmCXServerLookup.Execute(S, 'ID', IncYear(StartOfTheMonth(Now()), -1), EndOfTheMonth(Now()) );
  Try
    cxLookup.PreFilter('INVOICENO', sKey);
    if cxLookup.ShowModal = mrOK then
    begin
      PurchaseInvoice.LoadByID(cxLookup.FieldValue('id'));
      LoadPurchaseInvoice;
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmPurchaseInvoiceHistory.ValidatePaidAmount;
begin
  if Abs(crRemain.Value - PurchaseInvoice.GetRemain)>100 then
  begin
    TAppUtils.Warning('Ada Selisih Antara Saldo Header dengan Detail Pembayaran'
      +#13 + 'Aplikasi akan otomatis melakukan adjust saldo Header'
    );
//    PurchaseInvoice.PaidAmount := CashTerbayar;
//    PurchaseInvoice.ReturAmount := ReturTerBayar;
//    PurchaseInvoice.UpdateRemain;
  end;
end;

end.
