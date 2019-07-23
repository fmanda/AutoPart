unit ufrmItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGroupBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxGridLevel,
  cxGrid, cxMemo, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxTextEdit, cxLabel, cxCurrencyEdit, dxBarBuiltInMenu,
  cxPC, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar, Datasnap.DBClient, uItem,
  cxCheckBox, Vcl.ExtCtrls, cxGridServerModeTableView, cxSpinEdit;

type
  TfrmItem = class(TfrmDefaultInput)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edKode: TcxTextEdit;
    cxLabel2: TcxLabel;
    edNama: TcxTextEdit;
    cxLookupGroup: TcxExtLookupComboBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLookupMerk: TcxExtLookupComboBox;
    cxLabel5: TcxLabel;
    edRak: TcxTextEdit;
    cxLabel6: TcxLabel;
    edNotes: TcxMemo;
    crPPN: TcxCurrencyEdit;
    cxLabel7: TcxLabel;
    btnDel: TcxButton;
    btnAdd: TcxButton;
    pgcMain: TcxPageControl;
    tsUOM: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGrdUOM: TcxGridDBBandedTableView;
    colSatuan: TcxGridDBBandedColumn;
    colKonversi: TcxGridDBBandedColumn;
    colHrgBeli: TcxGridDBBandedColumn;
    colMargin1: TcxGridDBBandedColumn;
    colHrgJual1: TcxGridDBBandedColumn;
    colMargin2: TcxGridDBBandedColumn;
    colHrgJual2: TcxGridDBBandedColumn;
    colMargin3: TcxGridDBBandedColumn;
    colHrgJual3: TcxGridDBBandedColumn;
    colMargin4: TcxGridDBBandedColumn;
    colHrgJual4: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    tsHistory: TcxTabSheet;
    lbModifiedBy: TcxLabel;
    edModifiedBy: TcxTextEdit;
    lbModified: TcxLabel;
    dtModified: TcxDateEdit;
    cxStyleRepository1: TcxStyleRepository;
    styleMoney: TcxStyle;
    styleInfoBk: TcxStyle;
    chkActive: TcxCheckBox;
    cxLookUpUOM: TcxExtLookupComboBox;
    cxLabel8: TcxLabel;
    tsAvgCost: TcxTabSheet;
    cxGroupBox3: TcxGroupBox;
    btnRefresh: TcxButton;
    EndDate: TcxDateEdit;
    StartDate: TcxDateEdit;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxGrid: TcxGrid;
    cxGrdAvg: TcxGridServerModeTableView;
    cxGridLevel1: TcxGridLevel;
    cxLabel11: TcxLabel;
    spLeadTime: TcxSpinEdit;
    cxLabel12: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure edRakKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
    procedure cxLookupGroupKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
    procedure cxLookupGroupPropertiesEditValueChanged(Sender: TObject);
    procedure colMargin1PropertiesEditValueChanged(Sender: TObject);
    procedure colMargin2PropertiesEditValueChanged(Sender: TObject);
    procedure colMargin3PropertiesEditValueChanged(Sender: TObject);
    procedure colMargin4PropertiesEditValueChanged(Sender: TObject);
    procedure colHrgJual4PropertiesEditValueChanged(Sender: TObject);
    procedure colHrgJual3PropertiesEditValueChanged(Sender: TObject);
    procedure colHrgJual2PropertiesEditValueChanged(Sender: TObject);
    procedure colHrgJual1PropertiesEditValueChanged(Sender: TObject);
    procedure colHrgBeliPropertiesEditValueChanged(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnRefreshClick(Sender: TObject);
  private
    FCDS: TClientDataset;
    FCDSUOM: TClientDataset;
    FItem: TItem;
    function GetCDS: TClientDataset;
    function GetCDSUOM: TClientDataset;
    function GetItem: TItem;
    procedure InitView;
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSUOM: TClientDataset read GetCDSUOM write FCDSUOM;
    property Item: TItem read GetItem write FItem;
    { Private declarations }
  public
    procedure CalcSellPrice(aIndexPrice: Integer; IsMargin: Boolean);
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = True);
    { Public declarations }
  end;

var
  frmItem: TfrmItem;

implementation

uses
  uDBUtils, uDXUtils, uAppUtils, cxDataUtils, System.DateUtils;

{$R *.dfm}

procedure TfrmItem.btnAddClick(Sender: TObject);
var
  iRec: Integer;
