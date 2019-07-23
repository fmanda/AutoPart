unit uStockCheck;

interface

uses
  Datasnap.DBClient, System.Generics.Collections, DB, System.SysUtils,
  System.DateUtils, ufrmCXMsgInfo, Vcl.Controls;

type
  TStockCheckItem = class(TObject)
  private
    FItem_ID: Integer;
    FKode: String;
    FUOM: String;
    FQTY_PCS: Double;
    FNama: String;
    FWarehouse: String;
    FSTOCK_PCS: Double;
    FONHAND_PCS: Double;
    FKonversi: Double;
    FWarehouse_ID: Integer;
    procedure SetItem_ID(const Value: Integer);
    procedure SetWarehouse_ID(const Value: Integer);
  public
    constructor Create;
    property Item_ID: Integer read FItem_ID write SetItem_ID;
    property Kode: String read FKode;
    property UOM: String read FUOM;
    property QTY_PCS: Double read FQTY_PCS write FQTY_PCS;
    property Nama: String read FNama;
    property Warehouse: String read FWarehouse;
    property STOCK_PCS: Double read FSTOCK_PCS write FSTOCK_PCS;
    property ONHAND_PCS: Double read FONHAND_PCS write FONHAND_PCS;
    property Konversi: Double read FKonversi;
    property Warehouse_ID: Integer read FWarehouse_ID write SetWarehouse_ID;
  end;

type
  TStockCheck = class(TObject)
  private
    FCDS: TClientDataset;
    FCDSStock: TClientDataset;
    FEndDate: TDateTime;
    FItems: TObjectList<TStockCheckItem>;
    FStartDate: TDateTime;
    function GetCDS: TClientDataset;
    function GetFilterItem: String;
    function GetFilterWarehouse: String;
    function GetItems: TObjectList<TStockCheckItem>;
    procedure SetEndDate(const Value: TDateTime);
    property CDSStock: TClientDataset read FCDSStock write FCDSStock;
    property EndDate: TDateTime read FEndDate write SetEndDate;
    property StartDate: TDateTime read FStartDate;
  public
    constructor Create(AInitDate: TDateTime);
    destructor Destroy; override;
    procedure AddCalcItem(AItemID, AWarehouseID: Integer; AQtyKonversi: Double);
        overload;
    procedure AddCustomStock(AItemID, AWarehouseID, AQTYPCS: Integer); overload;
    procedure AddOnHandPCS(AItemID, AWarehouseID: Integer; AQTYPCS: Double);
        overload;
    function CheckStock(ReLoadStock: Boolean = True; CustomCaption: String = '';
        ShowData: Boolean = True; CustomFieldName: String = ''): Boolean; overload;
    function CheckStockIgnore(CanIgnore: Boolean = False; CustomCaption: String =
        ''): Boolean;
    procedure InitCustomCDSStock;
    procedure LoadStock;
    property CDS: TClientDataset read GetCDS write FCDS;
    property Items: TObjectList<TStockCheckItem> read GetItems write FItems;
  end;

implementation

uses
  uDBUtils, uItem, uWarehouse, Vcl.Dialogs, uAppUtils, uDXUtils;

constructor TStockCheckItem.Create;
begin
  inherited;
  Self.QTY_PCS     := 0;
  Self.STOCK_PCS      := 0;
  Self.ONHAND_PCS := 0;
end;

procedure TStockCheckItem.SetItem_ID(const Value: Integer);
var
  lItem: TItem;
begin
  lItem := TItem.Create();
  FItem_ID := Value;

  Try
    If lItem.LoadByID(FItem_ID) then
    begin
      FKode := lItem.Kode;
      FNama := lItem.Nama;

      lItem.StockUOM.ReLoad();
      FUOM := lItem.StockUOM.UOM;

      FKonversi := lItem.GetKonversi(lItem.StockUOM.ID);

      if FKonversi = 0 then
        raise Exception.Create('Konversi Satuan = 0 atas Item ' + FNama);

    end else
      Raise Exception.Create('Item ID not found');
  Finally
    lItem.Free;
  End;

end;

procedure TStockCheckItem.SetWarehouse_ID(const Value: Integer);
var
  lWh: TWarehouse;
