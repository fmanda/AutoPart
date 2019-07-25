unit ufrmBrowseUser;

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
  TfrmBrowseUser = class(TfrmDefaultServerBrowse)
    procedure btnBaruClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
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
  frmBrowseUser: TfrmBrowseUser;

implementation

uses
  uDXUtils, ufrmUser;

{$R *.dfm}

procedure TfrmBrowseUser.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmUser.Create(Application) do
  begin
    Try
      if ShowModalDlg = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseUser.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmUser.Create(Application) do
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

procedure TfrmBrowseUser.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmUser.Create(Application) do
  begin
    LoadByID(Self.cxGrdMain.GetID);
    Try
      if ShowModalDlg = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

function TfrmBrowseUser.GetGroupName: string;
begin
  Result := 'Aplikasi';
end;

function TfrmBrowseUser.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseUser.GetSQL: string;
begin
  Result := 'select id, username, nama from tuser where isnull(superuser,0) = 0';
end;

end.
