unit ufrmStockAdjustment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons, cxGroupBox, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxMaskEdit, cxCalendar, cxMemo, cxTextEdit, cxLabel,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxButtonEdit, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  uTransDetail, uDBUtils, uDXUtils, Datasnap.DBClient, uItem,
  ufrmCXServerLookup, cxGridDBDataDefinitions, uWarehouse, cxRadioGroup;

type
  TfrmStockAdjustment = class(TfrmDefaultInput)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel6: TcxLabel;
    edNotes: TcxMemo;
    dtSO: TcxDateEdit;
    cxLabel8: TcxLabel;
    cxLabel7: TcxLabel;
    cxLookupWH: TcxExtLookupComboBox;
    dtAdj: TcxDateEdit;
    cxLabel3: TcxLabel;
    edStockOpname: TcxButtonEdit;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colKode: TcxGridDBColumn;
    colNama: TcxGridDBColumn;
    colUOM: TcxGridDBColumn;
    colKonversi: TcxGridDBColumn;
    colQty: TcxGridDBColumn;
    colQtySys: TcxGridDBColumn;
    colItemID: TcxGridDBColumn;
    colVariant: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure btnSaveClick(Sender: TObject);
    procedure edStockOpnameKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edStockOpnamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    FCDS: TClientDataset;
    FCDSUOM: TClientDataset;
    FSA: TStockAdjustment;
    function GetCDS: TClientDataset;
    function GetCDSUOM: TClientDataset;
    function GetSA: TStockAdjustment;
    procedure InitView;
    procedure LookupStockOpname(sKey: string = '');
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSUOM: TClientDataset read GetCDSUOM write FCDSUOM;
    property SA: TStockAdjustment read GetSA write FSA;
    { Private declarations }
  protected
    function GetStockByItem(aItemID: Integer): Double;
  public
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = True);
    { Public declarations }
  end;

var
  frmStockAdjustment: TfrmStockAdjustment;

implementation

uses
  cxDataUtils, uAppUtils, System.DateUtils;

{$R *.dfm}

