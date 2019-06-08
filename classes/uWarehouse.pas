unit uWarehouse;

interface

uses
  CRUDObject;

type
  TWarehouse = class(TCRUDObject)
  private
    FNama: String;
    FKode: String;
  published
    property Nama: String read FNama write FNama;
    [AttributeOfCode]
    property Kode: String read FKode write FKode;
  end;

implementation

end.
