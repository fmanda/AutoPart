unit uDBUtils;

interface
uses
  System.Rtti, typinfo, SysUtils, StrUtils,
  Forms, Datasnap.DBClient,
  Provider, Generics.Collections, System.Classes, StdCtrls,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.PG, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, Data.DB, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDac.Dapt;

type
  TCDSHelper = class helper for TClientDataSet
  private
  public
    procedure AddField(AFieldName: String; AFieldType: TFieldType; ALength: Integer
        = 256; IsCalculated: Boolean = False);
    function ClonedDataset(aOwner: TComponent; DisableSourceControl: Boolean =
        False): TClientDataSet;
    procedure LoadFromXLS(FileName: String; SheetIndex: Integer = 1);
    procedure SetFieldFrom(DestFieldName: String; SourceDataSet: TDataset;
        SourceField: String = '');
  end;

  TDBUtils = class(TObject)
  private
  public
    class procedure Commit;
    class function CopyDataset(Source: TClientDataSet): TClientDataSet;
    class function ConnectDB(ADBEngine, AServer, ADatabase, AUser , APassword,
        APort : String): Boolean;
    class function DSToCDS(aDataset: TDataSet; aOwner: TComponent; FreeDataSet:
        Boolean = True): TClientDataset; overload;

    class function ExecuteSQL(ASQLs: TStrings; DoCommit: Boolean = True): Boolean;
        overload;
    class function ExecuteSQL(ASQL: string; DoCommit: Boolean = True): Boolean;
        overload;
    class function PrepareQuery(ASQL: string): TFDQuery; overload;
    class function ExecuteSQLIdent(ASQLs: TStrings): Integer; overload;
    class function ExecuteSQLIdent(ASQL: string): Integer; overload;
    class function OpenDataset(ASQL: String; AOwner: TComponent = nil):
        TClientDataSet; overload;
    class function OpenMemTable(ASQL : String): TFDMemTable;
    class function OpenQuery(ASQL: String; AOwner: TComponent = nil): TFDQuery;
    class function Quot(aString : String): String;
    class function QuotD(aDate : TDateTime; aTambahJam235959 : Boolean = false):
        String;
    class function QuotDLong(aDate : TDateTime): String;
    class function QuotDt(aDate : TDateTime): String; overload;
    class function QuotDT(aDate : TDateTime; aTambahJam235959 : Boolean): String;
        overload;
    class function QuotDShort(aDate : TDateTime): String; overload;
    class function QuotF(ANumber : Double): String;
    class procedure RollBack;
    class procedure SetUserLogin(aUser: string);
    class function GetUserLogin: String;
  end;

function Cabang: string;

function IsValidTransDate(aDate: TDatetime): Boolean;

var
  FDConnection  : TFDConnection;
  FDTransaction : TFDTransaction;
  UserLogin : String;
//  Cabang : String = '01';
  DebugSS : TStrings;

const
  SQL_Insert  : String = 'Insert Into %s(%s) values(%s);';
  SQL_Update  : String = 'Update %s set %s where %s;';
  SQL_Delete  : String = 'Delete From %s where %s;';
  SQL_Select  : String = 'Select %s from %s where %s';
  SQL_Create  : String = 'create table %s ( %s );';
  SQL_Alter   : String = 'alter table %s add %s ;';

implementation

uses
  System.Win.ComObj, uAppUtils, uVariable, System.DateUtils;

function Cabang: string;
begin
  Result := AppVariable.Kode_Cabang;
end;

function IsValidTransDate(aDate: TDatetime): Boolean;
var
  lLastEOD: TDatetime;
  lLastYear: TDatetime;
  S: string;
