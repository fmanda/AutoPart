unit uFinancialTransaction;

interface

uses
  CRUDObject, uDBUtils, Sysutils, uItem, System.Generics.Collections,
  uWarehouse, uSupplier, uCustomer, uSalesman, uAccount, uTransDetail;

type
  TFinancialTransaction = class;

  TCRUDFinance = class(TCRUDObject)
  private
    FAmount: Double;
    FItems: TObjectList<TFinancialTransaction>;
    FTransDate: TDateTime;
    FClosed: Integer;
    FModifiedBy: String;
    FModifiedDate: TDateTime;
    FRefno: string;
    FDueDate: TDateTime;
    FNotes: string;
    function GetItems: TObjectList<TFinancialTransaction>;
  protected
    function GetRefno: String; dynamic;
    procedure PrepareDetailObject(AObjItem: TCRUDObject); override;
  public
    destructor Destroy; override;
    function GenerateNo: String; virtual; abstract;
    function GetHeaderFlag: Integer; virtual; abstract;
    function SaveRepeat(aRepeatCount: Integer = 2; DoShowMsg: Boolean = True):
        Boolean;
    property Items: TObjectList<TFinancialTransaction> read GetItems write FItems;
  published
    property Amount: Double read FAmount write FAmount;
    property TransDate: TDateTime read FTransDate write FTransDate;
    property Closed: Integer read FClosed write FClosed;
    property ModifiedBy: String read FModifiedBy write FModifiedBy;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
    [AttributeOfCode]
    property Refno: string read FRefno write FRefno;
    property DueDate: TDateTime read FDueDate write FDueDate;
    property Notes: string read FNotes write FNotes;
  end;

  TFinancialTransaction = class(TCRUDObject)
  private
    FDebetAmt: Double;
    FReturAmt: Double;
    FSalesInvoice: TSalesInvoice;
    FNotes: string;
    FHeader_ID: Integer;
    FHeader_Flag: Integer;
    FSalesRetur: TSalesRetur;
    FRekening: TRekening;
    FAccount: TAccount;
    FCreditAmt: Double;
    FAmount: Double;
    FMedia: Integer;
    FMediaNo: string;
    FRefNo: string;
    FPurchaseInvoice: TPurchaseInvoice;
    FPurchaseRetur: TPurchaseRetur;
    FTransDate: TDateTime;
    FTransType: Integer;
  protected
    function GetSQLDeleteDetails(Header_ID: Integer): String; override;
    function GetSQLRetrieveDetails(Header_ID: Integer): String; override;
  public
    destructor Destroy; override;
    procedure SetToDebet;
    procedure SetToCredit;
  published
    property DebetAmt: Double read FDebetAmt write FDebetAmt;
    property ReturAmt: Double read FReturAmt write FReturAmt;
    property SalesInvoice: TSalesInvoice read FSalesInvoice write FSalesInvoice;
    property Notes: string read FNotes write FNotes;
    [AttributeOfHeader]
    property Header_ID: Integer read FHeader_ID write FHeader_ID;
    property Header_Flag: Integer read FHeader_Flag write FHeader_Flag;
    property SalesRetur: TSalesRetur read FSalesRetur write FSalesRetur;
    property Rekening: TRekening read FRekening write FRekening;
    property Account: TAccount read FAccount write FAccount;
    property CreditAmt: Double read FCreditAmt write FCreditAmt;
    property Amount: Double read FAmount write FAmount;
    property Media: Integer read FMedia write FMedia;
    property MediaNo: string read FMediaNo write FMediaNo;
    property RefNo: string read FRefNo write FRefNo;
    property PurchaseInvoice: TPurchaseInvoice read FPurchaseInvoice write
        FPurchaseInvoice;
    property PurchaseRetur: TPurchaseRetur read FPurchaseRetur write FPurchaseRetur;
    property TransDate: TDateTime read FTransDate write FTransDate;
    property TransType: Integer read FTransType write FTransType;
  end;

  TCashTransfer = class(TCRUDFinance)
  private
    FRekening: TRekening;
  protected
  public
    destructor Destroy; override;
    function GenerateNo: String; override;
    function GetHeaderFlag: Integer; override;
  published
    property Rekening: TRekening read FRekening write FRekening;
  end;

  TCashReceipt = class(TCRUDFinance)
  private
    FRekening: TRekening;
  protected
  public
    destructor Destroy; override;
    function GenerateNo: String; override;
    function GetHeaderFlag: Integer; override;
  published
    property Rekening: TRekening read FRekening write FRekening;
  end;

  TCashPayment = class(TCRUDFinance)
  private
    FRekening: TRekening;
  protected
  public
    destructor Destroy; override;
    function GenerateNo: String; override;
    function GetHeaderFlag: Integer; override;
  published
    property Rekening: TRekening read FRekening write FRekening;
  end;

