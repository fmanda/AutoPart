unit ufrmBrowseItem;

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
  cxGridServerModeTableView, cxGrid, uDXUtils;

type
  TfrmBrowseItem = class(TfrmDefaultServerBrowse)
    procedure btnBaruClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnLihatClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function GetKeyField: string; override;
    function GetSQL: string; override;
  public
    { Public declarations }
  end;

var
  frmBrowseItem: TfrmBrowseItem;

implementation

uses
  ufrmItem, uDBUtils;

{$R *.dfm}

procedure TfrmBrowseItem.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmItem.Create(Application) do
  begin
    Try
      if ShowModal = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseItem.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmItem.Create(Application) do
  begin
    LoadByID(cxGrdMain.GetID, False);
    Try
      if ShowModal = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseItem.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmItem.Create(Application) do
  begin
    LoadByID(cxGrdMain.GetID, True);
    Try
      ShowModal;
    Finally
      Free;
    End;
  end;
end;

function TfrmBrowseItem.GetKeyField: string;
begin
  Result := 'id';
end;

function TfrmBrowseItem.GetSQL: string;
begin
  Result := 'SELECT A.ID, A.KODE, A.NAMA, A.NOTES AS CATATAN,'
          +' B.NAMA AS MERK, C.NAMA AS GROUP_BARANG, A.PPN, A.RAK,'
          +' A.MODIFIEDDATE, A.MODIFIEDBY'
          +' FROM TITEM A'
          +' LEFT JOIN TMERK B ON A.MERK_ID = B.ID'
          +' LEFT JOIN TITEMGROUP C ON A.GROUP_ID = C.ID';
end;

end.
