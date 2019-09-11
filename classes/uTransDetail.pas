unit uTransDetail;

interface

uses
  CRUDObject, uDBUtils, Sysutils, uItem, System.Generics.Collections,
  uWarehouse, uSupplier, uCustomer, uSalesman, uAccount, uMekanik, uSettingFee,
  uVariable, Dateutils;

type
  TTransDetail = class;
  TPurchaseInvoice = class;
  TAvgCostUpdate = class;
  TServiceDetail = class;
  TStockOpname = class;
  TStockOpnameItem = class;
  TSalesRetur = class;
  TStockOpnameKKSO = class;
  TKKSO = class;
  TKKSOItem = class;
  TTransferRequest = class;
  TTransferRequestItem = class;

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
    function GetTotalCost(UseLastCost: Boolean = False; IncludePPN: Boolean =
        False): Double;
    function SaveRepeat(DoShowMsg: Boolean = True; aRepeatCount: Integer = 2):
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
    FPriceList: Double;
    FWarehouse: TWarehouse;
    FUOM: TUOM;
    FRefno: string;
    FTransType: Integer;
    FTransDef: string;
    FPriceType: Integer;
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
    property PriceList: Double read FPriceList write FPriceList;
    property Warehouse: TWarehouse read FWarehouse write FWarehouse;
    property UOM: TUOM read FUOM write FUOM;
    property Refno: string read FRefno write FRefno;
    property TransType: Integer read FTransType write FTransType;
    property TransDef: string read FTransDef write FTransDef;
    property PriceType: Integer read FPriceType write FPriceType;
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
    FReferensi: string;
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
    class procedure PrintData(aInvoiceID: Integer);
    procedure SetGenerateNo; override;
    function UpdateRemain(aDate: TDateTime = 0; AddedPaidAmt: Double = 0;
        AddedReturAmt: Double = 0): Boolean;
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
    property Referensi: string read FReferensi write FReferensi;
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
    FPaidAmount: Double;
    FNotes: string;
    FReturFlag: Integer;
    FStatus: Integer;
    FInvoice: TPurchaseInvoice;
    FWarehouse: TWarehouse;
  protected
    function AfterSaveToDB: Boolean; override;
    function BeforeDeleteFromDB: Boolean; override;
    function BeforeSaveToDB: Boolean; override;
    function GetRefno: String; override;
  public
    destructor Destroy; override;
    procedure ClearInvoice;
    procedure ClearSupplier;
    function GenerateNo: String; override;
    function GetHeaderFlag: Integer; override;
    function GetRemain: Double;
    class procedure PrintData(aReturID: Integer);
    procedure SetGenerateNo; override;
    function UpdateRemain(AddedPaidAmt: Double = 0): Boolean;
  published
    property SubTotal: Double read FSubTotal write FSubTotal;
    property PPN: Double read FPPN write FPPN;
    property Supplier: TSupplier read FSupplier write FSupplier;
    [AttributeOfCode]
    property Refno: string read FRefno write FRefno;
    property Amount: Double read FAmount write FAmount;
    property PaidAmount: Double read FPaidAmount write FPaidAmount;
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
    FKodeCabang_Asal: string;
    FKodeCabang_Tujuan: string;
    FTransferType: Integer;
    FWH_Tujuan: TWarehouse;
  protected
    function BeforeSaveToDB: Boolean; override;
    function GetRefno: String; override;
  public
    destructor Destroy; override;
    procedure DeleteOutExceptExternal;
    function GenerateNo: String; override;
    procedure GenerateTrfOut;
    function GetHeaderFlag: Integer; override;
    class procedure PrintData(aID: Integer);
    procedure SetGenerateNo; override;
  published
    property Notes: string read FNotes write FNotes;
    property WH_Asal: TWarehouse read FWH_Asal write FWH_Asal;
    [AttributeOfCode]
    property RefNo: string read FRefNo write FRefNo;
    property KodeCabang_Asal: string read FKodeCabang_Asal write FKodeCabang_Asal;
    property KodeCabang_Tujuan: string read FKodeCabang_Tujuan write
        FKodeCabang_Tujuan;
    property TransferType: Integer read FTransferType write FTransferType;
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
    FCashAmount: Double;
    FCardAmount: Double;
    FCardRekening: TRekening;
    FSalesRetur: TSalesRetur;
    FSettingFee: TSettingFee;
    FSalesType: Integer;
    FWarehouse: TWarehouse;
    function GetServices: TObjectList<TServiceDetail>;
  protected
    function AfterSaveToDB: Boolean; override;
    function BeforeDeleteFromDB: Boolean; override;
    function BeforeSaveToDB: Boolean; override;
    function GetRefno: String; override;
    function LogLevel: Integer; override;
  public
    constructor Create;
    destructor Destroy; override;
    procedure ClearRetur;
    function GenerateNo(aSalesType: Integer): String; reintroduce;
    function GetHeaderFlag: Integer; override;
    function GetRemain: Double;
    function GetTotalBayar: Double;
    function HasRetur: Boolean;
    class procedure PrintData(aSalesInvoiceID: Integer);
    procedure SetGenerateNo; override;
    function UpdateRemain(aPaymentDate: TDateTime; AddedPaidAmt: Double = 0;
        AddedReturAmt: Double = 0): Boolean;
    function UpdateSalesFee(ReloadSales: Boolean = True): Boolean;
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
    property CashAmount: Double read FCashAmount write FCashAmount;
    property CardAmount: Double read FCardAmount write FCardAmount;
    property CardRekening: TRekening read FCardRekening write FCardRekening;
    property SalesRetur: TSalesRetur read FSalesRetur write FSalesRetur;
    property SettingFee: TSettingFee read FSettingFee write FSettingFee;
    property SalesType: Integer read FSalesType write FSalesType;
    property Warehouse: TWarehouse read FWarehouse write FWarehouse;
  end;


  TSalesRetur = class(TCRUDTransDetail)
  private
    FAmount: Double;
    FPaidAmount: Double;
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
  protected
    function AfterSaveToDB: Boolean; override;
    function BeforeDeleteFromDB: Boolean; override;
    function BeforeSaveToDB: Boolean; override;
    function GetRefno: String; override;
  public
    procedure ClearInvoice;
    procedure ClearCustomer;
    function GenerateNo: String; override;
    function GetHeaderFlag: Integer; override;
    function GetRemain: Double;
    class procedure PrintData(aReturID: Integer);
    procedure SetGenerateNo; override;
    function UpdateRemain(AddedPaidAmt: Double = 0): Boolean;
  published
    property Amount: Double read FAmount write FAmount;
    property PaidAmount: Double read FPaidAmount write FPaidAmount;
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

  TStockOpname = class(TCRUDObject)
  private
    FClosed: Integer;
    FItems: TObjectList<TStockOpnameItem>;
    FKKSO: TObjectList<TStockOpnameKKSO>;
    FModifiedBy: String;
    FModifiedDate: TDateTime;
    FTransDate: TDateTime;
    FRefNo: string;
    FNotes: string;
    FTranstype: Integer;
    FWarehouse: TWarehouse;
    function GetItems: TObjectList<TStockOpnameItem>;
    function GetKKSO: TObjectList<TStockOpnameKKSO>;
    function UpdateKKSO(aIsRevert: Boolean = False): Boolean;
  protected
    function AfterSaveToDB: Boolean; override;
    function BeforeDeleteFromDB: Boolean; override;
    function BeforeSaveToDB: Boolean; override;
    function GetRefno: String;
  public
    function AddKKSO(aKKSO_ID: Integer): TStockOpnameKKSO;
    function GenerateNo: String;
    function SaveRepeat(DoShowMsg: Boolean = True; aRepeatCount: Integer = 2):
        Boolean;
    procedure SetGenerateNo;
    property Items: TObjectList<TStockOpnameItem> read GetItems write FItems;
    property KKSO: TObjectList<TStockOpnameKKSO> read GetKKSO write FKKSO;
  published
    property Closed: Integer read FClosed write FClosed;
    property ModifiedBy: String read FModifiedBy write FModifiedBy;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
    property TransDate: TDateTime read FTransDate write FTransDate;
    [AttributeOfHeader]
    property RefNo: string read FRefNo write FRefNo;
    property Notes: string read FNotes write FNotes;
    property Transtype: Integer read FTranstype write FTranstype;
    property Warehouse: TWarehouse read FWarehouse write FWarehouse;
  end;


  TStockOpnameItem = class(TCRUDObject)
  private
    FHargaAvg: Double;
    FItem: TItem;
    FStockOpname: TStockOpname;
    FKonversi: Double;
    FLastCost: Double;
    FQty: Double;
    FVariant: Double;
    FQtySys: Double;
    FUOM: TUOM;
    FWarehouse: TWarehouse;
  public
    procedure SetAvgCost;
  published
    property HargaAvg: Double read FHargaAvg write FHargaAvg;
    property Item: TItem read FItem write FItem;
    [AttributeOfHeader]
    property StockOpname: TStockOpname read FStockOpname write FStockOpname;
    property Konversi: Double read FKonversi write FKonversi;
    property LastCost: Double read FLastCost write FLastCost;
    property Qty: Double read FQty write FQty;
    property Variant: Double read FVariant write FVariant;
    property QtySys: Double read FQtySys write FQtySys;
    property UOM: TUOM read FUOM write FUOM;
    property Warehouse: TWarehouse read FWarehouse write FWarehouse;
  end;

  TStockAdjustment = class(TCRUDTransDetail)
  private
    FNotes: string;
    FWarehouse: TWarehouse;
    FRefNo: string;
    FTransType: Integer;
    FStockOpname: TStockOpname;
  protected
    function BeforeSaveToDB: Boolean; override;
    function GetRefno: String; override;
  public
    destructor Destroy; override;
    procedure ClearStockOname;
    function GenerateNo: String; override;
    function GetHeaderFlag: Integer; override;
    procedure SetGenerateNo; override;
  published
    property Notes: string read FNotes write FNotes;
    property Warehouse: TWarehouse read FWarehouse write FWarehouse;
    [AttributeOfCode]
    property RefNo: string read FRefNo write FRefNo;
    property TransType: Integer read FTransType write FTransType;
    property StockOpname: TStockOpname read FStockOpname write FStockOpname;
  end;


  TKKSOItem = class(TCRUDObject)
  private
    FItem: TItem;
    FKonversi: Double;
    FQty: Double;
    FKKSO: TKKSO;
    FUOM: TUOM;
  public
    destructor Destroy; override;
  published
    property Item: TItem read FItem write FItem;
    property Konversi: Double read FKonversi write FKonversi;
    property Qty: Double read FQty write FQty;
    [AttributeOfHeader]
    property KKSO: TKKSO read FKKSO write FKKSO;
    property UOM: TUOM read FUOM write FUOM;
  end;

  TKKSO = class(TCRUDObject)
  private
    FNotes: String;
    FItems: TObjectList<TKKSOItem>;
    FRefno: String;
    FRak: String;
    FModifiedBy: String;
    FModifiedDate: TDateTime;
    FPIC: String;
    FStockOpname: TStockOpname;
    FTransDate: TDatetime;
    FWarehouse: TWarehouse;
    function GetItems: TObjectList<TKKSOItem>;
  protected
    function GetRefno: String;
  public
    destructor Destroy; override;
    function GenerateNo: String;
    class procedure PrintData(aKKSOID: Integer);
    function SaveRepeat(DoShowMsg: Boolean = True; aRepeatCount: Integer = 2):
        Boolean;
    procedure SetGenerateNo;
    property Items: TObjectList<TKKSOItem> read GetItems write FItems;
  published
    property Notes: String read FNotes write FNotes;
    property Refno: String read FRefno write FRefno;
    property Rak: String read FRak write FRak;
    property ModifiedBy: String read FModifiedBy write FModifiedBy;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
    property PIC: String read FPIC write FPIC;
    property StockOpname: TStockOpname read FStockOpname write FStockOpname;
    property TransDate: TDatetime read FTransDate write FTransDate;
    property Warehouse: TWarehouse read FWarehouse write FWarehouse;
  end;


  TStockOpnameKKSO = class(TCRUDObject)
  private
    FKKSO: TKKSO;
    FStockOpname: TStockOpname;
  public
  published
    property KKSO: TKKSO read FKKSO write FKKSO;
    [AttributeOfHeader]
    property StockOpname: TStockOpname read FStockOpname write FStockOpname;
  end;

  TTransferRequestItem = class(TCRUDObject)
  private
    FItem: TItem;
    FKonversi: Double;
    FQty: Double;
    FTransferRequest: TTransferRequest;
    FUOM: TUOM;
  public
    destructor Destroy; override;
  published
    property Item: TItem read FItem write FItem;
    property Konversi: Double read FKonversi write FKonversi;
    property Qty: Double read FQty write FQty;
    [AttributeOfHeader]
    property TransferRequest: TTransferRequest read FTransferRequest write
        FTransferRequest;
    property UOM: TUOM read FUOM write FUOM;
  end;

  TTransferRequest = class(TCRUDObject)
  private
    FNotes: String;
    FItems: TObjectList<TTransferRequestItem>;
    FRefno: String;
    FModifiedBy: String;
    FModifiedDate: TDateTime;
    FKodeCabang: String;
    FTransDate: TDatetime;
    function GetItems: TObjectList<TTransferRequestItem>;
  protected
    function GetRefno: String;
  public
    destructor Destroy; override;
    function GenerateNo: String;
    class procedure PrintData(aTransferReqID: Integer);
    function SaveRepeat(DoShowMsg: Boolean = True; aRepeatCount: Integer = 2):
        Boolean;
    procedure SetGenerateNo;
    property Items: TObjectList<TTransferRequestItem> read GetItems write FItems;
  published
    property Notes: String read FNotes write FNotes;
    [AttributeOfCode]
    property Refno: String read FRefno write FRefno;
    property ModifiedBy: String read FModifiedBy write FModifiedBy;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
    property KodeCabang: String read FKodeCabang write FKodeCabang;
    property TransDate: TDatetime read FTransDate write FTransDate;
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

  Transfer_Internal : Integer = 0;
  Transfer_External_Out : Integer = 1;
  Transfer_External_In : Integer = 2;

  StockOpname_Parsial : Integer = 0;
  StockOpname_Warehouse : Integer = 1;

  StockAdjustment_Direct : Integer = 0;
  StockAdjustment_FromSO : Integer = 1;

  SalesType_FrontEnd : Integer = 0;
  SalesType_Salesman : Integer = 1;


