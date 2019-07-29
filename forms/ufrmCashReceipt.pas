unit ufrmCashReceipt;

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
  cxDropDownEdit, cxMaskEdit, cxMemo, cxTextEdit, cxLabel,
  uFinancialTransaction, Datasnap.DBClient, uTransDetail,
  cxGridDBDataDefinitions, uItem, cxDataUtils, uAppUtils, cxSpinEdit;
type
  TfrmCashReceipt = class(TfrmDefaultInput)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edRefno: TcxTextEdit;
    cxLabel6: TcxLabel;
    edNotes: TcxMemo;
    dtTransDate: TcxDateEdit;
    cxLabel8: TcxLabel;
    cxLabel5: TcxLabel;
    crCash: TcxCurrencyEdit;
    lbRekening: TcxLabel;
    cxLookupRekening: TcxExtLookupComboBox;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colCostAccount: TcxGridDBColumn;
    colCostNotes: TcxGridDBColumn;
    colCostAmount: TcxGridDBColumn;
    cxGrid1Level2: TcxGridLevel;
    procedure btnSaveClick(Sender: TObject);
    procedure colCostAmountPropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FCashReceipt: TCashReceipt;
    FCDS: TClientDataset;
    FCDSClone: TClientDataset;
    procedure CalculateAll;
    procedure CDSAfterDelete(DataSet: TDataSet);
    procedure FocusToGrid;
    function GetCashReceipt: TCashReceipt;
    function GetCDS: TClientDataset;
    function GetCDSClone: TClientDataset;
    procedure InitView;
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSClone: TClientDataset read GetCDSClone write FCDSClone;
    { Private declarations }
  public
    function GetGroupName: string; override;
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = False);
    property CashReceipt: TCashReceipt read GetCashReceipt write FCashReceipt;
    { Public declarations }
  end;

var
  frmCashReceipt: TfrmCashReceipt;

implementation

uses
  uDBUtils, uDXUtils, System.DateUtils,
  ufrmCXServerLookup, uSupplier, uAccount, uVariable;

{$R *.dfm}

procedure TfrmCashReceipt.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if CashReceipt.SaveRepeat() then
  begin
//    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmCashReceipt.CalculateAll;
var
  dCash: Double;
begin
  if CDS.State in [dsInsert, dsEdit] then
    CDS.Post;

  CDS.DisableControls;
//  DisableTrigger := True;
  Try
    dCash := 0;

    CDSClone.First;
    while not CDSClone.Eof do
    begin
      dCash   := dCash + CDSClone.FieldByName('Amount').AsFloat;
      CDSClone.Next;
    end;

    crCash.Value  := dCash;

  Finally
    CDS.EnableControls;
//    DisableTrigger := False;
  End;
end;

procedure TfrmCashReceipt.CDSAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmCashReceipt.colCostAmountPropertiesEditValueChanged(Sender:
    TObject);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmCashReceipt.FocusToGrid;
begin
  cxGrid1.SetFocus;
  cxGrid1.FocusedView := cxGrdMain;
  if cxGrdMain.DataController.RecordCount = 0 then
  begin
    CDS.Append;
    cxGrdMain.Controller.EditingController.ShowEdit;
  end;
end;

procedure TfrmCashReceipt.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  InitView;
  LoadByID(0);
end;

procedure TfrmCashReceipt.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_F1 then
    edRefno.SetFocus;

  if Key = VK_F2 then
    FocusToGrid;
end;

function TfrmCashReceipt.GetCashReceipt: TCashReceipt;
begin
  if FCashReceipt = nil then
    FCashReceipt := TCashReceipt.Create;
  Result := FCashReceipt;
end;

function TfrmCashReceipt.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TFinancialTransaction.CreateDataSet(Self, False);
    FCDS.AfterDelete := CDSAfterDelete;
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmCashReceipt.GetCDSClone: TClientDataset;
begin
  if FCDSClone = nil then
  begin
    FCDSClone := CDS.ClonedDataset(Self);
  end;
  Result := FCDSClone;
end;

function TfrmCashReceipt.GetGroupName: string;
begin
  Result := 'Penjualan & Kas';
end;

