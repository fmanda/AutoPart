unit ufrmBrowseAccount;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus,
  cxLabel, Vcl.StdCtrls, cxButtons, cxGroupBox, Vcl.ComCtrls, cxTreeView,
  dxtree, dxdbtree, cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu,
  cxDataControllerConditionalFormattingRulesManagerDialog, cxInplaceContainer,
  cxTLData, cxDBTL, Datasnap.DBClient;

type
  TfrmBrowseAccount = class(TfrmDefault)
    cxGroupBox2: TcxGroupBox;
    btnTutup: TcxButton;
    btnExport: TcxButton;
    btnHapus: TcxButton;
    btnEdit: TcxButton;
    btnLihat: TcxButton;
    btnBaru: TcxButton;
    cxGroupBox1: TcxGroupBox;
    btnRefresh: TcxButton;
    lblTitle: TcxLabel;
    cxTreeView: TcxDBTreeList;
    procedure btnBaruClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEditClick(Sender: TObject);
    procedure btnHapusClick(Sender: TObject);
    procedure btnLihatClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
  private
    FCDS: TClientDataset;
    procedure RefreshData;
    property CDS: TClientDataset read FCDS write FCDS;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBrowseAccount: TfrmBrowseAccount;

implementation

uses
  ufrmAccount, uAppUtils, uDBUtils, uDXUtils, uAccount;

{$R *.dfm}

procedure TfrmBrowseAccount.btnBaruClick(Sender: TObject);
begin
  inherited;
  with TfrmAccount.Create(Application) do
  begin
    Try
      if ShowModal = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseAccount.btnEditClick(Sender: TObject);
begin
  inherited;
  with TfrmAccount.Create(Application) do
  begin
    LoadByID(CDS.FieldByName('id').AsInteger, False);
    Try
      if ShowModal = mrOK then
        RefreshData;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseAccount.btnHapusClick(Sender: TObject);
begin
  inherited;
  if not TAppUtils.Confirm('Anda yakin menghapus data ini?') then exit;

  with TAccount.Create do
  begin
    if LoadByID(CDS.FieldByName('id').AsInteger) then
      if DeleteFromDB then
      begin
        TAppUtils.Information('Berhasil menghapus data');
        RefreshData;
      end;
    Free;
  end;
end;

procedure TfrmBrowseAccount.btnLihatClick(Sender: TObject);
begin
  inherited;
  with TfrmAccount.Create(Application) do
  begin
    LoadByID(CDS.FieldByName('id').AsInteger, True);
    Try
      ShowModal;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmBrowseAccount.btnRefreshClick(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmBrowseAccount.btnTutupClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TfrmBrowseAccount.FormClose(Sender: TObject; var Action:
    TCloseAction);
begin
  inherited;
  lblTitle.Caption := Self.Caption;
end;

procedure TfrmBrowseAccount.FormShow(Sender: TObject);
begin
  inherited;
  RefreshData;
end;

procedure TfrmBrowseAccount.RefreshData;
begin
  if FCDS <> nil then
    FreeAndNil(FCDS);

  FCDS := TDBUtils.OpenDataset('select id, parent_id, kode + '' - '' + nama as nama from taccount', self);
  cxTreeView.LoadFromCDS(CDS,'id','parent_id', True);
  cxTreeView.SetVisibleColumns(['id','parent_id'],false);
  cxTreeView.FullExpand;
  cxTreeView.ApplyBestFit;
end;

end.
