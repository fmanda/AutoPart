unit uTransDetail;

interface

uses
  CRUDObject, uDBUtils, Sysutils, uItem, System.Generics.Collections,
  uWarehouse, uSupplier, uCustomer, uSalesman, uAccount, uMekanik, uSalesFee,
  uSettingFee;

type
  TTransDetail = class;
  TPurchaseInvoice = class;
  TAvgCostUpdate = class;
  TServiceDetail = class;

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
    function GenerateNo: String; virtual; abstract;
    procedure SetGenerateNo; virtual; abstract;
    function GetHeaderFlag: Integer; virtual; abstract;
    function SaveRepeat(aRepeatCount: Integer = 2; DoShowMsg: Boolean = True):
        Boolean;
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
    FLastCost: Double;
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
    property LastCost: Double read FLastCost write FLastCost;
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
    FPaidOff: Integer;
    FNotes: string;
    FPaidAmount: Double;
    FPaidOffDate: TDatetime;
    FPaymentFlag: Integer;
    FRekening: TRekening;
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
    constructor Create;
    destructor Destroy; override;
    function GenerateNo: String; override;
    function GetHeaderFlag: Integer; override;
    function GetRemain: Double;
    function GetTotalBayar: Double;
    procedure SetGenerateNo; override;
    function UpdateRemain: Boolean;
    property AvgCostItems: TObjectList<TAvgCostUpdate> read GetAvgCostItems write
        FAvgCostItems;
  published
    property SubTotal: Double read FSubTotal write FSubTotal;
    property PPN: Double read FPPN write FPPN;
    property Supplier: TSupplier read FSupplier write FSupplier;
    [AttributeOfCode]
    property InvoiceNo: string read FInvoiceNo write FInvoiceNo;
    property DueDate: TDateTime read FDueDate write FDueDate;
    property Amount: Double read FAmount write FAmount;
    property PaidOff: Integer read FPaidOff write FPaidOff;
    property Notes: string read FNotes write FNotes;
    property PaidAmount: Double read FPaidAmount write FPaidAmount;
    property PaidOffDate: TDatetime read FPaidOffDate write FPaidOffDate;
    property PaymentFlag: Integer read FPaymentFlag write FPaymentFlag;
    property Rekening: TRekening read FRekening write FRekening;
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
    FStatus: Integer;
    FInvoice: TPurchaseInvoice;
    FWarehouse: TWarehouse;
    function UpdateReturAmt(IsRevert: Boolean = False): Boolean;
  protected
    function AfterSaveToDB: Boolean; override;
    function BeforeDeleteFromDB: Boolean; override;
    function BeforeSaveToDB: Boolean; override;
    function GetRefno: String; override;
  public
    destructor Destroy; override;
    procedure ClearInvoice;
    function GenerateNo: String; override;
    function GetHeaderFlag: Integer; override;
    procedure SetGenerateNo; override;
  published
    property SubTotal: Double read FSubTotal write FSubTotal;
    property PPN: Double read FPPN write FPPN;
    property Supplier: TSupplier read FSupplier write FSupplier;
    [AttributeOfCode]
    property Refno: string read FRefno write FRefno;
    property Amount: Double read FAmount write FAmount;
    property Notes: string read FNotes write FNotes;
    property ReturFlag: Integer read FReturFlag write FReturFlag;
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

  TTransferStock = class(TCRUDTransDetail)
  private
    FNotes: string;
    FWH_Asal: TWarehouse;
    FRefNo: string;
    FWH_Tujuan: TWarehouse;
  protected
    function BeforeSaveToDB: Boolean; override;
    function GetRefno: String; override;
  public
    destructor Destroy; override;
    procedure DeleteTrfOut;
    function GenerateNo: String; override;
    procedure GenerateTrfOut;
    function GetHeaderFlag: Integer; override;
    procedure SetGenerateNo; override;
  published
    property Notes: string read FNotes write FNotes;
    property WH_Asal: TWarehouse read FWH_Asal write FWH_Asal;
    [AttributeOfCode]
    property RefNo: string read FRefNo write FRefNo;
    property WH_Tujuan: TWarehouse read FWH_Tujuan write FWH_Tujuan;
  end;

  TSalesInvoice = class(TCRUDTransDetail)
  private
    FAmount: Double;
    FPaidOff: Integer;
    FDueDate: TDateTime;
    FInvoiceNo: string;
    FNotes: string;
    FPaidAmount: Double;
    FPaymentFlag: Integer;
    FPPN: Double;
    FReturAmount: Double;
    FStatus: Integer;
    FSubTotal: Double;
    FCustomer: TCustomer;
    FPaidOffDate: TDatetime;
    FServices: TObjectList<TServiceDetail>;
    FRekening: TRekening;
    FSalesman: TSalesman;
    FMekanik: TMekanik;
    FSettingFee: TSettingFee;
    FSalesType: Integer;
    FWarehouse: TWarehouse;
    function GetServices: TObjectList<TServiceDetail>;
  protected
    function AfterSaveToDB: Boolean; override;
    function BeforeDeleteFromDB: Boolean; override;
    function BeforeSaveToDB: Boolean; override;
    function GetRefno: String; override;
  public
    constructor Create;
    destructor Destroy; override;
    function GenerateNo: String; override;
    function GetHeaderFlag: Integer; override;
    function GetRemain: Double;
    function GetTotalBayar: Double;
    procedure SetGenerateNo; override;
    function UpdateRemain: Boolean;
    property Services: TObjectList<TServiceDetail> read GetServices write FServices;
  published
    property Amount: Double read FAmount write FAmount;
    property PaidOff: Integer read FPaidOff write FPaidOff;
    property DueDate: TDateTime read FDueDate write FDueDate;
    [AttributeOfCode]
    property InvoiceNo: string read FInvoiceNo write FInvoiceNo;
    property Notes: string read FNotes write FNotes;
    property PaidAmount: Double read FPaidAmount write FPaidAmount;
    property PaymentFlag: Integer read FPaymentFlag write FPaymentFlag;
    property PPN: Double read FPPN write FPPN;
    property ReturAmount: Double read FReturAmount write FReturAmount;
    property Status: Integer read FStatus write FStatus;
    property SubTotal: Double read FSubTotal write FSubTotal;
    property Customer: TCustomer read FCustomer write FCustomer;
    property PaidOffDate: TDatetime read FPaidOffDate write FPaidOffDate;
    property Rekening: TRekening read FRekening write FRekening;
    property Salesman: TSalesman read FSalesman write FSalesman;
    property Mekanik: TMekanik read FMekanik write FMekanik;
    property SettingFee: TSettingFee read FSettingFee write FSettingFee;
    property SalesType: Integer read FSalesType write FSalesType;
    property Warehouse: TWarehouse read FWarehouse write FWarehouse;
  end;


  TSalesRetur = class(TCRUDTransDetail)
  private
    FAmount: Double;
    FInvoice: TSalesInvoice;
    FNotes: string;
    FPPN: Double;
    FRefno: string;
    FReturFlag: Integer;
    FStatus: Integer;
    FSubTotal: Double;
    FCustomer: TCustomer;
    FSalesman: TSalesman;
    FWarehouse: TWarehouse;
    function UpdateReturAmt(IsRevert: Boolean = False): Boolean;
  protected
    function AfterSaveToDB: Boolean; override;
    function BeforeSaveToDB: Boolean; override;
    function GetRefno: String; override;
  public
    function GenerateNo: String; override;
    function GetHeaderFlag: Integer; override;
    procedure SetGenerateNo; override;
  published
    property Amount: Double read FAmount write FAmount;
    property Invoice: TSalesInvoice read FInvoice write FInvoice;
    property Notes: string read FNotes write FNotes;
    property PPN: Double read FPPN write FPPN;
    [AttributeOfCode]
    property Refno: string read FRefno write FRefno;
    property ReturFlag: Integer read FReturFlag write FReturFlag;
    property Status: Integer read FStatus write FStatus;
    property SubTotal: Double read FSubTotal write FSubTotal;
    property Customer: TCustomer read FCustomer write FCustomer;
    property Salesman: TSalesman read FSalesman write FSalesman;
    property Warehouse: TWarehouse read FWarehouse write FWarehouse;
  end;

  TServiceDetail = class(TCRUDObject)
  private
    FDiscount: Double;
    FHarga: Double;
    FService: TService;
    FQty: Double;
    FTotal: Double;
    FPPN: Double;
    FSalesInvoice: TSalesInvoice;
  public
    destructor Destroy; override;
  published
    property Discount: Double read FDiscount write FDiscount;
    property Harga: Double read FHarga write FHarga;
    property Service: TService read FService write FService;
    property Qty: Double read FQty write FQty;
    property Total: Double read FTotal write FTotal;
    property PPN: Double read FPPN write FPPN;
    [AttributeOfHeader]
    property SalesInvoice: TSalesInvoice read FSalesInvoice write FSalesInvoice;
  end;

