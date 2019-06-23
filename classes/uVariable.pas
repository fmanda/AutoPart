unit uVariable;

interface

uses
  System.Classes, uCustomer, System.SysUtils, Datasnap.DBClient;

type
  TVariable = class(TComponent)
  private
    FDef_Cust_Bengkel: string;
    FKode_Pusat: string;
    FKode_Cabang: string;
    FAlamat_1: string;
    FAlamat_2: string;
    FDef_Cust_Umum: string;
    FTelp: string;
    FDef_Rekening: string;
  public
    procedure LoadVariable;
    function UpdateVariable: Boolean;
    property Def_Cust_Bengkel: string read FDef_Cust_Bengkel write
        FDef_Cust_Bengkel;
    property Kode_Pusat: string read FKode_Pusat write FKode_Pusat;
    property Kode_Cabang: string read FKode_Cabang write FKode_Cabang;
    property Alamat_1: string read FAlamat_1 write FAlamat_1;
    property Alamat_2: string read FAlamat_2 write FAlamat_2;
    property Def_Cust_Umum: string read FDef_Cust_Umum write FDef_Cust_Umum;
    property Telp: string read FTelp write FTelp;
    property Def_Rekening: string read FDef_Rekening write FDef_Rekening;
  end;


var
  AppVariable  : TVariable;

implementation

uses
  uDBUtils, Data.DB, Vcl.Forms;

procedure TVariable.LoadVariable;
var
  lCDS: TClientDataset;
  S: string;
begin
  S := 'select * from TVariable';
  lCDS := TDBUtils.OpenDataset(S, nil);
  Try
    if lCDS.Locate('varname','Kode_Pusat',[loCaseInsensitive]) then
      Kode_Pusat := lCDS.FieldByName('VarValue').AsString;
    if lCDS.Locate('varname','Kode_Cabang',[loCaseInsensitive]) then
      Kode_Cabang := lCDS.FieldByName('VarValue').AsString;
    if lCDS.Locate('varname','Alamat_1',[loCaseInsensitive]) then
      Alamat_1 := lCDS.FieldByName('VarValue').AsString;
    if lCDS.Locate('varname','Alamat_2',[loCaseInsensitive]) then
      Alamat_2 := lCDS.FieldByName('VarValue').AsString;
    if lCDS.Locate('varname','Telp',[loCaseInsensitive]) then
      Telp := lCDS.FieldByName('VarValue').AsString;
    if lCDS.Locate('varname','Def_Cust_Umum',[loCaseInsensitive]) then
      Def_Cust_Umum := lCDS.FieldByName('VarValue').AsString;
    if lCDS.Locate('varname','Def_Cust_Bengkel',[loCaseInsensitive]) then
      Def_Cust_Bengkel := lCDS.FieldByName('VarValue').AsString;
    if lCDS.Locate('varname','Def_Rekening',[loCaseInsensitive]) then
      Def_Rekening := lCDS.FieldByName('VarValue').AsString;
  Finally
    lCDS.Free;
  End;
end;

function TVariable.UpdateVariable: Boolean;
var
  SS: TStrings;
begin
  SS := TStringList.Create;
  Try
    SS.Add('delete from TVariable;');
    SS.Add('insert into tvariable(varname, varvalue) values(''Kode_Pusat'','
      + QuotedStr(Kode_Pusat) + ');');
    SS.Add('insert into tvariable(varname, varvalue) values(''Kode_Cabang'','
      + QuotedStr(Kode_Cabang) + ');');
    SS.Add('insert into tvariable(varname, varvalue) values(''Alamat_1'','
      + QuotedStr(Alamat_1) + ');');
    SS.Add('insert into tvariable(varname, varvalue) values(''Alamat_2'','
      + QuotedStr(Alamat_2) + ');');
    SS.Add('insert into tvariable(varname, varvalue) values(''Telp'','
      + QuotedStr(Telp) + ');');
    SS.Add('insert into tvariable(varname, varvalue) values(''Def_Cust_Umum'','
      + QuotedStr(Def_Cust_Umum) + ');');
    SS.Add('insert into tvariable(varname, varvalue) values(''Def_Cust_Bengkel'','
      + QuotedStr(Def_Cust_Bengkel) + ');');
    SS.Add('insert into tvariable(varname, varvalue) values(''Def_Rekening'','
      + QuotedStr(Def_Rekening) + ');');

    Result := TDBUtils.ExecuteSQL(SS);
  Finally
    SS.Free;
  End;
end;

//initialization
//  AppVariable := TVariable.Create(Application);
//  AppVariable.LoadVariable;

end.