begin
  FWarehouse_ID := Value;
  lWh := TWarehouse.Create();
  Try
    If lWh.LoadByID(FWarehouse_ID) then
    begin
      FWarehouse := lWh.Nama;
    end;
  Finally
    lWh.Free;
  End;
end;

constructor TStockCheck.Create(AInitDate: TDateTime);
begin
  inherited Create;
  Self.EndDate := AInitDate;
end;

destructor TStockCheck.Destroy;
begin
  inherited;
  if Assigned(FCDS) then FreeAndNil(FCDS);
end;

procedure TStockCheck.AddCalcItem(AItemID, AWarehouseID: Integer;
    AQtyKonversi: Double);
var
  AItem: TStockCheckItem;
  i: Integer;
begin
  AItem := nil;

  for i := 0 to Items.Count-1 do
  begin
    If (Items[i].Item_ID = AItemID)
      and (Items[i].Warehouse_ID = AWarehouseID) then
    begin
      AItem := Items[i];
      break;
    end;
  end;

  If AItem = nil then
  begin
    AItem               := TStockCheckItem.Create;
    AItem.Item_ID       := AItemID;
    AItem.Warehouse_ID  := AWarehouseID;
    AItem.QTY_PCS       := AQtyKonversi;
    Self.Items.Add(AItem);
  end else
  begin
    AItem.QTY_PCS       := AItem.QTY_PCS + AQtyKonversi;
  end;
end;

procedure TStockCheck.AddCustomStock(AItemID, AWarehouseID, AQTYPCS:
    Integer);
begin
  If not Assigned(FCDSStock) then InitCustomCDSStock;
  CDSStock.Filtered := True;
  CDSStock.Filter := 'ITEM_ID = ' + IntToStr(AItemID)
                    + ' AND WAREHOUSE_ID = ' + IntToStr(AWarehouseID);
  Try
    if CDSStock.Eof then
    begin
      CDSStock.Append;
      CDSStock.FieldByName('ITEM_ID').AsInteger := AItemID;
      CDSStock.FieldByName('WAREHOUSE_ID').AsInteger := AWarehouseID;
      CDSStock.FieldByName('STOCK').AsInteger := AQTYPCS;
    end
    else begin
      CDSStock.Edit;
      CDSStock.FieldByName('STOCK').AsInteger := CDSStock.FieldByName('STOCK').AsInteger + AQTYPCS;
    end;

    CDSStock.Post;
    //istirahat
  Finally
    CDSStock.Filtered := False;
  End;
end;

procedure TStockCheck.AddOnHandPCS(AItemID, AWarehouseID: Integer;
    AQTYPCS: Double);
var
  AItem: TStockCheckItem;
  i: Integer;
begin
  AItem := nil;

  for i := 0 to Items.Count-1 do
  begin
    If (Items[i].ITEM_ID = AItemID)
      and (Items[i].Warehouse_ID = AWarehouseID) then
    begin
      AItem := Items[i];
      break;
    end;
  end;

  If AItem = nil then
  begin
    AItem               := TStockCheckItem.Create;
    AItem.ITEM_ID       := AItemID;
    AItem.Warehouse_ID  := AWarehouseID;
    AItem.ONHAND_PCS    := AQTYPCS;
    Self.Items.Add(AItem);
  end else
  begin
    AItem.ONHAND_PCS    := AItem.ONHAND_PCS + AQTYPCS;
  end;
end;

function TStockCheck.CheckStock(ReLoadStock: Boolean = True;
    CustomCaption: String = ''; ShowData: Boolean = True; CustomFieldName:
    String = ''): Boolean;
var
  i: Integer;
  lCxMsg: TfrmCXMsgInfo;
