unit ufrmBrowseMerk;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultBrowse, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxContainer, Vcl.Menus, Vcl.ComCtrls, dxCore, cxDateUtils, cxClasses, cxLabel,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, Vcl.StdCtrls, cxButtons,
  cxGroupBox, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ufrmMerk, uDXUtils,
  ufrmDefaultServerBrowse, cxGridServerModeTableView;

type
  TfrmBrowseMerk = class(TfrmDefaultServerBrowse)
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
  frmBrowseMerk: TfrmBrowseMerk;

implementation

{$R *.dfm}

procedure TfrmBrowseMerk.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmMerk.Create(Application) do
  begin
    Try
      if ShowModal = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseMerk.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmMerk.Create(Application) do
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

function TfrmBrowseMerk.GetGroupName: string;
begin
  Result := 'Master Data';
end;

function TfrmBrowseMerk.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseMerk.GetSQL: string;
begin
  Result := 'select * from tmerk';
end;

end.
