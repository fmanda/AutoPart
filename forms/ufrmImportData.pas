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
    procedure AddLog(aStr: string);
    procedure ImportItem;
    procedure ImportUOM;
    procedure ImportMerk;
    procedure ImportGroup;
    procedure LoadFile;
    procedure LoadJSON;
    property JSONFile: TJSONArray read FJSONFile write FJSONFile;
    { Private declarations }
  protected
    procedure ImportDataUOMUnused(aJSONParam: TJSONValue = nil);
  public
    function GetGroupName: string; override;
    { Public declarations }
  end;

var
  frmImportData: TfrmImportData;

implementation

uses
  uItem, uAppUtils;

{$R *.dfm}

procedure TfrmImportData.AddLog(aStr: string);
begin
  aStr := '[' + FormatDateTime('hh:mm:ss', Now()) + '] ' + aStr;
  mmJSON.Lines.Add(aStr);
end;

procedure TfrmImportData.btnRefreshClick(Sender: TObject);
begin
  inherited;
  mmJSON.Clear;
  ImportUOM;
  ImportMerk;
  ImportGroup;
  ImportItem;


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

procedure TfrmImportData.ImportItem;
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
    pgBar.Properties.Text := 'Import Data Item : '
        + FloatToStr(pgBar.Position) + ' of ' + FloatToStr(pgBar.Properties.Max);
    Application.ProcessMessages;

    lJSONVal  := JSONFile.Items[i];
    lJSONObj  := TJSONObject.ParseJSONValue(lJSONVal.ToString) as TJSONObject;
    lClass    := TJSONUtils.GetClass(lJSONObj);

    if lClass = TItem then
    begin
      if lItem <> nil then FreeAndNil(lItem);

      lItem := TJSONUtils.JSONToObject(lJSONObj, lClass) as TItem;
      lItem.SaveToDB();
      AddLog('Item : ' + lItem.Nama + ' Updated');
    end;

    FreeAndNil(LJSONObj);
  end;
//  TAppUtils.Information('Data Berhasil Diimport');
end;

procedure TfrmImportData.ImportDataUOMUnused(aJSONParam: TJSONValue = nil);
var
  i: Integer;
  iCount: Integer;
  lClass: TCRUDObjectClass;
  lJSONObj: TJSONObject;
  lJSONVal: TJSONValue;
  lUOM: TUOM;
  UpdatePgBar: Boolean;
begin
  if aJSONParam = nil then
  begin
    aJSONParam  := JSONFile;
    UpdatePgBar := True;
  end else
    UpdatePgBar := False;

  iCount := 0;

  if (aJSONParam is TJSONArray) then
    iCount := TJSONArray(aJSONParam).Count
  else if (aJSONParam is TJSONObject) then
    iCount := TJSONObject(aJSONParam).Count;

  if UpdatePgBar then
    pgBar.Properties.Max := iCount;

  lUOM := nil;
  for i:=0 to iCount-1 do
  begin
    if UpdatePgBar then
    begin
      pgBar.Position := i+1;
      pgBar.Properties.Text := 'Import Data UOM : '
        + FloatToStr(pgBar.Position) + ' of ' + FloatToStr(pgBar.Properties.Max);
      Application.ProcessMessages;
    end;

    lJSONVal  := nil;

    if (aJSONParam is TJSONArray) then
      lJSONVal := TJSONArray(aJSONParam).Items[i]
    else if (aJSONParam is TJSONObject) then
      lJSONVal := TJSONObject(aJSONParam).Pairs[i].JsonValue;

    if lJSONVal = nil then continue;


    if lJSONVal is TJSONObject then
    begin
//      lJSONObj  := TJSONObject.ParseJSONValue(lJSONVal.ToString) as TJSONObject;
      lJSONObj  := TJSONObject(lJSONVal);
      lClass    := TJSONUtils.GetClass(lJSONObj);

      if lClass = TUOM then
      begin
        if lUOM <> nil then FreeAndNil(lUOM);
        lUOM := TJSONUtils.JSONToObject(lJSONObj, lClass) as TUOM;

        //override behaviour
        if lUOM <> nil then
        begin
          lUOM.UOM := TJSONUtils.GetValue(lJSONObj, 'ID').Value;

          AddLog('UOM Found : ' + lUOM.UOM);

          if lUOM.ID = 0 then
          begin
            lUOM.SaveToDB();
            AddLog('UOM Imported : ' + lUOM.UOM);
          end;
        end;
      end else
        ImportDataUOMUnused(lJSONVal); //search property inside it

    end else if lJSONVal is TJSONArray then
    begin
      ImportDataUOMUnused(lJSONVal); //search property inside array
    end;
  end;
