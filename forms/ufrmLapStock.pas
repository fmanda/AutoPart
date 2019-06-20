unit ufrmLapStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, cxStyles, cxClasses, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxButtonEdit, cxCheckBox, cxDropDownEdit,
  cxCalendar, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
  cxTextEdit, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid;

type
  TfrmLapStock = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    edNama: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLookupGudang: TcxExtLookupComboBox;
    dtStock: TcxDateEdit;
    chkAll: TcxCheckBox;
    edKode: TcxButtonEdit;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    cxGrid1: TcxGrid;
    cxGrdMain: TcxGridDBTableView;
    colKode: TcxGridDBColumn;
    colNotes: TcxGridDBColumn;
    colQty: TcxGridDBColumn;
    colUOM: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    colHrgAvg: TcxGridDBColumn;
    colValue: TcxGridDBColumn;
    colGroup: TcxGridDBColumn;
    colMerk: TcxGridDBColumn;
    cxCheckBox3: TcxCheckBox;
    cxCheckBox4: TcxCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLapStock: TfrmLapStock;

implementation

{$R *.dfm}

end.