begin
  aDate := EncodeDateTime(YearOf(aDate), MonthOf(aDate), DayOf(aDate), 0,0,0, 0);
  Result := False;
  lLastEOD := 0;
  S := 'SELECT MAX(TRANSDATE) FROM TENDOFDAY';
  With TDBUtils.OpenQuery(S) do
  begin
    Try
      if not eof then
        lLastEOD := EncodeDateTime(YearOf(Fields[0].AsDateTime), MonthOf(Fields[0].AsDateTime), DayOf(Fields[0].AsDateTime), 0,0,0, 0);
    Finally
      free;
    End;
  end;

  //jika sudah EOD
  if aDate <= lLastEOD then
  begin
    TAppUtils.Warning('Tanggal : ' + DateToStr(aDate) + ' sudah dilakukan End Of Day'
      +#13 + 'Tidak bisa simpan, ubah, hapus Transaksi di tanggal tersebut'
      +#13 + 'EOD Terakhir : ' + DateToStr(lLastEOD)
    );
    exit;
  end;

  //jika lompat tahun
  if YearOf(aDate) > YearOf(lLastEOD) then
  begin
    lLastYear := EncodeDateTime(YearOf(aDate)-1, 12, 31, 0,0,0, 0);
    if lLastEOD < lLastYear then
    begin
      TAppUtils.Warning('End Of Year tahun sebelumnya belum dilakukan');
      exit;
    end
  end;

  Result := True;

end;

class procedure TDBUtils.Commit;
begin
  if FDTransaction = nil then
    exit;

  if FDTransaction.Active then
    FDTransaction.Commit;
end;

class function TDBUtils.ConnectDB(ADBEngine, AServer, ADatabase, AUser ,
    APassword, APort : String): Boolean;
begin
  Result := False;

  FDConnection := TFDConnection.Create(Application);
  FDTransaction:= TFDTransaction.Create(Application);

  FDConnection.Transaction                := FDTransaction;
  FDTransaction.Options.Isolation         := xiReadCommitted;
  FDTransaction.Options.DisconnectAction  := xdRollback;
  FDTransaction.Options.ReadOnly          := false;

  FDConnection.DriverName := ADBEngine;
  FDConnection.LoginPrompt:= False;

  FDConnection.Params.Add('Server=' + AServer);
  FDConnection.Params.Add('Database=' + ADatabase);
  FDConnection.Params.Add('User_Name=' + AUser);
  FDConnection.Params.Add('Password=' + APassword);

  if APort <> '' then
    FDConnection.Params.Add('Port=' + APort);

  FDConnection.Connected := True;
  if FDConnection.Connected then
  begin
//    TAppUtils.TulisRegistry('Engine', ADBEngine);
//    TAppUtils.TulisRegistry('server', AServer);
//    TAppUtils.TulisRegistry('Database', ADatabase);
//    TAppUtils.TulisRegistry('User_Name', AUser);
//    TAppUtils.TulisRegistry('Password', APassword);
//    TAppUtils.TulisRegistry('Port', APort);

    Result := True;
  end;

end;

class function TDBUtils.DSToCDS(aDataset: TDataSet; aOwner: TComponent;
    FreeDataSet: Boolean = True): TClientDataset;
var
  ADSP: TDataSetProvider;
begin
  Result := nil;
  if ADataSet.FieldCount <> 0 then
  begin
    Result:= TClientDataSet.Create(aOwner);
    ADSP := TDataSetProvider.Create(Result);
    ADSP.DataSet:= aDataset;
    Result.SetProvider(ADSP);
    Result.Open;

    if FreeDataSet then FreeAndNil(aDataset);
  end;
end;

class function TDBUtils.ExecuteSQL(ASQLs: TStrings; DoCommit: Boolean = True):
    Boolean;
var
  Q: TFDQuery;
begin
  Result := false;
  Q := TFDQuery.Create(Application);
  Try
    try
      application.ProcessMessages;
      Q.Connection  := FDConnection;
      Q.Transaction := FDTransaction;
      Q.SQL.Clear;
      Q.SQL.AddStrings(aSQLS);

      Application.ProcessMessages;
      if not FDTransaction.Active then
        FDTransaction.StartTransaction;
      Q.ExecSQL;
      if DoCommit then Self.Commit;
      If not Result then Result := True;
    except
      Self.RollBack;
      Q.SQL.SaveToFile(ExtractFilePath(ParamStr(0)) + '\FailedExecution.log');
      raise;
    end;
  Finally
    Q.SQL.Clear;
    FreeAndNIl(Q);
  End;
end;

class function TDBUtils.OpenDataset(ASQL: String; AOwner: TComponent = nil):
    TClientDataSet;
