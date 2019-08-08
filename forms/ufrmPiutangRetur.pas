unit ufrmPiutangRetur;

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
  cxGridDBTableView, cxGrid, cxCheckBox, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Datasnap.DBClient;

type
  TfrmPiutangRetur = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel3: TcxLabel;
    dtRefDate: TcxDateEdit;
    ckDueDate: TcxCheckBox;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    procedure btnExportClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    CDS: TClientDataset;
    { Private declarations }
  public
    function GetGroupName: string; override;
    { Public declarations }
  end;

var
  frmPiutangRetur: TfrmPiutangRetur;

implementation

uses
  uDBUtils, uDXUtils, uAppUtils;

{$R *.dfm}

procedure TfrmPiutangRetur.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmPiutangRetur.btnRefreshClick(Sender: TObject);
var
  S: string;
begin
  inherited;
  S := 'SELECT * FROM FN_PIUTANG_RETUR(' + TAppUtils.QuotD(dtRefDate.Date) +')';
  if CDS <> nil then
    FreeAndNil(CDS);

  CDS := TDBUtils.OpenDataset(S, Self);
  cxGrdMain.LoadFromCDS(CDS);
  cxGrdMain.SetVisibleColumns(['SALESRETUR_ID','HEADERREMAIN'],False);
  cxGrdMain.SetSummaryByColumns(['REMAIN']);
  cxGrdMain.EnableFiltering();
end;

procedure TfrmPiutangRetur.FormCreate(Sender: TObject);
begin
  inherited;
  dtRefDate.Date := (Now());
end;

function TfrmPiutangRetur.GetGroupName: string;
begin
  Result := 'Hutang & Piutang';
end;

end.
