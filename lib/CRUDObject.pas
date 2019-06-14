unit CRUDObject;

interface

uses
  Rtti, SysUtils, Classes, DB, DBClient, TypInfo, uDBUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  //atrribute here
  TAttributeClass = class of TCustomAttribute;

  AttributeOfCustom = class(TCustomAttribute) //override utk custom fieldname
  private
    FCustomField: String;
  public
    constructor Create(aCustomField: string = '');
    property CustomField: String read FCustomField write FCustomField;
  end;
  AttributeOfCode = class(AttributeOfCustom)  //code/nobukti yg harus unique
  end;
  AttributeOfForeign = class(AttributeOfCustom)  //relasi dengan obj lain
  end;
  AttributeOfHeader = class(AttributeOfForeign) //relasi dengan header
  end;
  AttrUpdateDetails = class(TCustomAttribute)  //so far blm dipakai :P
  end;


  {$TYPEINFO ON}
  TCRUDObject = class;
  TLog = class;
  {$TYPEINFO OFF}

  TCRUDObjectClass = class of TCRUDObject;
  TCRUDObject = class(TObject)
  private
    FID: Integer;
    FIsShowProgress: Boolean;
    FLog: TLog;
    function GetSQLDelete: String; overload;
    function GetSQLUpdate: String;
    function GenerateDelete(aSS: TStrings = nil): TStrings;
    function GetLog: TLog;
  protected
    function AfterSaveToDB: Boolean; dynamic;
    function BeforeSaveToDB: Boolean; dynamic;
    function BeforeDeleteFromDB: Boolean; dynamic;
    function PropFromAttr(attr: TAttributeClass; WithException: Boolean = True):
        TRttiProperty;
    function FieldNameOf(aprop: TRttiProperty): String; dynamic;
    function GetCodeField: String; dynamic;
    function GetHeaderKey: String;
    function GetHeaderProperty: String;
    class function GetPrimaryField: String; dynamic;
    function GetSQLDeleteDetails(Header_ID: Integer): String; dynamic;
    function GetSQLRetrieveDetails(Header_ID: Integer): String; dynamic;
    class function GetTableName: string; dynamic;
    procedure LoadFromDataset(ADataSet: TDataset; LoadObjectList: Boolean = True);
    function LogLevel: Integer; dynamic;
    procedure PrepareDetailObject(AObjItem: TCRUDObject); dynamic;
    function QuotValue(AProp: TRttiProperty): String;
    function ValidateDelete: Boolean; dynamic;
    property Log: TLog read GetLog write FLog;
  public
    constructor Create;
    constructor CreateID(aID: Integer);
    destructor Destroy; override;
    class function CreateObjectDataSet(aClassType: TCRUDObjectClass; aOwner:
        TComponent; CreateDataSet: Boolean = True): TClientDataSet;
    class function CreateDataSet(aOwner: TComponent; CreateDataSet: Boolean =
        True): TClientDataSet;
    function SaveToDB(DoCommit: Boolean = True): Boolean; dynamic;
    function DeleteFromDB: Boolean; dynamic;
    function GetHeaderField: String;
    function GetSQLInsert: String;
    function LoadByID(AID: Integer; LoadObjectList: Boolean = True): Boolean;
    function LoadByCode(AKode: string; LoadObjectList: Boolean = True): Boolean;
    function SaveLogToDB(Transtype: string; CaptureQuery: string = ''): Boolean;
        dynamic;
    function ReLoad(LoadObjectList: Boolean = False): Boolean;
    function SaveObjectList: Boolean; dynamic;
    function ReUpdateData(DoCommit: Boolean = True): Boolean; dynamic;
    procedure SetFromDataset(ADataSet: TDataset);
    procedure UpdateToDataset(ADataSet: TDataset; RaiseException: Boolean = True);
    property IsShowProgress: Boolean read FIsShowProgress write FIsShowProgress;
  published
    function GetCodeValue: String;
    property ID: Integer read FID write FID;
  end;

  TLog = class(TObject)
  private
    FObjectClass: String;
    FObjectID: Integer;
    FUserName: String;
    FLogDate: TDateTime;
    FObjectQuery: WideString;
    FRefno: string;
    FTranstype: String;
    function GetSQLInsert: String;
    function QuotValue(AProp: TRttiProperty): String;
  protected
  public
    function SaveToDB(DoCommit: Boolean = False): Boolean;
  published
    property ObjectClass: String read FObjectClass write FObjectClass;
    property ObjectID: Integer read FObjectID write FObjectID;
    property UserName: String read FUserName write FUserName;
    property LogDate: TDateTime read FLogDate write FLogDate;
    property ObjectQuery: WideString read FObjectQuery write FObjectQuery;
    property Refno: string read FRefno write FRefno;
    property Transtype: String read FTranstype write FTranstype;
  end;

  