implementation

uses
  System.StrUtils, uFinancialTransaction, uAppUtils, uSalesFee, uDMReport;

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

function TCRUDTransDetail.GetTotalCost(UseLastCost: Boolean = False;
    IncludePPN: Boolean = False): Double;
var
  lCost: Double;
  lItem: TTransDetail;
begin
  Result := 0;
  for lItem in Self.Items do
  begin
    if UseLastCost then
      lCost := lItem.Qty * lItem.LastCost
    else
      lCost := lItem.Qty * lItem.HargaAvg;

    if IncludePPN then
      lCost := lCost * (100+lItem.PPN)/100;

    Result := Result + Abs(lCost);
  end;
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

function TCRUDTransDetail.SaveRepeat(DoShowMsg: Boolean = True; aRepeatCount:
    Integer = 2): Boolean;
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
      Result := lPurchasePayment.DeleteFromDB(False);
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

//  if Self.PaymentFlag = PaymentFlag_Cash then
  if Self.ID = 0 then  exit;

  Self.PaidAmount   := 0; //reset , value ini hanya boleh diupdate di method UpdateRemain
  Self.ReturAmount  := 0;
  Self.PaidOff      := 0;
  Self.PaidOffDate  := 0;

  //hanya edit
  lPurchasePayment :=  TPurchasePayment.Create;
  Try
    if lPurchasePayment.LoadByCode(Self.InvoiceNo) then
      Result := lPurchasePayment.DeleteFromDB(False);
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

