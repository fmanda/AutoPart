unit ufrmPurchasePayment;

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
  uFinancialTransaction, Datasnap.DBClient;

type
  TfrmPurchasePayment = class(TfrmDefaultInput)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edRefno: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel6: TcxLabel;
    edNotes: TcxMemo;
    dtTransDate: TcxDateEdit;
    cxLabel8: TcxLabel;
    dtDueDate: TcxDateEdit;
    cxLabel9: TcxLabel;
    edSupplier: TcxButtonEdit;
    crRetur: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    crTotal: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    crCash: TcxCurrencyEdit;
    cbMedia: TcxComboBox;
    cxLabel10: TcxLabel;
    cxLabel13: TcxLabel;
    cxLookupRekening: TcxExtLookupComboBox;
    cxLabel7: TcxLabel;
    edNoMedia: TcxTextEdit;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colInvoiceNo: TcxGridDBColumn;
    colInvoiceDate: TcxGridDBColumn;
    colInvoiceAmt: TcxGridDBColumn;
    colRemain: TcxGridDBColumn;
    colPaidAmt: TcxGridDBColumn;
    colReturAmt: TcxGridDBColumn;
    colReturNo: TcxGridDBColumn;
    colInvoiceID: TcxGridDBColumn;
    colReturID: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
  private
    FCDS: TClientDataset;
    FCDSClone: TClientDataset;
    FPayment: TPurchasePayment;
    function GetCDS: TClientDataset;
    function GetCDSClone: TClientDataset;
    function GetPayment: TPurchasePayment;
    procedure InitView;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSClone: TClientDataset read GetCDSClone write FCDSClone;
    { Private declarations }
  public
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = False);
    property Payment: TPurchasePayment read GetPayment write FPayment;
    { Public declarations }
  end;

var
  frmPurchasePayment: TfrmPurchasePayment;

implementation

uses
  uDBUtils, uDXUtils, uAppUtils, uTransDetail, System.DateUtils;

{$R *.dfm}

procedure TfrmPurchasePayment.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  InitView;
  LoadByID(0);
end;

function TfrmPurchasePayment.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TTransDetail.CreateDataSet(Self, False);
    FCDS.AddField('InvoiceNo',ftString);
    FCDS.AddField('InvoiceDate',ftDateTime);
    FCDS.AddField('RetrNo',ftString);
    FCDS.AddField('InvoiceAmt',ftFloat);
    FCDS.AddField('Remain',ftFloat);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmPurchasePayment.GetCDSClone: TClientDataset;
begin
  if FCDSClone = nil then
  begin
    FCDSClone := CDS.ClonedDataset(Self);
  end;
  Result := FCDSClone;
end;

function TfrmPurchasePayment.GetPayment: TPurchasePayment;
begin
  if FPayment = nil then
    FPayment := TPurchasePayment.Create;
  Result := FPayment;
end;

procedure TfrmPurchasePayment.InitView;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  cxLookupRekening.Properties.LoadFromSQL(Self,
    'select id, nama from trekening','nama');


end;

procedure TfrmPurchasePayment.LoadByID(aID: Integer; IsReadOnly: Boolean =
    False);
begin
  if FPayment <> nil then
    FreeAndNil(FPayment);

  Payment.LoadByID(aID);

  if aID = 0 then
  begin
    Payment.TransDate := Now();
    Payment.Refno     := Payment.GenerateNo;
  end;


end;

end.