const
  SQL_Insert  : String = 'Insert Into %s(%s) values(%s);';
  SQL_Update  : String = 'Update %s set %s where %s;';
  SQL_Delete  : String = 'Delete From %s where %s;';
  SQL_Select  : String = 'Select %s from %s where %s';

  InsertOps   : Integer = 0;
  UpdateOps   : Integer = 1;
  DeleteOps   : Integer = 2;

implementation

uses
  StrUtils, DateUtils;

constructor TCRUDObject.Create;
begin
  inherited;
  IsShowProgress := False;
end;

constructor TCRUDObject.CreateID(aID: Integer);
begin
  inherited Create;
  Self.ID := AID;
end;

destructor TCRUDObject.Destroy;
begin
  inherited;
  if FLog <> nil then FreeAndNil(FLog);
end;

function TCRUDObject.BeforeSaveToDB: Boolean;
begin
  Result := True;
end;

function TCRUDObject.AfterSaveToDB: Boolean;
begin
  Result := True;
end;

function TCRUDObject.BeforeDeleteFromDB: Boolean;
begin
  Result := True;
end;

class function TCRUDObject.CreateObjectDataSet(aClassType: TCRUDObjectClass;
    aOwner: TComponent; CreateDataSet: Boolean = True): TClientDataSet;
var
  aFieldType: TFieldType;
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
begin
  Result := TClientDataSet.Create(aOwner);
  rt := ctx.GetType(aClassType);
  for prop in rt.GetProperties do
  begin
    If prop.Visibility <> mvPublished then continue;
    case prop.PropertyType.TypeKind of
      tkInteger : aFieldType := ftInteger;
      tkFloat :
      begin
        if CompareText('TDateTime',prop.PropertyType.Name)=0 then
          aFieldType := ftDateTime
        else
          aFieldType := ftFloat;
      end;
      tkUString, tkString : aFieldType := ftString;
      tkClass : aFieldType := ftInteger;
    else
      aFieldType := ftString;
    end;
    Result.AddField(prop.Name, aFieldType, 1000); //max
  end;
  if CreateDataSet then
    Result.CreateDataSet;
end;

class function TCRUDObject.CreateDataSet(aOwner: TComponent; CreateDataSet:
    Boolean = True): TClientDataSet;
var
  aFieldType: TFieldType;
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
begin
  Result := TClientDataSet.Create(aOwner);
  rt := ctx.GetType(Self);
  for prop in rt.GetProperties do
  begin
    If prop.Visibility <> mvPublished then continue;
    case prop.PropertyType.TypeKind of
      tkInteger : aFieldType := ftInteger;
      tkFloat :
      begin
        if CompareText('TDateTime',prop.PropertyType.Name)=0 then
          aFieldType := ftDateTime
        else
          aFieldType := ftFloat;
      end;
      tkUString, tkString : aFieldType := ftString;
      tkClass : aFieldType := ftInteger;
    else
      aFieldType := ftString;
    end;
    Result.AddField(prop.Name, aFieldType, 1000); //max
  end;
  if CreateDataSet then
    Result.CreateDataSet;
end;

function TCRUDObject.FieldNameOf(aprop: TRttiProperty): String;
var
  a: TCustomAttribute;
begin
  TRttiContext.Create();

  Result := '';
  if UpperCase(aProp.Name) = 'ID' then
    Result := Self.GetPrimaryField
  else begin
    for a in aprop.GetAttributes do
    begin
      if a.InheritsFrom(AttributeOfCustom) then
      begin
        if AttributeOfCustom(a).CustomField <> '' then
          Result := AttributeOfCustom(a).CustomField;
        Break;
      end;
    end;
    if aProp.PropertyType <> nil then
      if (Result = '') and (aProp.PropertyType.TypeKind = tkClass) then
        Result := aProp.Name + '_ID';

    if Result = '' then Result := aProp.Name;
  end;
end;

function TCRUDObject.GetCodeField: String;
var
  lProp: TRttiProperty;
begin
  lProp   := PropFromAttr(AttributeOfCode);
  Result  := FieldNameOf(lProp);
end;

function TCRUDObject.GetCodeValue: String;
var
  ctx : TRttiContext;
begin
  ctx.GetType(Self.ClassType); //must use this line before calling GetValue(Self) after Delphi.Berlin... or u get AV
  Result  := PropFromAttr(AttributeOfCode).GetValue(Self).AsString;
end;

function TCRUDObject.GetHeaderField: String;
var
  lProp: TRttiProperty;
begin
  lProp  := Self.PropFromAttr(AttributeOfHeader);
  Result := Self.FieldNameOf( lProp );
end;

function TCRUDObject.GetHeaderKey: String;
var
  ctx : TRttiContext;
begin
  ctx.GetType(Self.ClassType); //must use this line before calling GetValue(Self) after Delphi.Berlin... or u get AV
  Result := PropFromAttr(AttributeOfHeader).GetValue(Self).AsString;
end;