class procedure TPurchaseInvoice.PrintData(aInvoiceID: Integer);
var
  S: string;
begin
  S := 'SELECT * FROM FN_SLIP_PURCHASEINVOICE(' + IntToStr(aInvoiceID) + ')';
  DMReport.ExecuteReport('SlipPurchaseInvoice', S);
end;

procedure TPurchaseInvoice.SetGenerateNo;
begin
  if Self.ID = 0 then Self.InvoiceNo := Self.GenerateNo;
end;

function TPurchaseInvoice.UpdateRemain(aDate: TDateTime = 0; AddedPaidAmt:
    Double = 0; AddedReturAmt: Double = 0): Boolean;
var
  S: string;
begin
  if aDate = 0 then aDate := Now();

  Self.PaidAmount := Self.PaidAmount + AddedPaidAmt;   //utk update / revert remain dari collection
  Self.ReturAmount := Self.ReturAmount + AddedReturAmt;

  S := 'Update TPurchaseInvoice set PaidAmount = ' + FloatToStr(Self.PaidAmount)
  + ', ReturAmount = ' + FloatToSTr(Self.ReturAmount);

  if (Self.Amount - Self.GetTotalBayar) <=  AppVariable.Toleransi_Piutang then
    S := S + ',PaidOff = 1, PaidOffDate = ' + TAppUtils.QuotD(aDate)
  else
    S := S + ',PaidOff = 0, PaidOffDate = NULL';


  S := S + ' where id = ' + IntToStr(Self.ID);

  Result := TDBUtils.ExecuteSQL(S, False);
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
    if Self.HargaAvg <= 0 then
      Self.HargaAvg := Self.LastCost;
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
//  Result := UpdateReturAmt(False);
//  if not Result then exit;

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
begin
  Result := True;

  lPurchasePayment := TPurchasePayment.Create;
  Try
    if lPurchasePayment.LoadByCode(Self.Refno) then
      Result := lPurchasePayment.DeleteFromDB(False);
  Finally
    lPurchasePayment.Free;
  End;

