unit ufrmHutangZakat;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons,
  cxGroupBox, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit,
  cxCalendar, cxMemo, cxButtonEdit, cxCurrencyEdit, cxSpinEdit, cxMaskEdit,
  cxLabel, cxTextEdit, uTransDetail, uDBUtils, uSupplier, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Datasnap.DBClient;

type
  TfrmHutangZakat = class(TfrmDefaultInput)
    RstRequest: TRESTRequest;
    RstClient: TRESTClient;
    RstResponse: TRESTResponse;
    cxGroupBox1: TcxGroupBox;
    edURL: TcxTextEdit;
    cxLabel1: TcxLabel;
    cbBulan: TcxComboBox;
    cxLabel2: TcxLabel;
    spTahun: TcxSpinEdit;
    cxLabel3: TcxLabel;
    btnCalc: TcxButton;
    crNetProfit: TcxCurrencyEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    crCalc: TcxCurrencyEdit;
    cbBulan2: TcxComboBox;
    cxLabel11: TcxLabel;
    spTahun2: TcxSpinEdit;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    crUangMuka: TcxCurrencyEdit;
    cxLabel6: TcxLabel;
    edSupplier: TcxButtonEdit;
    edNotes: TcxMemo;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    edNoInv: TcxTextEdit;
    cxLabel9: TcxLabel;
    dtInvoice: TcxDateEdit;
    cxLabel10: TcxLabel;
    crValue: TcxCurrencyEdit;
    cxGrid: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    lvl: TcxGridLevel;
    cxMemo2: TcxMemo;
    cxLabel14: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnCalcClick(Sender: TObject);
    procedure edSupplierKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
    procedure edSupplierPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    FCDSDP: TClientDataset;
    FPurchInv: TPurchaseInvoice;
    function GetPurchInv: TPurchaseInvoice;
    procedure LookupSupplier(sKey: string = '');
    procedure UpdateData;
    property PurchInv: TPurchaseInvoice read GetPurchInv write FPurchInv;
    { Private declarations }
  public
    { Public declarations }
  published
    property CDSDP: TClientDataset read FCDSDP write FCDSDP;
  end;

var
  frmHutangZakat: TfrmHutangZakat;

implementation

uses
  System.JSON, StrUtils, DateUtils, uAppUtils, ufrmCXServerLookup, uDXUtils;

{$R *.dfm}

procedure TfrmHutangZakat.FormCreate(Sender: TObject);
begin
  inherited;
  spTahun.Value := YearOf(Now());
  spTahun2.Value := YearOf(Now());
  dtInvoice.Date := Now();
end;

procedure TfrmHutangZakat.btnCalcClick(Sender: TObject);
var
  jArr: TJSONArray;
  jObj: TJSONObject;
  jValue: TJSONValue;
  S: String;