const
  HeaderFlag_PurchaseInvoice : Integer = 100;
  HeaderFlag_PurchaseRetur : Integer = 150;
  HeaderFlag_SalesInvoice : Integer = 200;
  HeaderFlag_SalesRetur : Integer = 250;
  HeaderFlag_TransferStock : Integer = 400;
  HeaderFlag_Wastage : Integer = 450;
  HeaderFlag_StockAdjustment : Integer = 500;
  Status_Inv_Created : Integer = 0;
  Status_Inv_Paid : Integer = 1;
  Status_Inv_Cancel : Integer = 2;
  Status_Inv_FullPaid : Integer = 100;

  PaymentFlag_Cash  : Integer = 0;
  PaymentFlag_Credit : Integer = 1;

  ReturFlag_Reguler : Integer = 0;
  ReturFlag_Cancel : Integer = 1;

implementation

uses
  System.StrUtils, uFinancialTransaction, uAppUtils;

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

function TCRUDTransDetail.SaveRepeat(aRepeatCount: Integer = 2; DoShowMsg:
    Boolean = True): Boolean;
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
        Self.SetGenerateNo;
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

constructor TPurchaseInvoice.Create;
begin
  inherited;
  Self.PaidOff := 0;
end;

destructor TPurchaseInvoice.Destroy;
begin
  inherited;
  if FSupplier <> nil then FreeAndNil(FSupplier);
