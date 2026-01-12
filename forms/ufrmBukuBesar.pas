unit ufrmBukuBesar;

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
  cxGridDBTableView, cxGrid, cxButtonEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, Datasnap.DBClient;

type
  TfrmBukuBesar = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edNama: TcxTextEdit;
    cxLabel3: TcxLabel;
    dtStart: TcxDateEdit;
    edKode: TcxButtonEdit;
    dtEnd: TcxDateEdit;
    cxLabel5: TcxLabel;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure edNamaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnRefreshClick(Sender: TObject);
    procedure edKodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnExportClick(Sender: TObject);
  private
    FCDS: TClientDataset;
    procedure LookupCOA;
    property CDS: TClientDataset read FCDS write FCDS;
    { Private declarations }
  public
    function GetGroupName: string; override;
    { Public declarations }
  end;

var
  frmBukuBesar: TfrmBukuBesar;

implementation

uses
  ufrmCXLookup, uDBUtils, uDXUtils, uAppUtils, System.DateUtils;

{$R *.dfm}

procedure TfrmBukuBesar.FormCreate(Sender: TObject);
begin
  inherited;
  dtStart.Date  := StartOfTheMonth(Now());
  dtEnd.Date    := EndOfTheMonth(Now())
end;

procedure TfrmBukuBesar.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmBukuBesar.btnRefreshClick(Sender: TObject);
var
  S: string;
begin
  inherited;

  S := 'SELECT * FROM FN_BUKUBESAR('+ QuotedStr(edKode.Text)
      +',' + TAppUtils.QuotD(dtStart.Date)
      +', ' + TAppUtils.QuotD(dtEnd.Date) + ')';

  if FCDS <> nil then
    FreeAndNil(FCDS);

  FCDS := TDBUtils.OpenDataset(S, Self);
  cxGrdMain.LoadFromCDS(CDS);
  cxGrdMain.SetSummaryByColumns(['DEBET','CREDIT']);
  cxGrdMain.EnableFiltering();
end;

procedure TfrmBukuBesar.edKodePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  LookupCOA
end;

procedure TfrmBukuBesar.edNamaKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
var
  sKey: string;
  Edit: TcxCustomEdit;
begin
  inherited;
  Edit := Sender as TcxCustomEdit;
  sKey := VarToStr(Edit.EditingValue);

  if (Key = VK_F5) then
  begin
    LookupCOA();
  end
  else if (Key = VK_RETURN) then
    SelectNext(Screen.ActiveControl, True, True);
end;

function TfrmBukuBesar.GetGroupName: string;
begin
  Result := 'Accounting';
end;

procedure TfrmBukuBesar.LookupCOA;
var
  cxLookup: TfrmCXLookup;
  s: string;
begin
  s := 'SELECT KODE, NAMA from TACCOUNT WHERE ISDETAIL = 1';

  cxLookup := TfrmCXLookup.Execute(s);
  try
    if cxLookup.ShowModal = mrOK then
    begin
      edKode.Text := cxLookup.Data.FieldByName('KODE').AsString;
      edNama.Text := cxLookup.Data.FieldByName('NAMA').AsString;
    end;
  finally
    cxLookup.Free;
  end;
end;

end.
