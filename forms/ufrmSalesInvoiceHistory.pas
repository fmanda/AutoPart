unit ufrmSalesInvoiceHistory;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCalendar, cxTextEdit, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, cxDropDownEdit,
  cxMaskEdit, cxButtonEdit, uItem, Datasnap.DBClient, uTransDetail;

type
  TfrmSalesInvoiceHistory = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edCustomer: TcxTextEdit;
    edInvoice: TcxButtonEdit;
    edSalesman: TcxTextEdit;
    cxLabel3: TcxLabel;
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
    colNotes: TcxGridDBColumn;
    colAmount: TcxGridDBColumn;
    colReturAmt: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    colReturNo: TcxGridDBColumn;
    colSaldo: TcxGridDBColumn;
    procedure btnExportClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure edInvoiceKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure edInvoicePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edInvoicePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    CashTerbayar: Double;
    ReturTerBayar: Double;
    FCDS: TClientDataset;
    FSalesInvoice: TSalesInvoice;
    function GetCDS: TClientDataset;
    function GetSalesInvoice: TSalesInvoice;
    procedure InitView;
    procedure LoadData;
    procedure LoadSalesInvoice;
    procedure LookupInvoice(sKey: string = '');
    property CDS: TClientDataset read GetCDS write FCDS;
    property SalesInvoice: TSalesInvoice read GetSalesInvoice write FSalesInvoice;
    { Private declarations }
  protected
    procedure ValidatePaidAmount;
  public
    { Public declarations }
  end;

var
  frmSalesInvoiceHistory: TfrmSalesInvoiceHistory;

implementation

uses
  uDBUtils, uDXUtils, uAppUtils, System.DateUtils,
  uFinancialTransaction, ufrmCXServerLookup, System.Math;

{$R *.dfm}

procedure TfrmSalesInvoiceHistory.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmSalesInvoiceHistory.btnRefreshClick(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TfrmSalesInvoiceHistory.edInvoiceKeyDown(Sender: TObject; var Key:
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

procedure TfrmSalesInvoiceHistory.edInvoicePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  sKey: string;
  Edit: TcxCustomEdit;
begin
  inherited;
  Edit := Sender as TcxCustomEdit;
  sKey := VarToStr(Edit.EditingValue);
  LookupInvoice(sKey);
end;

procedure TfrmSalesInvoiceHistory.edInvoicePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if SalesInvoice.LoadByCode(VarToStr(DisplayValue)) then
  begin
    LoadSalesInvoice;
  end
  else
  begin
    Error := True;
    ErrorText := 'No Invoice : ' + VarToStr(DisplayValue) + ' tidak ditemukan';
  end;
end;

procedure TfrmSalesInvoiceHistory.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  InitView;
end;

function TfrmSalesInvoiceHistory.GetCDS: TClientDataset;
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

function TfrmSalesInvoiceHistory.GetSalesInvoice: TSalesInvoice;
begin
  if FSalesInvoice = nil then
    FSalesInvoice := TSalesInvoice.Create;
  Result := FSalesInvoice;
end;

procedure TfrmSalesInvoiceHistory.InitView;
begin
  cxGrdMain.PrepareFromCDS(CDS);
end;

procedure TfrmSalesInvoiceHistory.LoadData;
var
  S: string;
begin
  if SalesInvoice.ID = 0 then
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
      + ' FROM TSALESINVOICE A'
      + ' INNER JOIN TFINANCIALTRANSACTION B ON A.ID = B.SALESINVOICE_ID'
      + ' LEFT JOIN TSALESRETUR C ON B.SALESRETUR_ID = C.ID'
      + ' WHERE A.ID = ' + IntToStr(SalesInvoice.ID) ;

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

procedure TfrmSalesInvoiceHistory.LoadSalesInvoice;
begin
  edInvoice.Text  := SalesInvoice.InvoiceNo;
  dtInvoice.Date  := SalesInvoice.TransDate;
  dtJtTempo.Date  := SalesInvoice.DueDate;

  edCustomer.Clear;
  edSalesman.Clear;

  crAmount.Value  := SalesInvoice.Amount;
  crPaid.Value    := SalesInvoice.GetTotalBayar;
  crRemain.Value  := SalesInvoice.GetRemain;

  if SalesInvoice.Customer <> nil then
  begin
    SalesInvoice.Customer.ReLoad();
    edCustomer.Text := SalesInvoice.Customer.Nama;
  end;

  if SalesInvoice.Salesman <> nil then
  begin
    SalesInvoice.Salesman.ReLoad();
    edSalesman.Text := SalesInvoice.Salesman.Nama;
  end;

  btnRefreshClick(Self);
end;

procedure TfrmSalesInvoiceHistory.LookupInvoice(sKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  S: string;
begin
  sKey := '' ;  //NO PREFILTER
  S := 'SELECT A.ID, A.INVOICENO, A.TRANSDATE AS TANGGAL, A.DUEDATE AS JATUHTEMPO,'
      +' B.NAMA AS CUSTOMER, C.NAMA AS SALESMAN,'
      +' CASE WHEN A.PAYMENTFLAG = 1 THEN ''TEMPO'' ELSE ''CASH'' END AS CARABAYAR,'
      +' A.AMOUNT AS TOTAL, A.PAIDAMOUNT, A.RETURAMOUNT,'
      +' (A.AMOUNT - ISNULL(A.PAIDAMOUNT,0) - ISNULL(A.RETURAMOUNT,0)) AS SISAPIUTANG,'
      +' A.NOTES'
      +' FROM TSALESINVOICE A'
      +' INNER JOIN TCUSTOMER B ON A.CUSTOMER_ID = B.ID'
      +' LEFT JOIN TSALESMAN C ON A.SALESMAN_ID = C.ID'
      +' WHERE A.TRANSDATE BETWEEN :startdate AND :enddate';


  cxLookup := TfrmCXServerLookup.Execute(S, 'ID', IncYear(StartOfTheMonth(Now()), -1), EndOfTheMonth(Now()) );
  Try
    cxLookup.PreFilter('INVOICENO', sKey);
    if cxLookup.ShowModal = mrOK then
    begin
      SalesInvoice.LoadByID(cxLookup.FieldValue('id'));
      LoadSalesInvoice;
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmSalesInvoiceHistory.ValidatePaidAmount;
begin
  if Abs(crRemain.Value - SalesInvoice.GetRemain)>100 then
  begin
    TAppUtils.Warning('Ada Selisih Antara Saldo Header dengan Detail Pembayaran'
      +#13 + 'Aplikasi akan otomatis melakukan adjust saldo Header'
    );
    SalesInvoice.PaidAmount := CashTerbayar;
    SalesInvoice.ReturAmount := ReturTerBayar;
    SalesInvoice.UpdateRemain;
  end;
end;

end.
