unit ufrmJournalMemorial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons, cxGroupBox, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB,
  cxDBData, cxButtonEdit, cxCalendar, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxDropDownEdit, cxMaskEdit, cxMemo, cxTextEdit, cxLabel, Datasnap.DBClient, uTransDetail,
  cxGridDBDataDefinitions, uItem, cxDataUtils, uAppUtils, cxSpinEdit,
  dxBarBuiltInMenu, cxPC, uJournalMemorial;

type
  TfrmJournalMemorial = class(TfrmDefaultInput)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edRefno: TcxTextEdit;
    cxLabel6: TcxLabel;
    edNotes: TcxMemo;
    dtTransDate: TcxDateEdit;
    cxLabel8: TcxLabel;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    clAccount: TcxGridDBColumn;
    clDescription: TcxGridDBColumn;
    clDebet: TcxGridDBColumn;
    cxGrid1Level2: TcxGridLevel;
    clCredit: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure clDebetPropertiesEditValueChanged(Sender: TObject);
    procedure clCreditPropertiesEditValueChanged(Sender: TObject);
  private
    FJournalMemorial: TJournalMemorial;
    FCDS: TClientDataset;
    function GetJournalMemorial: TJournalMemorial;
    function GetCDS: TClientDataset;
    procedure InitView;
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    { Private declarations }
  public
    function GetGroupName: string; override;
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = False);
    property JournalMemorial: TJournalMemorial read GetJournalMemorial write
        FJournalMemorial;
    { Public declarations }
  end;

var
  frmJournalMemorial: TfrmJournalMemorial;

implementation

uses
  uDBUtils, uDXUtils, System.DateUtils,
  ufrmCXServerLookup, uSupplier, uAccount, uVariable, ufrmCXLookup;

{$R *.dfm}

procedure TfrmJournalMemorial.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if JournalMemorial.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmJournalMemorial.clCreditPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if CDS.State in [dsInsert, dsEdit] then CDS.Post;
end;

procedure TfrmJournalMemorial.clDebetPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if CDS.State in [dsInsert, dsEdit] then CDS.Post;
end;

procedure TfrmJournalMemorial.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  InitView;
  LoadByID(0);
end;

function TfrmJournalMemorial.GetJournalMemorial: TJournalMemorial;
begin
  if FJournalMemorial = nil then
    FJournalMemorial := TJournalMemorial.Create;
  Result := FJournalMemorial;
end;

function TfrmJournalMemorial.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TJournalDetail.CreateDataSet(Self, False);
//    FCDS.AfterDelete := CDSAfterDelete;
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmJournalMemorial.GetGroupName: string;
begin
  Result := 'Accounting';
end;

procedure TfrmJournalMemorial.InitView;
var
  S: string;
begin
  cxGrdMain.PrepareFromCDS(CDS);


  S := 'select kode, nama from TACCOUNT where ISDETAIL = 1';
//      +' and parent_id = ' + IntToStr(AppVariable.GetAccountExpense.ID);
  TcxExtLookup(clAccount.Properties).LoadFromSQL(S,'kode','nama',[], Self);


end;

procedure TfrmJournalMemorial.LoadByID(aID: Integer; IsReadOnly: Boolean =
    False);
var
  lItem: TJournalDetail;
begin
  if FJournalMemorial <> nil then
    FreeAndNil(FJournalMemorial);

  JournalMemorial.LoadByID(aID);
  if aID = 0 then
  begin
    JournalMemorial.TransDate := Now();
    JournalMemorial.Refno     := JournalMemorial.GenerateNo;
  end;
  if (aID <> 0) and (not IsReadOnly) then
  begin
    IsReadOnly := not IsValidTransDate(JournalMemorial.TransDate);
  end;

  edRefno.Text        := JournalMemorial.Refno;
  dtTransDate.Date    := JournalMemorial.TransDate;
  if dtTransDate.Date <= 0 then dtTransDate.Clear;
  edNotes.Text        := JournalMemorial.Notes;



  CDS.EmptyDataSet;
  CDS.DisableControls;
  Try
    for lItem in JournalMemorial.Items do
    begin
      CDS.Append;
      lItem.UpdateToDataset(CDS);
      CDS.Post;
    end;

  Finally
    CDS.EnableControls;
  End;
  btnSave.Enabled := not IsReadOnly;
end;

procedure TfrmJournalMemorial.UpdateData;
var
  lItem: TJournalDetail;
begin
  JournalMemorial.Refno         := edRefno.Text;
  JournalMemorial.TransDate     := dtTransDate.Date;
  JournalMemorial.Notes         := edNotes.Text;
  JournalMemorial.ModifiedBy    := UserLogin;
  JournalMemorial.ModifiedDate  := Now();

  JournalMemorial.Items.Clear;
  CDS.First;
  while not CDS.Eof do
  begin
    lItem               := TJournalDetail.Create;
    lItem.SetFromDataset(CDS);

    lItem.Is_Memorial   := 1;
    lItem.RefNo         := JournalMemorial.Refno;
    lItem.TransDate     := JournalMemorial.TransDate;
    lItem.ModifiedDate  := JournalMemorial.ModifiedDate;
    lItem.ModifiedBy    := JournalMemorial.ModifiedBy;

    JournalMemorial.Items.Add(lItem);
    CDS.Next;
  end;
end;

function TfrmJournalMemorial.ValidateData: Boolean;
var
  lCredit: Double;
  lDebet: Double;
begin
  Result := False;

  if cxGrdMain.DataController.RecordCount = 0 then
  begin
    TAppUtils.Warning('Data Item tidak boleh kosong');
    exit;
  end;

  if CDS.Locate('AccountCode', null, []) or CDS.Locate('AccountCode', '', []) then
  begin
    TAppUtils.Warning('Account tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;

  //journal
//  if not IsValidTransDate(dtTransDate.Date) then exit;

  lDebet := cxGrdMain.GetFooterSummary('Debet');
  lCredit := cxGrdMain.GetFooterSummary('Credit');

  if Abs(lDebet-lCredit)>1 then
  begin
    TAppUtils.Warning('Debet vs Credit tidak balance');
    exit;
  end;


  Result := TAppUtils.Confirm('Anda yakin data sudah sesuai?');
end;

end.
