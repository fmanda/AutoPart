unit ufrmItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultInput, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGroupBox, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxGridLevel,
  cxGrid, cxMemo, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxTextEdit, cxLabel, cxCurrencyEdit, dxBarBuiltInMenu,
  cxPC, Vcl.ComCtrls, dxCore, cxDateUtils, cxCalendar;

type
  TfrmItem = class(TfrmDefaultInput)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    edKode: TcxTextEdit;
    cxLabel2: TcxLabel;
    edNama: TcxTextEdit;
    cxExtLookupComboBox1: TcxExtLookupComboBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxExtLookupComboBox2: TcxExtLookupComboBox;
    cxLabel5: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxMemo1: TcxMemo;
    cxCurrencyEdit1: TcxCurrencyEdit;
    cxLabel7: TcxLabel;
    btnAdd: TcxButton;
    btnDel: TcxButton;
    cxPageControl1: TcxPageControl;
    tsUOM: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    colSatuan: TcxGridDBBandedColumn;
    colKonversi: TcxGridDBBandedColumn;
    colHrgBeli: TcxGridDBBandedColumn;
    colMargin1: TcxGridDBBandedColumn;
    colHrgJual1: TcxGridDBBandedColumn;
    colMargin2: TcxGridDBBandedColumn;
    clHrgJual2: TcxGridDBBandedColumn;
    colMargin3: TcxGridDBBandedColumn;
    colHrgJual3: TcxGridDBBandedColumn;
    colMargin4: TcxGridDBBandedColumn;
    colHrgJual4: TcxGridDBBandedColumn;
    cxGrid1Level1: TcxGridLevel;
    tsHistory: TcxTabSheet;
    cxLabel8: TcxLabel;
    cxTextEdit2: TcxTextEdit;
    cxLabel9: TcxLabel;
    cxDateEdit1: TcxDateEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmItem: TfrmItem;

implementation

{$R *.dfm}

end.