end;

function TPurchaseInvoice.AfterSaveToDB: Boolean;
var
  lPurchasePayment: TPurchasePayment;
begin
  //update avg
  if Self.PaymentFlag = PaymentFlag_Cash then
  begin
    lPurchasePayment := TPurchasePayment.CreateOrGetFromInv(Self);
    Result := lPurchasePayment.SaveToDB(False);
  end else
    Result := True;
end;

function TPurchaseInvoice.BeforeDeleteFromDB: Boolean;
var
  lAvg: TAvgCostUpdate;
  lPurchasePayment: TPurchasePayment;
begin
  for lAvg in Self.AvgCostItems do
  begin
    lAvg.RevertAvgCost;
  end;


  Result := True;
  lPurchasePayment := TPurchasePayment.Create;
  Try
    if lPurchasePayment.LoadByCode(Self.InvoiceNo) then
      Result := lPurchasePayment.DeleteFromDB;
  Finally
    lPurchasePayment.Free;
  End;

//  Result := True;
end;

function TPurchaseInvoice.BeforeSaveToDB: Boolean;
var
  lPurchasePayment: TPurchasePayment;
begin
  GenerateAvgCost;
  Result := True;

  if Self.PaymentFlag = PaymentFlag_Cash then
    Self.PaidAmount := Self.Amount;

  if Self.ID = 0 then  exit;
  //hanya edit
  lPurchasePayment :=  TPurchasePayment.Create;
  Try
    if lPurchasePayment.LoadByCode(Self.InvoiceNo) then
      Result := lPurchasePayment.DeleteFromDB;
  Finally
    lPurchasePayment.Free;
  End;
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

    lItem.HargaAvg  := lItem.Harga;
    lItem.LastCost  := lItem.Harga;
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
  aDigitCount := 5;
  aPrefix := Cabang + '.FB' + FormatDateTime('yymm',Now()) + '.';


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
  Result := aPrefix + RightStr('00000' + IntToStr(lNum), aDigitCount);
end;

function TPurchaseInvoice.GetHeaderFlag: Integer;
begin
  Result := HeaderFlag_PurchaseInvoice;
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

function TPurchaseInvoice.GetRemain: Double;
begin
  Result := Self.Amount - Self.PaidAmount - Self.ReturAmount;
end;

function TPurchaseInvoice.GetTotalBayar: Double;
begin
  Result := Self.PaidAmount + Self.ReturAmount;
end;

procedure TPurchaseInvoice.SetGenerateNo;
begin
  if Self.ID = 0 then Self.InvoiceNo := Self.GenerateNo;
end;

function TPurchaseInvoice.UpdateRemain: Boolean;
var
  S: string;
