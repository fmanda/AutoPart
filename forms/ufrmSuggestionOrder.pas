unit ufrmSuggestionOrder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.ComCtrls, dxCore, cxDateUtils, cxGroupBox, cxRadioGroup,
  cxCheckBox, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxStyles,
  cxClasses, Vcl.StdCtrls, cxButtons, cxLabel, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, Datasnap.DBClient, cxMemo;

type
  TfrmSuggestionOrder = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel3: TcxLabel;
    dtStock: TcxDateEdit;
    ckGrupMerk: TcxCheckBox;
    rbJenis: TcxRadioGroup;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colGroup: TcxGridDBColumn;
    colMerk: TcxGridDBColumn;
    colKode: TcxGridDBColumn;
    colNama: TcxGridDBColumn;
    colUOM: TcxGridDBColumn;
    colLeadTime: TcxGridDBColumn;
    colADS: TcxGridDBColumn;
    colROP: TcxGridDBColumn;
    colStock: TcxGridDBColumn;
    colStockCover: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    styleWarning: TcxStyle;
    cxMemo1: TcxMemo;
    cxButton1: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure ckGrupMerkPropertiesEditValueChanged(Sender: TObject);
    procedure cxGrdMainStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure btnExportClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    CDS: TClientDataset;
    { Private declarations }
  public
    function GetGroupName: string; override;
    { Public declarations }
  end;

var
  frmSuggestionOrder: TfrmSuggestionOrder;

implementation

uses
  uDBUtils, uDXUtils, uAppUtils;

{$R *.dfm}

procedure TfrmSuggestionOrder.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmSuggestionOrder.btnRefreshClick(Sender: TObject);
var
  lDayNum: Integer;
  S: String;
begin
  inherited;
  lDayNum := 90;
  if rbJenis.ItemIndex = 1 then
    lDayNum := 30;

  S := 'SELECT * FROM FN_SUGGESTIONORDER(' + TAppUtils.QuotD(dtStock.Date)
    +',' + IntToStr(lDayNum) + ')'
    +' ORDER BY (STOCK - ROP)';

  if CDS <> nil then
    FreeAndNil(CDS);

  CDS := TDBUtils.OpenDataset(S, Self);
  cxGrdMain.PrepareFromCDS(CDS);
  cxGrdMain.SetVisibleColumns(['Merk','GroupItem'], ckGrupMerk.Checked);

end;

procedure TfrmSuggestionOrder.ckGrupMerkPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cxGrdMain.SetVisibleColumns(['Merk','GroupItem'], ckGrupMerk.Checked);
end;

procedure TfrmSuggestionOrder.cxButton1Click(Sender: TObject);
begin
  inherited;
  cxMemo1.Visible := not cxMemo1.Visible;
end;

procedure TfrmSuggestionOrder.cxGrdMainStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord = nil then exit;
  if VarToFloat(ARecord.Values[colStock.Index]) < VarToFloat(ARecord.Values[colROP.Index])
  then
    AStyle := styleWarning;


end;

procedure TfrmSuggestionOrder.FormCreate(Sender: TObject);
begin
  inherited;
  dtStock.Date := Now();

end;

function TfrmSuggestionOrder.GetGroupName: string;
begin
  Result := 'Inventory';
end;

end.