begin
  inherited;
  iRec := cxGrdUOM.DataController.AppendRecord;
  cxGrdUOM.DataController.FocusedRecordIndex  := iRec;
  colSatuan.Focused := True;
//  cxGrdUOM.Focused := True;
  cxGrid1.SetFocus;
  cxGrid1.FocusedView := cxGrdUOM;
end;

procedure TfrmItem.btnDelClick(Sender: TObject);
begin
  inherited;
  if not CDSUOM.EOf then
    CDSUOM.Delete;
end;

procedure TfrmItem.btnRefreshClick(Sender: TObject);
var
  s: string;
begin
  inherited;
  s := ' SELECT ID, TRANSDATE, REFNO, LASTAVGCOST, LASTSTOCKPCS, TRANSTOTALPCS, TRANSPRICEPCS, NEWAVGCOST'
     + ' FROM TAVGCOSTUPDATE WHERE ITEM_ID = ' + IntToStr(Item.ID);
  cxGrdAvg.LoadFromSQL(S, 'ID');
  cxGrdAvg.EnableFiltering();
end;

procedure TfrmItem.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if Item.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmItem.CalcSellPrice(aIndexPrice: Integer; IsMargin: Boolean);
var
  iRec: TcxCustomGridRecord;
  lBuyPrice: Double;
begin
  cxGrdUOM.DataController.Post();
  iRec      := cxGrdUOM.Controller.FocusedRecord;
  if iRec = nil then exit;

  lBuyPrice := iRec.Values[colHrgBeli.Index];

  if IsMargin then
  begin
    case aIndexPrice of
      1 : cxGrdUOM.DataController.SetEditValue(colHrgJual1.Index,
          lBuyPrice * (1 + (iRec.Values[colMargin1.Index] /100)),  evsValue);
      2 : cxGrdUOM.DataController.SetEditValue(colHrgJual2.Index,
          lBuyPrice * (1 + (iRec.Values[colMargin2.Index] /100)),  evsValue);
      3 : cxGrdUOM.DataController.SetEditValue(colHrgJual3.Index,
          lBuyPrice * (1 + (iRec.Values[colMargin3.Index] /100)),  evsValue);
      4 : cxGrdUOM.DataController.SetEditValue(colHrgJual4.Index,
          lBuyPrice * (1 + (iRec.Values[colMargin4.Index] /100)),  evsValue);
    end;
  end else
  begin
    if lBuyPrice = 0 then exit;

    case aIndexPrice of
      1 : cxGrdUOM.DataController.SetEditValue(colMargin1.Index,
          (iRec.Values[colHrgJual1.Index] - lBuyPrice) / lBuyPrice * 100,  evsValue);
      2 : cxGrdUOM.DataController.SetEditValue(colMargin2.Index,
          (iRec.Values[colHrgJual2.Index] - lBuyPrice) / lBuyPrice * 100,  evsValue);
      3 : cxGrdUOM.DataController.SetEditValue(colMargin3.Index,
          (iRec.Values[colHrgJual3.Index] - lBuyPrice) / lBuyPrice * 100,  evsValue);
      4 : cxGrdUOM.DataController.SetEditValue(colMargin4.Index,
          (iRec.Values[colHrgJual4.Index] - lBuyPrice) / lBuyPrice * 100,  evsValue);
    end;
  end;

end;

procedure TfrmItem.colHrgBeliPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalcSellPrice(1, False);
  CalcSellPrice(2, False);
  CalcSellPrice(3, False);
  CalcSellPrice(4, False);
end;

procedure TfrmItem.colHrgJual1PropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalcSellPrice(1, False);
end;

procedure TfrmItem.colHrgJual2PropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalcSellPrice(2, False);
end;

procedure TfrmItem.colHrgJual3PropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalcSellPrice(3, False);
end;

procedure TfrmItem.colHrgJual4PropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalcSellPrice(4, False);
end;

procedure TfrmItem.colMargin1PropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalcSellPrice(1, True);
end;

procedure TfrmItem.colMargin2PropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalcSellPrice(2, True);
end;

procedure TfrmItem.colMargin3PropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalcSellPrice(3, True);
end;

procedure TfrmItem.colMargin4PropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalcSellPrice(4, True);
end;

procedure TfrmItem.cxLookupGroupKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    edKode.SetFocus;
    edKode.SelectAll;
  end;
end;