type
  TSalesPayment = class(TCRUDFinance)
  private
    FMedia: Integer;
    FMediaNo: string;
    FReturAmount: Double;
    FPaymentFlag: Integer;
    FRekening: TRekening;
    FSalesman: TSalesman;
  protected
    function AfterSaveToDB: Boolean; override;
    function BeforeDeleteFromDB: Boolean; override;
    function BeforeSaveToDB: Boolean; override;
  public
    destructor Destroy; override;
    function GetHeaderFlag: Integer; override;
    class function CreateOrGetFromInv(aSalesInvoice: TSalesInvoice): TSalesPayment;
    class function CreateOrGetFromRetur(aSalesRetur: TSalesRetur): TSalesPayment;
    function GenerateNo: string; override;
    function UpdateRemain(aIsRevert: Boolean = False): Boolean;
    property PaymentFlag: Integer read FPaymentFlag write FPaymentFlag;
  published
    property Media: Integer read FMedia write FMedia;
    property MediaNo: string read FMediaNo write FMediaNo;
    property Rekening: TRekening read FRekening write FRekening;
    property Salesman: TSalesman read FSalesman write FSalesman;
    property ReturAmount: Double read FReturAmount write FReturAmount;
  end;

type
  TPurchasePayment = class(TCRUDFinance)
  private
    FMedia: Integer;
    FMediaNo: string;
    FPaymentFlag: Integer;
    FRekening: TRekening;
    FSupplier: TSupplier;
    FReturAmount: Double;
  protected
    function AfterSaveToDB: Boolean; override;
    function BeforeDeleteFromDB: Boolean; override;
    function BeforeSaveToDB: Boolean; override;
  public
    destructor Destroy; override;
    class function CreateOrGetFromInv(aPurchaseInv: TPurchaseInvoice):
        TPurchasePayment;
    class function CreateOrGetFromRetur(aPurchaseRetur: TPurchaseRetur):
        TPurchasePayment;
    function GenerateNo: String; override;
    function GetHeaderFlag: Integer; override;
    function UpdateRemain(aIsRevert: Boolean = False): Boolean;
  published
    property Media: Integer read FMedia write FMedia;
    property MediaNo: string read FMediaNo write FMediaNo;
    property PaymentFlag: Integer read FPaymentFlag write FPaymentFlag;
    property Rekening: TRekening read FRekening write FRekening;
    property Supplier: TSupplier read FSupplier write FSupplier;
    property ReturAmount: Double read FReturAmount write FReturAmount;
  end;

const
  HeaderFlag_PurchasePayment : Integer = 100;
  HeaderFlag_SalesPayment : Integer = 200;
  HeaderFlag_CashTransfer : Integer = 300;
  HeaderFlag_CashReceipt : Integer = 400;
  HeaderFlag_CashPayment : Integer = 500;

  Media_Cash : Integer = 0;
  Media_Tranfer : Integer = 1;
  Media_Cek : Integer = 2;

  

implementation

uses
  System.StrUtils, System.Classes, uAppUtils, System.DateUtils;

destructor TCRUDFinance.Destroy;
begin
  inherited;
  if FItems <> nil then FItems.Free;
end;

function TCRUDFinance.GetItems: TObjectList<TFinancialTransaction>;
begin
  if FItems = nil then
  begin
    FItems := TObjectList<TFinancialTransaction>.Create();
  end;
  Result := FItems;
end;

function TCRUDFinance.GetRefno: String;
begin
  Result := Refno;
end;

