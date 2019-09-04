unit ufrmImportData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus,
  cxProgressBar, Vcl.StdCtrls, cxButtons, cxLabel, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxGroupBox, dxBarBuiltInMenu, cxMemo, cxPC, System.JSON,
  REST.Json, CRUDObject;

type
  TfrmImportData = class(TfrmDefault)
    cxGroupBox3: TcxGroupBox;
    edFile: TcxButtonEdit;
    cxLabel1: TcxLabel;
    btnRefresh: TcxButton;
    pgBar: TcxProgressBar;
    cxPageControl1: TcxPageControl;
    tsPriceQuotation: TcxTabSheet;
    tsJSON: TcxTabSheet;
    mmJSON: TcxMemo;
    opDialog: TOpenDialog;
    procedure edFileKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edFilePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnRefreshClick(Sender: TObject);
  private
    FJSONFile: TJSONArray;
    procedure ImportData;
    procedure LoadFile;
    procedure LoadJSON;
    property JSONFile: TJSONArray read FJSONFile write FJSONFile;
    { Private declarations }
  public
    function GetGroupName: string; override;
    { Public declarations }
  end;

var
  frmImportData: TfrmImportData;

implementation

uses
  uItem;

{$R *.dfm}

procedure TfrmImportData.btnRefreshClick(Sender: TObject);
begin
  inherited;
  ImportData;
end;

procedure TfrmImportData.edFileKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    LoadJSON;
end;

procedure TfrmImportData.edFilePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  LoadFile;
end;

function TfrmImportData.GetGroupName: string;
begin
  Result := 'Utilities'; //override this
end;

procedure TfrmImportData.ImportData;
var
  i: Integer;
  lClass: TCRUDObjectClass;
  lItem: TItem;
  lJSONObj: TJSONObject;
  lJSONVal: TJSONValue;
begin
  pgBar.Properties.Max := JSONFile.Count;
  lItem := nil;
  for i:=0 to JSONFile.Count-1 do
  begin
    pgBar.Position := i+1;
    lJSONVal  := JSONFile.Items[i];
    lJSONObj  := TJSONObject.ParseJSONValue(lJSONVal.ToString) as TJSONObject;
    lClass    := TJSONUtils.GetClass(lJSONObj);

    if lClass = TItem then
    begin
      if lItem <> nil then FreeAndNil(lItem);

      lItem := TJSONUtils.JSONToObject(lJSONObj, lClass) as TItem;
      lItem.SaveToDB();
    end;

    FreeAndNil(LJSONObj);
  end;
end;

procedure TfrmImportData.LoadFile;
begin
  if opDialog.Execute then
    edFile.Text := opDialog.FileName;

  LoadJSON;
end;

procedure TfrmImportData.LoadJSON;
var
  SS: TStrings;
begin
//  mmJSON.Lines.LoadFromFile(edFile.Text);
  SS := TStringList.Create;
  Try
    SS.LoadFromFile(edFile.Text);
    if FJSONFile <> nil then
      FreeAndNil(FJSONFile);

    JSONFile := TJSONObject.ParseJSONValue(SS.Text) as TJSONArray;
    mmJSON.Lines.Text := TJson.Format(JSONFile);
  Finally
    SS.Free;
  End;

end;

end.
