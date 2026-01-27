unit ufrmDownloadDataCabang;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxSpinEdit, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxStyles, cxClasses, Vcl.StdCtrls, Vcl.ExtCtrls, cxButtons, cxGroupBox,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Datasnap.DBClient;

type
  TfrmDownloadDataCabang = class(TfrmDefaultInput)
    cxGroupBox1: TcxGroupBox;
    cbMonth: TcxComboBox;
    spYear: TcxSpinEdit;
    cxLabel3: TcxLabel;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    FCDS: TClientDataset;
    procedure DownloadJournal;
    property CDS: TClientDataset read FCDS write FCDS;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDownloadDataCabang: TfrmDownloadDataCabang;

implementation

uses
  System.DateUtils, uDXUtils, uAppUtils, uVariable, uDBUtils;

{$R *.dfm}

procedure TfrmDownloadDataCabang.FormCreate(Sender: TObject);
begin
  inherited;
  cbMonth.ItemIndex := MonthOf(Now())-1;
  spYear.Value      := YearOf(Now());

end;

procedure TfrmDownloadDataCabang.btnSaveClick(Sender: TObject);
begin
  inherited;
  DownloadJournal;
end;

procedure TfrmDownloadDataCabang.DownloadJournal;
var
  S: string;
begin
  S := 'exec SP_DownloadJournal ' + IntToStr(spYear.Value)
      + ',' + IntToStr(cbMonth.ItemIndex+1);
  if TDBUtils.ExecuteSQL(S) then
    TAppUtils.Information('Berhasil Download Data Journal');

  S := 'select A.* '
      +' from TJOURNALPERIOD a'
      +' left join V_CURRENTPROJECT b on a.PROJECT_CODE = b.PROJECT_CODE'
      +' where b.PROJECT_CODE is null'
      +' and a.MONTHPERIOD =  ' + IntToStr(cbMonth.ItemIndex+1)
      +' and a.YEARPERIOD = ' + IntToStr(spYear.Value);

  if FCDS <> nil then
    FreeAndNil(FCDS);

  FCDS := TDBUtils.OpenDataset(S);
  cxGrdMain.LoadFromCDS(CDS);

end;

end.
