unit ufrmStockOpname;

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
  ufrmCXServerLookup, cxGridDBDataDefinitions, uWarehouse, cxRadioGroup,
  dxBarBuiltInMenu, cxPC;

type
  TfrmStockOpname = class(TfrmDefaultInput)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edRefno: TcxTextEdit;
    cxLabel6: TcxLabel;
    edNotes: TcxMemo;
    dtSO: TcxDateEdit;
    cxLabel8: TcxLabel;
    cxLabel7: TcxLabel;
    cxLookupWH: TcxExtLookupComboBox;
    rbSO: TcxRadioGroup;
    cxLabel2: TcxLabel;
    btnReloadStock: TcxButton;
    pgcMain: TcxPageControl;
    tsDetail: TcxTabSheet;
    tsKKSO: TcxTabSheet;
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
    cxGrid2: TcxGrid;
    cxGrdKKSO: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGrdKKSOColumn1: TcxGridDBColumn;
    cxGrdKKSOColumn2: TcxGridDBColumn;
    btnLoadKKSO: TcxButton;
    cxGrdKKSOColumn3: TcxGridDBColumn;
    procedure btnSaveClick(Sender: TObject);
    procedure colKodePropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure colKodePropertiesValidate(Sender: TObject; var DisplayValue: Variant;
        var ErrorText: TCaption; var Error: Boolean);
    procedure colUOMPropertiesCloseUp(Sender: TObject);
    procedure colUOMPropertiesEditValueChanged(Sender: TObject);
    procedure colUOMPropertiesInitPopup(Sender: TObject);
    procedure cxGrdMainEditKeyDown(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift:
        TShiftState);
    procedure edNotesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure colQtyPropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupWHPropertiesEditValueChanged(Sender: TObject);
    procedure btnReloadStockClick(Sender: TObject);
    procedure rbSOPropertiesEditValueChanged(Sender: TObject);
  private
    FCDS: TClientDataset;
    FCDSKKSO: TClientDataset;
    FCDSClone: TClientDataset;
    FCDSUOM: TClientDataset;
    FSO: TStockOpname;
    procedure CalculateAll;
    function DC: TcxGridDBDataController;
    procedure FocusToGrid;
    function GetCDS: TClientDataset;
    function GetCDSKKSO: TClientDataset;
    function GetCDSClone: TClientDataset;
    function GetCDSUOM: TClientDataset;
    function GetSO: TStockOpname;
    function GetCDSStock: TClientDataset;
    procedure InitView;
    procedure LookupItem(aKey: string = '');
    procedure SetItemToGrid(aItem: TItem);
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSKKSO: TClientDataset read GetCDSKKSO write FCDSKKSO;
    property CDSClone: TClientDataset read GetCDSClone write FCDSClone;
    property CDSUOM: TClientDataset read GetCDSUOM write FCDSUOM;
    property SO: TStockOpname read GetSO write FSO;
    { Private declarations }
  protected
    function GetStockByItem(aItemID: Integer): Double;
  public
    function GetGroupName: string; override;
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = True);
    { Public declarations }
  end;

var
  frmStockOpname: TfrmStockOpname;

implementation

uses
  cxDataUtils, uAppUtils, ufrmLookupItem;

{$R *.dfm}

procedure TfrmStockOpname.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if SO.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmStockOpname.CalculateAll;
begin
  if CDS.State in [dsInsert, dsEdit] then
    CDS.Post;

  CDS.DisableControls;
  Try
    CDSClone.First;
    while not CDSClone.Eof do
    begin
      CDSClone.Edit;
      CDSClone.FieldByName('Variant').AsFloat :=
        CDSClone.FieldByName('Qty').AsFloat - CDSClone.FieldByName('QtySys').AsFloat;
      CDSClone.Post;
      CDSClone.Next;
    end;

  Finally
    CDS.EnableControls;
  End;
end;

