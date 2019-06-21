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
    ckShowAvgCost: TcxCheckBox;
    ckGrupMerk: TcxCheckBox;
    cxGrid1Level2: TcxGridLevel;
    cxGrdSrv: TcxGridServerModeTableView;
    procedure edKodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edKodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edKodePropertiesValidate(Sender: TObject; var DisplayValue: Variant;
        var ErrorText: TCaption; var Error: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
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
    { Public declarations }
  end;

var
  frmLapStock: TfrmLapStock;

implementation

{$R *.dfm}

procedure TfrmLapStock.btnRefreshClick(Sender: TObject);
begin
  inherited;
  LoadData;
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
    'select id, nama from twarehouse','nama');
  cxLookupGudang.SetDefaultValue();
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
      +' M.NAMA AS MERK, N.NAMA AS ITEMGROUP,  ISNULL(J.HARGAAVG,0) as HARGAAVG,'
      +' ISNULL(SUM(A.QTYPCS) / J.KONVERSI  * J.HARGAAVG,0) AS TOTAL'
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

  S := S +' GROUP BY I.ID, I.KODE, I.NAMA, L.UOM,'
      +' I.ISACTIVE, J.KONVERSI, M.NAMA ,N.NAMA , J.HARGAAVG,'
      +' J.KONVERSI,J.HARGAAVG';

  FCDS := TDBUtils.OpenDataset(S);
  cxGrdMain.PrepareFromCDS(CDS);
  cxGrdMain.SetVisibleColumns(['HargaAvg','Total'], ckShowAvgCost.Checked);
  cxGrdMain.SetVisibleColumns(['Merk','ItemGroup'], ckGrupMerk.Checked);

//  cxGrdSrv.LoadFromSQL(S, 'ID');
//  cxGrdSrv.SetVisibleColumns(['HargaAvg','Total'], ckShowAvgCost.Checked);
//  cxGrdSrv.SetVisibleColumns(['Merk','ItemGroup'], ckGrupMerk.Checked);
end;

procedure TfrmLapStock.LookupItem(aKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  s: string;
begin
  s := 'SELECT A.ID, A.KODE, A.NAMA, C.NAMA AS MERK, B.NAMA AS ITEMGROUP, A.RAK'
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
