unit ufrmEndOfDay;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons,
  cxGroupBox, Vcl.ComCtrls, dxCore, cxDateUtils, dxBarBuiltInMenu, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxDBExtLookupComboBox, cxCurrencyEdit, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, cxPC, cxLabel, cxMaskEdit, cxDropDownEdit, cxCalendar,
  Datasnap.DBClient, uEndOfDay;

type
  TfrmEndOfDay = class(TfrmDefaultInput)
    cxGroupBox1: TcxGroupBox;
    dtEOD: TcxDateEdit;
    cxLabel8: TcxLabel;
    dtLast: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxPageControl1: TcxPageControl;
    tsCashOpname: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colRekening: TcxGridDBColumn;
    colSys: TcxGridDBColumn;
    colFisik: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    colVariant: TcxGridDBColumn;
    colNotes: TcxGridDBColumn;
    cxGrid1Level2: TcxGridLevel;
    cxGrdDetail: TcxGridDBTableView;
    cxGrid1Level3: TcxGridLevel;
    cxGrdDetailColumn1: TcxGridDBColumn;
    cxGrdDetailColumn2: TcxGridDBColumn;
    styleFisik: TcxStyle;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dtEODPropertiesEditValueChanged(Sender: TObject);
    procedure dtEODPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure colFisikPropertiesEditValueChanged(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure
        cxGrdDetailTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems1GetText(
        Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
        AText: string);
  private
    FCDS: TClientDataset;
    FCDSClone: TClientDataset;
    FEOD: TEndOfDay;
    FCashOpname: TCashOpname;
    FCDSDetail: TClientDataset;
    procedure CalculateAll;
    function GetCDS: TClientDataset;
    function GetCDSClone: TClientDataset;
    function GetEOD: TEndOfDay;
    function GetCashOpname: TCashOpname;
    function GetCDSDetail: TClientDataset;
    procedure InitState;
    procedure InitView;
    procedure LoadRekening;
    function ValidateData: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSClone: TClientDataset read GetCDSClone write FCDSClone;
    property EOD: TEndOfDay read GetEOD write FEOD;
    property CashOpname: TCashOpname read GetCashOpname write FCashOpname;
    property CDSDetail: TClientDataset read GetCDSDetail write FCDSDetail;
    { Private declarations }
  public
    function GetGroupName: string; override;
    procedure LoadRekapMutasi(aRekeningID: Integer);
    { Public declarations }
  end;

var
  frmEndOfDay: TfrmEndOfDay;

implementation

uses
  uDXUtils, uDBUtils, uAccount, uAppUtils, System.DateUtils;

{$R *.dfm}

procedure TfrmEndOfDay.btnSaveClick(Sender: TObject);
var
  lItem: TCashOpnameItem;
begin
  inherited;
  if not ValidateData then exit;

  if FEOD <> nil then
    FreeAndNil(FEOD);

  if FCashOpname <> nil then
    FreeAndNil(FCashOpname);

  EOD.TransDate := dtEOD.Date;
  EOD.RefNo := EOD.GenerateNo;
  EOD.ModifiedBy := UserLogin;
  EOD.ModifiedDate := Now();
  EOD.Notes := 'End Of Day Tanggal : ' + DateToStr(EOD.TransDate);

  Try
    if not EOD.SaveToDB(False) then
      raise Exception.Create('Simpan EOD Gagal');

    CashOpname := TCashOpname.Create;
    CashOpname.EndOfDay := TEndOfDay.CreateID(EOD.ID);
    CashOpname.TransDate := EOD.TransDate;
    CashOpname.RefNo := EOD.RefNo;
    CashOpname.Notes := EOD.Notes;
    CashOpname.ModifiedBy := EOD.ModifiedBy;
    CashOpname.ModifiedDate := EOD.ModifiedDate;
    CashOpname.TotalVariant := 0;
    CashOpname.Items.Clear;

    CDS.First;
    while not CDS.Eof do
    begin
      lItem := TCashOpnameItem.Create;
      lItem.SetFromDataset(CDS);
      CashOpname.Items.Add(lItem);

      CashOpname.TotalVariant := CashOpname.TotalVariant + lItem.Variant;
      CDS.Next;
    end;

    if CashOpname.SaveToDB then
    begin
      TAppUtils.Information('Berhasil Proses End Of Day : ' + DateToStr(EOD.TransDate));
      InitState;
    end;

  except
    TDBUtils.RollBack;
    Raise;
  End;


end;

procedure TfrmEndOfDay.CalculateAll;
begin
  if CDS.State in [dsInsert, dsEdit] then
    CDS.Post;

  CDSClone.First;
  while not CDSClone.Eof do
  begin
    CDSClone.Edit;
    CDSClone.FieldByName('Variant').AsFloat :=
      CDSClone.FieldByName('SaldoFisik').AsFloat - CDSClone.FieldByName('SaldoSystem').AsFloat;
    CDSClone.Post;
    CDSClone.Next;
  end;
end;

procedure TfrmEndOfDay.colFisikPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalculateAll;
end;

procedure
    TfrmEndOfDay.cxGrdDetailTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems1GetText(
    Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean; var
    AText: string);
begin
  inherited;
  AText := 'Total Saldo System';
end;

procedure TfrmEndOfDay.dtEODPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  Self.Enabled  := False;
  Self.Cursor   := crHourGlass;
  try
    LoadRekening;
  finally
    Self.Enabled  := True;
    Self.Cursor   := crDefault;
  end;
end;

procedure TfrmEndOfDay.dtEODPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if VarToDateTime(DisplayValue) <= dtLast.Date then
  begin
    Error := True;
    ErrorText := 'Tanggal End Of Day tidak boleh <= Tanggal EOD Terakhir';
  end;

  if VarToDateTime(DisplayValue) > EndOfTheDay(Now()) then
  begin
    Error := True;
    ErrorText := 'Tanggal End Of Day tidak melebihi hari ini';
  end;
end;

procedure TfrmEndOfDay.FormCreate(Sender: TObject);
begin
  inherited;
  InitView;
  InitState;
end;

function TfrmEndOfDay.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TCashOpnameItem.CreateDataSet(Self, False);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmEndOfDay.GetCDSClone: TClientDataset;
begin
  if FCDSClone = nil then
    FCDSClone := CDS.ClonedDataset(Self);
  Result := FCDSClone;
end;

function TfrmEndOfDay.GetEOD: TEndOfDay;
begin
  if FEOD = nil then
    FEOD := TEndOfDay.Create;
  Result := FEOD;
end;

function TfrmEndOfDay.GetCashOpname: TCashOpname;
begin
  if FCashOpname = nil then
    FCashOpname := TCashOpname.Create;
  Result := FCashOpname;
end;

function TfrmEndOfDay.GetCDSDetail: TClientDataset;
begin
  if FCDSDetail = nil then
  begin
    FCDSDetail := TClientDataSet.Create(Self);
    FCDSDetail.AddField('Rekening', ftInteger);
    FCDSDetail.AddField('TransName', ftString);
    FCDSDetail.AddField('Total', ftFloat);
    FCDSDetail.CreateDataSet;
  end;
  Result := FCDSDetail;
end;

function TfrmEndOfDay.GetGroupName: string;
begin
  Result := 'Manajemen';
end;

procedure TfrmEndOfDay.InitState;
var
  lEvent: TNotifyEvent;
  s: string;
begin
  dtLast.Date := 0;

  lEvent := dtEOD.Properties.OnEditValueChanged;
  Try
    dtEOD.Properties.OnEditValueChanged := nil;
    dtEOD.Date := Now();
    s := 'SELECT MAX(TRANSDATE) FROM TENDOFDAY';
    with TDBUtils.OpenQuery(S) do
    begin
      Try
        if not eof then
          dtLast.Date := Fields[0].AsDateTime;
      Finally
        Free;
      End;
    end;
    if dtLast.Date > 0 then
      dtEOD.Date := IncDay(dtLast.Date);
  Finally
    dtEOD.Properties.OnEditValueChanged := lEvent;
  End;

  dtEODPropertiesEditValueChanged(Self);
end;

procedure TfrmEndOfDay.InitView;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  cxGrdDetail.PrepareFromCDS(CDSDetail);

  cxGrdDetail.SetMasterKeyField('Rekening');
  cxGrdDetail.SetDetailKeyField('Rekening');

  TcxExtLookup(colRekening.Properties).LoadFromSQL(Self,
    'select id, nama from trekening where jenis = 0','nama'
  );
end;

procedure TfrmEndOfDay.LoadRekapMutasi(aRekeningID: Integer);
var
  S: string;
begin
  S := 'SELECT * FROM [FN_REKAPMUTASI_REKENING](' + IntToStr(aRekeningID) +','
      + TAppUtils.QuotD(dtEOD.Date)+ ','  + TAppUtils.QuotD(dtEOD.Date) + ')';

  with TDBUtils.OpenQuery(S) do
  begin
    Try
      while not eof do
      begin
        CDSDetail.Append;
        CDSDetail.FieldByName('Rekening').AsInteger   := aRekeningID;
        CDSDetail.FieldByName('TransName').AsString   := FieldByName('TransName').AsString;
        CDSDetail.FieldByName('Total').AsFloat        := FieldByName('Total').AsFloat;
        CDSDetail.Post;
        next;
      end;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmEndOfDay.LoadRekening;
var
  S: string;
begin
  CDS.EmptyDataSet;
  CDSDetail.EmptyDataSet;
  S := 'SELECT B.ID, A.BALANCE'
      +' FROM FN_SALDO_REKENING(' + TAppUtils.QuotD(dtEOD.Date)+ ',0) A'
      +' INNER JOIN TREKENING B ON A.REKENING_ID = B.ID AND B.JENIS = 0';
  with TDBUtils.OpenQuery(S) do
  begin
    Try
      while not eof do
      begin
        CDS.Append;
        CDS.FieldByName('Rekening').AsInteger   := FieldByName('ID').AsInteger;
        CDS.FieldByName('SaldoSystem').AsFloat  := FieldByName('Balance').AsFloat;
        CDS.FieldByName('SaldoFisik').AsFloat   := FieldByName('Balance').AsFloat;
        CDS.FieldByName('Variant').AsFloat      := 0;
        CDS.Post;
        LoadRekapMutasi(FieldByName('ID').AsInteger);
        next;
      end;
    Finally
      Free;
    End;
  end;
end;

function TfrmEndOfDay.ValidateData: Boolean;
begin
  Result := TAppUtils.Confirm('Anda yakin data sudah sesuai?');
end;

end.