procedure TCRUDFinance.PrepareDetailObject(AObjItem: TCRUDObject);
begin
  if AObjItem is TFinancialTransaction then
  begin
    TFinancialTransaction(AObjItem).Header_Flag := GetHeaderFlag;
    TFinancialTransaction(AObjItem).TransDate := TransDate;
    TFinancialTransaction(AObjItem).Refno := GetRefno;
  end;

//  if AObjItem is TAvgCostUpdate then
//  begin
//    TAvgCostUpdate(AObjItem).Header_Flag  := GetHeaderFlag;
//  end;
end;

function TCRUDFinance.SaveRepeat(aRepeatCount: Integer = 2; DoShowMsg: Boolean
    = True): Boolean;
var
  iRepeat: Integer;
begin
  Result := False;

  if Self.ID > 0 then
  begin
    Result := Self.SaveToDB();
    exit;
  end else
  begin
    //hanya berlaku utk baru
    iRepeat := 0;
    while iRepeat <= aRepeatCount do
    begin
      Try
        Self.RefNo := GenerateNo;
        inc(iRepeat);
        Result := Self.SaveToDB();

        if Result then
        begin
          if DoShowMsg then
            TAppUtils.Information('Data Berhasil Disimpan dengan nomor bukti : ' + Self.GetRefno);
        end else
        begin
          TAppUtils.Error('SaveToDB Result = False without exception ???');
        end;

        exit; //sukses or error without exception we must exist
      except
        on E:Exception do
        begin
          if Pos('unique key', LowerCase(E.Message)) > 0 then
          begin
            if (iRepeat > aRepeatCount) or (not TAppUtils.Confirm('Terdeteksi Ada Nomor Bukti sudah terpakai, Otomatis Generate Baru dan Simpan?'
              + #13 +'Percobaan Simpan ke : ' + IntToStr(iRepeat)
              + #13#13 +'Pesan Error : '
              + #13 + E.Message
            ))
            then
            begin
              E.Message := 'Gagal Mengulang Simpan ke- ' + IntToStr(iRepeat-1) + #13 + E.Message;
              raise;
            end;
          end else
            Raise;
        end;
      End;
    end;
  end;
end;

destructor TFinancialTransaction.Destroy;
begin
  inherited;
  if FRekening <> nil then FreeAndNil(FRekening);
  if FAccount <> nil then FreeAndNil(FAccount);
  if FSalesInvoice <> nil then FreeAndNil(FSalesInvoice);
  if FSalesRetur <> nil then FreeAndNil(FSalesRetur);
  if FPurchaseInvoice <> nil then FreeAndNil(FPurchaseInvoice);
  if FPurchaseRetur <> nil then FreeAndNil(FPurchaseRetur);
end;

function TFinancialTransaction.GetSQLDeleteDetails(Header_ID: Integer): String;
var
  sFilter : String;
begin
//  if UpperCase(Self.GetTableName) = 'TFinancialTransaction' then
//    Raise Exception.Create('Must override GetSQLDeleteDetails for TFinancialTransaction');

  sFilter := 'Header_flag = ' + IntToStr(Header_Flag)
    +' AND Header_ID = ' + IntToStr(Header_ID);

  Result  := Format(SQL_Delete,[Self.GetTableName,sFilter]);
end;

function TFinancialTransaction.GetSQLRetrieveDetails(Header_ID: Integer): String;
var
//  lPO: TCRUDPOItem;
  sFilter : String;
begin
//  if UpperCase(Self.GetTableName) = 'TFinancialTransaction' then
//    Raise Exception.Create('Must override GetSQLRetrieveDetails for TFinancialTransaction');

  sFilter := 'Header_flag = ' + IntToStr(Header_Flag)
    +' And Header_ID = ' + IntToStr(Header_ID);
  Result  := Format(SQL_Select,['*', Self.GetTableName,sFilter]);
//
//  lPO := TCRUDPOItem.Create;
//  Result := Result + lPO.GetHeaderField;
end;

procedure TFinancialTransaction.SetToDebet;
begin
  Self.DebetAmt := Self.Amount;
  Self.CreditAmt := 0;
end;

procedure TFinancialTransaction.SetToCredit;
begin
  Self.DebetAmt   := 0;
  Self.CreditAmt  := Self.CreditAmt;
end;

destructor TCashPayment.Destroy;
begin
  inherited;
