unit uItem;

interface

uses
  CRUDObject, System.Generics.Collections, System.SysUtils, uWarehouse;

type
  TItem = class;
  TItemUOM = class;
  TItemRack = class;

  TUOM = class(TCRUDObject)
  private
    FUOM: String;
    FDeskripsi: String;
  public
  published
    [AttributeOfCode]
    property UOM: String read FUOM write FUOM;
    property Deskripsi: String read FDeskripsi write FDeskripsi;
  end;


  TItemGroup = class(TCRUDObject)
  private
    FKode: String;
    FNama: String;
  protected
    function ValidateDelete: Boolean; override;
  published
    [AttributeOfCode]
    property Kode: String read FKode write FKode;
    property Nama: String read FNama write FNama;
  end;


  TMerk = class(TCRUDObject)
  private
    FKode: String;
    FNama: String;
  protected
  published
    [AttributeOfCode]
    property Kode: String read FKode write FKode;
    property Nama: String read FNama write FNama;
  end;


  TItem = class(TCRUDObject)
  private
    FKode: String;
    FNama: String;
    FMerk: TMerk;
    FGroup: TItemGroup;
    FItemUOMs: TObjectList<TItemUOM>;
    FModifiedDate: TDateTime;
    FModifiedBy: String;
    FIsActive: Integer;
    FItemRacks: TObjectList<TItemRack>;
    FLeadTime: Integer;
    FRak: String;
    FPPN: Double;
    FNotes: String;
    FStockUOM: TUOM;
    function GetItemUOMs: TObjectList<TItemUOM>;
    function GetItemRacks: TObjectList<TItemRack>;
  protected
    function BeforeSaveToDB: Boolean; override;
    function LogLevel: Integer; override;
  public
    destructor Destroy; override;
    function GenerateNo(aPrefix: String; aDigitCount: Integer): String;
    function GetAvgCostPCS: Double;
    function GetKonversi(aUOMID: Integer): Double;
    function ValidateEditUOM: Boolean;
    property ItemUOMs: TObjectList<TItemUOM> read GetItemUOMs write FItemUOMs;
    [AttributeIgnoreJSON]
    property ItemRacks: TObjectList<TItemRack> read GetItemRacks write FItemRacks;
  published
    [AttributeOfCode]
    property Kode: String read FKode write FKode;
    property Nama: String read FNama write FNama;
    property Merk: TMerk read FMerk write FMerk;
    property Group: TItemGroup read FGroup write FGroup;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
    property ModifiedBy: String read FModifiedBy write FModifiedBy;
    property IsActive: Integer read FIsActive write FIsActive;
    property LeadTime: Integer read FLeadTime write FLeadTime;
    property Rak: String read FRak write FRak;
    property PPN: Double read FPPN write FPPN;
    property Notes: String read FNotes write FNotes;
    property StockUOM: TUOM read FStockUOM write FStockUOM;
  end;

  TItemUOM = class(TCRUDObject)
  private
    FItem: TItem;
    FUOM: TUOM;
    FKonversi: Double;
    FHargaBeli: Double;
    FHargaAvg: Double;
    FHargaJual1: Double;
    FHargaJual2: Double;
    FHargaJual3: Double;
    FHargaJual4: Double;
    FPriceList: Double;
    FModifiedDate: TDateTime;
    FModifiedBy: String;
  public
    destructor Destroy; override;
    function GetHarga(aTipeHarga: Integer): Double;
    class function GetItemUOM(aItemID, aUOMID: Integer): TItemUOM;
    function GetPriceListMargin(aPriceIndex: Integer): Double;
    function UpdateHargaAvg(aNewAvg: Double): Boolean;
  published
    [AttributeOfHeader]
    property Item: TItem read FItem write FItem;
    property UOM: TUOM read FUOM write FUOM;
    property Konversi: Double read FKonversi write FKonversi;
    property HargaBeli: Double read FHargaBeli write FHargaBeli;
    property HargaAvg: Double read FHargaAvg write FHargaAvg;
    property HargaJual1: Double read FHargaJual1 write FHargaJual1;  //harga umum
    property HargaJual2: Double read FHargaJual2 write FHargaJual2;  //harga bengkel
    property HargaJual3: Double read FHargaJual3 write FHargaJual3;  //harga grosir
    property HargaJual4: Double read FHargaJual4 write FHargaJual4;  //harga keliling
    property PriceList: Double read FPriceList write FPriceList;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
    property ModifiedBy: String read FModifiedBy write FModifiedBy;
  end;

  TService = class(TCRUDObject)
  private
    FKode: String;
    FNama: String;
    FUOM: TUOM;
    FBiaya: Double;
    FIsActive: Integer;
    FModifiedBy: String;
    FModifiedDate: TDateTime;
    FPPN: Double;
  protected
  published
    [AttributeOfCode]
    property Kode: String read FKode write FKode;
    property Nama: String read FNama write FNama;
    property UOM: TUOM read FUOM write FUOM;
    property Biaya: Double read FBiaya write FBiaya;
    property IsActive: Integer read FIsActive write FIsActive;
    property ModifiedBy: String read FModifiedBy write FModifiedBy;
    property ModifiedDate: TDateTime read FModifiedDate write FModifiedDate;
    property PPN: Double read FPPN write FPPN;
  end;

  TItemRack = class(TCRUDObject)
  private
    FItem: TItem;
    FWarehouse: TWarehouse;
    FRak: string;
  public
    destructor Destroy; override;
  published
    [AttributeOfHeader]
    property Item: TItem read FItem write FItem;
    property Warehouse: TWarehouse read FWarehouse write FWarehouse;
    property Rak: string read FRak write FRak;
  end;

