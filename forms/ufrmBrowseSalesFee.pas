unit ufrmBrowseSalesFee;

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
  cxGridServerModeTableView, cxGrid, uSalesFee;

type
  TfrmBrowseSalesFee = class(TfrmDefaultServerBrowse)
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
  frmBrowseSalesFee: TfrmBrowseSalesFee;

implementation

uses
  ufrmSalesFee, uDXUtils, uAppUtils;

{$R *.dfm}

procedure TfrmBrowseSalesFee.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmSalesFee.Create(Application) do
  begin
    Try
      if ShowModal = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseSalesFee.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmSalesFee.Create(Application) do
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

procedure TfrmBrowseSalesFee.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;

  with TSalesFee.Create do
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

function TfrmBrowseSalesFee.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseSalesFee.GetSQL: string;
begin
  Result := 'select * from tsalesfee';
end;

end.
