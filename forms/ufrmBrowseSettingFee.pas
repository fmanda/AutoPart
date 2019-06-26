unit ufrmBrowseSettingFee;

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
  cxGridServerModeTableView, cxGrid, uSettingFee;

type
  TfrmBrowseSettingFee = class(TfrmDefaultServerBrowse)
    procedure btnBaruClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetKeyField: string; override;
    function GetSQL: string; override;
  public
    { Public declarations }
  end;

var
  frmBrowseSettingFee: TfrmBrowseSettingFee;

implementation

uses
  ufrmSettingFee, uDXUtils, uAppUtils;

{$R *.dfm}

procedure TfrmBrowseSettingFee.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmSettingFee.Create(Application) do
  begin
    Try
      if ShowModal = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseSettingFee.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmSettingFee.Create(Application) do
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

procedure TfrmBrowseSettingFee.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;

  with TSettingFee.Create do
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

function TfrmBrowseSettingFee.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseSettingFee.GetSQL: string;
begin
  Result := 'select * from tsettingfee';
end;

end.
