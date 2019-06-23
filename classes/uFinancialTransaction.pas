unit uFinancialTransaction;

interface

uses
  CRUDObject, uDBUtils, Sysutils, uItem, System.Generics.Collections,
  uWarehouse, uSupplier, uCustomer, uSalesman, uAccount;

type
  TFinancialTransaction = class;

  TCRUDFinance = class(TCRUDObject)
  private
    FItems: TObjectList<TFinancialTransaction>;
    FTransDate: TDateTime;
    FClosed: Integer;
    FModifiedBy: String;
    FModifiedDate: TDateTime;
    function GetItems: TObjectList<TFinancialTransaction>;
  protected
    function GetRefno: String; dynamic;
    procedure PrepareDetailObject(AObjItem: TCRUDObject); override;
  public
    destructor Destroy; override;
    function GetHeaderFlag: Integer; virtual; abstract;
    property Items: TObjectList<TFinancialTransaction> read GetItems write FItems;
  published
    property TransDate: TDateTime read FTransDate write FTransDate;
    property Closed: Integer read FClosed write FClosed;
    property ModifiedBy: String read FModifiedBy write FModifiedBy;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
  end;

  TFinancialTransaction = class(TCRUDObject)
  private
    FAmount: Double;
    FReturAmt: Double;
    FInvoice_ID: Integer;
    FNotes: string;
    FHeader_ID: Integer;
    FHeader_Flag: Integer;
    FRetur_ID: Integer;
    FRekening: TRekening;
    FAccount: TAccount;
    FTransFlag: Integer;
  protected
    function GetSQLDeleteDetails(Header_ID: Integer): String; override;
    function GetSQLRetrieveDetails(Header_ID: Integer): String; override;
  public
    destructor Destroy; override;
    procedure MakePositive;
    procedure MakeNegative;
  published
    property Amount: Double read FAmount write FAmount;
    property ReturAmt: Double read FReturAmt write FReturAmt;
    property Invoice_ID: Integer read FInvoice_ID write FInvoice_ID;
    property Notes: string read FNotes write FNotes;
    [AttributeOfHeader]
    property Header_ID: Integer read FHeader_ID write FHeader_ID;
    property Header_Flag: Integer read FHeader_Flag write FHeader_Flag;
    property Retur_ID: Integer read FRetur_ID write FRetur_ID;
    property Rekening: TRekening read FRekening write FRekening;
    property Account: TAccount read FAccount write FAccount;
    property TransFlag: Integer read FTransFlag write FTransFlag;
  end;

  TCashTransfer = class(TCRUDFinance)
  private
    FAmount: Double;
    FDueDate: TDateTime;
    FNotes: string;
    FRefno: string;
  protected
    function GetRefno: String; override;
    class function GetTableName: string; override;
  public
    destructor Destroy; override;
    function GenerateNo: String; override;
    function GetHeaderFlag: Integer; override;
  published
    property Amount: Double read FAmount write FAmount;
    property DueDate: TDateTime read FDueDate write FDueDate;
    property Notes: string read FNotes write FNotes;
    property Refno: string read FRefno write FRefno;
  end;

  TCashReceipt = class(TCRUDFinance)
  private
    FAmount: Double;
    FDueDate: TDateTime;
    FNotes: string;
    FRefno: string;
  protected
    function GetRefno: String; override;
    class function GetTableName: string; override;
  public
    destructor Destroy; override;
    function GenerateNo: String; override;
    function GetHeaderFlag: Integer; override;
  published
    property Amount: Double read FAmount write FAmount;
    property DueDate: TDateTime read FDueDate write FDueDate;
    property Notes: string read FNotes write FNotes;
    property Refno: string read FRefno write FRefno;
  end;

  TCashPayment = class(TCRUDFinance)
  private
    FAmount: Double;
    FDueDate: TDateTime;
    FNotes: string;
    FRefno: string;
  protected
    function GetRefno: String; override;
    class function GetTableName: string; override;
  public
    destructor Destroy; override;
    function GenerateNo: String; dynamic;
    function GetHeaderFlag: Integer; override;
  published
    property Amount: Double read FAmount write FAmount;
    property DueDate: TDateTime read FDueDate write FDueDate;
    property Notes: string read FNotes write FNotes;
    property Refno: string read FRefno write FRefno;
  end;

type
  TSalesPayment = class(TCRUDFinance)
  private
    FAmount: Double;
    FDueDate: TDateTime;
    FNotes: string;
    FRefno: string;
  protected
    function GetRefno: String; override;
    class function GetTableName: string; override;
  public
    destructor Destroy; override;
    function GenerateNo: String; override;
    function GetHeaderFlag: Integer; override;
  published
    property Amount: Double read FAmount write FAmount;
    property DueDate: TDateTime read FDueDate write FDueDate;
    property Notes: string read FNotes write FNotes;
    property Refno: string read FRefno write FRefno;
  end;

type
  TPurchasePayment = class(TCRUDFinance)
  private
    FAmount: Double;
    FDueDate: TDateTime;
    FNotes: string;
    FRefno: string;
  protected
    function GetRefno: String; override;
    class function GetTableName: string; override;
  public
    destructor Destroy; override;
    function GenerateNo: String; override;
    function GetHeaderFlag: Integer; override;
  published
    property Amount: Double read FAmount write FAmount;
    property DueDate: TDateTime read FDueDate write FDueDate;
    property Notes: string read FNotes write FNotes;
    property Refno: string read FRefno write FRefno;
  end;

