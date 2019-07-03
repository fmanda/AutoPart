unit ufrmCashTransfer;

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
  TfrmCashTransfer = class(TfrmDefaultInput)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edRefno: TcxTextEdit;
    cxLabel6: TcxLabel;
    edNotes: TcxMemo;
    dtTransDate: TcxDateEdit;
    cxLabel8: TcxLabel;
    cxLabel5: TcxLabel;
    crTotal: TcxCurrencyEdit;
    lbRekening: TcxLabel;
    cxLookupRekening: TcxExtLookupComboBox;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colRekening: TcxGridDBColumn;
    colNotes: TcxGridDBColumn;
    colDebet: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edNotesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure colDebetPropertiesEditValueChanged(Sender: TObject);
  private
    FCDS: TClientDataset;
    FCashTransfer: TCashTransfer;
    procedure CalculateAll;
    procedure CDSAfterDelete(DataSet: TDataSet);
    procedure FocusToGrid;
    function GetCDS: TClientDataset;
    function GetCashTransfer: TCashTransfer;
    procedure InitView;
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    { Private declarations }
  public
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = False);
    property CashTransfer: TCashTransfer read GetCashTransfer write FCashTransfer;
    { Public declarations }
  end;

var
  frmCashTransfer: TfrmCashTransfer;

implementation

uses
  uDBUtils, uDXUtils, System.DateUtils,
  ufrmCXServerLookup, uSupplier, uAccount, uVariable;

{$R *.dfm}

procedure TfrmCashTransfer.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if CashTransfer.SaveRepeat() then
  begin
//    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmCashTransfer.CalculateAll;
begin
  if CDS.State in [dsInsert, dsEdit] then
    CDS.Post;

  CDS.DisableControls;
  Try
    crTotal.Value := 0;


    CDS.First;
    while not CDS.Eof do
    begin
      crTotal.Value   := crTotal.Value +  CDS.FieldByName('Amount').AsFloat;
      CDS.Next;
    end;


  Finally
    CDS.EnableControls;
  End;
end;

procedure TfrmCashTransfer.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  InitView;
  LoadByID(0);
end;

procedure TfrmCashTransfer.CDSAfterDelete(DataSet: TDataSet);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmCashTransfer.colDebetPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmCashTransfer.edNotesKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    FocusToGrid;
end;

procedure TfrmCashTransfer.FocusToGrid;
begin
  cxGrid1.SetFocus;
  cxGrid1.FocusedView := cxGrdMain;
  if CDS.RecordCount = 0 then
  begin
    CDS.Append;
    cxGrdMain.Controller.EditingController.ShowEdit;
  end;
end;

procedure TfrmCashTransfer.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_F1 then
    edRefno.SetFocus;

  if Key = VK_F2 then
    FocusToGrid;

end;

function TfrmCashTransfer.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TFinancialTransaction.CreateDataSet(Self, False);
    FCDS.AfterDelete := CDSAfterDelete;
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmCashTransfer.GetCashTransfer: TCashTransfer;
begin
  if FCashTransfer = nil then
    FCashTransfer := TCashTransfer.Create;
  Result := FCashTransfer;
end;

procedure TfrmCashTransfer.InitView;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  cxLookupRekening.Properties.LoadFromSQL(Self,
    'select id, nama from trekening','nama');

  TcxExtLookup(colRekening.Properties).LoadFromSQL(Self,
    'select id, nama from trekening','nama'
  );
end;

procedure TfrmCashTransfer.LoadByID(aID: Integer; IsReadOnly: Boolean = False);
var
  lItem: TFinancialTransaction;
begin
  if FCashTransfer <> nil then
    FreeAndNil(FCashTransfer);

  CashTransfer.LoadByID(aID);

  if aID = 0 then
  begin
    CashTransfer.TransDate := Now();
    CashTransfer.Refno     := CashTransfer.GenerateNo;
  end;

  edRefno.Text        := CashTransfer.Refno;
  dtTransDate.Date    := CashTransfer.TransDate;

  if dtTransDate.Date <= 0 then dtTransDate.Clear;
  edNotes.Text        := CashTransfer.Notes;

  CDS.EmptyDataSet;
  for lItem in CashTransfer.Items do
  begin
    if lItem.CreditAmt > 0 then
    begin
      cxLookupRekening.Clear;
      if lItem.Rekening <> nil then
      begin
        cxLookupRekening.EditValue := lItem.Rekening.ID;
      end;
    end else
    begin
      CDS.Append;
      lItem.UpdateToDataset(CDS);
      CDS.Post;
    end;
  end;

  CalculateAll;
  btnSave.Enabled := not IsReadOnly;
end;

procedure TfrmCashTransfer.UpdateData;
var
  lItem: TFinancialTransaction;
begin
  CashTransfer.Refno         := edRefno.Text;
  CashTransfer.TransDate     := dtTransDate.Date;
  CashTransfer.Amount        := crTotal.Value;
  CashTransfer.Notes         := edNotes.Text;
  CashTransfer.ModifiedBy    := UserLogin;
  CashTransfer.ModifiedDate  := Now();

  if CashTransfer.Rekening = nil then
    CashTransfer.Rekening := TRekening.Create;

  CashTransfer.Rekening.LoadByID(VarToInt(cxLookupRekening.EditValue));


  CashTransfer.Items.Clear;

  //header credit
  lItem                 := TFinancialTransaction.Create;
  lItem.DebetAmt        := 0;
  lItem.CreditAmt       := CashTransfer.Amount;
  lItem.Amount          := CashTransfer.Amount;
  lItem.TransDate       := CashTransfer.TransDate;
  lItem.Notes           := 'Cash Transfer : ' + CashTransfer.Refno;
  lItem.Rekening        := TRekening.CreateID(VarToInt(cxLookupRekening.EditValue));
  CashTransfer.Items.Add(lItem);

  CDS.First;
  while not CDS.Eof do
  begin
    lItem               := TFinancialTransaction.Create;
    lItem.SetFromDataset(CDS);
    lItem.SetToDebet;
    lItem.TransDate     := CashTransfer.TransDate;
    lItem.Notes         := 'Cash Transfer : ' + CashTransfer.Refno;
    CashTransfer.Items.Add(lItem);
    CDS.Next;
  end;
end;

function TfrmCashTransfer.ValidateData: Boolean;
begin
  Result := False;

  if crTotal.Value <= 0 then
  begin
    TAppUtils.Warning('Total <= 0');
    exit;
  end;

  if (VarToInt(cxLookupRekening.EditValue) = 0) then
  begin
    TAppUtils.Warning('Rekening Kas / Bank belum diisi');
    exit;
  end;

  if CDS.RecordCount = 0 then
  begin
    TAppUtils.Warning('Detail kosong');
    exit;
  end;

  if CDS.Locate('Rekening', null, []) or CDS.Locate('Rekening', 0, []) then
  begin
    TAppUtils.Warning('Rekening tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;


  Result := TAppUtils.Confirm('Anda yakin data sudah sesuai?');
end;

end.