procedure TfrmItem.cxLookupGroupPropertiesEditValueChanged(Sender: TObject);
var
  lGroup: TItemGroup;
begin
  inherited;
  if VarIsNull(cxLookupGroup.EditValue) then exit;

  if Item.ID = 0 then
  begin
    lGroup := TItemGroup.Create;
    lGroup.LoadByID(cxLookupGroup.EditValue);

    edKode.Text := Item.GenerateNo(lGroup.Kode,5);
    lGroup.Free;
  end;
end;

procedure TfrmItem.edRakKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    cxGrid1.SetFocus;
end;

procedure TfrmItem.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  initView;
  StartDate.Date  := StartOfTheYear(Now());
  EndDate.Date    := Now();
end;

procedure TfrmItem.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_F2 then
  begin
    cxGrid1.SetFocus;
  end
  else if Key = VK_F1 then
  begin
    cxLookupGroup.SetFocus;
  end;
end;

function TfrmItem.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TItemUOM.CreateDataSet(Self, False);
    FCDS.AddField('Margin1',ftFloat);
    FCDS.AddField('Margin2',ftFloat);
    FCDS.AddField('Margin3',ftFloat);
    FCDS.AddField('Margin4',ftFloat);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmItem.GetCDSUOM: TClientDataset;
begin
  if FCDSUOM = nil then
    FCDSUOM := TDBUtils.OpenDataset(
        'select id, uom from tuom', Self
      );
  Result := FCDSUOM;
end;

function TfrmItem.GetItem: TItem;
begin
  if FItem = nil then
    FItem := TItem.Create;

  Result := FItem;
end;

procedure TfrmItem.InitView;
begin
  cxGrdUOM.PrepareFromCDS(CDS);
  cxLookupGroup.LoadFromSQL('select id, nama from titemgroup','id','nama',Self);
  cxLookupMerk.LoadFromSQL('select id, nama from tmerk','id','nama',Self);
  TcxExtLookup(colSatuan.Properties).LoadFromCDS(CDSUOM, 'id','uom', Self);
  cxLookUpUOM.LoadFromSQL('select id, uom from tuom order by id','id','uom', self);
  cxLookUpUOM.SetDefaultValue();
  pgcMain.ActivePage := tsUOM;
  LoadByID(0, False);
end;

procedure TfrmItem.LoadByID(aID: Integer; IsReadOnly: Boolean = True);
var
  lItemUOM: TItemUOM;
begin
  if FItem <> nil then
    FreeAndNil(FItem);

  Item.LoadByID(aID);

  //def uom
  if aID = 0 then
  begin
    CDSUOM.First;
    if not CDSUOM.Eof then
    begin
      lItemUOM      := TItemUOM.Create;
      lItemUOM.UOM  := TUOM.CreateID(CDSUOM.FieldByName('ID').AsInteger);
      lItemUOM.Konversi := 1;
      FItem.ItemUOMs.Add(lItemUOM);
    end;

    Item.IsActive := 1;
    Item.LeadTime := 1;
  end;

  edKode.Text   := Item.Kode;
  edNama.Text   := Item.Nama;
  edNotes.Text  := Item.Notes;
  edRak.Text    := Item.Rak;
  spLeadTime.Value := Item.LeadTime;

  if Item.Merk <> nil then
    cxLookupMerk.EditValue := Item.Merk.Id;

  if Item.Group <> nil then
    cxLookupGroup.EditValue := Item.Group.ID;

  if Item.StockUOM <> nil then
    cxLookUpUOM.EditValue := Item.StockUOM.ID;

  CDS.EmptyDataSet;
  for lItemUOM in Item.ItemUOMs do
  begin
    CDS.Append;
    lItemUOM.UpdateToDataset(CDS);

    if lItemUOM.HargaBeli = 0 then
    begin
      CDS.FieldByName('Margin1').AsFloat := 0;
      CDS.FieldByName('Margin2').AsFloat := 0;
      CDS.FieldByName('Margin3').AsFloat := 0;
      CDS.FieldByName('Margin4').AsFloat := 0;
    end else
    begin
      CDS.FieldByName('Margin1').AsFloat := (lItemUOM.HargaJual1 - lItemUOM.HargaBeli) / lItemUOM.HargaBeli * 100;
      CDS.FieldByName('Margin2').AsFloat := (lItemUOM.HargaJual2 - lItemUOM.HargaBeli) / lItemUOM.HargaBeli * 100;
      CDS.FieldByName('Margin3').AsFloat := (lItemUOM.HargaJual3 - lItemUOM.HargaBeli) / lItemUOM.HargaBeli * 100;
      CDS.FieldByName('Margin4').AsFloat := (lItemUOM.HargaJual4 - lItemUOM.HargaBeli) / lItemUOM.HargaBeli * 100;
    end;

    CDS.Post;
  end;

  chkActive.Checked := Item.IsActive = 1;

  btnSave.Enabled := not IsReadOnly;
