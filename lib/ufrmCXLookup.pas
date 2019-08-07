unit ufrmCXLookup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Datasnap.DSProxyRest,
  Datasnap.DSClientRest, Data.DB, Data.SqlExpr,
  Datasnap.Provider, Datasnap.DBClient, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, cxControls, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.StdCtrls, cxButtons, cxContainer, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxLabel, Vcl.ExtCtrls, dxBarBuiltInMenu, cxPC, cxCheckBox,
  cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmCXLookup = class(TForm)
    pnlHeader: TPanel;
    lblHeader: TLabel;
    lblFilterData: TcxLabel;
    StartDate: TcxDateEdit;
    EndDate: TcxDateEdit;
    btnRefresh: TcxButton;
    lblsdFilter: TcxLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    lbEscape: TLabel;
    btnClose: TcxButton;
    btnOK: TcxButton;
    Label1: TLabel;
    cxGrid: TcxGrid;
    cxGridView: TcxGridDBTableView;
    cxlvMaster: TcxGridLevel;
    pmSelect: TPopupMenu;
    CheckSelected1: TMenuItem;
    UnCheckSelected1: TMenuItem;
    N1: TMenuItem;
    CheckAll1: TMenuItem;
    UncheckAll1: TMenuItem;
    lbBenchmark: TLabel;
    styleRepo: TcxStyleRepository;
    styleOdd: TcxStyle;
    procedure btnRefreshClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure CheckAll1Click(Sender: TObject);
    procedure CheckSelected1Click(Sender: TObject);
    procedure cxGridViewCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo:
        TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
        var AHandled: Boolean);
    procedure cxGridViewKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure UncheckAll1Click(Sender: TObject);
    procedure UnCheckSelected1Click(Sender: TObject);
  private
    FCDS: TClientDataset;
    FData: TClientDataset;
    FMultiSelect: Boolean;
    FStartExecute: TDatetime;
    FSQL: String;
    function CopyDataset(Source: TDataset): TClientDataSet;
    procedure InitView;
    procedure SetCheckSelected(IsChecked: Boolean = True; IsSelectAll: Boolean =
        False);
    procedure SetMultiSelect(const Value: Boolean);
    procedure SetResultData;
    property CDS: TClientDataset read FCDS write FCDS;
    { Private declarations }
  protected
    procedure HideDateParams;
    procedure RefreshDataSet;
  public
    constructor Create(ARestConn: TDSRestConnection; aMultiSelect: Boolean =
        False); reintroduce;
    class function Execute(ADataSet: TClientDataSet; aMultiSelect: Boolean = False;
        aCaption: String = 'Lookup Data'): TfrmCXLookup; overload;
    class function Execute(ASQL: string; aMultiSelect: Boolean = False; aCaption:
        String = 'Lookup Data'): TfrmCXLookup; overload;
    procedure HideFields(FieldNames: Array Of String);
    procedure PreFilter(aFieldName, aValue: String);
    procedure Reset;
    procedure ShowFieldsOnly(FieldNames: Array Of String);
    property Data: TClientDataset read FData write FData;
    property StartExecute: TDatetime read FStartExecute write FStartExecute;
    property SQL: String read FSQL write FSQL;
    { Public declarations }
  published
    property MultiSelect: Boolean read FMultiSelect write SetMultiSelect;
  end;

var
  frmCXLookup: TfrmCXLookup;

const
  check_flag : String = 'check_flag';


implementation

uses
  uDBUtils, uDXUtils, System.DateUtils, uAppUtils;

{$R *.dfm}



procedure TfrmCXLookup.btnRefreshClick(Sender: TObject);
begin
  RefreshDataSet;
end;

