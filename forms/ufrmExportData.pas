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
  Datasnap.DBClient, System.JSON, cxProgressBar;

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
    cxMemo1: TcxMemo;
    SaveDlg: TSaveDialog;
    pmGrid: TPopupMenu;
    F6LookupDataBarangterakhirdiinputedit1: TMenuItem;
    pgBar: TcxProgressBar;
    cxGrid: TcxGrid;
    cxGrdPQ: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure colNoGetDisplayText(Sender: TcxCustomGridTableItem; ARecord:
        TcxCustomGridRecord; var AText: string);
    procedure colKodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnExportClick(Sender: TObject);
    procedure F6LookupDataBarangterakhirdiinputedit1Click(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure ckItemPropertiesEditValueChanged(Sender: TObject);
  private
    FCDSItemClone: TClientDataset;
    FCDSItem: TClientDataset;
    FCDSPQ: TClientDataset;
    FResultJSON: TJSONArray;
    procedure ExportItem;
    function GetCDSItemClone: TClientDataset;
    function GetCDSItem: TClientDataset;
    function GetResultJSON: TJSONArray;
    procedure InitView;
    procedure LoadModifiedItem;
    procedure LoadPriceQuotation;
    procedure LookupItem(aKey: string = '');
    procedure LookupRecent;
    procedure SetItemToGrid(aItem: TItem);
    property CDSItemClone: TClientDataset read GetCDSItemClone write FCDSItemClone;
    property CDSItem: TClientDataset read GetCDSItem write FCDSItem;
    property CDSPQ: TClientDataset read FCDSPQ write FCDSPQ;
    property ResultJSON: TJSONArray read GetResultJSON write FResultJSON;
    { Private declarations }
  public
    function GetGroupName: string; override;
    { Public declarations }
  end;

var
  frmExportData: TfrmExportData;

implementation

uses
  uDBUtils, uDXUtils, ufrmCXServerLookup, ufrmCXLookup, ufrmLookupItem,
  cxDataUtils, CRUDObject, REST.Json, uAppUtils, System.IOUtils;

{$R *.dfm}

procedure TfrmExportData.FormCreate(Sender: TObject);
begin
  inherited;
  InitView;
  SaveDlg.InitialDir := TPath.GetDocumentsPath;
  ckItemPropertiesEditValueChanged(Self);
end;

procedure TfrmExportData.btnExportClick(Sender: TObject);
begin
  inherited;
  if FResultJSON <> nil then
    FreeAndNil(FResultJSON);
  ExportItem;

  mmJSON.Lines.Clear;
  mmJSON.Text := TJSON.Format(ResultJSON);

  SaveDlg.FileName := 'IT_' + FormatDateTime('YYmmddhhmmss',Now());
  if SaveDlg.Execute then
  begin
    mmJSON.Lines.SaveToFile(SaveDlg.FileName);
    TAppUtils.Information('Data berhasil di export ke file : ' + SaveDLg.FileName);
  end;

end;

procedure TfrmExportData.btnRefreshClick(Sender: TObject);
begin
  inherited;
  if ckItem.Checked then
    LoadModifiedItem;
  if ckPriceQuot.Checked then
    LoadPriceQuotation;
end;

procedure TfrmExportData.ckItemPropertiesEditValueChanged(Sender: TObject);
begin
  inherited;
  cxGrdItem.OptionsData.Appending := ckItem.Checked;
  cxGrdItem.OptionsData.Editing := ckItem.Checked;
  cxGrdItem.OptionsData.Deleting := ckItem.Checked;
  cxGrdItem.OptionsData.Inserting := ckItem.Checked;
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
  lItemUOM: TItemUOM;
  lObj: TJSONObject;
  SS: TStrings;
begin
  pgBar.Position := 0;
  pgBar.Properties.Max := CDSItem.RecordCount;
  CDSItem.First;

  SS := TStringList.Create;
  Try
    while not CDSITem.Eof do
    begin
      pgBar.Position := pgBar.Position + 1;
      Application.ProcessMessages;

      lItem := TItem.Create;
      Try
        lItem.LoadByID(CDSItem.FieldByName('ID').AsInteger);
        lObj := TJSONUtils.ObjectToJSON(lItem);
        ResultJSON.AddElement(lObj);


        //merk
        if lItem.Merk <> nil then
        begin
          if SS.IndexOf('merk_' + inttostr(lItem.Merk.ID)) = -1 then
          begin
            lItem.Merk.ReLoad(False);
            lObj := TJSONUtils.ObjectToJSON(lItem.Merk);
            ResultJSON.AddElement(lObj);

            SS.Add('merk_' + inttostr(lItem.Merk.ID) );
          end;
        end;

        if lItem.Group <> nil then
        begin
          if SS.IndexOf('itemgroup_' + inttostr(lItem.Group.ID)) = -1 then
          begin
            lItem.Group.ReLoad(False);
            lObj := TJSONUtils.ObjectToJSON(lItem.Group);
            ResultJSON.AddElement(lObj);

            SS.Add('itemgroup_' + inttostr(lItem.Group.ID) );
          end;
        end;

        for lItemUOM in lItem.ItemUOMs do
        begin
          if lItemUOM.UOM <> nil then
          begin
            if SS.IndexOf('uom_' + inttostr(lItemUOM.UOM.ID)) = -1 then
            begin
              lItemUOM.UOM.ReLoad(False);
              lObj := TJSONUtils.ObjectToJSON(lItemUOM.UOM);
              ResultJSON.AddElement(lObj);

              SS.Add('uom_' + inttostr(lItemUOM.UOM.ID) );
            end;
          end;
        end;
      Finally
        FreeAndNil(lItem);
      End;
      CDSItem.Next;
    end;
  Finally
    SS.Free;
  End;

end;

procedure TfrmExportData.F6LookupDataBarangterakhirdiinputedit1Click(Sender:
    TObject);
begin
  inherited;
  LookupRecent;
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

function TfrmExportData.GetGroupName: string;
begin
  Result := 'Utilities'; //override this
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

procedure TfrmExportData.LoadModifiedItem;
var
  S: string;
begin
  //load barang
  S := 'select a.ID, a.KODE, a.NAMA, e.NAMA as MERK,'
      +' c.UOM as STOCKUOM, b.HARGAJUAL1 as HARGAUMUM, b.HARGAJUAL2 AS HARGABENGKEL,'
      +' b.HARGAJUAL3 AS HARGAGROSIR, b.HARGAJUAL4 AS HARGAKELILING,'
      +' A.MODIFIEDBY, A.MODIFIEDDATE'
      +' from titem a'
      +' inner join TITEMUOM b on a.id = b.ITEM_ID and a.STOCKUOM_ID = b.UOM_ID'
      +' inner join TUOM c on a.STOCKUOM_ID = c.id'
      +' left join TITEMGROUP d on a.GROUP_ID = d.id'
      +' left join TMERK e on a.MERK_ID = e.id'
      +' WHERE A.MODIFIEDDATE BETWEEN ' + TAppUtils.QuotD(StartDate.Date)
      +' and ' + TAppUtils.QuotD(EndDate.Date);

  with TDBUtils.OpenQuery(S, Self) do
  begin
    Try
      while not eof do
      begin
        if not CDSItem.Locate('ID', FieldByName('ID').AsInteger, []) then
        begin
          CDSItem.Append;
          CDSItem.FieldByName('ID').AsInteger := FieldByName('ID').AsInteger;
          CDSItem.FieldByName('Kode').AsString := FieldByName('Kode').AsString;
          CDSItem.FieldByName('Nama').AsString := FieldByName('Nama').AsString;
          CDSItem.Post;
        end;
        next;
      end;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmExportData.LoadPriceQuotation;
var
  S: string;
begin
  S := 'SELECT * FROM TPRICEQUOTATION'
      +' WHERE TRANSDATE BETWEEN ' + TAppUtils.QuotD(StartDate.Date)
      +' and ' + TAppUtils.QuotD(EndDate.Date);
  if FCDSPQ <> nil then
    FreeAndNil(FCDSPQ);

  FCDSPQ := TDBUtils.OpenDataset(S, Self);
  cxGrdPQ.LoadFromCDS(CDSPQ);

  //load barang
  S := 'SELECT DISTINCT C.ID, C.KODE, C.NAMA'
      +' FROM TPRICEQUOTATION A'
      +' INNER JOIN TPRICEQUOTATIONITEM B ON A.ID = B.QUOTATION_ID'
      +' INNER JOIN TITEM C ON B.ITEM_ID = C.ID'
      +' WHERE A.TRANSDATE BETWEEN ' + TAppUtils.QuotD(StartDate.Date)
      +' and ' + TAppUtils.QuotD(EndDate.Date);

  with TDBUtils.OpenQuery(S, Self) do
  begin
    Try
      while not eof do
      begin
        if not CDSItem.Locate('ID', FieldByName('ID').AsInteger, []) then
        begin
          CDSItem.Append;
          CDSItem.FieldByName('ID').AsInteger := FieldByName('ID').AsInteger;
          CDSItem.FieldByName('Kode').AsString := FieldByName('Kode').AsString;
          CDSItem.FieldByName('Nama').AsString := FieldByName('Nama').AsString;
          CDSItem.Post;
        end;
        next;
      end;
    Finally
      Free;
    End;
  end;


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