procedure TfrmStockAdjustment.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if SA.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmStockAdjustment.edStockOpnameKeyDown(Sender: TObject; var Key:
    Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
    LookupStockOpname();
end;

procedure TfrmStockAdjustment.edStockOpnamePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  LookupStockOpname();
end;

procedure TfrmStockAdjustment.FormCreate(Sender: TObject);
begin
  inherited;
  InitView;
  Self.AssignKeyDownEvent;
  LoadByID(0, False);
end;

procedure TfrmStockAdjustment.FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if Key = VK_F1 then
    edStockOpname.SetFocus;

end;

function TfrmStockAdjustment.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TStockOpnameItem.CreateDataSet(Self, False);
    FCDS.AddField('Kode',ftString);
    FCDS.AddField('Nama',ftString);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmStockAdjustment.GetCDSUOM: TClientDataset;
begin
  if FCDSUOM = nil then
  begin
    FCDSUOM := TDBUtils.OpenDataset('select id, uom from tuom',Self);
  end;
  Result := FCDSUOM;
end;

function TfrmStockAdjustment.GetSA: TStockAdjustment;
begin
  if FSA = nil then
    FSA := TStockAdjustment.Create;
  Result := FSA;
end;

function TfrmStockAdjustment.GetStockByItem(aItemID: Integer): Double;
var
  S: string;
begin
  Result := 0;

  S := 'SELECT I.ID, I.KODE, I.NAMA, L.UOM,I.STOCKUOM_ID,'
      +' I.ISACTIVE, ISNULL(SUM(A.QTYPCS) / J.KONVERSI, 0) AS QTY,'
      +' ISNULL(J.HARGAAVG,0) as HARGAAVG,'
      +' ISNULL(SUM(A.QTYPCS) / J.KONVERSI  * J.HARGAAVG,0) AS TOTAL'
      +' FROM FN_STOCK(' + TAppUtils.QuotD(dtSO.Date) + ') A'
      +' INNER JOIN TITEM I ON I .ID = A.ITEM_ID';

//  if ckItem.Checked then
    S := S + ' AND I.ID = ' + IntToStr(aItemID);

  S := S +' INNER JOIN TITEMUOM J ON I.ID = J.ITEM_ID AND J.UOM_ID = I.STOCKUOM_ID'
      +' INNER JOIN TUOM L ON L.ID = I.STOCKUOM_ID'
      +' WHERE A.WAREHOUSE_ID = ' + IntToStr(VarToInt(cxLookupWH.EditValue));

  S := S +' GROUP BY I.ID, I.KODE, I.NAMA, L.UOM,I.STOCKUOM_ID,'
      +' I.ISACTIVE, J.KONVERSI, J.HARGAAVG,'
      +' J.KONVERSI,J.HARGAAVG';

  with TDBUtils.OpenQuery(S) do
  begin
    Try
      if not eof then
        Result := FieldByName('Qty').AsFloat;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmStockAdjustment.InitView;
var
  s: string;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  TcxExtLookup(colUOM.Properties).LoadFromCDS(CDSUOM, 'id', 'uom', ['id'], Self);

  s := 'SELECT A.ID, A.KODE, A.NAMA, B.PROJECT_NAME AS CABANG, A.IS_EXTERNAL'
      +' FROM TWAREHOUSE A'
      +' LEFT JOIN TPROJECT B ON A.PROJECT_CODE = B.PROJECT_CODE'
      +' WHERE ISNULL(A.IS_EXTERNAL,0) = 0';

  cxLookupWH.Properties.LoadFromSQL(Self,s,'nama');
end;

procedure TfrmStockAdjustment.LoadByID(aID: Integer; IsReadOnly: Boolean =
    True);
var
  lItem: TStockOpnameItem;
begin
  if FSA <> nil then
    FreeAndNil(FSA);

  SA.LoadByID(aID);

  //def uom
  if aID = 0 then
  begin
    SA.TransDate := Now();
    SA.RefNo := SA.GenerateNo;
  end else
  begin
    SA.StockOpname.ReLoad(True);
  end;

  dtAdj.Date := SA.TransDate;
  dtSO.Date := SA.TransDate;
  edNotes.Text := SA.Notes;

  if SA.StockOpname <> nil then
  begin
    edStockOpname.Text := SA.StockOpname.RefNo;
    CDS.EmptyDataSet;
    for lItem in SA.StockOpname.Items do
    begin
      CDS.Append;
      lItem.UpdateToDataset(CDS);
      lItem.Item.ReLoad(False);
      CDS.FieldByName('Kode').AsString := lItem.Item.Kode;
      CDS.FieldByName('Nama').AsString := lItem.Item.Nama;
      CDS.Post;
    end;
  end;

  if SA.Warehouse <> nil then
    cxLookupWH.EditValue := SA.Warehouse.ID;


  btnSave.Enabled := not IsReadOnly;
end;

procedure TfrmStockAdjustment.LookupStockOpname(sKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  S: string;
  lItem: TStockOpnameItem;
begin
  S := 'SELECT A.ID, A.REFNO, A.TRANSDATE AS TGLSO, C.NAMA AS GUDANG, A.NOTES'
      +' FROM TSTOCKOPNAME A'
      +' LEFT JOIN TSTOCKADJUSTMENT B ON A.ID = B.STOCKOPNAME_ID'
      +' INNER JOIN TWAREHOUSE C ON A.WAREHOUSE_ID = C.ID'
      +' WHERE B.STOCKOPNAME_ID IS NULL'
      +' AND A.TRANSDATE BETWEEN :startdate AND :enddate';


  cxLookup := TfrmCXServerLookup.Execute(S, 'ID', StartOfTheMonth(Now()), EndOfTheMonth(Now()) );
  Try
    cxLookup.PreFilter('REFNO', sKey);
    if cxLookup.ShowModal = mrOK then
    begin
      if SA.StockOpname = nil then
        SA.StockOpname := TStockOpname.Create;

      SA.StockOpname.LoadByID(cxLookup.FieldValue('id'));

      edStockOpname.Text := SA.StockOpname.RefNo;
      dtSO.Date := SA.StockOpname.TransDate;
      dtAdj.Date := dtSo.Date;
//      edSupp.Text := PurchRetur.Supplier.Nama;
      cxLookupWH.EditValue := SA.StockOpname.Warehouse.ID;

      CDS.EmptyDataSet;

      for lItem in SA.StockOpname.Items do
      begin
        CDS.Append;
        lItem.UpdateToDataset(CDS);
        lItem.Item.ReLoad(False);
        CDS.FieldByName('Kode').AsString := lItem.Item.Kode;
        CDS.FieldByName('Nama').AsString := lItem.Item.Nama;
        CDS.Post;
      end;
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmStockAdjustment.UpdateData;
var
  lDetail: TTransDetail;
//  lFactor: Integer;
  lItem: TStockOpnameItem;
begin
  SA.RefNo := edStockOpname.Text;
  SA.TransDate := dtAdj.Date;
  SA.Notes := edNotes.Text;
  SA.ModifiedDate := Now();
  SA.ModifiedBy := UserLogin;

  if SA.Warehouse = nil then
    SA.Warehouse := TWarehouse.Create;

  SA.Warehouse.LoadByID(VarToInt(SA.StockOpname.Warehouse.ID));
  SA.Items.Clear;

  if SA.StockOpname.Items.Count = 0 then
  begin
    SA.StockOpname.ReLoad(True);
  end;

  for lItem in SA.StockOpname.Items do
  begin
    lDetail           := TTransDetail.Create;
    lDetail.Item      := TItem.CreateID(lItem.Item.ID);
    lDetail.UOM       := TUOM.CreateID(lItem.UOM.ID);
    lDetail.Konversi  := lItem.Konversi;
    lDetail.HargaAvg  := lItem.HargaAvg;
    lDetail.LastCost  := lItem.LastCost;
    lDetail.Qty       := lItem.Variant;
    lDetail.Warehouse := TWarehouse.CreateID(SA.Warehouse.ID);
    SA.Items.Add(lDetail);
  end;
end;

function TfrmStockAdjustment.ValidateData: Boolean;
begin
  Result := False;

  if SA.StockOpname = nil then
  begin
    TAppUtils.Warning('Stock Opname belum dipilih');
    exit;
  end;

  if SA.StockOpname.ID = 0 then
  begin
    TAppUtils.Warning('Stock Opname belum dipilih');
    exit;
  end;

  if VarToInt(cxLookupWH.EditValue) = 0 then
  begin
    TAppUtils.Warning('Gudang tidak boleh kosong');
    exit;
  end;

//  if CDS.State in [dsInsert, dsEdit] then CDS.Post;


  if CDS.RecordCount = 0 then
  begin
    TAppUtils.Warning('Data Item tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;

  Result := TAppUtils.Confirm('Anda yakin data sudah sesuai?');
end;

end.