//  Result := True;
end;

function TPurchaseRetur.BeforeSaveToDB: Boolean;
var
  litem: TTransDetail;
  lPurchasePayment: TPurchasePayment;
begin
  Result := True;
  for lItem in Self.Items do
    lItem.SetAvgCost;

  if Self.ID = 0 then  exit;

  Self.PaidAmount   := 0; //reset , value ini hanya boleh diupdate di method UpdateRemain

  lPurchasePayment := TPurchasePayment.Create;
  Try
    if lPurchasePayment.LoadByCode(Self.Refno) then
      Result := lPurchasePayment.DeleteFromDB(False);
  Finally
    lPurchasePayment.Free;
  End;
end;

procedure TPurchaseRetur.ClearInvoice;
begin
  FreeAndNil(FInvoice);
end;

procedure TPurchaseRetur.ClearSupplier;
begin
  FreeAndNil(FSupplier);
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

function TPurchaseRetur.GetRemain: Double;
begin
  Result := Self.Amount - Self.PaidAmount;
end;

class procedure TPurchaseRetur.PrintData(aReturID: Integer);
var
  S: string;
begin
  S := 'SELECT * FROM FN_SLIP_PURCHASERETUR(' + IntToStr(aReturID) + ')';
  DMReport.ExecuteReport('SlipPurchaseRetur', S);
end;

procedure TPurchaseRetur.SetGenerateNo;
begin
  if Self.ID = 0 then Self.Refno := Self.GenerateNo;
end;

function TPurchaseRetur.UpdateRemain(AddedPaidAmt: Double = 0): Boolean;
var
  S: string;
begin
  Self.PaidAmount := Self.PaidAmount + AddedPaidAmt;   //utk update / revert remain dari collection

  S := 'Update TPurchaseRetur set PaidAmount = ' + FloatToStr(Self.PaidAmount);

  if (Self.Amount - Self.PaidAmount) <=  AppVariable.Toleransi_Piutang then
    S := S + ',PaidOff = 1, PaidOffDate = ' + TAppUtils.QuotD(Now())
  else
    S := S + ',PaidOff = 0, PaidOffDate = NULL';

  S := S + ' where id = ' + IntToStr(Self.ID);

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
  lItem: TTransDetail;
