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
    cxMemo1: TcxMemo;
    colPriceList: TcxGridDBBandedColumn;
    colMarginBeli: TcxGridDBBandedColumn;
    styleGreen: TcxStyle;
    pmGrid: TPopupMenu;
    F6LookupDataBarangterakhirdiinputedit1: TMenuItem;
    colPPNBeli: TcxGridDBBandedColumn;
    colPPN1: TcxGridDBBandedColumn;
    colPPN2: TcxGridDBBandedColumn;
    colPPN3: TcxGridDBBandedColumn;
    colPPN4: TcxGridDBBandedColumn;
    cxLabel7: TcxLabel;
    crPPN: TcxCurrencyEdit;
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
    procedure colMarginBeliPropertiesEditValueChanged(Sender: TObject);
    procedure colPriceListPropertiesEditValueChanged(Sender: TObject);
    procedure F6LookupDataBarangterakhirdiinputedit1Click(Sender: TObject);
    procedure colPPNBeliPropertiesEditValueChanged(Sender: TObject);
    procedure colPPN1PropertiesEditValueChanged(Sender: TObject);
    procedure colPPN2PropertiesEditValueChanged(Sender: TObject);
    procedure colPPN3PropertiesEditValueChanged(Sender: TObject);
    procedure colPPN4PropertiesEditValueChanged(Sender: TObject);
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
    procedure LookupRecent;
    procedure SetItemToGrid(aItem: TItem);
    procedure UpdateData;
    procedure UpdateItemName;
    function ValidateData: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSClone: TClientDataset read GetCDSClone write FCDSClone;
    property CDSUOM: TClientDataset read GetCDSUOM write FCDSUOM;
    property PriceQuot: TPriceQuotation read GetPriceQuot write FPriceQuot;
    { Private declarations }
  protected
  public
    procedure CalcPriceExclPPN(aIndexPrice: Integer);
    function GetGroupName: string; override;
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = False);
    { Public declarations }
  published
  end;

var
  frmPriceQuotation: TfrmPriceQuotation;

implementation

uses
  uDXUtils, Dateutils, uDBUtils, ufrmCXServerLookup, cxDataUtils, uAppUtils,
  Strutils, ufrmCXLookup, uVariable;

{$R *.dfm}

procedure TfrmPriceQuotation.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if PriceQuot.SaveToDB then
  begin
    UpdateItemName;
    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmPriceQuotation.CalcPriceExclPPN(aIndexPrice: Integer);
var
  iRec: TcxCustomGridRecord;
  lPriceList: Double;
begin
  cxGrdMain.DataController.Post();
  iRec      := cxGrdMain.Controller.FocusedRecord;
  if iRec = nil then exit;

  case aIndexPrice of
    0 : cxGrdMain.DataController.SetEditValue(colHrgBeli.Index,
        iRec.Values[colPPNBeli.Index] / (1 + (crPPN.Value / 100.0) ),  evsValue);

    1 : cxGrdMain.DataController.SetEditValue(colHrgJual1.Index,
        iRec.Values[colPPN1.Index] / (1 + (crPPN.Value / 100.0) ),  evsValue);

    2 : cxGrdMain.DataController.SetEditValue(colHrgJual2.Index,
        iRec.Values[colPPN2.Index] / (1 + (crPPN.Value / 100.0) ),  evsValue);

    3 : cxGrdMain.DataController.SetEditValue(colHrgJual3.Index,
        iRec.Values[colPPN3.Index] / (1 + (crPPN.Value / 100.0) ),  evsValue);

    4 : cxGrdMain.DataController.SetEditValue(colHrgJual4.Index,
        iRec.Values[colPPN4.Index] / (1 + (crPPN.Value / 100.0) ),  evsValue);
  end;

  CalcSellPrice(aIndexPrice, False);
end;

procedure TfrmPriceQuotation.CalcSellPrice(aIndexPrice: Integer; IsMargin:
    Boolean);
var
  iRec: TcxCustomGridRecord;
  lPriceList: Double;
