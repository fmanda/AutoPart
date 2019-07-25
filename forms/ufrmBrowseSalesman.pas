unit ufrmBrowseSalesman;

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
  TfrmBrowseSalesman = class(TfrmDefaultServerBrowse)
    procedure btnBaruClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnLihatClick(Sender: TObject);
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
  frmBrowseSalesman: TfrmBrowseSalesman;

implementation

uses
  uAppUtils, ufrmSalesman, uSalesman, uDXUtils, uDBUtils;

{$R *.dfm}

procedure TfrmBrowseSalesman.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmSalesman.Create(Application) do
  begin
    Try
      if ShowModal = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseSalesman.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmSalesman.Create(Application) do
  begin
    LoadByID(cxGrdMain.GetID);
    Try
      if ShowModal = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseSalesman.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;

  with TSalesman.Create do
  begin
    if LoadByID(cxGrdMain.GetID) then
    begin
      if DeleteFromDB then
      begin
        TAppUtils.Information('Berhasil menghapus data');
        RefreshData;
      end;
    end;
    Free;
  end;

end;

procedure TfrmBrowseSalesman.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmSalesman.Create(Application) do
  begin
    LoadByID(cxGrdMain.GetID, True);
    Try
      if ShowModal = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

function TfrmBrowseSalesman.GetGroupName: string;
begin
  Result := 'Master Data';
end;

function TfrmBrowseSalesman.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseSalesman.GetSQL: string;
begin
  Result := 'select * from tsalesman';
end;

end.
