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
  ufrmBrowseItem in 'forms\ufrmBrowseItem.pas' {frmBrowseItem},
  ufrmService in 'forms\ufrmService.pas' {frmService},
  ufrmBrowseService in 'forms\ufrmBrowseService.pas' {frmBrowseService},
  uCabang in 'classes\uCabang.pas',
  uCustomer in 'classes\uCustomer.pas',
  uSupplier in 'classes\uSupplier.pas',
  ufrmBrowseCustomer in 'forms\ufrmBrowseCustomer.pas' {frmBrowseCustomer},
  ufrmCustomer in 'forms\ufrmCustomer.pas' {frmCustomer},
  ufrmSupplier in 'forms\ufrmSupplier.pas' {frmSupplier},
  ufrmBrowseSupplier in 'forms\ufrmBrowseSupplier.pas' {frmBrowseSupplier},
  ufrmWarehouse in 'forms\ufrmWarehouse.pas' {frmWarehouse},
  uWarehouse in 'classes\uWarehouse.pas',
  ufrmBrowseWarehouse in 'forms\ufrmBrowseWarehouse.pas' {frmBrowseWarehouse},
  uAccount in 'classes\uAccount.pas',
  ufrmRekening in 'forms\ufrmRekening.pas' {frmRekening},
  ufrmBrowseRekening in 'forms\ufrmBrowseRekening.pas' {frmBrowseRekening},
  uTransDetail in 'classes\uTransDetail.pas',
  ufrmPurchaseInvoice in 'forms\ufrmPurchaseInvoice.pas' {frmPurchaseInvoice},
  ufrmCXServerLookup in 'lib\ufrmCXServerLookup.pas' {frmCXServerLookup},
  ufrmBrowsePurchaseInvoice in 'forms\ufrmBrowsePurchaseInvoice.pas' {frmBrowsePurchaseInvoice},
  ufrmKartuStock in 'forms\ufrmKartuStock.pas' {frmKartuStock},
  ufrmPurchaseRetur in 'forms\ufrmPurchaseRetur.pas' {frmPurchaseRetur},
  ufrmBrowsePurchaseRetur in 'forms\ufrmBrowsePurchaseRetur.pas' {frmBrowsePurchaseRetur},
  uSalesman in 'classes\uSalesman.pas',
  uStockOpname in 'classes\uStockOpname.pas',
  ufrmTransferStock in 'forms\ufrmTransferStock.pas' {frmTransferStock},
  ufrmBrowseTransferStock in 'forms\ufrmBrowseTransferStock.pas' {frmBrowseTransferStock},
  ufrmLapStock in 'forms\ufrmLapStock.pas' {frmLapStock},
  uQuotation in 'classes\uQuotation.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDMReport, DMReport);
  Application.Run;
end.
