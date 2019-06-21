unit uQuotation;

interface

uses
  CRUDObject, uItem, System.Generics.Collections;

type
  TQuotationItem = class;

  TQuotation = class(TCRUDObject)
  private
    FRefno: String;
    FRefDate: TDatetime;
    FIsActive: Integer;
    FDateActivated: TDatetime;
    FItems: TObjectList<TQuotationItem>;
    FDescription: String;
    function GetItems: TObjectList<TQuotationItem>;
  public
    constructor Create;
    destructor Destroy; override;
    property Items: TObjectList<TQuotationItem> read GetItems write FItems;
  published
    property Refno: String read FRefno write FRefno;
    property RefDate: TDatetime read FRefDate write FRefDate;
    property IsActive: Integer read FIsActive write FIsActive;
    property DateActivated: TDatetime read FDateActivated write FDateActivated;
    property Description: String read FDescription write FDescription;
  end;

  TQuotationItem = class(TCRUDObject)
  private
    FItem: TItem;
    FUOM: TUOM;
    FKonversi: Double;
    FHargaBeli: Double;
    FHargaJual1: Double;
    FHargaJual2: Double;
    FHargaJual3: Double;
    FHargaJual4: Double;
    FQuotation: TQuotation;
    FModifiedDate: TDateTime;
    FModifiedBy: String;
  public
    destructor Destroy; override;
  published
    property Item: TItem read FItem write FItem;
    property UOM: TUOM read FUOM write FUOM;
    property Konversi: Double read FKonversi write FKonversi;
    property HargaBeli: Double read FHargaBeli write FHargaBeli;
    property HargaJual1: Double read FHargaJual1 write FHargaJual1;  //harga umum
    property HargaJual2: Double read FHargaJual2 write FHargaJual2;  //harga bengkel
    property HargaJual3: Double read FHargaJual3 write FHargaJual3;  //harga grosir
    property HargaJual4: Double read FHargaJual4 write FHargaJual4;  //harga keliling
    [AttributeOfHeader]
    property Quotation: TQuotation read FQuotation write FQuotation;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
    property ModifiedBy: String read FModifiedBy write FModifiedBy;
  end;

implementation

constructor TQuotation.Create;
begin
  inherited;
  IsActive := 1;
end;

destructor TQuotation.Destroy;
begin
  inherited;
  if FItems <> nil then FItems.Free;
end;

function TQuotation.GetItems: TObjectList<TQuotationItem>;
begin
  if FItems = nil then
    FItems := TObjectList<TQuotationItem>.Create();
  Result := FItems;
end;

destructor TQuotationItem.Destroy;
begin
  inherited;
  if FUOM <> nil then FUOM.Free;
  if FItem <> nil then FItem.Free;
end;

end.
