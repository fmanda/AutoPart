unit uWarehouse;

interface

uses
  CRUDObject, System.Generics.Collections, System.SysUtils;

type
  TRack = class;

  TWarehouse = class(TCRUDObject)
  private
    FKode: String;
    FNama: String;
    FJenis: Integer;
    FIsActive: Integer;
    FIs_External: Integer;
    FRacks: TObjectList<TRack>;
    FProject_Code: String;
    function GetRacks: TObjectList<TRack>;
    property Racks: TObjectList<TRack> read GetRacks write FRacks;
  public
    destructor Destroy; override;
  published
    [AttributeOfCode]
    property Kode: String read FKode write FKode;
    property Nama: String read FNama write FNama;
    property Jenis: Integer read FJenis write FJenis;  //0 : Gdg Baik, Gd Rusak, Gd Promosi
    property IsActive: Integer read FIsActive write FIsActive;
    property Is_External: Integer read FIs_External write FIs_External;
    property Project_Code: String read FProject_Code write FProject_Code;
  end;

  TRack = class(TCRUDObject)
  private
    FRak: String;
    FLokasi: String;
    FWarehouse: TWarehouse;
  public
  published
    property Rak: String read FRak write FRak;
    property Lokasi: String read FLokasi write FLokasi;
    [AttributeOfHeader]
    property Warehouse: TWarehouse read FWarehouse write FWarehouse;
  end;

const
  Warehouse_Internal : Integer = 0;
  Warehouse_External : Integer = 1;

implementation

destructor TWarehouse.Destroy;
begin
  inherited;
  if FRacks <> nil then
    FreeAndNil(FRacks);
end;

function TWarehouse.GetRacks: TObjectList<TRack>;
begin
  if FRacks = nil then
    FRacks := TObjectList<TRack>.Create();
  Result := FRacks;
end;

end.
