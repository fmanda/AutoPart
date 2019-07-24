unit ufrmDefault;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TfrmDefault = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    function IsRegistered: Boolean; dynamic;
    function GetFormName: string; dynamic;
    function GetFormCaption: string; dynamic;
    function GetGroupName: string; dynamic;
    { Public declarations }
  end;

var
  frmDefault: TfrmDefault;

implementation

uses
  uDBUtils, System.DateUtils, uAppUtils, uUser;

{$R *.dfm}

procedure TfrmDefault.FormCreate(Sender: TObject);
begin
  Try
    if FDConnection = nil then exit;
    if not FDConnection.Connected then exit;
    if not IsRegistered then exit;

    TTask.RegisterTask(
      Self.GetFormName,
      Self.GetFormCaption,
      Self.GetGroupName
    );

  except
  End;
end;

procedure TfrmDefault.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TfrmDefault.IsRegistered: Boolean;
begin
  Result := True;
end;

function TfrmDefault.GetFormName: string;
begin
  Result := Self.Name;
end;

function TfrmDefault.GetFormCaption: string;
begin
  Result := Self.Caption;
end;

function TfrmDefault.GetGroupName: string;
begin
  Result := 'UNGROUP'; //override this
end;

end.
