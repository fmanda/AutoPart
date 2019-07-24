unit uSalesFee;

interface

uses
  CRUDObject, uTransDetail, uSalesman, uSettingFee, Sysutils;

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
    FStatus: Integer;
    FSettingFee: TSettingFee;
    FTransDate: TDatetime;
    FPaidOffDate: TDatetime;
  public
    constructor Create;
    destructor Destroy; override;
    function NetSales: Double;
    class function UpdateFromInv(aSalesInvoice: TSalesInvoice): TSalesFee;
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
    property Status: Integer read FStatus write FStatus;
    property SettingFee: TSettingFee read FSettingFee write FSettingFee;
    property TransDate: TDatetime read FTransDate write FTransDate;
    property PaidOffDate: TDatetime read FPaidOffDate write FPaidOffDate;
  end;

const
  SalesFee_Open : Integer = 0;
  SalesFee_Process : Integer = 1;
  SalesFee_Paid : Integer = 2;
  SalesFee_Cancel : Integer = 3;

implementation

constructor TSalesFee.Create;
begin
  inherited;
  Self.Status := 0;
end;

destructor TSalesFee.Destroy;
begin
  inherited;
  if FSalesInvoice <> nil then
    FreeAndNil(FSalesInvoice);

//  if FSalesRetur <> nil then
//    FreeAndNil(FSalesRetur);

  if FSalesman <> nil then
    FreeAndNil(FSalesman);

  if FSettingFee <> nil then
    FreeAndNil(FSettingFee);
end;

function TSalesFee.NetSales: Double;
begin
  Result := Self.SalesAmt - Self.ReturAmt;
end;

class function TSalesFee.UpdateFromInv(aSalesInvoice: TSalesInvoice): TSalesFee;
var
  lDay: Double;
begin
  //ditrigger tiap salesinvoice diupdate remainnya
  //jadi tidak perlu obj retur, masalahnya kita butuh retur cost nya
  //salesinvoice yg dioper kesini harus object komplit (include obj list)
  //utk sementara retur cost diproporsionalkan

  if aSalesInvoice = nil then
    raise Exception.Create('TSalesFee.UpdateFromInv : SalesInvoice = nil');
  if aSalesInvoice.SettingFee = nil then
    raise Exception.Create('TSalesFee.UpdateFromInv : SalesInvoice.SettingFee = nil');
  if aSalesInvoice.Salesman = nil then
    raise Exception.Create('TSalesFee.UpdateFromInv : SalesInvoice.Salesman = nil');

  if aSalesInvoice.Items.Count = 0 then
    raise Exception.Create('TSalesFee.UpdateFromInv : SalesInvoice.Items.Count = 0');

  Result := TSalesFee.Create;
  Result.LoadByCode(aSalesInvoice.InvoiceNo);
  Result.Refno        := aSalesInvoice.InvoiceNo;
  Result.TransDate    := aSalesInvoice.TransDate;
  Result.SalesAmt     := aSalesInvoice.Amount;
  Result.SalesCost    := aSalesInvoice.GetTotalCost(True, True);
  Result.ReturAmt     := aSalesInvoice.ReturAmount;

  Result.ReturCost    := 0;
  if Result.SalesAmt <> 0 then
    Result.ReturCost  := (Result.SalesCost / Result.SalesAmt) * Result.ReturAmt; // proporsionalkan


//  if aSalesRetur <> nil then
//  begin
//    if aSalesRetur.Items.Count = 0 then
//      raise Exception.Create('TSalesFee.UpdateFromInv : SalesRetur.Items.Count = 0');
//
//
//    if Result.SalesRetur = nil then
//      Result.SalesRetur := TSalesRetur.Create;
//    Result.SalesRetur.ID  := aSalesRetur.ID;
//    Result.ReturAmt   := aSalesRetur.Amount;
//    Result.ReturCost  := aSalesRetur.GetTotalCost(True, True);
//  end;

  if Result.Salesman = nil then Result.Salesman := TSalesman.Create;
  if Result.SalesInvoice = nil then Result.SalesInvoice := TSalesInvoice.Create;
  if Result.SettingFee = nil then  Result.SettingFee := TSettingFee.Create;

  Result.SettingFee.LoadByID(aSalesInvoice.SettingFee.ID); //must load
  Result.SalesInvoice.ID  := aSalesInvoice.ID;
  Result.Salesman.ID      := aSalesInvoice.Salesman.ID;
  Result.NetProfit        := (Result.SalesAmt-Result.ReturAmt) - (Result.SalesCost - Result.ReturCost);
  Result.Fee              := 0; //Result.SettingFee.Fee_1
  Result.PaidOffDate      := 0;
  Result.Status := SalesFee_Open;

//    lSisa := lSisa - aSalesInvoice.PaidAmount;
  if aSalesInvoice.PaidOff = 1 then
  begin
    Result.PaidOffDate := aSalesInvoice.PaidOffDate;   //real fee
    lDay := aSalesInvoice.PaidOffDate - aSalesInvoice.TransDate;
    if lDay <= Result.SettingFee.MaxTempo_3 then
      Result.Fee := Result.SettingFee.Fee_3/100 * Result.NetSales;
    if lDay <= Result.SettingFee.MaxTempo_2 then
      Result.Fee := Result.SettingFee.Fee_2/100 * Result.NetSales;
    if lDay <= Result.SettingFee.MaxTempo_1 then
      Result.Fee := Result.SettingFee.Fee_1/100 * Result.NetSales;

    if Result.Fee > 0 then  Result.Status := SalesFee_Process;
    if lDay > Result.SettingFee.MaxTempo_3 then
    begin
      Result.Fee := 0;
      Result.Status := SalesFee_Cancel;
    end;
  end
  else
  begin
    //potensi fee
    Result.Status := SalesFee_Open;
    lDay := aSalesInvoice.DueDate - aSalesInvoice.TransDate;
    if lDay <= Result.SettingFee.MaxTempo_3 then
      Result.Fee := Result.SettingFee.Fee_3/100 * Result.NetSales;
    if lDay <= Result.SettingFee.MaxTempo_2 then
      Result.Fee := Result.SettingFee.Fee_2/100 * Result.NetSales;
    if lDay <= Result.SettingFee.MaxTempo_1 then
      Result.Fee := Result.SettingFee.Fee_1/100 * Result.NetSales;

    if lDay > Result.SettingFee.MaxTempo_3 then
    begin
      Result.Fee := 0;
      Result.Status := SalesFee_Cancel;
    end;
  end;


//  Result.SaveToDB(False);
end;

end.
