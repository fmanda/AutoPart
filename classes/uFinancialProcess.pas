unit uFinancialProcess;

interface

uses
  CRUDObject, uDBUtils, Sysutils, uItem, System.Generics.Collections,
  uWarehouse, uSupplier, uCustomer, uSalesman;

type
  TFinancialTransaction = class;
  TFinancialProcess = class;
  TAvgCostUpdate = class;

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
    FHeader_Flag: Integer;
    FHeader_ID: Integer;
    FTransDate: TDateTime;
    FKonversi: Double;
    FQty: Double;
    FItem: TItem;
    FHarga: Double;
    FDiscount: Double;
    FTotal: Double;
    FPPN: Double;
    FHargaAvg: Double;
    FWarehouse: TWarehouse;
    FUOM: TUOM;
    FRefno: string;
    FTransType: Integer;
    FTransDef: string;
  protected
    function GetSQLDeleteDetails(Header_ID: Integer): String; override;
    function GetSQLRetrieveDetails(Header_ID: Integer): String; override;
  public
    destructor Destroy; override;
    procedure MakePositive;
    procedure MakeNegative;
    procedure SetAvgCost;
  published
    property Header_Flag: Integer read FHeader_Flag write FHeader_Flag;
    [AttributeOfHeader]
    property Header_ID: Integer read FHeader_ID write FHeader_ID;
    property TransDate: TDateTime read FTransDate write FTransDate;
    property Konversi: Double read FKonversi write FKonversi;
    property Qty: Double read FQty write FQty;
    property Item: TItem read FItem write FItem;
    property Harga: Double read FHarga write FHarga;
    property Discount: Double read FDiscount write FDiscount;
    property Total: Double read FTotal write FTotal;
    property PPN: Double read FPPN write FPPN;
    property HargaAvg: Double read FHargaAvg write FHargaAvg;
    property Warehouse: TWarehouse read FWarehouse write FWarehouse;
    property UOM: TUOM read FUOM write FUOM;
    property Refno: string read FRefno write FRefno;
    property TransType: Integer read FTransType write FTransType;
    property TransDef: string read FTransDef write FTransDef;
  end;

  TFinancialProcess = class(TCRUDFinance)
  private
    FDueDate: TDateTime;
    FAmount: Double;
    FRefno: string;
    FNotes: string;
  protected
    function GetRefno: String; override;
    class function GetTableName: string; override;
  public
    destructor Destroy; override;
    function GenerateNo: String; dynamic;
    function GetHeaderFlag: Integer; override;
  published
    property DueDate: TDateTime read FDueDate write FDueDate;
    property Amount: Double read FAmount write FAmount;
    property Refno: string read FRefno write FRefno;
    property Notes: string read FNotes write FNotes;
  end;

  TInternalTransfer = class(TFinancialProcess)
  end;

  TBankCashIn = class(TFinancialProcess)
  end;

  TBankCashOut = class(TFinancialProcess)
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

destructor TFinancialProcess.Destroy;
begin
  inherited;
//  if FSupplier <> nil then FreeAndNil(FSupplier);
end;

function TFinancialProcess.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 4;
  aPrefix := Cabang + '.TR.' + FormatDateTime('yymmdd',Now()) + '.';


  S := 'SELECT MAX(InvoiceNo) FROM TFinancialProcess where Refno LIKE ' + QuotedStr(aPrefix + '%');

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

function TFinancialProcess.GetHeaderFlag: Integer;
begin
  Result := 0; //HeaderFlag_PurchaseInvoice;
end;

function TFinancialProcess.GetRefno: String;
begin
  Result := Refno;
end;

class function TFinancialProcess.GetTableName: string;
begin
  Result := Self.ClassName;
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
  Self.Qty := Abs(Self.Qty);
  Self.Total := Abs(Self.Total);
  Self.PPN := Abs(Self.Total);
end;

procedure TFinancialTransaction.MakeNegative;
begin
  Self.Qty := Abs(Self.Qty) * -1;
  Self.Total := Abs(Self.Total) * -1;
  Self.PPN := Abs(Self.Total) * -1;
end;

procedure TFinancialTransaction.SetAvgCost;
var
  lItemUOM: TItemUOM;
begin
  lItemUOM := TItemUOM.GetItemUOM(Self.Item.ID, Self.UOM.ID);
  Try
    Self.HargaAvg := lItemUOM.HargaAvg;
  Finally
    lItemUOM.Free;
  End;
end;



end.
