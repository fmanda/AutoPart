unit ufrmLapNeraca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxCurrencyEdit, cxPropertiesStore, Datasnap.DBClient, cxSpinEdit, uDMReport;

type
  TfrmLapNeraca = class(TfrmDefaultReport)
    cxGrid1: TcxGrid;
    cxGrdActiva: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    clActivaParent: TcxGridDBColumn;
    clActivaSubAcc: TcxGridDBColumn;
    clActivaBalance: TcxGridDBColumn;
    clActivaBalanceprev: TcxGridDBColumn;
    cxGrid2: TcxGrid;
    cxGrdPassiva: TcxGridDBTableView;
    clPassivaParent: TcxGridDBColumn;
    clPassivaSubAcc: TcxGridDBColumn;
    clPassivaBalance: TcxGridDBColumn;
    clPassivaBalancePrev: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    styleBold: TcxStyle;
    cbMonth: TcxComboBox;
    spYear: TcxSpinEdit;
    cxLabel3: TcxLabel;
    cbMonthPrev: TcxComboBox;
    spYearPrev: TcxSpinEdit;
    chkDetail: TCheckBox;
    clActivaAcc: TcxGridDBColumn;
    clPassivaAcc: TcxGridDBColumn;
    cxGrdMerge: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    cxGrid3: TcxGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure clActivaParentGetDisplayText(Sender: TcxCustomGridTableItem; ARecord:
        TcxCustomGridRecord; var AText: string);
    procedure clPassivaParentGetDisplayText(Sender: TcxCustomGridTableItem;
        ARecord: TcxCustomGridRecord; var AText: string);
    procedure cbMonthPropertiesChange(Sender: TObject);
    procedure chkDetailClick(Sender: TObject);
    procedure clActivaSubAccGetDisplayText(Sender: TcxCustomGridTableItem; ARecord:
        TcxCustomGridRecord; var AText: string);
    procedure clPassivaSubAccGetDisplayText(Sender: TcxCustomGridTableItem;
        ARecord: TcxCustomGridRecord; var AText: string);
    procedure spYearPropertiesChange(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    FCDSActiva: TClientDataset;
    FCDSPassiva: TClientDataset;
    FCDSMerge: TClientDataset;
    function GetCDSMerge: TClientDataset;
    procedure LoadData;
    procedure MergeDataSet;
    procedure SetColumnCaption;
    property CDSActiva: TClientDataset read FCDSActiva write FCDSActiva;
    property CDSPassiva: TClientDataset read FCDSPassiva write FCDSPassiva;
    property CDSMerge: TClientDataset read GetCDSMerge write FCDSMerge;
    { Private declarations }
  public
    function ExtractGroupName(aGroupText: String): String;
    function GetGroupName: string; override;
    { Public declarations }
  end;

var
  frmLapNeraca: TfrmLapNeraca;

implementation

uses
  uAppUtils, uDXUtils, System.DateUtils, uDBUtils, cxExport, cxGridExportLink;

{$R *.dfm}

procedure TfrmLapNeraca.FormCreate(Sender: TObject);
begin
  inherited;
//  dtDate.Date := Now();
  cbMonth.ItemIndex := MonthOf(Now())-1;
  spYear.Value      := YearOf(Now());
end;

procedure TfrmLapNeraca.btnExportClick(Sender: TObject);
begin
//  inherited;
  cxGrdMerge.ExportToXLSDialog('Neraca'+cbMonth.Text+spYear.Text, True);
//  cxGrdPassiva.ExportToXLSDialog('Neraca_Passiva_'+cbMonth.Text+spYear.Text, False);
end;

procedure TfrmLapNeraca.btnPrintClick(Sender: TObject);
begin
//  inherited;
  DMReport.AddReportVariable('Neraca_PrevMonth',clActivaBalanceprev.Caption);
  DMReport.AddReportVariable('Neraca_CurrMonth',clActivaBalance.Caption);
  DMReport.AddReportVariable('Neraca_PeriodeMonth',cbMonth.Text);
  DMReport.AddReportVariable('Neraca_PeriodeYear',spYear.Text);
  DMReport.ExecuteReport('LapNeraca2K', CDSMerge);
end;

procedure TfrmLapNeraca.btnRefreshClick(Sender: TObject);
begin
  inherited;
  LoadData;

  cxGrdActiva.ViewData.Expand(True);
  cxGrdPassiva.ViewData.Expand(True);

  MergeDataSet;
  cxGrdMerge.LoadFromCDS(CDSMerge);
end;

procedure TfrmLapNeraca.cbMonthPropertiesChange(Sender: TObject);
begin
  inherited;
  SetColumnCaption;
end;

procedure TfrmLapNeraca.chkDetailClick(Sender: TObject);
begin
  inherited;
  clActivaAcc.Visible := chkDetail.Checked;
  clPassivaAcc.Visible := chkDetail.Checked;
  LoadData;
end;

procedure TfrmLapNeraca.clActivaParentGetDisplayText(Sender:
    TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  AText := ExtractGroupName(AText);
end;

procedure TfrmLapNeraca.clActivaSubAccGetDisplayText(Sender:
    TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  AText := ExtractGroupName(AText);
end;

procedure TfrmLapNeraca.clPassivaParentGetDisplayText(Sender:
    TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  AText := ExtractGroupName(AText);
end;

procedure TfrmLapNeraca.clPassivaSubAccGetDisplayText(Sender:
    TcxCustomGridTableItem; ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  AText := ExtractGroupName(AText);
end;

function TfrmLapNeraca.ExtractGroupName(aGroupText: String): String;
begin
  Result := Trim(Copy(aGroupText, Pos('-', aGroupText) + 1, MaxInt))
end;

procedure TfrmLapNeraca.FormResize(Sender: TObject);
begin
  inherited;
  cxGrid1.Width := Round(Self.Width/2);
end;

function TfrmLapNeraca.GetCDSMerge: TClientDataset;
begin
  if FCDSMerge = nil then
  begin
    FCDSMerge := TClientDataSet.Create(Self);
    FCDSMerge.AddField('A_Account',ftString);
    FCDSMerge.AddField('A_Prev',ftFloat);
    FCDSMerge.AddField('A_Curr',ftFloat);
    FCDSMerge.AddField('A_Flag',ftInteger);
    FCDSMerge.AddField('P_Account',ftString);
    FCDSMerge.AddField('P_Prev',ftFloat);
    FCDSMerge.AddField('P_Curr',ftFloat);
    FCDSMerge.AddField('P_Flag',ftInteger);
    FCDSMerge.CreateDataSet;

  end;
  Result := FCDSMerge;
end;


function TfrmLapNeraca.GetGroupName: string;
begin
  Result := 'Accounting';
end;

procedure TfrmLapNeraca.LoadData;
var
  S: string;
  currentMonth : TDateTime;
  prevMonth : TDateTime;
  sPrefix: string;
begin

  clActivaAcc.Visible := chkDetail.Checked;
  clPassivaAcc.Visible := chkDetail.Checked;

  currentMonth  := EndOfTheMonth(EncodeDate(spYear.Value, cbMonth.ItemIndex + 1, 1));
  prevMonth     := EndOfTheMonth(EncodeDate(spYearPrev.Value, cbMonthPrev.ItemIndex + 1, 1));

  sPrefix       := '';

  if chkDetail.Checked then
    sPrefix := '_detail';


  S := 'select * from fn_balancesheet_activa_2c' + sPrefix;

  S := S + '(' + TAppUtils.QuotD(currentMonth) +','
      + TAppUtils.QuotD(prevMonth) +') order by parent,SubAccount';

  if FCDSActiva <> nil then FreeAndNil(FCDSActiva);
  FCDSActiva := TDBUtils.OpenDataset(S);
  cxGrdActiva.PrepareFromCDS(CDSActiva);

  S := 'select * from fn_balancesheet_passiva_2c' + sPrefix;

  S := S + '(' + TAppUtils.QuotD(currentMonth) +','
      + TAppUtils.QuotD(prevMonth) +') order by parent,SubAccount';

  if FCDSPassiva <> nil then FreeAndNil(FCDSPassiva);
  FCDSPassiva := TDBUtils.OpenDataset(S);
  cxGrdPassiva.PrepareFromCDS(CDSPassiva);


end;

procedure TfrmLapNeraca.MergeDataSet;
var
  lParent: string;
  lPrevTotal, lCurrTotal: Double;

  procedure AppendOrEdit;
  begin
    CDSMerge.Next;
    if CDSMerge.Eof then
    begin
      CDSMerge.Append;
    end else
    begin
      CDSMerge.Edit;
    end;
  end;

  function RemoveCOA(aCOA: String): String;
  begin
    Result := Copy(aCOA, Pos('-', aCOA) + 1, 100);
  end;

  procedure ProcessDataset(ACDS: TClientDataset; AFlag: String);
  begin
    lParent     := '';
    lPrevTotal  := 0;
    lCurrTotal  := 0;

    CDSMerge.First;
    ACDS.First;
    while not ACDS.Eof do
    begin
      if (lParent <> ACDS.FieldByName('Parent').AsString)  then
      begin
        //Append Summary if not first
        if (lParent <> '') then
        begin
          AppendOrEdit;
          CDSMerge.FieldByName( AFlag + '_Account').AsString  := 'Total ' + RemoveCOA(lParent);
          CDSMerge.FieldByName( AFlag + '_Prev').AsFloat      := lPrevTotal;
          CDSMerge.FieldByName( AFlag + '_Curr').AsFloat      := lCurrTotal;
          CDSMerge.FieldByName( AFlag + '_Flag').AsInteger    := 2; //Bold, Show Value
          CDSMerge.Post;

          lPrevTotal  := 0;
          lCurrTotal  := 0;
        end;
        //Append Title
        AppendOrEdit;
        lParent                                             := ACDS.FieldByName('Parent').AsString;
        CDSMerge.FieldByName( AFlag + '_Account').AsString  := RemoveCOA(lParent);
        CDSMerge.FieldByName( AFlag + '_Prev').AsFloat      := lPrevTotal;
        CDSMerge.FieldByName( AFlag + '_Curr').AsFloat      := lCurrTotal;
        CDSMerge.FieldByName( AFlag + '_Flag').AsInteger    := 1; //Bold, Hide Value
        CDSMerge.Post;
      end;

      lPrevTotal  := lPrevTotal + ACDS.FieldByName('PrevMonth').AsFloat;
      lCurrTotal  := lCurrTotal + ACDS.FieldByName('CurrMonth').AsFloat;

      AppendOrEdit;
      if chkDetail.Checked then
        CDSMerge.FieldByName( AFlag + '_Account').AsString  := RemoveCOA(ACDS.FieldByName('Account').AsString)
      else
        CDSMerge.FieldByName( AFlag + '_Account').AsString  := RemoveCOA(ACDS.FieldByName('SubAccount').AsString);
      CDSMerge.FieldByName( AFlag + '_Prev').AsFloat      := ACDS.FieldByName('PrevMonth').AsFloat;
      CDSMerge.FieldByName( AFlag + '_Curr').AsFloat      := ACDS.FieldByName('CurrMonth').AsFloat;
      CDSMerge.FieldByName( AFlag + '_Flag').AsInteger    := 0; //Reguler, Show Value
      CDSMerge.Post;
      ACDS.Next;
    end;

    //Last Append Total
    AppendOrEdit;
    CDSMerge.FieldByName( AFlag + '_Account').AsString  := 'Total ' + RemoveCOA(lParent);
    CDSMerge.FieldByName( AFlag + '_Prev').AsFloat      := lPrevTotal;
    CDSMerge.FieldByName( AFlag + '_Curr').AsFloat      := lCurrTotal;
    CDSMerge.FieldByName( AFlag + '_Flag').AsInteger    := 2; //Bold, Show Value
    CDSMerge.Post;

  end;




begin
  // TODO -cMM: TfrmLapNeraca.MergeDataSet default body inserted
  CDSMerge.EmptyDataSet;
  CDSActiva.First;


  CDSMerge.Append; //for starter, next delete this
  CDSMerge.Post;

  ProcessDataset(CDSActiva, 'A');
  ProcessDataset(CDSPassiva, 'P');

  CDSMerge.First;
  CDSMerge.Delete;
end;

procedure TfrmLapNeraca.SetColumnCaption;
begin

  if (cbMonth.ItemIndex = 0) then
  begin
    spYearPrev.Value := spYear.Value - 1;
    cbMonthPrev.ItemIndex := 11
  end else
  begin
    cbMonthPrev.ItemIndex := cbMonth.ItemIndex - 1;
    spYearPrev.Value := spYear.Value;
  end;


  clActivaBalance.Caption := cbMonth.Text;
  clPassivaBalance.Caption := cbMonth.Text;

  clActivaBalancePrev.Caption := cbMonthPrev.Text;
  clPassivaBalancePrev.Caption := cbMonthPrev.Text;
end;

procedure TfrmLapNeraca.spYearPropertiesChange(Sender: TObject);
begin
  inherited;
  SetColumnCaption;
end;

end.
