unit ufrmDefaultInput;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus,
  Data.DB, Datasnap.DBClient, Vcl.StdCtrls, cxButtons, cxLabel, cxGroupBox;

type
  TfrmDefaultInput = class(TfrmDefault)
    cxGroupBox2: TcxGroupBox;
    btnCancel: TcxButton;
    btnPrint: TcxButton;
    btnSave: TcxButton;
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDefaultInput: TfrmDefaultInput;

implementation

{$R *.dfm}

procedure TfrmDefaultInput.btnCancelClick(Sender: TObject);
begin
  inherited;
  Self.ModalResult := mrCancel;
end;

end.
