unit uEndOfDay;

interface

uses
  CRUDObject, uAccount, System.SysUtils, System.Generics.Collections,
  System.StrUtils, System.Classes, System.DateUtils;

type
  TCashOpnameItem = class;
  TEndOfDay = class;

  TCashOpname = class(TCRUDObject)
  private
    FItems: TObjectList<TCashOpnameItem>;
    FModifiedBy: String;
    FModifiedDate: TDateTime;
    FEndOfDay: TEndOfDay;
    FNotes: string;
    FRefNo: String;
    FTransDate: TDatetime;
    FTotalVariant: Double;
    function GetItems: TObjectList<TCashOpnameItem>;
  public
    destructor Destroy; override;
    property Items: TObjectList<TCashOpnameItem> read GetItems write FItems;
  published
    property ModifiedBy: String read FModifiedBy write FModifiedBy;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
    property EndOfDay: TEndOfDay read FEndOfDay write FEndOfDay;
    property Notes: string read FNotes write FNotes;
    [AttributeOfCode]
    property RefNo: String read FRefNo write FRefNo;
    property TransDate: TDatetime read FTransDate write FTransDate;
    property TotalVariant: Double read FTotalVariant write FTotalVariant;
  end;


  TCashOpnameItem = class(TCRUDObject)
  private
    FRekening: TRekening;
    FSaldoSystem: Double;
    FSaldoFisik: Double;
    FVariant: Double;
    FNotes: string;
    FCashOpname: TCashOpname;
  public
    destructor Destroy; override;
  published
    property Rekening: TRekening read FRekening write FRekening;
    property SaldoSystem: Double read FSaldoSystem write FSaldoSystem;
    property SaldoFisik: Double read FSaldoFisik write FSaldoFisik;
    property Variant: Double read FVariant write FVariant;
    property Notes: string read FNotes write FNotes;
    [AttributeOfHeader]
    property CashOpname: TCashOpname read FCashOpname write FCashOpname;
  end;

  TEndOfDay = class(TCRUDObject)
  private
    FModifiedBy: String;
    FModifiedDate: TDateTime;
    FNotes: string;
    FRefNo: String;
    FTransDate: TDatetime;
  protected
    function AfterSaveToDB: Boolean; override;
  public
    function GenerateNo: String;
  published
    property ModifiedBy: String read FModifiedBy write FModifiedBy;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
    property Notes: string read FNotes write FNotes;
    [AttributeOfCode]
    property RefNo: String read FRefNo write FRefNo;
    property TransDate: TDatetime read FTransDate write FTransDate;
  end;

implementation

uses
  uDBUtils, uAppUtils;

destructor TCashOpnameItem.Destroy;
begin
  inherited;
  if FRekening <> nil then FreeAndNil(FRekening);
end;

destructor TCashOpname.Destroy;
begin
  inherited;
  if FEndOfDay <> nil then FreeAndNil(FEndOfDay);
  if FItems <> nil then FreeAndNil(FItems);

end;

function TCashOpname.GetItems: TObjectList<TCashOpnameItem>;
begin
  if FItems = nil then
    FItems := TObjectList<TCashOpnameItem>.Create();
  Result := FItems;
end;

function TEndOfDay.AfterSaveToDB: Boolean;
var
  SS: TStrings;
begin
  Result := True;
  SS := TStringList.Create;
  Try
    SS.Append('UPDATE TPURCHASEINVOICE SET CLOSED = 1 WHERE ISNULL(CLOSED,0) = 0 AND TRANSDATE <= ' + TAppUtils.QuotD(Self.TransDate));
    SS.Append('UPDATE TPURCHASERETUR SET CLOSED = 1 WHERE ISNULL(CLOSED,0) = 0 AND TRANSDATE <= ' + TAppUtils.QuotD(Self.TransDate));
    SS.Append('UPDATE TSALESINVOICE SET CLOSED = 1 WHERE ISNULL(CLOSED,0) = 0 AND TRANSDATE <= ' + TAppUtils.QuotD(Self.TransDate));
    SS.Append('UPDATE TSALESRETUR SET CLOSED = 1 WHERE ISNULL(CLOSED,0) = 0 AND TRANSDATE <= ' + TAppUtils.QuotD(Self.TransDate));
    SS.Append('UPDATE TPURCHASEPAYMENT SET CLOSED = 1 WHERE ISNULL(CLOSED,0) = 0 AND TRANSDATE <= ' + TAppUtils.QuotD(Self.TransDate));
    SS.Append('UPDATE TSALESPAYMENT SET CLOSED = 1 WHERE ISNULL(CLOSED,0) = 0 AND TRANSDATE <= ' + TAppUtils.QuotD(Self.TransDate));
    SS.Append('UPDATE TCASHPAYMENT SET CLOSED = 1 WHERE ISNULL(CLOSED,0) = 0 AND TRANSDATE <= ' + TAppUtils.QuotD(Self.TransDate));
    SS.Append('UPDATE TCASHRECEIPT SET CLOSED = 1 WHERE ISNULL(CLOSED,0) = 0 AND TRANSDATE <= ' + TAppUtils.QuotD(Self.TransDate));
    SS.Append('UPDATE TCASHTRANSFER SET CLOSED = 1 WHERE ISNULL(CLOSED,0) = 0 AND TRANSDATE <= ' + TAppUtils.QuotD(Self.TransDate));
    SS.Append('UPDATE TTRANSFERSTOCK SET CLOSED = 1 WHERE ISNULL(CLOSED,0) = 0 AND TRANSDATE <= ' + TAppUtils.QuotD(Self.TransDate));

    if DateOf(Self.TransDate) = DateOf(EndOfTheYear(Self.TransDate)) then
      SS.Append('EXEC SP_ENDOFYEAR ' + TAppUtils.QuotD(Self.TransDate));

    TDBUtils.ExecuteSQL(SS, False);
  Finally
    SS.Free;
  End;

end;

function TEndOfDay.GenerateNo: String;
var
  aDigitCount: Integer;
  aPrefix: string;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  aDigitCount := 5;
  aPrefix := Cabang + '.EOD' + FormatDateTime('yymm',Now()) + '.';


  S := 'SELECT MAX(Refno) FROM TEndOfDay where Refno LIKE ' + QuotedStr(aPrefix + '%');

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

end.