begin
  if Self.TransferType = Transfer_Internal then
    GenerateTrfOut; //2 sisi

  for lItem in Self.Items do
  begin
    lItem.SetAvgCost;

    if Self.TransferType = Transfer_External_Out then
    begin
      lItem.Warehouse := TWarehouse.CreateID(Self.WH_Asal.ID);
      lItem.Qty := -1 * lItem.Qty;
    end else
    if Self.TransferType = Transfer_External_In then
    begin
      lItem.Warehouse := TWarehouse.CreateID(Self.WH_Tujuan.ID);
      lItem.Qty := Abs(lItem.Qty);
    end;
  end;

  Result := True;
end;

procedure TTransferStock.DeleteOutExceptExternal;
var
  i: Integer;
begin
  if Self.TransferType <> Transfer_Internal then exit;

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
  DeleteOutExceptExternal;

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

class procedure TTransferStock.PrintData(aID: Integer);
var
  S: string;
begin
  S := 'SELECT A.ID, A.REFNO, A.TRANSDATE, A.NOTES,'
      +' B.NAMA AS WH_ASAL, C.NAMA AS WH_TUJUAN,'
      +' CASE WHEN A.TRANSFERTYPE = 1 THEN ''KIRIM KE CABANG LAIN'' '
      +' WHEN A.TRANSFERTYPE = 2 THEN ''TERIMA DARI CABANG LAIN'' '
      +' ELSE ''ANTAR GUDANG INTERNAL'' END AS JENIS_TRANSFER,'
      +' E.KODE, E.NAMA, F.UOM, ABS(D.QTY) AS QTY'
      +' FROM TTRANSFERSTOCK A'
      +' LEFT JOIN TWAREHOUSE B ON A.WH_ASAL_ID = B.ID'
      +' LEFT JOIN TWAREHOUSE C ON A.WH_TUJUAN_ID = C.ID'
      +' INNER JOIN TTRANSDETAIL D ON A.ID = D.HEADER_ID AND D.HEADER_FLAG = 400'
      +' INNER JOIN TITEM E ON D.ITEM_ID = E.ID'
      +' INNER JOIN TUOM F ON D.UOM_ID = F.ID'
      +' WHERE (A.TRANSFERTYPE <> 0 OR D.QTY > 0)'
      +' AND A.ID = ' + IntToStr(aID) ;
  DMReport.ExecuteReport('SlipTransferStock', S);
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
  if FSalesRetur <> nil then FreeAndNil(FSalesRetur);
  if FCardRekening <> nil then FreeAndNil(FCardRekening);
end;

function TSalesInvoice.AfterSaveToDB: Boolean;
var
  lSalesPayment: TSalesPayment;
begin
  if Self.PaymentFlag = PaymentFlag_Cash then
  begin
    lSalesPayment :=  TSalesPayment.CreateOrGetFromInv(Self);
    Result := lSalesPayment.SaveToDB(False);  //updatesales here
  end else
  begin
    Result := True;
    Self.UpdateSalesFee(False);
  end;

//  if Result then      //migrasi update remain ke Payment
//    Result := Self.UpdateRemain(Self.TransDate);
end;

function TSalesInvoice.BeforeDeleteFromDB: Boolean;
var
  lSalesFee: TSalesFee;
  lSalesPayment: TSalesPayment;
begin
//  Result := True;
  lSalesPayment :=  TSalesPayment.Create;
  lSalesFee := TSalesFee.Create;
  Try
    if lSalesPayment.LoadByCode(Self.InvoiceNo) then
      lSalesPayment.DeleteFromDB(False);

    if lSalesFee.LoadByCode(Self.InvoiceNo) then
      lSalesFee.DeleteFromDB(False);

    Result := True;
  Finally
    lSalesPayment.Free;
    lSalesFee.Free;
  End;
end;

function TSalesInvoice.BeforeSaveToDB: Boolean;
var
  lItem: TTransDetail;
  lSalesFee: TSalesFee;
  lSalesPayment: TSalesPayment;
begin
  for lItem in Self.Items do
  begin
    lItem.SetAvgCost;
    lItem.MakeNegative;
  end;

  Result := True;

  if Self.ID = 0 then exit;

  Self.PaidAmount   := 0; //reset , value ini hanya boleh diupdate di method UpdateRemain
  Self.ReturAmount  := 0;
  Self.PaidOff      := 0;
  Self.PaidOffDate  := 0;

  lSalesPayment :=  TSalesPayment.Create;
  lSalesFee := TSalesFee.Create;
  Try
    if lSalesPayment.LoadByCode(Self.InvoiceNo) then
      lSalesPayment.DeleteFromDB(False);

    if lSalesFee.LoadByCode(Self.InvoiceNo) then
      lSalesFee.DeleteFromDB(False);

    Result := True;
  Finally
    lSalesPayment.Free;
    lSalesFee.Free;
  End;
end;

