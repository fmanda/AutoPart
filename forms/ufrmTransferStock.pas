unit ufrmTransferStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons, cxGroupBox, Vcl.ComCtrls,
  dxCore, cxDateUtils, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxMaskEdit, cxCalendar, cxMemo, cxTextEdit, cxLabel,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxButtonEdit, cxCurrencyEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  uTransDetail, uDBUtils, uDXUtils, Datasnap.DBClient, uItem,
  ufrmCXServerLookup, cxGridDBDataDefinitions, uWarehouse, cxRadioGroup,
  CRUDObject;

type
  TfrmTransferStock = class(TfrmDefaultInput)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edRefno: TcxTextEdit;
    cxLabel6: TcxLabel;
    edNotes: TcxMemo;
    dtTransfer: TcxDateEdit;
    cxLabel8: TcxLabel;
    cxLabel7: TcxLabel;
    cxLookupWHAsal: TcxExtLookupComboBox;
    cxLookupWHTujuan: TcxExtLookupComboBox;
    cxLabel4: TcxLabel;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colKode: TcxGridDBColumn;
    colNama: TcxGridDBColumn;
    colUOM: TcxGridDBColumn;
    colQty: TcxGridDBColumn;
    colItemID: TcxGridDBColumn;
    colKonversi: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    rbTransfer: TcxRadioGroup;
    colNo: TcxGridDBColumn;
    btnLoadFromFile: TcxButton;
    opDialog: TOpenDialog;
    SaveDlg: TSaveDialog;
    btnTransfer: TcxButton;
    Label1: TLabel;
    lbWarning: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure colKodePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure btnSaveClick(Sender: TObject);
    procedure colKodePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure colNoGetDisplayText(Sender: TcxCustomGridTableItem; ARecord:
        TcxCustomGridRecord; var AText: string);
    procedure cxGrdMainEditKeyDown(Sender: TcxCustomGridTableView; AItem:
        TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word; Shift:
        TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure colUOMPropertiesCloseUp(Sender: TObject);
    procedure colUOMPropertiesEditValueChanged(Sender: TObject);
    procedure colUOMPropertiesInitPopup(Sender: TObject);
    procedure edNotesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rbTransferPropertiesEditValueChanged(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnLoadFromFileClick(Sender: TObject);
    procedure btnTransferClick(Sender: TObject);
  private
    FCDS: TClientDataset;
    FCDSUOM: TClientDataset;
    FTransfer: TTransferStock;
    function CheckStock: Boolean;
    function DC: TcxGridDBDataController;
    procedure FocusToGrid;
    function GetCDS: TClientDataset;
    function GetCDSUOM: TClientDataset;
    function GetTransfer: TTransferStock;
    procedure ImportTransferRequest;
    procedure ImportTransferIN;
    procedure InitView;
    procedure LoadByTransferRequest(lTQ: TTransferRequest);
    procedure LoadByTransferIN(lTS: TTransferStock);
    procedure LookupItem(aKey: string = '');
    procedure RenameFileImport;
    procedure SetItemToGrid(aItem: TItem);
    procedure SimpanFileTrfOut;
    procedure TranferTypeChanged;
    procedure UpdateData;
    function ValidateData: Boolean;
    property CDS: TClientDataset read GetCDS write FCDS;
    property CDSUOM: TClientDataset read GetCDSUOM write FCDSUOM;
    property Transfer: TTransferStock read GetTransfer write FTransfer;
    { Private declarations }
  public
    function GetGroupName: string; override;
    procedure LoadByID(aID: Integer; IsReadOnly: Boolean = True);
    { Public declarations }
  end;

var
  frmTransferStock: TfrmTransferStock;

implementation

uses
  cxDataUtils, uAppUtils, ufrmLookupItem, System.IOUtils, System.JSON,
  uVariable, uStockCheck, uImportLog;

{$R *.dfm}

procedure TfrmTransferStock.FormCreate(Sender: TObject);
begin
  inherited;
  InitView;
  Self.AssignKeyDownEvent;
  LoadByID(0, False);
  btnTransfer.Visible := False;
end;

procedure TfrmTransferStock.btnLoadFromFileClick(Sender: TObject);
begin
  inherited;
  if rbTransfer.ItemIndex = 1 then
    ImportTransferRequest
  else
    ImportTransferIN;
end;

procedure TfrmTransferStock.btnPrintClick(Sender: TObject);
begin
  inherited;
  TTransferStock.PrintData(Transfer.ID);
end;

procedure TfrmTransferStock.btnSaveClick(Sender: TObject);
begin
  inherited;
  if not ValidateData then exit;
  UpdateData;
  if Transfer.SaveRepeat(False) then
  begin
    if Transfer.TransferType = Transfer_External_Out then
      SimpanFileTrfOut;

    if Transfer.TransferType <> Transfer_Internal then
    begin
      if opDialog.FileName <> '' then
      begin
        RenameFileImport;
      end;
    end;

    btnPrint.Click;
//    TAppUtils.InformationBerhasilSimpan;
    Self.ModalResult := mrOK;
  end;
end;

procedure TfrmTransferStock.btnTransferClick(Sender: TObject);
begin
  inherited;
  if Transfer.TransferType = Transfer_External_Out then
   SimpanFileTrfOut;
end;

function TfrmTransferStock.CheckStock: Boolean;
var
  lCalc: TStockCheck;
  lCDS: TClientDataSet;
  lItem: TTransDetail;
  lOldTrf: TTransferStock;
  QTYPCS: Integer;
begin
  Result := AppVariable.Check_Stock <> 1;
  if Result then exit;

  if rbTransfer.ItemIndex = Transfer_External_In then
  begin
    Result := True;
    exit;
  end;

  lCalc := TStockCheck.Create(dtTransfer.Date);
  lOldTrf := TTransferStock.Create;
  Application.ProcessMessages;

  lCDS := TClientDataSet.Create(Self);
  Try
    lCDS.CloneCursor(CDS, True);
    lCDS.First;
    while not lCDS.Eof do
    begin
      QTYPCS   := lCDS.FieldByName('QTY').AsInteger * lCDS.FieldByName('Konversi').AsInteger;
      lCalc.AddCalcItem(
        lCDS.FieldByName('Item').AsInteger,
        VarToInt(cxLookupWHAsal.EditValue),
        QTYPCS
      );
      lCDS.Next;
    end;

    //apabila edit
    If Transfer.ID <> 0 then
    begin
      lOldTrf.LoadByID(Transfer.ID);
      for lItem in lOldTrf.Items do
      begin
        lCalc.AddOnHandPCS(
            lItem.Item.ID,
            lItem.Warehouse.ID,
            lItem.Qty * lItem.Konversi
          );
      end;
    end;
    Result := lCalc.CheckStockIgnore(True);
  finally
    lCDS.Free;
    lOldTrf.Free;
    lCalc.Free;
  End;
end;

procedure TfrmTransferStock.colKodePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  sKey: string;
  Edit: TcxCustomEdit;
begin
  inherited;
  Edit := Sender as TcxCustomEdit;
  sKey := VarToStr(Edit.EditingValue);
  LookupItem(sKey);
end;

procedure TfrmTransferStock.colKodePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  lItem: TItem;
begin
  inherited;
  lItem := TItem.Create;
  Try
    if lItem.LoadByCode(VarToStr(DisplayValue)) then
      SetItemToGrid(lItem)
    else
    begin
      Error := True;
      ErrorText := 'Kode Barang : ' + VarToStr(DisplayValue) + ' tidak ditemukan';
    end;
  Finally
    lItem.Free;
  End;
end;

procedure TfrmTransferStock.colNoGetDisplayText(Sender: TcxCustomGridTableItem;
    ARecord: TcxCustomGridRecord; var AText: string);
begin
  inherited;
  if ARecord = nil then exit;
  AText := VarToStr(ARecord.RecordIndex + 1);
end;

procedure TfrmTransferStock.colUOMPropertiesCloseUp(Sender: TObject);
begin
  inherited;
  with TcxExtLookup(colUOM.Properties).DataController.filter do
  begin
    BeginUpdate;
    Root.Clear;
    EndUpdate;
  end;
end;

procedure TfrmTransferStock.colUOMPropertiesEditValueChanged(Sender: TObject);
var
  lItemUOM: TItemUOM;
begin
  inherited;

  lItemUOM := TItemUOM.GetItemUOM(
    VarToInt(cxGrdMain.Controller.FocusedRecord.Values[colItemID.Index]),
    VarToInt(cxGrdMain.Controller.FocusedRecord.Values[colUOM.Index])
  );
  if lItemUOM = nil then exit;
  Try
    DC.SetEditValue(colKonversi.Index, lItemUOM.Konversi, evsValue);

    colQty.FocusWithSelection;
    cxGrdMain.Controller.EditingController.ShowEdit;
  Finally
    FreeAndNil(lItemUOM);
  End;
end;

procedure TfrmTransferStock.colUOMPropertiesInitPopup(Sender: TObject);
var
  lItem: TItem;
  lItemUOM: TItemUOM;
begin
  inherited;
  if cxGrdMain.Controller.FocusedRecord = nil then exit;
  lItem := TItem.Create;
  Try
    lItem.LoadByID(VarToInt(cxGrdMain.Controller.FocusedRecord.Values[colItemID.Index]));
    with TcxExtLookup(colUOM.Properties).DataController.filter do
    begin
      BeginUpdate;
      Root.Clear;
      Root.BoolOperatorKind := fboOr;

      for lItemUOM in lItem.ItemUOMs do
      begin
        Root.AddItem(
          TcxGridDBTableView(TcxExtLookup(colUOM.Properties).View).GetColumnByFieldName('ID'),
          foEqual, lItemUOM.UOM.ID, '');
      end;
      Active := True;
      EndUpdate;
    end;
  Finally
    lItem.Free;
  End;
end;

procedure TfrmTransferStock.cxGrdMainEditKeyDown(Sender:
    TcxCustomGridTableView; AItem: TcxCustomGridTableItem; AEdit:
    TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_F5) and (aItem = colKode) then
  begin
    LookupItem(VarToStr(AEdit.EditingValue));
  end;
end;

function TfrmTransferStock.DC: TcxGridDBDataController;
begin
  Result := cxGrdMain.DataController;
end;

procedure TfrmTransferStock.edNotesKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    FocusToGrid;
  end;
end;

procedure TfrmTransferStock.FocusToGrid;
begin
  cxGrid1.SetFocus;
  cxGrid1.FocusedView := cxGrdMain;
  if cxGrdMain.DataController.RecordCount = 0 then
  begin
    CDS.Append;
    cxGrdMain.Controller.EditingController.ShowEdit;
  end;
end;

procedure TfrmTransferStock.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_F1 then
    edRefno.SetFocus;

  if Key = VK_F2 then
  begin
    FocusToGrid;
  end;
end;

function TfrmTransferStock.GetCDS: TClientDataset;
begin
  if FCDS = nil then
  begin
    FCDS := TTransDetail.CreateDataSet(Self, False);
    FCDS.AddField('Kode',ftString);
    FCDS.AddField('Nama',ftString);
    FCDS.CreateDataSet;
  end;
  Result := FCDS;
end;

function TfrmTransferStock.GetCDSUOM: TClientDataset;
begin
  if FCDSUOM = nil then
  begin
    FCDSUOM := TDBUtils.OpenDataset('select id, uom from tuom',Self);
  end;
  Result := FCDSUOM;
end;

function TfrmTransferStock.GetGroupName: string;
begin
  Result := 'Inventory';
end;

function TfrmTransferStock.GetTransfer: TTransferStock;
begin
  if FTransfer = nil then
    FTransfer := TTransferStock.Create;
  Result := FTransfer;
end;

procedure TfrmTransferStock.ImportTransferRequest;
var
  JSON: TJSONObject;
  JSONVal: TJSONValue;
  lClass: TCRUDObjectClass;
  lTQ: TTransferRequest;
  SS: TStrings;
begin
  opDialog.DefaultExt := '*.trq';
  opDialog.Filter := 'AutoPart Transfer Request|*.trq';

  opDialog.InitialDir := TApputils.BacaRegistry('LastImportDir');
  if opDialog.InitialDir = '' then
    opDialog.InitialDir := TPath.GetDocumentsPath;

  if not opDialog.Execute then exit;

  if not TImportLog.ConfirmImport(opDialog.FileName) then exit;

  TApputils.TulisRegistry('LastImportDir', ExtractFileDir(opDialog.FileName));

  SS := TStringList.Create;
  Try
    SS.LoadFromFile(opDialog.FileName);
    JSONVal := TJSONObject.ParseJSONValue(SS.Text);
    if not(JSONVal is TJSONObject) then
      raise Exception.Create('File Import (JSON) tidak sesuai. Expected JSONObject');

    JSON      := JSONVal as TJSONObject;
    lClass    := TJSONUtils.GetClass(JSON);

    if lClass = TTransferRequest then
    begin
      lTQ := TJSONUtils.JSONToObject(JSON, lClass) as TTransferRequest;
//      TAppUtils.Information('Transfer Req ' + lTQ.Refno);
      LoadByTransferRequest(lTQ);

      if lTQ <> nil then FreeAndNil(lTQ);
    end else
      raise Exception.Create('Class Transfer Request tidak ditemukan di file yang dipilih');
  Finally
    SS.Free;
  End;

end;

procedure TfrmTransferStock.ImportTransferIN;
var
  JSON: TJSONObject;
  JSONVal: TJSONValue;
  lClass: TCRUDObjectClass;
  lTS: TTransferStock;
  SS: TStrings;
begin
  opDialog.DefaultExt := '*.trf';
  opDialog.Filter := 'AutoPart Transfer Stock File|*.trf';

  opDialog.InitialDir := TApputils.BacaRegistry('LastImportDir');
  if opDialog.InitialDir = '' then
    opDialog.InitialDir := TPath.GetDocumentsPath;

  if not opDialog.Execute then exit;
  if not TImportLog.ConfirmImport(opDialog.FileName) then exit;

  TApputils.TulisRegistry('LastImportDir', ExtractFileDir(opDialog.FileName));

  SS := TStringList.Create;
  Try
    SS.LoadFromFile(opDialog.FileName);
    JSONVal := TJSONObject.ParseJSONValue(SS.Text);
    if not(JSONVal is TJSONObject) then
      raise Exception.Create('File Import (JSON) tidak sesuai. Expected JSONObject');

    JSON      := JSONVal as TJSONObject;
    lClass    := TJSONUtils.GetClass(JSON);

    if lClass = TTransferStock then
    begin
      lTS := TJSONUtils.JSONToObject(JSON, lClass) as TTransferStock;

      if lTS.KodeCabang_Tujuan = AppVariable.Kode_Cabang then
        LoadByTransferIN(lTS)
      else
        TAppUtils.Warning('File Transfer Bukan Untuk Cabang Ini '
          +#13 +'Kode Cabang DB : ' + AppVariable.Kode_Cabang
          +#13 +'Cabang Tujuan File Transfer : ' + lTS.KodeCabang_Tujuan
        );

      if lTS <> nil then FreeAndNil(lTS);
    end else
      raise Exception.Create('Class Transfer Stock tidak ditemukan di file yang dipilih');
  Finally
    SS.Free;
  End;

end;

procedure TfrmTransferStock.InitView;
var
  s: string;
begin
  cxGrdMain.PrepareFromCDS(CDS);
  TcxExtLookup(colUOM.Properties).LoadFromCDS(CDSUOM, 'id', 'uom', ['id'], Self);

  s := 'SELECT A.ID, A.KODE, A.NAMA, B.PROJECT_NAME AS CABANG, A.IS_EXTERNAL'
      +' FROM TWAREHOUSE A'
      +' LEFT JOIN TPROJECT B ON A.PROJECT_CODE = B.PROJECT_CODE';

  cxLookupWHAsal.Properties.LoadFromSQL(Self,s,'nama');
  cxLookupWHTujuan.Properties.LoadFromSQL(Self,s,'nama');

  cxLookupWHAsal.CDS.Filtered := True;
  cxLookupWHTujuan.CDS.Filtered := True;
end;

procedure TfrmTransferStock.LoadByID(aID: Integer; IsReadOnly: Boolean = True);
var
  lItem: TTransDetail;
begin
  if FTransfer <> nil then
    FreeAndNil(FTransfer);

  Transfer.LoadByID(aID);

  //def uom
  if aID = 0 then
  begin
    Transfer.TransDate := Now();
    Transfer.RefNo := Transfer.GenerateNo;
  end;

  if (aID <> 0) and (not IsReadOnly) then
  begin
    IsReadOnly := not IsValidTransDate(Transfer.TransDate);
  end;

  edRefno.Text := Transfer.RefNo;
  dtTransfer.Date := Transfer.TransDate;
  edNotes.Text := Transfer.Notes;
  rbTransfer.ItemIndex := Transfer.TransferType;
  rbTransferPropertiesEditValueChanged(Self);

  if Transfer.WH_Asal <> nil then
    cxLookupWHAsal.EditValue := Transfer.WH_Asal.ID;
  if Transfer.WH_Tujuan <> nil then
    cxLookupWHTujuan.EditValue := Transfer.WH_Tujuan.ID;

  CDS.EmptyDataSet;


  Transfer.DeleteOutExceptExternal; //delete external

  for lItem in Transfer.Items do
  begin
    CDS.Append;

    if Transfer.TransferType = Transfer_External_Out then
      lItem.Qty := Abs(lItem.Qty);

    lItem.UpdateToDataset(CDS);
    lItem.Item.ReLoad(False);

    CDS.FieldByName('Kode').AsString := lItem.Item.Kode;
    CDS.FieldByName('Nama').AsString := lItem.Item.Nama;
    CDS.Post;
  end;
  btnSave.Enabled := not IsReadOnly;

  if IsReadOnly then
  begin
    btnTransfer.Visible := Transfer.TransferType = Transfer_External_Out;
  end;
end;

procedure TfrmTransferStock.LoadByTransferRequest(lTQ: TTransferRequest);
var
  lTQItem: TTransferRequestItem;
  S: string;
begin
  //item
  CDS.EmptyDataSet;
  for lTQItem in lTQ.Items do
  begin
    CDS.Append;
    CDS.FieldByName('Item').AsInteger     := lTQItem.Item.ID;
    CDS.FieldByName('UOM').AsInteger      := lTQItem.UOM.ID;
    CDS.FieldByName('Qty').AsFloat        := lTQItem.Qty;
    CDS.FieldByName('Konversi').AsFloat   := lTQItem.Konversi;
    lTQItem.Item.ReLoad(False);
    CDS.FieldByName('Kode').AsString      := lTQItem.Item.Kode;
    CDS.FieldByName('Nama').AsString      := lTQItem.Item.Nama;
    CDS.Post;
  end;
  edNotes.Text := 'Transfer Ke Kode Cabang : ' + lTQ.KodeCabang + ', Request No : ' + lTQ.Refno;
  S := 'select * from TWAREHOUSE where PROJECT_CODE = ' + QuotedStr(lTQ.KodeCabang);
  with TDBUtils.OpenQuery(S) do
  begin
    Try
      if not eof then
        cxLookupWHTujuan.EditValue := FieldByName('ID').AsInteger;
    Finally
      Free;
    End;
  end;
end;

procedure TfrmTransferStock.LoadByTransferIN(lTS: TTransferStock);
var
  lTSItem: TTransDetail;
  S: string;
//  S: string;
begin
  //check item first
  S := '';
  for lTSItem in lTS.Items do
  begin
    if lTSItem.Item.ID > 0 then continue;
    S := S + #13 + lTSItem.Item.Kode ;
  end;

  if S <> '' then
    raise Exception.Create('Ada Kode Item Yang tidak ditemukan di Database '
      + #13 + 'Silahkan Update Data Barang Anda, Kode yang tidak ditemukan : '
      + S
    );


  CDS.EmptyDataSet;
  for lTSItem in lTS.Items do
  begin
//    if lTSItem.Qty < 0 then continue;
    CDS.Append;
    CDS.FieldByName('Item').AsInteger     := lTSItem.Item.ID;
    CDS.FieldByName('UOM').AsInteger      := lTSItem.UOM.ID;
    CDS.FieldByName('Qty').AsFloat        := Abs(lTSItem.Qty);
    CDS.FieldByName('Konversi').AsFloat   := lTSItem.Konversi;
    lTSItem.Item.ReLoad(False);
    CDS.FieldByName('Kode').AsString      := lTSItem.Item.Kode;
    CDS.FieldByName('Nama').AsString      := lTSItem.Item.Nama;
    CDS.Post;
  end;
  edNotes.Text := 'Transfer IN dari Kode Cabang : ' + lTS.KodeCabang_Asal + ', RefNo : ' + lTS.Refno;
  S := 'select * from TWAREHOUSE where PROJECT_CODE = ' + QuotedStr(lTS.KodeCabang_Asal);
  with TDBUtils.OpenQuery(S) do
  begin
    Try
      if not eof then
        cxLookupWHAsal.EditValue := FieldByName('ID').AsInteger;
    Finally
      Free;
    End;
  end;

end;

procedure TfrmTransferStock.LookupItem(aKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  lItem: TItem;
  s: string;
begin
  lItem  := TItem.Create;
  Try
    s := 'SELECT A.ID, A.KODE, A.NAMA, C.NAMA AS MERK, B.NAMA AS ITEMGROUP'
        +' FROM TITEM A'
        +' LEFT JOIN TITEMGROUP B ON A.GROUP_ID = B.ID'
        +' LEFT JOIN TMERK C ON A.MERK_ID = C.ID';

    cxLookup := TfrmLookupItem.Execute(S,'ID');
    if aKey <> '' then
      cxLookup.PreFilter('Nama', aKey)
    else
      cxLookup.cxGrdMain.GetColumnByFieldName('NAMA').Focused := True;
    try
      if cxLookup.ShowModal = mrOK then
      begin
        lItem.LoadByID(cxLookup.FieldValue('ID'));
        SetItemToGrid(lItem);
      end;
    finally
      cxLookup.Free;
    end;
  Finally
    FreeAndNil(lItem);
  End;
end;

procedure TfrmTransferStock.rbTransferPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  TranferTypeChanged;
end;

procedure TfrmTransferStock.RenameFileImport;
begin
  Try
    TImportLog.SaveLog(opDialog.FileName);
    if not RenameFile(opDialog.FileName, ChangeFileExt(opDialog.FileName, '.imported')) then
      TAppUtils.Warning('Gagal merename File Yang Sudah diimport : ' + opDialog.FileName
        + ' menjadi ' + ChangeFileExt(opDialog.FileName, '.imported')
      );
  except
  End;
end;

procedure TfrmTransferStock.SetItemToGrid(aItem: TItem);
var
  lItemUOM: TItemUOM;
begin
  if aItem = nil then exit;

  DC.SetEditValue(colItemID.Index, aItem.ID, evsValue);
//  DC.SetEditValue(colItemObject, Integer(aItem), evsValue);
  DC.SetEditValue(colKode.Index, aItem.Kode, evsValue);
  DC.SetEditValue(colNama.Index, aItem.Nama, evsValue);
  DC.SetEditValue(colUOM.Index, 0, evsValue);
  DC.SetEditValue(colQty.Index, 0, evsValue);
  DC.SetEditValue(colKonversi.Index, 0, evsValue);

  //def uom
  if aItem.StockUOM <> nil then
  begin
    DC.SetEditValue(colUOM.Index, aItem.StockUOM.ID, evsValue);
//    colUOMPropertiesEditValueChanged(nil);
    lItemUOM := TItemUOM.GetItemUOM(
      VarToInt(cxGrdMain.Controller.FocusedRecord.Values[colItemID.Index]),
      VarToInt(cxGrdMain.Controller.FocusedRecord.Values[colUOM.Index])
    );
    if lItemUOM = nil then exit;
    Try
      DC.SetEditValue(colKonversi.Index, lItemUOM.Konversi, evsValue);
    Finally
      FreeAndNil(lItemUOM);
    End;
  end;
end;

procedure TfrmTransferStock.SimpanFileTrfOut;
var
  SS: TStringList;
begin
  SaveDlg.InitialDir := TApputils.BacaRegistry('LastExportDir');
  if SaveDlg.InitialDir = '' then
    SaveDlg.InitialDir := TPath.GetDocumentsPath;

  SaveDlg.FileName := Transfer.Refno;
  if SaveDlg.Execute then
  begin
    SS := TStringList.Create;
    Try
      SS.Text := TJSONUtils.ObjectToJSONStr(Transfer);
      SS.SaveToFile(SaveDlg.FileName);
      TAppUtils.Information('Data berhasil di export ke file : ' + SaveDLg.FileName);
      TApputils.TulisRegistry('LastExportDir', ExtractFileDir(SaveDlg.FileName));
    Finally
      SS.Free;
    End;
  end;

end;

procedure TfrmTransferStock.TranferTypeChanged;
begin
  if rbTransfer.ItemIndex = Transfer_Internal then
  begin
    cxLookupWHAsal.CDS.Filter   := 'Is_External = 0';
    cxLookupWHTujuan.CDS.Filter := 'Is_External = 0';
  end else
  if rbTransfer.ItemIndex = Transfer_External_Out then
  begin
    cxLookupWHAsal.CDS.Filter   := 'Is_External = 0';
    cxLookupWHTujuan.CDS.Filter := 'Is_External = 1';
    btnLoadFromFile.Caption     := 'Import Tranfer Request...';
  end else
  if rbTransfer.ItemIndex = Transfer_External_In then
  begin
    cxLookupWHAsal.CDS.Filter   := 'Is_External = 1';
    cxLookupWHTujuan.CDS.Filter := 'Is_External = 0';
    btnLoadFromFile.Caption     := 'Import Tranfer Stock...';
  end;

  btnLoadFromFile.Visible := rbTransfer.ItemIndex in [1,2];
  lbWarning.Visible := rbTransfer.ItemIndex = Transfer_External_In;


  cxLookupWHAsal.Clear;
  cxLookupWHTujuan.Clear
end;

procedure TfrmTransferStock.UpdateData;
var
//  lFactor: Integer;
  lItem: TTransDetail;
begin
  Transfer.RefNo := edRefno.Text;
  Transfer.TransDate := dtTransfer.Date;
  Transfer.Notes := edNotes.Text;
  Transfer.ModifiedDate := Now();
  Transfer.ModifiedBy := UserLogin;
  Transfer.TransferType := rbTransfer.ItemIndex;

  if Transfer.WH_Asal = nil then
    Transfer.WH_Asal := TWarehouse.Create;
  if Transfer.WH_Tujuan = nil then
    Transfer.WH_Tujuan := TWarehouse.Create;

  Transfer.WH_Asal.LoadByID(VarToInt(cxLookupWHAsal.EditValue));
  Transfer.WH_Tujuan.LoadByID(VarToInt(cxLookupWHTujuan.EditValue));

  Transfer.KodeCabang_Asal := AppVariable.Kode_Cabang;
  Transfer.KodeCabang_Tujuan := AppVariable.Kode_Cabang;

  if Transfer.TransferType = Transfer_External_In then
    Transfer.KodeCabang_Asal := Transfer.WH_Asal.Project_Code;

  if Transfer.TransferType = Transfer_External_Out then
    Transfer.KodeCabang_Tujuan := Transfer.WH_Tujuan.Project_Code;

//  lFactor := 1;

//  if Transfer.TransferType = Transfer_External_Out then
//    lFactor := -1;

  Transfer.Items.Clear;
  CDS.First;
  while not CDS.Eof do
  begin
    lItem := TTransDetail.Create;
    lItem.SetFromDataset(CDS);
//    lItem.Qty := lFactor * lItem.Qty;

    Transfer.Items.Add(lItem);
    CDS.Next;
  end;

end;

function TfrmTransferStock.ValidateData: Boolean;
begin
  Result := False;

  if VarToInt(cxLookupWHAsal.EditValue) = 0 then
  begin
    TAppUtils.Warning('Gudang Asal tidak boleh kosong');
    exit;
  end;

  if VarToInt(cxLookupWHTujuan.EditValue) = 0 then
  begin
    TAppUtils.Warning('Gudang Tujuan tidak boleh kosong');
    exit;
  end;

  if cxLookupWHAsal.EditValue = cxLookupWHTujuan.EditValue then
  begin
    TAppUtils.Warning('Gudang Asal tidak boleh sama dengan Tujuan');
    exit;
  end;

//  if CDS.State in [dsInsert, dsEdit] then CDS.Post;

//  if CDS.RecordCount = 0 then
  if cxGrdMain.DataController.RecordCount = 0 then
  begin
    TAppUtils.Warning('Data Item tidak boleh kosong');
    exit;
  end;

  if CDS.Locate('Item', null, []) or CDS.Locate('Item', 0, []) then
  begin
    TAppUtils.Warning('Item tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;

  if CDS.Locate('UOM', null, []) or CDS.Locate('UOM', 0, []) then
  begin
    TAppUtils.Warning('Satuan tidak boleh kosong' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;

  if CDS.Locate('Qty', 0, []) then
  begin
    TAppUtils.Warning('Qty tidak boleh 0' + #13 + 'Baris : ' +IntTostr(CDS.RecNo));
    exit;
  end;


  if not IsValidTransDate(dtTransfer.Date) then exit;
  if not CheckStock then exit;

  Result := TAppUtils.Confirm('Anda yakin data sudah sesuai?');

end;

end.
