unit ufrmLapCashOpname;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCalendar, cxTextEdit, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxGrid, cxMaskEdit,
  cxDropDownEdit, Datasnap.DBClient;

type
  TfrmLapCashOpname = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel3: TcxLabel;
    dtStart: TcxDateEdit;
    dtEnd: TcxDateEdit;
    cxLabel5: TcxLabel;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colTransDate: TcxGridDBColumn;
    colRefNo: TcxGridDBColumn;
    colNotes: TcxGridDBColumn;
    colQty: TcxGridDBColumn;
    colSaldo: TcxGridDBColumn;
    colUOM: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    CDS: TClientDataset;
    procedure LoadData;
    { Private declarations }
  public
    function GetGroupName: string; override;
    { Public declarations }
  end;

var
  frmLapCashOpname: TfrmLapCashOpname;

implementation

uses
  System.DateUtils, uDBUtils, uDXUtils, uAppUtils;

{$R *.dfm}

procedure TfrmLapCashOpname.btnRefreshClick(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TfrmLapCashOpname.FormCreate(Sender: TObject);
begin
  inherited;
  dtStart.Date := StartOfTheMonth(Now());
  dtEnd.Date := Now();
end;

function TfrmLapCashOpname.GetGroupName: string;
begin
  Result := 'Penjualan & Kas';
end;

procedure TfrmLapCashOpname.LoadData;
var
  S: string;
begin
  S := 'SELECT A.TRANSDATE, C.NAMA AS REKENING, B.SALDOSYSTEM, B.SALDOFISIK, B.VARIANT, B.NOTES'
      +' FROM TCASHOPNAME A'
      +' INNER JOIN TCASHOPNAMEITEM B ON B.CASHOPNAME_ID = A.ID'
      +' INNER JOIN TREKENING C ON B.REKENING_ID = C.ID'
      +' WHERE A.TRANSDATE BETWEEN ' + TAppUtils.QuotD(dtStart.Date)
      +' AND ' + TAppUtils.QuotD(dtEnd.Date);

  if CDS <> nil then
    FreeAndNil(CDS);

  CDS := TDBUtils.OpenDataset(S, Self);
  cxGrdMain.LoadFromCDS(CDS, False, False);
end;

end.
