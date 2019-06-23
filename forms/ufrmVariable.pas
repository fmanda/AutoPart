unit ufrmVariable;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxDataControllerConditionalFormattingRulesManagerDialog,
  cxVGrid, cxInplaceContainer, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons, cxGroupBox,
  cxTextEdit, cxDBExtLookupComboBox, cxButtonEdit, uVariable;

type
  TfrmVariable = class(TfrmDefaultInput)
    cxVertGrid: TcxVerticalGrid;
    cxVertGridCategoryRow1: TcxCategoryRow;
    colKodePusat: TcxEditorRow;
    colKodeCabang: TcxEditorRow;
    colAlamat1: TcxEditorRow;
    colAlamat2: TcxEditorRow;
    colTelpCabang: TcxEditorRow;
    cxVertGridCategoryRow2: TcxCategoryRow;
    colDefCustBengkel: TcxEditorRow;
    colDefCustUmum: TcxEditorRow;
    colDefRekening: TcxEditorRow;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure colDefCustUmumEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure colDefCustBengkelEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure colDefRekeningEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    procedure LoadVariable;
    procedure LookupCustomer(AEditor: TcxEditorRow);
    procedure LookupRekening(AEditor: TcxEditorRow);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVariable: TfrmVariable;

implementation

uses
  uAppUtils, uDXUtils, ufrmCXServerLookup;

{$R *.dfm}

procedure TfrmVariable.colDefCustBengkelEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  inherited;
  LookupCustomer(colDefCustBengkel);
end;

procedure TfrmVariable.colDefCustUmumEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  LookupCustomer(colDefCustUmum);
end;

procedure TfrmVariable.colDefRekeningEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  inherited;
  LookupRekening(colDefRekening);
end;

procedure TfrmVariable.FormCreate(Sender: TObject);
begin
  inherited;
//  TcxExtLookup(colDefRekening.Properties.EditProperties).LoadFromSQL(Self,
//    'select kode, nama from trekening','nama','kode');
  LoadVariable;
end;

procedure TfrmVariable.btnSaveClick(Sender: TObject);
begin
  inherited;
  AppVariable.Kode_Pusat := colKodePusat.Properties.Value;
  AppVariable.Kode_Cabang := colKodeCabang.Properties.Value;
  AppVariable.Alamat_1 := colAlamat1.Properties.Value;
  AppVariable.Alamat_2 := colAlamat2.Properties.Value;
  AppVariable.Telp := colTelpCabang.Properties.Value;
  AppVariable.Def_Cust_Umum := colDefCustUmum.Properties.Value;
  AppVariable.Def_Cust_Bengkel := colDefCustBengkel.Properties.Value;
  AppVariable.Def_Rekening := colDefRekening.Properties.Value;

  if AppVariable.UpdateVariable then
    TAppUtils.Information('Variable Berhasil Diupdate');
end;

procedure TfrmVariable.LoadVariable;
begin
  colKodePusat.Properties.Value := AppVariable.Kode_Pusat;
  colKodeCabang.Properties.Value := AppVariable.Kode_Cabang;
  colAlamat1.Properties.Value := AppVariable.Alamat_1;
  colAlamat2.Properties.Value := AppVariable.Alamat_2;
  colTelpCabang.Properties.Value := AppVariable.Telp;
  colDefCustUmum.Properties.Value := AppVariable.Def_Cust_Umum;
  colDefCustBengkel.Properties.Value := AppVariable.Def_Cust_Bengkel;
  colDefRekening.Properties.Value := AppVariable.Def_Rekening;
end;

procedure TfrmVariable.LookupCustomer(AEditor: TcxEditorRow);
var
  cxLookup: TfrmCXServerLookup;
  S: string;
begin
  S := 'select * from TCustomer';
  cxLookup := TfrmCXServerLookup.Execute(S, 'ID');
  Try
    cxLookup.PreFilter('Nama', '');
    if cxLookup.ShowModal = mrOK then
    begin
      AEditor.Properties.Value := cxLookup.FieldValue('Kode');
//      Self.Refresh;
    end;
  Finally
    cxLookup.Free;
  End;
end;

procedure TfrmVariable.LookupRekening(AEditor: TcxEditorRow);
var
  cxLookup: TfrmCXServerLookup;
  S: string;
begin
  S := 'select * from TRekening';
  cxLookup := TfrmCXServerLookup.Execute(S, 'ID');
  Try
    cxLookup.PreFilter('Nama', '');
    if cxLookup.ShowModal = mrOK then
    begin
      AEditor.Properties.Value := cxLookup.FieldValue('Kode');
    end;
  Finally
    cxLookup.Free;
  End;
end;

end.
