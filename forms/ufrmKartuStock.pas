unit ufrmKartuStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxButtonEdit, cxCheckBox,
  cxDropDownEdit, cxCalendar, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxTextEdit, cxCurrencyEdit, Datasnap.DBClient,
  System.DateUtils, uItem;

type
  TfrmKartuStock = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edNama: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLookupGudang: TcxExtLookupComboBox;
    dtStart: TcxDateEdit;
    chkAll: TcxCheckBox;
    edKode: TcxButtonEdit;
    dtEnd: TcxDateEdit;
    cxLabel5: TcxLabel;
    cxGrdMain: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    colTransDate: TcxGridDBColumn;
    colRefNo: TcxGridDBColumn;
    colNotes: TcxGridDBColumn;
    colQty: TcxGridDBColumn;
    colSaldo: TcxGridDBColumn;
    cxLookupUOM: TcxExtLookupComboBox;
    cxLabel6: TcxLabel;
    colUOM: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure chkAllPropertiesEditValueChanged(Sender: TObject);
    procedure cxLookupUOMPropertiesCloseUp(Sender: TObject);
    procedure cxLookupUOMPropertiesInitPopup(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure edKodeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edKodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edKodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGroupBox2Click(Sender: TObject);
  private
    FCDS: TClientDataset;
    FItem: TItem;
    function GetCDS: TClientDataset;
    function GetItem: TItem;
    procedure InitView;
    procedure LoadData;
    procedure LookupItem(aKey: string = '');
    property CDS: TClientDataset read GetCDS write FCDS;
    property Item: TItem read GetItem write FItem;
    { Private declarations }
  public
    function GetGroupName: string; override;
    procedure LoadByID(aItemID, aGudangID: Integer);
    { Public declarations }
  end;

var
  frmKartuStock: TfrmKartuStock;

implementation

uses
  uDBUtils, uDXUtils, uAppUtils, ufrmCXServerLookup;

{$R *.dfm}

procedure TfrmKartuStock.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmKartuStock.btnRefreshClick(Sender: TObject);
begin
  inherited;
  if YearOf(dtStart.Date) <> YearOf(dtEnd.Date) then
  begin
    TAppUtils.Warning('Tidak bisa lintas tahun');
    exit;
  end;
  LoadData;
end;

procedure TfrmKartuStock.chkAllPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  cxLookupGudang.Enabled := not chkAll.Checked;
end;

procedure TfrmKartuStock.cxGroupBox2Click(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TfrmKartuStock.cxLookupUOMPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  with cxLookupUOM.Properties.DataController.filter do
  begin
    BeginUpdate;
    Root.Clear;
    EndUpdate;
  end;
end;

procedure TfrmKartuStock.cxLookupUOMPropertiesInitPopup(Sender: TObject);
var
  lItem: TItem;
  lItemUOM: TItemUOM;
begin
  inherited;
  lItem := TItem.Create;
  Try
    lItem.LoadByCode(edKode.Text);
    with cxLookupUOM.Properties.DataController.filter do
    begin
      BeginUpdate;
      Root.Clear;
      Root.BoolOperatorKind := fboOr;

      for lItemUOM in lItem.ItemUOMs do
      begin
        Root.AddItem(
          TcxGridDBTableView(cxLookupUOM.Properties.View).GetColumnByFieldName('ID'),
          foEqual, lItemUOM.UOM.ID, '');
      end;
      Active := True;
      EndUpdate;
    end;
  Finally
    lItem.Free;
  End;
end;

procedure TfrmKartuStock.edKodeKeyDown(Sender: TObject; var Key: Word; Shift:
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

procedure TfrmKartuStock.edKodePropertiesButtonClick(Sender: TObject;
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

procedure TfrmKartuStock.edKodePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;

  if Item.LoadByCode(VarToStr(DisplayValue)) then
  begin
    edKode.Text := Item.Kode;
    edNama.Text := Item.Nama;
    if Item.StockUOM <> nil then
      cxLookupUOM.EditValue := Item.StockUOM.ID;
  end
  else
  begin
    Error := True;
    ErrorText := 'Kode Barang : ' + VarToStr(DisplayValue) + ' tidak ditemukan';
  end;

end;

procedure TfrmKartuStock.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  InitView;
  dtStart.Date  := (Now());
  dtEnd.Date    := (Now());
end;

function TfrmKartuStock.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TClientDataSet.Create(Self);
    FCDS.AddField('TransDate', ftDate);
    FCDS.AddField('RefNo', ftString);
    FCDS.AddField('Notes', ftString);
    FCDS.AddField('Qty', ftFloat);
    FCDS.AddField('Saldo', ftFloat);
    FCDS.AddField('Satuan', ftString);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmKartuStock.GetGroupName: string;
begin
  Result := 'Inventory';
end;

function TfrmKartuStock.GetItem: TItem;
begin
  if FItem = nil then
    FItem := TItem.Create;
  Result := FItem;
end;

procedure TfrmKartuStock.InitView;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  cxLookupUOM.Properties.LoadFromSQL(Self,
    'select id, uom from tuom','uom');
  cxLookupGudang.Properties.LoadFromSQL(Self,
    'select id, nama from twarehouse where is_external = 0','nama');
  cxLookupGudang.SetDefaultValue();
end;

procedure TfrmKartuStock.LoadByID(aItemID, aGudangID: Integer);
begin
  dtStart.Date := StartOfTheMonth(Now());
  dtEnd.Date := EndOfTheMonth(Now());
  Item.LoadByID(aItemID);
  edKode.Text := Item.Kode;
  edNama.Text := Item.Nama;

  if Item.StockUOM <> nil then
    cxLookupUOM.EditValue := Item.StockUOM.ID;

  chkAll.Checked := aGudangID = 0;
  cxLookupGudang.EditValue := aGudangID;

  LoadData;
end;

procedure TfrmKartuStock.LoadData;
var
  iKonversi: Double;
  iWarehouseID: Integer;
  lSaldo: Double;
  S: string;
begin
  if Item.ID = 0 then
  begin
    TAppUtils.Warning('Barang belum dipilih');
    exit;
  end;
  if VarToInt(cxLookupUOM.EditValue) = 0 then
  begin
    TAppUtils.Warning('Satuan belum dipilih');
    exit;
  end;

  iWarehouseID := 0;
  iKonversi := Item.GetKonversi(VarToInt(cxLookupUOM.EditValue));

  if not chkAll.Checked then
    iWarehouseID := VarToInt(cxLookupGudang.EditValue);

  CDS.DisableControls;
  Try
    CDS.EmptyDataSet;

    S := 'SELECT * FROM FN_KARTU_STOCK(' + IntToStr(Item.ID)
        + ',' + TAppUtils.QuotD(dtStart.Date)
        + ',' + TAppUtils.QuotD(dtEnd.Date)
        + ',' + IntToStr(iWarehouseID) +')';

    lSaldo := 0;
    with TDBUtils.OpenQuery(S) do
    begin
      Try
        while not eof do
        begin
          CDS.Append;
          CDS.FieldByName('TransDate').AsDateTime := FieldByName('TransDate').AsDateTime;
          CDS.FieldByName('Refno').AsString       := FieldByName('Refno').AsString;
          CDS.FieldByName('Notes').AsString       := FieldByName('Notes').AsString;
          CDS.FieldByName('Qty').AsFloat          := FieldByName('QtyPCS').AsFloat / iKonversi;
          CDS.FieldByName('Satuan').AsString      := cxLookupUOM.Text;

          lSaldo := lSaldo + CDS.FieldByName('Qty').AsFloat;

          CDS.FieldByName('Saldo').AsFloat        := lSaldo;
          CDS.Post;
          next;
        end;
      Finally
        Free;
      End;
    end;
  Finally
    CDS.EnableControls;
  End;

end;

procedure TfrmKartuStock.LookupItem(aKey: string = '');
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

      if Item.StockUOM <> nil then
        cxLookupUOM.EditValue := Item.StockUOM.ID;
    end;
  finally
    cxLookup.Free;
  end;
end;

end.