procedure TfrmCXLookup.btnCloseClick(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
end;

procedure TfrmCXLookup.btnOKClick(Sender: TObject);
begin
  if not Assigned(FCDS) then
    Self.ModalResult := mrNone
  else begin
    SetResultData;
    if MultiSelect then
    begin
      FData.First;
      if Self.Data.RecordCount = 0 then
      begin
        TAppUtils.Warning('Tidak ada data yang dipilih');
        exit;
      end
    end;
    if not Self.Data.Eof then
      Self.ModalResult := mrOk;
  end;
end;

constructor TfrmCXLookup.Create(ARestConn: TDSRestConnection; aMultiSelect:
    Boolean = False);
begin
  inherited Create(nil);
  SQL := '';
  StartExecute := Now();
  Self.MultiSelect := aMultiSelect;
end;

procedure TfrmCXLookup.CheckAll1Click(Sender: TObject);
begin
  SetCheckSelected(True, True);
end;

procedure TfrmCXLookup.CheckSelected1Click(Sender: TObject);
begin
  SetCheckSelected(True);
end;

function TfrmCXLookup.CopyDataset(Source: TDataset): TClientDataSet;
var
  i: Integer;
  lFieldName: string;
  lRecNo: Integer;
begin
  Result := nil;
  if Source = nil then exit;

  Result := TClientDataSet.Create(Self);
  Result.FieldDefs.Assign(Source.FieldDefs);
  Result.FieldDefs.Add(check_flag, ftBoolean);
//  Result.AddField(check_flag,ftBoolean);

  for i := 0 to Result.FieldDefs.Count-1 do
  begin
    Result.FieldDefs[i].Required := False;
    If Result.FieldDefs[i].DataType = ftAutoInc then
      Result.FieldDefs[i].DataType := ftInteger;
  end;


  Result.CreateDataSet;
  for i := 0 to Result.Fields.Count-1 do
  begin
    Result.Fields[i].ReadOnly := False;
  end;

  lRecNo := Source.RecNo;
  Source.DisableControls;
  Result.DisableControls;
  Try
    Source.First;
    While not Source.Eof do
    begin
      Result.Append;
      Result.FieldByName(check_flag).AsBoolean := False;
      for i:=0 to Source.FieldCount-1 do
      begin
        lFieldName := Source.Fields[i].FieldName;
        Result.FieldByName(lFieldName).Value := Source.FieldByName(lFieldName).Value;
      end;
      Result.Post;

      Source.Next;
    end;
    Result.First;
  Finally
    Source.RecNo := lRecNo;
    Source.EnableControls;
    Result.EnableControls;
  end;
end;

procedure TfrmCXLookup.cxGridViewCellDblClick(Sender: TcxCustomGridTableView;
    ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift:
    TShiftState; var AHandled: Boolean);
begin
  If not Self.MultiSelect then
  begin
    btnOK.Click;
  end else
  begin
    CDS.Edit;
    CDS.FieldByName(check_flag).AsBoolean := not CDS.FieldByName(check_flag).AsBoolean;
    CDS.Post;
  end;
end;

procedure TfrmCXLookup.cxGridViewKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if Key = VK_RETURN then btnOK.Click;
end;

class function TfrmCXLookup.Execute(ASQL: string; aMultiSelect: Boolean =
    False; aCaption: String = 'Lookup Data'): TfrmCXLookup;
var
  aDataSet: TClientDataSet;
begin
  Result                    := TfrmCXLookup.Create(nil, aMultiSelect);
  Result.lblHeader.Caption  := aCaption;
  Result.HideDateParams;

  aDataSet := TDBUtils.OpenDataset(ASQL, Result);

  If aMultiSelect then
    Result.CDS := Result.CopyDataset(aDataSet)
  else
    Result.CDS := aDataSet;

  Result.btnRefresh.Visible := False;
  Result.initView;

end;

class function TfrmCXLookup.Execute(ADataSet: TClientDataSet; aMultiSelect:
    Boolean = False; aCaption: String = 'Lookup Data'): TfrmCXLookup;
begin
  Result                    := TfrmCXLookup.Create(nil, aMultiSelect);
  Result.lblHeader.Caption  := aCaption;
  Result.HideDateParams;

  If aMultiSelect then
    Result.CDS := Result.CopyDataset(ADataSet)
  else
    Result.CDS := ADataSet;

  Result.btnRefresh.Visible := False;
  Result.initView;

end;

procedure TfrmCXLookup.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  If Key = VK_ESCAPE then Self.Close;
  if Key = VK_RETURN then btnOK.Click;
end;

procedure TfrmCXLookup.FormShow(Sender: TObject);
var
  ms: Integer;
begin
  ms := MilliSecondsBetween(StartExecute, Now());
  lbBenchmark.Caption := 'Debug Benchmark = ' + IntToStr(ms) + ' ms';
end;

procedure TfrmCXLookup.HideDateParams;
begin
  lblFilterData.Visible := False;
  StartDate.Visible     := False;
  lblsdFilter.Visible   := False;
  EndDate.Visible       := False;
end;

procedure TfrmCXLookup.HideFields(FieldNames: Array Of String);
begin
  Self.cxGridView.SetVisibleColumns(FieldNames, False);
end;

procedure TfrmCXLookup.InitView;
var
  i: Integer;
  lCheckCol: TcxGridDBColumn;
begin
  if FCDS = nil then exit;
  cxGridView.LoadFromCDS(CDS, True, False);

  for i:=0 to cxGridView.ColumnCount-1 do
  begin
    cxGridView.Columns[i].Options.Editing := False;
    If Assigned(cxGridView.Columns[i].Properties) then
      cxGridView.Columns[i].Properties.ReadOnly := True;
  end;
//  exit;

  lCheckCol := cxGridView.GetColumnByFieldName(check_flag);

  if Assigned(lCheckCol) then
  begin
    lCheckCol.Options.Editing := True;
    lCheckCol.DataBinding.ValueType := 'Boolean';
    lCheckCol.PropertiesClass := TcxCheckBoxProperties;

    lCheckCol.Properties.ReadOnly := False;
    lCheckCol.Index := 0;
    lCheckCol.Caption := ' [X] ';
    TcxCheckBoxProperties(lCheckCol).ImmediatePost := True;
  end;
  cxGridView.OptionsBehavior.BestFitMaxRecordCount := 200;
  cxGridView.ApplyBestFit;
end;

procedure TfrmCXLookup.PreFilter(aFieldName, aValue: String);
var
  iColIndex: Integer;
begin
  if cxGridView.GetColumnByFieldName(aFieldName) = nil then
    raise Exception.Create('Column ' + aFieldName + ' not found');
  iColIndex := cxGridView.GetColumnByFieldName(aFieldName).Index;
  cxGridView.ViewData.FilterRow.Values[iColIndex] := aValue;

//  LastFilterIndex := iColIndex;

//  cxGrdMain.Columns[iColIndex]
end;

procedure TfrmCXLookup.ShowFieldsOnly(FieldNames: Array Of String);
begin
  Self.cxGridView.SetVisibleColumnsOnly(FieldNames, True);
  Self.cxGridView.SetVisibleColumns([check_flag], True);
end;

procedure TfrmCXLookup.RefreshDataSet;
//var
//  ADataSet: TDataSet;
begin
//  ADataSet := TDBUtils;
//
//  if Assigned(FCDS) then
//    FreeAndNil(FCDS);
//  if Assigned(ADataset) then
//  begin
//    if not MultiSelect then
//      CDS := TDBUtils.DSToCDS(ADataSet, Self, True)
//    else
//      CDS := Self.CopyDataset(ADataSet)
//  end;
//
//  if CDS <> nil then initView;
end;

procedure TfrmCXLookup.Reset;
begin
  if Self.MultiSelect then
  begin
    CDS.DisableControls;
    Try
      while not CDS.Eof do
      begin
        CDS.FieldByName(check_flag).AsBoolean := False;
        CDS.Next;
      end;
    Finally
      CDS.EnableControls;
    End;
  end;
end;

procedure TfrmCXLookup.SetCheckSelected(IsChecked: Boolean = True; IsSelectAll:
    Boolean = False);
var
  i: Integer;
  lAfterPostNotify: TDataSetNotifyEvent;
  lRecNo: Integer;
begin
  lAfterPostNotify  := CDS.AfterPost;
  CDS.AfterPost     := nil;
  cxGridView.DataController.BeginUpdate;
  Try
    If not Assigned(cxGridView.GetColumnByFieldName(check_flag)) then exit;
//    If IsSelectAll then DCMain.SelectAll;

    If not IsSelectAll then
    begin
//      cShowProgressDlg('Checking Process',cxGridView.Controller.SelectedRecordCount);
      for i := 0 to cxGridView.Controller.SelectedRecordCount-1 do
      begin
        cxGridView.Controller.SelectedRecords[i].Focused := True;
        With cxGridView.DataController.DataSource.DataSet do
        begin
          Edit;
          FieldByName(check_flag).AsBoolean := IsChecked;
          Post;
        end;
//        cStepProgressDlg;
      end;
    end else //optimize performance for select all
    begin
//      cShowProgressDlg('Checking Process',CDS.RecordCount);
      lRecNo := CDS.RecNo;
      CDS.DisableControls;
      CDS.First;
      while not CDS.eof do
      begin
        CDS.Edit;
        CDS.FieldByName(check_flag).AsBoolean := IsChecked;
        CDS.Post;
        CDS.Next;
//        cStepProgressDlg;
      end;
      CDS.RecNo := lRecNo;
      CDS.EnableControls;
    end;
//    If MultiSelect then CountSelected;
  Finally
//    cStopProgressDlg;
    CDS.AfterPost := lAfterPostNotify;
    cxGridView.DataController.EndUpdate;
  End;
end;

procedure TfrmCXLookup.SetMultiSelect(const Value: Boolean);
begin
  FMultiSelect := Value;
  If not FMultiSelect then
  begin
//    CDS.AfterPost := nil;
    Self.cxGrid.PopupMenu := nil;
    Self.cxGridView.SetVisibleColumns([check_flag], False);
  end;
//  else begin
//    CDS.AfterPost := CDSAfterPost;
//  end;

  Self.cxGridView.OptionsSelection.MultiSelect := FMultiSelect;
end;

procedure TfrmCXLookup.SetResultData;
begin
  if not Assigned(FCDS) then exit;
  //post pending data (check)
  if FCDS.State in [dsEdit, dsInsert] then
    FCDS.Post;

  if not Assigned(FData) then
    FData := TClientDataSet.Create(Self);

  FData.CloneCursor(Self.CDS, False);
  if MultiSelect then
  begin
    FData.Filtered := True;
    FData.Filter := check_flag + ' = True ';
    FData.First;
  end else
    FData.RecNo := FCDS.RecNo;
end;

procedure TfrmCXLookup.UncheckAll1Click(Sender: TObject);
begin
  SetCheckSelected(False, True);
end;

procedure TfrmCXLookup.UnCheckSelected1Click(Sender: TObject);
begin
  SetCheckSelected(False);
end;

end.
