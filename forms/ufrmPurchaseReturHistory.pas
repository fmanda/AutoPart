unit ufrmPurchaseReturHistory;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox,
  uTransDetail, Datasnap.DBClient, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCalendar, cxTextEdit, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxMaskEdit, cxButtonEdit;

type
  TfrmPurchaseReturHistory = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edSupplier: TcxTextEdit;
    edReturNo: TcxButtonEdit;
    cxLabel8: TcxLabel;
    dtTransdate: TcxDateEdit;
    crAmount: TcxCurrencyEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    crPaid: TcxCurrencyEdit;
    cxLabel6: TcxLabel;
    crRemain: TcxCurrencyEdit;
    cxLabel7: TcxLabel;
    cxLookupGudang: TcxExtLookupComboBox;
    edInvoiceNo: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colTransDate: TcxGridDBColumn;
    colRefNo: TcxGridDBColumn;
    colReturNo: TcxGridDBColumn;
    colNotes: TcxGridDBColumn;
    colReturAmt: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    colSaldo: TcxGridDBColumn;
    procedure btnExportClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure edReturNoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edReturNoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edReturNoPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    PaidAmount: Double;
    FCDS: TClientDataset;
    FPurchaseRetur: TPurchaseRetur;
    function GetCDS: TClientDataset;
    function GetPurchaseRetur: TPurchaseRetur;
    procedure InitView;
    procedure LoadData;
    procedure LoadPurchaseRetur;
    procedure LookupRetur(sKey: string = '');
    property CDS: TClientDataset read GetCDS write FCDS;
    property PurchaseRetur: TPurchaseRetur read GetPurchaseRetur write
        FPurchaseRetur;
    { Private declarations }
  protected
    procedure ValidatePaidAmount;
  public
    { Public declarations }
  end;

var
  frmPurchaseReturHistory: TfrmPurchaseReturHistory;


implementation

uses
  uDBUtils, uDXUtils, uAppUtils, System.DateUtils,
  uFinancialTransaction, ufrmCXServerLookup, System.Math;

{$R *.dfm}

procedure TfrmPurchaseReturHistory.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmPurchaseReturHistory.btnRefreshClick(Sender: TObject);
begin
  inherited;
  PurchaseRetur.ReLoad();
  LoadPurchaseRetur;
end;

