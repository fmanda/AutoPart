unit ufrmPriceQuotation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons, cxGroupBox, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB,
  cxDBData, cxDBExtLookupComboBox, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxGridCustomView, cxGrid, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxMemo, cxTextEdit, cxLabel, cxCheckBox,
  cxButtonEdit, uPriceQuotation, Datasnap.DBClient, cxGridDBDataDefinitions,
  uItem;

type
  TfrmPriceQuotation = class(TfrmDefaultInput)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edRefno: TcxTextEdit;
    cxLabel6: TcxLabel;
    edNotes: TcxMemo;
    dtQuot: TcxDateEdit;
    cxLabel8: TcxLabel;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBBandedTableView;
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
    colItemCode: TcxGridDBBandedColumn;
    colItemName: TcxGridDBBandedColumn;
    chkActive: TcxCheckBox;
    lbModifiedBy: TcxLabel;
    edModifiedBy: TcxTextEdit;
    lbModified: TcxLabel;
    dtModified: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    colItemID: TcxGridDBBandedColumn;
    procedure cxGrdMainEditKeyDown(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift:
        TShiftState);
    procedure edNotesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure colItemCodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure colItemCodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure colHrgBeliPropertiesEditValueChanged(Sender: TObject);
    procedure colMargin1PropertiesEditValueChanged(Sender: TObject);
    procedure colMargin2PropertiesEditValueChanged(Sender: TObject);
    procedure colMargin3PropertiesEditValueChanged(Sender: TObject);
    procedure colMargin4PropertiesEditValueChanged(Sender: TObject);
    procedure colHrgJual1PropertiesEditValueChanged(Sender: TObject);
    procedure colHrgJual2PropertiesEditValueChanged(Sender: TObject);
    procedure colHrgJual3PropertiesEditValueChanged(Sender: TObject);
    procedure colHrgJual4PropertiesEditValueChanged(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    FCDS: TClientDataset;
    FCDSClone: TClientDataset;
    FCDSUOM: TClientDataset;
    FPriceQuot: TPriceQuotation;
    procedure CalcSellPrice(aIndexPrice: Integer; IsMargin: Boolean);
    function DC: TcxGridDBDataController;
    procedure FocusToGrid;
    function GetCDS: TClientDataset;
    function GetCDSClone: TClientDataset;
    function GetCDSUOM: TClientDataset;
    function GetPriceQuot: TPriceQuotation;
    procedure InitView;
    procedure LookupItem(aKey: string = '');
    procedure SetItemToGrid(aItem: TItem);
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSClone: TClientDataset read GetCDSClone write FCDSClone;
    property CDSUOM: TClientDataset read GetCDSUOM write FCDSUOM;
    property PriceQuot: TPriceQuotation read GetPriceQuot write FPriceQuot;
    { Private declarations }
  protected
  public
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = False);
    { Public declarations }
  published
  end;

var
  frmPriceQuotation: TfrmPriceQuotation;

implementation

uses
  uDXUtils, Dateutils, uDBUtils, ufrmCXServerLookup, cxDataUtils, uAppUtils,
  Strutils;

{$R *.dfm}

procedure TfrmPriceQuotation.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if PriceQuot.SaveToDB then
  begin
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmPriceQuotation.CalcSellPrice(aIndexPrice: Integer; IsMargin:
    Boolean);
var
  iRec: TcxCustomGridRecord;
  lBuyPrice: Double;
begin
  cxGrdMain.DataController.Post();
  iRec      := cxGrdMain.Controller.FocusedRecord;
  if iRec = nil then exit;

  lBuyPrice := iRec.Values[colHrgBeli.Index];

  if IsMargin then
  begin
    case aIndexPrice of
      1 : cxGrdMain.DataController.SetEditValue(colHrgJual1.Index,
          lBuyPrice * (1 + (iRec.Values[colMargin1.Index] /100)),  evsValue);
      2 : cxGrdMain.DataController.SetEditValue(colHrgJual2.Index,
          lBuyPrice * (1 + (iRec.Values[colMargin2.Index] /100)),  evsValue);
      3 : cxGrdMain.DataController.SetEditValue(colHrgJual3.Index,
          lBuyPrice * (1 + (iRec.Values[colMargin3.Index] /100)),  evsValue);
      4 : cxGrdMain.DataController.SetEditValue(colHrgJual4.Index,
          lBuyPrice * (1 + (iRec.Values[colMargin4.Index] /100)),  evsValue);
    end;
  end else
  begin
    if lBuyPrice = 0 then exit;

    case aIndexPrice of
      1 : cxGrdMain.DataController.SetEditValue(colMargin1.Index,
          (iRec.Values[colHrgJual1.Index] - lBuyPrice) / lBuyPrice * 100,  evsValue);
      2 : cxGrdMain.DataController.SetEditValue(colMargin2.Index,
          (iRec.Values[colHrgJual2.Index] - lBuyPrice) / lBuyPrice * 100,  evsValue);
      3 : cxGrdMain.DataController.SetEditValue(colMargin3.Index,
          (iRec.Values[colHrgJual3.Index] - lBuyPrice) / lBuyPrice * 100,  evsValue);
      4 : cxGrdMain.DataController.SetEditValue(colMargin4.Index,
          (iRec.Values[colHrgJual4.Index] - lBuyPrice) / lBuyPrice * 100,  evsValue);
    end;
  end;