procedure TSalesInvoice.ClearRetur;
begin
  if FSalesRetur <> nil then FreeAndNil(FSalesRetur);
end;

function TSalesInvoice.GenerateNo(aSalesType: Integer): String;
var
  aDigitCount: Integer;
  aPrefix: string;
  fPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 5;
  fPrefix := 'FT';
  if aSalesType = 1 then fPrefix := 'FK';

  aPrefix := Cabang + '.' + fPrefix + FormatDateTime('yymm',Now()) + '.';
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

function TSalesInvoice.HasRetur: Boolean;
begin
  Result := False;
  if FSalesRetur <> nil then
    if FSalesRetur.ID <> 0 then
      Result := True;
end;

function TSalesInvoice.LogLevel: Integer;
begin
  Result := 0; //0 : no log
  //1 : all
  //2 : update and delete only
 end;

class procedure TSalesInvoice.PrintData(aSalesInvoiceID: Integer);
var
  S: string;
begin
  S := 'SELECT * FROM FN_SLIP_SALESINVOICE(' + IntToStr(aSalesInvoiceID) + ')';
  DMReport.ExecuteReport('SlipSalesInvoice', S);
end;

procedure TSalesInvoice.SetGenerateNo;
begin
  if Self.ID = 0 then Self.InvoiceNo := Self.GenerateNo(Self.SalesType);
end;

function TSalesInvoice.UpdateRemain(aPaymentDate: TDateTime; AddedPaidAmt:
    Double = 0; AddedReturAmt: Double = 0): Boolean;
var
  S: string;
begin
  //doupdatesales
  if aPaymentDate = 0 then aPaymentDate := Now();

  Self.PaidAmount := Self.PaidAmount + AddedPaidAmt;   //utk update / revert remain dari collection
  Self.ReturAmount := Self.ReturAmount + AddedReturAmt;

  S := 'Update TSalesInvoice set PaidAmount = ' + FloatToStr(Self.PaidAmount)
    + ', ReturAmount = ' + FloatToSTr(Self.ReturAmount);

  if (Self.Amount - Self.GetTotalBayar) <=  AppVariable.Toleransi_Piutang then
    S := S + ',PaidOff = 1, PaidOffDate = ' + TAppUtils.QuotD(aPaymentDate)
  else
    S := S + ',PaidOff = 0, PaidOffDate = NULL';


  S := S + ' where id = ' + IntToStr(Self.ID);

  Result := TDBUtils.ExecuteSQL(S, False);

  if Result then
    Result := Self.UpdateSalesFee;
end;

function TSalesInvoice.UpdateSalesFee(ReloadSales: Boolean = True): Boolean;
var
  lSalesFee: TSalesFee;
begin
  Result :=  Self.SettingFee = nil;
  if Result then exit;

  Result :=  Self.SettingFee.ID = 0;
  if Result then exit;

  //reload here
  if ReloadSales then
    Self.ReLoad(True);

  lSalesFee := TSalesFee.UpdateFromInv(Self);
  Try
    Result := lSalesFee.SaveToDB(False);
  Finally
    lSalesFee.Free;
  End;
end;

function TSalesRetur.AfterSaveToDB: Boolean;
var
  lSalesPayment: TSalesPayment;
begin
//  Result := UpdateReturAmt(False);
//  if not Result then exit;

  if Self.ReturFlag = ReturFlag_Cancel then
  begin
    lSalesPayment := TSalesPayment.CreateOrGetFromRetur(Self);
    Result := lSalesPayment.SaveToDB(False);
  end else
    Result := True;
end;

function TSalesRetur.BeforeDeleteFromDB: Boolean;
var
  lSalesPayment: TSalesPayment;
begin
  Result := True;

  lSalesPayment := TSalesPayment.Create;
  Try
    if lSalesPayment.LoadByCode(Self.Refno) then
      Result := lSalesPayment.DeleteFromDB(False);
  Finally
    lSalesPayment.Free;
  End;

//  Result := True;
end;

function TSalesRetur.BeforeSaveToDB: Boolean;
var
  litem: TTransDetail;
  lSalesPayment: TSalesPayment;
begin
  Result := True;
  for lItem in Self.Items do
    lItem.SetAvgCost;

  if Self.ID = 0 then  exit;

  Self.PaidAmount   := 0; //reset , value ini hanya boleh diupdate di method UpdateRemain

  lSalesPayment := TSalesPayment.Create;
  Try
    if lSalesPayment.LoadByCode(Self.Refno) then
      Result := lSalesPayment.DeleteFromDB(False);
  Finally
    lSalesPayment.Free;
  End;
end;

procedure TSalesRetur.ClearInvoice;
begin
  FreeAndNil(FInvoice);
end;

procedure TSalesRetur.ClearCustomer;
begin
  FreeAndNil(FCustomer);
end;

function TSalesRetur.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 5;
  aPrefix := Cabang + '.RP' + FormatDateTime('yymm',Now()) + '.';


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
  Result := aPrefix + RightStr('00000' + IntToStr(lNum), aDigitCount);
end;

