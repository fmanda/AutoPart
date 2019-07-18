unit ufrmSuggestionOrder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefaultReport, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Vcl.ComCtrls, dxCore, cxDateUtils, cxGroupBox, cxRadioGroup,
  cxCheckBox, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxStyles,
  cxClasses, Vcl.StdCtrls, cxButtons, cxLabel;

type
  TfrmSuggestionOrder = class(TfrmDefaultReport)
    cxGroupBox3: TcxGroupBox;
    cxLabel3: TcxLabel;
    dtStock: TcxDateEdit;
    ckGrupMerk: TcxCheckBox;
    rbJenis: TcxRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSuggestionOrder: TfrmSuggestionOrder;

implementation

{$R *.dfm}

end.