implementation

uses
  uDBUtils, Strutils, FireDAC.Comp.Client;

destructor TItem.Destroy;
begin
  inherited;
  if FItemUOMS <> nil then FItemUOMS.Free;
  if FItemRacks <> nil then FItemRacks.Free;
  if FMerk <> nil then FMerk.Free;
  if FGroup <> nil then FGroup.Free;
  if FStockUOM <> nil then FStockUOM.Free;  
end;

function TItem.BeforeSaveToDB: Boolean;
begin
  Result := ValidateEditUOM;
end;

function TItem.GenerateNo(aPrefix: String; aDigitCount: Integer): String;
var
  lLength: Integer;
  lNum: Integer;
  S: string;
begin
  lNum := 0;
  lLength := Length(aPrefix) + aDigitCount;

  S := 'SELECT MAX(Kode) FROM TItem WHERE Kode LIKE ' + QuotedStr(aPrefix + '%');
  S := S + ' and len(kode) = ' + IntToStr(lLength);

  with TDBUtils.OpenQuery(S) do
  begin
    Try
      if not eof then
        TryStrToInt(RightStr(Fields[0].AsString, aDigitCount), lNum);
    Finally
      Free;
    End;
  end;

  inc(lNum);
  Result := aPrefix + RightStr('0000000000' + IntToStr(lNum), aDigitCount);
end;

function TItem.GetAvgCostPCS: Double;
var
  lHarga: Double;
  lUOM: TItemUOM;
begin
  Result := 0;
  for lUOM in Self.ItemUOMs do
  begin
    lHarga := lUOM.HargaAvg;
    if lHarga <= 0 then lHarga := lUOM.HargaBeli;

    Result := lHarga * lUOM.Konversi;
    exit;
  end;
end;

function TItem.GetItemUOMs: TObjectList<TItemUOM>;
begin
  if FItemUOMs = nil then
    FItemUOMs := TObjectList<TItemUOM>.Create();
  Result := FItemUOMs;
end;

function TItem.GetItemRacks: TObjectList<TItemRack>;
begin
  if FItemRacks = nil then
    FItemRacks := TObjectList<TItemRack>.Create();
  Result := FItemRacks;
end;

function TItem.GetKonversi(aUOMID: Integer): Double;
var
  lUOM: TItemUOM;
begin
  Result := 0;

  for lUOM in Self.ItemUOMs do
  begin
    if lUOM.UOM.ID = aUOMID then
    begin
      Result := lUOM.Konversi;
      exit;
    end;
  end;

  if Result = 0 then
    raise Exception.Create('UOM ID ' + IntToStr(aUOMID) + ' not found in TItem');

end;

function TItem.LogLevel: Integer;
begin
  Result := 0; //no log
  //1 : all
  //2 : update and delete only
 end;