//  if FSupplier <> nil then FreeAndNil(FSupplier);
end;

function TCashPayment.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 5;
  aPrefix := Cabang + '.KK' + FormatDateTime('yymm',Now()) + '.';


  S := 'SELECT MAX(RefNo) FROM TCashPayment where Refno LIKE ' + QuotedStr(aPrefix + '%');

  with TDBUtils.OpenQuery(S) do
  begin
    Try
      if not eof then
        TryStrToInt(RightStr(Fields[0].AsString, aDigitCount), lNum);
    Finally
      Free;
    End;
  end;

  inc(lNum);
  Result := aPrefix + RightStr('00000' + IntToStr(lNum), aDigitCount);
end;

function TCashPayment.GetHeaderFlag: Integer;
begin
  Result := HeaderFlag_CashPayment;
end;

destructor TCashReceipt.Destroy;
begin
  inherited;
//  if FSupplier <> nil then FreeAndNil(FSupplier);
end;

function TCashReceipt.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 5;
  aPrefix := Cabang + '.KM' + FormatDateTime('yymm',Now()) + '.';


  S := 'SELECT MAX(Refno) FROM TCashReceipt where Refno LIKE ' + QuotedStr(aPrefix + '%');

  with TDBUtils.OpenQuery(S) do
  begin
    Try
      if not eof then
        TryStrToInt(RightStr(Fields[0].AsString, aDigitCount), lNum);
    Finally
      Free;
    End;
  end;

  inc(lNum);
  Result := aPrefix + RightStr('00000' + IntToStr(lNum), aDigitCount);
end;

function TCashReceipt.GetHeaderFlag: Integer;
begin
  Result := HeaderFlag_CashReceipt;
end;

destructor TCashTransfer.Destroy;
begin
  inherited;
//  if FSupplier <> nil then FreeAndNil(FSupplier);
end;

function TCashTransfer.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 5;
  aPrefix := Cabang + '.TK' + FormatDateTime('yymm',Now()) + '.';


  S := 'SELECT MAX(Refno) FROM TCashTransfer where Refno LIKE ' + QuotedStr(aPrefix + '%');

  with TDBUtils.OpenQuery(S) do
  begin
    Try
      if not eof then
        TryStrToInt(RightStr(Fields[0].AsString, aDigitCount), lNum);
    Finally
      Free;
    End;
  end;

  inc(lNum);
  Result := aPrefix + RightStr('00000' + IntToStr(lNum), aDigitCount);
end;

function TCashTransfer.GetHeaderFlag: Integer;
begin
  Result := HeaderFlag_CashTransfer;
end;

destructor TSalesPayment.Destroy;
begin
  inherited;
//  if FSupplier <> nil then FreeAndNil(FSupplier);
end;

function TSalesPayment.AfterSaveToDB: Boolean;
begin
  Result := Self.UpdateRemain;
end;

function TSalesPayment.BeforeDeleteFromDB: Boolean;
begin
  Result := Self.UpdateRemain(True);
end;

function TSalesPayment.BeforeSaveToDB: Boolean;
var
  lOldPayment: TSalesPayment;
begin
  Result := True;
  if Self.ID = 0 then exit;

  lOldPayment := TSalesPayment.Create;
  Try
    lOldPayment.LoadByID(Self.ID);
    lOldPayment.UpdateRemain(True);
  Finally
    lOldPayment.Free;
  End;
end;

class function TSalesPayment.CreateOrGetFromInv(aSalesInvoice: TSalesInvoice):
    TSalesPayment;
var
  lItem: TFinancialTransaction;
  lReturAmt: Double;
