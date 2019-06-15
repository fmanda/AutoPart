unit ufrmDefaultServerBrowse;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxContainer, Vcl.Menus, Vcl.ComCtrls, dxCore, cxDateUtils, cxClasses, cxLabel,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.StdCtrls, cxButtons,
  cxGroupBox, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxGridServerModeTableView,
  System.DateUtils, uDXUtils;

type
  TfrmDefaultServerBrowse = class(TfrmDefault)
    cxGrid: TcxGrid;
    cxGridLevel1: TcxGridLevel;
    cxGroupBox2: TcxGroupBox;
    btnTutup: TcxButton;
    btnExport: TcxButton;
    btnHapus: TcxButton;
    btnEdit: TcxButton;
    btnLihat: TcxButton;
    btnBaru: TcxButton;
    btnPrint: TcxButton;
    cxGroupBox1: TcxGroupBox;
    btnRefresh: TcxButton;
    EndDate: TcxDateEdit;
    StartDate: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    lblTitle: TcxLabel;
    styleRepo: TcxStyleRepository;
    styleOdd: TcxStyle;
    cxGrdMain: TcxGridServerModeTableView;
    procedure btnExportClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
    procedure cxGrdMainCellDblClick(Sender: TcxCustomGridTableView; ACellViewInfo:
        TcxGridTableDataCellViewInfo; AButton: TMouseButton; AShift: TShiftState;
        var AHandled: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function AutoRefresh: Boolean; dynamic;
    function GetSQL: string; dynamic;
    function GetKeyField: string; dynamic;
  public
    procedure RefreshData; dynamic;
    { Public declarations }
  end;

var
  frmDefaultServerBrowse: TfrmDefaultServerBrowse;

implementation

{$R *.dfm}

function TfrmDefaultServerBrowse.AutoRefresh: Boolean;
begin
  Result := True;
end;

procedure TfrmDefaultServerBrowse.btnExportClick(Sender: TObject);
begin
  inherited;
  cxGrdMain.ExportToXLS();
end;

procedure TfrmDefaultServerBrowse.btnRefreshClick(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmDefaultServerBrowse.btnTutupClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TfrmDefaultServerBrowse.cxGrdMainCellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  btnEdit.Click;
end;

procedure TfrmDefaultServerBrowse.FormCreate(Sender: TObject);
begin
  inherited;
  lblTitle.Caption := Self.Caption;
  StartDate.Date  := StartOfTheYear(Now());
  EndDate.Date    := EndOfTheMonth(Now());
  if AutoRefresh then RefreshData;
end;

function TfrmDefaultServerBrowse.GetKeyField: string;
begin
  Result := '';
end;

function TfrmDefaultServerBrowse.GetSQL: string;
begin
  Result := '';
end;

procedure TfrmDefaultServerBrowse.RefreshData;
begin
  cxGrdMain.LoadFromSQL(GetSQL, GetKeyField);
  cxGrdMain.EnableFiltering();
end;

end.
