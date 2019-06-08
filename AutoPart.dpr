program AutoPart;

uses
  Vcl.Forms,
  ufrmMain in 'forms\ufrmMain.pas' {frmMain},
  uAppUtils in 'lib\uAppUtils.pas',
  uDBUtils in 'lib\uDBUtils.pas',
  uDMReport in 'lib\uDMReport.pas' {DMReport},
  uDXUtils in 'lib\uDXUtils.pas',
  ufrmCXLookup in 'lib\ufrmCXLookup.pas' {frmCXLookup},
  ufrmCXMsgInfo in 'lib\ufrmCXMsgInfo.pas' {frmCXMsgInfo},
  ufrmLogin in 'forms\ufrmLogin.pas',
  ufrmSetKoneksi in 'forms\ufrmSetKoneksi.pas',
  ufrmDefault in 'forms\ufrmDefault.pas' {frmDefault},
  ufrmDefaultBrowse in 'forms\ufrmDefaultBrowse.pas' {frmDefaultBrowse},
  ufrmDefaultInput in 'forms\ufrmDefaultInput.pas' {frmDefaultInput},
  ufrmDefaultReport in 'forms\ufrmDefaultReport.pas' {frmDefaultReport},
  ufrmTest in 'forms\ufrmTest.pas' {frmTest},
  ufrmDefaultServerBrowse in 'forms\ufrmDefaultServerBrowse.pas' {frmDefaultServerBrowse},
  CRUDObject in 'lib\CRUDObject.pas',
  uUOM in 'classes\uUOM.pas',
  ufrmBrowseUOM in 'forms\ufrmBrowseUOM.pas' {frmBrowseUOM},
  ufrmUOM in 'forms\ufrmUOM.pas' {frmUOM};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDMReport, DMReport);
  Application.CreateForm(TfrmUOM, frmUOM);
  Application.Run;
end.