begin
  Result := False;

  if ReLoadStock then LoadStock;

  CDSStock.Filtered := True;
  CDS.EmptyDataSet;
  for i := 0 to Self.Items.Count-1 do
  begin
    CDSStock.Filter := 'WAREHOUSE_ID = ' + inttostr(Self.Items[i].Warehouse_ID)
      +' And ITEM_ID = ' + Inttostr(Self.Items[i].Item_ID);

    If not CDSStock.Eof then
      Self.Items[i].STOCK_PCS := CDSSTock.FieldByName('stock').AsInteger
    else
      Self.Items[i].STOCK_PCS := 0;

    Self.Items[i].STOCK_PCS := Self.Items[i].STOCK_PCS + Self.Items[i].ONHAND_PCS;

    If Self.Items[i].QTY_PCS > (Self.Items[i].STOCK_PCS)  then
    begin
      CDS.Append;
      CDS.FieldByName('ITEM_ID').AsInteger      := Self.Items[i].ITEM_ID;
      CDS.FieldByName('WAREHOUSE_ID').AsInteger := Self.Items[i].WAREHOUSE_ID;
      CDS.FieldByName('WAREHOUSE').AsString     := Self.Items[i].WAREHOUSE;
      CDS.FieldByName('KODE').AsString          := Self.Items[i].KODE;
      CDS.FieldByName('NAMA').AsString          := Self.Items[i].NAMA;
      CDS.FieldByName('UOM').AsString           := Self.Items[i].UOM;
      CDS.FieldByName('QTY').AsFloat            := Self.Items[i].QTY_PCS / Self.Items[i].Konversi;
      CDS.FieldByName('STOCK').AsFloat          := Self.Items[i].STOCK_PCS / Self.Items[i].Konversi;
      CDS.Post;
    end;
  end;

  If not Result then  Result := CDS.RecordCount = 0;
  If not Result then
  begin
    If CustomCaption = '' then
      CustomCaption := 'Stock Tidak Mencukupi !!!' + #13 + 'Silahkan cek kembali inputan dengan stock gudang';

    if ShowData then
    begin
      lCxMsg := TfrmCXMsgInfo.ShowMessage(CustomCaption, CDS, [mbOK], ['ITEM_ID','WAREHOUSE_ID'], [], False, True);
      Try
        lCXmsg.SetWarningLabel;
        lCxmsg.cxGrdMain.SetSummaryByColumns(['QTY','STOCK']);
        If CustomFieldName <> '' then
          lCxmsg.cxGrdMain.GetColumnByFieldName('STOCK').Caption := CustomFieldName;
        lCxmsg.cxGrdMain.ApplyBestFit;
        lCxMsg.ShowModal;
      Finally
        lCxMsg.Free;
      end;
    end;
  end;

end;

function TStockCheck.CheckStockIgnore(CanIgnore: Boolean = False;
    CustomCaption: String = ''): Boolean;
var
  i: Integer;
  lButtons: TMsgDlgButtons;
  lCxMsg: TfrmCXMsgInfo;
begin
  Result := False;

//  if ReLoadStock then
  LoadStock;

  CDSStock.Filtered := True;
  CDS.EmptyDataSet;
  for i := 0 to Self.Items.Count-1 do
  begin
    CDSStock.Filter := 'warehouse_id = ' + inttostr(Self.Items[i].Warehouse_ID)
      +' And item_id = ' + Inttostr(Self.Items[i].Item_ID);

    If not CDSStock.Eof then
      Self.Items[i].STOCK_PCS := CDSSTock.FieldByName('stock').AsInteger
    else
      Self.Items[i].STOCK_PCS := 0;

    Self.Items[i].STOCK_PCS := Self.Items[i].STOCK_PCS + Self.Items[i].ONHAND_PCS;

    If Self.Items[i].QTY_PCS > (Self.Items[i].STOCK_PCS)  then
    begin
      CDS.Append;
      CDS.FieldByName('ITEM_ID').AsInteger      := Self.Items[i].ITEM_ID;
      CDS.FieldByName('WAREHOUSE_ID').AsInteger := Self.Items[i].WAREHOUSE_ID;
      CDS.FieldByName('WAREHOUSE').AsString     := Self.Items[i].WAREHOUSE;
      CDS.FieldByName('KODE').AsString          := Self.Items[i].KODE;
      CDS.FieldByName('NAMA').AsString          := Self.Items[i].NAMA;
      CDS.FieldByName('UOM').AsString           := Self.Items[i].UOM;
      CDS.FieldByName('QTY').AsFloat            := Self.Items[i].QTY_PCS / Self.Items[i].Konversi;
      CDS.FieldByName('STOCK').AsFloat          := Self.Items[i].STOCK_PCS / Self.Items[i].Konversi;
      CDS.Post;
    end;
  end;

  If not Result then  Result := CDS.RecordCount = 0;
  If not Result then
  begin
    If CustomCaption = '' then
      CustomCaption := 'Stock Tidak Mencukupi ,Silahkan cek kembali inputan dengan stock gudang';
    if CanIgnore then
      CustomCaption := CustomCaption + #13 + ' Anda bisa melanjutkan Simpan dengan menekean tombo Ignore';

    lButtons := [mbOK];
    if CanIgnore then lButtons := [mbIgnore, mbCancel];
    lCxMsg := TfrmCXMsgInfo.ShowMessage(CustomCaption, CDS, lButtons, ['ITEM_ID','WAREHOUSE_ID'], [], False, True);
    Try
      lCXmsg.SetWarningLabel;
      lCxmsg.cxGrdMain.SetSummaryByColumns(['QTY','STOCK']);