var
  LDSP: TDataSetProvider;
  LSQLQuery: TFDQuery;
begin
  if AOwner = nil then
    Result := TClientDataSet.Create(Application)
  else
    Result := TClientDataSet.Create(AOwner);

  LDSP        := TDataSetProvider.Create(Result);
  LSQLQuery   := TFDQuery.Create(LDSP);
  LSQLQuery.FetchOptions.Unidirectional := False;

  if FDConnection.Connected then
  begin
    LSQLQuery.Connection := FDConnection;
    LSQLQuery.SQL.Append(ASQL);

    LDSP.DataSet            := LSQLQuery;
    Result.SetProvider(LDSP);
    Result.Open;
  end;
end;

class function TDBUtils.OpenMemTable(ASQL : String): TFDMemTable;
var
  Q: TFDQuery;
begin
  Result := TFDMemTable.Create(nil);

  Q := TDBUtils.OpenQuery(ASQL, nil);
  try
    Q.FetchAll;
    Result.Data := Q.Data;
    Result.First;
  finally
    Q.Free;
  end;
end;

class function TDBUtils.OpenQuery(ASQL: String; AOwner: TComponent = nil):
    TFDQuery;
begin
  Result := TFDQuery.Create(AOwner);
  Result.Connection := FDConnection;
  Result.SQL.Text := ASQL;
  Result.Open;
end;

class function TDBUtils.Quot(aString : String): String;
begin
    result := QuotedSTr(trim(Astring));
end;

class function TDBUtils.QuotD(aDate : TDateTime; aTambahJam235959 : Boolean =
    false): String;
begin
    if not aTambahJam235959 then
    begin
      Result := Quot(FormatDateTime('mm/dd/yyyy', aDate));
    end else
    begin
      Result := Quot(FormatDateTime('mm/dd/yyyy 23:59:59', aDate));
    end;
end;

class function TDBUtils.QuotDLong(aDate : TDateTime): String;
begin
    result := Quot(FormatDateTime('dd mmm yyyy', aDate));
end;

class function TDBUtils.QuotDt(aDate : TDateTime): String;
begin
    result := Quot(FormatDateTime('mm/dd/yyyy hh:mm:ss', aDate));
end;

class function TDBUtils.QuotDT(aDate : TDateTime; aTambahJam235959 : Boolean):
    String;
begin
    if not aTambahJam235959 then
    begin
      Result := Quot(FormatDateTime('mm/dd/yyyy hh:mm:ss', aDate));
    end else
    begin
      Result := Quot(FormatDateTime('mm/dd/yyyy 23:59:59', aDate));
    end;
end;

class function TDBUtils.QuotDShort(aDate : TDateTime): String;
begin
    result := Quot(FormatDateTime('mm/dd/yyyy', aDate));
end;

class function TDBUtils.QuotF(ANumber : Double): String;
begin
  Result := QuotedSTr(trim(FloatToStr(ANumber)));
end;

class procedure TDBUtils.RollBack;
begin
  if FDTransaction = nil then
    exit;

  if FDTransaction.Active then
    FDTransaction.RollBack;
end;

procedure TCDSHelper.AddField(AFieldName: String; AFieldType: TFieldType;
    ALength: Integer = 256; IsCalculated: Boolean = False);
var
  DTF: TDateTimeField;
  SF: TStringField;
  BF: TBlobField;
  BL: TBooleanField;
  FF: TFloatField;
  MF: TMemoField;
  F: TField;
