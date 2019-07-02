unit ufrmSalesReturHistory;

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
  TfrmSalesReturHistory = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edCustomer: TcxTextEdit;
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
    colSaldo: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure btnExportClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure edReturNoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edReturNoPropertiesButtonClick(Sender: TObject; AButtonIndex:
        Integer);
    procedure edReturNoPropertiesValidate(Sender: TObject; var DisplayValue:
        Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    FCDS: TClientDataset;
    FSalesRetur: TSalesRetur;
    PaidAmount: Double;
    function GetCDS: TClientDataset;
    function GetSalesRetur: TSalesRetur;
    procedure InitView;
    procedure LoadData;
    procedure LoadSalesRetur;
    procedure LookupRetur(sKey: string = '');
    property CDS: TClientDataset read GetCDS write FCDS;
    property SalesRetur: TSalesRetur read GetSalesRetur write FSalesRetur;
    { Private declarations }
  protected
    procedure ValidatePaidAmount;
  public
    { Public declarations }
  end;

var
  frmSalesReturHistory: TfrmSalesReturHistory;

implementation

uses
  uDBUtils, uDXUtils, uAppUtils, System.DateUtils,
  uFinancialTransaction, ufrmCXServerLookup, System.Math;

{$R *.dfm}

procedure TfrmSalesReturHistory.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmSalesReturHistory.btnRefreshClick(Sender: TObject);
begin
  inherited;
  SalesRetur.ReLoad();
  LoadSalesRetur;
end;

procedure TfrmSalesReturHistory.edReturNoKeyDown(Sender: TObject; var Key:
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

procedure TfrmSalesReturHistory.edReturNoPropertiesButtonClick(Sender: TObject;
    AButtonIndex: Integer);
begin
  inherited;
  LookupRetur();
end;

procedure TfrmSalesReturHistory.edReturNoPropertiesValidate(Sender: TObject;
    var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if SalesRetur.LoadByCode(VarToStr(DisplayValue)) then
  begin
    LoadSalesRetur;
  end
  else
  begin
    Error := True;
    ErrorText := 'No Retur : ' + VarToStr(DisplayValue) + ' tidak ditemukan';
  end;
end;

procedure TfrmSalesReturHistory.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  InitView;
end;

function TfrmSalesReturHistory.GetCDS: TClientDataset;
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

function TfrmSalesReturHistory.GetSalesRetur: TSalesRetur;
begin
  if FSalesRetur = nil then
    FSalesRetur := TSalesRetur.Create;
  Result := FSalesRetur;
end;

procedure TfrmSalesReturHistory.InitView;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  cxLookupGudang.Properties.LoadFromSQL(Self,
    'select id, nama from twarehouse','nama');
end;

procedure TfrmSalesReturHistory.LoadData;
var
  S: string;
begin
  if SalesRetur.ID = 0 then
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
      +' FROM TSALESRETUR A'
      +' INNER JOIN TFINANCIALTRANSACTION B ON A.ID = B.SALESRETUR_ID'
      +' LEFT JOIN TSALESINVOICE C ON B.SALESINVOICE_ID = C.ID'
      +' WHERE A.ID = ' + IntToStr(SalesRetur.ID) ;

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

procedure TfrmSalesReturHistory.LoadSalesRetur;
begin
  edReturNo.Text      := SalesRetur.Refno;
  dtTransdate.Date    := SalesRetur.TransDate;

  edInvoiceNo.Clear;
  if SalesRetur.Invoice <> nil then
  begin
    SalesRetur.Invoice.ReLoad();
    edInvoiceNo.Text := SalesRetur.Invoice.InvoiceNo;
  end;

  edCustomer.Clear;
  cxLookupGudang.Clear;

  crAmount.Value    := SalesRetur.Amount;
  crPaid.Value      := SalesRetur.PaidAmount;
  crRemain.Value    := SalesRetur.GetRemain;

  if SalesRetur.Customer <> nil then
  begin
    SalesRetur.Customer.ReLoad();
    edCustomer.Text := SalesRetur.Customer.Nama;
  end;

  if SalesRetur.Warehouse <> nil then
  begin
    cxLookupGudang.EditValue := SalesRetur.Warehouse.ID;
  end;

  LoadData;
//  btnRefreshClick(Self);
end;

procedure TfrmSalesReturHistory.LookupRetur(sKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  S: string;
begin
  sKey := '' ;  //NO PREFILTER
  S := 'SELECT A.ID, A.REFNO, A.TRANSDATE AS TANGGAL, B.NAMA AS CUSTOMER,'
      +' C.NAMA AS GUDANG, A.AMOUNT AS TOTAL, A.PAIDAMOUNT,'
      +' (A.AMOUNT - ISNULL(A.PAIDAMOUNT,0) ) AS SISARETUR, A.NOTES'
      +' FROM TSALESRETUR A'
      +' INNER JOIN TCUSTOMER B ON A.CUSTOMER_ID = B.ID'
      +' LEFT JOIN TWAREHOUSE C ON A.WAREHOUSE_ID = C.ID'
      +' LEFT JOIN TSALESINVOICE D ON A.INVOICE_ID = D.ID'
      +' WHERE A.TRANSDATE BETWEEN :startdate AND :enddate';


  cxLookup := TfrmCXServerLookup.Execute(S, 'ID', IncYear(StartOfTheMonth(Now()), -1), EndOfTheMonth(Now()) );
  Try
    cxLookup.PreFilter('REFNO', sKey);
    if cxLookup.ShowModal = mrOK then
    begin
      SalesRetur.LoadByID(cxLookup.FieldValue('id'));
      LoadSalesRetur;
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmSalesReturHistory.ValidatePaidAmount;
begin
  if Abs(crRemain.Value - SalesRetur.GetRemain)>100 then
  begin
    TAppUtils.Warning('Ada Selisih Antara Saldo Header dengan Detail Pembayaran'
      +#13 + 'Aplikasi akan otomatis melakukan adjust saldo Header'
    );
    SalesRetur.PaidAmount := PaidAmount;
    SalesRetur.UpdateRemain(Now());
    TDBUtils.Commit;
  end;
end;

end.
