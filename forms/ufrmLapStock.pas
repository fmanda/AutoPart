unit ufrmLapStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxButtonEdit, cxCheckBox, cxDropDownEdit,
  cxCalendar, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxTextEdit, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, uItem, uDXUtils, uDBUtils,
  Datasnap.DBClient, ufrmCXServerLookup, uAppUtils, System.DateUtils,
  cxGridServerModeTableView;

type
  TfrmLapStock = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    edNama: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLookupGudang: TcxExtLookupComboBox;
    dtStock: TcxDateEdit;
    ckGudang: TcxCheckBox;
    edKode: TcxButtonEdit;
    ckItem: TcxCheckBox;
    ckZeroStock: TcxCheckBox;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colKode: TcxGridDBColumn;
    colNotes: TcxGridDBColumn;
    colQty: TcxGridDBColumn;
    colUOM: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    colHrgAvg: TcxGridDBColumn;
    colValue: TcxGridDBColumn;
    colGroup: TcxGridDBColumn;
    colMerk: TcxGridDBColumn;
    ckShowPrice: TcxCheckBox;
    ckGrupMerk: TcxCheckBox;
    pmMain: TPopupMenu;
    LihatKartuStock1: TMenuItem;
    colRak: TcxGridDBColumn;
    colPriceList: TcxGridDBColumn;
    colHrgBeli: TcxGridDBColumn;
    colHrgJual1: TcxGridDBColumn;
    colHrgJual2: TcxGridDBColumn;
    colHrgJual3: TcxGridDBColumn;
    colHrgJual4: TcxGridDBColumn;
    ckShowAvgCost: TcxCheckBox;
    styleQty: TcxStyle;
    procedure edKodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edKodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edKodePropertiesValidate(Sender: TObject; var DisplayValue: Variant;
        var ErrorText: TCaption; var Error: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure LihatKartuStock1Click(Sender: TObject);
    procedure ckShowPricePropertiesEditValueChanged(Sender: TObject);
    procedure ckShowAvgCostPropertiesEditValueChanged(Sender: TObject);
    procedure ckGrupMerkPropertiesEditValueChanged(Sender: TObject);
    procedure ckGudangPropertiesEditValueChanged(Sender: TObject);
  private
    FCDS: TClientDataset;
    FItem: TItem;
    function GetItem: TItem;
    procedure InitView;
    procedure LoadData;
    procedure LookupItem(aKey: string = '');
    property CDS: TClientDataset read FCDS write FCDS;
    property Item: TItem read GetItem write FItem;
    { Private declarations }
  public
    function GetGroupName: string; override;
    { Public declarations }
  end;

var
  frmLapStock: TfrmLapStock;

implementation

uses
  ufrmKartuStock;

{$R *.dfm}

procedure TfrmLapStock.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmLapStock.btnRefreshClick(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TfrmLapStock.ckGrupMerkPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  cxGrdMain.SetVisibleColumns(['Merk','ItemGroup'], ckGrupMerk.Checked);
end;

procedure TfrmLapStock.ckGudangPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  colRak.Visible := ckGudang.Checked;
end;

procedure TfrmLapStock.ckShowAvgCostPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  cxGrdMain.SetVisibleColumns(['HargaAvg','Total'], ckShowAvgCost.Checked);
end;

procedure TfrmLapStock.ckShowPricePropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  cxGrdMain.SetVisibleColumns(['PriceList','HargaBeli','HargaUmum','HargaBengkel',
    'HargaGrosir','HargaKeliling'], ckShowPrice.Checked);
end;

procedure TfrmLapStock.edKodeKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
var
  sKey: string;
  Edit: TcxCustomEdit;
begin
  inherited;
  Edit := Sender as TcxCustomEdit;
  sKey := VarToStr(Edit.EditingValue);

  if (Key = VK_F5) then
  begin
    LookupItem(sKey);
  end
  else if (Key = VK_RETURN) then
    SelectNext(Screen.ActiveControl, True, True);
end;

procedure TfrmLapStock.edKodePropertiesButtonClick(Sender: TObject;
    AButtonIndex: Integer);
var
  sKey: string;
  Edit: TcxCustomEdit;
begin
  inherited;
  Edit := Sender as TcxCustomEdit;
  sKey := VarToStr(Edit.EditingValue);
  LookupItem(sKey);
end;

procedure TfrmLapStock.edKodePropertiesValidate(Sender: TObject; var
    DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  if Item.LoadByCode(VarToStr(DisplayValue)) then
  begin
    edKode.Text := Item.Kode;
    edNama.Text := Item.Nama;
//    if Item.StockUOM <> nil then
//      cxLookupUOM.EditValue := Item.StockUOM.ID;
  end
  else
  begin
    Error := True;
    ErrorText := 'Kode Barang : ' + VarToStr(DisplayValue) + ' tidak ditemukan';
  end;

end;

procedure TfrmLapStock.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  InitView;
  dtStock.Date  := Now();

  ckShowPricePropertiesEditValueChanged(Self);
  ckShowAvgCostPropertiesEditValueChanged(Self);
  ckGrupMerkPropertiesEditValueChanged(Self);
  ckGudangPropertiesEditValueChanged(Self);
end;

function TfrmLapStock.GetGroupName: string;
begin
  Result := 'Inventory';
end;

function TfrmLapStock.GetItem: TItem;
begin
  if FItem = nil then
    FItem := TItem.Create;
  Result := FItem;
end;

procedure TfrmLapStock.InitView;
begin
  cxGrdMain.PrepareFromCDS(CDS);
//  cxLookupUOM.Properties.LoadFromSQL(Self,
//    'select id, uom from tuom','uom');
  cxLookupGudang.Properties.LoadFromSQL(Self,
    'select id, nama from twarehouse where is_external = 0','nama');
  cxLookupGudang.SetDefaultValue();
end;

procedure TfrmLapStock.LihatKartuStock1Click(Sender: TObject);
var
  iGudangID: Integer;
  lfrm : TfrmKartuStock;
begin
  inherited;
  if FCDS = nil then
    exit;

  lfrm := TfrmKartuStock.Create(Application);
//  Try
  iGudangID := 0;
  if ckGudang.Checked then
    iGudangID := VarToInt(cxLookupGudang.EditValue);

  lfrm.LoadByID(CDS.FieldByName('ID').AsInteger,iGudangID);
//  Finally
//    FreeAndNil(lfrm);
//  End;
end;

procedure TfrmLapStock.LoadData;
var
  S: string;
begin
  if (ckItem.Checked) and (Item.ID = 0) then
  begin
    TAppUtils.Warning('Barang belum dipilih');
    exit;
  end;
  if (ckGudang.Checked) and (VarToInt(cxLookupGudang.EditValue) = 0) then
  begin
    TAppUtils.Warning('Gudang belum dipilih');
    exit;
  end;

  if FCDS <> nil then FreeAndNil(FCDS);

  S := 'SELECT I.ID, I.KODE, I.NAMA, L.UOM,'
      +' I.ISACTIVE, ISNULL(SUM(A.QTYPCS) / J.KONVERSI, 0) AS QTY,'
      +' M.NAMA AS MERK, N.NAMA AS ITEMGROUP, J.PRICELIST, J.HARGABELI, J.HARGAJUAL1 AS HARGAUMUM,'
      +' J.HARGAJUAL2 AS HARGABENGKEL, J.HARGAJUAL3 AS HARGAGROSIR, J.HARGAJUAL4 AS HARGAKELILING,'
      +' CASE WHEN ISNULL(J.HARGAAVG,0) = 0 THEN J.HARGABELI ELSE J.HARGABELI END as HARGAAVG,'
      +' CASE WHEN ISNULL(J.HARGAAVG,0) = 0 THEN J.HARGABELI ELSE J.HARGABELI END * (SUM(A.QTYPCS) / J.KONVERSI) as TOTAL'
      +' FROM FN_STOCK(' + TAppUtils.QuotD(dtStock.Date) + ') A'
      +' RIGHT JOIN TITEM I ON I .ID = A.ITEM_ID';

  if ckItem.Checked then
    S := S + ' AND I.ID = ' + IntToStr(Item.ID);

  S := S +' RIGHT JOIN TITEMUOM J ON I.ID = J.ITEM_ID AND J.UOM_ID = I.STOCKUOM_ID'
      +' RIGHT JOIN TUOM L ON L.ID = I.STOCKUOM_ID'
      +' LEFT JOIN TMERK M ON M.ID = I.MERK_ID'
      +' LEFT JOIN TITEMGROUP N ON N.ID = I.GROUP_ID'
      +' WHERE (A.QTYPCS IS NOT NULL ';

  if ckZeroStock.Checked then
    S := S + ' OR I.ISACTIVE = 1';

  S := S + ')';

  if ckGudang.Checked then
    S := S + ' AND A.WAREHOUSE_ID = ' + IntToStr(VarToInt(cxLookupGudang.EditValue));

  S := S +' GROUP BY I.ID, I.KODE, I.NAMA, L.UOM, J.HARGABELI, J.PRICELIST, J.HARGAJUAL1, '
      +' I.ISACTIVE, J.KONVERSI, M.NAMA ,N.NAMA , J.HARGAAVG, J.HARGAJUAL2, J.HARGAJUAL3, J.HARGAJUAL4';

  //rack
  if ckGudang.Checked then
  begin
    S := 'SELECT RS.*, IR.RAK FROM (' + S + ') AS RS'
       + ' LEFT JOIN TITEMRACK IR ON RS.ID = IR.ITEM_ID AND IR.WAREHOUSE_ID = ' + IntToStr(VarToInt(cxLookupGudang.EditValue));
  end;

  FCDS := TDBUtils.OpenDataset(S);
  cxGrdMain.PrepareFromCDS(CDS);
  cxGrdMain.SetVisibleColumns(['PriceList','HargaBeli','HargaUmum','HargaBengkel',
    'HargaGrosir','HargaKeliling'], ckShowPrice.Checked);
  cxGrdMain.SetVisibleColumns(['HargaAvg','Total'], ckShowAvgCost.Checked);
  cxGrdMain.SetVisibleColumns(['Merk','ItemGroup'], ckGrupMerk.Checked);
  cxGrdMain.EnableFiltering();

//  cxGrdSrv.LoadFromSQL(S, 'ID');
//  cxGrdSrv.SetVisibleColumns(['HargaAvg','Total'], ckShowAvgCost.Checked);
//  cxGrdSrv.SetVisibleColumns(['Merk','ItemGroup'], ckGrupMerk.Checked);
end;

procedure TfrmLapStock.LookupItem(aKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  s: string;
begin
  s := 'SELECT A.ID, A.KODE, A.NAMA, C.NAMA AS MERK, B.NAMA AS ITEMGROUP'
      +' FROM TITEM A'
      +' LEFT JOIN TITEMGROUP B ON A.GROUP_ID = B.ID'
      +' LEFT JOIN TMERK C ON A.MERK_ID = C.ID';

  cxLookup := TfrmCXServerLookup.Execute(S,'ID');
  if aKey <> '' then
    cxLookup.PreFilter('Nama', aKey)
  else
    cxLookup.cxGrdMain.GetColumnByFieldName('NAMA').Focused := True;
  try
    if cxLookup.ShowModal = mrOK then
    begin
      Item.LoadByID(cxLookup.FieldValue('ID'));
      edKode.Text := Item.Kode;
      edNama.Text := Item.Nama;

//      if Item.StockUOM <> nil then
//        cxLookupUOM.EditValue := Item.StockUOM.ID;
    end;
  finally
    cxLookup.Free;
  end;
end;

end.