//const
//  HeaderFlag_PurchaseInvoice : Integer = 100;
//  HeaderFlag_PurchaseRetur : Integer = 150;
//  HeaderFlag_SalesInvoice : Integer = 200;
//  HeaderFlag_SalesRetur : Integer = 250;
//  HeaderFlag_TransferStock : Integer = 400;
//  HeaderFlag_Wastage : Integer = 450;
//  HeaderFlag_StockAdjustment : Integer = 500;
//  Status_PurchaseInv_Created : Integer = 0;
//  Status_PurchaseInv_Paid : Integer = 1;
//  Status_PurchaseInv_Cancel : Integer = 2;

implementation

uses
  System.StrUtils;

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
  Result := '';
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

destructor TFinancialTransaction.Destroy;
begin
  inherited;
  if FItem <> nil then FreeAndNil(FItem);
  if FUOM <> nil then FreeAndNil(FUOM);
  if FWarehouse <> nil then FreeAndNil(FWarehouse);
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

procedure TFinancialTransaction.MakePositive;
begin
//  Self.Qty := Abs(Self.Qty);
//  Self.Total := Abs(Self.Total);
//  Self.PPN := Abs(Self.Total);
end;

procedure TFinancialTransaction.MakeNegative;
begin
//  Self.Qty := Abs(Self.Qty) * -1;
//  Self.Total := Abs(Self.Total) * -1;
//  Self.PPN := Abs(Self.Total) * -1;
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
  aDigitCount := 4;
  aPrefix := Cabang + '.TR.' + FormatDateTime('yymmdd',Now()) + '.';


  S := 'SELECT MAX(InvoiceNo) FROM TCashPayment where Refno LIKE ' + QuotedStr(aPrefix + '%');

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
  Result := aPrefix + RightStr('0000' + IntToStr(lNum), aDigitCount);
end;

function TCashPayment.GetHeaderFlag: Integer;
begin
  Result := 0; //HeaderFlag_PurchaseInvoice;
end;

function TCashPayment.GetRefno: String;
begin
  Result := Refno;
end;

class function TCashPayment.GetTableName: string;
begin
  Result := Self.ClassName;
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
  aDigitCount := 4;
  aPrefix := Cabang + '.TR.' + FormatDateTime('yymmdd',Now()) + '.';


  S := 'SELECT MAX(InvoiceNo) FROM TCashReceipt where Refno LIKE ' + QuotedStr(aPrefix + '%');

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
  Result := aPrefix + RightStr('0000' + IntToStr(lNum), aDigitCount);
end;

function TCashReceipt.GetHeaderFlag: Integer;
begin
  Result := 0; //HeaderFlag_PurchaseInvoice;
end;

function TCashReceipt.GetRefno: String;
begin
  Result := Refno;
end;

class function TCashReceipt.GetTableName: string;
begin
  Result := Self.ClassName;
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
  aDigitCount := 4;
  aPrefix := Cabang + '.TR.' + FormatDateTime('yymmdd',Now()) + '.';


  S := 'SELECT MAX(InvoiceNo) FROM TCashTransfer where Refno LIKE ' + QuotedStr(aPrefix + '%');

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
  Result := aPrefix + RightStr('0000' + IntToStr(lNum), aDigitCount);
end;

function TCashTransfer.GetHeaderFlag: Integer;
begin
  Result := 0; //HeaderFlag_PurchaseInvoice;
end;

function TCashTransfer.GetRefno: String;
begin
  Result := Refno;
end;

class function TCashTransfer.GetTableName: string;
begin
  Result := Self.ClassName;
end;

destructor TSalesPayment.Destroy;
begin
  inherited;
//  if FSupplier <> nil then FreeAndNil(FSupplier);
end;

function TSalesPayment.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 4;
  aPrefix := Cabang + '.TR.' + FormatDateTime('yymmdd',Now()) + '.';


  S := 'SELECT MAX(InvoiceNo) FROM TSalesPayment where Refno LIKE ' + QuotedStr(aPrefix + '%');

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
  Result := aPrefix + RightStr('0000' + IntToStr(lNum), aDigitCount);
end;

function TSalesPayment.GetHeaderFlag: Integer;
begin
  Result := 0; //HeaderFlag_PurchaseInvoice;
end;

function TSalesPayment.GetRefno: String;
begin
  Result := Refno;
end;

class function TSalesPayment.GetTableName: string;
begin
  Result := Self.ClassName;
end;

destructor TPurchasePayment.Destroy;
begin
  inherited;
//  if FSupplier <> nil then FreeAndNil(FSupplier);
end;

function TPurchasePayment.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 4;
  aPrefix := Cabang + '.TR.' + FormatDateTime('yymmdd',Now()) + '.';


  S := 'SELECT MAX(InvoiceNo) FROM TPurchasePayment where Refno LIKE ' + QuotedStr(aPrefix + '%');

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
  Result := aPrefix + RightStr('0000' + IntToStr(lNum), aDigitCount);
end;

function TPurchasePayment.GetHeaderFlag: Integer;
begin
  Result := 0; //HeaderFlag_PurchaseInvoice;
end;

function TPurchasePayment.GetRefno: String;
begin
  Result := Refno;
end;

class function TPurchasePayment.GetTableName: string;
begin
  Result := Self.ClassName;
end;



end.
