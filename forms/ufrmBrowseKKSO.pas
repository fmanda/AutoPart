unit ufrmBrowseKKSO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultServerBrowse, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxContainer,
  Vcl.Menus, Vcl.ComCtrls, dxCore, cxDateUtils, cxClasses, cxLabel, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.StdCtrls, cxButtons, cxGroupBox,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridServerModeTableView, cxGrid;

type
  TfrmBrowseKKSO = class(TfrmDefaultServerBrowse)
    procedure btnBaruClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnLihatClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetKeyField: string; override;
    function GetSQL: string; override;
  public
    function GetGroupName: string; override;
    { Public declarations }
  end;

var
  frmBrowseKKSO: TfrmBrowseKKSO;

implementation

uses
  ufrmKKSO, uDXUtils, uDBUtils, uAppUtils, uTransDetail;

{$R *.dfm}

procedure TfrmBrowseKKSO.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmKKSO.Create(Application) do
  begin
    Try
      if ShowModalDlg = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseKKSO.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmKKSO.Create(Application) do
  begin
    LoadByID(Self.cxGrdMain.GetID, False);
    Try
      if ShowModalDlg = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseKKSO.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;

  with TKKSO.Create do
  begin
    if LoadByID(Self.cxGrdMain.GetID) then
    begin
      if not IsValidTransDate(TransDate) then exit;

      if StockOpname <> nil then
      begin
        if StockOpname.ID > 0 then
        begin
          TAppUtils.Warning('KKSO sudah diproses stock opname, tidak bisa dihapus');
          exit;
        end;
      end;

      if DeleteFromDB then
      begin
        TAppUtils.Information('Berhasil menghapus data');
        RefreshData;
      end;
    end;
    Free;
  end;
end;

procedure TfrmBrowseKKSO.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmKKSO.Create(Application) do
  begin
    LoadByID(Self.cxGrdMain.GetID, True);
    Try
      ShowModalDlg;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseKKSO.FormCreate(Sender: TObject);
begin
  StartDate.Date := (Now());
  EndDate.Date := (Now());
  inherited;
end;

function TfrmBrowseKKSO.GetGroupName: string;
begin
  Result := 'Inventory';
end;

function TfrmBrowseKKSO.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseKKSO.GetSQL: string;
begin
  Result := 'SELECT A.ID, A.REFNO, A.TRANSDATE, B.NAMA AS WAREHOUSE,'
           +' A.RAK, A.PIC, A.NOTES, A.MODIFIEDBY, A.MODIFIEDDATE, C.REFNO AS NOSTOCKOPNAME'
           +' FROM TKKSO A'
           +' LEFT JOIN TWAREHOUSE B ON A.WAREHOUSE_ID = B.ID'
           +' LEFT JOIN TSTOCKOPNAME C ON A.STOCKOPNAME_ID = C.ID'
           +' WHERE A.TRANSDATE BETWEEN ' + TAppUtils.QuotD(StartDate.Date)
           +' AND ' + TAppUtils.QuotD(EndDate.Date);

end;

end.
