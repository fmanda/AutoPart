unit uItem;

interface

uses
  CRUDObject, System.Generics.Collections;

type
  TItem = class;
  TItemUOM = class;

  TUOM = class(TCRUDObject)
  private
    FUOM: String;
    FDeskripsi: String;
  public
  published
    [AttributeOfCode]
    property UOM: String read FUOM write FUOM;
    property Deskripsi: String read FDeskripsi write FDeskripsi;
  end;


  TItemGroup = class(TCRUDObject)
  private
    FKode: String;
    FNama: String;
  published
    [AttributeOfCode]
    property Kode: String read FKode write FKode;
    property Nama: String read FNama write FNama;
  end;


  TMerk = class(TCRUDObject)
  private
    FKode: String;
    FNama: String;
  protected
    function LogLevel: Integer; override;
  published
    [AttributeOfCode]
    property Kode: String read FKode write FKode;
    property Nama: String read FNama write FNama;
  end;


  TItem = class(TCRUDObject)
  private
    FKode: String;
    FNama: String;
    FMerk: TMerk;
    FGroup: TItemGroup;
    FItemUOMs: TObjectList<TItemUOM>;
    FModifiedDate: TDateTime;
    FModifiedBy: String;
    FRak: String;
    FPPN: Double;
    FNotes: String;
    FUOMPCS: TUOM;
    function GetItemUOMs: TObjectList<TItemUOM>;
  public
    destructor Destroy; override;
    property ItemUOMs: TObjectList<TItemUOM> read GetItemUOMs write FItemUOMs;
  published
    [AttributeOfCode]
    property Kode: String read FKode write FKode;
    property Nama: String read FNama write FNama;
    property Merk: TMerk read FMerk write FMerk;
    property Group: TItemGroup read FGroup write FGroup;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
    property ModifiedBy: String read FModifiedBy write FModifiedBy;
    property Rak: String read FRak write FRak;
    property PPN: Double read FPPN write FPPN;
    property Notes: String read FNotes write FNotes;
    property UOMPCS: TUOM read FUOMPCS write FUOMPCS;
  end;

  TItemUOM = class(TCRUDObject)
  private
    FItem: TItem;
    FUOM: TUOM;
    FKonversi: Double;
    FHargaBeli: Double;
    FHargaAvg: Double;
    FHargaJual1: Double;
    FHargaJual2: Double;
    FHargaJual3: Double;
    FHargaJual4: Double;
    FModifiedDate: TDateTime;
    FModifiedBy: String;
  public
    destructor Destroy; override;
  published
    [AttributeOfHeader]
    property Item: TItem read FItem write FItem;
    property UOM: TUOM read FUOM write FUOM;
    property Konversi: Double read FKonversi write FKonversi;
    property HargaBeli: Double read FHargaBeli write FHargaBeli;
    property HargaAvg: Double read FHargaAvg write FHargaAvg;
    property HargaJual1: Double read FHargaJual1 write FHargaJual1;
    property HargaJual2: Double read FHargaJual2 write FHargaJual2;
    property HargaJual3: Double read FHargaJual3 write FHargaJual3;
    property HargaJual4: Double read FHargaJual4 write FHargaJual4;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
    property ModifiedBy: String read FModifiedBy write FModifiedBy;
  end;

implementation

function TMerk.LogLevel: Integer;
begin
  Result := 1; //no log
  //1 : all
  //2 : update and delete only
 end;

destructor TItem.Destroy;
begin
  inherited;
  if FItemUOMS <> nil then FItemUOMS.Free;
  if FMerk <> nil then FMerk.Free;
  if FGroup <> nil then FGroup.Free;
end;

function TItem.GetItemUOMs: TObjectList<TItemUOM>;
begin
  if FItemUOMs = nil then
    FItemUOMs := TObjectList<TItemUOM>.Create();
  Result := FItemUOMs;
end;

destructor TItemUOM.Destroy;
begin
  inherited;
  if FUOM <> nil then FUOM.Free;
end;

end.
