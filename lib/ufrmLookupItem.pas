unit ufrmLookupItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmCXServerLookup, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxClasses,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridServerModeTableView, cxGrid, Vcl.StdCtrls, cxButtons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, Vcl.ExtCtrls, uItem;

type
  TfrmLookupItem = class(TfrmCXServerLookup)
    btnStock: TcxButton;
    Label3: TLabel;
    procedure btnStockClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    class function Execute(ASQL, AKeyName: String; AStartDate: TDateTime = 0;
        AEndDate: TDateTime = 0): TfrmCXServerLookup; override;
    class function LookupItem(aPreFilter: string = ''): TItem;
    { Public declarations }
  end;

var
  frmLookupItem: TfrmLookupItem;

implementation

uses
  uDBUtils, uDXUtils, Datasnap.DBClient, ufrmCXMsgInfo;

{$R *.dfm}

procedure TfrmLookupItem.btnStockClick(Sender: TObject);
var
  lCDS: TClientDataset;
  S: string;
begin
  inherited;
//  if cxGrdMain.Controller.FocusedRow = cxGrdMain.ViewData.FilterRow then exit;
  S := 'SELECT * FROM FN_VIEW_STOCKBYITEM('+ IntToStr(cxGrdMain.GetID) +',GETDATE())';
  lCDS := TDBUtils.OpenDataset(S, Self);
  Try
    TfrmCXMsgInfo.ShowSimpleMsg('Stock Gudang', lCDS, []);
  Finally
    lCDS.Free;
  End;
end;

class function TfrmLookupItem.Execute(ASQL, AKeyName: String; AStartDate:
    TDateTime = 0; AEndDate: TDateTime = 0): TfrmCXServerLookup;
begin
  Result := TfrmLookupItem.Create(Application);
  Result.LastFilterIndex := -1;
  Result.SQL := ASQL;
  Result.KeyName := AKeyName;
  Result.StartDate.Date := AStartDate;
  Result.EndDate.Date := AEndDate;

  if (AStartDate = 0) and (AEndDate = 0) then
    Result.HideDateParams;

  Result.btnRefresh.Click;
end;

procedure TfrmLookupItem.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_F4 then
  begin
    btnStock.Click;;
  end;
end;

class function TfrmLookupItem.LookupItem(aPreFilter: string = ''): TItem;
var
  cxLookup: TfrmLookupItem;
  lItem: TItem;
  s: string;
//  sKey: string;
begin
  Result  := nil;
  Try
    s := 'SELECT A.ID, A.KODE, A.NAMA, D.NAMA AS MERK, B.UOM AS UOMSTOCK,'
        +' C.PRICELIST, C.HARGAJUAL1 AS HARGAUMUM, C.HARGAJUAL2 AS HARGABENGKEL,'
        +' C.HARGAJUAL3 AS HARGAGROSIR, C.HARGAJUAL4 AS HARGAKELILING'
        +' FROM TITEM A'
        +' INNER JOIN TUOM B ON A.STOCKUOM_ID = B.ID'
        +' LEFT JOIN TITEMUOM C ON A.ID = C.ITEM_ID AND C.UOM_ID = B.ID'
        +' LEFT JOIN TMERK D ON A.MERK_ID = C.ID';

    cxLookup := TfrmLookupItem.Execute(S,'ID') as TfrmLookupItem;
    if aPreFilter <> '' then
      cxLookup.PreFilter('Nama', aPreFilter)
    else
      cxLookup.cxGrdMain.GetColumnByFieldName('NAMA').Focused := True;
    try
      if cxLookup.ShowModal = mrOK then
      begin
        if VarToInt(cxLookup.FieldValue('ID'))>0 then
        begin
          Result := TItem.Create;
          Result.LoadByID(cxLookup.FieldValue('ID'));
        end;
      end;
    finally
      cxLookup.Free;
    end;
  Finally
    FreeAndNil(lItem);
  End;
end;

end.
