unit ufrmARAging;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxRadioGroup, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB,
  cxDBData, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, Datasnap.DBClient;

type
  TfrmARAging = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel3: TcxLabel;
    dtRefDate: TcxDateEdit;
    rbJenis: TcxRadioGroup;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colKode: TcxGridDBColumn;
    colNotes: TcxGridDBColumn;
    colCurrent: TcxGridDBColumn;
    colRange1: TcxGridDBColumn;
    colRange2: TcxGridDBColumn;
    colRange3: TcxGridDBColumn;
    colRange4: TcxGridDBColumn;
    colRange5: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1Level2: TcxGridLevel;
    cxGrdDetail: TcxGridDBTableView;
    styleCurrent: TcxStyle;
    styleRange1: TcxStyle;
    styleRange2: TcxStyle;
    styleRange3: TcxStyle;
    styleRange4: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure cxGrdMainDataControllerDetailExpanded(
      ADataController: TcxCustomDataController; ARecordIndex: Integer);
    procedure colCurrentStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure colRange1StylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure colRange2StylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure colRange3StylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
    procedure colRange4StylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      var AStyle: TcxStyle);
  private
    FCDSDetail: TClientDataset;
    FCDSMain: TClientDataset;
    function GetCDSMain: TClientDataset;
    procedure RefreshData;
    property CDSDetail: TClientDataset read FCDSDetail write FCDSDetail;
    property CDSMain: TClientDataset read GetCDSMain write FCDSMain;
    { Private declarations }
  public
    function GetGroupName: string; override;
    { Public declarations }
  end;

var
  frmARAging: TfrmARAging;

implementation

uses
  uDXUtils, uDBUtils, uAppUtils;

{$R *.dfm}

procedure TfrmARAging.colCurrentStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord <> nil then
    if VarToFloat(ARecord.Values[colCurrent.Index])>0 then
      AStyle := styleCurrent;
end;

procedure TfrmARAging.colRange1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord <> nil then
    if VarToFloat(ARecord.Values[colRange1.Index])>0 then
      AStyle := styleRange1;
end;

procedure TfrmARAging.colRange2StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord <> nil then
    if VarToFloat(ARecord.Values[colRange2.Index])>0 then
      AStyle := styleRange2;
end;

procedure TfrmARAging.colRange3StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord <> nil then
    if VarToFloat(ARecord.Values[colRange3.Index])>0 then
      AStyle := styleRange3;
end;

procedure TfrmARAging.colRange4StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; var AStyle: TcxStyle);
begin
  inherited;
  if ARecord <> nil then
    if VarToFloat(ARecord.Values[colRange4.Index])>0 then
      AStyle := styleRange4;
end;

procedure TfrmARAging.cxGrdMainDataControllerDetailExpanded(
  ADataController: TcxCustomDataController; ARecordIndex: Integer);
begin
  inherited;
  with (ADataController.GetDetailDataController(ARecordIndex, 0).GetOwner as TcxGridDBTableView) do
  begin
    BeginBestFitUpdate;
    ApplyBestFit();
    EndBestFitUpdate;
  end;
end;

procedure TfrmARAging.FormCreate(Sender: TObject);
begin
  inherited;
  dtRefDate.Date := Now();
end;

