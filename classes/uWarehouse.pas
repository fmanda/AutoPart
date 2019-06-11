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
  public
  published
    [AttributeOfCode]
    property Kode: String read FKode write FKode;
    property Nama: String read FNama write FNama;
    property Jenis: Integer read FJenis write FJenis;  //0 : Gdg Baik, Gd Rusak, Gd Promosi
    property IsActive: Integer read FIsActive write FIsActive;
  end;

implementation

end.