begin
  if aSalesInvoice.Rekening = nil then
    raise Exception.Create('aSalesInvoice.Rekening = nil');

  Result := TSalesPayment.Create;

  lReturAmt := 0;
  if aSalesInvoice.HasRetur then
  begin
    if aSalesInvoice.SalesRetur.Amount = 0 then
      aSalesInvoice.SalesRetur.ReLoad(False);

    lReturAmt := aSalesInvoice.SalesRetur.Amount;
  end;

  //load from inv
  Result.LoadByCode(aSalesInvoice.InvoiceNo);
  Result.Refno        := aSalesInvoice.InvoiceNo;
  Result.TransDate    := aSalesInvoice.TransDate;
  Result.DueDate      := Result.TransDate;
  Result.Amount       := aSalesInvoice.Amount - lReturAmt;
  Result.PaymentFlag  := PaymentFlag_Cash;
  Result.ReturAmount  := lReturAmt;
                 

  Result.Rekening     := TRekening.CreateID(aSalesInvoice.Rekening.ID);
  Result.Items.Clear;

  //debet cash in
  lItem               := TFinancialTransaction.Create;


  lItem.Rekening      := TRekening.CreateID(aSalesInvoice.Rekening.ID);
  lItem.DebetAmt      := Result.Amount;
  lItem.Amount        := lItem.DebetAmt;
  lItem.TransDate     := aSalesInvoice.TransDate;
  lItem.Notes         := 'Penjualan Cash No : ' + aSalesInvoice.InvoiceNo;
  lItem.TransType     := Result.PaymentFlag;
  Result.Items.Add(lItem);

  //credit piutang
  lItem               := TFinancialTransaction.Create;
  lItem.SalesInvoice  := TSalesInvoice.CreateID(aSalesInvoice.ID);
  lItem.CreditAmt     := Result.Amount;
  lItem.Amount        := lItem.CreditAmt;
  lItem.ReturAmt      := lReturAmt;
  lItem.TransDate     := aSalesInvoice.TransDate;
  lItem.Notes         := 'Penjualan Cash No : ' + aSalesInvoice.InvoiceNo;
  lItem.TransType     := Result.PaymentFlag;

  if aSalesInvoice.HasRetur then
  begin
    lItem.SalesRetur := TSalesRetur.CreateID(aSalesInvoice.SalesRetur.ID);    
  end;
  Result.Items.Add(lItem);

  Result.ModifiedBy   := UserLogin;
  Result.ModifiedDate := Now();

end;

class function TSalesPayment.CreateOrGetFromRetur(aSalesRetur: TSalesRetur):
    TSalesPayment;
var
  lItem: TFinancialTransaction;
begin
  if aSalesRetur.ReturFlag <> ReturFlag_Cancel then
  begin
    raise Exception.Create('Hanya Retur Batal yang bisa dipotong langsung');
  end;

  if aSalesRetur.Invoice = nil then
  begin
    raise Exception.Create('[TSalesPayment.CreateOrGetFromRetur] PurchaseRetur.Invoice = nil');
  end;

//  if aSalesRetur.Rekening = nil then
//    raise Exception.Create('aSalesRetur.Rekening = nil');
  Result := TSalesPayment.Create;

  //load from inv
  Result.LoadByCode(aSalesRetur.Refno);
  Result.Refno            := aSalesRetur.Refno;
  Result.TransDate        := aSalesRetur.TransDate;
  Result.DueDate          := Result.TransDate;
  Result.Amount           := 0;
  Result.PaymentFlag      := PaymentFlag_Cash;
  Result.ReturAmount      := aSalesRetur.Amount;
  Result.Items.Clear;

  //credit piutang
  lItem                   := TFinancialTransaction.Create;
  lItem.SalesInvoice      := TSalesInvoice.CreateID(aSalesRetur.Invoice.ID);
  lItem.DebetAmt          := 0;
  lItem.Amount            := 0;
  lItem.ReturAmt          := aSalesRetur.Amount;
  lItem.SalesRetur        := TSalesRetur.CreateID(aSalesRetur.ID);
  lItem.TransDate         := aSalesRetur.TransDate;
  lItem.Notes             := 'Retur Batal No : ' + aSalesRetur.Refno;
  lItem.TransType         := Result.PaymentFlag;
  Result.Items.Add(lItem);

  //debet retur penjualan : tidak perlu
end;

function TSalesPayment.GenerateNo: string;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 5;
  aPrefix := Cabang + '.SP' + FormatDateTime('yymm',Now()) + '.';


  S := 'SELECT MAX(Refno) FROM TSalesPayment where Refno LIKE ' + QuotedStr(aPrefix + '%');

  with TDBUtils.OpenQuery(S) do
  begin
    Try
      if not eof then
        TryStrToInt(RightStr(Fields[0].AsString, aDigitCount), lNum);
    Finally
      Free;
    End;
  end;

  inc(lNum);
  Result := aPrefix + RightStr('00000' + IntToStr(lNum), aDigitCount);
