unit uStockOpname;

interface

uses CRUDObject, System.Generics.Collections, uItem, uWarehouse, Sysutils;

type
  TStockOpnameInput = class;
  TStockOpnameItem = class;

  TStockOpname = class(TCRUDObject)
  private
    FNotes: String;
    FInputs: TObjectList<TStockOpnameInput>;
    FItems: TObjectList<TStockOpnameItem>;
    FRefno: String;
    FStatus: Integer;
    FTransDate: TDatetime;
    function GetInputs: TObjectList<TStockOpnameInput>;
    function GetItems: TObjectList<TStockOpnameItem>;
  public
    destructor Destroy; override;
    property Inputs: TObjectList<TStockOpnameInput> read GetInputs write FInputs;
    property Items: TObjectList<TStockOpnameItem> read GetItems write FItems;
  published
    property Notes: String read FNotes write FNotes;
    property Refno: String read FRefno write FRefno;
    property Status: Integer read FStatus write FStatus;
    property TransDate: TDatetime read FTransDate write FTransDate;
  end;

  TStockOpnameInput = class(TCRUDObject)
  private
    FItem: TItem;
    FKonversi: Double;
    FQty: Double;
    FStockOpname: TStockOpname;
    FUOM: TUOM;
    FWarehouse: TWarehouse;
  public
    destructor Destroy; override;
  published
    property Item: TItem read FItem write FItem;
    property Konversi: Double read FKonversi write FKonversi;
    property Qty: Double read FQty write FQty;
    [AttributeOfHeader]
    property StockOpname: TStockOpname read FStockOpname write FStockOpname;
    property UOM: TUOM read FUOM write FUOM;
    property Warehouse: TWarehouse read FWarehouse write FWarehouse;
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

implementation


destructor TStockOpname.Destroy;
begin
  inherited;
  if FInputs <> nil then
    FInputs.Free;
  if FItems <> nil then
    FItems.Free;
end;

function TStockOpname.GetInputs: TObjectList<TStockOpnameInput>;
begin
  if FInputs = nil then
  begin
    FInputs := TObjectList<TStockOpnameInput>.Create();
  end;
  Result := FInputs;
end;

function TStockOpname.GetItems: TObjectList<TStockOpnameItem>;
begin
  if FItems = nil then
  begin
    FItems := TObjectList<TStockOpnameItem>.Create();
  end;
  Result := FItems;
end;

destructor TStockOpnameInput.Destroy;
begin
  inherited;
  if FItem <> nil then FreeAndNil(FItem);
  if FUOM <> nil then FreeAndNil(FUOM);
  if FWarehouse <> nil then FreeAndNil(FWarehouse);
end;

destructor TStockOpnameItem.Destroy;
begin
  inherited;
  if FItem <> nil then FreeAndNil(FItem);
  if FWarehouse <> nil then FreeAndNil(FWarehouse);
end;

end.

