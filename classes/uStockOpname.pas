unit uStockOpname;

interface

uses CRUDObject, System.Generics.Collections, uItem, uWarehouse, Sysutils;

type
  TKKSOItem = class;
  TStockOpnameItem = class;

  TStockOpname = class(TCRUDObject)
  private
    FNotes: String;
    FItems: TObjectList<TStockOpnameItem>;
    FRefno: String;
    FStatus: Integer;
    FTransDate: TDatetime;
    function GetItems: TObjectList<TStockOpnameItem>;
  public
    destructor Destroy; override;
    property Items: TObjectList<TStockOpnameItem> read GetItems write FItems;
  published
    property Notes: String read FNotes write FNotes;
    property Refno: String read FRefno write FRefno;
    property Status: Integer read FStatus write FStatus;
    property TransDate: TDatetime read FTransDate write FTransDate;
  end;

  TKKSOItem = class(TCRUDObject)
  private
    FItem: TItem;
    FKonversi: Double;
    FQty: Double;
    FUOM: TUOM;
  public
    destructor Destroy; override;
  published
    property Item: TItem read FItem write FItem;
    property Konversi: Double read FKonversi write FKonversi;
    property Qty: Double read FQty write FQty;
    property UOM: TUOM read FUOM write FUOM;
  end;


  TStockOpnameItem = class(TCRUDObject)
  private
    FItem: TItem;
    FQty_Fisik: Double;
    FQty_System: Double;
    FStockOpname: TStockOpname;
    FStockUOM: TUOM;
    FWarehouse: TWarehouse;
  public
    destructor Destroy; override;
  published
    property Item: TItem read FItem write FItem;
    property Qty_Fisik: Double read FQty_Fisik write FQty_Fisik;
    property Qty_System: Double read FQty_System write FQty_System;
    [AttributeOfHeader]
    property StockOpname: TStockOpname read FStockOpname write FStockOpname;
    property StockUOM: TUOM read FStockUOM write FStockUOM;
    property Warehouse: TWarehouse read FWarehouse write FWarehouse;
  end;

type
  TKKSO = class(TCRUDObject)
  private
    FNotes: String;
    FItems: TObjectList<TKKSOItem>;
    FRefno: String;
    FLokasi: String;
    FUserInput: String;
    FStockOpname: TStockOpname;
    FTransDate: TDatetime;
    FUserVerify: String;
    function GetItems: TObjectList<TKKSOItem>;
  public
    destructor Destroy; override;
    property Items: TObjectList<TKKSOItem> read GetItems write FItems;
  published
    property Notes: String read FNotes write FNotes;
    property Refno: String read FRefno write FRefno;
    property Lokasi: String read FLokasi write FLokasi;
    property UserInput: String read FUserInput write FUserInput;
    property StockOpname: TStockOpname read FStockOpname write FStockOpname;
    property TransDate: TDatetime read FTransDate write FTransDate;
    property UserVerify: String read FUserVerify write FUserVerify;
  end;


implementation


destructor TStockOpname.Destroy;
begin
  inherited;
  if FItems <> nil then
    FItems.Free;
end;

function TStockOpname.GetItems: TObjectList<TStockOpnameItem>;
begin
  if FItems = nil then
  begin
    FItems := TObjectList<TStockOpnameItem>.Create();
  end;
  Result := FItems;
end;

destructor TKKSOItem.Destroy;
begin
  inherited;
  if FItem <> nil then FreeAndNil(FItem);
  if FUOM <> nil then FreeAndNil(FUOM);
end;

destructor TStockOpnameItem.Destroy;
begin
  inherited;
  if FItem <> nil then FreeAndNil(FItem);
  if FWarehouse <> nil then FreeAndNil(FWarehouse);
end;

destructor TKKSO.Destroy;
begin
  inherited;
  if FItems <> nil then
    FItems.Free;
end;

function TKKSO.GetItems: TObjectList<TKKSOItem>;
begin
  if FItems = nil then
  begin
    FItems := TObjectList<TKKSOItem>.Create();
  end;
  Result := FItems;
end;

end.

