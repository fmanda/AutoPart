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
    FTasks: TObjectList<TUserTask>;
    function GetTasks: TObjectList<TUserTask>;
  public
    destructor Destroy; override;
    property Tasks: TObjectList<TUserTask> read GetTasks write FTasks;
  published
    property UserName: String read FUserName write FUserName;
    property Nama: String read FNama write FNama;
    property Password: String read FPassword write FPassword;
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

implementation

uses
  System.SysUtils;

destructor TUser.Destroy;
begin
  inherited;
  if FTasks <> nil then
    FreeAndNil(FTasks);
end;

function TUser.GetTasks: TObjectList<TUserTask>;
begin
  if FTasks = nil then
    FTasks := TObjectList<TUserTask>.Create();
  Result := FTasks;
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
    if lTask.LoadByCode(aTaskCode) then exit;
    lTask.TaskCode  := aTaskCode;
    lTask.TaskName  := aTaskName;
    lTask.SaveToDB(True);
  Finally
    lTask.Free;
  End;
end;

end.