end;

procedure TfrmPriceQuotation.colHrgBeliPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalcSellPrice(1, False);
  CalcSellPrice(2, False);
  CalcSellPrice(3, False);
  CalcSellPrice(4, False);
end;

procedure TfrmPriceQuotation.colHrgJual1PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalcSellPrice(1, False);
end;

procedure TfrmPriceQuotation.colHrgJual2PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalcSellPrice(2, False);
end;

procedure TfrmPriceQuotation.colHrgJual3PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalcSellPrice(3, False);
end;

procedure TfrmPriceQuotation.colHrgJual4PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalcSellPrice(4, False);
end;

procedure TfrmPriceQuotation.colItemCodePropertiesButtonClick(Sender: TObject;
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

procedure TfrmPriceQuotation.colItemCodePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
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

procedure TfrmPriceQuotation.colMargin1PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalcSellPrice(1, True);
end;

procedure TfrmPriceQuotation.colMargin2PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalcSellPrice(2, True);
end;

procedure TfrmPriceQuotation.colMargin3PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalcSellPrice(3, True);
end;

procedure TfrmPriceQuotation.colMargin4PropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalcSellPrice(4, True);
end;

procedure TfrmPriceQuotation.cxGrdMainEditKeyDown(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit:
    TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) and (aItem = colItemCode) then
  begin
    LookupItem(VarToStr(AEdit.EditingValue));
  end;
end;

function TfrmPriceQuotation.DC: TcxGridDBDataController;
begin
  Result := cxGrdMain.DataController;
end;

procedure TfrmPriceQuotation.edNotesKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if Key = VK_Return then
    FocusToGrid;
end;

procedure TfrmPriceQuotation.FocusToGrid;
begin
  cxGrid1.SetFocus;
  cxGrid1.FocusedView := cxGrdMain;
  if CDS.RecordCount = 0 then
  begin
    CDS.Append;
    cxGrdMain.Controller.EditingController.ShowEdit;
  end;
end;

procedure TfrmPriceQuotation.FormCreate(Sender: TObject);
begin
  inherited;
  cxGrdMain.OptionsView.Header := False;
  Self.AssignKeyDownEvent;
  InitView;
  LoadByID(0);
end;

procedure TfrmPriceQuotation.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    FocusToGrid
  else if Key = VK_F1 then
    edNotes.SetFocus;

end;

function TfrmPriceQuotation.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TPriceQuotationItem.CreateDataSet(Self, False);
    FCDS.AddField('ItemCode', ftString);
    FCDS.AddField('ItemName', ftString);
//    FCDS.AddField('Konversi', ftFloat);
    FCDS.AddField('Margin1',ftFloat);
    FCDS.AddField('Margin2',ftFloat);
    FCDS.AddField('Margin3',ftFloat);
    FCDS.AddField('Margin4',ftFloat);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmPriceQuotation.GetCDSClone: TClientDataset;
begin
  if FCDSClone = nil then
  begin
    FCDSClone := CDS.ClonedDataset(Self);
  end;
  Result := FCDSClone;
end;

function TfrmPriceQuotation.GetCDSUOM: TClientDataset;
begin
  if FCDSUOM = nil then
    FCDSUOM := TDBUtils.OpenDataset(
        'select id, uom from tuom', Self
      );
  Result := FCDSUOM;
end;

function TfrmPriceQuotation.GetPriceQuot: TPriceQuotation;
begin
  if FPriceQuot = nil then
    FPriceQuot := TPriceQuotation.Create;
  Result := FPriceQuot;
end;

procedure TfrmPriceQuotation.InitView;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  TcxExtLookup(colSatuan.Properties).LoadFromCDS(CDSUOM, 'id','uom', Self);
end;

procedure TfrmPriceQuotation.LoadByID(aID: Integer; IsReadOnly: Boolean =
    False);
var
  lItem: TPriceQuotationItem;
begin
  if FPriceQuot <> nil then
    FreeAndNil(FPriceQuot);

  if aID = 0 then
  begin
    PriceQuot.TransDate := Now();
    PriceQuot.Refno := PriceQuot.GenerateNo;
    PriceQuot.IsActive := 1;
  end else
    PriceQuot.LoadByID(aID);

  edRefno.Text := PriceQuot.Refno;
  dtQuot.Date := PriceQuot.TransDate;
  edNotes.Text := PriceQuot.Notes;
  dtModified.Date := PriceQuot.ModifiedDate;
  edModifiedBy.Text := PriceQuot.ModifiedBy;
  chkActive.Checked := PriceQuot.IsActive = 1;

  CDS.EmptyDataSet;
  for lItem in PriceQuot.Items do
  begin
    CDS.Append;
    lItem.UpdateToDataset(CDS);

    lItem.Item.ReLoad();
    CDS.FieldByName('ItemCode').AsString := lItem.Item.Kode;
    CDS.FieldByName('ItemName').AsString := lItem.Item.Nama;
    if lItem.HargaBeli = 0 then
    begin
      CDS.FieldByName('Margin1').AsFloat := 0;
      CDS.FieldByName('Margin2').AsFloat := 0;
      CDS.FieldByName('Margin3').AsFloat := 0;
      CDS.FieldByName('Margin4').AsFloat := 0;
    end else
    begin
      CDS.FieldByName('Margin1').AsFloat := (lItem.HargaJual1 - lItem.HargaBeli) / lItem.HargaBeli * 100;
      CDS.FieldByName('Margin2').AsFloat := (lItem.HargaJual2 - lItem.HargaBeli) / lItem.HargaBeli * 100;
      CDS.FieldByName('Margin3').AsFloat := (lItem.HargaJual3 - lItem.HargaBeli) / lItem.HargaBeli * 100;
      CDS.FieldByName('Margin4').AsFloat := (lItem.HargaJual4 - lItem.HargaBeli) / lItem.HargaBeli * 100;
    end;
    CDS.Post;
  end;

end;

procedure TfrmPriceQuotation.LookupItem(aKey: string = '');
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

    cxLookup := TfrmCXServerLookup.Execute(S,'ID');
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

procedure TfrmPriceQuotation.SetItemToGrid(aItem: TItem);
var
  i: Integer;
  IsAppendRec: Boolean;
  lItemUOM: TItemUOM;
begin
  if aItem = nil then exit;

  //locate
  CDSClone.Filtered := True;
  Try
    CDSClone.Filter := 'Item = ' + IntToStr(aItem.ID);
    CDSClone.First;
    while not CDSClone.Eof do
    begin
      CDSClone.Delete;
    end;
  Finally
    CDSClone.Filtered := False;
  End;

  //1set uom
  if aItem.ItemUOMs.Count = 0 then exit;

  IsAppendRec := False;

  for i := 0 to aItem.ItemUOMs.Count-1 do
  begin
    lItemUOM := aItem.ItemUOMs[i];

    if IsAppendRec then
    begin
      if CDS.State in [dsInsert, dsEdit] then CDS.Post;
      CDS.Append;
      cxGrdMain.Controller.EditingController.ShowEdit;
    end;
//      DC.FocusedRecordIndex := DC.AppendRecord;

    DC.SetEditValue(colItemID.Index, aItem.ID, evsValue);
    DC.SetEditValue(colItemCode.Index, aItem.Kode, evsValue);
    DC.SetEditValue(colItemName.Index, aItem.Nama, evsValue);
    DC.SetEditValue(colSatuan.Index, lItemUOM.UOM.ID, evsValue);
    DC.SetEditValue(colKonversi.Index, lItemUOM.Konversi, evsValue);

    DC.SetEditValue(colHrgBeli.Index, lItemUOM.HargaBeli, evsValue);
    DC.SetEditValue(colHrgJual1.Index, lItemUOM.HargaJual1, evsValue);
    DC.SetEditValue(colHrgJual2.Index, lItemUOM.HargaJual2, evsValue);
    DC.SetEditValue(colHrgJual3.Index, lItemUOM.HargaJual3, evsValue);
    DC.SetEditValue(colHrgJual4.Index, lItemUOM.HargaJual4, evsValue);

    DC.SetEditValue(colMargin1.Index, lItemUOM.GetMargin(1), evsValue);
    DC.SetEditValue(colMargin2.Index, lItemUOM.GetMargin(2), evsValue);
    DC.SetEditValue(colMargin3.Index, lItemUOM.GetMargin(3), evsValue);
    DC.SetEditValue(colMargin4.Index, lItemUOM.GetMargin(4), evsValue);
    DC.Post();

    IsAppendRec := True;
  end;

  DC.FocusedRecordIndex := DC.RecordCount-1;
  cxGrdMain.Controller.FocusedItem := colHrgBeli;
  cxGrdMain.Controller.EditingController.ShowEdit;
//  colHrgBeli.Focus
//  if iOriginRec <= DC.RecordCount then
//    DC.FocusedRecordIndex := iOriginRec;

end;

procedure TfrmPriceQuotation.UpdateData;
var
  lItem: TPriceQuotationItem;
begin
  PriceQuot.Refno := edRefno.Text;
  PriceQuot.TransDate := dtQuot.Date;
  PriceQuot.Notes := edNotes.Text;
  PriceQuot.ModifiedDate := Now();
  PriceQuot.ModifiedBy := UserLogin;
  PriceQuot.IsActive := TAppUtils.BoolToInt(chkActive.Checked);

  PriceQuot.Items.Clear;
  CDS.First;
  while not CDS.Eof do
  begin
    lItem := TPriceQuotationItem.Create;
    lItem.SetFromDataset(CDS);
    PriceQuot.Items.Add(lItem);
    CDS.Next;
  end;

end;

function TfrmPriceQuotation.ValidateData: Boolean;
begin
  Result := False;

  if CDS.RecordCount = 0 then
  begin
    TAppUtils.Warning('Data Item tidak boleh kosong');
    exit;
  end;

  Result := TAppUtils.Confirm('Anda yakin data sudah sesuai?');

end;

end.