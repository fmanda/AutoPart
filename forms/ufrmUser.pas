unit ufrmUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons,
  cxGroupBox, cxTextEdit, cxLabel, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxButtonEdit, cxDBExtLookupComboBox, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxGrid, uUser, Datasnap.DBClient, cxCheckBox, uAppUtils;

type
  TfrmUser = class(TfrmDefaultInput)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edUser: TcxTextEdit;
    cxLabel2: TcxLabel;
    edNama: TcxTextEdit;
    edPassw1: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colGroup: TcxGridDBColumn;
    colNama: TcxGridDBColumn;
    colKode: TcxGridDBColumn;
    colDoAccess: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    edPassw2: TcxTextEdit;
    cxLabel4: TcxLabel;
    ckSupervisor: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    FCDS: TClientDataset;
    FUser: TUser;
    function GetCDS: TClientDataset;
    function GetUser: TUser;
    procedure LoadAllTask;
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    property User: TUser read GetUser write FUser;
    { Private declarations }
  public
    function GetGroupName: string; override;
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = True);
    { Public declarations }
  end;

var
  frmUser: TfrmUser;

implementation

uses
  uDXUtils, uDBUtils;

{$R *.dfm}

procedure TfrmUser.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if User.SaveToDB then
  begin
    TAppUtils.Information('Berhasil Update Data User');
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmUser.FormCreate(Sender: TObject);
begin
  inherited;
  Self.AssignKeyDownEvent;
  cxGrdMain.PrepareFromCDS(CDS);
  LoadAllTask;
  cxGrdMain.EnableFiltering;
end;

function TfrmUser.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TUserTask.CreateDataSet(Self, False);
    FCDS.AddField('GroupName',ftString);
    FCDS.AddField('TaskName',ftString);
    FCDS.AddField('TaskCode',ftString);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmUser.GetGroupName: string;
begin
  Result := 'Aplikasi';
end;

function TfrmUser.GetUser: TUser;
begin
  if FUser = nil then
    FUser := TUser.Create;

  Result := FUser;
end;

procedure TfrmUser.LoadAllTask;
var
  S: string;
begin
  S := 'SELECT * FROM TTASK';
  CDS.EmptyDataSet;
  CDS.DisableControls;
  Try
    with TDBUtils.OpenQuery(S) do
    begin
      Try
        while not eof do
        begin
          CDS.Append;
          CDS.FieldByName('Task').AsInteger := FieldByName('ID').AsInteger;
          CDS.FieldByName('GroupName').AsString := FieldByName('GroupName').AsString;
          CDS.FieldByName('TaskCode').AsString := FieldByName('TaskCode').AsString;
          CDS.FieldByName('TaskName').AsString := FieldByName('TaskName').AsString;
          CDS.FieldByName('DoAccess').AsInteger := 0;
          CDS.Post;
          next;
        end;
      Finally
        Free;
      End;
    end;
  Finally
    CDS.EnableControls;
  End;
  cxGrdMain.DataController.Groups.FullExpand;
end;

procedure TfrmUser.LoadByID(aID: Integer; IsReadOnly: Boolean = True);
var
  lTask: TUserTask;
begin
  if FUser <> nil then
    FreeAndNil(FUser);

  User.LoadByID(aID);

  edNama.Text := User.Nama;
  edUser.Text := User.UserName;
  edPassw1.Text := User.Password;
  edPassw2.Text := User.Password;
  ckSupervisor.Checked := User.IsSupervisor = 1;

  CDS.DisableControls;
  Try
    for lTask in User.Tasks do
    begin
      if lTask.Task = nil then continue;

      if CDS.Locate('Task',lTask.Task.ID,[]) then
      begin
        CDS.Edit;
        lTask.UpdateToDataset(CDS);
        CDS.Post;
      end;

    end;
  Finally
    CDS.EnableControls;
  End;

  btnSave.Enabled := not IsReadOnly;
end;

procedure TfrmUser.UpdateData;
var
  lTask: TUserTask;
begin
  User.UserName := edUser.Text;
  User.Nama     := edNama.Text;
  User.Password := edPassw1.Text;
  User.Tasks.Clear;
  User.IsSupervisor := TAppUtils.BoolToInt(ckSupervisor.Checked);

  CDS.DisableControls;
  Try
    CDS.First;
    while not CDS.Eof do
    begin
      if CDS.FieldByName('DoAccess').AsInteger = 1 then
      begin
        lTask := TUserTask.Create;
        lTask.SetFromDataset(CDS);

        User.Tasks.Add(lTask);
      end;
      CDS.Next;
    end;
  Finally
    CDS.EnableControls;
  End;
end;

function TfrmUser.ValidateData: Boolean;
begin
  Result := False;

  if edUser.Text = '' then
  begin
    TAppUtils.Warning('User wajib diisi');
    exit;
  end;

  if edPassw1.Text <> edPassw2.Text then
  begin
    TAppUtils.Warning('Password tidak sama');
    exit;
  end;

  if not Result then
    Result := True;
end;

end.
