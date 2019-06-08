unit ufrmDefaultReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmDefault, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls,
  dxCore, cxDateUtils, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxLabel, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxGroupBox;

type
  TfrmDefaultReport = class(TfrmDefault)
    cxGroupBox1: TcxGroupBox;
    lblTitle: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    btnTutup: TcxButton;
    btnExport: TcxButton;
    btnPrint: TcxButton;
    btnRefresh: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure btnTutupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDefaultReport: TfrmDefaultReport;

implementation

{$R *.dfm}

procedure TfrmDefaultReport.btnTutupClick(Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TfrmDefaultReport.FormCreate(Sender: TObject);
begin
  inherited;
  lblTitle.Caption := Self.Caption;
end;

end.
