unit uTransDetail;

interface

uses
  CRUDObject, uDBUtils, Sysutils, uItem, System.Generics.Collections,
  uWarehouse, uSupplier;

type
  TTransDetail = class;
  TPurchaseInvoice = class;
  TAvgCostUpdate = class;

  TCRUDTransDetail = class(TCRUDObject)
  private
    FItems: TObjectList<TTransDetail>;
    FTransDate: TDateTime;
    FClosed: Integer;
    FModifiedBy: String;
    FModifiedDate: TDateTime;
    function GetItems: TObjectList<TTransDetail>;
  protected
    function GetRefno: String; dynamic;
    procedure PrepareDetailObject(AObjItem: TCRUDObject); override;
  public
    destructor Destroy; override;
    function GetHeaderFlag: Integer; virtual; abstract;
    property Items: TObjectList<TTransDetail> read GetItems write FItems;
  published
    property TransDate: TDateTime read FTransDate write FTransDate;
    property Closed: Integer read FClosed write FClosed;
    property ModifiedBy: String read FModifiedBy write FModifiedBy;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
  end;

  TTransDetail = class(TCRUDObject)
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

  TPurchaseInvoice = class(TCRUDTransDetail)
  private
    FSubTotal: Double;
    FPPN: Double;
    FSupplier: TSupplier;
    FInvoiceNo: string;
    FDueDate: TDateTime;
    FAmount: Double;
    FAvgCostItems: TObjectList<TAvgCostUpdate>;
    FNotes: string;
    FPaidAmount: Double;
    FPaymentFlag: Integer;
    FReturAmount: Double;
    FStatus: Integer;
    FWarehouse: TWarehouse;
    procedure GenerateAvgCost;
    function GetAvgCostItems: TObjectList<TAvgCostUpdate>;
    function GetOrAddAvgCost(aDetail: TTransDetail): TAvgCostUpdate;
  protected
    function AfterSaveToDB: Boolean; override;
    function BeforeDeleteFromDB: Boolean; override;
    function BeforeSaveToDB: Boolean; override;
    function GetRefno: String; override;
  public
    destructor Destroy; override;
    function GenerateNo: String;
    function GetHeaderFlag: Integer; override;
    property AvgCostItems: TObjectList<TAvgCostUpdate> read GetAvgCostItems write
        FAvgCostItems;
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

  TPurchaseRetur = class(TCRUDTransDetail)
  private
    FSubTotal: Double;
    FPPN: Double;
    FSupplier: TSupplier;
    FRefno: string;
    FAmount: Double;
    FNotes: string;
    FReturFlag: Integer;
    FReturAmount: Double;
    FStatus: Integer;
    FInvoice: TPurchaseInvoice;
    FWarehouse: TWarehouse;
    function UpdateReturAmt(IsRevert: Boolean = False): Boolean;
  protected
    function AfterSaveToDB: Boolean; override;
    function BeforeSaveToDB: Boolean; override;
    function GetRefno: String; override;
  public
    destructor Destroy; override;
    function GenerateNo: String;
    function GetHeaderFlag: Integer; override;
  published
    property SubTotal: Double read FSubTotal write FSubTotal;
    property PPN: Double read FPPN write FPPN;
    property Supplier: TSupplier read FSupplier write FSupplier;
    property Refno: string read FRefno write FRefno;
    property Amount: Double read FAmount write FAmount;
    property Notes: string read FNotes write FNotes;
    property ReturFlag: Integer read FReturFlag write FReturFlag;
    property ReturAmount: Double read FReturAmount write FReturAmount;
    property Status: Integer read FStatus write FStatus;
    property Invoice: TPurchaseInvoice read FInvoice write FInvoice;
    property Warehouse: TWarehouse read FWarehouse write FWarehouse;
  end;

  TAvgCostUpdate = class(TCRUDObject)
  private
    FHeader_Flag: Integer;
    FHeader_ID: Integer;
    FItem: TItem;
    FLastStockPCS: Double;
    FLastAvgCost: Double;
    FTransTotalPCS: Double;
    FTransDate: TDateTime;
    FNewAvgCost: Double;
    FRefno: string;
    FTransTotalValue: Double;
    FTransPricePcs: Double;
    procedure CalcNewAvg;
  protected
    function BeforeSaveToDB: Boolean; override;
    function GetSQLDeleteDetails(Header_ID: Integer): String; override;
    function GetSQLRetrieveDetails(Header_ID: Integer): String; override;
  public
    destructor Destroy; override;
    function GetTransPrice: Double;
    procedure UpdateAvgCost;
    procedure RevertAvgCost;
  published
    property Header_Flag: Integer read FHeader_Flag write FHeader_Flag;
    [AttributeOfHeader]
    property Header_ID: Integer read FHeader_ID write FHeader_ID;
    property Item: TItem read FItem write FItem;
    property LastStockPCS: Double read FLastStockPCS write FLastStockPCS;
    property LastAvgCost: Double read FLastAvgCost write FLastAvgCost;
    property TransTotalPCS: Double read FTransTotalPCS write FTransTotalPCS;
    property TransDate: TDateTime read FTransDate write FTransDate;
    property NewAvgCost: Double read FNewAvgCost write FNewAvgCost;
    property Refno: string read FRefno write FRefno;
    property TransTotalValue: Double read FTransTotalValue write FTransTotalValue;
    property TransPricePcs: Double read FTransPricePcs write FTransPricePcs;
  end;