begin
  inherited;
  edNoInv.Text := 'ZKT.' + IntToStr(spTahun.Value) + RightStr('0' + IntToStr(cbBulan.ItemIndex + 1), 2);
  edNotes.Text := 'Hutang Zakat ' + cbBulan.Text + ' ' + IntToStr(spTahun.Value) + ' s/d ' +  cbBulan2.Text + ' ' + IntToStr(spTahun2.Value) ;
  Try
    RstClient.BaseURL := edURL.Text;
    if RightStr(RstClient.BaseURL, 1) <> '/' then
      RstClient.BaseURL := RstClient.BaseURL + '/';

    RstClient.BaseURL := RstClient.BaseURL + 'netprofit/';
    RstClient.BaseURL := RstClient.BaseURL + IntToStr(spTahun.Value) +  '.' + RightStr('0'+ IntToStr(cbBulan.ItemIndex+1),2) + '/';
    RstClient.BaseURL := RstClient.BaseURL + IntToStr(spTahun2.Value) + '.' + RightStr('0'+ IntToStr(cbBulan2.ItemIndex+1),2) ;

    RstRequest.Execute;
    jArr    := TJSONArray(RstResponse.JSONValue);
    jValue  := jArr.Items[0];
    jObj    := TJSONObject.ParseJSONValue(jValue.ToString) as TJSONObject;

  //  dVal    := TryStrToInt(lPair.JsonValue.Value, lIntVal);
    crNetProfit.Value := StrToFloat(jObj.GetValue('netprofit').Value);
    crCalc.Value      := 0.025 * crNetProfit.Value;

    S := 'select REFNO, TRANSDATE, AMOUNT, B.NAMA AS REKENING, A.NOTES, A.TAHUNZAKAT, A.MODIFIEDBY'
        +' from TCASHPAYMENT a left join TREKENING b on a.REKENING_ID = b.id'
        +' where tahunzakat = ' + IntToStr(spTahun.Value);

    if FCDSDP <> nil then FreeAndNil(FCDSDP);
    FCDSDP := TDBUtils.OpenDataset(S, Self);

    crUangMuka.Value := 0;
    CDSDP.First;
    while not CDSDP.Eof do
    begin
      crUangMuka.Value := crUangMuka.Value + CDSDP.FieldByName('Amount').AsFloat;
      CDSDP.Next;
    end;
    cxGrdMain.LoadFromCDS(CDSDP);

    crValue.Value := crCalc.Value - crUangMuka.Value;
  except
    on E:Exception do
    begin
      TAppUtils.Warning('Error Getting Data from server' + #13 + E.Message);
    end;
  End;
end;

procedure TfrmHutangZakat.btnSaveClick(Sender: TObject);
begin
  inherited;
  if edNoInv.Text = '' then
  begin
    TAppUtils.Warning('Nomor bukti kosong, pastikan sudah melakukan proses Hitung Data');
    exit;
  end;
  if not IsValidTransDate(dtInvoice.Date) then exit;
  if not TAppUtils.Confirm('Anda yakin data sudah sesuai ?') then exit;
  UpdateData;
  if PurchInv.SaveToDB(True) then
  begin
    TAppUtils.Information('Hutang Zakat berhasil disimpan');
    exit;
  end;
end;

procedure TfrmHutangZakat.edSupplierKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
var
  Edit: TcxCustomEdit;
  sKey: string;
begin
  inherited;
  if Key = VK_F5 then
  begin
    Edit := Sender as TcxCustomEdit;
    sKey := VarToStr(Edit.EditingValue);
    LookupSupplier(sKey);
  end else if Key = VK_RETURN then
  begin
    SelectNext(Screen.ActiveControl, True, True);
  end;
end;

procedure TfrmHutangZakat.edSupplierPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  LookupSupplier('');
end;

function TfrmHutangZakat.GetPurchInv: TPurchaseInvoice;
begin
  if FPurchInv = nil then
    FPurchInv := TPurchaseInvoice.Create;
  Result := FPurchInv;
end;

procedure TfrmHutangZakat.LookupSupplier(sKey: string = '');
var
  cxLookup: TfrmCXServerLookup;
  S: string;
begin
  S := 'select * from TSUPPLIER';
  cxLookup := TfrmCXServerLookup.Execute(S, 'ID');
  Try
    cxLookup.PreFilter('Nama', sKey);
    if cxLookup.ShowModal = mrOK then
    begin
      if PurchInv.Supplier = nil then
        PurchInv.Supplier := TSupplier.Create;
      PurchInv.Supplier.LoadByID(cxLookup.FieldValue('id'));
      edSupplier.Text := PurchInv.Supplier.Nama;
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmHutangZakat.UpdateData;
begin
  PurchInv.InvoiceNo := edNoInv.Text;
  PurchInv.TransDate := dtInvoice.Date;
  PurchInv.DueDate  := dtInvoice.Date;
  PurchInv.Notes := edNotes.Text;
  PurchInv.PaymentFlag := 1;
  PurchInv.SubTotal := crValue.Value;
  PurchInv.PPN := 0;
  PurchInv.Amount := crValue.Value;
  PurchInv.ModifiedDate := Now();
  PurchInv.ModifiedBy := UserLogin;
  PurchInv.Referensi  := '';
  PurchInv.Items.Clear;
end;

end.