function TCRUDObject.GetHeaderProperty: String;
var
  lProp: TRttiProperty;
begin
  Result := '';
  lProp := PropFromAttr(AttributeOfHeader);
  if Assigned(lProp) then Result := lProp.Name;
end;

class function TCRUDObject.GetPrimaryField: String;
begin
  Result := 'ID';
end;

function TCRUDObject.GetSQLDelete: String;
var
  sFilter : String;
begin
  sFilter := Self.GetPrimaryField + ' = ' + IntToStr(Self.ID);
  Result  := Format(SQL_Delete,[Self.GetTableName,sFilter]);
end;

function TCRUDObject.GetSQLInsert: String;
var
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
  FieldValues : string;
  FieldNames: String;
begin
  FieldValues := '';
  FieldNames  := '';

//  if AObject.ID = '' then AObject.ID := TCRUDObject.GetNextIDGUIDToString();

  rt := ctx.GetType(Self.ClassType);
  for prop in rt.GetProperties do
  begin
    If prop.Visibility <> mvPublished then continue;

    if (UpperCase(prop.Name) = 'ID') then
      continue;

    If FieldNames <> '' then FieldNames := FieldNames + ',';
    If FieldValues <> '' then FieldValues := FieldValues + ',';

    FieldNames  := FieldNames + Self.FieldNameOf(prop);
    FieldValues   := FieldValues + Self.QuotValue(prop);
  end;

  Result :=  Format(SQL_Insert,[Self.GetTableName,FieldNames, FieldValues]);
end;

function TCRUDObject.GetSQLUpdate: String;
var
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
  UpdateVal : string;
  FieldName : String;
  sFilter : String;
begin
  UpdateVal := '';

  rt := ctx.GetType(Self.ClassType);
  for prop in rt.GetProperties do
  begin
    if UpperCase(prop.Name) = 'ID' then continue;
    If prop.Visibility <> mvPublished then continue;

    FieldName  := Self.FieldNameOf(prop);

    If UpdateVal <> '' then UpdateVal := UpdateVal + ',';
    UpdateVal := UpdateVal + FieldName + ' = ' + Self.QuotValue(prop)
  end;

  sFilter   := '';

  sFilter := Self.GetPrimaryField + ' = ' + IntToStr(Self.ID);
  Result := Format(SQL_Update,[Self.GetTableName,UpdateVal,sFilter]);
end;

function TCRUDObject.PropFromAttr(attr: TAttributeClass; WithException: Boolean =
    True): TRttiProperty;
var
  a: TCustomAttribute;
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
begin
  Result := nil;
  rt := ctx.GetType(Self.ClassType);
  for prop in rt.GetProperties do
  begin
    If prop.Visibility <> mvPublished then continue;
    for a in prop.GetAttributes do
    begin
      if a is attr then
      begin
        Result := prop;
        break;
      end;
    end;
    if Result <> nil then break;
  end;

  if (Result = nil) and (WithException) then
    raise Exception.Create(
      'Attribute : ' + attr.ClassName + ' can''t be found in '
      + Self.ClassName
    );

  if Result.PropertyType = nil then
    raise Exception.Create('NIL');
end;

function TCRUDObject.QuotValue(AProp: TRttiProperty): String;
var
  lDate: TDateTime;
  lObj: TObject;
begin
  If LowerCase(AProp.PropertyType.Name) = LowerCase('TDateTime') then
  begin
    lDate := AProp.GetValue(Self).AsExtended;
    Result :=  QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss',lDate));
  end else begin
    case AProp.PropertyType.TypeKind of
      tkInteger, tkInt64:
        Result := InttoStr(AProp.GetValue(Self).AsInteger);
      tkFloat:
        Result := FloatToStr(AProp.GetValue(Self).AsExtended);
      tkString, tkLString, tkUString, tkChar, tkWString, tkVariant:
        Result := QuotedStr(AProp.GetValue(Self).AsString);
      tkEnumeration:
        Result := BoolToStr(AProp.GetValue(Self).AsBoolean);
      tkClass:
        begin
          Result := 'NULL';
          lObj := AProp.GetValue(Self).AsObject;
          if lObj <> nil then
            if lObj.InheritsFrom(TCRUDObject) then
            begin
              Result := IntToStr(TCRUDObject(lObj).ID);
              if Result = '0' then
                Result := 'NULL'; //constraint check
            end;
        end
    else
      Raise Exception.Create(
        'Property Type tidak terdaftar atas ' + Self.ClassName + ',' + AProp.Name);
    end;
  end;
end;

class function TCRUDObject.GetTableName: string;
begin
  Result := Self.ClassName;
end;

