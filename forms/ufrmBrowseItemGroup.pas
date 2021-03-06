unit ufrmBrowseItemGroup;

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
  cxGridServerModeTableView, cxGrid, ufrmItemGroup, uDXUtils, uAppUtils;

type
  TfrmBrowseItemGroup = class(TfrmDefaultServerBrowse)
    procedure btnBaruClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
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
  frmBrowseItemGroup: TfrmBrowseItemGroup;

implementation

uses
  uItem;

{$R *.dfm}

procedure TfrmBrowseItemGroup.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmItemGroup.Create(Application) do
  begin
    Try
      if ShowModalDlg = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseItemGroup.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmItemGroup.Create(Application) do
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

procedure TfrmBrowseItemGroup.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;
  
  with TItemGroup.Create do
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

function TfrmBrowseItemGroup.GetGroupName: string;
begin
  Result := 'Master Data';
end;

function TfrmBrowseItemGroup.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseItemGroup.GetSQL: string;
begin
  Result := 'select * from titemgroup';
end;

end.