procedure TfrmCashReceipt.InitView;
var
  S: string;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  cxLookupRekening.Properties.LoadFromSQL(Self,
    'select id, nama from trekening','nama');

  S := 'select id, kode + '' - '' + nama as nama from taccount where isdetail = 1'
      +' and parent_id = ' + IntToStr(AppVariable.GetAccountOthIncome.ID);

  TcxExtLookup(colCostAccount.Properties).LoadFromSQL(Self,
    S,'nama');
end;

procedure TfrmCashReceipt.LoadByID(aID: Integer; IsReadOnly: Boolean = False);
var
  lItem: TFinancialTransaction;
begin
  if FCashReceipt <> nil then
    FreeAndNil(FCashReceipt);

  CashReceipt.LoadByID(aID);
  if aID = 0 then
  begin
    CashReceipt.TransDate := Now();
    CashReceipt.Refno     := CashReceipt.GenerateNo;
  end;
  if (aID <> 0) and (not IsReadOnly) then
  begin
    IsReadOnly := not IsValidTransDate(CashReceipt.TransDate);
  end;

  edRefno.Text        := CashReceipt.Refno;
  dtTransDate.Date    := CashReceipt.TransDate;
  if dtTransDate.Date <= 0 then dtTransDate.Clear;
  edNotes.Text        := CashReceipt.Notes;
  cxLookupRekening.Clear;

  if CashReceipt.Rekening <> nil then
  begin
    cxLookupRekening.EditValue := CashReceipt.Rekening.ID;
  end;

  CDS.EmptyDataSet;
  CDS.DisableControls;
  Try
    for lItem in CashReceipt.Items do
    begin
      if lItem.DebetAmt > 0 then continue;
      CDS.Append;
      lItem.UpdateToDataset(CDS);
      CDS.Post;
    end;
    CalculateAll;
  Finally
    CDS.EnableControls;
  End;
  btnSave.Enabled := not IsReadOnly;
end;

procedure TfrmCashReceipt.UpdateData;
var
  lItem: TFinancialTransaction;
begin
  CashReceipt.Refno         := edRefno.Text;
  CashReceipt.TransDate     := dtTransDate.Date;
  CashReceipt.Amount        := crCash.Value;
  CashReceipt.Notes         := edNotes.Text;
  CashReceipt.ModifiedBy    := UserLogin;
  CashReceipt.ModifiedDate  := Now();

  if CashReceipt.Rekening = nil then
    CashReceipt.Rekening    := TRekening.Create;

  CashReceipt.Rekening.LoadByID(VarToInt(cxLookupRekening.EditValue));
  CashReceipt.Items.Clear;

  //header debet
  lItem                 := TFinancialTransaction.Create;
  lItem.DebetAmt        := CashReceipt.Amount;
  lItem.CreditAmt       := 0;
  lItem.Amount          := CashReceipt.Amount;
  lItem.TransDate       := CashReceipt.TransDate;
  lItem.Notes           := CashReceipt.Notes;
  lItem.Rekening        := TRekening.CreateID(CashReceipt.Rekening.ID);
  CashReceipt.Items.Add(lItem);


  CDS.First;
  while not CDS.Eof do
  begin
    lItem               := TFinancialTransaction.Create;
    lItem.SetFromDataset(CDS);
    lItem.SetToCredit; //penerimaan
    lItem.TransDate     := CashReceipt.TransDate;
//    lItem.Notes         := 'Purchase CashReceipt : ' + CashReceipt.Refno;
    CashReceipt.Items.Add(lItem);
    CDS.Next;
  end;
end;

function TfrmCashReceipt.ValidateData: Boolean;
begin
  Result := False;

  if crCash.Value <= 0 then
  begin
    TAppUtils.Warning('Total <= 0');
    exit;
  end;

  if (VarToInt(cxLookupRekening.EditValue) = 0) then
  begin
    TAppUtils.Warning('Rekening Kas / Bank belum diisi');
    exit;
  end;

//  if CDS.RecordCount = 0 then
//  begin
//    TAppUtils.Warning('Detail penerimaan kosong');
//    exit;
//  end;
  if cxGrdMain.DataController.RecordCount = 0 then
  begin
    TAppUtils.Warning('Data Item tidak boleh kosong');
    exit;
  end;

  if not IsValidTransDate(dtTransDate.Date) then exit;

  Result := TAppUtils.Confirm('Anda yakin data sudah sesuai?');
end;

end.
