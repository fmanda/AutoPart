unit uWarehouse;

interface

uses
  CRUDObject;

type

  TWarehouse = class(TCRUDObject)
  private
    FKode: String;
    FNama: String;
    FJenis: Integer;
    FIsActive: Integer;
    FIs_External: Integer;
    FProject_Code: String;
  public
  published
    [AttributeOfCode]
    property Kode: String read FKode write FKode;
    property Nama: String read FNama write FNama;
    property Jenis: Integer read FJenis write FJenis;  //0 : Gdg Baik, Gd Rusak, Gd Promosi
    property IsActive: Integer read FIsActive write FIsActive;
    property Is_External: Integer read FIs_External write FIs_External;
    property Project_Code: String read FProject_Code write FProject_Code;
  end;

const
  Warehouse_Internal : Integer = 0;
  Warehouse_External : Integer = 1;

implementation

end.
