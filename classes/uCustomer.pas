unit uCustomer;

interface

uses
  CRUDObject;

type
  TCustomer = class(TCRUDObject)
  private
    FKode: String;
    FNama: String;
    FAlamat: String;
    FTempo: Integer;
    FTelp: string;
    FIsActive: Integer;
    FModifiedBy: String;
    FModifiedDate: TDateTime;
    FCreditLimit: Double;
    FTipeHarga: Integer;
  public
    function GenerateNo: String;
  published
    [AttributeOfCode]
    property Kode: String read FKode write FKode;
    property Nama: String read FNama write FNama;
    property Alamat: String read FAlamat write FAlamat;
    property Tempo: Integer read FTempo write FTempo;
    property Telp: string read FTelp write FTelp;
    property IsActive: Integer read FIsActive write FIsActive;
    property ModifiedBy: String read FModifiedBy write FModifiedBy;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
    property CreditLimit: Double read FCreditLimit write FCreditLimit;
    property TipeHarga: Integer read FTipeHarga write FTipeHarga;
  end;

implementation

uses
  System.SysUtils, uDBUtils, Strutils;

function TCustomer.GenerateNo: String;
var
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aPrefix := 'C' + FormatDateTime('YY',Now())+'.';

  S := 'SELECT MAX(Kode) FROM TCustomer WHERE Kode LIKE ' + QuotedStr(aPrefix + '%');

  with TDBUtils.OpenQuery(S) do
  begin
    Try
      if not eof then
        TryStrToInt(RightStr(Fields[0].AsString, 4), lNum);
    Finally
      Free;
    End;
  end;

  inc(lNum);
  Result := aPrefix + RightStr('0000' + IntToStr(lNum), 4);
end;

end.