begin
  S := 'Update TPurchaseInvoice set PaidAmount = ' + FloatToStr(Self.PaidAmount)
  + ', ReturAmount = ' + FloatToSTr(Self.ReturAmount)
  + ' where id = ' + IntToStr(Self.ID);

  Result := TDBUtils.ExecuteSQL(S);
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

procedure TTransDetail.MakePositive;
begin
  Self.Qty := Abs(Self.Qty);
  Self.Total := Abs(Self.Total);
  Self.PPN := Abs(Self.Total);
end;

procedure TTransDetail.MakeNegative;
begin
  Self.Qty := Abs(Self.Qty) * -1;
  Self.Total := Abs(Self.Total) * -1;
  Self.PPN := Abs(Self.Total) * -1;
end;

procedure TTransDetail.SetAvgCost;
var
  lItemUOM: TItemUOM;
begin
  lItemUOM := TItemUOM.GetItemUOM(Self.Item.ID, Self.UOM.ID);
  Try
    Self.HargaAvg := lItemUOM.HargaAvg;
    Self.LastCost := lItemUOM.HargaBeli;
  Finally
    lItemUOM.Free;
  End;
end;

destructor TPurchaseRetur.Destroy;
begin
  inherited;
  if FSupplier <> nil then FreeAndNil(FSupplier);
  if FInvoice <> nil then FreeAndNil(FInvoice);
end;

function TPurchaseRetur.AfterSaveToDB: Boolean;
var
  lPurchasePayment: TPurchasePayment;
begin
  Result := UpdateReturAmt(False);
  if not Result then exit;

  if Self.ReturFlag = ReturFlag_Cancel then
  begin
    lPurchasePayment := TPurchasePayment.CreateOrGetFromRetur(Self);
    Result := lPurchasePayment.SaveToDB(False);
  end else
    Result := True;
end;

function TPurchaseRetur.BeforeDeleteFromDB: Boolean;
var
  lPurchasePayment: TPurchasePayment;
  oldRetur: TPurchaseRetur;
begin
//  Result := True;
  oldRetur := TPurchaseRetur.Create;
  Try
    oldRetur.LoadByID(Self.ID);
    Result := oldRetur.UpdateReturAmt(True);
  Finally
    oldRetur.Free;
  End;


  lPurchasePayment := TPurchasePayment.Create;
  Try
    if lPurchasePayment.LoadByCode(Self.Refno) then
      Result := lPurchasePayment.DeleteFromDB;
  Finally
    lPurchasePayment.Free;
  End;

//  Result := True;
end;

function TPurchaseRetur.BeforeSaveToDB: Boolean;
var
  litem: TTransDetail;
  lPurchasePayment: TPurchasePayment;
  oldRetur: TPurchaseRetur;
begin
  for lItem in Self.Items do
    lItem.SetAvgCost;

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

  lPurchasePayment := TPurchasePayment.Create;
  Try
    if lPurchasePayment.LoadByCode(Self.Refno) then
      Result := lPurchasePayment.DeleteFromDB;
  Finally
    lPurchasePayment.Free;
  End;
end;

procedure TPurchaseRetur.ClearInvoice;
begin
  FreeAndNil(FInvoice);
end;

function TPurchaseRetur.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 5;
  aPrefix := Cabang + '.RB' + FormatDateTime('yymm',Now()) + '.';


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
  Result := aPrefix + RightStr('00000' + IntToStr(lNum), aDigitCount);
end;

function TPurchaseRetur.GetHeaderFlag: Integer;
begin
  Result := HeaderFlag_PurchaseRetur;
end;

function TPurchaseRetur.GetRefno: String;
begin
  Result := Refno;
end;

procedure TPurchaseRetur.SetGenerateNo;
begin
  if Self.ID = 0 then Self.Refno := Self.GenerateNo;
end;

function TPurchaseRetur.UpdateReturAmt(IsRevert: Boolean = False): Boolean;
var
  S: string;
  sOperation: string;
begin
  if Self.ReturFlag = ReturFlag_Reguler then
  begin
    Result := True;
    exit;
  end;

  sOperation := '+';
  if IsRevert then sOperation := '-';

  S := 'Update TPurchaseInvoice set ReturAmount = ReturAmount '
    + sOperation + FloatToStr(Self.Amount);

  if IsRevert then
    S := S + ', Status = ' + IntToStr(Status_Inv_Cancel)
  else
    S := S + ', Status = ' + IntToStr(Status_Inv_Created);


  S := S + ' where ID = ' + IntToStr(Self.Invoice.ID);

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

