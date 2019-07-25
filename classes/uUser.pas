unit uUser;

interface

uses
  CRUDObject, System.Generics.Collections, Vcl.Forms;

type
  TTask = class;
  TUserTask = class;

  TUser = class(TCRUDObject)
  private
    FUserName: String;
    FNama: String;
    FPassword: String;
    FSuperUser: Integer;
    FTasks: TObjectList<TUserTask>;
    function GetTasks: TObjectList<TUserTask>;
  public
    destructor Destroy; override;
    procedure Clear;
    function HasAccess(aTaskCode: string): Boolean;
    procedure ReloadAll;
    property Tasks: TObjectList<TUserTask> read GetTasks write FTasks;
  published
    [AttributeOfCode]
    property UserName: String read FUserName write FUserName;
    property Nama: String read FNama write FNama;
    property Password: String read FPassword write FPassword;
    property SuperUser: Integer read FSuperUser write FSuperUser;
  end;

  TTask = class(TCRUDObject)
  private
    FTaskName: String;
    FTaskCode: String;
    FGroupName: String;
  public
    class procedure RegisterTask(aTaskCode, aTaskName, aGroupName: String);
  published
    property TaskName: String read FTaskName write FTaskName;
    [AttributeOfCode]
    property TaskCode: String read FTaskCode write FTaskCode;
    property GroupName: String read FGroupName write FGroupName;
  end;


  TUserTask = class(TCRUDObject)
  private
    FDoAccess: Integer;
    FDoCreate: Integer;
    FDoDelete: Integer;
    FDoEdit: Integer;
    FUser: TUser;
    FTask: TTask;
  public
    destructor Destroy; override;
  published
    property DoAccess: Integer read FDoAccess write FDoAccess;
    property DoCreate: Integer read FDoCreate write FDoCreate;
    property DoDelete: Integer read FDoDelete write FDoDelete;
    property DoEdit: Integer read FDoEdit write FDoEdit;
    [AttributeOfHeader]
    property User: TUser read FUser write FUser;
    property Task: TTask read FTask write FTask;
  end;


var
  User : TUser;

implementation

uses
  System.SysUtils;

destructor TUser.Destroy;
begin
  inherited;
  if FTasks <> nil then
    FreeAndNil(FTasks);
end;

procedure TUser.Clear;
begin
  ID := 0;
  Nama := '';
  Password := '';
  SuperUser := 0;
  Tasks.Clear;
end;

function TUser.GetTasks: TObjectList<TUserTask>;
begin
  if FTasks = nil then
    FTasks := TObjectList<TUserTask>.Create();
  Result := FTasks;
end;

function TUser.HasAccess(aTaskCode: string): Boolean;
var
  lTask: TUserTask;
begin
  Result := False;
  for lTask in Self.Tasks do
  begin
    if lTask.Task <> nil then
    begin
      if UpperCase(lTask.Task.TaskCode) = (aTaskCode) then
      begin
        if lTask.DoAccess = 1 then
        begin
          Result := True;
          exit;
        end;
      end;
    end;
  end;
end;

procedure TUser.ReloadAll;
var
  lTask: TUserTask;
begin
  for lTask in Self.Tasks do
  begin
    if lTask.Task <> nil then
      lTask.Reload;
  end;
end;

destructor TUserTask.Destroy;
begin
  inherited;
  if FTask <> nil then
    FreeAndNil(FTask);
end;

class procedure TTask.RegisterTask(aTaskCode, aTaskName, aGroupName: String);
var
  lTask: TTask;
begin
  lTask := TTask.Create();
  Try
    if lTask.LoadByCode(aTaskCode) then  //exit;
    begin
      if (lTask.TaskCode = aTaskCode)
        and (lTask.TaskName = aTaskName)
        and (lTask.GroupName = aGroupName)
      then
        exit;
    end;

    lTask.TaskCode  := aTaskCode;
    lTask.TaskName  := aTaskName;
    lTask.GroupName := aGroupName;
    lTask.SaveToDB(True);
  Finally
    lTask.Free;
  End;
end;

end.
