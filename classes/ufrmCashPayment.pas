unit ufrmCashPayment;

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
  TfrmCashPayment = class(TfrmDefaultInput)
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
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure colCostAmountPropertiesEditValueChanged(Sender: TObject);
  private
    FCDSClone: TClientDataset;
    FCDS: TClientDataset;
    FCashPayment: TCashPayment;
    procedure CalculateAll;
    procedure CDSAfterDelete(DataSet: TDataSet);
    procedure FocusToGrid;
    function GetCDSClone: TClientDataset;
    function GetCDS: TClientDataset;
    function GetCashPayment: TCashPayment;
    procedure InitView;
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDSClone: TClientDataset read GetCDSClone write FCDSClone;
    property CDS: TClientDataset read GetCDS write FCDS;
    { Private declarations }
  public
    function GetGroupName: string; override;
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = False);
    property CashPayment: TCashPayment read GetCashPayment write FCashPayment;
    { Public declarations }
  end;

var
  frmCashPayment: TfrmCashPayment;

implementation

uses
  uDBUtils, uDXUtils, System.DateUtils,
  ufrmCXServerLookup, uSupplier, uAccount, uVariable;

{$R *.dfm}

procedure TfrmCashPayment.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if CashPayment.SaveRepeat() then
  begin
//    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmCashPayment.CalculateAll;
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

procedure TfrmCashPayment.CDSAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmCashPayment.colCostAmountPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmCashPayment.FocusToGrid;
begin
  cxGrid1.SetFocus;
  cxGrid1.FocusedView := cxGrdMain;
  if cxGrdMain.DataController.RecordCount = 0 then
  begin
    CDS.Append;
    cxGrdMain.Controller.EditingController.ShowEdit;
  end;
end;

procedure TfrmCashPayment.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  InitView;
  LoadByID(0);
end;

procedure TfrmCashPayment.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_F1 then
    edRefno.SetFocus;

  if Key = VK_F2 then
    FocusToGrid;
end;

function TfrmCashPayment.GetCDSClone: TClientDataset;
begin
  if FCDSClone = nil then
  begin
    FCDSClone := CDS.ClonedDataset(Self);
  end;
  Result := FCDSClone;
end;

function TfrmCashPayment.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TFinancialTransaction.CreateDataSet(Self, False);
    FCDS.AfterDelete := CDSAfterDelete;
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmCashPayment.GetCashPayment: TCashPayment;
begin
  if FCashPayment = nil then
    FCashPayment := TCashPayment.Create;
  Result := FCashPayment;
end;

function TfrmCashPayment.GetGroupName: string;
begin
  Result := 'Penjualan & Kas';
end;

procedure TfrmCashPayment.InitView;
var
  S: string;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  cxLookupRekening.Properties.LoadFromSQL(Self,
    'select id, nama from trekening','nama');

  S := 'select id, kode + '' - '' + nama as nama from taccount where isdetail = 1'
      +' and parent_id = ' + IntToStr(AppVariable.GetAccountExpense.ID);

  TcxExtLookup(colCostAccount.Properties).LoadFromSQL(Self,
    S,'nama');
end;

procedure TfrmCashPayment.LoadByID(aID: Integer; IsReadOnly: Boolean = False);
var
  lItem: TFinancialTransaction;
begin
  if FCashPayment <> nil then
    FreeAndNil(FCashPayment);

  CashPayment.LoadByID(aID);
  if aID = 0 then
  begin
    CashPayment.TransDate := Now();
    CashPayment.Refno     := CashPayment.GenerateNo;
  end;
  if (aID <> 0) and (not IsReadOnly) then
  begin
    IsReadOnly := not IsValidTransDate(CashPayment.TransDate);
  end;

  edRefno.Text        := CashPayment.Refno;
  dtTransDate.Date    := CashPayment.TransDate;
  if dtTransDate.Date <= 0 then dtTransDate.Clear;
  edNotes.Text        := CashPayment.Notes;
  cxLookupRekening.Clear;

  if CashPayment.Rekening <> nil then
  begin
    cxLookupRekening.EditValue := CashPayment.Rekening.ID;
  end;

  CDS.EmptyDataSet;
  CDS.DisableControls;
  Try
    for lItem in CashPayment.Items do
    begin
      if lItem.CreditAmt > 0 then continue;
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

procedure TfrmCashPayment.UpdateData;
var
  lItem: TFinancialTransaction;
begin
  CashPayment.Refno         := edRefno.Text;
  CashPayment.TransDate     := dtTransDate.Date;
  CashPayment.Amount        := crCash.Value;
  CashPayment.Notes         := edNotes.Text;
  CashPayment.ModifiedBy    := UserLogin;
  CashPayment.ModifiedDate  := Now();

  if CashPayment.Rekening = nil then
    CashPayment.Rekening    := TRekening.Create;

  CashPayment.Rekening.LoadByID(VarToInt(cxLookupRekening.EditValue));
  CashPayment.Items.Clear;

  //header credit
  lItem                 := TFinancialTransaction.Create;
  lItem.DebetAmt        := 0;
  lItem.CreditAmt       := CashPayment.Amount;
  lItem.Amount          := CashPayment.Amount;
  lItem.TransDate       := CashPayment.TransDate;
  lItem.Notes           := CashPayment.Notes;
  lItem.Rekening        := TRekening.CreateID(CashPayment.Rekening.ID);
  CashPayment.Items.Add(lItem);


  CDS.First;
  while not CDS.Eof do
  begin
    lItem               := TFinancialTransaction.Create;
    lItem.SetFromDataset(CDS);
    lItem.SetToDebet; //pembayaran biaya
    lItem.TransDate     := CashPayment.TransDate;
//    lItem.Notes         := 'Purchase CashPayment : ' + CashPayment.Refno;
    CashPayment.Items.Add(lItem);
    CDS.Next;
  end;
end;

function TfrmCashPayment.ValidateData: Boolean;
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
//    TAppUtils.Warning('Detail pengeluaran kosong');
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
