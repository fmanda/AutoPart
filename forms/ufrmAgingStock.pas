unit ufrmAgingStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxTextEdit, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, cxRadioGroup,
  cxCheckBox, cxMaskEdit, cxDropDownEdit, cxCalendar, Datasnap.DBClient, cxMemo;

type
  TfrmAgingStock = class(TfrmDefaultReport)
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
    colNotes: TcxGridDBColumn;
    colUOM: TcxGridDBColumn;
    colQty: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    colValue: TcxGridDBColumn;
    colRange1: TcxGridDBColumn;
    colRange2: TcxGridDBColumn;
    colRange3: TcxGridDBColumn;
    colRange4: TcxGridDBColumn;
    colRange5: TcxGridDBColumn;
    colValue1: TcxGridDBColumn;
    colValue2: TcxGridDBColumn;
    colValue3: TcxGridDBColumn;
    colValue4: TcxGridDBColumn;
    colValue5: TcxGridDBColumn;
    cxMemo1: TcxMemo;
    cxStyle1: TcxStyle;
    styleRange1: TcxStyle;
    styleRange2: TcxStyle;
    styleRange3: TcxStyle;
    styleRange4: TcxStyle;
    styleRange5: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure rbJenisPropertiesEditValueChanged(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure colRange1StylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure colRange2StylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure colRange3StylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure colRange4StylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure colRange5StylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure colValue1StylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure colValue2StylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure colValue3StylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure colValue4StylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure colValue5StylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
  private
    CDS: TClientDataset;
    { Private declarations }
  public
    function GetGroupName: string; override;
    { Public declarations }
  end;

var
  frmAgingStock: TfrmAgingStock;

implementation

uses
  uAppUtils, uDBUtils, uDXUtils;

{$R *.dfm}

procedure TfrmAgingStock.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmAgingStock.btnRefreshClick(Sender: TObject);
var
  S: string;
begin
  inherited;
  Self.Cursor := crHourGlass;
  Try
    if CDS <> nil then
      FreeAndNil(CDS);

    S := 'select a.ITEM_ID, b.KODE, b.NAMA, e.NAMA as ITEMGROUP, F.NAMA AS MERK,'
        +' D.UOM AS UOM, C.KONVERSI, ISNULL(C.HARGAAVG, C.HARGABELI) AS HARGAAVG,'
        +' A.TOTALPCS/C.KONVERSI AS TOTALQTY,'
        +' ISNULL(C.HARGAAVG, C.HARGABELI)*A.TOTALPCS/C.KONVERSI AS TOTALVALUE,'
        +' A.RANGE1/C.KONVERSI AS RANGE1, A.RANGE2/C.KONVERSI AS RANGE2,'
        +' A.RANGE3/C.KONVERSI AS RANGE3, A.RANGE4/C.KONVERSI AS RANGE4,'
        +' A.RANGE5/C.KONVERSI AS RANGE5,'
        +' ISNULL(C.HARGAAVG, C.HARGABELI)*A.RANGE1/C.KONVERSI AS VALUERANGE1,'
        +' ISNULL(C.HARGAAVG, C.HARGABELI)*A.RANGE2/C.KONVERSI AS VALUERANGE2,'
        +' ISNULL(C.HARGAAVG, C.HARGABELI)*A.RANGE3/C.KONVERSI AS VALUERANGE3,'
        +' ISNULL(C.HARGAAVG, C.HARGABELI)*A.RANGE4/C.KONVERSI AS VALUERANGE4,'
        +' ISNULL(C.HARGAAVG, C.HARGABELI)*A.RANGE5/C.KONVERSI AS VALUERANGE5'
        +' from FN_AGINGSTOCK(' + TAppUtils.QuotD(dtStock.Date) + ') a'
        +' inner join TITEM b on a.ITEM_ID = b.id'
        +' inner join TITEMUOM c on c.ITEM_ID = b.id and c.UOM_ID = b.STOCKUOM_ID'
        +' inner join TUOM d on c.UOM_ID = d.id'
        +' left join TITEMGROUP e on b.GROUP_ID = e.id'
        +' left join TMERK f on b.MERK_ID = f.ID';

    CDS := TDBUtils.OpenDataset(S, Self);
    cxGrdMain.PrepareFromCDS(CDS);;
    cxGrdMain.ApplyBestFit();
  Finally
    Self.Cursor := crDefault;
  End;
end;

procedure TfrmAgingStock.colRange1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord <> nil then
    if VarToFloat(ARecord.Values[colRange1.Index])>0 then
      AStyle := styleRange1;
end;

procedure TfrmAgingStock.colRange2StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord <> nil then
    if VarToFloat(ARecord.Values[colRange2.Index])>0 then
      AStyle := styleRange2;
end;

procedure TfrmAgingStock.colRange3StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord <> nil then
    if VarToFloat(ARecord.Values[colRange3.Index])>0 then
      AStyle := styleRange3;
end;

procedure TfrmAgingStock.colRange4StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord <> nil then
    if VarToFloat(ARecord.Values[colRange4.Index])>0 then
      AStyle := styleRange4;
end;

procedure TfrmAgingStock.colRange5StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord <> nil then
    if VarToFloat(ARecord.Values[colRange5.Index])>0 then
      AStyle := styleRange5;
end;

procedure TfrmAgingStock.colValue1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord <> nil then
    if VarToFloat(ARecord.Values[colRange1.Index])>0 then
      AStyle := styleRange1;
end;

procedure TfrmAgingStock.colValue2StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord <> nil then
    if VarToFloat(ARecord.Values[colRange2.Index])>0 then
      AStyle := styleRange2;
end;

procedure TfrmAgingStock.colValue3StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord <> nil then
    if VarToFloat(ARecord.Values[colRange3.Index])>0 then
      AStyle := styleRange3;
end;

procedure TfrmAgingStock.colValue4StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord <> nil then
    if VarToFloat(ARecord.Values[colRange4.Index])>0 then
      AStyle := styleRange4;
end;

procedure TfrmAgingStock.colValue5StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord <> nil then
    if VarToFloat(ARecord.Values[colRange5.Index])>0 then
      AStyle := styleRange5;
end;

procedure TfrmAgingStock.FormCreate(Sender: TObject);
begin
  inherited;
  dtStock.Date := Now();
  rbJenisPropertiesEditValueChanged(Self);
end;

function TfrmAgingStock.GetGroupName: string;
begin
  Result := 'Manajemen';
end;

procedure TfrmAgingStock.rbJenisPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  colRange1.Visible := rbJenis.ItemIndex = 0;
  colRange2.Visible := rbJenis.ItemIndex = 0;
  colRange3.Visible := rbJenis.ItemIndex = 0;
  colRange4.Visible := rbJenis.ItemIndex = 0;
  colRange5.Visible := rbJenis.ItemIndex = 0;
  colValue1.Visible := rbJenis.ItemIndex = 1;
  colValue2.Visible := rbJenis.ItemIndex = 1;
  colValue3.Visible := rbJenis.ItemIndex = 1;
  colValue4.Visible := rbJenis.ItemIndex = 1;
  colValue5.Visible := rbJenis.ItemIndex = 1;
  colValue.Visible  := rbJenis.ItemIndex = 1;
  colQty.Visible    := rbJenis.ItemIndex = 0;
end;

end.
