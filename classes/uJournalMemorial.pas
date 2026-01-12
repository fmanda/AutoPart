unit uJournalMemorial;

interface

uses
  CRUDObject, uItem, System.Generics.Collections,
  cxDateUtils;

type
  TJournalMemorial = class;
  TJournalDetail = class;

  TJournalMemorial = class(TCRUDObject)
  private
    FRefno: String;
    FTransDate: TDatetime;
    FItems: TObjectList<TJournalDetail>;
    FNotes: String;
    FModifiedBy: String;
    FModifiedDate: TDateTime;
    function GetItems: TObjectList<TJournalDetail>;
  protected
  public
    destructor Destroy; override;
    function GenerateNo: String;
    property Items: TObjectList<TJournalDetail> read GetItems write FItems;
  published
    [AttributeOfCode]
    property Refno: String read FRefno write FRefno;
    property TransDate: TDatetime read FTransDate write FTransDate;
    property Notes: String read FNotes write FNotes;
    property ModifiedBy: String read FModifiedBy write FModifiedBy;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
  end;


  TJournalDetail = class(TCRUDObject)
  private
    FRefNo: String;
    FTransDate: TDateTime;
    FDescription: String;
    FAccountCode: String;
    FCostCenter: String;
    FDebet: Double;
    FCredit: Double;
    FFlagNo: Integer;
    FIs_Memorial: Integer;
    FJournalMemorial: TJournalMemorial;
    FModifiedDate: TDateTime;
    FModifiedBy: string;
  protected
    class function GetTableName: string; override;
    function GetSQLDeleteDetails(Header_ID: Integer): String; override;
    function GetSQLRetrieveDetails(Header_ID: Integer): String; override;
  public
    constructor Create;
  published
    property RefNo: String read FRefNo write FRefNo;
    property TransDate: TDateTime read FTransDate write FTransDate;
    property Description: String read FDescription write FDescription;
    property AccountCode: String read FAccountCode write FAccountCode;
    property CostCenter: String read FCostCenter write FCostCenter;
    property Debet: Double read FDebet write FDebet;
    property Credit: Double read FCredit write FCredit;
    property FlagNo: Integer read FFlagNo write FFlagNo;
    property Is_Memorial: Integer read FIs_Memorial write FIs_Memorial;
    [AttributeOfHeader]
    property JournalMemorial: TJournalMemorial read FJournalMemorial write
        FJournalMemorial;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
    property ModifiedBy: string read FModifiedBy write FModifiedBy;
  end;


implementation

uses
  uDBUtils, System.DateUtils, System.SysUtils, System.StrUtils;

destructor TJournalMemorial.Destroy;
begin
  inherited;
  if FItems <> nil then FItems.Free;
end;

function TJournalMemorial.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 4;
  aPrefix := Cabang + '.JM' + FormatDateTime('yymm',Now()) + '.';


  S := 'SELECT MAX(RefNo) FROM TJournalMemorial where Refno LIKE ' + QuotedStr(aPrefix + '%');

  with TDBUtils.OpenQuery(S) do
  begin
    Try
      if not eof then
        TryStrToInt(RightStr(Fields[0].AsString, aDigitCount), lNum);
    Finally
      Free;
    End;
  end;

  inc(lNum);
  Result := aPrefix + RightStr('00000' + IntToStr(lNum), aDigitCount);
end;

function TJournalMemorial.GetItems: TObjectList<TJournalDetail>;
begin
  if FItems = nil then
    FItems := TObjectList<TJournalDetail>.Create();
  Result := FItems;
end;

constructor TJournalDetail.Create;
begin
  inherited;
  Self.Is_Memorial := 1;
end;

class function TJournalDetail.GetTableName: string;
begin
  Result := 'TJournal'
end;

function TJournalDetail.GetSQLDeleteDetails(Header_ID: Integer): String;
var
  sFilter : String;
begin
  sFilter := 'IS_Memorial = 1 AND JournalMemorial_ID = ' + IntToStr(Header_ID);
  Result  := Format(SQL_Delete,[Self.GetTableName,sFilter]);
end;

function TJournalDetail.GetSQLRetrieveDetails(Header_ID: Integer): String;
var
  sFilter : String;
begin
  sFilter := 'IS_Memorial = 1 AND JournalMemorial_ID = ' + IntToStr(Header_ID);
  Result  := Format(SQL_Select,['*', Self.GetTableName,sFilter]);
end;

end.
