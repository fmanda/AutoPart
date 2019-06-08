unit uItem;

interface

uses
  CRUDObject;

type
  TUOM = class(TCRUDObject)
  private
    FUOM: String;
    FDeskripsi: String;
  published
    [AttributeOfCode]
    property UOM: String read FUOM write FUOM;
    property Deskripsi: String read FDeskripsi write FDeskripsi;
  end;

type
  TItemGroup = class(TCRUDObject)
  private
    FKode: String;
    FNama: String;
  published
    [AttributeOfCode]
    property Kode: String read FKode write FKode;
    property Nama: String read FNama write FNama;
  end;

type
  TMerk = class(TCRUDObject)
  private
    FKode: String;
    FNama: String;
  protected
    function LogLevel: Integer; override;
  published
    [AttributeOfCode]
    property Kode: String read FKode write FKode;
    [AttributeOfHeader]
    property Nama: String read FNama write FNama;
  end;

implementation

function TMerk.LogLevel: Integer;
begin
  Result := 1; //no log
  //1 : all
  //2 : update and delete only
 end;

end.
