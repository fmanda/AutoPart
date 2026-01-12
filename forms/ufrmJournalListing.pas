unit ufrmJournalListing;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.ComCtrls, dxCore, cxDateUtils, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxClasses, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox, Datasnap.DBClient,
  DateUtils, uDBUtils, uDXUtils, uAppUtils;

type
  TfrmJournalListing = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel3: TcxLabel;
    dtStart: TcxDateEdit;
    cxLabel1: TcxLabel;
    dtEnd: TcxDateEdit;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
  private
    FCDS: TClientDataset;
    property CDS: TClientDataset read FCDS write FCDS;
    { Private declarations }
  public
    function GetGroupName: string; override;
    { Public declarations }
  end;

var
  frmJournalListing: TfrmJournalListing;

implementation

{$R *.dfm}

procedure TfrmJournalListing.FormCreate(Sender: TObject);
begin
  inherited;
  dtStart.Date := StartOfTheMonth(Now());
  dtEnd.Date := EndOfTheMonth(Now());
end;

procedure TfrmJournalListing.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmJournalListing.btnRefreshClick(Sender: TObject);
var
  S: string;
begin
  inherited;
    S := 'SELECT A.TRANSDATE, A.REFNO, A.DESCRIPTION, '
      +' A.ACCOUNTCODE, B.NAMA AS ACCOUNTNAME, A.DEBET, A.CREDIT, '
      +' A.COSTCENTER, A.TRANSTYPE, A.MODIFIEDDATE, A.MODIFIEDBY, A.FLAGNO '
      +' FROM TJOURNAL A'
      +' INNER JOIN TACCOUNT B ON A.ACCOUNTCODE = B.KODE  '
      +' WHERE A.TRANSDATE BETWEEN ' + TAppUtils.QuotD(dtStart.Date)
      +' and ' + TAppUtils.QuotD(dtEnd.Date)
      +' ORDER BY A.TRANSDATE,  A.REFNO,  A.FLAGNO ' ;


  if FCDS <> nil then
    FreeAndNil(FCDS);

  FCDS := TDBUtils.OpenDataset(S, Self);
  cxGrdMain.LoadFromCDS(CDS);
  cxGrdMain.SetSummaryByColumns(['DEBET']);
  cxGrdMain.SetSummaryByColumns(['CREDIT']);
  cxGrdMain.EnableFiltering();

end;

function TfrmJournalListing.GetGroupName: string;
begin
  Result := 'Accounting';
end;

end.