implementation

uses
  System.StrUtils;

destructor TCRUDTransDetail.Destroy;
begin
  inherited;
  if FItems <> nil then FItems.Free;
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

procedure TCRUDTransDetail.PrepareDetailObject(AObjItem: TCRUDObject);
begin
  if AObjItem is TTransDetail then
  begin
    TTransDetail(AObjItem).Header_Flag := GetHeaderFlag;
    TTransDetail(AObjItem).TransDate := TransDate;
    TTransDetail(AObjItem).Refno := GetRefno;
  end;

  if AObjItem is TAvgCostUpdate then
  begin
    TAvgCostUpdate(AObjItem).Header_Flag  := GetHeaderFlag;
  end;
end;

destructor TPurchaseInvoice.Destroy;
begin
  inherited;
  if FSupplier <> nil then FreeAndNil(FSupplier);
end;

function TPurchaseInvoice.AfterSaveToDB: Boolean;
begin
  //update avg
  
  
  Result := True;
end;

function TPurchaseInvoice.BeforeDeleteFromDB: Boolean;
var
  lAvg: TAvgCostUpdate;
begin
  for lAvg in Self.AvgCostItems do
  begin
    lAvg.RevertAvgCost;
  end;

  Result := True;
end;

function TPurchaseInvoice.BeforeSaveToDB: Boolean;
begin
  GenerateAvgCost;
  Result := True;
end;

procedure TPurchaseInvoice.GenerateAvgCost;
var
  i: Integer;
  lAvg: TAvgCostUpdate;
  lFound: Boolean;
  lItem: TTransDetail;
begin
  //AvgCostItems.Clear;
  //delete avgcostitems where item doesnt exist in transdetail
  for i := Self.AvgCostItems.Count-1 downto 0 do
  begin
    lAvg := Self.AvgCostItems[i];

    lFound := False;
    for lItem in Self.Items do
    begin
      lFound := lAvg.Item.ID = lItem.Item.ID;
      if lFound then break;
    end;

    if not lFound then
      Self.AvgCostItems.Delete(i);
  end;

  //clear transaksi
  for lAvg in Self.AvgCostItems do
  begin
    lAvg.TransTotalPCS    := 0;
    lAvg.TransTotalValue  := 0;
//    lAvg.TransDate        := Now();
  end;

  //create if not exit;
  for lItem in Self.Items do
  begin
    GetOrAddAvgCost(lItem);

    lItem.HargaAvg := lItem.Harga;
  end;
end;

