unit ufrmHutangRetur;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.ComCtrls, dxCore, cxDateUtils, cxCheckBox, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxStyles, cxClasses, Vcl.StdCtrls,
  cxButtons, cxLabel, cxGroupBox, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Datasnap.DBClient;

type
  TfrmHutangRetur = class(TfrmDefaultReport)
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
  frmHutangRetur: TfrmHutangRetur;

implementation

uses
  uAppUtils, uDBUtils, uDXUtils, System.DateUtils;

{$R *.dfm}

procedure TfrmHutangRetur.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmHutangRetur.btnRefreshClick(Sender: TObject);
var
  S: string;
begin
  inherited;
  S := 'SELECT * FROM FN_HUTANG_RETUR(' + TAppUtils.QuotD(dtRefDate.Date) +')';
  if CDS <> nil then
    FreeAndNil(CDS);

  CDS := TDBUtils.OpenDataset(S, Self);
  cxGrdMain.LoadFromCDS(CDS);
  cxGrdMain.SetVisibleColumns(['PURCHASERETUR_ID','HEADERREMAIN'],False);
  cxGrdMain.SetSummaryByColumns(['REMAIN']);
  cxGrdMain.EnableFiltering();
end;

procedure TfrmHutangRetur.FormCreate(Sender: TObject);
begin
  inherited;
  dtRefDate.Date := (Now());
end;

function TfrmHutangRetur.GetGroupName: string;
begin
  Result := 'Hutang & Piutang';
end;

end.