end;

function TSalesPayment.GetHeaderFlag: Integer;
begin
  Result := HeaderFlag_SalesPayment;
end;

function TSalesPayment.UpdateRemain(aIsRevert: Boolean = False): Boolean;
var
  lItem: TFinancialTransaction;
  iFactor: Integer;
begin
  Result := True;
  iFactor := 1;
  if aIsRevert then iFactor := -1;

  for lItem in Self.Items do
  begin
    if lItem.SalesInvoice <> nil then
    begin
      if lItem.SalesInvoice.ID <> 0 then
      begin
        lItem.SalesInvoice.ReLoad(False);
        lItem.SalesInvoice.UpdateRemain(self.TransDate, iFactor*lItem.Amount, iFactor*lItem.ReturAmt);
      end;
    end;


    if lItem.SalesRetur <> nil then
    begin
      if lItem.SalesRetur.ID <> 0 then
      begin
        lItem.SalesRetur.ReLoad(False);
        lItem.SalesRetur.UpdateRemain(iFactor*lItem.ReturAmt);
      end;
    end;
  end;
end;

destructor TPurchasePayment.Destroy;
begin
  inherited;
//  if FSupplier <> nil then FreeAndNil(FSupplier);
end;

function TPurchasePayment.AfterSaveToDB: Boolean;
begin
  Result := Self.UpdateRemain;
end;

function TPurchasePayment.BeforeDeleteFromDB: Boolean;
begin
  Result := Self.UpdateRemain(True);
end;

function TPurchasePayment.BeforeSaveToDB: Boolean;
var
  lOldPurchase: TPurchasePayment;
begin
  Result := True;
  if Self.ID = 0 then exit;

  lOldPurchase := TPurchasePayment.Create;
  Try
    lOldPurchase.LoadByID(Self.ID);
    lOldPurchase.UpdateRemain(True);
  Finally
    lOldPurchase.Free;
  End;
end;

class function TPurchasePayment.CreateOrGetFromInv(aPurchaseInv:
    TPurchaseInvoice): TPurchasePayment;
var
  lItem: TFinancialTransaction;
begin
  if aPurchaseInv.Rekening = nil then
    raise Exception.Create('aPurchaseInv.Rekening = nil');

  Result := TPurchasePayment.Create;

  //load from inv
  Result.LoadByCode(aPurchaseInv.InvoiceNo);
  Result.Refno            := aPurchaseInv.InvoiceNo;
  Result.TransDate        := aPurchaseInv.TransDate;
  Result.DueDate          := Result.TransDate;
  Result.Amount           := aPurchaseInv.Amount;
  Result.PaymentFlag      := PaymentFlag_Cash;
  Result.ReturAmount      := 0;
  Result.Rekening         := TRekening.CreateID(aPurchaseInv.Rekening.ID);

  if aPurchaseInv.Supplier <> nil then
  begin
    if Result.Supplier = nil then Result.Supplier := TSupplier.Create;
    Result.Supplier.ID    := aPurchaseInv.Supplier.ID;
  end;

  Result.Items.Clear;

  //debet hutang
  lItem                   := TFinancialTransaction.Create;
  lItem.PurchaseInvoice   := TPurchaseInvoice.CreateID(aPurchaseInv.ID);
  lItem.DebetAmt          := aPurchaseInv.Amount;
  lItem.Amount            := lItem.DebetAmt;
  lItem.TransDate         := aPurchaseInv.TransDate;
  lItem.Notes             := 'Pembelian Cash No : ' + aPurchaseInv.InvoiceNo;
  lItem.TransType         := Result.PaymentFlag;
  Result.Items.Add(lItem);

  //credit cash out
  lItem                   := TFinancialTransaction.Create;
  lItem.Rekening          := TRekening.CreateID(aPurchaseInv.Rekening.ID);
  lItem.CreditAmt         := aPurchaseInv.Amount;
  lItem.Amount            := lItem.CreditAmt;
  lItem.TransDate         := aPurchaseInv.TransDate;
  lItem.Notes             := 'Pembelian Cash No : ' + aPurchaseInv.InvoiceNo;
  lItem.TransType         := Result.PaymentFlag;
  Result.Items.Add(lItem);
  Result.ModifiedBy       := UserLogin;
  Result.ModifiedDate     := Now();
