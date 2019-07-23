unit ufrmLapPiutang;

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
  cxGridDBTableView, cxGrid, cxCheckBox, cxButtonEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Datasnap.DBClient;

type
  TfrmLapPiutang = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel3: TcxLabel;
    dtRefDate: TcxDateEdit;
    edKode: TcxButtonEdit;
    ckItem: TcxCheckBox;
    ckDueDate: TcxCheckBox;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    CDS: TClientDataset;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapPiutang: TfrmLapPiutang;

implementation

uses
  uAppUtils, uDBUtils, uDXUtils, System.DateUtils;

{$R *.dfm}

procedure TfrmLapPiutang.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmLapPiutang.btnRefreshClick(Sender: TObject);
var
  S: string;
begin
  inherited;
  S := 'SELECT * FROM FN_AR_OUTSTANDING(' + TAppUtils.QuotD(dtRefDate.Date) +')';
  if CDS <> nil then
    FreeAndNil(CDS);

  CDS := TDBUtils.OpenDataset(S, Self);
  cxGrdMain.LoadFromCDS(CDS);
  cxGrdMain.SetVisibleColumns(['SALESINVOICE_ID','HEADERREMAIN'],False);
  cxGrdMain.SetSummaryByColumns(['REMAIN']);
end;

procedure TfrmLapPiutang.FormCreate(Sender: TObject);
begin
  inherited;
  dtRefDate.Date := (Now());
end;

end.