function TCRUDObject.SaveObjectList: Boolean;
var
  a: TCustomAttribute;
  ctx           : TRttiContext;
  DoUpdateDetails: Boolean;
  meth          : TRttiMethod;
  prop          : TRttiProperty;
  rt            : TRttiType;
  i             : Integer;
  IDItems: string;
  lHeaderProp   : TRttiProperty;
  lObj          : TObject;
  lObjClassItem : TCRUDObjectClass;
  lObjectList   : TObject;
  lObjItem      : TCRUDObject;
  lObjItem2: TCRUDObject;
  rtItem        : TRttiType;
  sGenericItemClassName : string;
  value, value2 : TValue;
begin
  Result        := False;
  ctx           := TRttiContext.Create();
  rt            := ctx.GetType(Self.ClassType);
//  for prop in rt.GetDeclaredProperties do  //looping objectlist
  for prop in rt.GetProperties do
  begin
//    if prop.Visibility = mvPrivate then exit; //abaikan private objectlist
    If prop.PropertyType.TypeKind = tkClass then
    begin
      meth := prop.PropertyType.GetMethod('ToArray');
      if Assigned(meth) then  //object list
      begin
        value   := prop.GetValue(Self);
        value2  := meth.Invoke(value, []);
        Assert(value2.IsArray);

        //get class of TObjectList
        lObjectList           := value.AsObject;
        sGenericItemClassName :=  StringReplace(lObjectList.ClassName, 'TOBJECTLIST<','', [rfIgnoreCase]);
        sGenericItemClassName :=  StringReplace(sGenericItemClassName, '>','', [rfIgnoreCase]);
        rtItem                := ctx.FindType(sGenericItemClassName);
        if not rtItem.AsInstance.MetaclassType.InheritsFrom(TCRUDObject) then continue;
        lObjClassItem         := TCRUDObjectClass( rtItem.AsInstance.MetaclassType );

        //delete first

        DoUpdateDetails := False;

        lObjItem := lObjClassItem.Create;
        Try
          for a in ctx.GetType(lObjItem.ClassType).GetAttributes do
            if a is AttrUpdateDetails then
              DoUpdateDetails := True;

          if not DoUpdateDetails then
          begin
            PrepareDetailObject(lObjItem);
            TDBUtils.ExecuteSQL(lObjItem.GetSQLDeleteDetails(Self.ID) , False )
          end else
          begin
            IDItems := '-1';
            for i := 0 to value2.GetArrayLength - 1 do
            begin
              lObj := value2.GetArrayElement(i).AsObject;
              If not lObj.ClassType.InheritsFrom(TCRUDObject) then continue;
              lObjItem2 := TCRUDObject(lObj);
              if lObjItem2 = nil then continue;

              if lObjItem2.ID > 0 then
              begin
                if IDItems <> '' then IDItems := IDItems + ',';
                IDItems := IDItems + IntToStr(lObjItem2.ID);
              end;
            end;
//            if IDItems <> '' then
//            begin
              TDBUtils.ExecuteSQL(
                Format(SQL_Delete,[lObjItem.GetTableName,
                  lObjItem.GetHeaderField + '=' + IntToStr(Self.ID)
                  + ' and ' + lObjItem.GetPrimaryField + ' not in('+ IDItems +')'
                  ])
              , False);
//            end;

          end;
        Finally
          lObjItem.Free;
        End;

//        if IsShowProgress then
//          cShowProgressDlg('Save ' + lObjClassItem.ClassName, value2.GetArrayLength);


        for i := 0 to value2.GetArrayLength - 1 do
        begin
          lObj := value2.GetArrayElement(i).AsObject;
          If not lObj.ClassType.InheritsFrom(TCRUDObject) then continue;
          lObjItem := TCRUDObject(lObj);
          if lObjItem = nil then continue;

          lHeaderProp := lObjItem.PropFromAttr(AttributeOfHeader);

          if lHeaderProp <> nil then
          begin
            if lHeaderProp.PropertyType.TypeKind = tkClass then
              lHeaderProp.SetValue(lObjItem, Self)
            else
              lHeaderProp.SetValue(lObjItem, Self.ID); //jika bertipe selain class , ex integer
          end;


          If not DoUpdateDetails then
            lObjItem.ID := 0;

          PrepareDetailObject(lObjItem);
          if not lObjItem.SaveToDB(False) then
            Raise Exception.Create('Object Item SaveToDB failed');

//          if IsShowProgress then cStepProgressDlg;
        end;



//        if IsShowProgress then cStopProgressDlg;
      end;
    end;
  end;
  If not Result then Result := True;
end;

function TCRUDObject.GenerateDelete(aSS: TStrings = nil): TStrings;
var
  ctx : TRttiContext;
  meth  : TRttiMethod;
  prop  : TRttiProperty;
  rt, rtItem  : TRttiType;
  i : Integer;
  lObj  : TObject;
  lObjItem, lAppItem: TCRUDObject;
  SQL: string;
  value, value2 : TValue;
  lAppClass : TCRUDObjectClass;
  lObjectList: TObject;
  sGenericItemClassName: string;