function TSalesRetur.GetHeaderFlag: Integer;
begin
  Result := HeaderFlag_SalesRetur;
end;

function TSalesRetur.GetRefno: String;
begin
  Result := Refno;
end;

function TSalesRetur.GetRemain: Double;
begin
  Result := Self.Amount - Self.PaidAmount;
end;

class procedure TSalesRetur.PrintData(aReturID: Integer);
var
  S: string;
begin
  S := 'SELECT * FROM FN_SLIP_SALESRETUR(' + IntToStr(aReturID) + ')';
  DMReport.ExecuteReport('SlipSalesRetur', S);
end;

procedure TSalesRetur.SetGenerateNo;
begin
  if Self.ID = 0 then Self.Refno := Self.GenerateNo;
end;

function TSalesRetur.UpdateRemain(AddedPaidAmt: Double = 0): Boolean;
var
  S: string;
begin
  Self.PaidAmount := Self.PaidAmount + AddedPaidAmt;   //utk update / revert remain dari collection

  S := 'Update TSalesRetur set PaidAmount = ' + FloatToStr(Self.PaidAmount);

  if (Self.Amount - Self.PaidAmount) <=  AppVariable.Toleransi_Piutang then
    S := S + ',PaidOff = 1, PaidOffDate = ' + TAppUtils.QuotD(Now())
  else
    S := S + ',PaidOff = 0, PaidOffDate = NULL';


  S := S + ' where id = ' + IntToStr(Self.ID);

  Result := TDBUtils.ExecuteSQL(S, False);
end;

destructor TServiceDetail.Destroy;
begin
  inherited;
  if FService <> nil then FreeAndNil(FService);
end;

function TStockOpname.AddKKSO(aKKSO_ID: Integer): TStockOpnameKKSO;
var
  lKKSO: TStockOpnameKKSO;
begin
  Result := nil;
  for lKKSO in Self.KKSO do
  begin
    if lKKSO.KKSO = nil then continue;
    if lKKSO.KKSO.ID = aKKSO_ID then
    begin
      Result := lKKSO;
      exit;
    end;
  end;

  if Result = nil then
  begin
    Result := TStockOpnameKKSO.Create;
    Result.KKSO := TKKSO.CreateID(aKKSO_ID);
    Self.KKSO.Add(Result);
  end;

end;

function TStockOpname.AfterSaveToDB: Boolean;
begin
  Result := Self.UpdateKKSO;
end;

function TStockOpname.BeforeDeleteFromDB: Boolean;
begin
  Result := Self.UpdateKKSO(True);
end;

function TStockOpname.BeforeSaveToDB: Boolean;
var
  litem: TStockOpnameItem;
  lOldSO: TStockOpname;
begin
  Result := True;
  for lItem in Self.Items do
    lItem.SetAvgCost;

  if Self.ID = 0 then exit;
  lOldSO := TStockOpname.Create;
  Try
    lOldSO.LoadByID(Self.ID);

    lOldSO.UpdateKKSO(True);
  Finally
    lOldSO.Free;
  End;
end;

function TStockOpname.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 5;
  aPrefix := Cabang + '.SO' + FormatDateTime('yymm',Now()) + '.';


  S := 'SELECT MAX(RefNo) FROM TStockOpname where RefNo LIKE ' + QuotedStr(aPrefix + '%');

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

function TStockOpname.GetItems: TObjectList<TStockOpnameItem>;
begin
  if FItems = nil then
  begin
    FItems := TObjectList<TStockOpnameItem>.Create();
  end;
  Result := FItems;
end;

function TStockOpname.GetKKSO: TObjectList<TStockOpnameKKSO>;
begin
  if FKKSO = nil then
  begin
    FKKSO := TObjectList<TStockOpnameKKSO>.Create();
  end;
  Result := FKKSO;
end;

function TStockOpname.GetRefno: String;
begin
  Result := Refno;
end;

function TStockOpname.SaveRepeat(DoShowMsg: Boolean = True; aRepeatCount:
    Integer = 2): Boolean;
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

procedure TStockOpname.SetGenerateNo;
begin
  if Self.ID = 0 then Self.RefNo := Self.GenerateNo;
end;

function TStockOpname.UpdateKKSO(aIsRevert: Boolean = False): Boolean;
var
  iSOID: Integer;
  S: string;
begin
  Result := True;
  if Self.ID = 0 then exit;

  iSOID := Self.ID;
  if aIsRevert then iSOID := 0;
  S := 'UPDATE B SET B.STOCKOPNAME_ID = ' + IntToStr(iSOID)
      +' FROM TSTOCKOPNAMEKKSO A'
      +' INNER JOIN TKKSO B ON B.ID = A.KKSO_ID'
      +' WHERE A.STOCKOPNAME_ID = ' + IntToStr(Self.ID);
  TDBUtils.ExecuteSQL(S, False);
end;

destructor TStockAdjustment.Destroy;
begin
  inherited;
  if FWarehouse <> nil then FreeAndNil(FWarehouse);
  if FStockOpname <> nil then FreeAndNil(FStockOpname);
end;