function TItem.ValidateEditUOM: Boolean;
var
  isFound: Boolean;
  isDiffKonversi: Boolean;
  lNewUOM: TItemUOM;
  lOldItem: TItem;
  lOldUOM: TItemUOM;
  S: string;
begin
  Result := True;
  exit;
  lOldItem := TItem.Create;
  Try
    lOldItem.LoadByID(Self.ID);

    //check deleted uom or modified konversi
    for lOldUOM in lOLDItem.ItemUOMs do
    begin
      isFound := False;
      isDiffKonversi := True;
      for lNewUOM in Self.ItemUOMs do
      begin
        if not isFound then
          isFound := lNewUOM.UOM.ID = lOldUOM.UOM.ID;

        if isFound and isDiffKonversi then
        begin
          isDiffKonversi := lNewUOM.Konversi <> lOldUOM.Konversi;

          if isDiffKonversi = false then break;
        end;
      end;

      if (not isFound) or (isDiffKonversi) then
      begin
        S := 'select top 1 * from ttransdetail'
            +' where item_id = ' + IntToStr(Self.ID)
            +' and uom_id = ' + IntToStr(lOldUOM.UOM.ID);
        with TDBUtils.OpenQuery(S) do
        begin
          Try
            if not eof then
              Result := False;

            if not Result then
            begin
              lOldUOM.UOM.ReLoad();
              raise Exception.Create(
                'Satuan : ' + lOldUOM.UOM.UOM
                +' tidak boleh di hapus atau diubah nilai konversi nya'
                +' karena sudah dipakai di transaksi'
              );
            end;

          Finally
            Free;
          End;
        end;
      end;
    end;
  Finally
    lOldItem.Free;
  End;
end;

destructor TItemUOM.Destroy;
begin
  inherited;
  if FUOM <> nil then FUOM.Free;
end;

function TItemUOM.GetHarga(aTipeHarga: Integer): Double;
begin
//  Result := 0;      
  Case aTipeHarga of
    0 : Result := HargaJual1;
    1 : Result := HargaJual2;
    2 : Result := HargaJual3;
    3 : Result := HargaJual4;
  else 
    raise Exception.Create('Tipe Harga Index : ' + Inttostr(aTipeHarga) + ' tidak ter-register di TItemUOM');
  end;
end;

class function TItemUOM.GetItemUOM(aItemID, aUOMID: Integer): TItemUOM;
var
  lQ: TFDQuery;
  S: string;
begin
  Result := nil;
  S := 'select * from TITEMUOM where item_id = ' + inttostr(aItemID)
    +' and uom_id = ' + inttostr(aUOMID);

  lQ := TDBUtils.OpenQuery(S);
  Try
    if not lQ.eof then
    begin
      Result := TItemUOm.Create;
      Result.LoadFromDataset(lQ);;
    end;
  Finally
    lQ.Free;
  End;
end;

function TItemUOM.GetPriceListMargin(aPriceIndex: Integer): Double;
begin
  Result := 0;
  if Self.PriceList = 0 then
    exit;

  case aPriceIndex of
    0 : Result := (Self.PriceList - Self.HargaBeli) / Self.PriceList * 100;
    1 : Result := (Self.PriceList - Self.HargaJual1) / Self.PriceList * 100;
    2 : Result := (Self.PriceList - Self.HargaJual2) / Self.PriceList * 100;
    3 : Result := (Self.PriceList - Self.HargaJual3) / Self.PriceList * 100;
    4 : Result := (Self.PriceList - Self.HargaJual4) / Self.PriceList * 100;
  end;
end;

function TItemUOM.UpdateHargaAvg(aNewAvg: Double): Boolean;
var
  S: string;
begin
  S := 'Update TITEMUOM set HargaAvg = ' + FloatToStr(aNewAvg)
      +' where ITEM_ID = ' + IntToStr(Self.Item.ID)
      +' and UOM_ID = ' + IntToStr(Self.UOM.ID);
  Result := TDBUtils.ExecuteSQL(S, False);
end;

function TItemGroup.ValidateDelete: Boolean;
begin
  Result := True;
//  raise Exception.Create('Error Message');
end;

destructor TItemRack.Destroy;
begin
  inherited;
  if FWarehouse <> nil then FWarehouse.Free;
end;

end.