//  btnAdd.Enabled  := not IsReadOnly;
//  btnDel.Enabled  := not IsReadOnly;


end;

procedure TfrmItem.UpdateData;
var
  lUOM: TItemUOM;
begin
  Item.Kode := edKode.Text;
  Item.Nama := edNama.Text;
  Item.Group.Free;
  Item.Merk.Free;
  Item.Rak  := edRak.Text;
  Item.LeadTime := spLeadTime.Value;

  if not VarIsNull(cxLookupGroup.EditValue) then
    Item.Group := TItemGroup.CreateID(VarToInt(cxLookupGroup.EditValue));

  if not VarIsNull(cxLookupMerk.EditValue) then
    Item.Merk := TMerk.CreateID(VarToInt(cxLookupMerk.EditValue));

  Item.Notes := edNotes.Text;

  Item.ModifiedBy := UserLogin;
  Item.PPN := crPPN.Value;
  Item.ModifiedDate := Now();
  Item.ItemUOMs.Clear;

  Item.StockUOM := TUOM.CreateID(VarToInt(cxLookUpUOM.EditValue));

  CDS.First;
  while not CDS.Eof do
  begin
    lUOM := TItemUOM.Create;
    lUOM.SetFromDataset(CDS);
    Item.ItemUOMs.Add(lUOM);
    CDS.Next;
  end;

  Item.IsActive := 1;
  if not chkActive.Checked then Item.IsActive := 0;

end;

function TfrmItem.ValidateData: Boolean;
var
  bWarningHJ: Boolean;
begin
  Result := False;

  if VarIsNull(cxLookupGroup.EditValue) then
  begin
    TAppUtils.Warning('Group wajib diisi');
    cxLookupGroup.SetFocus;
    exit;
  end;

  if edKode.Text = '' then
  begin
    TAppUtils.Warning('Kode wajib diisi');
    edKode.SetFocus;
    exit;
  end;

  if edNama.Text = '' then
  begin
    TAppUtils.Warning('Nama wajib diisi');
    edNama.SetFocus;
    exit;
  end;

  if VarToInt(cxLookupUOM.EditValue)=0 then
  begin
    TAppUtils.Warning('Satuan Stock tidak boleh kosong');
    exit;
  end;


  if CDS.RecordCount = 0 then
  begin
    TAppUtils.Warning('Data Satuan tidak boleh kosong');
    exit;
  end;

  if CDS.Locate('HargaBeli', 0, []) then
  begin
    TAppUtils.Warning('Harga Beli tidak boleh 0');
    exit;
  end;

  if not CDS.Locate('UOM', VarToInt(cxLookupUOM.EditValue), []) then
  begin
    TAppUtils.Warning('Satuan Stock belum didefinisikan konversi dan harga nya');
    exit;
  end;


  CDS.First;
  while not CDS.Eof do
  begin
    if CDS.FieldByName('Konversi').AsFloat <=0 then
    begin
      TAppUtils.Warning('Konversi tidak boleh <= 0');
      exit;
    end;
    CDS.Next;
  end;

  //warning
  bWarningHJ := False;
  CDS.First;
  while not CDS.Eof do
  begin
    if (CDS.FieldByName('HargaJual1').AsFloat < CDS.FieldByName('HargaBeli').AsFloat)
      or (CDS.FieldByName('HargaJual2').AsFloat < CDS.FieldByName('HargaBeli').AsFloat)
      or (CDS.FieldByName('HargaJual3').AsFloat < CDS.FieldByName('HargaBeli').AsFloat)
      or (CDS.FieldByName('HargaJual4').AsFloat < CDS.FieldByName('HargaBeli').AsFloat)
    then
    begin
      bWarningHJ := True;
      break;
    end;
    CDS.Next;
  end;

  if bWarningHJ then
  begin
    if not TAppUtils.Confirm('Ada harga jual yang < harga beli, Apakah anda yakin lanjut simpan? ') then
      exit;
  end;

  Result := True;

end;

end.