destructor TTransferStock.Destroy;
begin
  inherited;
  if FWH_Asal <> nil then FreeAndNil(FWH_Asal);
  if FWH_Tujuan <> nil then FreeAndNil(FWH_Tujuan);
end;

function TTransferStock.BeforeSaveToDB: Boolean;
var
  litem: TTransDetail;
begin
  GenerateTrfOut;

  for lItem in Self.Items do
    lItem.SetAvgCost;

  Result := True;
end;

procedure TTransferStock.DeleteTrfOut;
var
  i: Integer;
begin
  for i := Self.Items.Count-1 downto 0 do
  begin
    if Self.Items[i].Qty < 0 then
      Self.Items.Delete(i);
  end;
end;

function TTransferStock.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 5;
  aPrefix := Cabang + '.TS' + FormatDateTime('yymm',Now()) + '.';


  S := 'SELECT MAX(Refno) FROM TTransferStock where Refno LIKE ' + QuotedStr(aPrefix + '%');

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

procedure TTransferStock.GenerateTrfOut;
var
  i: Integer;
  lItem: TTransDetail;
begin

  //delete all trf out first
  DeleteTrfOut;

  for i := 0 to Self.Items.Count-1 do
  begin
    lItem             := TTransDetail.Create;
    lItem.Header_Flag := Items[i].Header_Flag;
    lItem.Header_ID   := Items[i].Header_ID;
    lItem.TransDate   := Items[i].TransDate;
    lItem.TransType   := Items[i].TransType;
    lItem.Konversi    := Items[i].Konversi;
    lItem.Qty         := Items[i].Qty * -1;

    if Items[i].Item <> nil then
      lItem.Item      := TItem.CreateID(Items[i].Item.ID);
    if Items[i].UOM <> nil then
      lItem.UOM       := TUOM.CreateID(Items[i].UOM.ID);

    if Self.WH_Asal <> nil then
      lItem.Warehouse := TWarehouse.CreateID(Self.WH_Asal.ID);

    if Self.WH_Tujuan <> nil then
      Items[i].Warehouse := TWarehouse.CreateID(Self.WH_Tujuan.ID);

    lItem.Harga       := Items[i].Harga;
    lItem.HargaAvg    := Items[i].HargaAvg;
    lItem.Discount    := Items[i].Discount;
    lItem.Total       := Items[i].Total * -1;
    lItem.PPN         := Items[i].PPN;
    lItem.Refno       := Items[i].Refno;
    lItem.TransDef    := Items[i].TransDef;

    Self.Items.Add(lItem);
  end;

end;

function TTransferStock.GetHeaderFlag: Integer;
begin
  Result := HeaderFlag_TransferStock;
end;

function TTransferStock.GetRefno: String;
begin
  Result := Refno;
end;

procedure TTransferStock.SetGenerateNo;
begin
  if Self.ID = 0 then Self.RefNo := Self.GenerateNo;
end;

constructor TSalesInvoice.Create;
begin
  inherited;
  Self.PaidOff := 0;
end;

destructor TSalesInvoice.Destroy;
begin
  inherited;
  if FServices <> nil then FreeAndNil(FServices);
  if FCustomer <> nil then FreeAndNil(FCustomer);
  if FWarehouse <> nil then FreeAndNil(FWarehouse);
  if FMekanik <> nil then FreeAndNil(FMekanik);
  if FRekening <> nil then FreeAndNil(FRekening);
  if FSettingFee <> nil then FreeAndNil(FSettingFee);
end;

function TSalesInvoice.AfterSaveToDB: Boolean;
var
  lSalesPayment: TSalesPayment;
begin
  //update avg
  if Self.PaymentFlag = PaymentFlag_Cash then
  begin
    lSalesPayment :=  TSalesPayment.CreateOrGetFromInv(Self);
    Result := lSalesPayment.SaveToDB(False);
  end else
    Result := True;
end;

function TSalesInvoice.BeforeDeleteFromDB: Boolean;
var
  lSalesPayment: TSalesPayment;
begin
  Result := True;
  lSalesPayment :=  TSalesPayment.Create;
  Try
    if lSalesPayment.LoadByCode(Self.InvoiceNo) then
      Result := lSalesPayment.DeleteFromDB;
  Finally
    lSalesPayment.Free;
  End;
end;

function TSalesInvoice.BeforeSaveToDB: Boolean;
var
  lItem: TTransDetail;
  lSalesPayment: TSalesPayment;