procedure TfrmARAging.btnRefreshClick(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

function TfrmARAging.GetCDSMain: TClientDataset;
begin
  if FCDSMain = nil then
  begin
    FCDSMain := TClientDataSet.Create(Self);
    FCDSMain.AddField('Salesman', ftString);
    FCDSMain.AddField('Customer', ftString);
    FCDSMain.AddField('Current', ftFloat);
    FCDSMain.AddField('Range1', ftFloat);
    FCDSMain.AddField('Range2', ftFloat);
    FCDSMain.AddField('Range3', ftFloat);
    FCDSMain.AddField('Range4', ftFloat);
    FCDSMain.AddField('Total', ftFloat);
    FCDSMain.CreateDataSet;
  end;
  Result := FCDSMain;
end;

function TfrmARAging.GetGroupName: string;
begin
  Result := 'Manajemen';
end;

procedure TfrmARAging.RefreshData;
var
  lParent: string;
  S: string;
begin
  if CDSDetail <> nil then
    FreeAndNil(FCDSDetail);

  S := 'SELECT * FROM FN_AR_AGING(' + TAppUtils.QuotD(dtRefDate.Date) + ')';


  if rbJenis.ItemIndex = 0 then
    lParent := 'CUSTOMER'
  else
    lParent := 'SALESMAN';

  S := S + ' order by ' + lParent;

  FCDSDetail := TDBUtils.OpenDataset(S, Self);


  CDSMain.DisableControls;
  CDSDetail.DisableControls;
  Try
    CDSMain.EmptyDataSet;
    while not CDSDetail.Eof do
    begin
      if CDSMain.Locate(lParent, CDSDetail.FieldByName(lParent).AsString, [loCaseInsensitive])
      then
        CDSMain.Edit
      else
      begin
        CDSMain.Append;
        CDSMain.SetFieldFrom('Salesman', CDSDetail);
        CDSMain.SetFieldFrom('Customer', CDSDetail);
        CDSMain.FieldByName('Current').AsFloat := 0;
        CDSMain.FieldByName('Range1').AsFloat := 0;
        CDSMain.FieldByName('Range2').AsFloat := 0;
        CDSMain.FieldByName('Range3').AsFloat := 0;
        CDSMain.FieldByName('Range4').AsFloat := 0;
        CDSMain.FieldByName('Total').AsFloat := 0;
      end;


      CDSMain.FieldByName('Current').AsFloat :=
        CDSMain.FieldByName('Current').AsFloat + CDSDetail.FieldByName('Current').AsFloat;
      CDSMain.FieldByName('Range1').AsFloat :=
        CDSMain.FieldByName('Range1').AsFloat + CDSDetail.FieldByName('Range1').AsFloat;
      CDSMain.FieldByName('Range2').AsFloat :=
        CDSMain.FieldByName('Range2').AsFloat + CDSDetail.FieldByName('Range2').AsFloat;
      CDSMain.FieldByName('Range3').AsFloat :=
        CDSMain.FieldByName('Range3').AsFloat + CDSDetail.FieldByName('Range3').AsFloat;
      CDSMain.FieldByName('Range4').AsFloat :=
        CDSMain.FieldByName('Range4').AsFloat + CDSDetail.FieldByName('Range4').AsFloat;
      CDSMain.FieldByName('Total').AsFloat :=
        CDSMain.FieldByName('Total').AsFloat + CDSDetail.FieldByName('Current').AsFloat
        + CDSDetail.FieldByName('Range1').AsFloat  + CDSDetail.FieldByName('Range2').AsFloat
        + CDSDetail.FieldByName('Range3').AsFloat  + CDSDetail.FieldByName('Range4').AsFloat;

      CDSMain.Post;

      CDSDetail.Next;
    end;
  Finally
    CDSMain.EnableControls;
    CDSDetail.EnableControls;
  End;


  cxGrdMain.PrepareFromCDS(CDSMain);
//  cxGrdMain.ApplyBestFit;
  cxGrdDetail.LoadFromCDS(CDSDetail);



  cxGrdDetail.SetVisibleColumns(['Current','Range1','Range2','Range3','Range4'],False);
  cxGrdMain.SetVisibleColumnsOnly([lParent, 'Current','Range1','Range2','Range3','Range4','Total'],True);

  cxGrdDetail.SetMasterKeyField(lParent);
  cxGrdDetail.SetDetailKeyField(lParent);
  cxGrdMain.EnableFiltering();

//  cxGrdDetail.BeginBestFitUpdate;
//  cxGrdDetail.ApplyBestFit();
//  cxGrdDetail.EndBestFitUpdate;

end;

end.