procedure TfrmStockOpname.colKodePropertiesButtonClick(Sender: TObject;
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

procedure TfrmStockOpname.colKodePropertiesValidate(Sender: TObject; var
    DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  lItem: TItem;
begin
  inherited;
  lItem := TItem.Create;
  Try
    if lItem.LoadByCode(VarToStr(DisplayValue)) then
      SetItemToGrid(lItem)
    else
    begin
      Error := True;
      ErrorText := 'Kode Barang : ' + VarToStr(DisplayValue) + ' tidak ditemukan';
    end;
  Finally
    lItem.Free;
  End;
end;

procedure TfrmStockOpname.colQtyPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalculateAll;
end;

procedure TfrmStockOpname.colUOMPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  with TcxExtLookup(colUOM.Properties).DataController.filter do
  begin
    BeginUpdate;
    Root.Clear;
    EndUpdate;
  end;
end;

procedure TfrmStockOpname.colUOMPropertiesEditValueChanged(Sender: TObject);
var
  lItemUOM: TItemUOM;
begin
  inherited;

  lItemUOM := TItemUOM.GetItemUOM(
    VarToInt(cxGrdMain.Controller.FocusedRecord.Values[colItemID.Index]),
    VarToInt(cxGrdMain.Controller.FocusedRecord.Values[colUOM.Index])
  );
  if lItemUOM = nil then exit;
  Try
    DC.SetEditValue(colKonversi.Index, lItemUOM.Konversi, evsValue);

    colQty.FocusWithSelection;
    cxGrdMain.Controller.EditingController.ShowEdit;
  Finally
    FreeAndNil(lItemUOM);
  End;
end;

procedure TfrmStockOpname.colUOMPropertiesInitPopup(Sender: TObject);
var
  lItem: TItem;
  lItemUOM: TItemUOM;
begin
  inherited;
  if cxGrdMain.Controller.FocusedRecord = nil then exit;
  lItem := TItem.Create;
  Try
    lItem.LoadByID(VarToInt(cxGrdMain.Controller.FocusedRecord.Values[colItemID.Index]));
    with TcxExtLookup(colUOM.Properties).DataController.filter do
    begin
      BeginUpdate;
      Root.Clear;
      Root.BoolOperatorKind := fboOr;

      for lItemUOM in lItem.ItemUOMs do
      begin
        Root.AddItem(
          TcxGridDBTableView(TcxExtLookup(colUOM.Properties).View).GetColumnByFieldName('ID'),
          foEqual, lItemUOM.UOM.ID, '');
      end;
      Active := True;
      EndUpdate;
    end;
  Finally
    lItem.Free;
  End;
end;

procedure TfrmStockOpname.btnReloadStockClick(Sender: TObject);
var
  lCDSStock: TClientDataset;
begin
  inherited;
  if CDS.State in [dsInsert, dsEdit] then
    CDS.Post;


  lCDSStock := GetCDSStock;
  CDS.DisableControls;
  Try
    if rbSO.ItemIndex = 0 then
    begin
      CDS.First;
      while not CDS.Eof do
      begin
        CDS.Edit;
        if lCDSStock.Locate('ID',CDS.FieldByName('Item').AsInteger,[]) then
          CDS.FieldByName('QtySys').AsFloat := lCDSStock.FieldByName('Qty').AsFloat
        else
          CDS.FieldByName('QtySys').AsFloat := 0;

        CDS.FieldByName('Variant').AsFloat := CDS.FieldByName('Qty').AsFloat - CDS.FieldByName('QtySys').AsFloat;
        CDS.Post;
        CDS.Next;
      end;
    end else
    begin
      lCDSStock.First;
      while not lCDSStock.Eof do
      begin
        if CDS.Locate('Item',lCDSStock.FieldByName('ID').AsInteger,[]) then
        begin
          CDS.Edit;
        end else
        begin
          CDS.Append;
          CDS.FieldByName('Item').AsInteger := lCDSStock.FieldByName('ID').AsInteger;
          CDS.FieldByName('Kode').AsString := lCDSStock.FieldByName('Kode').AsString;
          CDS.FieldByName('Nama').AsString := lCDSStock.FieldByName('Nama').AsString;
          CDS.FieldByName('UOM').AsInteger := lCDSStock.FieldByName('STOCKUOM_ID').AsInteger;
          CDS.FieldByName('Konversi').AsFloat := lCDSStock.FieldByName('Konversi').AsFloat;
          CDS.FieldByName('Qty').AsFloat := 0;
        end;
        CDS.FieldByName('QtySys').AsFloat := lCDSStock.FieldByName('Qty').AsFloat;
        CDS.FieldByName('Variant').AsFloat := CDS.FieldByName('Qty').AsFloat - CDS.FieldByName('QtySys').AsFloat;
        CDS.Post;
        lCDSStock.Next;
      end;
    end;
  Finally
    lCDSStock.Free;
    CDS.EnableControls;
  End;


end;

procedure TfrmStockOpname.cxGrdMainEditKeyDown(Sender: TcxCustomGridTableView;
    AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if (Key = VK_F5) and (aItem = colKode) then
  begin
    LookupItem(VarToStr(AEdit.EditingValue));
  end;
end;

procedure TfrmStockOpname.cxLookupWHPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CDS.EmptyDataSet;
end;

function TfrmStockOpname.DC: TcxGridDBDataController;
begin
  Result := cxGrdMain.DataController;
end;

procedure TfrmStockOpname.edNotesKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    FocusToGrid;
  end;
end;

procedure TfrmStockOpname.FocusToGrid;
begin
  pgcMain.ActivePage := tsDetail;
  cxGrid1.SetFocus;
  cxGrid1.FocusedView := cxGrdMain;
  if cxGrdMain.DataController.RecordCount = 0 then
  begin
    CDS.Append;
    cxGrdMain.Controller.EditingController.ShowEdit;
  end;
end;

procedure TfrmStockOpname.FormCreate(Sender: TObject);
begin
  inherited;
  InitView;
  Self.AssignKeyDownEvent;
  LoadByID(0, False);
end;

procedure TfrmStockOpname.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_F1 then
    edRefno.SetFocus;

  if Key = VK_F2 then
  begin
    FocusToGrid;
  end;
end;

function TfrmStockOpname.GetCDS: TClientDataset;
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

function TfrmStockOpname.GetCDSKKSO: TClientDataset;
begin
  if FCDSKKSO = nil then
  begin
    FCDSKKSO := TClientDataSet.Create(Self);
    FCDSKKSO.AddField('ItemID',ftInteger);
//    FCDSKKSO.AddField('UOMID',ftInteger);
    FCDSKKSO.AddField('Kode',ftString);
    FCDSKKSO.AddField('Nama',ftString);
    FCDSKKSO.AddField('KKSO',ftString);
    FCDSKKSO.AddField('Rak',ftString);
    FCDSKKSO.AddField('UOM',ftString);
    FCDSKKSO.AddField('Qty',ftFloat);
    FCDSKKSO.AddField('Konversi',ftFloat);
    FCDSKKSO.AddField('KonversiStock',ftFloat);
    FCDSKKSO.AddField('UOMStock',ftString);
    FCDSKKSO.AddField('QtyStock',ftFloat);
    FCDSKKSO.CreateDataSet;
  end;
  Result := FCDSKKSO;
end;

function TfrmStockOpname.GetCDSClone: TClientDataset;
begin
  if FCDSClone = nil then
  begin
    FCDSClone := CDS.ClonedDataset(Self);
  end;
  Result := FCDSClone;
end;

function TfrmStockOpname.GetCDSUOM: TClientDataset;
begin
  if FCDSUOM = nil then
  begin
    FCDSUOM := TDBUtils.OpenDataset('select id, uom from tuom',Self);
  end;
  Result := FCDSUOM;
end;

function TfrmStockOpname.GetSO: TStockOpname;
begin
  if FSO = nil then
    FSO := TStockOpname.Create;
  Result := FSO;
end;

function TfrmStockOpname.GetStockByItem(aItemID: Integer): Double;
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

function TfrmStockOpname.GetCDSStock: TClientDataset;
var
  S: string;
begin
  S := 'SELECT I.ID, I.KODE, I.NAMA, L.UOM,I.STOCKUOM_ID, J.KONVERSI,'
      +' I.ISACTIVE, ISNULL(SUM(A.QTYPCS) / J.KONVERSI, 0) AS QTY,'
      +' ISNULL(J.HARGAAVG,0) as HARGAAVG,'
      +' ISNULL(SUM(A.QTYPCS) / J.KONVERSI  * J.HARGAAVG,0) AS TOTAL'
      +' FROM FN_STOCK(' + TAppUtils.QuotD(dtSO.Date) + ') A'
      +' INNER JOIN TITEM I ON I .ID = A.ITEM_ID';

//  if ckItem.Checked then
//    S := S + ' AND I.ID = ' + IntToStr(aItemID);

  S := S +' INNER JOIN TITEMUOM J ON I.ID = J.ITEM_ID AND J.UOM_ID = I.STOCKUOM_ID'
      +' INNER JOIN TUOM L ON L.ID = I.STOCKUOM_ID'
      +' WHERE A.WAREHOUSE_ID = ' + IntToStr(VarToInt(cxLookupWH.EditValue));

  S := S +' GROUP BY I.ID, I.KODE, I.NAMA, L.UOM,I.STOCKUOM_ID, '
      +' I.ISACTIVE, J.KONVERSI, J.HARGAAVG';

  S := S +' HAVING ISNULL(SUM(A.QTYPCS) / J.KONVERSI, 0) <> 0';

  Result := TDBUtils.OpenDataset(S, Self);
end;

function TfrmStockOpname.GetGroupName: string;
begin
  Result := 'Inventory';
end;

procedure TfrmStockOpname.InitView;
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
  cxGrdKKSO.PrepareFromCDS(CDSKKSO);
end;

procedure TfrmStockOpname.LoadByID(aID: Integer; IsReadOnly: Boolean = True);
var
  lItem: TStockOpnameItem;
begin
  if FSO <> nil then
    FreeAndNil(FSO);

  SO.LoadByID(aID);

  //def uom
  if aID = 0 then
  begin
    SO.TransDate := Now();
    SO.RefNo := SO.GenerateNo;
  end;

  edRefno.Text := SO.RefNo;
  dtSO.Date := SO.TransDate;
  edNotes.Text := SO.Notes;
  rbSO.ItemIndex := SO.Transtype;

  if SO.Warehouse <> nil then
    cxLookupWH.EditValue := SO.Warehouse.ID;
  CDS.EmptyDataSet;


  for lItem in SO.Items do
  begin
    CDS.Append;
    lItem.UpdateToDataset(CDS);
    lItem.Item.ReLoad(False);
    CDS.FieldByName('Kode').AsString := lItem.Item.Kode;
    CDS.FieldByName('Nama').AsString := lItem.Item.Nama;
    CDS.Post;
  end;
  btnSave.Enabled := not IsReadOnly;
end;

procedure TfrmStockOpname.LookupItem(aKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  lItem: TItem;
  s: string;
begin

  lItem  := TItem.Create;
  Try
    s := 'SELECT A.ID, A.KODE, A.NAMA, C.NAMA AS MERK, B.NAMA AS ITEMGROUP, A.RAK'
        +' FROM TITEM A'
        +' LEFT JOIN TITEMGROUP B ON A.GROUP_ID = B.ID'
        +' LEFT JOIN TMERK C ON A.MERK_ID = C.ID';

    cxLookup := TfrmLookupItem.Execute(S,'ID');
    if aKey <> '' then
      cxLookup.PreFilter('Nama', aKey)
    else
      cxLookup.cxGrdMain.GetColumnByFieldName('NAMA').Focused := True;
    try
      if cxLookup.ShowModal = mrOK then
      begin
        lItem.LoadByID(cxLookup.FieldValue('ID'));
        SetItemToGrid(lItem);
      end;
    finally
      cxLookup.Free;
    end;
  Finally
    FreeAndNil(lItem);
  End;
end;

procedure TfrmStockOpname.rbSOPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CDS.EmptyDataSet;
  btnReloadStock.Caption := 'Load Stock System';
  if rbSo.ItemIndex = 1 then
    btnReloadStock.Visible := False;
//    btnReloadStock.Caption := 'Load Semua Stock System';

  btnLoadKKSO.Visible := rbSO.ItemIndex = 1;
  tsKKSO.TabVisible := rbSO.ItemIndex = 1;
  if rbSO.ItemIndex = 0 then
    pgcMain.ActivePage := tsDetail
  else
    pgcMain.ActivePage := tsKKSO;

  cxGrdMain.OptionsData.Appending := rbSO.ItemIndex = 0;
  cxGrdMain.OptionsData.Inserting := rbSO.ItemIndex = 0;
  cxGrdMain.OptionsData.Deleting := rbSO.ItemIndex = 0;
  cxGrdMain.OptionsData.DeletingConfirmation := rbSO.ItemIndex = 0;
  cxGrdMain.OptionsData.CancelOnExit := rbSO.ItemIndex = 0;
  cxGrdMain.OptionsData.Editing := rbSO.ItemIndex = 0;

end;

procedure TfrmStockOpname.SetItemToGrid(aItem: TItem);
var
  dStockSys: Double;
  lItemUOM: TItemUOM;
begin
  if VarToInt(cxLookupWH.EditValue) = 0 then
    raise Exception.Create('Gudang belum dipilih');

  if aItem = nil then exit;

  DC.SetEditValue(colItemID.Index, aItem.ID, evsValue);
//  DC.SetEditValue(colItemObject, Integer(aItem), evsValue);
  DC.SetEditValue(colKode.Index, aItem.Kode, evsValue);
  DC.SetEditValue(colNama.Index, aItem.Nama, evsValue);
  DC.SetEditValue(colUOM.Index, 0, evsValue);
  DC.SetEditValue(colQty.Index, 0, evsValue);
  DC.SetEditValue(colQtySys.Index, 0, evsValue);
  DC.SetEditValue(colVariant.Index, 0, evsValue);
  DC.SetEditValue(colKonversi.Index, 0, evsValue);

  //def uom
  if aItem.StockUOM <> nil then
  begin
    DC.SetEditValue(colUOM.Index, aItem.StockUOM.ID, evsValue);
//    colUOMPropertiesEditValueChanged(nil);
    lItemUOM := TItemUOM.GetItemUOM(
      VarToInt(cxGrdMain.Controller.FocusedRecord.Values[colItemID.Index]),
      VarToInt(cxGrdMain.Controller.FocusedRecord.Values[colUOM.Index])
    );
    if lItemUOM = nil then exit;
    Try
      DC.SetEditValue(colKonversi.Index, lItemUOM.Konversi, evsValue);
      dStockSys := GetStockByItem(aItem.ID);

      DC.SetEditValue(colQtySys.Index, dStockSys, evsValue);
      DC.SetEditValue(colVariant.Index, -1 * dStockSys , evsValue);
    Finally
      FreeAndNil(lItemUOM);
    End;
  end else
  begin
    raise Exception.Create('Satuan Stock atas Item : '+ aItem.Nama + ' belum didefinisikan') ;
  end;
end;

procedure TfrmStockOpname.UpdateData;
var
//  lFactor: Integer;
  lItem: TStockOpnameItem;
begin
  SO.RefNo := edRefno.Text;
  SO.TransDate := dtSO.Date;
  SO.Notes := edNotes.Text;
  SO.ModifiedDate := Now();
  SO.ModifiedBy := UserLogin;
  SO.Transtype := rbSO.ItemIndex;

  if SO.Warehouse = nil then
    SO.Warehouse := TWarehouse.Create;

  SO.Warehouse.LoadByID(VarToInt(cxLookupWH.EditValue));
  SO.Items.Clear;

//  lFactor := 1;

//  if SO.TransferType = Transfer_External_Out then
//    lFactor := -1;

  CDS.First;
  while not CDS.Eof do
  begin
    lItem := TStockOpnameItem.Create;
    lItem.Warehouse := TWarehouse.CreateID(VarToInt(cxLookupWH.EditValue));
    lItem.SetFromDataset(CDS);
    SO.Items.Add(lItem);
    CDS.Next;
  end;

end;

function TfrmStockOpname.ValidateData: Boolean;
var
  i: Integer;
  j: Integer;
begin
  Result := False;

  if VarToInt(cxLookupWH.EditValue) = 0 then
  begin
    TAppUtils.Warning('Gudang tidak boleh kosong');
    exit;
  end;

//  if CDS.State in [dsInsert, dsEdit] then CDS.Post;

  btnReloadStockClick(Self);

//  if CDS.RecordCount = 0 then
//  begin
//    TAppUtils.Warning('Data Item tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
//    exit;
//  end;
  if cxGrdMain.DataController.RecordCount = 0 then
  begin
    TAppUtils.Warning('Data Item tidak boleh kosong');
    exit;
  end;

  if CDS.Locate('Item', null, []) or CDS.Locate('Item', 0, []) then
  begin
    TAppUtils.Warning('Item tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;

  if CDS.Locate('UOM', null, []) or CDS.Locate('UOM', 0, []) then
  begin
    TAppUtils.Warning('Satuan tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;

  for i := 0 to DC.RecordCount-1 do
  begin
    if VarToInt(DC.Values[i,colItemID.Index]) = 0 then continue;
    for j := 0 to DC.RecordCount-1 do
    begin
      if i = j then continue;
      if VarToInt(DC.Values[i,colItemID.Index]) = VarToInt(DC.Values[j,colItemID.Index]) then
      begin
        TAppUtils.Warning('Ada duplikasi record atas item  : ' + VarToStr(DC.Values[i, colNama.Index]));
        exit;
      end;
    end;
  end;


  Result := TAppUtils.Confirm('Anda yakin data sudah sesuai?');
end;

end.