begin
  Result := aSS;
  if Result = nil then  Result := TStringList.Create;
  ctx  := TRttiContext.Create();
  rt := ctx.GetType(Self.ClassType);

//  for prop in rt.GetDeclaredProperties do  //looping objectlist
  for prop in rt.GetProperties do
  begin
    If not Assigned(prop) then continue;
    If prop.PropertyType.TypeKind = tkClass then
    begin
      meth := prop.PropertyType.GetMethod('ToArray');
      if Assigned(meth) then  //object list
      begin
        lObjectList := prop.GetValue(Self).AsObject;
        value   := prop.GetValue(Self);
        value2  := meth.Invoke(value, []);
        Assert(value2.IsArray);
        for i := 0 to value2.GetArrayLength - 1 do
        begin
          lObj := value2.GetArrayElement(i).AsObject;
          If not lObj.ClassType.InheritsFrom(TCRUDObject) then continue;
          lObjItem := TCRUDObject(lObj);
          if i = 0 then  //delete all where header;
          begin
//            SQL := Format(SQL_Delete,[lObjItem.GetTableName,
//              lObjItem.GetHeaderField + ' = ' + IntToStr(Self.ID) ]);

            //diganti coding dibawah utk delete item ttransdetail juga
            sGenericItemClassName := StringReplace(lObjectList.ClassName, 'TOBJECTLIST<','', [rfIgnoreCase]);
            sGenericItemClassName := StringReplace(sGenericItemClassName, '>','', [rfIgnoreCase]);
            rtItem                := ctx.FindType(sGenericItemClassName);
            lAppClass             := TCRUDObjectClass( rtItem.AsInstance.MetaclassType );
            lAppItem              := lAppClass.Create;
            PrepareDetailObject(lAppitem);
            SQL                   := lAppItem.GetSQLDeleteDetails(Self.ID);   //force using descendant method
            Result.Add(SQL);
            lAppItem.Free;

          end;
          //if item has objectlist
          lObjItem.GenerateDelete(Result);
        end;
      end;
    end;
  end;
  Result.Add( Self.GetSQLDelete );

end;

function TCRUDObject.SaveToDB(DoCommit: Boolean = True): Boolean;
var
  IsNewTrans: Boolean;
  DoSaveLog: Boolean;
  LastSQL: string;
  sTransType: string;
begin
  Result := False;
  IsNewTrans := True;

  Try
    if not BeforeSaveTODB then
      Raise Exception.Create('Before Save To DB Failed');

    IsNewTrans    := Self.ID <= 0;
    DoSaveLog       := LogLevel = 1;

    If IsNewTrans then
    begin
      sTransType  := 'Insert';
      LastSQL     := Self.GetSQLInsert;
      Self.ID     := TDBUtils.ExecuteSQLIdent(LastSQL);
    end else
    begin
      sTransType  := 'Update';
      LastSQL     := Self.GetSQLUpdate;
      TDBUtils.ExecuteSQL(LastSQL, False);

      DoSaveLog     := LogLevel in [1,2]; //all or update and delete only
    end;

//    if not BeforeSaveObjectList then
//      Raise Exception.Create('Before Save ObjectList Failed');

    if not SaveObjectList then
      Raise Exception.Create('Save ObjectList Failed');

    if not AfterSaveTODB then
      Raise Exception.Create('Before Save To DB Failed');

    //save Log


    if DoSaveLog then
      if not SaveLogToDB(sTransType, LastSQL) then
        Raise Exception.Create('Save Log To DB Failed');

    if DoCommit then
      TDBUtils.Commit;

    if not Result then Result := True;
  except
    TDBUtils.RollBack;

    //jika sebelumnya IsNewTrans , kembalikan id = 0
    //bug terjadi , simpan pertama error, simpan berikutnya tidak error, detail diinsert,
    //sedangkan header yg blm tersimpan mjd update
    if IsNewTrans then Self.ID := 0;

    Raise;
  End;
end;

function TCRUDObject.DeleteFromDB: Boolean;
var
  lSS: TStrings;
begin
  Result := False;
  if not ValidateDelete then exit;

  lSS := TStringList.Create;
  Try
    Try
      if not BeforeDeleteFromDB then
        Raise Exception.Create('Before Delete DB Failed');

      lSS := Self.GenerateDelete;

      //for log purpose
      if LogLevel in [1,2] then
      begin
        Self.SaveLogToDB('Delete', Self.GetSQLDelete);
      end;

      Result := TDBUtils.ExecuteSQL(lSS, True);
    except
      TDBUtils.RollBack;
      Raise;
    End;
  Finally
    lSS.Free;
  End;
end;

function TCRUDObject.GetLog: TLog;
begin
  if FLog = nil then
    FLog := TLog.Create;

  Result := FLog;
end;

function TCRUDObject.GetSQLDeleteDetails(Header_ID: Integer): String;
var
  sFilter : String;
