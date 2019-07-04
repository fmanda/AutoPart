unit uPriceQuotation;

interface

uses
  CRUDObject, uItem, System.Generics.Collections;

type
  TPriceQuotationItem = class;

  TPriceQuotation = class(TCRUDObject)
  private
    FRefno: String;
    FTransDate: TDatetime;
    FIsActive: Integer;
    FDateActivated: TDatetime;
    FItems: TObjectList<TPriceQuotationItem>;
    FDescription: String;
    FModifiedBy: String;
    FModifiedDate: TDateTime;
    function GetItems: TObjectList<TPriceQuotationItem>;
  public
    destructor Destroy; override;
    property Items: TObjectList<TPriceQuotationItem> read GetItems write FItems;
  published
    property Refno: String read FRefno write FRefno;
    property TransDate: TDatetime read FTransDate write FTransDate;
    property IsActive: Integer read FIsActive write FIsActive;
    property DateActivated: TDatetime read FDateActivated write FDateActivated;
    property Description: String read FDescription write FDescription;
    property ModifiedBy: String read FModifiedBy write FModifiedBy;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
  end;

  TPriceQuotationItem = class(TCRUDObject)
  private
    FItem: TItem;
    FUOM: TUOM;
    FKonversi: Double;
    FHargaBeli: Double;
    FHargaJual1: Double;
    FHargaJual2: Double;
    FHargaJual3: Double;
    FHargaJual4: Double;
    FQuotation: TPriceQuotation;
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
    property Quotation: TPriceQuotation read FQuotation write FQuotation;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
    property ModifiedBy: String read FModifiedBy write FModifiedBy;
  end;

implementation

destructor TPriceQuotation.Destroy;
begin
  inherited;
  if FItems <> nil then FItems.Free;
end;

function TPriceQuotation.GetItems: TObjectList<TPriceQuotationItem>;
begin
  if FItems = nil then
    FItems := TObjectList<TPriceQuotationItem>.Create();
  Result := FItems;
end;

destructor TPriceQuotationItem.Destroy;
begin
  inherited;
  if FUOM <> nil then FUOM.Free;
  if FItem <> nil then FItem.Free;
end;

end.
