unit ufrmTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, dxServerModeData,
  dxServerModeFireDACDataSource, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridServerModeTableView, cxClasses, cxGridLevel, cxGrid,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, Data.DB, cxDBData, cxGridBandedTableView,
  cxGridServerModeBandedTableView, cxGridDBTableView;

type
  TfrmTest = class(TfrmDefaultInput)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1ServerModeTableView1: TcxGridServerModeTableView;
    dxServerModeFireDACQueryDataSource1: TdxServerModeFireDACQueryDataSource;
    cxGridViewRepository1: TcxGridViewRepository;
    cxGridViewRepository1ServerModeTableView1: TcxGridServerModeTableView;
    cxGridViewRepository1TableView1: TcxGridTableView;
    cxGridViewRepository1DBTableView1: TcxGridDBTableView;
    cxGridViewRepository1ServerModeBandedTableView1: TcxGridServerModeBandedTableView;
    procedure btnSaveClick(Sender: TObject);
    procedure cxGrid1ServerModeTableView1CellDblClick(Sender:
        TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
        AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTest: TfrmTest;

implementation

{$R *.dfm}

uses uDBUtils, uDXUtils;

procedure TfrmTest.btnSaveClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  cxGrid1ServerModeTableView1.LoadFromSQL('select * from tblstok','KdBar');
  cxGrid1ServerModeTableView1.EnableFiltering;


//  cxExtLookupComboBox1.Properties.LoadServerMode('select KdBar, NamaBarang from tblstok','KdBar','NamaBarang',[], Self);

//  dxServerModeFireDACQueryDataSource1.Connection := FDConnection;
//  dxServerModeFireDACQueryDataSource1.SQLAdapterClassName := 'TdxServerModeMSSQLAdapter';
//  dxServerModeFireDACQueryDataSource1.SQL.Text :='select * from TblStok';
//  dxServerModeFireDACQueryDataSource1.KeyFieldNames := 'KdBar';
//  dxServerModeFireDACQueryDataSource1.Open;
//
//  cxGrid1ServerModeTableView1.DataController.DataSource := dxServerModeFireDACQueryDataSource1;
//  cxGrid1ServerModeTableView1.DataController.CreateAllItems(True);


end;

procedure TfrmTest.cxGrid1ServerModeTableView1CellDblClick(Sender:
    TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
    AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  showmessage(
    VarToStr(cxGrid1ServerModeTableView1.Controller.SelectedRecords[0].Values[1])
  );
end;

end.