function TPurchaseInvoice.GetAvgCostItems: TObjectList<TAvgCostUpdate>;
begin
  if FAvgCostItems = nil then
  begin
    FAvgCostItems := TObjectList<TAvgCostUpdate>.Create();
  end;
  Result := FAvgCostItems;
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
  aPrefix := Cabang + '.FB.' + FormatDateTime('yymmdd',Now()) + '.';


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

function TPurchaseInvoice.GetOrAddAvgCost(aDetail: TTransDetail):
    TAvgCostUpdate;
var
  lAvg: TAvgCostUpdate;
  S: string;
begin
  Result := nil;
  for lAvg in Self.AvgCostItems do
  begin
    if lAvg.Item.ID = aDetail.Item.ID then
    begin
      Result := lAvg;
      break;
    end;
  end;

  if Result = nil then
  begin
    Result                    := TAvgCostUpdate.Create;
    Result.Item               := TItem.CreateID(aDetail.Item.ID);
    Result.Item.ReLoad(True);

    if Result.Item.GetAvgCostPCS = (aDetail.Harga * aDetail.Konversi) then
      exit;  //no need save this
    
    
    Result.LastStockPCS       := 0;
    Result.LastAvgCost        := 0;

    //getstock here
    S := 'select sum(qtypcs) from FN_STOCK_BYITEM(' + IntToStr(aDetail.Item.ID) + ', getdate())';
    with TDBUtils.OpenQuery(S) do
    begin
      Try
        if not eof then
        begin
          Result.LastStockPCS := Fields[0].AsFloat;
          Result.LastAvgCost  := Result.Item.GetAvgCostPCS;
        end;
      Finally
        Free;
      End;
    end;
    Self.AvgCostItems.Add(Result);
  end;

  Result.Refno            := Self.InvoiceNo;
  Result.TransDate        := Now();  
  Result.TransTotalPCS    := Result.TransTotalPCS + (aDetail.Qty * aDetail.Konversi);
  Result.TransTotalValue  := Result.TransTotalValue + (aDetail.Qty * aDetail.Harga);

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
    +' AND Header_ID = ' + IntToStr(Header_ID);

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
    +' And Header_ID = ' + IntToStr(Header_ID);
  Result  := Format(SQL_Select,['*', Self.GetTableName,sFilter]);
//
//  lPO := TCRUDPOItem.Create;
//  Result := Result + lPO.GetHeaderField;
end;

destructor TPurchaseRetur.Destroy;
begin
  inherited;
  if FSupplier <> nil then FreeAndNil(FSupplier);
  if FInvoice <> nil then FreeAndNil(FInvoice);
end;

function TPurchaseRetur.AfterSaveToDB: Boolean;
begin
  Result := UpdateReturAmt(False);
end;

function TPurchaseRetur.BeforeSaveToDB: Boolean;
var
  oldRetur: TPurchaseRetur;
begin
  if Self.ID = 0 then
  begin
    Result := True;
    exit;
  end;

  oldRetur := TPurchaseRetur.Create;
  Try
    oldRetur.LoadByID(Self.ID);
    Result := oldRetur.UpdateReturAmt(True);
  Finally
    oldRetur.Free;
  End;

end;

function TPurchaseRetur.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 4;
  aPrefix := Cabang + '.RB.' + FormatDateTime('yymmdd',Now()) + '.';


  S := 'SELECT MAX(Refno) FROM TPurchaseRetur where Refno LIKE ' + QuotedStr(aPrefix + '%');

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

function TPurchaseRetur.GetHeaderFlag: Integer;
begin
  Result := 100;
end;

function TPurchaseRetur.GetRefno: String;
begin
  Result := Refno;
end;

function TPurchaseRetur.UpdateReturAmt(IsRevert: Boolean = False): Boolean;
var
  S: string;
  sOperation: string;
begin
  sOperation := '+';
  if IsRevert then
    sOperation := '-';

  S := 'Update TPurchaseInvoice set ReturAmount = ReturAmount '
    + sOperation + FloatToStr(Self.Amount)
    + 'where ID = ' + IntToStr(Self.Invoice.ID);

  Result := TDBUtils.ExecuteSQL(S, False);
