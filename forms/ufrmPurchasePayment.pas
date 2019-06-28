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
    crSubTotal: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    crPPN: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    crTotal: TcxCurrencyEdit;
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
    function GetCDS: TClientDataset;
    function GetCDSClone: TClientDataset;
    procedure InitView;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSClone: TClientDataset read GetCDSClone write FCDSClone;
    { Private declarations }
  public
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

procedure TfrmPurchasePayment.InitView;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  cxLookupRekening.Properties.LoadFromSQL(Self,
    'select id, nama from trekening','nama');


end;

end.