begin
  Case aFieldType of
    ftDateTime:
      begin
        DTF           := TDateTimeField.Create(Self);
        DTF.Name      := Self.Name + 'col' + AFieldName + IntToStr(Integer(DTF));
        DTF.FieldName := AFieldName;
        DTF.DataSet   := Self;
      end;
    ftDate:
      begin
        DTF := TDateField.Create(Self);
        DTF.Name      := Self.Name + 'col' + AFieldName + IntToStr(Integer(DTF));
        DTF.FieldName := AFieldName;
        DTF.DataSet   := Self;
      end;
    ftString:
      begin
        SF            := TStringField.Create(Self);
        SF.Name       := Self.Name + 'col' + AFieldName + IntToStr(Integer(SF));
        SF.FieldName  := AFieldName;
        SF.Size       := aLength;
        SF.DataSet    := Self;
      end;
    ftBlob:
      begin
        BF            := TBlobField.Create(Self);
        BF.Name       := Self.Name + 'col' + AFieldName + IntToStr(Integer(BF));
        BF.FieldName  := AFieldName;
        BF.DataSet    := Self;
        BF.Calculated := IsCalculated;
      end;
    ftFloat:
      begin
        FF            := TFloatField.Create(Self);
        FF.Name       := Self.Name + 'col' + AFieldName + IntToStr(Integer(FF));
        FF.FieldName  := AFieldName;
        FF.DataSet    := Self;
      end;
    ftMemo:
      begin
        MF            := TMemoField.Create(Self);
        MF.Name       := Self.Name + 'col' + AFieldName + IntToStr(Integer(MF));
        MF.FieldName  := AFieldName;
        MF.Size       := aLength;
        MF.DataSet    := Self;
      end;
    ftSmallInt, ftInteger:
      begin
        F := TIntegerField.Create(Self);
        TIntegerField(F).Name       := Self.Name + 'col' + AFieldName + IntToStr(Integer(F));
        TIntegerField(F).FieldName  := AFieldName;
        TIntegerField(F).DataSet    := Self;
      end;
    ftBoolean:
      begin
        BL            := TBooleanField.Create(Self);
        BL.Name       := Self.Name + 'col' + AFieldName + IntToStr(Integer(BL));
        BL.FieldName  := AFieldName;
        BL.DataSet    := Self;
      end;
  end;

end;

function TCDSHelper.ClonedDataset(aOwner: TComponent; DisableSourceControl:
    Boolean = False): TClientDataSet;
begin
  Result := TClientDataSet.Create(aOwner);
  Result.CloneCursor(Self, True);
  if DisableSourceControl then Self.DisableControls;
end;

procedure TCDSHelper.LoadFromXLS(FileName: String; SheetIndex: Integer = 1);
Var
  XLApp, Sheet:Variant ;
  MaxRow, MaxCol,i, j:integer ;
  arrData:Variant;
  sCol: string;
begin

  XLApp := CreateOleObject('excel.application');
  XLApp.Workbooks.open(Trim(FileName)) ;
  Try
    Sheet  := XLApp.WorkSheets[SheetIndex] ;
    MaxRow := Sheet.Usedrange.EntireRow.count ;
    MaxCol := sheet.Usedrange.EntireColumn.count;
    arrData:= Sheet.UsedRange.Value;
    Self.FieldDefs.Clear;

    for i := 1 to MaxCol do
    begin
      sCol := arrData[1,i];
      sCol := StringReplace(sCol, ' ', '_', [rfReplaceAll]);
      Self.AddField(sCol , ftString);
    end;

    Self.CreateDataSet;

    for i:=2 to maxRow do
    begin
      Self.Append;
      for j:=1 to maxCol do
      begin
        Try
          Self.Fields[j-1].Value := arrData[i,j];
        except
          Raise Exception.Create('Error Baris : ' + inttostr(i)
            +' Kolom  : ' + Self.Fields[j-1].FieldName
          );
        End;
      end;
      Self.Post;
    end;
  Finally
    XLApp.Workbooks.close;
  End;
end;

procedure TCDSHelper.SetFieldFrom(DestFieldName: String; SourceDataSet:
    TDataset; SourceField: String = '');
begin
  if SourceField = '' then SourceField := DestFieldName;
  Self.FieldValues[DestFieldName] := SourceDataSet.FieldValues[SourceField];
end;

class function TDBUtils.CopyDataset(Source: TClientDataSet): TClientDataSet;
var
  i: Integer;
  lFieldName: string;
  lRecNo: Integer;
