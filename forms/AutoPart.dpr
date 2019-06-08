program AutoPart;

uses
  Vcl.Forms,
  ufrmMain in 'ufrmMain.pas' {frmMain},
  CRUDObject in '..\lib\CRUDObject.pas',
  uAppUtils in '..\lib\uAppUtils.pas',
  uDBUtils in '..\lib\uDBUtils.pas',
  uDMReport in '..\lib\uDMReport.pas' {DMReport},
  uDXUtils in '..\lib\uDXUtils.pas',
  ufrmCXLookup in '..\lib\ufrmCXLookup.pas' {frmCXLookup},
  ufrmCXMsgInfo in '..\lib\ufrmCXMsgInfo.pas' {frmCXMsgInfo},
  ufrmLogin in 'ufrmLogin.pas',
  ufrmSetKoneksi in 'ufrmSetKoneksi.pas',
  ufrmDefault in 'ufrmDefault.pas' {frmDefault},
  ufrmDefaultBrowse in 'ufrmDefaultBrowse.pas' {frmDefaultBrowse},
  ufrmDefaultInput in 'ufrmDefaultInput.pas' {frmDefaultInput},
  ufrmDefaultReport in 'ufrmDefaultReport.pas' {frmDefaultReport},
  ufrmTest in 'ufrmTest.pas' {frmTest};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDMReport, DMReport);
  Application.CreateForm(TfrmTest, frmTest);
  Application.Run;
end.
