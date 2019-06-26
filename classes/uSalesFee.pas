unit uSalesFee;

interface

uses
  CRUDObject, uTransDetail, uSalesman, uSettingFee;

type
  TSalesFee = class(TCRUDObject)
  private
    FSalesInvoice: TSalesInvoice;
    FSalesman: TSalesman;
    FReturAmt: Double;
    FSalesAmt: Double;
    FSalesCost: Double;
    FFee: Double;
    FNetProfit: Double;
    FRefNo: string;
    FReturCost: Double;
    FSalesRetur: TSalesRetur;
    FStatus: Integer;
    FSettingFee: TSettingFee;
    FTransDate: TDatetime;
    FPaidOffDate: TDatetime;
  public
    constructor Create;
  published
    property SalesInvoice: TSalesInvoice read FSalesInvoice write FSalesInvoice;
    property Salesman: TSalesman read FSalesman write FSalesman;
    property ReturAmt: Double read FReturAmt write FReturAmt;
    property SalesAmt: Double read FSalesAmt write FSalesAmt;
    property SalesCost: Double read FSalesCost write FSalesCost;
    property Fee: Double read FFee write FFee;
    property NetProfit: Double read FNetProfit write FNetProfit;
    [AttributeOfCode]
    property RefNo: string read FRefNo write FRefNo;
    property ReturCost: Double read FReturCost write FReturCost;
    property SalesRetur: TSalesRetur read FSalesRetur write FSalesRetur;
    property Status: Integer read FStatus write FStatus;
    property SettingFee: TSettingFee read FSettingFee write FSettingFee;
    property TransDate: TDatetime read FTransDate write FTransDate;
    property PaidOffDate: TDatetime read FPaidOffDate write FPaidOffDate;
  end;

const
  SalesFee_Open : Integer = 0;
  SalesFee_Paid : Integer = 1;
  SalesFee_Cancel : Integer = 2;

implementation

constructor TSalesFee.Create;
begin
  inherited;
  Self.Status := 0;
end;

end.
