unit ufrmUangMukaZakat;

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
  cxGridDBDataDefinitions, uItem, cxDataUtils, uAppUtils, cxSpinEdit,
  dxBarBuiltInMenu, cxPC, uDXUtils;
type
  TfrmUangMukaZakat = class(TfrmDefaultInput)
    cxLabel1: TcxLabel;
    edRefno: TcxTextEdit;
    cxLabel6: TcxLabel;
    edNotes: TcxMemo;
    dtTransDate: TcxDateEdit;
    cxLabel8: TcxLabel;
    lbRekening: TcxLabel;
    cxLookupRekening: TcxExtLookupComboBox;
    cxLabel2: TcxLabel;
    spTahun: TcxSpinEdit;
    crAmount: TcxCurrencyEdit;
    cxLabel3: TcxLabel;
    cxMemo1: TcxMemo;
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FCashPayment: TCashPayment;
    function GetCashPayment: TCashPayment;
    procedure InitView;
    procedure UpdateData;
    function ValidateData: Boolean;
    { Private declarations }
  public
    function GetGroupName: string; override;
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = False);
    property CashPayment: TCashPayment read GetCashPayment write FCashPayment;
    { Public declarations }
  end;

var
  frmUangMukaZakat: TfrmUangMukaZakat;

implementation

uses
  uDBUtils, uAccount, System.DateUtils;

{$R *.dfm}

procedure TfrmUangMukaZakat.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if CashPayment.SaveRepeat() then
  begin
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmUangMukaZakat.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  InitView;
  LoadByID(0);
end;

function TfrmUangMukaZakat.GetCashPayment: TCashPayment;
begin
  if FCashPayment = nil then
    FCashPayment := TCashPayment.Create;
  Result := FCashPayment;
end;

function TfrmUangMukaZakat.GetGroupName: string;
begin
  Result := 'Penjualan & Kas';
end;

procedure TfrmUangMukaZakat.InitView;
begin
  cxLookupRekening.Properties.LoadFromSQL(Self,
    'select id, nama from trekening','nama');
end;

procedure TfrmUangMukaZakat.LoadByID(aID: Integer; IsReadOnly: Boolean = False);
begin
  if FCashPayment <> nil then
    FreeAndNil(FCashPayment);

  CashPayment.LoadByID(aID);
  if aID = 0 then
  begin
    CashPayment.TransDate   := Now();
    CashPayment.TahunZakat  := YearOf(Now());
    CashPayment.Refno       := CashPayment.GenerateNo;
  end;
  if (aID <> 0) and (not IsReadOnly) then
  begin
    IsReadOnly := not IsValidTransDate(CashPayment.TransDate);
  end;

  edRefno.Text        := CashPayment.Refno;
  dtTransDate.Date    := CashPayment.TransDate;
  if dtTransDate.Date <= 0 then dtTransDate.Clear;
  edNotes.Text        := CashPayment.Notes;
  spTahun.Value       := CashPayment.TahunZakat;
  cxLookupRekening.Clear;

  if CashPayment.Rekening <> nil then
    cxLookupRekening.EditValue := CashPayment.Rekening.ID;

  crAmount.Value      := CashPayment.Amount;
  btnSave.Enabled := not IsReadOnly;
end;

procedure TfrmUangMukaZakat.UpdateData;
var
  lItem: TFinancialTransaction;
begin
  CashPayment.Refno         := edRefno.Text;
  CashPayment.TransDate     := dtTransDate.Date;
  CashPayment.Amount        := crAmount.Value;
  CashPayment.Notes         := edNotes.Text;
  CashPayment.ModifiedBy    := UserLogin;
  CashPayment.ModifiedDate  := Now();
  CashPayment.TahunZakat    := spTahun.Value;

  if CashPayment.Rekening = nil then
    CashPayment.Rekening    := TRekening.Create;

  CashPayment.Rekening.LoadByID(VarToInt(cxLookupRekening.EditValue));
  CashPayment.Items.Clear;
  CashPayment.FeeItems.Clear;

  //header credit
  lItem                 := TFinancialTransaction.Create;
  lItem.DebetAmt        := 0;
  lItem.CreditAmt       := CashPayment.Amount;
  lItem.Amount          := CashPayment.Amount;
  lItem.TransDate       := CashPayment.TransDate;
  lItem.Notes           := CashPayment.Notes;
  lItem.Rekening        := TRekening.CreateID(CashPayment.Rekening.ID);
  CashPayment.Items.Add(lItem);
end;

function TfrmUangMukaZakat.ValidateData: Boolean;
begin
  Result := False;

  if crAmount.Value <= 0 then
  begin
    TAppUtils.Warning('Total <= 0');
    exit;
  end;

  if (VarToInt(cxLookupRekening.EditValue) = 0) then
  begin
    TAppUtils.Warning('Rekening Kas / Bank belum diisi');
    exit;
  end;

  if not IsValidTransDate(dtTransDate.Date) then exit;
  Result := TAppUtils.Confirm('Anda yakin data sudah sesuai?');
end;

end.