begin
  Result := TClientDataSet.Create(nil);
  Result.FieldDefs.Assign(Source.FieldDefs);
  for i := 0 to Result.FieldDefs.Count-1 do
  begin
    Result.FieldDefs[i].Required := False;
    If Result.FieldDefs[i].DataType = ftAutoInc then
      Result.FieldDefs[i].DataType := ftInteger;
  end;
  Result.CreateDataSet;
  for i := 0 to Result.Fields.Count-1 do
  begin
    Result.Fields[i].ReadOnly := False;
  end;
  lRecNo := Source.RecNo;
  Source.DisableControls;
  Try
    Source.First;
    While not Source.Eof do
    begin
      Result.Append;
      for i:=0 to Source.FieldCount-1 do
      begin
        lFieldName := Source.Fields[i].FieldName;
        Result.FieldByName(lFieldName).Value := Source.FieldByName(lFieldName).Value;
      end;
      Result.Post;

      Source.Next;
    end;
    Result.First;
  Finally
    Source.RecNo := lRecNo;
    Source.EnableControls;
  end;
end;

class function TDBUtils.ExecuteSQL(ASQL: string; DoCommit: Boolean = True):
    Boolean;
var
  Q: TFDQuery;
begin
  Result := false;
  Q := TFDQuery.Create(Application);
  Try
    try
      application.ProcessMessages;
      Q.Connection  := FDConnection;
      Q.Transaction := FDTransaction;
      Q.SQL.Clear;
      Q.SQL.Add(ASQL);

      Application.ProcessMessages;
      if not FDTransaction.Active then
        FDTransaction.StartTransaction;
      Q.ExecSQL;
      if DoCommit then Self.Commit;
      If not Result then Result := True;
    except
      Self.RollBack;
      Q.SQL.SaveToFile(ExtractFilePath(ParamStr(0)) + '\FailedExecution.log');
      raise;
    end;
  Finally
    Q.SQL.Clear;
    FreeAndNIl(Q);
  End;
end;

class function TDBUtils.PrepareQuery(ASQL: string): TFDQuery;
begin
  Result := TFDQuery.Create(Application);
  application.ProcessMessages;
  Result.Connection  := FDConnection;
  Result.Transaction := FDTransaction;
  Result.SQL.Clear;
  Result.SQL.Add(ASQL);
end;

class function TDBUtils.ExecuteSQLIdent(ASQLs: TStrings): Integer;
var
  Q: TFDQuery;
begin
//  Result := 0;
  Q := TFDQuery.Create(Application);
  Try
    try
      application.ProcessMessages;
      Q.Connection  := FDConnection;
      Q.Transaction := FDTransaction;

      Q.SQL.Clear;
      Q.SQL.Add('SET NOCOUNT ON');
      Q.SQL.AddStrings(ASQLs);
      Q.SQL.Add('Select Scope_Identity() as ID');

      Application.ProcessMessages;
      if not FDTransaction.Active then
        FDTransaction.StartTransaction;

      Q.Open;
      Result:= Q.FieldByName('ID').AsInteger;
    except
      Self.RollBack;
      Q.SQL.SaveToFile(ExtractFilePath(ParamStr(0)) + '\FailedExecution.log');
      raise;
    end;
  Finally
    Q.SQL.Clear;
    FreeAndNIl(Q);
  End;
end;

class function TDBUtils.ExecuteSQLIdent(ASQL: string): Integer;
var
  Q: TFDQuery;
begin
//  Result := 0;
  Q := TFDQuery.Create(Application);
  Try
    try
      application.ProcessMessages;
      Q.Connection  := FDConnection;
      Q.Transaction := FDTransaction;

      Q.SQL.Clear;
      Q.SQL.Add('SET NOCOUNT ON');
      Q.SQL.Add(ASQL);
      Q.SQL.Add('Select Scope_Identity() as ID');

      Application.ProcessMessages;
      if not FDTransaction.Active then
        FDTransaction.StartTransaction;

      Q.Open;
      Result:= Q.FieldByName('ID').AsInteger;
    except
      Self.RollBack;
      Q.SQL.SaveToFile(ExtractFilePath(ParamStr(0)) + '\FailedExecution.log');
      raise;
    end;
  Finally
    Q.SQL.Clear;
    FreeAndNIl(Q);
  End;
end;

class procedure TDBUtils.SetUserLogin(aUser: string);
begin
  UserLogin := aUser;
end;

class function TDBUtils.GetUserLogin: String;
begin
  Result := UserLogin;
end;

initialization
  DebugSS := TStringList.Create;

end.
