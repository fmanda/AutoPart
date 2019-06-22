unit uMekanik;

interface

uses CRUDObject;

type
  TMekanik = class(TCRUDObject)
  private
    FKode: String;
    FNama: String;
    FIsActive: Integer;
    FAlamat: String;
    FTelp: string;
  public
    constructor Create;
  published
    [AttributeOfCode]
    property Kode: String read FKode write FKode;
    property Nama: String read FNama write FNama;
    property IsActive: Integer read FIsActive write FIsActive;
    property Alamat: String read FAlamat write FAlamat;
    property Telp: string read FTelp write FTelp;
  end;

implementation

constructor TMekanik.Create;
begin
  inherited;
  IsActive := 1;
end;

end.
