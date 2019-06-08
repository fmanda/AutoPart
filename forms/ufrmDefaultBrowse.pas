unit ufrmDefaultBrowse;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Vcl.StdCtrls, cxButtons, cxGroupBox,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.DBClient, cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TfrmDefaultBrowse = class(TfrmDefault)
    cxGrid: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGroupBox2: TcxGroupBox;
    btnTutup: TcxButton;
    btnExport: TcxButton;
    btnHapus: TcxButton;
    btnEdit: TcxButton;
    btnLihat: TcxButton;
    btnBaru: TcxButton;
    cxGroupBox1: TcxGroupBox;
    btnRefresh: TcxButton;
    EndDate: TcxDateEdit;
    StartDate: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    lblTitle: TcxLabel;
    styleRepo: TcxStyleRepository;
    styleOdd: TcxStyle;
    btnPrint: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
  private
    FCDS: TClientDataSet;
    { Private declarations }
  protected
    function GetSQL: string; dynamic;
    function AutoRefresh: Boolean; dynamic;
    property CDS: TClientDataSet read FCDS write FCDS;
  public
    procedure RefreshData; dynamic;
    { Public declarations }
  end;

var
  frmDefaultBrowse: TfrmDefaultBrowse;

implementation

uses
  uDBUtils, uDXUtils, DateUtils, uAppUtils;

{$R *.dfm}

procedure TfrmDefaultBrowse.FormCreate(Sender: TObject);
begin
  inherited;
  lblTitle.Caption := Self.Caption;
  StartDate.Date  := StartOfTheYear(Now());
  EndDate.Date    := EndOfTheMonth(Now());
  if AutoRefresh then RefreshData;  
end;

procedure TfrmDefaultBrowse.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmDefaultBrowse.btnRefreshClick(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmDefaultBrowse.btnTutupClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

function TfrmDefaultBrowse.GetSQL: string;
begin
  Result := '';
end;

function TfrmDefaultBrowse.AutoRefresh: Boolean;
begin
  Result := True;
end;

procedure TfrmDefaultBrowse.RefreshData;
var
  lSQL: string;
begin
  lSQL := GetSQL;
  if lSQL = '' then exit;
  if FCDS <>  nil then FreeAndNil(FCDS);
  FCDS := TDBUtils.OpenDataset(lSQL, Self);
  cxGrdMain.LoadFromCDS(CDS);

  cxGrdMain.SetVisibleColumns(['ID'], False);
end;

end.