begin
  if UpperCase(Self.GetTableName) = 'TTRANSDETAIL' then
    Raise Exception.Create('Must override GetSQLDeleteDetails for TTRANSDETAIL');

  sFilter := Self.GetHeaderField + ' = ' + IntToStr(Header_ID);
  Result  := Format(SQL_Delete,[Self.GetTableName,sFilter]);
end;

function TCRUDObject.GetSQLRetrieveDetails(Header_ID: Integer): String;
var
//  lPO: TCRUDPOItem;
  sFilter : String;
begin
  if UpperCase(Self.GetTableName) = 'TTRANSDETAIL' then
    Raise Exception.Create('Must override GetSQLRetrieveDetails for TTRANSDETAIL');

  sFilter := Self.GetHeaderField + ' = ' + IntToStr(Header_ID);
  Result  := Format(SQL_Select,['*', Self.GetTableName,sFilter]);
//
//  lPO := TCRUDPOItem.Create;
//  Result := Result + lPO.GetHeaderField;
end;

procedure TCRUDObject.LoadFromDataset(ADataSet: TDataset; LoadObjectList:
    Boolean = True);
var
  sSQL : string;
  ctx : TRttiContext;
  FieldName : string;
  lAppObject : TCRUDObject;
  lAppObjectItem : TCRUDObject;
  lAppClass : TCRUDObjectClass;
  lObjectList: TObject;
  rt, rtItem : TRttiType;
  prop : TRttiProperty;
  meth : TRttiMethod;
  Q : TFDQuery;
  sGenericItemClassName: string;
begin
  rt := ctx.GetType(Self.ClassType);
  if not ADataSet.IsEmpty then
  begin
    for prop in rt.GetProperties() do
    begin
      if (not prop.IsWritable) then Continue;
      FieldName := Self.FieldNameOf(prop);

      FieldName := StringReplace(FieldName, '[', '', [rfReplaceAll]);
      FieldName := StringReplace(FieldName, ']', '', [rfReplaceAll]);

      //published has fields on dataset
      if prop.Visibility = mvPublished then
      begin
        If (ADataSet.FieldByName(FieldName).DataType in [ftDate,ftDateTime,ftTimeStamp]) then
          prop.SetValue(Self,TValue.From<TDateTime>(ADataSet.FieldByName(FieldName).AsDateTime))
        else begin
          case prop.PropertyType.TypeKind of
            tkInteger : prop.SetValue(Self,ADataSet.FieldByName(FieldName).AsInteger );
            tkFloat   : prop.SetValue(Self,ADataSet.FieldByName(FieldName).AsFloat );
            tkUString : prop.SetValue(Self,ADataSet.FieldByName(FieldName).AsString );
            tkClass   :
            begin
              if ADataSet.FieldByName(FieldName).AsInteger > 0 then
              begin
                meth := prop.PropertyType.GetMethod('ToArray');
                if not Assigned(meth) then //bukan obj list
                begin
                  if not prop.PropertyType.AsInstance.MetaclassType.InheritsFrom(TCRUDObject) then continue;
                  meth            := prop.PropertyType.GetMethod('Create');
                  lAppObject      := TCRUDObject(meth.Invoke(prop.PropertyType.AsInstance.MetaclassType, []).AsObject);
                  lAppObject.ID   := ADataSet.FieldByName(FieldName).AsInteger;
                  prop.SetValue(Self, lAppObject);
                end;
              end;
            end;
          else
            prop.SetValue(Self,TValue.FromVariant(ADataSet.FieldValues[FieldName]) );
          end;
        end;
      end else If LoadObjectList then //public object list
      begin
        if prop.PropertyType.TypeKind = tkClass then
        begin
          meth := prop.PropertyType.GetMethod('ToArray');
          if Assigned(meth) then
          begin
            lObjectList := prop.GetValue(Self).AsObject;
            if lObjectList = nil then continue;

            //clear first;
            meth := prop.PropertyType.GetMethod('Clear');
            if Assigned(meth) then
              meth.Invoke(lObjectList,[]);

            sGenericItemClassName := StringReplace(lObjectList.ClassName, 'TOBJECTLIST<','', [rfIgnoreCase]);
            sGenericItemClassName := StringReplace(sGenericItemClassName, '>','', [rfIgnoreCase]);
            rtItem := ctx.FindType(sGenericItemClassName);

            meth := prop.PropertyType.GetMethod('Add');
            if Assigned(meth) and Assigned(rtItem) then
            begin
              //sayangny utk akses rtti object harus ada dulu, jadi create dulu
              if not rtItem.AsInstance.MetaclassType.InheritsFrom(TCRUDObject) then continue;
              lAppClass       := TCRUDObjectClass( rtItem.AsInstance.MetaclassType );
              lAppObjectItem  := lAppClass.Create;

              PrepareDetailObject(lAppObjectItem); //contoh isi header_flag transdetail

              sSQL := lAppObjectItem.GetSQLRetrieveDetails(ADataSet.FieldByName(Self.GetPrimaryField).AsInteger);
