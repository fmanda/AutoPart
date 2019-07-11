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
  uPriceQuotation in 'classes\uPriceQuotation.pas',
  uMekanik in 'classes\uMekanik.pas',
  ufrmSalesman in 'forms\ufrmSalesman.pas' {frmSalesman},
  ufrmMekanik in 'forms\ufrmMekanik.pas' {frmMekanik},
  ufrmBrowseSalesman in 'forms\ufrmBrowseSalesman.pas' {frmBrowseSalesman},
  ufrmBrowseMekanik in 'forms\ufrmBrowseMekanik.pas' {frmBrowseMekanik},
  uFinancialTransaction in 'classes\uFinancialTransaction.pas',
  ufrmSalesInvoice in 'forms\ufrmSalesInvoice.pas' {frmSalesInvoice},
  uVariable in 'classes\uVariable.pas',
  ufrmVariable in 'forms\ufrmVariable.pas' {frmVariable},
  ufrmBrowseSalesInvoice in 'forms\ufrmBrowseSalesInvoice.pas' {frmBrowseSalesInvoice},
  ufrmSalesInvoiceHistory in 'forms\ufrmSalesInvoiceHistory.pas' {frmSalesInvoiceHistory},
  ufrmPurchaseInvoiceHistory in 'forms\ufrmPurchaseInvoiceHistory.pas' {frmPurchaseInvoiceHistory},
  ufrmSettingFee in 'forms\ufrmSettingFee.pas' {frmSettingFee},
  ufrmBrowseSettingFee in 'forms\ufrmBrowseSettingFee.pas' {frmBrowseSettingFee},
  uSettingFee in 'classes\uSettingFee.pas',
  uSalesFee in 'classes\uSalesFee.pas',
  ufrmSaldoRekening in 'forms\ufrmSaldoRekening.pas' {frmSaldoRekening},
  ufrmSalesRetur in 'forms\ufrmSalesRetur.pas' {frmSalesRetur},
  ufrmBrowseSalesRetur in 'forms\ufrmBrowseSalesRetur.pas' {frmBrowseSalesRetur},
  ufrmMutasiRekening in 'forms\ufrmMutasiRekening.pas' {frmMutasiRekening},
  ufrmPurchasePayment in 'forms\ufrmPurchasePayment.pas' {frmPurchasePayment},
  ufrmBrowsePurchasePayment in 'forms\ufrmBrowsePurchasePayment.pas' {frmBrowsePurchasePayment},
  ufrmPurchaseReturHistory in 'forms\ufrmPurchaseReturHistory.pas' {frmPurchaseReturHistory},
  ufrmLapHutang in 'forms\ufrmLapHutang.pas' {frmLapHutang},
  ufrmSalesPayment in 'forms\ufrmSalesPayment.pas' {frmSalesPayment},
  ufrmBrowseSalesPayment in 'forms\ufrmBrowseSalesPayment.pas' {frmBrowseSalesPayment},
  ufrmSalesReturHistory in 'forms\ufrmSalesReturHistory.pas' {frmSalesReturHistory},
  ufrmLapPiutang in 'forms\ufrmLapPiutang.pas' {frmLapPiutang},
  ufrmDialogPayment in 'forms\ufrmDialogPayment.pas' {frmDialogPayment},
  ufrmCashTransfer in 'forms\ufrmCashTransfer.pas' {frmCashTransfer},
  ufrmBrowseCashTransfer in 'forms\ufrmBrowseCashTransfer.pas' {frmBrowseCashTransfer},
  ufrmPriceQuotation in 'forms\ufrmPriceQuotation.pas' {frmPriceQuotation},
  ufrmBrowsePriceQuotation in 'forms\ufrmBrowsePriceQuotation.pas' {frmBrowsePriceQuotation},
  ufrmAccount in 'forms\ufrmAccount.pas' {frmAccount},
  ufrmBrowseAccount in 'forms\ufrmBrowseAccount.pas' {frmBrowseAccount},
  ufrmCashPayment in 'classes\ufrmCashPayment.pas' {frmCashPayment},
  ufrmBrowseCashPayment in 'forms\ufrmBrowseCashPayment.pas' {frmBrowseCashPayment},
  ufrmCashReceipt in 'forms\ufrmCashReceipt.pas' {frmCashReceipt},
  ufrmBrowseCashReceipt in 'forms\ufrmBrowseCashReceipt.pas' {frmBrowseCashReceipt},
  ufrmStockOpname in 'forms\ufrmStockOpname.pas' {frmStockOpname},
  ufrmBrowseStockOpname in 'forms\ufrmBrowseStockOpname.pas' {frmBrowseStockOpname},
  ufrmStockAdjustment in 'forms\ufrmStockAdjustment.pas' {frmStockAdjustment},
  ufrmBrowseStockAdjustment in 'forms\ufrmBrowseStockAdjustment.pas' {frmBrowseStockAdjustment},
  uEndOfDay in 'classes\uEndOfDay.pas',
  ufrmEndOfDay in 'forms\ufrmEndOfDay.pas' {frmEndOfDay},
  ufrmLapCashOpname in 'forms\ufrmLapCashOpname.pas' {frmLapCashOpname},
  ufrmSalesAnalysis in 'forms\ufrmSalesAnalysis.pas' {frmSalesAnalysis},
  ufrmProfitLoss in 'forms\ufrmProfitLoss.pas' {frmProfitLoss},
  uPrintStruk in 'classes\uPrintStruk.pas';

{$R *.res}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDMReport, DMReport);
  Application.Run;
end.