//      If CustomFieldName <> '' then
//        lCxmsg.cxGrdMain.GetColumnByFieldName('STOCK_PCS').Caption := CustomFieldName;
      lCxmsg.cxGrdMain.ApplyBestFit;
      Result := lCxmsg.ShowModal = mrIgnore;

    Finally
      lCxMsg.Free;
    end;

  end;

end;

function TStockCheck.GetCDS: TClientDataset;
begin
  If not Assigned(FCDS) then
  begin
    FCDS := TClientDataSet.Create(nil);
    FCDS.AddField( 'ITEM_ID', ftInteger);
    FCDS.AddField( 'WAREHOUSE_ID', ftInteger);
    FCDS.AddField( 'WAREHOUSE', ftString);
    FCDS.AddField( 'KODE', ftString);
    FCDS.AddField( 'NAMA', ftString);
    FCDS.AddField( 'UOM', ftString);
    FCDS.AddField( 'QTY', ftFloat);
    FCDS.AddField( 'STOCK', ftFloat);
//    FCDS.AddField( 'OCCUPIED_PCS', ftFloat);
    FCDS.AddField( 'REMARK', ftString);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TStockCheck.GetFilterItem: String;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Self.Items.Count-1 do
  begin
    If Result <> '' then Result := Result + ',';
    Result := Result + IntToStr(Self.Items[i].Item_ID);
  end;
  If Result <> '' then Result := '(' + Result + ')';
end;

function TStockCheck.GetFilterWarehouse: String;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to Self.Items.Count-1 do
  begin
    If Result <> '' then Result := Result + ',';
    Result := Result + IntToStr(Self.Items[i].Warehouse_ID);
  end;
  If Result <> ''  then Result := '(' + Result + ')';
end;

function TStockCheck.GetItems: TObjectList<TStockCheckItem>;
begin
  If not Assigned(FItems) then
    FItems := TObjectList<TStockCheckItem>.Create;
  Result := FItems;
end;

procedure TStockCheck.InitCustomCDSStock;
begin
  If not Assigned(FCDSStock) then
  begin
    FCDSStock := TClientDataSet.Create(nil);
    FCDSStock.AddField('ITEM_ID', ftInteger);
//    FCDSStock.AddField('UOM', ftString);
    FCDSStock.AddField('WAREHOUSE_ID', ftInteger);
    FCDSStock.AddField('STOCK', ftFloat);
    FCDSStock.CreateDataSet;
  end;
end;

procedure TStockCheck.LoadStock;
var
  S, Filter: string;
begin
  Filter := '';

  If GetFilterWarehouse <> '' then
    Filter := Filter + ' and WAREHOUSE_ID in ' + GetFilterWarehouse;

  If GetFilterItem <> '' then
    Filter := Filter + ' and ITEM_ID in ' + GetFilterItem;

  If Assigned(FCDSStock) then FreeAndNil(FCDSStock);

  S := 'SELECT ITEM_ID, SUM(QTY*KONVERSI) as stock, WAREHOUSE_ID'
      +' FROM TTRANSDETAIL'
      +' WHERE TRANSDATE BETWEEN ' + TAppUtils.QuotD(StartDate)
      +' AND ' + TAppUtils.QuotD(EndDate) + Filter
      +' GROUP BY ITEM_ID, WAREHOUSE_ID';

  CDSStock := TDBUtils.OpenDataset(S,Nil);
end;

procedure TStockCheck.SetEndDate(const Value: TDateTime);
begin
  FEndDate := Value;
  FStartDate := StartOfTheYear(FEndDate);
end;

end.