end;

class function TPurchasePayment.CreateOrGetFromRetur(aPurchaseRetur:
    TPurchaseRetur): TPurchasePayment;
var
  lItem: TFinancialTransaction;
begin
  if aPurchaseRetur.ReturFlag <> ReturFlag_Cancel then
  begin
    raise Exception.Create('Hanya Retur Batalyang bisa dipotong langsung');
  end;

  if aPurchaseRetur.Invoice = nil then
  begin
    raise Exception.Create('[TPurchasePayment.CreateOrGetFromRetur] PurchaseRetur.Invoice = nil');
  end;

//  if aPurchaseRetur.Rekening = nil then
//    raise Exception.Create('aPurchaseRetur.Rekening = nil');
  Result := TPurchasePayment.Create;

  //load from inv
  Result.LoadByCode(aPurchaseRetur.Refno);
  Result.Refno            := aPurchaseRetur.Refno;
  Result.TransDate        := aPurchaseRetur.TransDate;
  Result.DueDate          := Result.TransDate;
  Result.Amount           := 0;
  Result.PaymentFlag      := PaymentFlag_Cash;
  Result.ReturAmount      := aPurchaseRetur.Amount;

  if aPurchaseRetur.Supplier <> nil then
  begin
    if Result.Supplier = nil then Result.Supplier := TSupplier.Create;
    Result.Supplier.ID    := aPurchaseRetur.Supplier.ID;
  end;


  Result.Items.Clear;

  //debet hutang
  lItem                   := TFinancialTransaction.Create;
  lItem.PurchaseInvoice   := TPurchaseInvoice.CreateID(aPurchaseRetur.Invoice.ID);
  lItem.DebetAmt          := 0;
  lItem.Amount            := 0;
  lItem.ReturAmt          := aPurchaseRetur.Amount;
  lItem.PurchaseRetur     := TPurchaseRetur.CreateID(aPurchaseRetur.ID);
  lItem.TransDate         := aPurchaseRetur.TransDate;
  lItem.Notes             := 'Retur Batal No : ' + aPurchaseRetur.Refno;
  lItem.TransType         := Result.PaymentFlag;
  Result.Items.Add(lItem);

  //credit retur penjualan : tidak perlu
end;

function TPurchasePayment.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 5;
  aPrefix := Cabang + '.PP' + FormatDateTime('yymm',Now()) + '.';


  S := 'SELECT MAX(Refno) FROM TPurchasePayment where Refno LIKE ' + QuotedStr(aPrefix + '%');

  with TDBUtils.OpenQuery(S) do
  begin
    Try
      if not eof then
        TryStrToInt(RightStr(Fields[0].AsString, aDigitCount), lNum);
    Finally
      Free;
    End;
  end;

  inc(lNum);
  Result := aPrefix + RightStr('00000' + IntToStr(lNum), aDigitCount);
end;

function TPurchasePayment.GetHeaderFlag: Integer;
begin
  Result := HeaderFlag_PurchasePayment;
end;

function TPurchasePayment.UpdateRemain(aIsRevert: Boolean = False): Boolean;
var
  lItem: TFinancialTransaction;
  iFactor: Integer;
begin
  Result := True;
  iFactor := 1;
  if aIsRevert then iFactor := -1;

  for lItem in Self.Items do
  begin
    if lItem.PurchaseInvoice <> nil then
    begin
      if lItem.PurchaseInvoice.ID <> 0 then
      begin
        lItem.PurchaseInvoice.ReLoad(False);
        lItem.PurchaseInvoice.UpdateRemain(self.TransDate, iFactor*lItem.Amount, iFactor*lItem.ReturAmt);
      end;
    end;


    if lItem.PurchaseRetur <> nil then
    begin
      if lItem.PurchaseRetur.ID <> 0 then
      begin
        lItem.PurchaseRetur.ReLoad(False);
        lItem.PurchaseRetur.UpdateRemain(iFactor*lItem.ReturAmt);
      end;
    end;
  end;
end;



end.