procedure TfrmPurchaseReturHistory.edReturNoKeyDown(Sender: TObject; var Key:
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
    LookupRetur(sKey);
  end
  else if (Key = VK_RETURN) then
    SelectNext(Screen.ActiveControl, True, True);
end;

procedure TfrmPurchaseReturHistory.edReturNoPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  LookupRetur();
end;

procedure TfrmPurchaseReturHistory.edReturNoPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if PurchaseRetur.LoadByCode(VarToStr(DisplayValue)) then
  begin
    LoadPurchaseRetur;
  end
  else
  begin
    Error := True;
    ErrorText := 'No Retur : ' + VarToStr(DisplayValue) + ' tidak ditemukan';
  end;
end;

procedure TfrmPurchaseReturHistory.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  InitView;
end;

function TfrmPurchaseReturHistory.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TClientDataSet.Create(Self);
    FCDS.AddField('TransDate', ftDate);
    FCDS.AddField('RefNo', ftString);
    FCDS.AddField('InvoiceNo', ftString);
    FCDS.AddField('Notes', ftString);
//    FCDS.AddField('Amount', ftFloat);
    FCDS.AddField('ReturAmt', ftFloat);
    FCDS.AddField('Saldo', ftFloat);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmPurchaseReturHistory.GetPurchaseRetur: TPurchaseRetur;
begin
  if FPurchaseRetur = nil then
    FPurchaseRetur := TPurchaseRetur.Create;
  Result := FPurchaseRetur;
end;

procedure TfrmPurchaseReturHistory.InitView;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  cxLookupGudang.Properties.LoadFromSQL(Self,
    'select id, nama from twarehouse','nama');
end;

procedure TfrmPurchaseReturHistory.LoadData;
var
  S: string;
begin
  if PurchaseRetur.ID = 0 then
  begin
    TAppUtils.Warning('Retur belum dipilih');
    exit;
  end;

  crPaid.Value := 0;
  PaidAmount := 0;
//  crAmount.Value := 0;
  crRemain.Value := crAmount.Value - crPaid.Value;

  CDS.EmptyDataSet;

  S := 'SELECT B.ID, B.TRANSDATE, B.REFNO, C.INVOICENO, B.NOTES, B.RETURAMT'
      +' FROM TPURCHASERETUR A'
      +' INNER JOIN TFINANCIALTRANSACTION B ON A.ID = B.PURCHASERETUR_ID'
      +' LEFT JOIN TPURCHASEINVOICE C ON B.PURCHASEINVOICE_ID = C.ID'
      +' WHERE A.ID = ' + IntToStr(PurchaseRetur.ID) ;

  with TDBUtils.OpenQuery(S) do
  begin
    Try
      while not eof do
      begin
        CDS.Append;
        CDS.FieldByName('TransDate').AsDateTime := FieldByName('TransDate').AsDateTime;
        CDS.FieldByName('Refno').AsString       := FieldByName('Refno').AsString;
        CDS.FieldByName('INVOICENO').AsString   := FieldByName('INVOICENO').AsString;
        CDS.FieldByName('Notes').AsString       := FieldByName('Notes').AsString;
        CDS.FieldByName('ReturAmt').AsFloat     := FieldByName('ReturAmt').AsFloat;

        PaidAmount := PaidAmount +  FieldByName('ReturAmt').AsFloat;
        crPaid.Value := PaidAmount;
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

procedure TfrmPurchaseReturHistory.LoadPurchaseRetur;
begin
  edReturNo.Text      := PurchaseRetur.Refno;
  dtTransdate.Date    := PurchaseRetur.TransDate;

  edInvoiceNo.Clear;
  if PurchaseRetur.Invoice <> nil then
  begin
    PurchaseRetur.Invoice.ReLoad();
    edInvoiceNo.Text := PurchaseRetur.Invoice.InvoiceNo;
  end;

  edSupplier.Clear;
  cxLookupGudang.Clear;

  crAmount.Value    := PurchaseRetur.Amount;
  crPaid.Value      := PurchaseRetur.PaidAmount;
  crRemain.Value    := PurchaseRetur.GetRemain;

  if PurchaseRetur.Supplier <> nil then
  begin
    PurchaseRetur.Supplier.ReLoad();
    edSupplier.Text := PurchaseRetur.Supplier.Nama;
  end;

  if PurchaseRetur.Warehouse <> nil then
  begin
    cxLookupGudang.EditValue := PurchaseRetur.Warehouse.ID;
  end;

  LoadData;
//  btnRefreshClick(Self);
end;

procedure TfrmPurchaseReturHistory.LookupRetur(sKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  S: string;
begin
  sKey := '' ;  //NO PREFILTER
  S := 'SELECT A.ID, A.REFNO, A.TRANSDATE AS TANGGAL, B.NAMA AS SUPPLIER,'
      +' C.NAMA AS GUDANG, A.AMOUNT AS TOTAL, A.PAIDAMOUNT,'
      +' (A.AMOUNT - ISNULL(A.PAIDAMOUNT,0) ) AS SISARETUR, A.NOTES'
      +' FROM TPURCHASERETUR A'
      +' INNER JOIN TSUPPLIER B ON A.SUPPLIER_ID = B.ID'
      +' LEFT JOIN TWAREHOUSE C ON A.WAREHOUSE_ID = C.ID'
      +' LEFT JOIN TPURCHASEINVOICE D ON A.INVOICE_ID = D.ID'
      +' WHERE A.TRANSDATE BETWEEN :startdate AND :enddate';


  cxLookup := TfrmCXServerLookup.Execute(S, 'ID', IncYear(StartOfTheMonth(Now()), -1), EndOfTheMonth(Now()) );
  Try
    cxLookup.PreFilter('REFNO', sKey);
    if cxLookup.ShowModal = mrOK then
    begin
      PurchaseRetur.LoadByID(cxLookup.FieldValue('id'));
      LoadPurchaseRetur;
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmPurchaseReturHistory.ValidatePaidAmount;
begin
  if Abs(crRemain.Value - PurchaseRetur.GetRemain)>100 then
  begin
    TAppUtils.Warning('Ada Selisih Antara Saldo Header dengan Detail Pembayaran'
      +#13 + 'Aplikasi akan otomatis melakukan adjust saldo Header'
    );
    PurchaseRetur.PaidAmount := PaidAmount;
    PurchaseRetur.UpdateRemain(Now());
    TDBUtils.Commit;
  end;
end;

end.
