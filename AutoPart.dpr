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
  uItem in 'classes\uItem.pas',
  ufrmBrowseUOM in 'forms\ufrmBrowseUOM.pas' {frmBrowseUOM},
  ufrmUOM in 'forms\ufrmUOM.pas' {frmUOM},
  ufrmBrowseItemGroup in 'forms\ufrmBrowseItemGroup.pas' {frmBrowseItemGroup},
  ufrmItemGroup in 'forms\ufrmItemGroup.pas' {frmItemGroup},
  ufrmMerk in 'forms\ufrmMerk.pas' {frmMerk},
  ufrmBrowseMerk in 'forms\ufrmBrowseMerk.pas' {frmBrowseMerk},
  ufrmItem in 'forms\ufrmItem.pas' {frmItem},
  ufrmBrowseItem in 'forms\ufrmBrowseItem.pas' {frmBrowseItem};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDMReport, DMReport);
  Application.CreateForm(TfrmBrowseItem, frmBrowseItem);
  Application.Run;
end.