//  TAppUtils.Information('Data Berhasil Diimport');
end;

procedure TfrmImportData.ImportUOM;
var
  i: Integer;
  lClass: TCRUDObjectClass;
  lUOM: TUOM;
  lJSONObj: TJSONObject;
  lJSONVal: TJSONValue;
begin
  pgBar.Properties.Max := JSONFile.Count;
  lUOM := nil;
  for i:=0 to JSONFile.Count-1 do
  begin
    pgBar.Position := i+1;
    pgBar.Properties.Text := 'Import Data UOM : '
        + FloatToStr(pgBar.Position) + ' of ' + FloatToStr(pgBar.Properties.Max);
    Application.ProcessMessages;

    lJSONVal  := JSONFile.Items[i];
    lJSONObj  := TJSONObject.ParseJSONValue(lJSONVal.ToString) as TJSONObject;
    lClass    := TJSONUtils.GetClass(lJSONObj);

    if lClass = TUOM then
    begin
      if lUOM <> nil then FreeAndNil(lUOM);

      lUOM := TJSONUtils.JSONToObject(lJSONObj, lClass) as TUOM;
      lUOM.SaveToDB();
      AddLog('UOM : ' + lUOM.UOM + ' Updated');
    end;

    FreeAndNil(LJSONObj);
  end;
//  TAppUtils.Information('Data Berhasil Diimport');
end;

procedure TfrmImportData.ImportMerk;
var
  i: Integer;
  lClass: TCRUDObjectClass;
  lMerk: TMerk;
  lJSONObj: TJSONObject;
  lJSONVal: TJSONValue;
begin
  pgBar.Properties.Max := JSONFile.Count;
  lMerk := nil;
  for i:=0 to JSONFile.Count-1 do
  begin
    pgBar.Position := i+1;
    pgBar.Properties.Text := 'Import Data Merk : '
        + FloatToStr(pgBar.Position) + ' of ' + FloatToStr(pgBar.Properties.Max);
    Application.ProcessMessages;

    lJSONVal  := JSONFile.Items[i];
    lJSONObj  := TJSONObject.ParseJSONValue(lJSONVal.ToString) as TJSONObject;
    lClass    := TJSONUtils.GetClass(lJSONObj);

    if lClass = TMerk then
    begin
      if lMerk <> nil then FreeAndNil(lMerk);

      lMerk := TJSONUtils.JSONToObject(lJSONObj, lClass) as TMerk;
      lMerk.SaveToDB();
      AddLog('Merk : ' + lMerk.Nama + ' Updated');
    end;

    FreeAndNil(LJSONObj);
  end;
//  TAppUtils.Information('Data Berhasil Diimport');
end;

procedure TfrmImportData.ImportGroup;
var
  i: Integer;
  lClass: TCRUDObjectClass;
  lGroup: TItemGroup;
  lJSONObj: TJSONObject;
  lJSONVal: TJSONValue;
begin
  pgBar.Properties.Max := JSONFile.Count;
  lGroup := nil;
  for i:=0 to JSONFile.Count-1 do
  begin
    pgBar.Position := i+1;
    pgBar.Properties.Text := 'Import Data Group Item : '
        + FloatToStr(pgBar.Position) + ' of ' + FloatToStr(pgBar.Properties.Max);
    Application.ProcessMessages;

    lJSONVal  := JSONFile.Items[i];
    lJSONObj  := TJSONObject.ParseJSONValue(lJSONVal.ToString) as TJSONObject;
    lClass    := TJSONUtils.GetClass(lJSONObj);

    if lClass = TItemGroup then
    begin
      if lGroup <> nil then FreeAndNil(lGroup);

      lGroup := TJSONUtils.JSONToObject(lJSONObj, lClass) as TItemGroup;
      lGroup.SaveToDB();
      AddLog('Group : ' + lGroup.Nama + ' Updated');
    end;

    FreeAndNil(LJSONObj);
  end;
//  TAppUtils.Information('Data Berhasil Diimport');
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