//              sSQL := 'select * from ' + lAppObjectItem.GetTableName
//                    + ' where ' + lAppObjectItem.GetHeaderField
//                    + ' = ' + IntToStr(ADataSet.FieldByName(Self.GetPrimaryField).AsInteger);
              lAppObjectItem.Free;
              Q := TDBUtils.OpenQuery(sSQL);
              try
                while not Q.Eof do
                begin
                  lAppObjectItem := lAppClass.Create;
                  lAppObjectItem.LoadFromDataset(Q);
                  meth.Invoke(lObjectList,[lAppObjectItem]);
                  Q.Next;
                end;
              finally
                Q.Free;
              end;
            end;
          end;
        end;  //object list assignment
      end;  //prop.visibility check
    end;
  end;
end;

function TCRUDObject.LoadByID(AID: Integer; LoadObjectList: Boolean = True):
    Boolean;
var
  Q: TFDQuery;
  sSQL: string;
begin
  Result := False;
  if AID <= 0 then exit;

  sSQL := Format(SQL_Select,['*', Self.GetTableName, Self.GetPrimaryField
    + ' = ' + IntToStr(AID) ]);
  Q := TDBUtils.OpenQuery(sSQL);
  Try
    if Q.Eof then exit;
    Self.LoadFromDataset(Q, LoadObjectList);
    if not Result then Result := True;
  Finally
    FreeAndNil(Q);
  End;
end;

function TCRUDObject.LoadByCode(AKode: string; LoadObjectList: Boolean = True):
    Boolean;
var
  Q: TFDQuery;
  sSQL: string;
begin
  Result := False;
  if AKode = '' then exit;

  sSQL := Format(SQL_Select,['*', Self.GetTableName, Self.GetCodeField
    + ' = ' + QuotedStr(AKode) ]);
  Q := TDBUtils.OpenQuery(sSQL);
  Try
    if Q.Eof then exit;
    Self.LoadFromDataset(Q, LoadObjectList);
    if not Result then Result := True;
  Finally
    FreeAndNil(Q);
  End;
end;

function TCRUDObject.LogLevel: Integer;
begin
  Result := 0; //no log
  //1 : all
  //2 : update and delete only
 end;

function TCRUDObject.SaveLogToDB(Transtype: string; CaptureQuery: string = ''):
    Boolean;
begin
  Log.ObjectClass   := Self.ClassName;
  Log.ObjectID      := Self.ID;
  Log.UserName      := TDBUtils.GetUserLogin;
  Log.LogDate       := Now();
  Log.ObjectQuery   := CaptureQuery;
  Log.Transtype     := Transtype;

  if Self.PropFromAttr(AttributeOfCode,False) <> nil then
    Log.Refno       := Self.GetCodeValue;

  Result            := Log.SaveToDB();
end;

procedure TCRUDObject.PrepareDetailObject(AObjItem: TCRUDObject);
begin
  // TODO -cMM: TCRUDObject.PrepareDetailObject default body inserted
end;

function TCRUDObject.ReLoad(LoadObjectList: Boolean = False): Boolean;
begin
  Result := Self.LoadByID(Self.ID, LoadObjectList);
end;

function TCRUDObject.ReUpdateData(DoCommit: Boolean = True): Boolean;
var
  S: string;
begin
  Result := True;
  if Self.ID = 0 then
    raise Exception.Create(Self.ClassName +  ' ID = 0 cant use ReUpdateData');

  S := Self.GetSQLUpdate;
  TDBUtils.ExecuteSQL(S, DoCommit);
end;

procedure TCRUDObject.SetFromDataset(ADataSet: TDataset);
var
  ctx : TRttiContext;
  FieldName : string;
  lAppObject : TCRUDObject;
  rt : TRttiType;
  prop : TRttiProperty;
  meth : TRttiMethod;
begin
  rt := ctx.GetType(Self.ClassType);
  if not ADataSet.IsEmpty then
  begin
    for prop in rt.GetProperties() do
    begin
      if (not prop.IsWritable) then Continue;