begin
  cxGrdMain.DataController.Post();
  iRec      := cxGrdMain.Controller.FocusedRecord;
  if iRec = nil then exit;

  lPriceList := iRec.Values[colPriceList.Index];
  lPriceList := lPriceList / (1.0 + (crPPN.Value / 100.0)) ;

  if IsMargin then
  begin
    case aIndexPrice of
      0 : cxGrdMain.DataController.SetEditValue(colHrgBeli.Index,
          lPriceList * (1 - (iRec.Values[colMarginBeli.Index] /100)),  evsValue);
      1 : cxGrdMain.DataController.SetEditValue(colHrgJual1.Index,
          lPriceList * (1 - (iRec.Values[colMargin1.Index] /100)),  evsValue);
      2 : cxGrdMain.DataController.SetEditValue(colHrgJual2.Index,
          lPriceList * (1 - (iRec.Values[colMargin2.Index] /100)),  evsValue);
      3 : cxGrdMain.DataController.SetEditValue(colHrgJual3.Index,
          lPriceList * (1 - (iRec.Values[colMargin3.Index] /100)),  evsValue);
      4 : cxGrdMain.DataController.SetEditValue(colHrgJual4.Index,
          lPriceList * (1 - (iRec.Values[colMargin4.Index] /100)),  evsValue);
    end;
  end else
  begin
    if lPriceList = 0 then exit;

    case aIndexPrice of
      0 : cxGrdMain.DataController.SetEditValue(colMarginBeli.Index,
          (lPriceList - iRec.Values[colHrgBeli.Index]) / lPriceList * 100,  evsValue);
      1 : cxGrdMain.DataController.SetEditValue(colMargin1.Index,
          (lPriceList - iRec.Values[colHrgJual1.Index]) / lPriceList * 100,  evsValue);
      2 : cxGrdMain.DataController.SetEditValue(colMargin2.Index,
          (lPriceList - iRec.Values[colHrgJual2.Index]) / lPriceList * 100,  evsValue);
      3 : cxGrdMain.DataController.SetEditValue(colMargin3.Index,
          (lPriceList - iRec.Values[colHrgJual3.Index]) / lPriceList * 100,  evsValue);
      4 : cxGrdMain.DataController.SetEditValue(colMargin4.Index,
          (lPriceList - iRec.Values[colHrgJual4.Index]) / lPriceList * 100,  evsValue);
    end;
  end;

  //calculate all PPN Value dulu
  case aIndexPrice of
    0 : cxGrdMain.DataController.SetEditValue(colPPNBeli.Index,
        ( (1.0 + (crPPN.Value/100.0)) * iRec.Values[colHrgBeli.Index]) ,  evsValue);

    1 : cxGrdMain.DataController.SetEditValue(colPPN1.Index,
        ( (1.0 + (crPPN.Value/100.0)) * iRec.Values[colHrgJual1.Index]) ,  evsValue);

    2 : cxGrdMain.DataController.SetEditValue(colPPN2.Index,
        ( (1.0 + (crPPN.Value/100.0)) * iRec.Values[colHrgJual2.Index]) ,  evsValue);

    3 : cxGrdMain.DataController.SetEditValue(colPPN3.Index,
        ( (1.0 + (crPPN.Value/100.0)) * iRec.Values[colHrgJual3.Index]) ,  evsValue);

    4 : cxGrdMain.DataController.SetEditValue(colPPN4.Index,
        ( (1.0 + (crPPN.Value/100.0)) * iRec.Values[colHrgJual4.Index]) ,  evsValue);
  end;

end;

procedure TfrmPriceQuotation.colHrgBeliPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalcSellPrice(0, False);
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

procedure TfrmPriceQuotation.colMarginBeliPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalcSellPrice(0, True);
end;

procedure TfrmPriceQuotation.colPPN1PropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalcPriceExclPPN(1);
end;

procedure TfrmPriceQuotation.colPPN2PropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalcPriceExclPPN(2);
end;

procedure TfrmPriceQuotation.colPPN3PropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalcPriceExclPPN(3);
end;

procedure TfrmPriceQuotation.colPPN4PropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  CalcPriceExclPPN(4);
end;

procedure TfrmPriceQuotation.colPPNBeliPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalcPriceExclPPN(0);
end;

procedure TfrmPriceQuotation.colPriceListPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  CalcSellPrice(0, False);
  CalcSellPrice(1, False);
  CalcSellPrice(2, False);
  CalcSellPrice(3, False);
  CalcSellPrice(4, False);
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
  if (Key = VK_F6) and (aItem = colItemCode) then
  begin
    LookupRecent;
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