function TStockAdjustment.BeforeSaveToDB: Boolean;
var
  lItem: TTransDetail;
begin
  for lItem in Self.Items do
  begin
    lItem.SetAvgCost;
  end;

  Result := True;
end;

procedure TStockAdjustment.ClearStockOname;
begin
  if FWarehouse <> nil then FreeAndNil(FWarehouse);
  if FStockOpname <> nil then FreeAndNil(FStockOpname);
end;

function TStockAdjustment.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 5;
  aPrefix := Cabang + '.SA' + FormatDateTime('yymm',Now()) + '.';


  S := 'SELECT MAX(Refno) FROM TStockAdjustment where Refno LIKE ' + QuotedStr(aPrefix + '%');

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

function TStockAdjustment.GetHeaderFlag: Integer;
begin
  Result := HeaderFlag_StockAdjustment;
end;

function TStockAdjustment.GetRefno: String;
begin
  Result := Refno;
end;

procedure TStockAdjustment.SetGenerateNo;
begin
  if Self.ID = 0 then Self.RefNo := Self.GenerateNo;
end;

procedure TStockOpnameItem.SetAvgCost;
var
  lItemUOM: TItemUOM;
begin
  lItemUOM := TItemUOM.GetItemUOM(Self.Item.ID, Self.UOM.ID);
  Try
    Self.HargaAvg := lItemUOM.HargaAvg;
    Self.LastCost := lItemUOM.HargaBeli;

    if Self.HargaAvg <= 0 then
      Self.HargaAvg := Self.LastCost;
  Finally
    lItemUOM.Free;
  End;
end;

destructor TKKSOItem.Destroy;
begin
  inherited;
  if FItem <> nil then FreeAndNil(FItem);
  if FUOM <> nil then FreeAndNil(FUOM);
end;

destructor TKKSO.Destroy;
begin
  inherited;
  if FItems <> nil then
    FItems.Free;
end;

function TKKSO.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 4;
  aPrefix := Cabang + '.KKSO' + FormatDateTime('yymm',Now()) + '.';


  S := 'SELECT MAX(RefNo) FROM TKKSO where RefNo LIKE ' + QuotedStr(aPrefix + '%');

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

function TKKSO.GetItems: TObjectList<TKKSOItem>;
begin
  if FItems = nil then
  begin
    FItems := TObjectList<TKKSOItem>.Create();
  end;
  Result := FItems;
end;

function TKKSO.GetRefno: String;
begin
  Result := Refno;
end;

class procedure TKKSO.PrintData(aKKSOID: Integer);
var
  S: string;
begin
  S := 'SELECT A.ID, A.REFNO, A.TRANSDATE, E.NAMA AS GUDANG,'
      +' A.PIC, A.MODIFIEDBY, A.MODIFIEDDATE, C.KODE, C.NAMA,'
      +' D.UOM, B.QTY, B.KONVERSI, A.RAK'
      +' FROM TKKSO A'
      +' INNER JOIN TKKSOITEM B ON A.ID = B.KKSO_ID'
      +' INNER JOIN TITEM C ON B.ITEM_ID = C.ID'
      +' INNER JOIN TUOM D ON B.UOM_ID = D.ID'
      +' INNER JOIN TWAREHOUSE E ON A.WAREHOUSE_ID = E.ID'
      +' WHERE A.ID = ' + IntToStr(aKKSOID);

  DMReport.ExecuteReport('SlipKKSO', S);
end;

function TKKSO.SaveRepeat(DoShowMsg: Boolean = True; aRepeatCount: Integer =
    2): Boolean;
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

procedure TKKSO.SetGenerateNo;
begin
  if Self.ID = 0 then Self.RefNo := Self.GenerateNo;
end;

destructor TTransferRequestItem.Destroy;
begin
  inherited;
  if FItem <> nil then FreeAndNil(FItem);
  if FUOM <> nil then FreeAndNil(FUOM);
end;

destructor TTransferRequest.Destroy;
begin
  inherited;
  if FItems <> nil then
    FItems.Free;
end;

function TTransferRequest.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 4;
  aPrefix := Cabang + '.TRQ' + FormatDateTime('yymm',Now()) + '.';


  S := 'SELECT MAX(RefNo) FROM TTransferRequest where RefNo LIKE ' + QuotedStr(aPrefix + '%');

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

function TTransferRequest.GetItems: TObjectList<TTransferRequestItem>;
begin
  if FItems = nil then
  begin
    FItems := TObjectList<TTransferRequestItem>.Create();
  end;
  Result := FItems;
end;

function TTransferRequest.GetRefno: String;
begin
  Result := Refno;
end;

class procedure TTransferRequest.PrintData(aTransferReqID: Integer);
var
  S: string;
begin
  S := '';

  DMReport.ExecuteReport('SlipTransferRequest', S);
end;

function TTransferRequest.SaveRepeat(DoShowMsg: Boolean = True; aRepeatCount: Integer =
    2): Boolean;
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

procedure TTransferRequest.SetGenerateNo;
begin
  if Self.ID = 0 then Self.RefNo := Self.GenerateNo;
end;

end.