//      If UsingFieldName then
//        FieldName := Self.FieldNameOf(prop)
//      else
        FieldName := prop.Name;

      //published has fields on dataset
      if prop.Visibility <> mvPublished then continue;
      If (ADataSet.FieldByName(FieldName).DataType in [ftDate,ftDateTime,ftTimeStamp]) then
      begin
        prop.SetValue(Self,TValue.From<TDateTime>(ADataSet.FieldByName(FieldName).AsDateTime));
      end else
      begin
        case prop.PropertyType.TypeKind of
          tkInteger : prop.SetValue(Self,ADataSet.FieldByName(FieldName).AsInteger );
          tkFloat   : prop.SetValue(Self,ADataSet.FieldByName(FieldName).AsFloat );
          tkUString : prop.SetValue(Self,ADataSet.FieldByName(FieldName).AsString );
          tkClass   : begin
                        if ADataSet.FieldByName(FieldName).AsInteger > 0 then
                        begin
                          meth := prop.PropertyType.GetMethod('ToArray');
                          if not Assigned(meth) then
                          begin
                            meth          := prop.PropertyType.GetMethod('Create');
                            lAppObject    := TCRUDObject(meth.Invoke(
                              prop.PropertyType.AsInstance.MetaclassType, []).AsObject);
                            lAppObject.ID := ADataSet.FieldByName(FieldName).AsInteger;
                            prop.SetValue(Self, lAppObject);
                          end;
                        end;
                      end;
        else
          prop.SetValue(Self,TValue.FromVariant(ADataSet.FieldValues[FieldName]) );
        end;
      end;
    end;
  end;

end;

procedure TCRUDObject.UpdateToDataset(ADataSet: TDataset; RaiseException:
    Boolean = True);
var
  ctx : TRttiContext;
  lObj: TObject;
  rt : TRttiType;
  prop : TRttiProperty;
begin
  rt := ctx.GetType(Self.ClassType);
  for prop in rt.GetProperties do
  begin
    If prop.Visibility <> mvPublished then continue;

    if ADataSet.FindField(prop.Name) = nil then
    begin
      if RaiseException then
        Raise Exception.Create('FieldByName ' + prop.Name +  ' not found at Dataset : ' + ADataset.Name)
      else
        continue;
    end;

    case prop.PropertyType.TypeKind of
      tkInteger, tkInt64 :
        ADataSet.FieldByName(prop.Name).AsInteger := prop.GetValue(Self).AsInteger;
      tkFloat :
        ADataSet.FieldByName(prop.Name).AsFloat := prop.GetValue(Self).AsExtended;
      tkUString :
        ADataSet.FieldByName(prop.Name).AsString := prop.GetValue(Self).AsString;
      tkClass :
      begin
        lObj := prop.GetValue(Self).AsObject;
        if lObj = nil then continue;
        if lObj.InheritsFrom(TCRUDObject) then
          ADataSet.FieldByName(prop.Name).AsInteger := TCRUDObject(lObj).ID;
      end
    else
      ADataSet.FieldByName(prop.Name).AsVariant := prop.GetValue(Self).AsVariant
    end;
  end;
end;

function TCRUDObject.ValidateDelete: Boolean;
begin
  Result := True;
end;

constructor AttributeOfCustom.Create(aCustomField: string = '');
begin
  Self.CustomField := aCustomField;
end;

function TLog.GetSQLInsert: String;
var
  ctx : TRttiContext;
  rt : TRttiType;
  prop : TRttiProperty;
  FieldValues : string;
  FieldNames: String;
begin
  FieldValues := '';
  FieldNames  := '';

//  if AObject.ID = '' then AObject.ID := TLog.GetNextIDGUIDToString();

  rt := ctx.GetType(Self.ClassType);
  for prop in rt.GetProperties do
  begin
    If prop.Visibility <> mvPublished then continue;

    if (UpperCase(prop.Name) = 'ID') then
      continue;

    If FieldNames <> '' then FieldNames := FieldNames + ',';
    If FieldValues <> '' then FieldValues := FieldValues + ',';

    FieldNames  := FieldNames + prop.Name;
    FieldValues   := FieldValues + Self.QuotValue(prop);
  end;

  Result :=  Format(SQL_Insert,[Self.ClassName,FieldNames, FieldValues]);
end;

function TLog.QuotValue(AProp: TRttiProperty): String;
var
  lDate: TDateTime;
begin
  If LowerCase(AProp.PropertyType.Name) = LowerCase('TDateTime') then
  begin
    lDate := AProp.GetValue(Self).AsExtended;
    Result :=  QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss',lDate));
  end else begin
    case AProp.PropertyType.TypeKind of
      tkInteger, tkInt64:
        Result := InttoStr(AProp.GetValue(Self).AsInteger);
      tkFloat:
        Result := FloatToStr(AProp.GetValue(Self).AsExtended);
      tkString, tkLString, tkUString, tkChar, tkWString, tkVariant:
        Result := QuotedStr(AProp.GetValue(Self).AsString);
      tkEnumeration:
        Result := BoolToStr(AProp.GetValue(Self).AsBoolean);
    else
      Raise Exception.Create(
        'Property Type tidak terdaftar atas ' + Self.ClassName + ',' + AProp.Name);
    end;
  end;
end;

function TLog.SaveToDB(DoCommit: Boolean = False): Boolean;
begin
  Result := False;
  Try
    TDBUtils.ExecuteSQL(Self.GetSQLInsert, False);
    if DoCommit then TDBUtils.Commit;
    if not Result then Result := True;
  except
    TDBUtils.RollBack;
    Raise;
  End;
end;

end.