procedure TfrmPriceQuotation.F6LookupDataBarangterakhirdiinputedit1Click(
    Sender: TObject);
begin
  inherited;
  LookupRecent;
end;

procedure TfrmPriceQuotation.FocusToGrid;
begin
  cxGrid1.SetFocus;
  cxGrid1.FocusedView := cxGrdMain;
  if cxGrdMain.DataController.RecordCount = 0 then
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

  crPPN.Value := AppVariable.PPN;

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
    FCDS.AddField('MarginBeli',ftFloat);
    FCDS.AddField('Margin1',ftFloat);
    FCDS.AddField('Margin2',ftFloat);
    FCDS.AddField('Margin3',ftFloat);
    FCDS.AddField('Margin4',ftFloat);

    FCDS.AddField('IncPPNBeli',ftFloat);
    FCDS.AddField('IncPPN1',ftFloat);
    FCDS.AddField('IncPPN2',ftFloat);
    FCDS.AddField('IncPPN3',ftFloat);
    FCDS.AddField('IncPPN4',ftFloat);
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

function TfrmPriceQuotation.GetGroupName: string;
begin
  Result := 'Master Data';
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


    CDS.FieldByName('IncPPNBeli').AsFloat := (1.0 + (crPPN.Value/100.0)) * lItem.HargaBeli;
    CDS.FieldByName('IncPPN1').AsFloat := (1.0 + (crPPN.Value/100.0))  * lItem.HargaJual1;
    CDS.FieldByName('IncPPN2').AsFloat := (1.0 + (crPPN.Value/100.0))  * lItem.HargaJual2;
    CDS.FieldByName('IncPPN3').AsFloat := (1.0 + (crPPN.Value/100.0))  * lItem.HargaJual3;
    CDS.FieldByName('IncPPN4').AsFloat := (1.0 + (crPPN.Value/100.0))  * lItem.HargaJual4;

    if lItem.PriceList = 0 then
    begin
      CDS.FieldByName('MarginBeli').AsFloat := 0;
      CDS.FieldByName('Margin1').AsFloat := 0;
      CDS.FieldByName('Margin2').AsFloat := 0;
      CDS.FieldByName('Margin3').AsFloat := 0;
      CDS.FieldByName('Margin4').AsFloat := 0;
    end else
    begin
      CDS.FieldByName('MarginBeli').AsFloat := (lItem.PriceList - lItem.HargaBeli) / lItem.PriceList * 100;
      CDS.FieldByName('Margin1').AsFloat := (lItem.PriceList - lItem.HargaJual1) / lItem.PriceList * 100;
      CDS.FieldByName('Margin2').AsFloat := (lItem.PriceList - lItem.HargaJual2) / lItem.PriceList * 100;
      CDS.FieldByName('Margin3').AsFloat := (lItem.PriceList - lItem.HargaJual3) / lItem.PriceList * 100;
      CDS.FieldByName('Margin4').AsFloat := (lItem.PriceList - lItem.HargaJual4) / lItem.PriceList * 100;
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

procedure TfrmPriceQuotation.LookupRecent;
var
  cxLookup: TfrmCXLookup;
  lItem: TItem;
  s: string;
begin
  lItem  := TItem.Create;
  Try
    s := 'select a.ID, a.KODE, a.NAMA, e.NAMA as MERK,'
        +' c.UOM as STOCKUOM, b.HARGAJUAL1 as HARGAUMUM, b.HARGAJUAL2 AS HARGABENGKEL,'
        +' b.HARGAJUAL3 AS HARGAGROSIR, b.HARGAJUAL4 AS HARGAKELILING,'
        +' A.MODIFIEDBY, A.MODIFIEDDATE'
        +' from titem a'
        +' inner join TITEMUOM b on a.id = b.ITEM_ID and a.STOCKUOM_ID = b.UOM_ID'
        +' inner join TUOM c on a.STOCKUOM_ID = c.id'
        +' left join TITEMGROUP d on a.GROUP_ID = d.id'
        +' left join TMERK e on a.MERK_ID = e.id'
        +' WHERE cast(A.MODIFIEDDATE as DATE) BETWEEN :STARTDATE AND :ENDDATE'
        +' ORDER BY A.MODIFIEDDATE DESC';

    cxLookup := TfrmCXLookup.ExecuteRange(S, Now(), Now(), True);
    cxLookup.HideFields(['ID']);
    try
      cxLookup.lblFilterData.Caption := 'Filter Modified Date : ';
      cxLookup.Width := 1000;
      if cxLookup.ShowModal = mrOK then
      begin
        while not cxLookup.Data.Eof do
        begin
