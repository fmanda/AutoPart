unit ufrmExportData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxCheckBox, cxGroupBox, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, dxBarBuiltInMenu, cxPC, cxMemo, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxButtonEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, uItem,
  Datasnap.DBClient, System.JSON;

type
  TfrmExportData = class(TfrmDefault)
    Panel1: TPanel;
    btnClose: TcxButton;
    btnExport: TcxButton;
    cxGroupBox3: TcxGroupBox;
    ckItem: TcxCheckBox;
    ckPriceQuot: TcxCheckBox;
    ckTransfer: TcxCheckBox;
    cxGroupBox2: TcxGroupBox;
    EndDate: TcxDateEdit;
    StartDate: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    btnRefresh: TcxButton;
    cxPageControl1: TcxPageControl;
    tsItem: TcxTabSheet;
    tsPriceQuotation: TcxTabSheet;
    tsTransfer: TcxTabSheet;
    tsJSON: TcxTabSheet;
    mmJSON: TcxMemo;
    cxGridItem: TcxGrid;
    cxGrdItem: TcxGridDBTableView;
    colNo: TcxGridDBColumn;
    colKode: TcxGridDBColumn;
    colNama: TcxGridDBColumn;
    colItemID: TcxGridDBColumn;
    cxGridItemLevel1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure colNoGetDisplayText(Sender: TcxCustomGridTableItem; ARecord:
        TcxCustomGridRecord; var AText: string);
    procedure colKodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnExportClick(Sender: TObject);
  private
    FCDSItemClone: TClientDataset;
    FCDSItem: TClientDataset;
    FResultJSON: TJSONArray;
    procedure ExportItem;
    function GetCDSItemClone: TClientDataset;
    function GetCDSItem: TClientDataset;
    function GetResultJSON: TJSONArray;
    procedure InitView;
    procedure LookupItem(aKey: string = '');
    procedure LookupRecent;
    procedure SetItemToGrid(aItem: TItem);
    property CDSItemClone: TClientDataset read GetCDSItemClone write FCDSItemClone;
    property CDSItem: TClientDataset read GetCDSItem write FCDSItem;
    property ResultJSON: TJSONArray read GetResultJSON write FResultJSON;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExportData: TfrmExportData;

implementation

uses
  uDBUtils, uDXUtils, ufrmCXServerLookup, ufrmCXLookup, ufrmLookupItem,
  cxDataUtils, CRUDObject, REST.Json;

{$R *.dfm}

procedure TfrmExportData.FormCreate(Sender: TObject);
begin
  inherited;
  InitView;
end;

procedure TfrmExportData.btnExportClick(Sender: TObject);
begin
  inherited;
  if FResultJSON <> nil then
    FreeAndNil(FResultJSON);
  ExportItem;

  mmJSON.Lines.Clear;
  mmJSON.Text := ResultJSON.ToString;
end;

procedure TfrmExportData.colKodePropertiesButtonClick(Sender: TObject;
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

procedure TfrmExportData.colNoGetDisplayText(Sender: TcxCustomGridTableItem;
    ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if ARecord = nil then exit;
  AText := VarToStr(ARecord.RecordIndex + 1);
end;

procedure TfrmExportData.ExportItem;
var
  lItem: TItem;
  lObj: TJSONObject;
begin

  CDSItem.First;
  while not CDSITem.Eof do
  begin
    lItem := TItem.Create;
    Try
      lItem.LoadByID(CDSItem.FieldByName('ID').AsInteger);
      lObj := TJSONUtils.ObjectToJSON(lItem);
      ResultJSON.AddElement(lObj);
    Finally
      FreeAndNil(lItem);
    End;
    CDSItem.Next;
  end;

end;

function TfrmExportData.GetCDSItemClone: TClientDataset;
begin
  if FCDSItemClone = nil then
    FCDSItemClone := CDSItem.ClonedDataset(Self);
  Result := FCDSItemClone;
end;

function TfrmExportData.GetCDSItem: TClientDataset;
begin
  if FCDSItem = nil then
  begin
    FCDSItem := TClientDataSet.Create(Self);
    FCDSItem.AddField('Kode', ftString);
    FCDSItem.AddField('Nama', ftString);
    FCDSItem.AddField('ID',ftInteger);
    FCDSItem.CreateDataSet;
  end;
  Result := FCDSItem;
end;

function TfrmExportData.GetResultJSON: TJSONArray;
begin
  if FResultJSON = nil then
    FResultJSON := TJSONArray.Create;
  
  Result := FResultJSON;
end;

procedure TfrmExportData.InitView;
begin
  cxGrdItem.PrepareFromCDS(CDSItem);
end;

procedure TfrmExportData.LookupItem(aKey: string = '');
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

procedure TfrmExportData.LookupRecent;
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
        +' WHERE A.MODIFIEDDATE BETWEEN :STARTDATE AND :ENDDATE'
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
          CDSItem.Append;
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

procedure TfrmExportData.SetItemToGrid(aItem: TItem);
var
//  i: Integer;
  IsAppendRec: Boolean;
//  lItemUOM: TItemUOM;
begin
  if aItem = nil then exit;

  //locate
  CDSItemClone.Filtered := True;
  Try
    CDSItemClone.Filter := 'ID = ' + IntToStr(aItem.ID);
    CDSItemClone.First;
    while not CDSItemClone.Eof do
    begin
      CDSItemClone.Delete;
    end;
  Finally
    CDSItemClone.Filtered := False;
  End;

  //1set uom
  if aItem.ItemUOMs.Count = 0 then exit;

  IsAppendRec := False;

//  for i := 0 to aItem.ItemUOMs.Count-1 do
//  begin
//    lItemUOM := aItem.ItemUOMs[i];

    if IsAppendRec then
    begin
      if CDSItem.State in [dsInsert, dsEdit] then CDSItem.Post;
      CDSItem.Append;
      cxGrdItem.Controller.EditingController.ShowEdit;
    end;
//      DC.FocusedRecordIndex := DC.AppendRecord;

    with cxGrdItem.DataController do
    begin
      SetEditValue(colItemID.Index, aItem.ID, evsValue);
      SetEditValue(colKode.Index, aItem.Kode, evsValue);
      SetEditValue(colNama.Index, aItem.Nama, evsValue);
      Post();
    end;

//    IsAppendRec := True;
//  end;

  cxGrdItem.DataController.FocusedRecordIndex := cxGrdItem.DataController.RecordCount-1;

end;

end.
