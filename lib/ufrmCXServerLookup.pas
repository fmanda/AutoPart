unit ufrmCXServerLookup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  Vcl.Menus, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridServerModeTableView, cxGrid, cxClasses, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, Vcl.ExtCtrls;

type
  TfrmCXServerLookup = class(TForm)
    pnlHeader: TPanel;
    lblHeader: TLabel;
    lblFilterData: TcxLabel;
    StartDate: TcxDateEdit;
    EndDate: TcxDateEdit;
    btnRefresh: TcxButton;
    lblsdFilter: TcxLabel;
    Panel2: TPanel;
    lbEscape: TLabel;
    Label1: TLabel;
    Panel1: TPanel;
    btnClose: TcxButton;
    btnOK: TcxButton;
    styleRepo: TcxStyleRepository;
    styleOdd: TcxStyle;
    cxGrid: TcxGrid;
    cxGrdMain: TcxGridServerModeTableView;
    cxGridLevel1: TcxGridLevel;
    Label2: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnRefreshClick(Sender: TObject);
    procedure cxGrdMainCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo:
        TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
        var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
  private
    FSQL: String;
    FKeyName: String;
    FLastFilterIndex: Integer;
    procedure FocusToFilterRow;
    { Private declarations }
  protected
    procedure HideDateParams;
    property LastFilterIndex: Integer read FLastFilterIndex write FLastFilterIndex;
  public
    class function Execute(ASQL, AKeyName: String; AStartDate: TDateTime = 0;
        AEndDate: TDateTime = 0): TfrmCXServerLookup; overload;
    function ResultRec: TcxCustomGridRecord;
    function FieldValue(aFieldName: String): Variant;
    procedure HideFields(FieldNames: Array Of String);
    procedure PreFilter(aFieldName, aValue: String);
    procedure RefreshData;
    property SQL: String read FSQL write FSQL;
    property KeyName: String read FKeyName write FKeyName;
    { Public declarations }
  end;

var
  frmCXServerLookup: TfrmCXServerLookup;

const
  _startdateparam : String = ':startdate';
  _enddateparam : String = ':enddate';


implementation

uses
  uAppUtils, uDXUtils, uDBUtils;

{$R *.dfm}

function TfrmCXServerLookup.ResultRec: TcxCustomGridRecord;
begin
  Result := nil;
  if cxGrdMain.Controller.SelectedRecordCount > 0 then
    Result := cxGrdMain.Controller.SelectedRecords[0];
end;

procedure TfrmCXServerLookup.btnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmCXServerLookup.btnOKClick(Sender: TObject);
begin
  if ResultRec = nil then
  begin
    TAppUtils.Warning('No Record Selected');
    exit;
  end else
    ModalResult := mrOk;

end;

procedure TfrmCXServerLookup.btnRefreshClick(Sender: TObject);
begin
  RefreshData;
end;

procedure TfrmCXServerLookup.cxGrdMainCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  btnOK.Click;
end;

class function TfrmCXServerLookup.Execute(ASQL, AKeyName: String; AStartDate:
    TDateTime = 0; AEndDate: TDateTime = 0): TfrmCXServerLookup;
begin
  Result := TfrmCXServerLookup.Create(Application);
  Result.LastFilterIndex := -1;
  Result.SQL := ASQL;
  Result.KeyName := AKeyName;
  Result.StartDate.Date := AStartDate;
  Result.EndDate.Date := AEndDate;

  if (AStartDate = 0) and (AEndDate = 0) then
    Result.HideDateParams;

  Result.btnRefresh.Click;
end;

function TfrmCXServerLookup.FieldValue(aFieldName: String): Variant;
var
  lCol: TcxGridServerModeColumn;
begin
  lCol := cxGrdMain.GetColumnByFieldName(aFieldName);
  if lCol = nil then
    raise Exception.Create('Field ' + aFieldName + ' not found');

  if ResultRec = nil then
    raise Exception.Create('No Record Selected');

  Result := ResultRec.Values[lCol.Index];
end;

procedure TfrmCXServerLookup.FocusToFilterRow;
var
  i: Integer;
begin
  cxGrid.SetFocus;
  cxGrdMain.Focused := True;

  //find focus filter
//  for i := Low to High do

//  cxGrdMain.Controller.FocusedColumnIndex := 0;

  for i := 0 to cxGrdMain.ColumnCount-1 do
  begin
    if not VarIsNull(cxGrdMain.ViewData.FilterRow.Values[i]) then
    begin
      cxGrdMain.Controller.FocusedColumn := cxGrdMain.Columns[i];
      break;
    end;
  end;

  cxGrdMain.Controller.FocusedRow := cxGrdMain.ViewData.FilterRow;
  cxGrdMain.Controller.EditingController.ShowEdit;
  cxGrdMain.Controller.ClearSelection;
end;

procedure TfrmCXServerLookup.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  If Key = VK_ESCAPE then Self.Close;
  if (Key = VK_RETURN) and (Shift = [ssCtrl]) then
    Self.btnOK.Click
  else if Key = VK_Return then
  begin
    if cxGrdMain.Controller.FocusedRow <> cxGrdMain.ViewData.FilterRow then
      Self.btnOK.Click;
  end;

  if Key = VK_F5 then
  begin
    FocusToFilterRow;
  end;
end;

procedure TfrmCXServerLookup.FormShow(Sender: TObject);
begin


  FocusToFilterRow;

end;

procedure TfrmCXServerLookup.HideDateParams;
begin
  lblFilterData.Visible := False;
  StartDate.Visible     := False;
  lblsdFilter.Visible   := False;
  EndDate.Visible       := False;
end;

procedure TfrmCXServerLookup.HideFields(FieldNames: Array Of String);
begin
  Self.cxGrdMain.SetVisibleColumns(FieldNames, False);
end;

procedure TfrmCXServerLookup.PreFilter(aFieldName, aValue: String);
var
  iColIndex: Integer;
begin
  if cxGrdMain.GetColumnByFieldName(aFieldName) = nil then
    raise Exception.Create('Column ' + aFieldName + ' not found');
  iColIndex := cxGrdMain.GetColumnByFieldName(aFieldName).Index;
  cxGrdMain.ViewData.FilterRow.Values[iColIndex] := aValue;

//  LastFilterIndex := iColIndex;

//  cxGrdMain.Columns[iColIndex]
end;

procedure TfrmCXServerLookup.RefreshData;
var
  newSQL: string;
begin
  //process SQL
  newSQL := SQL;
  if StartDate.Visible then
  begin
    newSQL := StringReplace(SQL, _startdateparam, TAppUtils.QuotD(StartDate.Date) ,[rfReplaceAll,rfIgnoreCase]);
    newSQL := StringReplace(newSQL, _enddateparam, TAppUtils.QuotD(EndDate.Date) ,[rfReplaceAll,rfIgnoreCase] );
  end;

  cxGrdMain.LoadFromSQL(newSQL, KeyName);
  cxGrdMain.EnableFiltering(True);
end;

end.