//          if lItem.ID > 0 then
          CDS.Append;
          lItem.LoadByID(cxLookup.Data.FieldByName('ID').AsInteger);
          SetItemToGrid(lItem);
          cxLookup.Data.Next;
        end;
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
  lPPNFactor: Double;
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

    lPPNFactor := 1 + (crPPN.Value/100.0);

    DC.SetEditValue(colItemID.Index, aItem.ID, evsValue);
    DC.SetEditValue(colItemCode.Index, aItem.Kode, evsValue);
    DC.SetEditValue(colItemName.Index, aItem.Nama, evsValue);
    DC.SetEditValue(colSatuan.Index, lItemUOM.UOM.ID, evsValue);
    DC.SetEditValue(colKonversi.Index, lItemUOM.Konversi, evsValue);

    DC.SetEditValue(colPriceList.Index, lItemUOM.PriceList, evsValue);
    DC.SetEditValue(colHrgBeli.Index, lItemUOM.HargaBeli, evsValue);
    DC.SetEditValue(colHrgJual1.Index, lItemUOM.HargaJual1, evsValue);
    DC.SetEditValue(colHrgJual2.Index, lItemUOM.HargaJual2, evsValue);
    DC.SetEditValue(colHrgJual3.Index, lItemUOM.HargaJual3, evsValue);
    DC.SetEditValue(colHrgJual4.Index, lItemUOM.HargaJual4, evsValue);

    DC.SetEditValue(colMarginBeli.Index, lItemUOM.GetPriceListMargin(0), evsValue);
    DC.SetEditValue(colMargin1.Index, lItemUOM.GetPriceListMargin(1), evsValue);
    DC.SetEditValue(colMargin2.Index, lItemUOM.GetPriceListMargin(2), evsValue);
    DC.SetEditValue(colMargin3.Index, lItemUOM.GetPriceListMargin(3), evsValue);
    DC.SetEditValue(colMargin4.Index, lItemUOM.GetPriceListMargin(4), evsValue);

    DC.SetEditValue(colPPNBeli.Index, lItemUOM.HargaBeli * lPPNFactor, evsValue);
    DC.SetEditValue(colPPN1.Index, lItemUOM.HargaJual1 * lPPNFactor, evsValue);
    DC.SetEditValue(colPPN2.Index, lItemUOM.HargaJual2 * lPPNFactor, evsValue);
    DC.SetEditValue(colPPN3.Index, lItemUOM.HargaJual3 * lPPNFactor, evsValue);
    DC.SetEditValue(colPPN4.Index, lItemUOM.HargaJual4 * lPPNFactor, evsValue);


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

procedure TfrmPriceQuotation.UpdateItemName;
var
  SS: TStrings;
begin
  SS := TStringList.Create;
  Try
    CDS.First;
    while not CDS.Eof do
    begin
      SS.Add('Update TItem Set Nama = ' + QuotedStr(CDS.FieldByName('ItemName').AsString)
        + ' where ID = ' + IntToSTr(CDS.FieldByName('Item').AsInteger) + ';'
      );
      CDS.Next;
    end;
    TDBUtils.ExecuteSQL(SS);
  Finally
    SS.Free;
  End;
end;

function TfrmPriceQuotation.ValidateData: Boolean;
var
  bWarningHJ: Boolean;
begin
  Result := False;

//  if CDS.RecordCount = 0 then
//  begin
//    TAppUtils.Warning('Data Item tidak boleh kosong');
//    exit;
//  end;
  if cxGrdMain.DataController.RecordCount = 0 then
  begin
    TAppUtils.Warning('Data Item tidak boleh kosong');
    exit;
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


  Result := TAppUtils.Confirm('Anda yakin data sudah sesuai?');

end;

end.
