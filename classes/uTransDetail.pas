unit uTransDetail;

interface

uses
  CRUDObject, uDBUtils, Sysutils, uItem, System.Generics.Collections,
  uWarehouse, uSupplier;

type
  TTransDetail = class;

  TCRUDTransDetail = class(TCRUDObject)
  private
    FItems: TObjectList<TTransDetail>;
    FTransDate: TDateTime;
    FClosed: Integer;
    function GetItems: TObjectList<TTransDetail>;
  protected
    function BeforeSaveObjectList: Boolean; override;
    function GetRefno: String; dynamic;
  public
    destructor Destroy; override;
    function GetHeaderFlag: Integer; virtual; abstract;
    property Items: TObjectList<TTransDetail> read GetItems write FItems;
  published
    property TransDate: TDateTime read FTransDate write FTransDate;
    property Closed: Integer read FClosed write FClosed;
  end;

  TTransDetail = class(TCRUDObject)
  private
    FHeader_Flag: Integer;
    FHeader_ID: Integer;
    FTransDate: Integer;
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
  published
    property Header_Flag: Integer read FHeader_Flag write FHeader_Flag;
    property Header_ID: Integer read FHeader_ID write FHeader_ID;
    property TransDate: Integer read FTransDate write FTransDate;
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

  TPurchaseInvoice = class(TCRUDTransDetail)
  private
    FSubTotal: Double;
    FPPN: Double;
    FSupplier: TSupplier;
    FInvoiceNo: string;
    FDueDate: TDateTime;
    FAmount: Double;
    FNotes: string;
    FPaidAmount: Double;
    FPaymentFlag: Integer;
    FReturAmount: Double;
    FStatus: Integer;
    FWarehouse: TWarehouse;
  protected
    function AfterSaveToDB: Boolean; override;
    function GetRefno: String; override;
  public
    destructor Destroy; override;
    function GenerateNo: String;
    function GetHeaderFlag: Integer; override;
  published
    property SubTotal: Double read FSubTotal write FSubTotal;
    property PPN: Double read FPPN write FPPN;
    property Supplier: TSupplier read FSupplier write FSupplier;
    property InvoiceNo: string read FInvoiceNo write FInvoiceNo;
    property DueDate: TDateTime read FDueDate write FDueDate;
    property Amount: Double read FAmount write FAmount;
    property Notes: string read FNotes write FNotes;
    property PaidAmount: Double read FPaidAmount write FPaidAmount;
    property PaymentFlag: Integer read FPaymentFlag write FPaymentFlag;
    property ReturAmount: Double read FReturAmount write FReturAmount;
    property Status: Integer read FStatus write FStatus;
    property Warehouse: TWarehouse read FWarehouse write FWarehouse;
  end;

implementation

uses
  System.StrUtils;

destructor TCRUDTransDetail.Destroy;
begin
  inherited;
  if FItems <> nil then FItems.Free;
end;

function TCRUDTransDetail.BeforeSaveObjectList: Boolean;
var
  lItem: TTransDetail;
begin
  //transform ttransdetail
  for lItem in Items do
  begin
    lItem.Header_ID := Self.ID;
    lItem.Header_Flag := Self.GetHeaderFlag;
    lItem.Refno := Self.GetRefno;
  end;
  Result := True;
end;

function TCRUDTransDetail.GetItems: TObjectList<TTransDetail>;
begin
  if FItems = nil then
  begin
    FItems := TObjectList<TTransDetail>.Create();
  end;
  Result := FItems;
end;

function TCRUDTransDetail.GetRefno: String;
begin
  Result := '';
end;

destructor TPurchaseInvoice.Destroy;
begin
  inherited;
  if FSupplier <> nil then FreeAndNil(FSupplier);
end;

function TPurchaseInvoice.AfterSaveToDB: Boolean;
begin
  Result := True;
end;

function TPurchaseInvoice.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 4;
  aPrefix := Cabang + '.' + FormatDateTime('yymmdd',Now()) + '.';


  S := 'SELECT MAX(InvoiceNo) FROM TPurchaseInvoice where InvoiceNo LIKE ' + QuotedStr(aPrefix + '%');

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

function TPurchaseInvoice.GetHeaderFlag: Integer;
begin
  Result := 100;
end;

function TPurchaseInvoice.GetRefno: String;
begin
  Result := InvoiceNO;
end;

destructor TTransDetail.Destroy;
begin
  inherited;
  if FItem <> nil then FreeAndNil(FItem);
  if FUOM <> nil then FreeAndNil(FUOM);
  if FWarehouse <> nil then FreeAndNil(FWarehouse);
end;

function TTransDetail.GetSQLDeleteDetails(Header_ID: Integer): String;
var
  sFilter : String;
begin
//  if UpperCase(Self.GetTableName) = 'TTRANSDETAIL' then
//    Raise Exception.Create('Must override GetSQLDeleteDetails for TTRANSDETAIL');

  sFilter := 'Header_flag = ' + IntToStr(Header_Flag)
    +'AND Header_ID = ' + IntToStr(Header_ID);

  Result  := Format(SQL_Delete,[Self.GetTableName,sFilter]);
end;

function TTransDetail.GetSQLRetrieveDetails(Header_ID: Integer): String;
var
//  lPO: TCRUDPOItem;
  sFilter : String;
begin
//  if UpperCase(Self.GetTableName) = 'TTRANSDETAIL' then
//    Raise Exception.Create('Must override GetSQLRetrieveDetails for TTRANSDETAIL');

  sFilter := 'Header_flag = ' + IntToStr(Header_Flag)
    +'and Header_ID = ' + IntToStr(Header_ID);
  Result  := Format(SQL_Select,['*', Self.GetTableName,sFilter]);
//
//  lPO := TCRUDPOItem.Create;
//  Result := Result + lPO.GetHeaderField;
end;

end.