end;

destructor TAvgCostUpdate.Destroy;
begin
  inherited;
  if FItem <> nil then FreeAndNil(Fitem);
end;

function TAvgCostUpdate.BeforeSaveToDB: Boolean;
begin
  TransPricePcs := 0;
  if TransPricePcs <> 0 then
    TransPricePcs := TransTotalValue / TransTotalPCS;

  UpdateAvgCost;
  Result := True;     
end;



procedure TAvgCostUpdate.CalcNewAvg;
var
  lAllQty: Double;
  lAllValue: Double;
  lUOM: TItemUOM;
begin
  //set LastAvgCost;
  // Item.ReLoad(True);
  if Self.LastAvgCost = 0 then  //jika baru
  begin
    for lUOM in Item.ItemUOMs do
    begin
      if lUOM.Konversi = 0 then
        raise Exception.Create('lUOM.Konversi = 0');
      Self.LastAvgCost := lUOM.HargaAvg / lUOM.Konversi;
      break;
    end;
  end;

  //new one
  lAllValue   := (LastStockPCS * LastAvgCost) + (TransTotalValue);
  lAllQty     := LastStockPCS + TransTotalPCS;

  //def
  Self.NewAvgCost := 0; 
  
  if lAllQty > 0 then  
    Self.NewAvgCost :=  lAllValue / lAllQty;

  if Self.NewAvgCost <= 0 then
    Self.NewAvgCost := GetTransPrice;
end;

function TAvgCostUpdate.GetSQLDeleteDetails(Header_ID: Integer): String;
var
  sFilter : String;
begin
//  if UpperCase(Self.GetTableName) = 'TAvgCostUpdate' then
//    Raise Exception.Create('Must override GetSQLDeleteDetails for TAvgCostUpdate');

  sFilter := 'Header_flag = ' + IntToStr(Header_Flag)
    +' AND Header_ID = ' + IntToStr(Header_ID);

  Result  := Format(SQL_Delete,[Self.GetTableName,sFilter]);
end;

function TAvgCostUpdate.GetSQLRetrieveDetails(Header_ID: Integer): String;
var
//  lPO: TCRUDPOItem;
  sFilter : String;
begin
//  if UpperCase(Self.GetTableName) = 'TAvgCostUpdate' then
//    Raise Exception.Create('Must override GetSQLRetrieveDetails for TAvgCostUpdate');

  sFilter := 'Header_flag = ' + IntToStr(Header_Flag)
    +' And Header_ID = ' + IntToStr(Header_ID);
  Result  := Format(SQL_Select,['*', Self.GetTableName,sFilter]);
//
//  lPO := TCRUDPOItem.Create;
//  Result := Result + lPO.GetHeaderField;
end;

function TAvgCostUpdate.GetTransPrice: Double;
begin
  if TransTotalPCS = 0 then
    raise Exception.Create('TransTotalPCS = 0');
  Result := TransTotalValue / TransTotalPCS;
end;

procedure TAvgCostUpdate.UpdateAvgCost;
var
  lUOM: TItemUOM;
begin
  if Item.ItemUOMs.Count = 0 then  
    Item.ReLoad(True);
    
  CalcNewAvg;

  //uom
  for lUOM in Item.ItemUOMs do
  begin
    if lUOM.Konversi = 0 then
      raise Exception.Create('lUOM.Konversi = 0');
    lUOM.UpdateHargaAvg(Self.NewAvgCost * lUOM.Konversi);
  end;

end;

procedure TAvgCostUpdate.RevertAvgCost;
var
  lUOM: TItemUOM;
begin
  if Item.ItemUOMs.Count = 0 then  
    Item.ReLoad(True);
    
  for lUOM in Item.ItemUOMs do
  begin
    if lUOM.Konversi = 0 then
      raise Exception.Create('lUOM.Konversi = 0');
    lUOM.UpdateHargaAvg(Self.LastAvgCost * lUOM.Konversi);
  end;

end;

end.
