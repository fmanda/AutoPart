unit ufrmBrowseRekening;

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
  TfrmBrowseRekening = class(TfrmDefaultServerBrowse)
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
  frmBrowseRekening: TfrmBrowseRekening;

implementation

uses
  uDXUtils, uDBUtils, ufrmRekening, uAccount, uAppUtils;

{$R *.dfm}

procedure TfrmBrowseRekening.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmRekening.Create(Application) do
  begin
    Try
      if ShowModal = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseRekening.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmRekening.Create(Application) do
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

procedure TfrmBrowseRekening.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;

  with TRekening.Create do
  begin
    if LoadByID(cxGrdMain.GetID) then
      if DeleteFromDB then
      begin
        TAppUtils.Information('Berhasil menghapus data');
        RefreshData;
      end;
    Free;
  end;

end;

procedure TfrmBrowseRekening.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmRekening.Create(Application) do
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

function TfrmBrowseRekening.GetGroupName: string;
begin
  Result := 'Master Data';
end;

function TfrmBrowseRekening.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseRekening.GetSQL: string;
begin
  Result := 'select * from trekening';
end;

end.
