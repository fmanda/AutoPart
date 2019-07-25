unit ufrmBrowseUOM;

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
  cxGridServerModeTableView, cxGrid, ufrmUOM;

type
  TfrmBrowseUOM = class(TfrmDefaultServerBrowse)
    procedure btnBaruClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
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
  frmBrowseUOM: TfrmBrowseUOM;

implementation

uses
  uDXUtils;

{$R *.dfm}

procedure TfrmBrowseUOM.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmUOM.Create(Application) do
  begin
    Try
      if ShowModalDlg = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseUOM.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmUOM.Create(Application) do
  begin
    LoadByID(cxGrdMain.GetID);
    Try
      if ShowModalDlg = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

function TfrmBrowseUOM.GetGroupName: string;
begin
  Result := 'Master Data';
end;

function TfrmBrowseUOM.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseUOM.GetSQL: string;
begin
  Result := 'select * from tuom';
end;

end.