begin
  for lItem in Self.Items do
  begin
    lItem.SetAvgCost;
    lItem.MakeNegative;
  end;

  Result := True;
  if Self.PaymentFlag = PaymentFlag_Cash then
  begin
    Self.PaidAmount := Self.Amount;
    Self.PaidOff    := 0;
  end;

  if Self.ID = 0 then  exit;
  //hanya edit
  lSalesPayment :=  TSalesPayment.Create;
  Try
    if lSalesPayment.LoadByCode(Self.InvoiceNo) then
      Result := lSalesPayment.DeleteFromDB;
  Finally
    lSalesPayment.Free;
  End;
end;

function TSalesInvoice.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 5;
  aPrefix := Cabang + '.FP' + FormatDateTime('yymm',Now()) + '.';


  S := 'SELECT MAX(InvoiceNo) FROM TSalesInvoice where InvoiceNo LIKE ' + QuotedStr(aPrefix + '%');

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

function TSalesInvoice.GetHeaderFlag: Integer;
begin
  Result := HeaderFlag_SalesInvoice;
end;

function TSalesInvoice.GetServices: TObjectList<TServiceDetail>;
begin
  if FServices = nil then
  begin
    FServices := TObjectList<TServiceDetail>.Create();
  end;
  Result := FServices;
end;

function TSalesInvoice.GetRefno: String;
begin
  Result := InvoiceNo;
end;

function TSalesInvoice.GetRemain: Double;
begin
  Result := Self.Amount - Self.PaidAmount - Self.ReturAmount;
end;

function TSalesInvoice.GetTotalBayar: Double;
begin
  Result := Self.PaidAmount + Self.ReturAmount;
end;

procedure TSalesInvoice.SetGenerateNo;
begin
  if Self.ID = 0 then Self.InvoiceNo := Self.GenerateNo;
end;

function TSalesInvoice.UpdateRemain: Boolean;
var
  S: string;
begin
  S := 'Update TSalesInvoice set PaidAmount = ' + FloatToStr(Self.PaidAmount)
  + ', ReturAmount = ' + FloatToSTr(Self.ReturAmount)
  + ' where id = ' + IntToStr(Self.ID);

  Result := TDBUtils.ExecuteSQL(S);
end;

function TSalesRetur.AfterSaveToDB: Boolean;
begin
  Result := UpdateReturAmt(False);
end;

function TSalesRetur.BeforeSaveToDB: Boolean;
var
  litem: TTransDetail;
  oldRetur: TSalesRetur;
begin
  for lItem in Self.Items do
    lItem.SetAvgCost;

  if Self.ID = 0 then
  begin
    Result := True;
    exit;
  end;

  oldRetur := TSalesRetur.Create;
  Try
    oldRetur.LoadByID(Self.ID);
    Result := oldRetur.UpdateReturAmt(True);
  Finally
    oldRetur.Free;
  End;

end;

function TSalesRetur.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 4;
  aPrefix := Cabang + '.RP.' + FormatDateTime('yymmdd',Now()) + '.';


  S := 'SELECT MAX(Refno) FROM TSalesRetur where Refno LIKE ' + QuotedStr(aPrefix + '%');

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

function TSalesRetur.GetHeaderFlag: Integer;
begin
  Result := HeaderFlag_SalesRetur;
end;

function TSalesRetur.GetRefno: String;
begin
  Result := Refno;
end;

procedure TSalesRetur.SetGenerateNo;
begin
  if Self.ID = 0 then Self.Refno := Self.GenerateNo;
end;

function TSalesRetur.UpdateReturAmt(IsRevert: Boolean = False): Boolean;
var
  S: string;
  sOperation: string;
begin
  if Self.ReturFlag = 0 then
  begin
    Result := True;
    exit;
  end;

  sOperation := '+';
  if IsRevert then
    sOperation := '-';

  S := 'Update TSalesInvoice set ReturAmount = ReturAmount '
    + sOperation + FloatToStr(Self.Amount);

  if Self.ReturFlag = 1 then
  begin
    S := S + ', Status = ' + IntToStr(Status_Inv_Cancel)
  end;

  S := S + ' where ID = ' + IntToStr(Self.Invoice.ID);

  Result := TDBUtils.ExecuteSQL(S, False);
end;

destructor TServiceDetail.Destroy;
begin
  inherited;
  if FService <> nil then FreeAndNil(FService);
end;

end.
