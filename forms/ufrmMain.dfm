object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'AutoPart - [Software Manajemen Bengkel & Toko Sparepart]'
  ClientHeight = 729
  ClientWidth = 1350
  Color = clScrollBar
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dxStatusBar: TdxRibbonStatusBar
    Left = 0
    Top = 706
    Width = 1350
    Height = 23
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'Server'
        Width = 200
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'Database'
        Width = 200
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'User Login'
        Width = 150
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
      end>
    Ribbon = dxRBMain
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object dxRBMain: TdxRibbon
    Left = 0
    Top = 0
    Width = 1350
    Height = 122
    BarManager = dxBarManager
    Style = rs2013
    ColorSchemeAccent = rcsaOrange
    ColorSchemeName = 'LightGray'
    Contexts = <>
    TabOrder = 1
    TabStop = False
    object dxRTApp: TdxRibbonTab
      Caption = 'Aplikasi'
      Groups = <
        item
          ToolbarName = 'dxBarManagerBar2'
        end>
      Index = 0
    end
    object dxRTMaster: TdxRibbonTab
      Caption = 'Master Data'
      Groups = <
        item
          ToolbarName = 'dxBarManagerBar1'
        end
        item
          ToolbarName = 'dxBarManagerBar3'
        end
        item
          ToolbarName = 'dxBarManagerBar4'
        end>
      Index = 1
    end
    object dxRTInventory: TdxRibbonTab
      Active = True
      Caption = 'Inventory'
      Groups = <
        item
          ToolbarName = 'dxBarManagerBar5'
        end
        item
          ToolbarName = 'dxBarManagerBar6'
        end>
      Index = 2
    end
    object dxRTSales: TdxRibbonTab
      Caption = 'Penjualan & Kas'
      Groups = <
        item
          ToolbarName = 'dxBarManagerBar9'
        end
        item
          ToolbarName = 'dxBarManagerBar10'
        end>
      Index = 3
    end
    object dxRTARAP: TdxRibbonTab
      Caption = 'Hutang - Piutang'
      Groups = <
        item
          ToolbarName = 'dxBarManagerBar12'
        end
        item
          ToolbarName = 'dxBarManagerBar14'
        end
        item
          ToolbarName = 'dxBarManagerBar8'
        end>
      Index = 4
    end
    object dxRTManagement: TdxRibbonTab
      Caption = 'Manajemen'
      Groups = <
        item
          ToolbarName = 'dxBarManagerBar7'
        end
        item
          ToolbarName = 'dxBarManagerBar11'
        end>
      Index = 5
    end
  end
  object dxBarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    FlatCloseButton = True
    HideFloatingBarsWhenInactive = False
    ImageOptions.Images = ImageList
    ImageOptions.LargeIcons = True
    MenuAnimations = maRandom
    PopupMenuLinks = <>
    ShowCloseButton = True
    UseBarHintWindow = False
    UseF10ForMenu = False
    UseSystemFont = True
    Left = 632
    Top = 137
    PixelsPerInch = 96
    object dxBarManagerBar1: TdxBar
      Caption = 'Maintenance Data Item'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 656
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton3'
        end
        item
          Visible = True
          ItemName = 'dxBarButton4'
        end
        item
          Visible = True
          ItemName = 'dxBarButton30'
        end
        item
          Visible = True
          ItemName = 'dxBarButton33'
        end
        item
          Visible = True
          ItemName = 'dxBarButton31'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManagerBar2: TdxBar
      Caption = 'Setting Aplikasi'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 656
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton12'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          Visible = True
          ItemName = 'dxBarButton27'
        end
        item
          Visible = True
          ItemName = 'dxBarButton50'
        end
        item
          Visible = True
          ItemName = 'dxBarButton51'
        end
        item
          Visible = True
          ItemName = 'dxBarButton85'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManagerBar3: TdxBar
      Caption = 'Business Partner'
      CaptionButtons = <>
      DockedLeft = 221
      DockedTop = 0
      FloatLeft = 656
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton34'
        end
        item
          Visible = True
          ItemName = 'dxBarButton35'
        end
        item
          Visible = True
          ItemName = 'dxBarButton46'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManagerBar4: TdxBar
      Caption = 'Data Toko / Bengkel'
      CaptionButtons = <>
      DockedLeft = 376
      DockedTop = 0
      FloatLeft = 901
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton36'
        end
        item
          Visible = True
          ItemName = 'dxBarButton37'
        end
        item
          Visible = True
          ItemName = 'dxBarButton48'
        end
        item
          Visible = True
          ItemName = 'dxBarButton49'
        end
        item
          Visible = True
          ItemName = 'dxBarButton73'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManagerBar5: TdxBar
      Caption = 'Administrasi Gudang'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 901
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton38'
        end
        item
          Visible = True
          ItemName = 'dxBarButton39'
        end
        item
          Visible = True
          ItemName = 'dxBarButton40'
        end
        item
          Visible = True
          ItemName = 'dxBarButton88'
        end
        item
          Visible = True
          ItemName = 'dxBarButton41'
        end
        item
          Visible = True
          ItemName = 'dxBarButton42'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManagerBar6: TdxBar
      Caption = 'Lap Inventory'
      CaptionButtons = <>
      DockedLeft = 337
      DockedTop = 0
      FloatLeft = 901
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton43'
        end
        item
          Visible = True
          ItemName = 'dxBarButton44'
        end
        item
          Visible = True
          ItemName = 'dxBarButton45'
        end
        item
          Visible = True
          ItemName = 'dxBarButton76'
        end
        item
          Visible = True
          ItemName = 'dxBarButton84'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManagerBar7: TdxBar
      Caption = 'Closing '
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 901
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton70'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManagerBar9: TdxBar
      Caption = 'Transaksi Penjualan & Kas'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 901
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton52'
        end
        item
          Visible = True
          ItemName = 'dxBarButton53'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton56'
        end
        item
          Visible = True
          ItemName = 'dxBarButton54'
        end
        item
          Visible = True
          ItemName = 'dxBarButton55'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManagerBar10: TdxBar
      Caption = 'Laporan'
      CaptionButtons = <>
      DockedLeft = 302
      DockedTop = 0
      FloatLeft = 901
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton58'
        end
        item
          Visible = True
          ItemName = 'dxBarButton59'
        end
        item
          Visible = True
          ItemName = 'dxBarButton61'
        end
        item
          Visible = True
          ItemName = 'dxBarButton60'
        end
        item
          Visible = True
          ItemName = 'dxBarButton62'
        end
        item
          Visible = True
          ItemName = 'dxBarButton83'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManagerBar11: TdxBar
      Caption = 'Lap Manajemen'
      CaptionButtons = <>
      DockedLeft = 76
      DockedTop = 0
      FloatLeft = 901
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton77'
        end
        item
          Visible = True
          ItemName = 'dxBarButton78'
        end
        item
          Visible = True
          ItemName = 'dxBarButton79'
        end
        item
          Visible = True
          ItemName = 'dxBarButton80'
        end
        item
          Visible = True
          ItemName = 'dxBarButton81'
        end
        item
          Visible = True
          ItemName = 'dxBarButton82'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManagerBar12: TdxBar
      Caption = 'Hutang - Piutang'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 901
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton64'
        end
        item
          Visible = True
          ItemName = 'dxBarButton65'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManagerBar14: TdxBar
      Caption = 'Laporan Hutang'
      CaptionButtons = <>
      DockedLeft = 146
      DockedTop = 0
      FloatLeft = 901
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton66'
        end
        item
          Visible = True
          ItemName = 'dxBarButton67'
        end
        item
          Visible = True
          ItemName = 'dxBarButton74'
        end
        item
          Visible = True
          ItemName = 'dxBarButton87'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManagerBar8: TdxBar
      Caption = 'Laporan Piutang'
      CaptionButtons = <>
      DockedLeft = 476
      DockedTop = 0
      FloatLeft = 901
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton68'
        end
        item
          Visible = True
          ItemName = 'dxBarButton71'
        end
        item
          Visible = True
          ItemName = 'dxBarButton75'
        end
        item
          Visible = True
          ItemName = 'dxBarButton86'
        end>
      OneOnRow = False
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarLargeButton1: TdxBarLargeButton
      Action = actUOM
      Category = 0
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton1: TdxBarButton
      Action = actUOM
      Caption = 'UOM / Satuan'
      Category = 0
    end
    object dxBarButton2: TdxBarButton
      Action = actSettingKoneksi
      Category = 0
      ImageIndex = 20
    end
    object dxBarButton3: TdxBarButton
      Action = actItemGroup
      Category = 0
    end
    object dxBarButton4: TdxBarButton
      Action = actMerk
      Category = 0
    end
    object dxBarButton5: TdxBarButton
      Caption = 'Product'
      Category = 0
      Visible = ivAlways
      ImageIndex = 14
    end
    object dxBarButton6: TdxBarButton
      Caption = 'Customer'
      Category = 0
      Visible = ivAlways
      ImageIndex = 37
    end
    object dxBarButton7: TdxBarButton
      Caption = 'Supplier'
      Category = 0
      Visible = ivAlways
      ImageIndex = 16
    end
    object dxBarButton8: TdxBarButton
      Caption = 'Warehouse'
      Category = 0
      Visible = ivAlways
      ImageIndex = 24
    end
    object dxBarButton9: TdxBarButton
      Caption = 'Data Machine'
      Category = 0
      Visible = ivAlways
      ImageIndex = 39
    end
    object dxBarButton10: TdxBarButton
      Caption = 'Employee'
      Category = 0
      Visible = ivAlways
      ImageIndex = 38
    end
    object dxBarButton11: TdxBarButton
      Caption = 'Product Category'
      Category = 0
      Visible = ivAlways
      ImageIndex = 13
    end
    object dxBarButton12: TdxBarButton
      Action = actLogin
      Category = 0
      ImageIndex = 11
    end
    object dxBarButton13: TdxBarButton
      Caption = 'Sales Order / Pesanan Customer'
      Category = 0
      Visible = ivAlways
      ImageIndex = 27
    end
    object dxBarButton14: TdxBarButton
      Caption = 'Laporan Produksi'
      Category = 0
      Visible = ivAlways
      ImageIndex = 29
    end
    object dxBarButton15: TdxBarButton
      Caption = 'Delivery Order / Pengiriman'
      Category = 0
      Visible = ivAlways
      ImageIndex = 10
    end
    object dxBarButton16: TdxBarButton
      Caption = 'Purchase Order / Pembelian'
      Category = 0
      Visible = ivAlways
      ImageIndex = 13
    end
    object dxBarButton17: TdxBarButton
      Caption = 'Good Receive / Penerimaan'
      Category = 0
      Visible = ivAlways
      ImageIndex = 12
    end
    object dxBarButton18: TdxBarButton
      Caption = 'Material Transaction / Mutasi Material'
      Category = 0
      Visible = ivAlways
      ImageIndex = 9
    end
    object dxBarButton19: TdxBarButton
      Caption = 'Material Return / Retur Bahan'
      Category = 0
      Visible = ivAlways
      ImageIndex = 5
    end
    object dxBarButton20: TdxBarButton
      Caption = 'Laporan Progress SO / Pesanan Pelanggan'
      Category = 0
      Visible = ivAlways
      ImageIndex = 18
    end
    object dxBarButton21: TdxBarButton
      Caption = 'Laporan Analisa Penjualan'
      Category = 0
      Visible = ivAlways
      ImageIndex = 17
    end
    object dxBarButton22: TdxBarButton
      Caption = 'Laporan Pemakaian Bahan'
      Category = 0
      Visible = ivAlways
      ImageIndex = 12
    end
    object dxBarButton23: TdxBarButton
      Caption = 'Laporan Stok Material'
      Category = 0
      Visible = ivAlways
      ImageIndex = 12
    end
    object dxBarButton24: TdxBarButton
      Caption = 'Laporan Stok Product'
      Category = 0
      Visible = ivAlways
      ImageIndex = 14
    end
    object dxBarButton25: TdxBarButton
      Caption = 'Kartu Stok Material'
      Category = 0
      Visible = ivAlways
      ImageIndex = 8
    end
    object dxBarButton26: TdxBarButton
      Caption = 'Proses Kerja'
      Category = 0
      Visible = ivAlways
      ImageIndex = 30
    end
    object dxBarButton27: TdxBarButton
      Action = actHelp
      Category = 0
      Visible = ivNever
      ImageIndex = 13
    end
    object dxBarButton28: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton29: TdxBarButton
      Caption = 'Laporan Utilisasi Mesin'
      Category = 0
      Visible = ivNever
      ImageIndex = 13
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton30: TdxBarButton
      Action = actItem
      Category = 0
    end
    object dxBarButton31: TdxBarButton
      Action = actQuotation
      Category = 0
    end
    object dxBarButton32: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton33: TdxBarButton
      Action = actService
      Category = 0
    end
    object dxBarButton34: TdxBarButton
      Action = actCustomer
      Category = 0
    end
    object dxBarButton35: TdxBarButton
      Action = actSupplier
      Category = 0
    end
    object dxBarButton36: TdxBarButton
      Action = actWarehouse
      Category = 0
    end
    object dxBarButton37: TdxBarButton
      Action = actRekening
      Category = 0
    end
    object dxBarButton38: TdxBarButton
      Action = actPurchaseInvoice
      Category = 0
    end
    object dxBarButton39: TdxBarButton
      Action = actPurchaseRetur
      Category = 0
    end
    object dxBarButton40: TdxBarButton
      Action = actTransferStock
      Category = 0
    end
    object dxBarButton41: TdxBarButton
      Action = actStockOpname
      Category = 0
    end
    object dxBarButton42: TdxBarButton
      Action = actStockAdjustment
      Category = 0
    end
    object dxBarButton43: TdxBarButton
      Action = actKartuStock
      Category = 0
    end
    object dxBarButton44: TdxBarButton
      Action = actLapStock
      Category = 0
    end
    object dxBarButton45: TdxBarButton
      Action = actLapStockOpname
      Category = 0
    end
    object dxBarButton46: TdxBarButton
      Action = actSalesman
      Category = 0
    end
    object dxBarButton47: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton48: TdxBarButton
      Action = actMekanik
      Category = 0
    end
    object dxBarButton49: TdxBarButton
      Action = actAccount
      Category = 0
    end
    object dxBarButton50: TdxBarButton
      Action = actVariable
      Category = 0
    end
    object dxBarButton51: TdxBarButton
      Action = actUser
      Category = 0
    end
    object dxBarButton52: TdxBarButton
      Action = actSales
      Category = 0
    end
    object dxBarButton53: TdxBarButton
      Action = actSalesRetur
      Category = 0
    end
    object dxBarButton54: TdxBarButton
      Action = actCashIn
      Category = 0
    end
    object dxBarButton55: TdxBarButton
      Action = actCashOut
      Category = 0
    end
    object dxBarButton56: TdxBarButton
      Action = actInternalTransfer
      Caption = 'Transfer Antar Kas/Bank'
      Category = 0
    end
    object dxBarButton57: TdxBarButton
      Action = actCashOpname
      Category = 0
      Visible = ivNever
    end
    object dxBarButton58: TdxBarButton
      Action = actDetPenjualan
      Category = 0
    end
    object dxBarButton59: TdxBarButton
      Action = actSaldoKas
      Category = 0
    end
    object dxBarButton60: TdxBarButton
      Action = actLapCashOpname
      Category = 0
    end
    object dxBarButton61: TdxBarButton
      Action = actMutasiKas
      Category = 0
    end
    object dxBarButton62: TdxBarButton
      Action = actBiaya
      Category = 0
    end
    object dxBarButton63: TdxBarButton
      Caption = 'New Button'
      Category = 0
      Hint = 'New Button'
      Visible = ivAlways
    end
    object dxBarButton64: TdxBarButton
      Action = actPurchPayment
      Category = 0
    end
    object dxBarButton65: TdxBarButton
      Action = actSalesPayment
      Category = 0
    end
    object dxBarSubItem3: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton66: TdxBarButton
      Action = actSaldoHutang
      Caption = 'Laporan Saldo Hutang'
      Category = 0
    end
    object dxBarButton67: TdxBarButton
      Action = actPurchaseInvoiceHistory
      Category = 0
    end
    object dxBarButton68: TdxBarButton
      Action = actSaldoPiutang
      Caption = 'Laporan Saldo Piutang'
      Category = 0
    end
    object dxBarButton69: TdxBarButton
      Action = actSalesInvoiceHistory
      Category = 0
    end
    object dxBarButton70: TdxBarButton
      Action = actEndOfDay
      Category = 0
    end
    object dxBarButton71: TdxBarButton
      Action = actSalesInvoiceHistory
      Category = 0
    end
    object dxBarButton72: TdxBarButton
      Action = actSettingFee
      Category = 0
    end
    object dxBarButton73: TdxBarButton
      Action = actSettingFee
      Category = 0
    end
    object dxBarButton74: TdxBarButton
      Action = actPurchaseReturHistory
      Category = 0
    end
    object dxBarButton75: TdxBarButton
      Action = actSalesReturHistory
      Category = 0
    end
    object dxBarButton76: TdxBarButton
      Action = actSuggestionOrder
      Category = 0
    end
    object dxBarButton77: TdxBarButton
      Action = actSalesAnalysis
      Category = 0
    end
    object dxBarButton78: TdxBarButton
      Action = actLabaRugi
      Category = 0
    end
    object dxBarButton79: TdxBarButton
      Action = actInventoryMov
      Category = 0
    end
    object dxBarButton80: TdxBarButton
      Action = actAgingStock
      Category = 0
    end
    object dxBarButton81: TdxBarButton
      Action = actAgingAR
      Category = 0
    end
    object dxBarButton82: TdxBarButton
      Action = actCashFlow
      Category = 0
    end
    object dxBarButton83: TdxBarButton
      Action = actLapFeeSalesman
      Category = 0
    end
    object dxBarButton84: TdxBarButton
      Action = actLapPembelian
      Category = 0
    end
    object dxBarButton85: TdxBarButton
      Action = actGantiPass
      Category = 0
    end
    object dxBarButton86: TdxBarButton
      Action = actPiutangRetur
      Category = 0
    end
    object dxBarButton87: TdxBarButton
      Action = actHutangRetur
      Category = 0
    end
    object dxBarButton88: TdxBarButton
      Action = actKKSO
      Category = 0
      ImageIndex = 23
    end
  end
  object ActionManager: TActionManager
    Images = ImageList
    Left = 392
    Top = 176
    StyleName = 'Platform Default'
    object actLogin: TAction
      Category = 'Application'
      Caption = 'Login'
      OnExecute = actLoginExecute
    end
    object actSettingKoneksi: TAction
      Category = 'Application'
      Caption = 'Setting Koneksi'
      OnExecute = actSettingKoneksiExecute
    end
    object actUOM: TAction
      Category = 'Master'
      Caption = 'Data UOM / Satuan'
      ImageIndex = 13
      OnExecute = actUOMExecute
    end
    object actHelp: TAction
      Category = 'Application'
      Caption = 'Bantuan Alur Program'
    end
    object actItemGroup: TAction
      Category = 'Master'
      Caption = 'Item Group'
      ImageIndex = 12
      OnExecute = actItemGroupExecute
    end
    object actMerk: TAction
      Category = 'Master'
      Caption = 'Data Merk'
      ImageIndex = 8
      OnExecute = actMerkExecute
    end
    object actItem: TAction
      Category = 'Master'
      Caption = 'Data Item'
      ImageIndex = 10
      OnExecute = actItemExecute
    end
    object actQuotation: TAction
      Category = 'Master'
      Caption = 'Price Quotation'
      ImageIndex = 14
      OnExecute = actQuotationExecute
    end
    object actService: TAction
      Category = 'Master'
      Caption = 'Jasa / Service'
      ImageIndex = 39
      OnExecute = actServiceExecute
    end
    object actCustomer: TAction
      Category = 'Master'
      Caption = 'Customer / Pelanggan'
      ImageIndex = 37
      OnExecute = actCustomerExecute
    end
    object actSupplier: TAction
      Category = 'Master'
      Caption = 'Data Supplier'
      ImageIndex = 16
      OnExecute = actSupplierExecute
    end
    object actWarehouse: TAction
      Category = 'Master'
      Caption = 'Data Gudang'
      ImageIndex = 24
      OnExecute = actWarehouseExecute
    end
    object actRekening: TAction
      Category = 'Master'
      Caption = 'Rekening Kas && Bank'
      ImageIndex = 15
      OnExecute = actRekeningExecute
    end
    object actPurchaseInvoice: TAction
      Category = 'Inventory'
      Caption = 'Pembelian Barang'
      ImageIndex = 36
      OnExecute = actPurchaseInvoiceExecute
    end
    object actPurchaseRetur: TAction
      Category = 'Inventory'
      Caption = 'Retur Pembelian'
      ImageIndex = 5
      OnExecute = actPurchaseReturExecute
    end
    object actTransferStock: TAction
      Category = 'Inventory'
      Caption = 'Transfer Stock'
      ImageIndex = 9
      OnExecute = actTransferStockExecute
    end
    object actStockOpname: TAction
      Category = 'Inventory'
      Caption = 'Stock Opname'
      ImageIndex = 8
      OnExecute = actStockOpnameExecute
    end
    object actStockAdjustment: TAction
      Category = 'Inventory'
      Caption = 'Stock Adjustment'
      ImageIndex = 12
      OnExecute = actStockAdjustmentExecute
    end
    object actKartuStock: TAction
      Category = 'Inventory'
      Caption = 'Kartu Stock / Mutasi Harian'
      ImageIndex = 13
      OnExecute = actKartuStockExecute
    end
    object actLapStock: TAction
      Category = 'Inventory'
      Caption = 'Laporan Saldo Stock'
      ImageIndex = 27
      OnExecute = actLapStockExecute
    end
    object actLapStockOpname: TAction
      Category = 'Inventory'
      Caption = 'Laporan Stock Opname'
      ImageIndex = 8
    end
    object actSalesman: TAction
      Category = 'Master'
      Caption = 'Data Salesman'
      ImageIndex = 38
      OnExecute = actSalesmanExecute
    end
    object actMekanik: TAction
      Category = 'Master'
      Caption = 'Mekanik / Montir'
      ImageIndex = 30
      OnExecute = actMekanikExecute
    end
    object actAccount: TAction
      Category = 'Master'
      Caption = 'Account'
      ImageIndex = 13
      OnExecute = actAccountExecute
    end
    object actVariable: TAction
      Category = 'Application'
      Caption = 'Variabel Aplikasi'
      ImageIndex = 30
      OnExecute = actVariableExecute
    end
    object actUser: TAction
      Category = 'Application'
      Caption = 'Manajemen User'
      ImageIndex = 16
      OnExecute = actUserExecute
    end
    object actSales: TAction
      Category = 'Kasir & Penjualan'
      Caption = 'Penjualan && Service'
      ImageIndex = 9
      OnExecute = actSalesExecute
    end
    object actSalesRetur: TAction
      Category = 'Kasir & Penjualan'
      Caption = 'Retur Penjualan'
      ImageIndex = 11
      OnExecute = actSalesReturExecute
    end
    object actCashIn: TAction
      Category = 'Kasir & Penjualan'
      Caption = 'Penerimaan Kas'
      ImageIndex = 0
      OnExecute = actCashInExecute
    end
    object actCashOut: TAction
      Category = 'Kasir & Penjualan'
      Caption = 'Pengeluaran Kas'
      ImageIndex = 6
      OnExecute = actCashOutExecute
    end
    object actInternalTransfer: TAction
      Category = 'Kasir & Penjualan'
      Caption = 'Internal Transfer'
      ImageIndex = 5
      OnExecute = actInternalTransferExecute
    end
    object actCashOpname: TAction
      Category = 'Kasir & Penjualan'
      Caption = 'Cash Opname'
      ImageIndex = 7
    end
    object actSaldoKas: TAction
      Category = 'Kasir & Penjualan'
      Caption = 'Saldo Kas'
      ImageIndex = 25
      OnExecute = actSaldoKasExecute
    end
    object actLapCashOpname: TAction
      Category = 'Kasir & Penjualan'
      Caption = 'Lap Cash Opname'
      ImageIndex = 7
      OnExecute = actLapCashOpnameExecute
    end
    object actMutasiKas: TAction
      Category = 'Kasir & Penjualan'
      Caption = 'Mutasi Kas'
      ImageIndex = 18
      OnExecute = actMutasiKasExecute
    end
    object actDetPenjualan: TAction
      Category = 'Kasir & Penjualan'
      Caption = 'Detail Penjualan'
      ImageIndex = 19
      OnExecute = actDetPenjualanExecute
    end
    object actBiaya: TAction
      Category = 'Kasir & Penjualan'
      Caption = 'Lap Biaya'
      ImageIndex = 15
    end
    object actPurchPayment: TAction
      Category = 'Hutang Piutang'
      Caption = 'Pembayaran Hutang'
      ImageIndex = 23
      OnExecute = actPurchPaymentExecute
    end
    object actSalesPayment: TAction
      Category = 'Hutang Piutang'
      Caption = 'Pembayaran Piutang'
      ImageIndex = 13
      OnExecute = actSalesPaymentExecute
    end
    object actSaldoHutang: TAction
      Category = 'Hutang Piutang'
      Caption = 'Saldo Hutang'
      ImageIndex = 8
      OnExecute = actSaldoHutangExecute
    end
    object actPurchaseInvoiceHistory: TAction
      Category = 'Hutang Piutang'
      Caption = 'History Pembayaran Hutang'
      ImageIndex = 29
      OnExecute = actPurchaseInvoiceHistoryExecute
    end
    object actSaldoPiutang: TAction
      Category = 'Hutang Piutang'
      Caption = 'Saldo Piutang'
      ImageIndex = 13
      OnExecute = actSaldoPiutangExecute
    end
    object actSalesInvoiceHistory: TAction
      Category = 'Hutang Piutang'
      Caption = 'History Pembayaran Piutang'
      ImageIndex = 15
      OnExecute = actSalesInvoiceHistoryExecute
    end
    object actEndOfDay: TAction
      Category = 'Manajemen'
      Caption = 'End Of Day'
      OnExecute = actEndOfDayExecute
    end
    object actSalesAnalysis: TAction
      Category = 'Manajemen'
      Caption = 'Analisa Penjualan'
      OnExecute = actSalesAnalysisExecute
    end
    object actSettingFee: TAction
      Category = 'Master'
      Caption = 'Komisi / Fee Salesman'
      ImageIndex = 14
      OnExecute = actSettingFeeExecute
    end
    object actPurchaseReturHistory: TAction
      Category = 'Hutang Piutang'
      Caption = 'History Retur Pembelian'
      ImageIndex = 5
      OnExecute = actPurchaseReturHistoryExecute
    end
    object actSalesReturHistory: TAction
      Category = 'Hutang Piutang'
      Caption = 'History Retur Penjualan'
      ImageIndex = 5
      OnExecute = actSalesReturHistoryExecute
    end
    object actAgingStock: TAction
      Category = 'Manajemen'
      Caption = 'Aging Stock'
      OnExecute = actAgingStockExecute
    end
    object actLabaRugi: TAction
      Category = 'Manajemen'
      Caption = 'Laba Rugi Usaha'
      OnExecute = actLabaRugiExecute
    end
    object actInventoryMov: TAction
      Category = 'Manajemen'
      Caption = 'Inventory Movement'
    end
    object actAgingAR: TAction
      Category = 'Manajemen'
      Caption = 'Aging AR'
      OnExecute = actAgingARExecute
    end
    object actCashFlow: TAction
      Category = 'Manajemen'
      Caption = 'Cash FLow'
    end
    object actSuggestionOrder: TAction
      Category = 'Inventory'
      Caption = 'Suggestion Order'
      OnExecute = actSuggestionOrderExecute
    end
    object actLapFeeSalesman: TAction
      Category = 'Kasir & Penjualan'
      Caption = 'Laporan Fee Salesman'
      OnExecute = actLapFeeSalesmanExecute
    end
    object actLapPembelian: TAction
      Category = 'Inventory'
      Caption = 'Laporan Pembelian'
      OnExecute = actLapPembelianExecute
    end
    object actGantiPass: TAction
      Category = 'Application'
      Caption = 'Ganti Password'
      OnExecute = actGantiPassExecute
    end
    object actPiutangRetur: TAction
      Category = 'Hutang Piutang'
      Caption = 'Laporan Piutang Retur'
      ImageIndex = 5
      OnExecute = actPiutangReturExecute
    end
    object actHutangRetur: TAction
      Category = 'Hutang Piutang'
      Caption = 'Laporan Hutang Retur'
      ImageIndex = 5
      OnExecute = actHutangReturExecute
    end
    object actKKSO: TAction
      Category = 'Inventory'
      Caption = 'Kartu Kerja Stock Opname (KKSO)'
      OnExecute = actKKSOExecute
    end
  end
  object ImageList: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 8913664
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000020000000A170D0738542D1894814626D193502AEA924F2AE87F45
          25D0522C17931209053000000009000000010000000000000000000000000000
          00030201011159311B97A96239FAC58957FFD6A36DFFDDAF75FFDDAF74FFD6A4
          6BFFC58956FFA46137F53C2112730000000F0000000300000000000000020201
          0110744226B9BC7C4DFFDDAE77FFDEB076FFE2B782FFE3BB87FFE3BC86FFE1B7
          82FFDEAF74FFDBAB72FFBD7E4EFF6F3E24B50000001000000002000000085C36
          2095BE8053FFE0B37CFFDFB076FFDEB177FFB78254FFAA7144FFAB7245FFBC88
          59FFDFB279FFDFB277FFDEB077FFC08253FF55321D920000000A190F0932B070
          47FADFB27DFFDFB27AFFE0B37BFFE0B57DFFA56B3FFFF5EFEAFFF8F3EEFFAB72
          45FFE2B67EFFE0B47CFFE0B47BFFDEB079FFB3734AFB130B072F613C2795CD9B
          6FFFE2B780FFE5BD89FFE7C291FFE8C393FFA56B3FFFF1E6DEFFF9F5F1FFAA71
          44FFE8C494FFE8C393FFE5BF8CFFE1B77FFFD09C6EFF5434218B935E3DD2DCB3
          83FFE3B781FFBA8659FFA97043FFAB7245FFAC7346FFF5EDE6FFFAF6F3FFAD75
          47FFB0784AFFB17A4BFFC29162FFE4B983FFDEB17EFF8E5B3BD0B0744CF2E3BF
          8FFFE4BB84FFA56B3FFFF3EBE6FFFAF6F3FFF6EFE8FFF7F0EAFFFBF7F5FFFAF7
          F4FFFAF7F3FFFAF6F2FFAB7245FFE5BD87FFE5BE8BFFAB714CEEAE764FECE9C9
          A0FFE5BE89FFA56B3FFFE0D2CAFFE1D3CCFFE3D5CFFFF2EAE4FFF8F3EFFFEADF
          D9FFE6DAD4FFE9DED9FFAA7144FFE7C08CFFEACA9DFFAE764FEE9A6A49D0E9CD
          ACFFEAC796FFB78456FFA56B3FFFA56B3FFFA56B3FFFF1EAE5FFFAF6F3FFA56B
          3FFFA56B3FFFA56B3FFFB78457FFEACA99FFEBD1ADFF996A49D46E4E3697DDBB
          9DFFEED3A9FFEECFA2FFEED2A5FFF0D6A9FFA56B3FFFF0EAE7FFFDFCFBFFA56B
          3FFFF1D6AAFFF0D5A8FFEED2A5FFEFD4A7FFE0C2A2FF6246318F1C140E2BC794
          6CFCF5E8CCFFEFD6ABFFF1D8AEFFF2DAB0FFA56B3FFFDECFC9FFDFD1CBFFA56B
          3FFFF3DCB2FFF1DBB0FFF1D8ADFFF7EACDFFC69470FA1A120D2E000000036F52
          3C92D7B08CFFF8EFD3FFF3E0B9FFF3DFB7FFB98A5FFFA56B3FFFA56B3FFFBA8A
          5FFFF4E1B9FFF4E2BDFFFAF1D5FFD9B390FF664B368C00000006000000010202
          0107906C4EB8D9B38FFFF7EDD3FFF8EED0FFF7EBC9FFF6E8C4FFF6E8C5FFF7EC
          CAFFF8EED0FFF4E8CDFFD7AF8BFF88664AB30202010B00000001000000000000
          00010202010770543F8FCFA078FCE2C4A2FFEBD7B8FFF4E9CDFFF4EACEFFECD8
          B9FFE3C5A3FFC59973F24C392A67000000060000000100000000000000000000
          000000000001000000022019122C6C543E89A47E5FCCC59770F1C19570EEA47E
          60CD6C543F8B16110D2200000003000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000002000000070000000C0000001000000012000000110000
          000E000000080000000200000000000000000000000000000000000000000000
          000100000004000101120D2A1D79184E36C6216B4BFF216B4BFF216C4BFF1A53
          3AD20F2F21840001011500000005000000010000000000000000000000000000
          0005050F0A351C5B40DC24805CFF29AC7EFF2CC592FF2DC894FF2DC693FF2AAE
          80FF258560FF1A563DD405110C3D00000007000000010000000000000003040E
          0A31206548ED299D74FF2FC896FF2EC996FF56D4ACFF68DAB5FF3BCD9DFF30C9
          96FF32CA99FF2BA479FF227050F805110C3D00000005000000000000000A1A57
          3DD02EA57CFF33CA99FF2EC896FF4CD2A8FF20835CFF00673BFF45BE96FF31CB
          99FF31CB98FF34CC9CFF31AD83FF1B5C41D300010113000000020B23185E2E8A
          66FF3BCD9EFF30CA97FF4BD3A9FF349571FF87AF9DFFB1CFC1FF238A60FF45D3
          A8FF36CF9FFF33CD9BFF3ED0A3FF319470FF0F32237F00000007184D37B63DB3
          8CFF39CD9FFF4BD5A9FF43A382FF699782FFF8F1EEFFF9F3EEFF357F5DFF56C4
          A1FF43D5A8FF3ED3A4FF3CD1A4FF41BC95FF1B5C43CD0000000B1C6446DF4BCA
          A4FF44D2A8FF4FB392FF4E826AFFF0E9E6FFC0C3B5FFEFE3DDFFCEDDD4FF1B75
          4FFF60DCB8FF48D8ACFF47D6AAFF51D4ACFF247A58F80000000E217050F266D9
          B8FF46D3A8FF0B6741FFD2D2CBFF6A8F77FF116B43FF73967EFFF1E8E3FF72A2
          8BFF46A685FF5EDFBAFF4CD9AFFF6BE2C2FF278460FF020604191E684ADC78D9
          BEFF52DAB1FF3DBA92FF096941FF2F9C76FF57DEB8FF2D9973FF73967EFFF0EA
          E7FF4F886CFF5ABB9AFF5BDEB9FF7FE2C7FF27835FF80000000C19523BAB77C8
          B0FF62E0BCFF56DDB7FF59DFBAFF5CE1BDFF5EE2BEFF5FE4C1FF288C67FF698E
          76FFE6E1DCFF176B47FF5FD8B4FF83D5BDFF1E674CC60000000909201747439C
          7BFF95ECD6FF5ADFBAFF5EE2BDFF61E4BFFF64E6C1FF67E6C5FF67E8C7FF39A1
          7EFF1F6D4AFF288B64FF98EFD9FF4DAC8CFF1036286D00000004000000041C5F
          46B578C6ADFF9AEED9FF65E5C0FF64E7C3FF69E7C6FF6BE8C8FF6CE9C9FF6BEA
          C9FF5ED6B6FF97EDD7FF86D3BBFF237759D20102010C0000000100000001030A
          0718247B5BDA70C1A8FFB5F2E3FF98F0DAFF85EDD4FF75EBCEFF88EFD6FF9CF2
          DDFFBAF4E7FF78CDB3FF2A906DEA0615102E0000000200000000000000000000
          0001030A07171E694FB844AB87FF85D2BBFFA8E6D6FFC5F4EBFFABE9D8FF89D8
          C1FF4BB692FF237F60CB05130E27000000030000000000000000000000000000
          000000000001000000030A241B411B60489D258464CF2C9D77EE258867CF1F71
          56B00E3226560000000600000002000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000020000000C05031A46110852AB190C76E31D0E89FF1C0E89FF190C
          76E4120852AD06031B4D0000000E000000030000000000000000000000000000
          000301010519130A55A9211593FF2225AEFF2430C2FF2535CBFF2535CCFF2430
          C3FF2225AFFF211594FF140B58B20101051E0000000400000000000000020101
          03151C1270CD2522A6FF2D3DCCFF394BD3FF3445D1FF2939CDFF2839CDFF3344
          D0FF394AD4FF2D3CCDFF2523A8FF1C1270D20101051D00000003000000091912
          5BA72A27AAFF2F41D0FF3541C7FF2726ABFF3137BCFF384AD3FF384BD3FF3137
          BCFF2726ABFF3540C7FF2E40D0FF2927ACFF1A115EB10000000D08061C3D3129
          A2FD2C3CCCFF3842C6FF5F5DBDFFEDEDF8FF8B89CEFF3337B9FF3437B9FF8B89
          CEFFEDEDF8FF5F5DBDFF3741C6FF2B3ACDFF3028A4FF0907204A1E185F9F373B
          BCFF3042D0FF2621A5FFECE7ECFFF5EBE4FFF8F2EEFF9491D1FF9491D1FFF8F1
          EDFFF3E9E2FFECE6EBFF2621A5FF2E3FCFFF343ABEFF201A66B0312A92E03542
          CBFF3446D1FF2C2FB5FF8070ADFFEBDBD3FFF4EAE4FFF7F2EDFFF8F1EDFFF4E9
          E2FFEADAD1FF7F6FACFF2B2EB5FF3144D0FF3040CBFF312A95E53E37AEFA3648
          D0FF374AD3FF3A4ED5FF3234B4FF8A7FB9FFF6ECE7FFF5ECE6FFF4EBE5FFF6EB
          E5FF897DB8FF3233B4FF384BD3FF3547D2FF3446D1FF3E37AEFA453FB4FA4557
          D7FF3B50D5FF4C5FDAFF4343B7FF9189C7FFF7EFE9FFF6EEE9FFF6EFE8FFF7ED
          E8FF9087C5FF4242B7FF495DD8FF394CD4FF3F52D4FF443FB3FA403DA1DC5967
          DAFF5B6EDDFF4F4DBAFF8F89CAFFFBF6F4FFF7F1ECFFEDE1D9FFEDE0D9FFF7F0
          EAFFFAF5F2FF8F89CAFF4E4DB9FF576ADCFF5765D9FF403EA4E12E2D70987C85
          DDFF8798E8FF291D9BFFE5DADEFFF6EEEBFFEDDFDAFF816EA9FF816EA9FFEDDF
          D8FFF4ECE7FFE5D9DCFF291D9BFF8494E7FF7A81DDFF33317BAC111125356768
          D0FC9EACEDFF686FCEFF5646A1FFCCB6BCFF7A68A8FF4C4AB6FF4D4BB7FF7A68
          A8FFCBB5BCFF5646A1FF666DCCFF9BAAEEFF696CD0FD1212273F000000043B3B
          79977D84DFFFA5B6F1FF6D74D0FF2D219BFF5151B9FF8EA2ECFF8EA1ECFF5252
          BBFF2D219BFF6B72D0FFA2B3F0FF8086E0FF404183A700000008000000010303
          050C4E509DBC8087E2FFAEBDF3FFA3B6F1FF9DAFF0FF95A9EEFF95A8EEFF9BAD
          EFFFA2B3F0FFACBCF3FF838AE3FF4F52A0C10303051100000002000000000000
          000100000005323464797378D9F8929CEAFFA1AEEFFFB0BFF3FFB0BFF4FFA2AE
          EFFF939DE9FF7479DAF83234647D000000080000000200000000000000000000
          000000000000000000031213232D40437D935D61B5D07378DFFC7378DFFC5D61
          B5D040437D951212223000000004000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000002000000090000000E0000000F0000000F00000010000000100000
          0010000000100000000F0000000A000000020000000000000000000000000000
          0000000000081E5943C0287657FF277355FF267052FF256D50FF256C4EFF246A
          4BFF226749FF226547FF174733C10000000A0000000000000000000000000000
          000000000009389C79FF61E1BFFF47D3ADFF44D0A9FF42CEA5FF40CCA2FF3ECA
          9FFF3CC79CFF38C599FF267052FF0000000A0000000000000000000000000000
          00000000000430856AC140B28DFF3FAE8AFF3DAB87FF3CA884FF3BA581FF39A2
          7FFF389E7BFF369B79FF266D54C1000000040000000000000000000000000000
          000000000000000000010000000200000002000000030B20176D0A1B136F0000
          0004000000030000000200000002000000000000000000000000000000000000
          000000000000000000000000000000000003040C092E21664AF41C583FF6030A
          072F000000030000000000000000000000000000000000000000000000000000
          00000000000000000000000000010001010C1B4F39CA2FB084FF2CAB7EFF143F
          2BCD0001010D0000000100000000000000000000000000000000000000000000
          000000000000000000010000000512352788329C78FF35CA99FF35C999FF298E
          6AFF0E291D8B0000000600000001000000000000000000000000000000000000
          00000000000000000003091A1343328968FD42CEA2FF38CC9DFF37CB9CFF3CCB
          9DFF256F53FD07140E4700000003000000000000000000000000000000000000
          00000000000102060413297156E24FCCA5FF41D1A4FF3ECFA2FF3CCEA1FF3DCE
          A0FF3FC198FF1D553DE302050417000000010000000000000000000000000000
          0000000000031F5641AA65C4A7FF8BE9CFFF86E7CEFF74E4C5FF73E4C5FF66DF
          BDFF6CDFBEFF5DB69AFF153E2DAE000000040000000000000000000000000000
          0000000000033FA280FF3FA07FFF3E9F7FFFB8F5E6FF8CEDD6FF8CEDD5FF9BEF
          DBFF389071FF388F71FF378E6FFF000000040000000000000000000000000000
          000000000001000000030000000741A585FFC9F9EFFF9EF4E1FF9EF3E0FFADF5
          E6FF3B9878FF0000000900000004000000010000000000000000000000000000
          000000000000000000000000000344AC89FFDEFCF7FFDEFCF7FFDEFCF7FFDEFC
          F7FF3F9E7EFF0000000400000000000000000000000000000000000000000000
          0000000000000000000000000002308569BF41B48EFF41B48EFF41B48EFF41B4
          8EFF2E8166B90000000200000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000200000002000000020000
          0002000000020000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000090000
          000E000000100000001000000010000000100000001000000011000000110000
          001100000011000000100000000B00000003000000000000000019427ACA245A
          A5FF255CA7FF255BA7FF245AA6FF2459A6FF2358A5FF2358A4FF2356A4FF2256
          A4FF2255A3FF2154A3FF2153A1FF1C468AE303080F2900000002255DA5FF316B
          AEFF6DA6D5FF86CAF0FF46A6E4FF44A3E4FF41A1E3FF3FA0E2FF3C9EE2FF3B9C
          E1FF389BE0FF369AE0FF3498DFFF2C77C1FF10284D8B000000082B68AEFF4984
          BEFF4B8BC5FFB2E3F8FF68BBECFF55B0E8FF52AEE8FF4EACE7FF4CA9E6FF49A8
          E5FF47A6E4FF44A4E4FF41A2E3FF3A92D6FF1C4885D50000000D2F6FB4FF6CA7
          D2FF3F87C4FFAED9F0FF9AD8F5FF66BDEEFF63BBEDFF60B9EBFF5DB6EBFF5BB5
          EAFF57B2EAFF55B0E9FF51AEE7FF4FABE7FF2D69B1FF040B142F3276B9FF8FC7
          E6FF509FD4FF86BCE0FFC5EFFCFF78CAF2FF74C8F1FF72C5F0FF6FC4F0FF6DC2
          EFFF69C0EEFF66BDEEFF63BBEDFF60B9EBFF448BC9FF122D4D81357CBCFFAFE3
          F5FF75C8EDFF59A2D4FFDDF7FDFFDFF8FEFFDDF7FEFFDBF7FEFFD8F5FEFFD4F4
          FDFFD0F2FDFFCCEFFCFFC7EDFBFFC1EBFBFF9ACBE9FF215187CB3882C1FFC7F5
          FEFF97E5FCFF64BAE5FF4D9FD3FF4D9DD2FF4B9BD1FF4A99CFFF4998CFFF4896
          CEFF4694CCFF4592CBFF3073B7FF3072B6FF2F71B5FF2A65A4EA3A88C5FFCDF7
          FEFFA6ECFEFF9CE8FDFF93E4FBFF8EE1FBFF89DFFBFF86DEFAFF81DAFAFF7ED8
          F9FF7BD7F9FF79D6F9FF2A6BB0FF000000140000000A000000073D8EC8FFD0F8
          FEFFAEF0FEFFAAEEFEFFA6EDFEFFA5EBFDFFBBF2FDFFD4F9FEFFD5F9FEFFD3F8
          FEFFD1F8FEFFCEF7FDFF3680BFFF0000000800000000000000003F92CBFFD3F9
          FEFFB6F3FEFFB3F1FDFFB0F1FEFFB8EDFAFF4895CBFF3B8CC6FF3B8AC6FF3A89
          C5FF3A88C5FF3A87C3FF2A6391C20000000500000000000000004197CEFFE2FC
          FEFFE2FCFEFFE1FCFEFFD4F3FAFF458FBFEC040A0E1B00000006000000060000
          000600000006000000060000000400000001000000000000000031739ABF429A
          D0FF4299D0FF4299D0FF4297CFFF153244590000000200000000000000000000
          0000000000000000000000000000000000000000000000000000000000020000
          0003000000030000000400000003000000020000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000100000002000000080000000C0000000F0000000F0000000D0000
          0007000000040000000700000007000000020000000000000000000000000000
          0001000000050204031C102F2291184A34D31E5C41FF1E5B40FF184732D2112F
          227D0000000E14382995072C1B95000000090000000100000000000000010000
          00080A1C145722674CE723966DFF23B481FF24CA92FF39CF9DFF37886AFF0C21
          185D06100C392A7B5CFB146744FB020C08370000000400000000000000060D25
          1C652E8867FF28B586FF3BDAA8FF59E0B7FF6FE5C2FF5FC6A6FF1F533FBF0000
          00161E523DBF27B786FF1EB07DFF0C3E28BF0000000C00000001040A08223080
          62F62BBA8BFF42DDADFF65CEADFF53AB8EFF3A8B6EFF2F7D60FA07120D360E24
          1B5D2F9671FF28D59EFF28D59EFF1D805AFF051B125C00000005194434903CAC
          88FF2DDAA5FF5ECFAEFF45987CF914362A750409072002050415010302162B73
          57E12ACC98FF29D8A1FF2AD7A0FF26C592FF145438E00001010F2A7258D438C7
          9BFF30DDA9FF5CB699FF194133810000000700000001000000061941328460B8
          9CFF83ECCFFF2BDAA5FF34DBA8FF88EDD0FF479D7FFF0B2A1C77358C6DF250DF
          B6FF61E8C2FF3F9475FF040A081E00000002000000000205040F36896CF4378F
          70FF419A7BFF30DCA8FF38D7A7FF358A6BFF34886AFF317E61EF3B997AFA98ED
          D8FF8DF1D8FF398E6DFF040B0820000000010000000000000002000000070205
          04193F9675FF43E2B3FF4DDAB1FF1D6749F20000000F0000000734856AD398E1
          CFFF9AF4DEFF57A98BFF11382681000000060000000100000001000000051237
          287659B092FF8BF1D7FF6ECEB2FF1E6047D400000006000000002359478A81CF
          BAFFB4F9EAFF82D3BCFF3A8767FB0E352383030C0823030C08230E3222753D8E
          6EF984DFC7FFAAF6E5FF6FB8A0FF1642328C0000000300000000050D0A1855B2
          95F5A5E5D5FFBCFAEDFF94E5D0FF56A386FF2D7B59FF2D7B59FF54A386FF85D4
          BDFFB5F8EAFF9ADAC9FF419477F5030A0719000000010000000000000002173A
          2F5669C6AAFFAAE7D9FFCBFDF3FFC1FBEFFFBAF9ECFFB8F9EBFFBEFBEEFFC7FC
          F2FFA6E5D5FF5CB096FF12302657000000020000000000000000000000000000
          0002122E264453AB90E38AD7C2FFB2EADDFFCEF9F1FFCEF9F1FFB1EADCFF87D4
          BFFF50A78CE40F29204400000002000000000000000000000000000000000000
          0000000000010409070F255D4C813A9076C849B896FC49B795FC399075C8255B
          4A82030907100000000100000000000000000000000000000000000000000000
          0000000000000000000000000001000000020000000200000002000000020000
          0001000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000020000000A170D0738542D1894814626D193502AEA924F2AE87F45
          25D0522C17931209053000000009000000010000000000000000000000000000
          00030201011159311B97A96239FAC58957FFD6A36DFFDDAF75FFDDAF74FFD6A4
          6BFFC58956FFA46137F53C2112730000000F0000000300000000000000020201
          0110744226B9BC7C4DFFDDAE77FFDEB076FFDEAF75FFDEAF75FFDEB074FFDDAF
          75FFDEAF74FFDBAB72FFBD7E4EFF6F3E24B50000001000000002000000085C36
          2095BE8053FFE0B37CFFDFB076FFDEB177FFDFB279FFE0B379FFE0B27AFFE0B2
          79FFDFB279FFDFB277FFDEB077FFC08253FF55321D920000000A190F0932B070
          47FADFB27DFFDFB27AFFE0B37BFFE0B57DFFE1B67EFFE2B67FFFE2B77FFFE2B7
          7FFFE2B67EFFE0B47CFFE0B47BFFDEB079FFB3734AFB130B072F613C2795CD9B
          6FFFE2B780FFE5BD89FFE7C291FFE8C393FFE8C494FFE8C594FFE8C495FFE8C4
          95FFE8C494FFE8C393FFE5BF8CFFE1B77FFFD09C6EFF5434218B935E3DD2DCB3
          83FFE3B781FFBA8659FFA97043FFAB7245FFAC7346FFB0794AFFAB7245FFAD75
          47FFB0784AFFB17A4BFFC29162FFE4B983FFDEB17EFF8E5B3BD0B0744CF2E3BF
          8FFFE4BB84FFA56B3FFFF5EEE9FFFAF6F3FFFAF7F3FFFBF7F4FFFBF7F5FFFAF7
          F4FFFAF7F3FFFAF6F2FFAB7245FFE5BD87FFE5BE8BFFAB714CEEAE764FECE9C9
          A0FFE5BE89FFA56B3FFFE6D9D2FFE7DBD4FFE9DED7FFEAE0D9FFEAE0DAFFEBE1
          DBFFEBE0DBFFEEE5E1FFAA7144FFE7C08CFFEACA9DFFAE764FEE9A6A49D0E9CD
          ACFFEAC796FFB78456FFA56B3FFFA56B3FFFA56B3FFFA56B3FFFA56B3FFFA56B
          3FFFA56B3FFFA56B3FFFB78457FFEACA99FFEBD1ADFF996A49D46E4E3697DDBB
          9DFFEED3A9FFEECFA2FFEED2A5FFF0D6A9FFF1D7ABFFF1D8ADFFF1D8ADFFF1D8
          ADFFF1D6AAFFF0D5A8FFEED2A5FFEFD4A7FFE0C2A2FF6246318F1C140E2BC794
          6CFCF5E8CCFFEFD6ABFFF1D8AEFFF2DAB0FFF3DCB3FFF3DEB4FFF3DEB4FFF3DE
          B4FFF3DCB2FFF1DBB0FFF1D8ADFFF7EACDFFC69470FA1A120D2E000000036F52
          3C92D7B08CFFF8EFD3FFF3E0B9FFF3DFB7FFF4E1B9FFF5E3BBFFF5E2BBFFF5E2
          BBFFF4E1B9FFF4E2BDFFFAF1D5FFD9B390FF664B368C00000006000000010202
          0107906C4EB8D9B38FFFF7EDD3FFF8EED0FFF7EBC9FFF6E8C4FFF6E8C5FFF7EC
          CAFFF8EED0FFF4E8CDFFD7AF8BFF88664AB30202010B00000001000000000000
          00010202010770543F8FCFA078FCE2C4A2FFEBD7B8FFF4E9CDFFF4EACEFFECD8
          B9FFE3C5A3FFC59973F24C392A67000000060000000100000000000000000000
          000000000001000000022019122C6C543E89A47E5FCCC59770F1C19570EEA47E
          60CD6C543F8B16110D2200000003000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000040000000A000000100000001300000015000000140000
          00110000000C0000000500000001000000000000000000000000000000000000
          00030000000C070404263F271F836E4235CA7A4839DE915644FF774436DE693C
          30CE3A2019870704032B00000010000000040000000000000000000000030000
          0011442C2486976253F5BE998EFFD9C5BEFFE0CFCAFFEFE6E3FFDDCAC4FFD3BC
          B5FFB48B7FFF895140F540231B92000000180000000500000001010204145536
          2D9CC5A398FFF2E9E7FFF5EFEDFFBCAEA8FF71574CFF593A2DFF755B4EFFBEAE
          A7FFEBE2DEFFE5D8D3FFB79085FF4E2A21A90101021A000000032F23246BB58D
          80FFF9F5F4FFF7F3F2FFC1B3ADFF826555FFB19A85FFC2AC97FFB09783FF7F62
          51FFC0B0A9FFECE3DFFFECE2DFFFA37467FF28191A750000000A5E4F60E1BCB1
          ACFFF6F3F3FFF8F4F3FF7A5E50FFBEA995FF857162FF3F2A22FF746053FFB8A3
          8FFF806658FFEEE5E2FFECE2DFFFB1A29CFF503F50E40000000D182C4D885C63
          72FFB2B0B0FFF1EEEDFF725242FFDDD1B9FF806D5EFF493229FF493228FFCFC0
          A9FF745545FFEBE3E1FFABA6A3FF505566FF142A55AA0000000A05080F21395F
          9DFA697F9AFF626160FF55443CFFB2A894FFE4E0C1FF584135FF847466FFA498
          87FF58483FFF5F5C5CFF4E6586FF2F5191FF050B173C00000004000000031221
          3B685A7FB7FFA6C5E3FF7990ABFF444D59FF3E4248FF2B2A25FF3C4148FF3E48
          56FF627D9EFF789DC9FF3C609FFD0B172E630000000600000000000000000000
          00030F1B3159315593ED6F91C1FF9BB9DCFFB0CDE9FFCBE8FCFFA7C7E6FF87AA
          D3FF5A7EB3FF284B8BF10A152958000000060000000100000000000000000000
          0000000000020204071112223E6F1C3765B0213F76D0274C91FC1E3C74D01933
          62B40F1F3D750204081700000003000000000000000000000000000000000000
          0000000000000000000000000002000000030000000400000005000000050000
          0004000000020000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00080000001E0000002700000028000000290000002A0000002B0000002C0000
          002C0000002D0000002E0000002F000000250000000A00000000000000000000
          001BB1713EFFB3723FFFB37340FFB47441FFB57643FFB67744FFB77846FFB879
          47FFB87B49FFBA7C49FFBB7E4CFFBC7F4DFF0000002400000000000000000000
          0020B47441FFF7E7D7FFF7E7D8FFF7E8D9FFF8E8DAFFF8E9DBFFF8EADCFFF8EA
          DDFFF9EBDEFFF9ECDFFFF9EDE0FFBE8351FF0000002D00000000000000000000
          001DB67744FFF9EBDDFFF9EBDDFFF9ECDEFFFAEDE0FFFAEDE0FFFAEEE1FFFBEF
          E2FFFBEFE4FFFBF1E5FFFCF1E6FFC18756FF0000002B00000000000000000000
          001BB87B48FFFBEEE1FFFBEEE2FFFCF0E3FFFCF0E5FFFCF1E6FFFDF2E7FFFDF2
          E9FFFDF3E9FFFDF4EBFFFEF4EBFFC48A5AFF0000002900000000000000000000
          0018BB7E4BFFFCEFE3FFFDF3E8FFFEF3E9FFFEF5EAFFFEF5ECFFFEF6ECFFFEF7
          EEFFFFF7EFFFFFF7F0FFFFF9F2FFC78F5EFF0000002600000000000000000000
          0015BE814FFFFBEFE3FFFDF3E9FFFFF6EEFFFFF7EFFFFFF8F0FFFFF8F1FFFFF9
          F1FFFFF9F2FFFFF9F3FFFFFAF4FFCA9362FF0000002400000000000000000000
          0012C18554FFFAEDE0FFFCF1E6FFFEF5ECFFFFF9F1FFFFF9F2FFFFF9F3FFFFFA
          F3FFFFFAF4FFFFFAF5FFFFFAF6FFCD9667FF0000002200000000000000000000
          000FC38958FFF7E8D9FFFAEDE1FFFCF2E8FFFEF7F0FFFFF9F3FFFFFAF5FFFFFA
          F4FFFFFAF5FFFFFBF6FFFFFBF6FFCF9B6CFF0000001F00000000000000000000
          000DC78D5CFFF5E2D1FFF7E8DBFFFAEFE3FFFCF3EBFFFEF7F1FFFFFBF6FFE6E2
          DFFFCFCCC9FFE6E2E0FFFFFCF8FFD29F70FF0000001C00000000000000000000
          000AC99161FFF0DAC6FFF4E1D0FFF6E7DAFFFAEFE4FFFCF4ECFFAC9788FF5536
          24FF9D8D83FFD0CECBFFFFFDFAFFD5A375FF0000001A00000000000000000000
          0005CC9565FFCE9768FFCF9869FFD09A6BFFF7EBDFFFFAF0E7FF6B472EFFC0B9
          B4FF593B29FFCFCDCCFFFFFDFBFFD9A77AFF0000001700000000000000000000
          0001130F0C1EB08B6BD9FFFCF9FFD29E6FFFF5E6D8FFF7EADFFF734C2DFFCDC8
          C3FF644027FFFFFEFBFFFFFEFDFFDBAB7FFF0000001400000000000000000000
          000000000001130F0C1CB08A6CD8D5A274FFF2E0D0FFF4E5D7FF805431FFCCC5
          BFFFF4EFE9FFFEFBF8FFFFFEFCFFDDAF83FF0000001100000000000000000000
          00000000000000000001130F0C1CD8A679FFD8A87BFFDAAA7DFF8E6238FFBB91
          68FFB38D6AFFC99F76FFDFB185FFE0B387FF0000000B00000000000000000000
          00000000000000000000000000000000000200000003000000044F361D869667
          39FF4C351D870000000800000009000000080000000300000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000100000004695E53DF2F2B2664000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000001595149DF2724206D08080841534B43E56D6257F1020202080000
          0000000000000000000000000000000000000000000000000000000000000000
          0001010101074F4843E33D3A37FA3E3E3EFF2E2E2EF3383531F10505052A0101
          010B5B5044DE29241E6300000000000000000000000000000000000000000000
          000217171759515151FD848585FFBFBFBFFF656566FF484849FF1F1F1FE90B0B
          0B68544B40DE615549F101010104000000000000000000000000000000000000
          0003363636AD8F8F90FFB3B4B4FFD0D0D0FF777777FF717071FF616161FF3333
          33FF1C1B1ACC4D453BE00202020E000000020000000000000000000000000404
          040B5C5B5BF6B0B1B1FFB3B4B4FFE5E5E5FF7C7B7CFF7A7A7BFF747475FF6E6D
          6EFF4D4C4DFF202020F108080851010101070000000000000000000000001F1F
          1F4B7B7C7CFFB3B4B4FFCCCDCDFFFDFDFDFF8E8D8EFF7C7B7CFF7C7B7CFF7876
          78FF717172FF4C4C4DFF141314AB0101010D0000000000000000000000004342
          439699999AFFE5E5E5FFD9D8D8FF959594FFADADACFFDBDADAFF7D7C7DFF7C7B
          7CFF7A797AFF6B6B6CFF202121E7020202110000000100000000000000005454
          54B2B1B1B1E5A2A1A1FE8F8F8FFF919090FF919090FF959494FFEEEDEDFFB4B4
          B4FF7B7A7BFF777677FF373737FF080808400000000300000000000000001212
          122447474796707070F47E7E7EFF8F8E8EFF959494FF959494FFF8F8F7FFF8F8
          F8FFF8F8F8FF878787FE565555FF171717A90101010600000000000000000000
          0000000000000707070F3232326F5E5E5EDB747474FF878686FFF5F5F5FFF5F5
          F5FFD4D4D4FF989898FF4B4C4BFF2A2A29ED0000000400000000000000000000
          0000000000000000000000000000000000001F1F1F484B4B4BBA797979FF6E6F
          6EFF414141CF2323237B090909390D0D0DE20000000400000000000000000000
          00000000000000000000000000000000000000000000000000001212123D1616
          16B7000000020000000000000000101017B403030C2F00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000F0F
          0FA00505123A05053B66060664B7050680F30101234700000000000000000000
          0000000000000000000000000000000000000000000000000000060627391111
          7EC7121297F00A0A64A803032E510000060C0000000000000000000000000000
          00000000000000000000000000000000000000000000000000000303131B0707
          324B000002030000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000513322B74C2C
          1CB700000000412112B73E1D0EB7000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000005B3E2CBD5638
          26BD000000004A2A1ABD452414BD000000000000000000000000000000000000
          0000000000000000000002060B15102D58AE0E2952A8010307120000000D0000
          0013000000160000001800000015000000070000000100000000000000000000
          0000000000000A1C30541D4E89EC4D8EC4FF2069AFFF183969E2885032F98649
          2CFF7D4226FF743920FF6C311AFD0B0502340000000200000000000000000308
          0E1517416CAE2E72AFFF449BD5FF74B7E4FF257EC6FF3D6995FFA97150FFE0A9
          7EFFD79868FFCF9061FF7C4629FF45210FD200000007000000000E273C57296A
          A2EC4597CEFF4FAADFFF4BA6DDFF88C2E8FF2780C7FF646D7BFFC38E6BFFE5B6
          92FFE5B692FFE1B28FFFAE7B5CFF5B2E1AFB03010114000000002B76B4FF5BB6
          E2FF5AB6E4FF54B0E2FF50ABDFFF9DCEEDFF2883C9FF8D6D5DFFA16744FF9C60
          3FFF955A39FF8D5233FF86492DFF683A22F9180C0749000000002D7BB9FF66C3
          EBFF60BDE7FF5BB7E5FF56B1E2FFB1DAF1FF2986CCFF2781C8FF247BC4FF2176
          C1FF1F70BDFF1D6BB7FF133571FF3A241988351E1388000000002F80BDFF6CCA
          EEFF67C4EBFF61BEE8FF5CB8E5FFC3E4F5FF2A89CEFF2885CBFF2680C9FF237B
          C6FF2077C4FF1F72C2FF153C7AFF1D140E3C70462FFF311C127C3085C1FF72D0
          F0FF6DCBEDFF67C5EBFF77C8EBFFF3FAFDFFBADAF0FF3E94D2FF2782CAFF247E
          C8FF2279C5FF2075C3FF16407FFF02010103774F38F770462EFF3288C5FF78D7
          F2FF77D3F0FFADE2F4FFDBEFF7FF88CCE3FF81C8E3FFD1E9F5FF74B2DEFF2680
          C9FF247CC6FF2177C4FF184483FF000000000000000000000000338DC7FF7FCE
          EBFFC1E2F2FF8FC1E2FF4297CFFF3892CCFF3490CDFF3994CEFF97D0E8FFA3D0
          EAFF3C8DCEFF237AC6FF1A4A88FF0000000000000000000000000C22303C2669
          96C055ACD9FF7AD9F2FF7EDDF5FF7AD8F2FF78D3F0FF318FCCFF3CA8D5FF54B1
          DAFF98CEE9FF60A6D9FF1C4F8EFF000000000000000000000000000000000000
          00000C212F3C256693C050A8D5FF77D5F0FF7AD6F1FF318FCDFF3CA8D5FF35A3
          D3FF309ED3FF4799CDFF1E5493FF000000000000000000000000000000000000
          000000000000000000000C202E3C24628FC04198CEFF318FCCFF3AA2D2FF2D88
          C3FF2467A3F514395F9906121F33000000000000000000000000000000000000
          0000000000000000000000000000000000000B1E2D3C235D8CC0225E8FC9102C
          44630205080C0000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00030000000C0000001300000015000000150000001600000016000000170000
          00170000001800000018000000170000000F0000000400000000000000000000
          000B2C517EC33C6BACFF3967A7FF3762A2FF345E9EFF335999FF315595FF2E51
          90FF2C4D8CFF2A4A88FF2A4685FF1D305DC70000000F00000000000000000000
          000F4176B5FF8DDDFEFF52C9FEFF4AC4FEFF40BEFDFF44C2FDFF60CFFEFF55CC
          FEFF2BB3FCFF19A8FCFF12A4FBFF294786FF0000001500000000000000000000
          000E437BBBFFA1E5FFFF5ED0FFFF57CCFFFF4BAAD3FF405357FF3C5156FF55AD
          D3FF2DB6FFFF26B0FEFF1DA9FCFF2C4B8AFF0000001400000000000000000000
          000D4680C0FFB4EBFFFF6BD7FFFF63D4FFFF5BCFFFFF48707DFF436D7CFF55CA
          FFFF3ABCFFFF31B9FFFF28B2FCFF2E5090FF0000001300000000000000000000
          000B4884C5FFC5F2FFFF78DDFFFF70D8FFFF69D5FFFF57A3BFFF529FBFFF78D9
          FFFF47C4FFFF3FBFFFFF35BAFDFF305594FF0000001100000000000000000000
          000A4A88C8FFD4F6FFFF81E3FFFF7CDFFFFF74DCFFFF527177FF4F6F76FF7CDB
          FFFF54CBFFFF4CC7FFFF43BFFDFF335B9AFF0000000F00000000000000000000
          00084C8BCBFFE0F9FFFF8CE6FFFF85E4FFFF7EE1FFFF5F8C95FF5B8995FF69D8
          FFFF62D2FFFF5ACFFFFF4FC7FDFF36609FFF0000000E00000000000000000000
          00064C8CCCFFE7FBFFFFE4FAFFFFDFF9FFFFD8F7FFFFD1F4FFFFC8F2FFFFBFEE
          FFFFB4EBFFFFA8E7FFFF99E0FDFF3966A5FF0000000C00000000000000000000
          0003386897C44C8CCCFF4C8CCCFF4B8ACAFF4A87C7FF4884C4FF4681C0FF447D
          BCFF4279B9FF4075B4FF3E70B0FF2C507FC80000000700000000000000000000
          000100000012564B3EFFD0CCC8FF665B4EFF0000001B00000007000000080000
          001F726A5FFFB6AFA9FF4B3F30FF0000001C0000000200000000000000000000
          00000000000D5E5447F3D8D3CFFF6D6256FF16130F5600000008000000091713
          105A6F6557FFB6AEA5FF4B3F31F4000000150000000000000000000000000000
          000000000008585046CBB9B3ACFFA0988FFF3D352BBA1613105616130F583A31
          28BC91877DFF958C81FF3E352ACE0000000E0000000000000000000000000000
          000000000003211F1C4D999187FDC3BEB8FFA19990FF72675BFF6F6557FF9289
          7FFFACA59DFF766C60FE14110E53000000050000000000000000000000000000
          00000000000000000005433F3A839E958CFFBDB7B0FFD9D5D1FFD6D2CDFFAFA8
          A0FF7E7569FF2B261F890000000A000000010000000000000000000000000000
          000000000000000000010000000524211F4A5B554CB96B6256E75B5144E8453D
          34BA1815124E0000000800000001000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000060000
          0016000000180000000800000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000005000000270D24
          44B30E294FC70001033C0000000C000000010000000000000000000000000000
          00000000000500000012000000140000000700000005000000200F2A4AB3387B
          B6FF2169AFFF113668E702060D56000000120000000300000000000000010000
          00070103062A0F2951B90F2952C3010307390000001A112F50A53781BCFF67B4
          E2FF2782CAFF2271B9FF16417CF5050E1D75000000190000000400000007050E
          184119457CE3397FBBFF2069AFFF143A71EC040C1A722464A3FF54B0E2FF7FC1
          E8FF2884CBFF257FC8FF2276C0FF194C8DFD09193295000000110D243C6B2764
          A0F94398D2FF55A8DEFF257FC8FF2174BDFF18498AFD266AA9FF5BB7E5FF9CD1
          EEFF2986CCFF2782CAFF257DC8FF2278C4FF16417FFF0000001B2465A4FF52AC
          DFFF4FAADFFF67B4E2FF2782CAFF247CC7FF206EB8FF2870AEFF61BEE8FFDDF0
          FAFFBEDBF0FF4093D1FF2680C9FF237BC6FF194585FF00000017266AAAFF5AB6
          E4FF54B0E2FF7FC1E8FF2884CBFF257FC8FF2171B9FF2A75B3FFB4E2F5FFB4E6
          F3FF93DAEEFFD6EEF8FF76B3DFFF267FC8FF1A4B89FF000000102870AEFF60BD
          E7FF5BB7E5FF9CD1EEFF2986CCFF2782CAFF2374BDFF3981BCFFAFE4F4FF69CE
          EAFF65CAE7FF65C8E6FF9CDAEEFF99CEE9FF336AA2FF000000092A75B3FF67C4
          EBFF61BEE8FFBBE1F4FF2A89CEFF2885CBFF257CC4FF246FB4FF2E78B4FF5CB9
          DEFF67CCE8FF61C7E6FF59C2E3FF4697C5FB1129426E000000032D7AB9FF6DCB
          EDFF67C5EBFFEBF7FCFFBEDCF0FF4196D3FF2781C9FF237AC3FF216FB7FF256C
          AEFF307EBAFF43A1D4FF225E91D8050F182800000001000000002F7FBCFF73D2
          F0FFB7E6F7FFB4E6F3FF93DAEEFFD6EEF8FF77B5E0FF2881C9FF247BC4FF2072
          BDFF1B4C8BFF1B4B73A9010406090000000000000000000000003083C1FFA1D9
          EFFFB6E8F5FF69CEEAFF65CAE7FF65C8E6FF9CDAEEFF99CEEAFF3A8ECEFF237A
          C6FF1A4A88FF00000009000000000000000000000000000000000C202E3C2463
          90C04CA3D0FF69CBE9FF67CCE8FF61C7E6FF59C2E3FF63C2E4FF81C9E6FF3B88
          C4FF1C4F8EFF0000000500000000000000000000000000000000000000000000
          00000B1F2D3C23608DC03B91C7FF55B9E0FF50B6DEFF3790C6FF24639FF51337
          5C9B06111D370000000100000000000000000000000000000000000000000000
          000000000000000000000B1D2C3C215A88C0215A8CC90F2A42630205080C0000
          0001000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00030000000F0000001D000000260000002A0000002C0000002E0000002F0000
          0031000000320000003100000029000000170000000500000000000000000000
          000D02253E92044879ED045189FF045087FF044E85FF044C84FF044B83FF044B
          82FF044A81FF044980FF043F6FF3021F37A70000001700000000000000000000
          0016055287F41C8DBCFF20B9E4FF1BB2E0FF18ADDCFF15A8D8FF11A4D5FF11A2
          D4FF0FA2D4FF0FA4D6FF11A7D8FF044477F90000002A00000000000000000000
          0018065C93FF2DC3ECFF6D9BA8FF8C8D8CFF8A8A8AFF888888FF858585FF8484
          84FF828282FF628D9BFF13ACDCFF044A81FF0000003000000000000000000000
          0016066097FF38CAEFFF939392FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF828282FF15B1E0FF054B82FF0000002F00000000000000000000
          001307659CFF49D1F3FF969596FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF848585FF17B7E5FF054D85FF0000002D00000000000000000000
          0011086AA0FF5AD8F6FF999999FFFFFFFFFFD0A57EFFCC9F76FFC8996FFFC595
          6AFFFFFFFFFF868686FF1BBEE9FF055087FF0000002A00000000000000000000
          000E0970A6FF73E0F9FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF8A8A8AFF20C4EEFF05538AFF0000002800000000000000000000
          000B0A76ACFF8EE8FCFFA0A09FFFFFFFFFFFD5AB86FFD1A67FFFCEA179FFCC9F
          76FFFDFDFDFF8B8B8BFF28C9F2FF05568DFF0000002500000000000000000000
          00080B7CB2FFA7EEFDFFA2A2A2FFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFE9E9
          E9FFE7E7E7FF8B8A8AFF2FCDF1FF065990FF0000002100000000000000000000
          00060C84B7FFBCF3FEFFA4A4A4FFFFFFFFFFF7F7F7FFDADADAFFC8C8C8FFCECE
          CEFFDBDBDBFF8B8C8CFF38CDEEFF085D93FF0000001E00000000000000000000
          00030E8BBEFFCFF7FFFFA7A5A7FFD4D4D4FFAEAEAEFFAAAAAAFFB6B6B6FFC4C4
          C4FFD2D2D2FF8B8B8BFF3FCCEBFF0B6296FF0000001A00000000000000000000
          00021092C4FFDFFAFFFFC1864BFFBE8146FFBC7D40FFB9793BFFB67636FFB472
          33FFB27030FFB06D2EFF46D3F1FF08679DFF0000001500000000000000000000
          00010F87B2E17EC8E3FFE9C190FFE6BA87FFE2B47EFFDFAE75FFDCA86DFFD9A2
          67FFD69E60FFBA7A3DFF2CA8D3FF07608FE60000000E00000000000000000000
          000008475C71108AB5E11199CAFF1596C6FFDCCBAAFFEFCB9EFFECC595FFD9BA
          8FFF117FB3FF0C7AAFFF0A6896E504324A7E0000000600000000000000000000
          00000000000000000000000000010000000272685873FCE5C2FFEFD7B3F77763
          4C8A000000060000000700000007000000040000000100000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000100000009000000160000001000000004000000000000
          000000000000000000030000000B0000000B0000000400000000000000000000
          000000000001000000090F0804485C3119ED2B160B9500000019000000030000
          0000000000020305091F213B63D01A3153B40103041900000003000000000000
          000100000007110A0541724427F0A96A3DFF844D29FF2B160B97000000190000
          00030000000514243C86152741930F1D3177182F4CA80000000A000000000000
          0005130B063B7A4D2CEEB17040FFB06F3EFFAD6C3DFF824D29FF2B170B960000
          00180000000A203D65D4080E183F03050924254675EF0000000E00000004130C
          073383532FECBD845AFFBE906FFFC09679FFAA6F45FFA9693BFF834D29FF2B16
          0B9501020323264777FA0001010E0204071B274676F20000000D150D072D8C5C
          35EAC67F4AFFC79B7CFFFCFBFAFFEFE7E1FFEDE4DDFFB3825EFFAB6C3BFF834D
          29FF291A119C203F6BF20000000C09121D461F3A60C800000008825330DDD396
          67FFD08F5CFFD5B8A3FFF0E7E2FF9F6035FFE5D8CFFFC9AA93FFA96A3AFFAC6D
          3DFF7D4B2EFF22324DDE0000001D182D4CA0101E326E000000043A261564B178
          4BFDD69869FFD0A788FFEDE0D7FFAE7045FFFCFAF9FFB68A69FFD7BFAEFFA768
          3AFFAC6C3DFF824C29FF2A1C19A124446FE50102030F00000001000000013A26
          1664AF774AFDD49767FFC78756FFCDA589FFF0E7E2FF9A5D33FFF7F4F1FFD0B4
          A0FFB06E3DFFAD6D3DFF4F5161FF2C2D38BA0000001000000001000000000000
          000139261563B0784BFDD99A6BFFC89168FFE8DBD1FFEFE7E1FFFDFCFCFFC296
          7AFFB47B52FF957A6DFF606476FF6A3A1EFF0603022700000001000000000000
          0000000000013A261562B0774AFDD59768FFC89369FFCA9E7EFFC49471FFAB76
          51FF815234FF5F6880FFB78662FF6F3E20FF0603022700000001000000000000
          000000000000000000003A261562B0774AFDD99B6CFFD4915EFFCC834BFF8D57
          31FF281910677F5439FFC18252FF744223FF0603022300000001000000000000
          00000000000000000000000000003A261561B0784BFDDD9E6EFFDB9762FFB271
          40FF8E5730FFA8693BFFC27C46FF794726FF0503021900000001000000000000
          0000000000000000000000000000000000003A261560B0784BFDDD9E6EFFDE9F
          6FFFDB9E6EFFD69A6AFF9F6942FF2E1B0F6B0000000500000000000000000000
          000000000000000000000000000000000000000000003A251560946036FC935E
          35FF8E5A32FF88542EFC321F1166000000040000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000010000000100000001000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000714F3AB79B6A4DFF99684BFF976549FF956346FF946044FF925D42FF915B
          3FFF8F5A3DFF8D583CFF8C563AFF643C28B70000000000000000000000000000
          00009F7153FFC19B71FFCCA777FFC9A270FFC69C69FFC39763FFC0945DFFBE8F
          57FFBB8C52FFBA894EFFAC7946FF8D563AFF0000000000000000000000000000
          0000A17356FFD2B285FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFB9884EFF8D573CFF0000000000000000000000000000
          0000A37658FFD6B88CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFBB8C53FF8F5A3DFF0000000000000000000000000000
          0000A6795CFFDABD94FFFFFFFFFFFFFFFFFFFFFFFFFF8B8BD3FFB6B6E4FFFFFF
          FFFFFFFFFFFFFFFFFFFFBE8F57FF915B3FFF0000000000000000000000000000
          0000A97C5EFFDDC29BFFFFFFFFFFFFFFFFFF8B8BD3FF1A1AA9FF3232B2FFF4F4
          FBFFFFFFFFFFFFFFFFFFC1935DFF925E41FF0000000000000000000000000000
          0000AB7F61FFDFC7A2FFFFFFFFFF8B8BD3FF1A1AA9FF1A1AA9FF1A1AA9FF7878
          CAFFF7F7F7FFFFFFFFFFC39863FF936044FF0000000000000000000000000000
          0000AC8263FFE3CCA8FFFFFFFFFF8E8ED5FF5353BEFFC9C9EBFF8585CCFF1C1C
          AAFFC2C2DFFFFFFFFFFFC69D69FF956345FF0000000000000000000000000000
          0000AF8567FFE5D1AEFFFFFFFFFFFFFFFFFFFFFFFFFFE4E4E4FFD0D0D0FF7A7A
          C0FF3F3FB3FFFCFCFEFFC9A270FF976549FF0000000000000000000000000000
          0000B08869FFE7D5B3FFFFFFFFFFFFFFFFFFDADADAFFBBBBBBFFC2C2C2FFC8C8
          C8FF7676BDFF9999D9FFCCA777FF99684BFF0000000000000000000000000000
          0000B38A6CFFEAD9B8FFFFFFFFFFD3D3D3FFABABABFFB0B0B0FFB5B5B5FFBBBB
          BBFFC2C2C2FF9999D9FFBC9D83FF9C6A4EFF0000000000000000000000000000
          0000B48D6FFFEBDBBDFFBDBDBDFF767474FF6E6D6DFF646764FF5F5E5EFF5858
          58FF535353FFA6A6A6FFAD948CFF9D6E50FF0000000000000000000000000000
          0000B79071FFDFC9ABFF868686FF7D7D7DFFB4B5B4FFAAABAAFFA0A0A0FF9595
          95FF585858FF545353FFC8A57FFFA07053FF0000000000000000000000000000
          0000896C56BDB79071FFB58D6EFFB38B6CFF7D7D7CFFB4B5B4FFAAABAAFF6464
          64FFA87C5EFFA6795BFFA47659FF785540BD0000000000000000000000000000
          0000000000000000000000000000000000005E5B5EB27D7C7DFF747674FF4D4C
          4CB2000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000040000
          00150000002B0000003300000033000000410B245FFF071D55FF020E2EC10000
          0144000000380000003000000018000000050000000000000000000000140302
          319B07047AFF070377FF070374FF040165FF102C69FF7CCDFAFF4586BAFF0310
          4EFF010057FF010057FF010023A4000000180000000000000000000000240804
          75F86368C8FF2C33B9FF2830B6FF2128A5FF142B76FF558BBBFF7BCFF9FF4585
          BBFF04175DFF051788FF01004EFA000000340000000400000001000000240705
          76F86368C8FF363DBDFF2931B7FF2129AFFF182497FF122872FF558CBBFF7ACD
          FAFF4586BAFF051950FF021042FF000A2BCE0004126C000000060000001C0504
          62E05457BBFF4A50C3FF282FB8FF242BB4FF1D29AAFF152195FF112771FF548B
          BCFF7ACDF9FF5CAEE1FF56B3EDFF3179B2FF0F3162FA000412690000000F0303
          3CA33737A3FF666BCDFF3E44BFFF2B2F96FF31326CFF2D2F68FF1A2172FF1333
          73FF75BAE4FF7BCDFAFF6AC4F8FF5BBDF6FF3079B2FF000A29BD000000040000
          08310B0971EC484AB1FF696ECDFF403F73FF7EA6C7FF5B80AAFF27295BFF1B3D
          7DFF89CFF4FF89D4FBFF4278ACFF3870A5FF55B3EDFF020F3FF6000000000000
          00070000052D050252C618178AFF32437BFF305790FF294D88FF1F2B5FFF1C36
          79FF68A1CDFF92D9FCFF4C81B2FF4379ACFF4587BBFF031036BB000000000000
          0000000000040000001E182749A76483AFFF7FA3C6FF4B83B4FF204780FF1023
          4FDC3A659EFC68A1CDFF89CFF4FF5C95C4FF23497FFA030B2064000000000000
          000000000000000000112A466ECCB0C1D8FF96CCECFF70AFD6FF4275A8FF091C
          44D10E1C358B183360C81A3C79F70F2754C10611286700000002000000000000
          0000000000000001041E1A346EF9E8EDF4FFA7DDF6FF84C2E5FF6099C3FF102E
          6AF10003073A0000000D0000000C000000070000000200000000000000000000
          000000000000020D2E800B2162FEE4E9F1FFCAEBFBFF96D3F1FF689FC6FF1435
          6FF102122CA10000000000000000000000000000000000000000000000000000
          000000000000031444AE486C9EFF203570FF69789FFF97B9D4FF7298BEFF0B25
          52EB041634B40000000000000000000000000000000000000000000000000000
          00000000000003123B92446699FF5A82B0FF355990FF152D68FF2E497BFE0723
          52FF031229880000000000000000000000000000000000000000000000000000
          00000000000001051128173273F7597EACFF648DB8FF4E76A5FF0B2059FC0411
          28810002040E0000000000000000000000000000000000000000000000000000
          00000000000000000000020A214F04164CC1041A5BF303144DD901071C580000
          0001000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000000000000000000000000000000000007E5446B7B074
          62FFAF7461FFAF7460FFAE735FFFAE725FFFAD715EFFAD715EFFAD715EFFAC70
          5CFFAC705CFFAC6F5BFFAC6F5BFFAB6F5BFFAB6E5AFF7B4F41B7B67E6CFFFBF6
          F3FFFAF5F2FFFAF5F2FFFAF5F2FFFAF5F1FFFAF4F1FFFAF4F1FFFAF4F1FFF9F4
          F0FFF9F4F0FFF9F3F0FFF8F3EFFFF9F3EFFFF8F2EEFFB37968FFB77F6FFFFBF7
          F4FF30599FFF2F579EFF2D559DFF2C549BFF29539AFF285199FF274F97FF254D
          96FF244C95FF234B94FF8B9ABCFFF5EDE7FFF9F4F0FFB47B6AFFB88171FFFBF8
          F5FF355FA4FF7FC4F4FF73BEF2FF71BDF2FF71BDF2FF6FBCF1FF6FBDF2FF6EBC
          F1FF6CBCF0FF86CAF4FF2D58A1FF8C9DBFFFFAF4F2FFB47C6BFFB98472FFFCF9
          F7FF3A65A9FF85C6F5FF76BFF4FF75BEF3FF74BEF3FF73BEF2FF71BDF2FF71BD
          F2FF6FBDF1FF8DCDF5FF3463AAFF234A93FFFAF6F3FFB67F6DFFBB8674FFFDFA
          F8FF3F6BADFF8BC8F6FF7AC0F5FF79BFF5FF78BFF4FF77BFF4FF76BEF4FF74BE
          F3FF72BDF3FFC2E7FBFF3463AAFF254C95FFFAF7F5FFB7806FFFBC8877FFFDFB
          F9FF4370B1FF90CAF7FFB3DEFAFFB2DEFAFF7CC1F5FF7AC0F5FF79BFF5FF78BF
          F4FFAEDCF9FF7985CCFF3E52A8FF275098FFFBF8F6FFB98271FFBF8C7AFFFEFC
          FBFF4673B4FFC2E4FCFF505BB4FF505BB4FFB4DEFAFF7EC1F6FF7DC1F5FFB1DD
          FAFF4E5AB4FF8F9CE9FF4741A7FF2A539AFFFCFAF9FFBB8675FFBF8C7AFFFEFC
          FBFF4876B6FF6A73C2FF6474DDFF6374DDFF505BB4FFB5DEFBFFB5DEFBFF4F5B
          B4FF6172DDFF94A1EAFF4741A7FF4B47A3FFFCFAF9FFBB8675FFC08D7DFFFEFD
          FCFF4876B6FF7E8DE4FF6475DEFF6475DDFF6474DDFF515BB4FF505BB4FF6374
          DDFF6373DDFF9AA6EBFF4741A7FF4E4AA5FFFDFBFAFFBC8877FFC28F7EFFFEFD
          FDFF5957AFFF8090E4FF6576DDFF6676DEFF6576DEFF6575DDFF6475DEFF6475
          DDFF6474DDFF9DAAECFF4741A7FF504CA7FFFDFCFAFFBE8A79FFC39281FFFEFE
          FDFF5C5AB1FFB4C1F1FFB4C1F1FFB4C1F1FFB4C1F1FFB4C1F1FFB4C1F1FFB4C1
          F1FFB4C1F1FFB4C1F1FF4741A7FF524FA9FFFDFCFCFFBF8D7BFFC49483FFFFFE
          FEFFADABD5FF7A81CFFF96A6EAFF95A5EAFF95A4E9FF93A4E9FF92A2E9FF92A1
          E8FF90A0E8FF8FA0E8FF6B70C7FF5451ABFFFEFDFCFFC08F7EFFC59584FFFFFE
          FEFFFCF8F7FFAEACD6FF5F5EB4FF5E5CB4FF5D5BB3FF5C5AB2FF5B59B1FF5A58
          B1FF5957B0FF5856AFFF5856AEFF5755AEFFFEFDFDFFC2907FFFC69786FFFFFF
          FEFFFFFFFEFFFFFEFEFFFFFFFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFE
          FEFFFEFEFEFFFEFEFEFFFFFEFEFFFFFEFDFFFEFEFDFFC39281FF997A6EBDCFA4
          94FFCFA393FFCEA393FFCEA393FFCEA292FFCEA292FFCDA292FFCDA292FFCDA1
          91FFCDA090FFCCA090FFCC9F8FFFCB9E8EFFCB9E8EFF967469BD}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000000000000000000000000000000000007E5446B7B074
          62FFAF7461FFAF7460FFAE735FFFAE725FFFAD715EFFAD715EFFAD715EFFAC70
          5CFFAC705CFFAC6F5BFFAC6F5BFFAB6F5BFFAB6E5AFF7B4F41B7B67E6CFFFBF6
          F3FFFAF5F2FFFAF5F2FFFAF5F2FFFAF5F1FFFAF4F1FFFAF4F1FFFAF4F1FFF9F4
          F0FFF9F4F0FFF9F3F0FFF8F3EFFFF9F3EFFFF8F2EEFFB37968FFB77F6FFFFBF7
          F4FFF7EFE9FF8982BBFFF6EEE9FFF6EEE9FFF6EEE9FFF7EEE8FF8881B9FF1C16
          8BFF1C1589FF1A1589FF7E799FFFF5EDE7FFF9F4F0FFB47B6AFFB88171FFFBF8
          F5FFF7F0EBFF3D35A7FF8A83BCFFF7F0EAFFF7EFEAFF8982BAFF3A32A4FF948B
          DBFF554BBCFF544CBCFF171376FFF6EEE9FFFAF4F2FFB47C6BFFB98472FFFCF9
          F7FFF8F0ECFFAAA2D6FF3D36A7FF8A84BCFF8A83BCFF3B35A6FF958EDCFF574F
          BDFFA79FD3FFF7EFEAFFF6EFE9FFF6EFEAFFFAF6F3FFB67F6DFFBB8674FFFDFA
          F8FFF8F1EDFFF8F2EDFFAAA4D7FF3E36A9FF3E36A9FF9790DDFF5950BFFFA9A1
          D5FFF8F0EBFFF8F0EBFFF7F0EBFFF7F0EAFFFAF7F5FFB7806FFFBC8877FFFDFB
          F9FFF9F3EFFFF9F2EEFFF9F2EDFFABA4D8FF9993DEFF5B52C0FFAAA3D7FFF8F1
          ECFFF8F1ECFFF8F1ECFFF7F1ECFFF7F0ECFFFBF8F6FFB98271FFBF8C7AFFFEFC
          FBFFFAF5F1FFFAF4F0FFF9F4F0FFF9F4F0FFACA6D9FFACA5D9FFF9F4F0FFF9F3
          EFFFF9F3EEFFF9F3EEFFF9F2EEFFF9F2EEFFFCFAF9FFBB8675FFBF8C7AFFFEFC
          FBFFFAF5F1FFCEA28BFFF9F4F0FFF9F4F0FFF9F4EFFFF9F4F0FFCBA089FFCB9F
          88FFF9F3EEFFF9F3EEFFF9F2EEFFF9F2EEFFFCFAF9FFBB8675FFC08D7DFFFEFD
          FCFFFAF5F2FFB9744AFFCEA48DFFFAF5F1FFFAF4F1FFCDA18BFFB56F46FFB56F
          45FFCCA08AFFF9F4F0FFF9F3EFFFF9F3F0FFFDFBFAFFBC8877FFC28F7EFFFEFD
          FDFFFBF6F3FFE4C7B0FFBA774CFFCFA68FFFCEA48EFFB87249FFE4C0A1FFCC8F
          66FFB77047FFCDA28AFFF9F4F1FFFAF4F0FFFDFCFAFFBE8A79FFC39281FFFEFE
          FDFFFBF7F4FFFAF7F4FFE5C9B2FFBC784EFFBC774DFFE5C3A5FFCD936AFFE3C5
          AEFFE3C5ADFFB87148FFB78C7EFFF9F6F2FFFDFCFCFFBF8D7BFFC49483FFFFFE
          FEFFFBF8F5FFFCF8F5FFFBF7F5FFE6CAB4FFE6C6A9FFD0986FFFE5C8B1FFFBF6
          F4FFFAF7F3FFE4C5AFFF944725FFFAF6F3FFFEFDFCFFC08F7EFFC59584FFFFFE
          FEFFFCF8F7FFFBF8F6FFFCF8F6FFFBF8F5FFE6CBB5FFE6CBB4FFFBF8F5FFFCF8
          F5FFFBF8F5FFFBF7F4FFD6B09AFFFBF7F4FFFEFDFDFFC2907FFFC69786FFFFFF
          FEFFFFFFFEFFFFFEFEFFFFFFFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFE
          FEFFFEFEFEFFFEFEFEFFFFFEFEFFFFFEFDFFFEFEFDFFC39281FF997A6EBDCFA4
          94FFCFA393FFCEA393FFCEA393FFCEA292FFCEA292FFCDA292FFCDA292FFCDA1
          91FFCDA090FFCCA090FFCC9F8FFFCB9E8EFFCB9E8EFF967469BD}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000000000000000000000000000000000007E5446B7B074
          62FFAF7461FFAF7460FFAE735FFFAE725FFFAD715EFFAD715EFFAD715EFFAC70
          5CFFAC705CFFAC6F5BFFAC6F5BFFAB6F5BFFAB6E5AFF7B4F41B7B67E6CFFFBF6
          F3FFFAF5F2FFFAF5F2FFFAF5F2FFFAF5F1FFFAF4F1FFFAF4F1FFFAF4F1FFF9F4
          F0FFF9F4F0FFF9F3F0FFF8F3EFFFF9F3EFFFF8F2EEFFB37968FFB77F6FFFFBF7
          F4FF214790FF204690FF1F4690FF1F4690FF1E4590FF1E458FFF1E448EFF1E44
          8EFF1D438DFF1D438DFF8897B9FFF5EDE7FFF9F4F0FFB47B6AFFB88171FFFBF8
          F5FF214791FFA5D4FBFF88C4F9FF87C4FAFF87C3F9FF86C2F9FF84C2F9FF84C1
          F9FF83C1F9FF9CCFFBFF2B559DFF8897BBFFFAF4F2FFB47C6BFFB98472FFFCF9
          F7FF214892FFBFE2FCFFA6D5FBFFA5D4FBFFA4D4FBFF8BC6FAFF8AC5FAFF88C5
          FAFF87C4F9FFB5DDFCFF3867ADFF1C428EFFFAF6F3FFB67F6DFFBB8674FFFDFA
          F8FF5452ACFF7B7ED0FF5155BCFF5155BCFF5B69C3FFA7D6FBFF8FC8FAFF8EC8
          FAFFA5D4FBFF7886D0FF475BB0FF1C438EFFFAF7F5FFB7806FFFBC8877FFFDFB
          F9FF5957AFFF90A0EBFF6778E0FF6678E0FF6678E0FF5C6AC3FFABD8FCFFABD8
          FCFF5B69C3FF8392E8FF5752B3FF344598FFFBF8F6FFB98271FFBF8C7AFFFEFC
          FBFF5D5BB3FF95A2EBFF687AE0FF687AE0FF6779E0FF6779E0FF5E6BC3FF5D6B
          C3FF6677E0FF8393E8FF5A55B5FF504DA7FFFCFAF9FFBB8675FFBF8C7AFFFEFC
          FBFF615FB6FF98A7EDFF94ABF0FFC2D1F7FF697AE0FF687AE0FF6779E0FF6779
          E0FF6779E0FF8594E8FF5C58B7FF5451AAFFFCFAF9FFBB8675FFC08D7DFFFEFD
          FCFF6464BAFFBBCBF6FFDCECFFFFBEDAFFFF6B76C4FF555DBDFF697BE0FF697A
          E0FF6879E0FF94AAF0FF8F9BDCFF5755AEFFFDFBFAFFBC8877FFC28F7EFFFEFD
          FDFF6868BDFFDCECFFFFBEDAFFFF818FCFFFA19EC9FFA09EC8FF575FBFFF697B
          E1FF94ABF0FFDCECFFFFBEDAFFFF5C5AB2FFFDFCFAFFBE8A79FFC39281FFFEFE
          FDFFA5A3CFFF8492D2FF8492D2FFA4A2CDFFFAF7F4FFFAF6F3FFA29FCBFF6D78
          C8FFDCECFFFFBEDAFFFF7F8DCDFF9E9DC7FFFDFCFCFFBF8D7BFFC49483FFFFFE
          FEFFFBF8F5FFA7A4D0FFA6A3D0FFFBF7F5FFFBF7F5FFFBF7F4FFFBF7F4FFA3A1
          CCFF8290D0FF828FD0FFA19FCAFFFAF6F3FFFEFDFCFFC08F7EFFC59584FFFFFE
          FEFFFCF8F7FFFBF8F6FFFCF8F6FFFBF8F5FFFBF8F6FFFBF8F5FFFBF8F5FFFCF8
          F5FFA5A3CEFFA4A2CEFFFBF7F4FFFBF7F4FFFEFDFDFFC2907FFFC69786FFFFFF
          FEFFFFFFFEFFFFFEFEFFFFFFFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFE
          FEFFFEFEFEFFFEFEFEFFFFFEFEFFFFFEFDFFFEFEFDFFC39281FF997A6EBDCFA4
          94FFCFA393FFCEA393FFCEA393FFCEA292FFCEA292FFCDA292FFCDA292FFCDA1
          91FFCDA090FFCCA090FFCC9F8FFFCB9E8EFFCB9E8EFF967469BD}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000020000
          00063D29238F714C43FF311F1A8F000000070000000200000001000000000000
          000000000000000000000000000000000000000000010D090723201613552519
          1565715045F3C2B0A7FF5E3F35F3231713671D1310570B070625000000000000
          00010000000300000007000000090000000A0000000D523B32BA987F76FF8467
          5DFFBFAEA4FFE2D9D2FFC6B7B1FF7D5F56FF896D63FF472F28B9000000010000
          00081222385F21426CAE284F85D23060A1FA7A98C3FF8D8997FEA48A80FFECE7
          E3FFBDA69CFF9E7E70FFC3AFA6FFEAE2DEFF997C72FF3828247900000006274B
          76B56295C5FF9CC0DFFFC7DCEEFFA1E3F8FF8FDEF3FFA9D9EDFF8C6C5FFFEAE4
          E0FF8B6B5FFF868793E78B6B60FFE7DFD9FF765549FC00000008000000083C72
          B1FFB9EAF9FFD3F0FBFFEBF9FFFFA4E6FAFFA1E3F5FF9EA8ACFFAC9388FFEFEA
          E6FFB19E98FF755349FFAC978FFFE9E1DCFFA1887EFF3A2A257A000000083F75
          B3FFB9EAF9FFD3F0FBFFEBF9FFFFA4E6FAFFA1E3F5FFA19894FFB7A095FFA88A
          7FFFD9CDC7FFF6F3F1FFD4C5BEFFA4877AFFB1998EFF675045B600000007437A
          B6FFB9EAF9FFD3F0FBFFEBF9FFFFA4E6FAFFA2E4F6FFABD2E3FFA0AFC4FF9EAB
          BFFFA08276FFE2D8D2FF8F6E61F13127225430252151120E0C2100000006467E
          B9FFB9EAF9FFD3F0FBFFEBF9FFFFA4E6FAFF77D8F2FF74C7EBFF629ED9FF99BD
          E5FFA7A9AFFFA28273FF53413A8B000000010000000000000000000000064883
          BCFFB9EAF9FFD3F0FBFFEBF9FFFFA4E6FAFF6ED5F1FF5ABCE7FF448BD2FF72A5
          DCFFACD6F3FF9DB7D7FF00000007000000000000000000000000000000054C86
          C0FFB9EAF9FFD3F0FBFFEBF9FFFFA4E6FAFF6ED5F1FF5ABCE7FF438BD2FF3F84
          CFFF58ACE6FF3D72B1FF00000006000000000000000000000000000000054F8B
          C2FFB9EAF9FFD3F0FBFFEBF9FFFFA4E6FAFF6ED5F1FF5ABCE7FF438BD2FF3F84
          CFFF58ACE6FF4077B4FF0000000600000000000000000000000000000004518E
          C4FFC8EFFBFFE9FAFFFFE5F9FFFFDDF7FFFFD6F4FEFFCBF0FCFFABD9F4FF8FC7
          EDFF76C0EDFF437BB7FF00000005000000000000000000000000000000035493
          C7FFE8FAFFFFE5F9FFFFDFF7FFFFD8F4FEFFCFF2FEFFC6EEFEFFBDEBFDFFB3E8
          FCFFABE5FBFF4780BAFF00000004000000000000000000000000000000023F6D
          93BC82B3DAFFA2CAE6FFB0D6EDFFBAE1F3FFC8EFFEFFABDAF2FF95CBEAFF82BC
          E1FF67A2D1FF38638EC200000002000000000000000000000000000000000000
          00021B2F3E51305370903C678CB34579A5D45491C6FF4377A2D4386388B42B4D
          6B90182A3B510000000300000001000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0002000000090000000E0000000F0000000F0000001000000010000000110000
          0011000000100000000B00000003000000000000000000000000000000000000
          00087C5345C0AD725EFFAC725DFFAC715DFFAC6F5BFFAB705CFFAB705CFFAB6E
          5CFFAB6E5AFF7A4E41C30000000B000000000000000000000000000000000000
          000BAF7462FFFDFBF9FFFBF6F2FFFBF5F2FFFAF5F1FFFBF4EFFFF9F3EEFFF9F2
          EEFFFAF2ECFFAC715DFF0000000F000000000000000000000000000000000000
          000BB17964FFFDFBFAFFF7EEE7FFF8EDE7FFF7EDE7FFF7EDE6FFF6ECE5FFF6EC
          E5FFFAF2EEFFAE7260FF01010120010101100101010B00000003000000000000
          000BB37C69FFFDFCFBFFF8EFE8FFF7EEE8FFF7EEE8FFF8EEE7FFF7EEE7FFF7EC
          E6FFFAF3EFFFB07863FFC19D92FFB57D6AFF815A4EC30101010B000000000000
          000AB57F6CFFFEFCFBFFF9F0EAFFF8F0EAFFF8EFE9FFF8EFE8FFF8EEE9FFF8EE
          E7FFFBF5F1FFB27A66FFEBE6E2FFFAF3EDFFB6806DFF0101010F000000000000
          0009B98270FFFEFDFCFFF9F2EDFFF9F2EDFFF9F0EBFFF9F0EAFFF8F0EAFFF8F0
          E9FFFBF6F3FFB37D6AFFE9E1DAFFFAF3EFFFB88170FF01010110000000000000
          0008BB8775FFFEFDFDFFFAF3EFFFFAF4EEFFFAF3EEFFFAF1ECFFF9F1EBFFF9F0
          EBFFFCF8F5FFB6806DFFEAE1DBFFFAF4F0FFB98673FF0101010F000000000000
          0007BF8B78FFFEFEFDFFFBF5F1FFFBF5F0FFFBF4F0FFFAF3EFFFFAF3EFFFF9F3
          EDFFFCF9F7FFBA8471FFECE4DDFFFBF5F2FFBB8876FF0101010E000000000000
          0007C18E7EFFFEFEFDFFFAF5F3FFFBF6F2FFFBF5F1FFFBF5F0FFFBF5F0FFFAF4
          EFFFFDFAF8FFBC8978FFEDE7E0FFFBF6F4FFBC8B7AFF0101010D000000000000
          0006C49382FFFEFEFEFFFBF6F4FFFBF6F4FFFCF6F3FFFCF6F3FFFCF4F2FFFBF5
          F1FFFDFBF9FFBF8C7CFFEFE8E3FFFCF8F5FFBF8E7CFF0101010D000000000000
          0005C49785FFFFFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFDFFFEFDFDFFFEFD
          FDFFFEFDFCFFC2907FFFF0EBE6FFFCF9F7FFC29180FF0101010C000000000000
          0003967265C0C89988FFC99887FFC79887FFC59786FFC79785FFC79784FFC596
          84FFC59683FFCDA79AFFF4EFEAFFFDFAF8FFC49686FF0101010B000000000000
          000100000003000000040000000BD8BBB0FFF8F8F8FFF5F0EFFFF5F0EFFFF5EF
          EDFFF5EFEDFFF7F0EEFFFAF4F1FFFDFBF9FFC7998AFF0000000A000000000000
          0000000000000000000000000005CCA392FFFFFEFEFFFEFEFEFFFEFEFEFFFEFE
          FEFFFEFEFDFFFEFDFDFFFEFDFDFFFEFDFCFFCA9D8DFF00000009000000000000
          00000000000000000000000000039A7B6FC0CEA495FFCFA494FFCDA494FFCCA3
          93FFCDA392FFCDA391FFCCA291FFCCA290FF97776BC200000006}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000020000000A00000010000000090000000200000000000000000000
          00020000000A000000120000000C000000030000000000000000000000000000
          00020000000F0F0742921D0F7EEF0603347A0000000E00000002000000020000
          000F0804347C1D0F7EF00F084194000000120000000200000000000000000000
          0008120B47923233AFFF3648CCFF1D1EA5FF0603357A0000000F0000000F0703
          357C1F20A5FF3747CCFF2D2FAEFF120B46950000000B00000000000000000000
          000C281C8DF1596CD8FF3B51D3FF3A4FD2FF1E22A6FF0602347D0502357E2022
          A6FF3A50D3FF3A50D3FF4C5FD4FF291D8CF10000001000000000000000000000
          0006130F3C734D4FBAFF667EE0FF415AD6FF415AD7FF1F24A7FF2529A8FF415A
          D7FF415AD7FF5B72DEFF484AB8FF130F3C790000000900000000000000000000
          00010000000A16123F73585CC1FF758DE6FF4A64DBFF4A65DBFF4A65DBFF4A64
          DBFF6983E3FF5356C0FF16123F780000000C0000000200000000000000000000
          0000000000010000000A191643755D63C7FF6783E5FF5774E2FF5774E2FF5774
          E2FF565CC6FF1916437A0000000D000000020000000000000000000000000000
          00000000000100000009100E3D734A50BEFF7492EBFF6383E7FF6483E7FF6383
          E7FF3840B6FF0B0839780000000C000000020000000000000000000000000000
          0001000000071413416E555CC5FF85A1EFFF7897EDFF9CB6F4FF9DB7F5FF7997
          EEFF7796EDFF414ABCFF0E0C3C730000000A0000000100000000000000000000
          00041818456B636CCFFF93AFF3FF83A1F1FFA6BFF7FF676DCAFF7E87DDFFAFC7
          F8FF83A3F2FF83A1F1FF5058C4FF121040710000000600000000000000000000
          00065759C3EFAFC6F6FF8EADF4FFABC4F8FF6F76D0FF1817456F24244F70868E
          E1FFB5CCF9FF8DACF4FFA1B8F4FF5758C3EF0000000900000000000000000000
          000331326B8695A0EAFFC0D3F9FF7880D7FF1C1C496B00000006000000072527
          526C8B93E6FFC1D3F9FF949EE9FF303168870000000500000000000000000000
          00010000000431336B825E62CBEC1F204D680000000500000001000000010000
          00052728536B5E62CBEC31326883000000070000000100000000000000000000
          0000000000000000000200000004000000020000000100000000000000000000
          0001000000030000000500000004000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000000000001F421C11FF30140DEC190A06B30304
          075F0000001B0000000500000000000000000000000000000000000000000000
          00000000000000000000000000000000001E663C2BE7B9C7D2FF7889A2FF2441
          82FF051033AF0000002100000005000000000000000000000000000000000000
          0002000000090000000E0000000F0000002041261BAE879AB2FFC8E3F5FF1F66
          B6FF2B6BA8FF051236AD0000001F000000040000000000000000000000000000
          00088C6657C0C38C7AFFC38C79FFCBA395FFA89894FF488BC3FFDEFEFDFF51B4
          E3FF1F68B7FF3173AEFF061538AA0000001C0000000400000000000000000000
          000CC5917EFFFDFBFAFFFCF8F6FFFAF7F5FFECEAE9FF7CA3BFFF479FD2FFDEFE
          FDFF59BFE9FF216BB9FF367BB3FF07173AA70000001A00000004000000000000
          000CC79481FFFEFBFAFFF9F0EAFFF8F0EAFFF7F0EBFFE8E4E1FF7EA4BFFF4BA5
          D5FFDEFEFDFF61CAEFFF246FBCFF3B83B9FF081A3DA300000018000000000000
          000BC99786FFFEFCFBFFF9F2EDFFF9F2EDFFF9F0EBFFF8F2EDFFEBE7E5FF82A7
          C2FF4EAAD7FFDEFEFDFF68D4F4FF2875BEFF3F8BBEFF091B3F9E000000000000
          000ACB9C8BFFFEFDFCFFFAF3EFFFFAF4EEFFFAF3EEFFFAF1ECFFF8F2EEFFEDE9
          E7FF85ABC7FF51AEDAFFDEFEFDFF6EDDF8FF2C7BC2FF18448BFF000000000000
          0009CFA08DFFFEFEFDFFFBF5F1FFFBF5F0FFFBF4F0FFFAF3EFFFFAF3EFFFF8F4
          EFFFEFECE9FF89AECAFF54B1DCFFDEFEFDFF4FA6D4FF102C4E93000000000000
          0009D0A393FFFEFEFDFFFAF5F3FFFBF6F2FFFBF5F1FFFBF5F0FFFBF5F0FFFAF4
          EFFFFAF6F1FFF3EFEDFF83A0B8FF357FBCFF173A598F0000000C000000000000
          0008D3A897FFFEFEFEFFFBF6F4FFFBF6F4FFFCF6F3FFFCF6F3FFFCF4F2FFFBF5
          F1FFFBF5F0FFFAF6F3FFE2CCC4FF000000160000000600000001000000000000
          0007D3AB9AFFFFFEFEFFFCF8F6FFFCF7F5FFFCF7F5FFFBF6F4FFFBF6F4FFFCF6
          F3FFFCF6F2FFFBF6F1FFD1A494FF0000000C0000000000000000000000000000
          0006D8AE9DFFFFFFFEFFFDF9F7FFFDF9F7FFFCF8F7FFFCF8F6FFFCF7F5FFFBF7
          F5FFFBF7F4FFFCF7F3FFD3A897FF0000000B0000000000000000000000000000
          0006D8B0A0FFFFFFFFFFFDFAF9FFFDFAF8FFFDFAF8FFFDF9F7FFFCF8F7FFFBF8
          F6FFFBF7F6FFFCF7F5FFD4AC9BFF0000000A0000000000000000000000000000
          0005D9B3A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFEFFFEFEFEFFFFFE
          FEFFFEFEFEFFFEFEFEFFD7AE9EFF000000090000000000000000000000000000
          0003A3867AC0DBB5A5FFDAB5A4FFDAB5A4FFDAB4A4FFD9B3A3FFD9B3A3FFD9B3
          A2FFD9B2A2FFD8B2A2FFA08377C2000000060000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00030000000C3030303F00000014000000140000001500000015000000150000
          00150000001500000016000000140000000E0000000300000000000000000000
          000B855B4FC4B8806DFFB87F6CFFB77D6BFF275392FF265190FF264F8EFF244D
          8BFFB47967FFB37866FFB47864FF805648C50000000D00000000000000000000
          0010BA8471FFFCF6F2FFF5E0D2FFF4DFD1FF2F6BBBFF5EB0ECFF4FA7E8FF306B
          BBFFF6E6DDFFF3DBCCFFF6E4DAFFB57966FF0000001200000000000000000000
          000FBD8674FFFDF9F7FFF5E2D7FFF5E1D6FF2B66B8FF6CB8EEFF56ACEAFF2B68
          B8FFF7E8DFFFF4DED0FFF7E8E0FFB67C69FF0000001200000000000000000000
          000EBF8A77FFFEFCFAFFF6E6DCFFF6E5DBFF2761B5FF7BC1F0FF5EB1EBFF2661
          B5FFF8EAE2FFF5E0D4FFF9EDE6FFB77E6BFF0000001100000000000000000000
          000CC18D7BFFFEFDFDFFF7E9E1FFF7E8DFFF235CB2FF88C9F2FF64B4EDFF235B
          B2FFF9EDE6FFF6E3D9FFFAF0EAFFB9806EFF0000000F00000000000000000000
          000BC4907EFFFEFDFDFFF9ECE5FFF8ECE4FF1D57AFFF95D0F4FF93CFF4FF1D57
          AFFFF9EDE6FFF7E7DEFFFAF3EEFFBB8471FF0000000E00000000000000090000
          0016AF7E6CFFF6F6F5FFF9EEE8FFFAEFE9FF1B53AEFF1B53AEFF1B53AEFF1B53
          AEFFF8EBE4FFF7E9E1FFF3EEEBFFA77462FF000000190000000B20865EFF2796
          6CFF1F855DFFB5C1B8FFF0E6E1FFFAF0EDFFFAF1ECFFFAF1ECFFFAF1EBFFF9EF
          E9FFF8EDE7FFEEE0DBFFB0BAAEFF1E7C56FF1D8B60FF1D7A54FF0718113C2D93
          6CFF53E3B6FF1C7951FFABB0A3FFEFE6E3FFFAF4F0FFFBF3EFFFFBF3EEFFF9F1
          EDFFECE1DEFFA8A79BFF15724BFF2AD89DFF188056FF04140D3F00000003081A
          123C339B74FF65E8C0FF1E7750FFA9ACA0FFEEE7E4FFF9F5F2FFF9F4F1FFECE2
          DEFFA7A89AFF17724BFF39DBA6FF1D885DFF04160E4300000004000000000000
          0003081C143A3AA57DFF75EBC9FF1E744EFFA5A89CFFE9E0DDFFE6DDD8FFA4A6
          9AFF17714AFF4BE0B1FF218F63FF937A63FF0000000B00000000000000000000
          000000000003091E163841AC87FF86EFD1FF1E734CFFA1A296FF829280FF1870
          48FF61E7BEFF26976CFFAFBDB2FFB98270FF0000000600000000000000000000
          000000000000000000020A1F183648B58FFF96F3DBFF348B65FF2C8961FF76EC
          C9FF2AA074FFB0C1B5FFF6F4F4FFBE8876FF0000000400000000000000000000
          00000000000000000000000000020B2119364FBD97FFA3F5E1FF89F3D7FF2FA8
          7CFF7D7B69CDCC9E8DFFCB9B8AFF946E61BF0000000200000000000000000000
          0000000000000000000000000000000000010C221B3440B78FFF40B78EFF051E
          1535000000030000000200000002000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000020000000B000000120000000C00000003000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000200000010071334970F276AFF0A193B970000000B000000000000
          00007B5043B8AB705CFFAB6F5AFFAB705CFFAA6F5BFFAA6E59FFA96F5AFFBE91
          82FFC9ACA3FF5F617FFF417CB9FF70C7FFFF265198FF00000010000000000000
          0000AD735FFFFDFBF9FFFBF5F2FFF7F2EEFFF3EDE9FFEFE9E5FFECE5E1FFE6DE
          DAFF707E9FFF4C83BCFF83CFFFFF5694CEFF142B4D930000000A000000000000
          0000B07762FFFDFBFAFFF7F3F0FFE2D8D2FFA5816CFF8E5E42FF8C5D41FF7A5E
          54FF577EA6FF92D4FAFF619CD0FF727F9BFF0000000E00000002000000000000
          0000B07966FFFBF9F9FFE1D5CEFF936346FFC8A37FFFEFD7B2FFF0DAB8FFC7A6
          88FF895D43FF6891B2FF849DB9FFCCB0A7FF0000000200000000000000000000
          0000B37C69FFFAF8F7FFAD8975FFC7A07BFFF7D39CFFF5CD93FFF7D39BFFF9DD
          B2FFC7A688FF84695DFFE8E2DEFFC29888FF0000000000000000000000000000
          0000B67F6CFFF9F8F7FF98694CFFF1D4A7FFFAE5C0FFFBEACAFFF7D6A0FFF6D3
          9BFFF2DBBBFF8F5D42FFF0E9E7FFB27A66FF0000000000000000000000000000
          0000B98371FFFAF9F8FF9D6E51FFF2D4A5FFFDF6E2FFFDF3DCFFFBEACAFFF5CE
          92FFF1DAB5FF936245FFF2EDE9FFB47D6AFF0000000000000000000000000000
          0000BC8877FFFCFCFBFFB99783FFCDA77EFFF9E0B5FFFEF7E5FFFBE5C1FFF6D4
          9DFFCAA681FFAF8C77FFF5F1EEFFB6806DFF0000000000000000000000000000
          0000BF8C7AFFFDFDFCFFEDE4DFFFA87A5DFFCEA77FFFEFD2A3FFEFD2A5FFCCA7
          80FFA17356FFE4DAD4FFFAF6F3FFB98371FF0000000000000000000000000000
          0000C18F7FFFFEFEFEFFFDFCFBFFEDE4DFFFBE9C87FFAA7E62FFA97D60FFBB98
          82FFEADFD8FFFBF8F6FFFDF9F8FFBD8774FF0000000000000000000000000000
          0000C49382FFFFFEFEFFFEFEFDFFFBF6F4FFFAF5F3FFF9F3F0FFF9F3F0FFFAF2
          F0FFFAF4F0FFFDFBF9FFFDFBF9FFBF8C7BFF0000000000000000000000000000
          0000C79985FFFFFEFEFFFFFEFEFFFEFEFDFFFEFDFDFFFEFDFDFFFEFDFCFFFEFC
          FCFFFEFCFBFFFEFCFAFFFDFCFAFFC28F7FFF0000000000000000000000000000
          0000C99A89FFFFFFFEFFFFFFFEFFFFFEFEFFFFFEFEFFFEFEFEFFFEFEFEFFFEFE
          FDFFFEFEFDFFFEFDFDFFFEFDFDFFC49382FF0000000000000000000000000000
          0000967467BDCA9C8BFFCA9C8BFFC99C8AFFC99B89FFC99B8AFFCA9A88FFC89A
          88FFC99987FFC79887FFC89886FF927163BD0000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000030000000C000000120000001400000014000000150000
          0015000000140000000D00000003000000000000000000000000000000000000
          00000000000000000009896256C2BD8A78FFBE8A78FFBD8A78FFBD8978FFBD89
          78FFBE8978FF876356C30000000B000000000000000000000000000000030000
          000E0000001500000021C08D7CFFF6EEE9FFF5EDE9FFF5EDE9FFF5ECE8FFF4EC
          E8FFF5ECE7FFBF8D7BFF00000026000000180000000F000000040000000C7B50
          42C5A76E5BFF9F6755FFC2917FFFF7F0ECFFE2B47DFFE2B37AFFE1B077FFE0AE
          72FFF6EEEAFFC2907FFF845545FF895847FF613E32C70000000E00000011BB7E
          6BFFECD9CCFFE3CEBEFFC59483FFF9F2F0FFE4B984FFE3B781FFE3B47CFFE0B1
          76FFF7F0EDFFC59483FFE0CBBCFFEBD8CBFFB67763FF0000001400000010BE85
          71FFF1E5DAFFECDBD0FF7A4835FF7A4835FF7A4835FF7A4835FF7A4835FF7A48
          35FF7A4835FF7A4835FFEBDBCFFFF1E2D8FFB97C69FF000000130000000EC28B
          78FFF5EEE7FFF2E7DDFFF2E7DEFFF3E7DEFFF2E5DEFFF3E5DEFFF2E7DDFFF2E7
          DDFFF2E7DEFFF2E7DDFFF2E5DEFFF5EDE6FFBC826EFF000000120000000CC793
          7FFFFAF4F1FFCDBEB8FF6F5448FF614337FF614035FF5F3F34FF5E3F33FF5D3D
          32FF5D3D34FF6A4C44FFCABCB6FFF9F5F1FFC18875FF000000100000000ACC99
          86FFFDFAFAFF7D6054FF745043FF744F43FF744E43FF734E43FF734E42FF724D
          42FF724C41FF724C40FF73584DFFFDFAFAFFC58F7CFF0000000E00000008CF9F
          8DFFFFFFFFFF7A5A4CFF8E695AFFF9F4F1FFF0E6E0FFF0E5DFFFEFE5DEFFEFE5
          DEFFF6EFEBFF866253FF704F43FFFFFFFFFFCA9683FF0000000B00000005BE95
          84E9F5ECE8FF866656FF977262FFFAF6F4FFF2E8E3FFF1E8E1FFF1E7E2FFF1E7
          E1FFF8F2EEFF8E6A5BFF7A5B4CFFF5EAE6FFBA8E7DEA00000008000000023429
          2545A78375CC947262FFA07B6AFFFCF9F8FFF3EBE6FFF4EAE5FFF2EAE5FFF3EA
          E3FFF9F5F3FF977263FF876658FFA68072CE3428234800000003000000000000
          0001000000030000000AC89B89FFFDFBFAFFF5EDE8FFF4EDE8FFF5EDE7FFF5EC
          E7FFFBF7F6FFC59685FF00000011000000040000000200000000000000000000
          00000000000000000005CA9E8DFFFEFCFCFFF7F0ECFFF6EFEBFFF7EFEBFFF5EF
          EAFFFCFAF8FFC89A89FF00000009000000000000000000000000000000000000
          00000000000000000003CDA291FFFEFEFDFFFEFDFDFFFEFDFCFFFEFCFCFFFEFC
          FBFFFDFBFAFFCB9F8DFF00000007000000000000000000000000000000000000
          000000000000000000019A796DBFCFA493FFCEA493FFCEA493FFCEA492FFCDA3
          91FFCDA391FF98786BC100000004000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0001000000060000000A0000000B0000000B0000000B0000000B0000000B0000
          000C0000000C0000000C0000000B000000070000000200000000000000000000
          000680574CBDB37B69FFB37A68FFB37A68FFB27968FFB27968FFB27A68FFB279
          68FFB37968FFB27967FFB17967FF7F5749BF0000000700000000000000000000
          0008B57D6BFFFBF7F3FFFBF6F3FFFBF6F3FFFBF5F2FFFBF5F2FFFBF5F2FFFAF5
          F1FFFBF5F1FFFAF4F1FFFAF4F0FFB27B68FF0000000B00000000000000000000
          0008B67F6DFFFCF8F5FFD49F70FFD49E6FFFD19D6FFFD29D6EFFD19C6CFFD09B
          6DFFD09A6BFFCE9A6AFFFBF5F2FFB47D6AFF0000000B00000000000000000000
          0008B8826FFFFCF9F6FFDAAC7DFFDBAB7DFFDAAB7CFFDAAB7CFFD9AB7CFFD9AA
          7CFFD9AA7CFFD29E6FFFFBF7F3FFB67F6DFF0000000A00000000000000000000
          0007BA8473FFFDF9F8FFDDAF7EFFDDAF7EFFDDAD7EFFDDAD7EFFDBAD7EFFDBAC
          7DFFDAAC7DFFD6A372FFFCF8F5FFB88170FF0000000A00000000000000000000
          0007BB8776FFFDFBF9FFF8F1EBFFF8F1ECFFF8F0ECFFF8F1EBFFF8F0EBFFF9F0
          EBFFF8EFEAFFF8F0EAFFFCF9F7FFB98473FF0000000900000000000000000000
          0006BD8A78FFFDFBFAFFCDA493FFCCA393FFCCA292FFCCA291FFCBA090FFCBA0
          8FFFCA9F8FFFC29482FFFDFAF8FFBB8675FF0000000800000000000000000000
          0006BF8D7BFFFEFCFBFFFAF3EEFFFAF2EFFFF9F2EFFFFAF2EEFFF9F2EEFFFAF2
          EEFFFAF2EEFFF9F1EEFFFDFBF9FFBD8978FF0000000800000000000000000000
          0005C1907EFFFEFDFCFFCEA898FFCEA796FFCEA695FFCDA594FFCDA493FFCCA3
          93FFCCA292FFC39685FFFDFBFAFFBF8D7BFF0000000700000000000000000000
          0005C39381FFFEFDFDFFFBF4F2FFFAF5F2FFFAF5F1FFFAF5F1FFFBF5F1FFFBF4
          F1FFFAF4F1FFFAF4F0FFFEFCFBFFC18F7EFF0000000700000000000000000000
          0004C59684FFFEFEFEFFD1AE9DFFD0AC9CFFD0AB9BFFCFAA99FFCEA999FFCEA8
          97FFCEA796FFC59B89FFFEFDFCFFC39381FF0000000600000000000000000000
          0004C69887FFFFFEFEFFFCF7F5FFFBF6F5FFFBF7F5FFFCF6F4FFFBF7F4FFFBF7
          F4FFFBF6F4FFFBF6F4FFFEFDFDFFC59684FF0000000600000000000000000000
          0003C99B8AFFFFFEFEFFD5B2A3FFD4B2A2FFD4B1A0FFD3AF9FFFD2AD9DFFD1AD
          9CFFD0AB9BFFC89F8FFFFFFEFEFFC79887FF0000000500000000000000000000
          0003CA9E8DFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFEFFFFFEFEFFFFFEFEFFFFFE
          FEFFFFFEFEFFFFFEFEFFFFFEFEFFC99B8AFF0000000400000000000000000000
          00029B7F74BFD0AB9CFFD0AB9CFFD0AA9CFFD0AA9BFFCFA99BFFCFA99AFFCFA9
          99FFCFA899FFCEA899FFCFA898FF997B71C00000000300000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000040000
          00130000001E0000002000000020000000200000002100000021000000210000
          002200000022000000220000002300000021000000160000000500000012281E
          16CB37291EFF463A31FFBD8150FFBC7E4DFFB97949FFB67646FFB37141FFB06D
          3DFFAD6839FFAB6535FF42362EFF3D3026FF241A13CE00000015000000193B2C
          21FF685C54FF483C34FFE8C28BFFE7C088FFE6BD85FFE5BB81FFE4B87CFFE3B5
          79FFE2B276FFE2B273FF443931FF51433AFF34261DFF0000001E000000183E2F
          24FF6C6057FF4A3F37FFD9B27DFFD8B07BFFD7AE77FFD7AB74FFD6A970FFD5A6
          6DFFD4A56AFFD4A268FF473B33FF5B4F47FF37291EFF0000001D000000164031
          26FF6F645CFF4C4038FFFFFFFFFFF7F1EBFFF7F0EBFFF7F0EBFFF7EFEBFFF6EF
          EAFFF6EFEAFFF6EFE9FF463B34FF5D5249FF3A2C21FF0000001B000000144434
          29FF73675FFF4F443CFFFFFFFFFFF8F2EDFFF8F1EDFFF7F1EDFFF7F0EDFFF8F1
          EBFFF7F0EBFFF7F0ECFF4A4037FF5F534BFF3D2E23FF00000019000000124637
          2CFF776B63FF50453DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF4E433BFF61544CFF403126FF0000001700000010493A
          2FFF796E66FF50453DFF61564EFF60564EFF60554DFF5F544CFF5E544CFF5E53
          4BFF5D524AFF5C5249FF5B5149FF61554DFF433429FF000000150000000E4C3D
          32FF7C706AFF674E44FF654B42FF634A41FF61473FFF5F473EFF5C443CFF5B43
          3AFF594139FF584038FF573F37FF63574FFF46362DFF000000130000000D4E3F
          35FF80746DFF6B5248FFF4ECE6FFE9DACEFFE9D8CDFFE9D8CCFFE9D8CBFFE8D7
          CAFFF3EAE2FFF3E9E2FF5A4139FF645850FF483A2FFF000000110000000B5142
          36FF827770FF70564DFFF9F5F2FFF4EAE4FFF1E6DEFFEBDCD2FFE9D9CCFF4E41
          3DFF60534CFFF3EAE3FF5D453CFF655951FF4C3D32FF0000000F000000095344
          39FF857A73FF755A50FFFAF6F3FFF5EDE7FFF4EDE6FFF4ECE6FFEFE2DAFF493D
          38FF5A4D46FFF4EBE4FF60483FFF655A52FF4F3F34FF0000000D000000075545
          3AFF887D76FF795E54FFFAF6F4FFF5EEE9FFF5EDE7FFF4EDE7FFF4ECE6FF473A
          36FF483D36FFE9D9CDFF644C43FF675A52FF514137FF0000000B000000065748
          3DFF898079FF7C6157FFFAF7F4FFFAF6F4FFFAF6F4FFFAF6F3FFFAF6F3FFFAF5
          F2FFF5EEE9FFF4ECE6FF695046FF82776FFF534439FF00000009000000034235
          2EC058493DFF7F645AFF998178FF967F75FF937A72FF8E786DFF8B7269FF866E
          64FF82695FFF7D645BFF6E544AFF56453BFF3F332BC200000005000000000000
          0002000000030000000400000004000000040000000400000005000000050000
          0005000000050000000500000006000000060000000400000001}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000000000000000000000000000000000000000000A0000
          0010000000110000001100000011000000120000001200000012000000120000
          0012000000120000001300000013000000120000000C0000000381594CC2B47C
          69FFB37B69FFB37B68FFB37A68FFB37A68FFB27A68FFB27A68FFB37968FFB279
          68FFB27967FFB27867FFB17867FFB17866FF7F5649C30000000BB77F6EFFFBF8
          F5FFF8EEE9FFF8EEE9FFF7EFE8FFF7EEE8FFF7EEE8FFF7EEE8FFF7EDE7FFF7ED
          E6FFF6EDE6FFF6ECE6FFF6ECE6FFF6ECE5FFB47B69FF00000011B98472FFFBF8
          F6FFBF998AFFEBDAD3FFBE9788FFEBDAD3FFBD9586FFEBDAD3FFBC9484FFEBDA
          D3FF5D6DDDFFE4DDE1FF5A69DCFFF7EDE7FFB77F6EFF00000011BC8978FFFCFA
          F8FFEBDDD5FFECDCD5FFEBDDD5FFECDCD5FFEBDDD5FFECDCD5FFEBDDD5FFECDC
          D5FFE5DFE3FFE5DFE2FFE5DEE2FFF8EEE9FFB98472FF00000010C08E7DFFFCFA
          F9FFC6A294FFEDDED6FFC4A092FFEDDED6FFC29E8EFFEDDED6FFC19B8CFFEDDE
          D6FF6577E1FFE5E0E4FF6272E0FFF8F1EBFFBC8977FF00000010C39482FFFCFA
          FAFFEDDFD9FFEDDFD8FFEDDFD9FFEDDFD8FFEDDFD9FFEDDFD8FFEDDFD9FFEDDF
          D8FFE6E2E6FFE6E2E6FFE6E2E5FFF9F2EEFFC08E7CFF0000000FC79887FFFDFB
          FAFFCCAB9DFFEEE0DBFFCAA99BFFEEE0DBFFC9A799FFEEE0DBFFC8A496FFEEE0
          DBFF6D81E5FFE8E3E8FF6A7DE4FFFAF4F0FFC49381FF0000000EC99D8CFFFDFC
          FCFFEEE2DCFFEEE2DCFFEEE2DCFFEEE2DCFFEEE2DCFFEEE2DCFFEEE2DCFFEEE2
          DCFFE8E6EAFFE8E5EAFFE8E4E9FFFAF6F2FFC69886FF0000000DCDA190FFFEFC
          FCFFD0B1A3FFEFE3DFFFCFB0A2FFEFE3DFFFCFAFA0FFEFE3DFFFCDAD9FFFEFE3
          DFFF7388E8FFE9E6EBFF7186E7FFFBF7F5FFC99D8BFF0000000DCFA594FFFEFC
          FCFFFDF9F9FFFDF9F9FFFDF9F9FFFDFAF8FFFDF9F8FFFDFAF8FFFCF9F7FFFCF9
          F7FFFCF9F7FFFDF8F7FFFCF9F7FFFCF9F7FFCCA290FF0000000C4B53C3FF8D9E
          ECFF687CE3FF6678E2FF6476E1FF6172E0FF5F70DFFF5F70DFFF5D6CDEFF5B69
          DCFF5966DBFF5664DAFF5462D9FF616DDCFF3337AAFF0000000B4C55C4FF93A4
          EEFF6C80E6FF6A7EE4FF687BE4FF6678E2FF6375E1FF6375E1FF6172E0FF5E6F
          DEFF5C6CDDFF5A69DCFF5766DAFF6472DDFF3538ABFF0000000A4D56C6FF96A7
          EFFF95A6EFFF93A4EDFF90A2EDFF8F9FEDFF8B9BEBFF8B9BEBFF8898EAFF8595
          EAFF8291E7FF7F8DE7FF7D89E5FF7987E5FF3539ACFF000000093A4093C14D55
          C5FF4B53C3FF4A51C1FF484FBFFF464DBEFF444BBBFF444BBBFF4249B9FF4046
          B7FF3E44B4FF3C41B3FF3A3EB0FF393CAEFF282B80C200000006000000040000
          0006000000060000000600000007000000070000000700000007000000070000
          0007000000070000000800000008000000070000000500000001}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000900000012000000120000
          0009000000020000000000000000000000000000000000000000000000000000
          0000000000030000000A0000000A0000000B2519156F68473BFF67443BFF1D13
          0F700000000C0000000B0000000C000000050000000100000000000000000000
          00030403021A543B33C738251EB30D0907454C362DC4B5A198FFAB958AFF3E29
          23C50D080748311F1AB13A241ECE030202220000000400000000000000000000
          00085A4138C9C7B9B0FFA8958BFF6C4F47FF715044FECABAB0FFC6B5AAFF6142
          37FE6B5047FE9C857AFFA89388FF3B241FCB0000000B00000000000000000000
          00074C3930ABC0AEA7FFE3DBD5FFD2C3BAFFC1AFA6FFCFC0B7FFCEBEB5FFBCAA
          9FFFCAB9AEFFC9B8ADFF9F897FFF36221DB20000000A00000000000000010000
          0007110C0B368D6F65FCEAE3DFFFDACDC6FFD8CCC3FFE3D9D3FFE7E0DAFFE1D6
          D0FFD2C3B9FFCDBCB3FF705449FE0D0907410000000A00000002000000042A1E
          1A6B4C372EBB846356FED9CEC8FFE3DAD5FFCDBEB7FF8E6F62FF947567FFD0C0
          B9FFE3DAD3FFC8B7ADFF6A4940FF47312AC22418147100000007000000088D6D
          60FFD8CCC7FFEEE8E5FFEBE6E0FFEAE3DDFF7F6257FF2219155E241B175E9374
          67FFEBE4DFFFD6C8C0FFD3C6BDFFB9A59BFF78574BFF0000000D000000079373
          64FFD9CECAFFF6F3F2FFFAF7F6FFEFEAE5FF76574DFF1D1411551E1613568869
          5DFFEFE9E6FFDDD2CBFFD8CAC3FFC7B8B1FF7E5B4FFF0000000C000000033428
          245F665046B5937467FEECE6E3FFF0ECE8FFCEC2BDFF856961FF886D65FFD2C7
          C2FFECE4DFFFD9CFC9FF856458FD5A443AB92B201C6102010108000000000000
          000316110F2EA78B7EFDF6F4F1FFF3EFECFFF2EEEAFFF3EFECFFF0EBE7FFEFEA
          E6FFEFEBE7FFECE5E0FF83665BFD110C0B390000000600000001000000000000
          0003685349AADCD1CBFFF8F6F3FFF8F5F3FFEBE4E1FFFDFCFBFFF3EEECFFE2D8
          D3FFFAF9F8FFF9F7F5FFC8B9B3FF4E3931B00000000500000000000000000000
          0002776055BDE5DDD8FFDCD0CBFFAC9183FD9E7E6EFDFBF8F8FFF5F1EEFF9979
          6AFDA3897EFCD7CBC5FFE0D6D1FF6E564CC20000000500000000000000000000
          00010605040D7C6458BF69544BA51713102B6F594EB2E1D7D2FFE0D6D1FF6D57
          4DB314100E2B614D44A4775E53C7050404110000000100000000000000000000
          0000000000000000000100000002000000023B302A5EA68676FFA58375FF3A2F
          295F000000030000000300000003000000010000000000000000000000000000
          0000000000000000000000000000000000000000000100000002000000030000
          0001000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000020000
          00090000000E0000000F00000010000000100000001100000011000000110000
          001200000012000000110000000C000000030000000000000000000000087B50
          43C0AB705CFFAB6F5AFFAB705CFFAA6F5BFFAA6E59FFA96F5AFFAA6D59FFAA6C
          59FFAA6C59FFA96C58FF794D3FC30000000B00000000000000000000000CAD73
          5FFFFDFBF9FFFBF5F2FFFAF5F1FFFAF4F0FFFAF4EFFFFAF2EEFFFAF1EDFFF8F1
          ECFFF8F0EBFFF8F0EAFFD5B6ADFF0000001100000000000000000000000CB077
          62FFFDFBFAFFF7EDE6FF53A46CFF058131FF048030FF047F30FF037E2FFF037D
          2EFF027C2EFF027B2DFF02792CFF01792CFF00782BFF00511DAD0000000BB079
          66FFFDFBFBFFF8EEE8FF068332FFFAF6F6FF058131FFF9F5F3FF047F2FFFF8F2
          F1FFF7F2EFFF7DB68EFFF7EFEDFFF6EEEBFF7BB48BFF01782BFF0000000AB37C
          69FFFEFCFBFFF8F0EAFF068433FFFBF7F6FF058231FFF9F5F4FF048030FFF8F4
          F2FF037E2FFF037D2FFF027C2EFF7DB68DFFF6EEEBFF01792CFF00000009B67F
          6CFFFEFDFCFFF9F0EBFF078533FF81BE95FFFBF7F6FF80BD94FF048131FFF9F5
          F2FF047F30FF037E2FFF7EB88FFFF6F1EEFF037B2DFF017A2DFF00000009B983
          71FFFEFDFCFFFAF3EEFF068634FFFCF8F8FF068433FFFBF7F6FF068231FFFAF5
          F3FF048030FF047F30FFF8F3F0FF037D2EFF027C2EFF027A2DFF00000008BC88
          77FFFEFEFDFFFBF4EFFF078634FFFBFAF9FF078533FFFAF8F7FF068333FFFAF7
          F5FF058131FF058030FF7EB991FFF8F2F0FFF7F2EFFF027C2DFF00000007BF8C
          7AFFFEFEFDFFFBF6F1FF55AA71FF078634FF078534FF068534FF068433FF0683
          32FF058332FF058131FF058030FF047F30FF037E2FFF025420AD00000006C18F
          7FFFFEFEFEFFFAF6F3FFFAF5F3FFFBF6F2FFFBF5F1FFFBF5F0FFFBF5F0FFFAF4
          EFFFFAF4EEFFFDF9F8FFDEC3BAFF0000000B000000000000000000000006C493
          82FFFFFEFEFFFBF7F4FFFBF6F4FFFBF6F4FFFCF6F3FFFCF6F3FFFCF4F2FFFBF5
          F1FFFBF5F0FFFDFBF9FFBF8C7BFF0000000B000000000000000000000005C799
          85FFFFFEFEFFFCF8F7FFFCF8F6FFFCF7F5FFFCF7F5FFFBF6F4FFFBF6F4FFFCF6
          F3FFFCF6F2FFFDFCFAFFC28F7FFF0000000A000000000000000000000004C99A
          89FFFFFFFEFFFFFFFEFFFFFEFEFFFFFEFEFFFEFEFEFFFEFEFEFFFEFEFDFFFEFE
          FDFFFEFDFDFFFEFDFDFFC49382FF000000080000000000000000000000029775
          67C0CA9C8BFFCA9C8BFFC99C8AFFC99B89FFC99B8AFFCA9A88FFC89A88FFC999
          87FFC79887FFC89886FF927163C2000000050000000000000000000000010000
          0002000000030000000400000004000000050000000500000005000000060000
          0006000000060000000600000005000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00030000000C3030303F00000014000000140000001500000015000000150000
          00150000001500000016000000140000000E0000000300000000000000000000
          000B855B4FC4B8806DFFB87F6CFFB77D6BFF275392FF265190FF264F8EFF244D
          8BFFB47967FFB37866FFB47864FF805648C50000000D00000000000000000000
          0010BA8471FFFCF6F2FFF5E0D2FFF4DFD1FF2F6BBBFF5EB0ECFF4FA7E8FF306B
          BBFFF6E6DDFFF3DBCCFFF6E4DAFFB57966FF0000001200000000000000000000
          000FBD8674FFFDF9F7FFF5E2D7FFF5E1D6FF2B66B8FF6CB8EEFF56ACEAFF2B68
          B8FFF7E8DFFFF4DED0FFF7E8E0FFB67C69FF0000001200000000000000000000
          000EBF8A77FFFEFCFAFFF6E6DCFFF6E5DBFF2761B5FF7BC1F0FF5EB1EBFF2661
          B5FFF8EAE2FFF5E0D4FFF9EDE6FFB77E6BFF0000001100000000000000000000
          000CC18D7BFFFEFDFDFFF7E9E1FFF7E8DFFF235CB2FF88C9F2FF64B4EDFF235B
          B2FFF9EDE6FFF6E3D9FFFAF0EAFFB9806EFF0000000F00000000000000000000
          000BC4907EFFFEFDFDFFF9ECE5FFF8ECE4FF1D57AFFF95D0F4FF93CFF4FF1D57
          AFFFF9EDE6FFF7E7DEFFFAF3EEFFBB8471FF0000000E00000000000000090000
          0016AF7E6CFFF6F6F5FFF9EEE8FFFAEFE9FF1B53AEFF1B53AEFF1B53AEFF1B53
          AEFFF8EBE4FFF7E9E1FFF3EEEBFFA77462FF000000190000000B20865EFF2796
          6CFF1F855DFFB5C1B8FFF0E6E1FFFAF0EDFFFAF1ECFFFAF1ECFFFAF1EBFFF9EF
          E9FFF8EDE7FFEEE0DBFFB0BAAEFF1E7C56FF1D8B60FF1D7A54FF0718113C2D93
          6CFF53E3B6FF1C7951FFABB0A3FFEFE6E3FFFAF4F0FFFBF3EFFFFBF3EEFFF9F1
          EDFFECE1DEFFA8A79BFF15724BFF2AD89DFF188056FF04140D3F00000003081A
          123C339B74FF65E8C0FF1E7750FFA9ACA0FFEEE7E4FFF9F5F2FFF9F4F1FFECE2
          DEFFA7A89AFF17724BFF39DBA6FF1D885DFF04160E4300000004000000000000
          0003081C143A3AA57DFF75EBC9FF1E744EFFA5A89CFFE9E0DDFFE6DDD8FFA4A6
          9AFF17714AFF4BE0B1FF218F63FF937A63FF0000000B00000000000000000000
          000000000003091E163841AC87FF86EFD1FF1E734CFFA1A296FF829280FF1870
          48FF61E7BEFF26976CFFAFBDB2FFB98270FF0000000600000000000000000000
          000000000000000000020A1F183648B58FFF96F3DBFF348B65FF2C8961FF76EC
          C9FF2AA074FFB0C1B5FFF6F4F4FFBE8876FF0000000400000000000000000000
          00000000000000000000000000020B2119364FBD97FFA3F5E1FF89F3D7FF2FA8
          7CFF7D7B69CDCC9E8DFFCB9B8AFF946E61BF0000000200000000000000000000
          0000000000000000000000000000000000010C221B3440B78FFF40B78EFF051E
          1535000000030000000200000002000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000100000003000000080000000C0000
          000E0000000D0000000800000003000000010000000000000000000000020000
          000A00000010000000110000001300000018050E0A3F16412DAC216043EC256A
          48FF216141ED163F2BAC050E09390000000900000001000000000000000A7B50
          43C2AB705CFFAB6F5AFFC29A8CFFA2A191FF307554FF2D9D71FF24BA82FF23CB
          8EFF23BA82FF25986BFF2C7050FD0A1E145C00000006000000000000000EAD73
          5FFFFDFBF9FFFAF4F2FFDCE4DEFF388260FF40C397FF28CD92FF40956DFF487E
          5DFF3F946CFF26CD91FF27BA84FF297150F5050F0A2F000000030000000EB077
          62FFFDFBFAFFF6EFEBFF80AD96FF54B593FF36D29CFF2ECE95FF4A8362FFFFFF
          FFFF4A8161FF2CD096FF2CCF95FF31A87AFF1B4833A1000000060000000CB079
          66FFFDFBFBFFF7F2EFFF499371FF6CDBBBFF469D76FF4D8865FF4D8765FFF6F1
          EBFF4D8665FF4D8664FF459B73FF33C892FF2B7453E7000000080000000BB37C
          69FFFEFCFBFFF8F4F1FF3C926DFF81E9CCFF508C6AFFEADBD3FFF8F3EFFFF9F3
          EFFFF8F3EFFFFFFFFFFF4E8968FF3FD5A3FF348662FA000000080000000AB67F
          6CFFFEFDFCFFF8F3F1FF4FA07DFFB1E9D8FF6CA98CFF528F6EFF528F6DFFFAF5
          F3FF528F6CFF518E6BFF5EA583FF76DCBBFF338260E70000000700000009B983
          71FFFEFDFCFFFAF5F2FF8CC2AAFF94CBB5FFE2FAF5FFC5F5E9FF539371FFECDE
          D8FF539270FFABF0DDFFB0F1DEFF84C6ADFF2358419A0000000400000007BC88
          77FFFEFEFDFFFBF4F0FFE4ECE6FF4EAA84FFC8E7DBFFEEFDFAFF7AB095FF5696
          74FF74AF94FFD9F9F2FFBEE5D8FF3E9873F208130E250000000100000006BF8C
          7AFFFEFEFDFFFBF6F1FFFBF6F4FFC9E2D5FF4FAD85FF93CEB7FFD2ECE3FFF3FC
          FBFFD2ECE3FF92CDB6FF4DA881FF122D2251000000020000000000000005C18F
          7FFFFEFEFEFFFAF6F3FFFAF5F3FFFAF7F4FFE5EEE7FF90CAB1FF5BB48FFF46AB
          82FF5BB48EFF8EC9B1FFC9BDB1FF00000008000000000000000000000004C493
          82FFFFFEFEFFFBF7F4FFFBF6F4FFFBF6F4FFFBF6F3FFFCF8F6FFFCF7F6FFFCF9
          F7FFFBF8F5FFFCFBFAFFC49587FF00000005000000000000000000000003C799
          85FFFFFEFEFFFCF8F7FFFCF8F6FFFCF7F5FFFCF7F5FFFBF6F4FFFBF6F4FFFCF6
          F3FFFCF6F2FFFDFCFAFFC28F7FFF00000004000000000000000000000002C99A
          89FFFFFFFEFFFFFFFEFFFFFEFEFFFFFEFEFFFEFEFEFFFEFEFEFFFEFEFDFFFEFE
          FDFFFEFDFDFFFEFDFDFFC49382FF000000030000000000000000000000019774
          67BECA9C8BFFCA9C8BFFC99C8AFFC99B89FFC99B8AFFCA9A88FFC89A88FFC999
          87FFC79887FFC89886FF927063BF000000020000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000030000
          0007000000060000000300000006000000080000000400000001000000000000
          00000000000000000000000000000000000000000000000000030B082C4D2619
          99EA110A58A2010003160F0855A3160C7EEA0603244F00000004000000000000
          0001000000060000000A0000000B0000000B0000000B000000112E23A2EA6F85
          EAFF4150CBFF1F1689E63B48C9FF5C74E4FF180E82E700000007000000000000
          000680574CBDB37B69FFB37A68FFB37A68FFB27968FFDCC6BEFF756BC0FF7780
          DDFF6D8BEFFF5872E5FF6381EDFF6972D8FF1A13659F00000005000000000000
          0008B57D6BFFFBF7F3FFFBF6F3FFFBF6F3FFFBF5F2FFFAF5F3FFEFECEFFF4D46
          BDFF6A85EBFF7494F2FF6079E7FF262094E40101041300000002000000000000
          0008B67F6DFFFCF8F5FFF8EFECFFF7EEEAFFF7EEEAFFF9F5F3FF807DD4FF6B7E
          E2FF93B0F6FFA0B3F2FF8AA6F4FF5D6EDBFF1C186AA000000004000000000000
          0008B8826FFFFCF9F6FFF8F0ECFFF8F0ECFFF7EFECFFFAF8F7FF6261D8FFB1C3
          F6FF8D99EAFF5F5DD2FF8995E7FFA6B8F3FF3B35AEE300000004000000000000
          0007BA8473FFFDF9F8FFF8F1EEFFF8F0EDFFF8F0ECFFFAF5F3FFCECDEEFF6564
          DEFF9291E2FFF2F1F3FF8982D3FF4340BCE71212334600000002000000000000
          0007BB8776FFFDFBF9FFF9F1EFFFF9F2EEFFF8F1EEFFF8F0EDFFFAF5F3FFFAF8
          F7FFFAF7F6FFFCF9F8FFE3CFC9FF0000000C0000000200000000000000000000
          0006BD8A78FFFDFBFAFFF9F2F0FFF9F2F0FFF8F2EFFFF9F1EFFFF8F1EEFFF9F1
          EEFFF8F0EDFFFDFAF8FFBB8675FF000000080000000000000000000000000000
          0006BF8D7BFFFEFCFBFFFAF4F1FFFAF4F1FFFAF2F1FFFAF2F0FFF9F2EFFFF9F2
          EEFFF8F1EEFFFDFBF9FFBD8978FF000000080000000000000000000000000000
          0005C39381FFFEFDFDFFFBF6F4FFFBF5F4FFFBF4F2FFFAF4F2FFFAF4F1FFF9F3
          F1FFFAF3F1FFFEFCFBFFC18F7EFF000000070000000000000000000000000000
          0004C69887FFFFFEFEFFFBF7F6FFFCF6F6FFFBF6F5FFFBF6F4FFFBF5F4FFFAF5
          F3FFFAF5F3FFFEFDFDFFC59684FF000000060000000000000000000000000000
          0003C99B8AFFFFFEFEFFFBF7F6FFFCF7F6FFFCF6F5FFFBF6F5FFFCF6F5FFFBF5
          F5FFFBF6F4FFFFFEFEFFC79887FF000000050000000000000000000000000000
          0003CA9E8DFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFE
          FEFFFFFEFEFFFFFEFEFFC99B8AFF000000040000000000000000000000000000
          00029B7F74BFD0AB9CFFD0AB9CFFD0AA9CFFCFA99BFFCFA99AFFCFA999FFCFA8
          99FFCEA899FFCFA898FF997B71C0000000030000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000040000000F000000110000000B000000040000
          0001000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000E431B10FF31130BE1190A0598030407420000
          000C000000020000000000000000000000000000000000000000000000000000
          000000000000000000000000000D673C29DCB8C7D2FF7789A3FF224084FF040F
          34960000000F0000000200000000000000000000000000000000000000000000
          000000000000000000000000000841261A91869AB3FFC7E3F6FF1B65B9FF286B
          ABFF041237950000000E00000002000000000000000000000000000000000000
          00000000000000000000000000031013163E458BC6FFDDFEFDFF4DB4E6FF1B67
          BAFF2E73B1FF051439940000000D000000020000000000000000000000000000
          0000000000000000000000000001000000081B44628D439FD5FFDDFEFDFF55C0
          ECFF1D6ABCFF337BB6FF06163B920000000C0000000200000000000000080000
          000C0000000D0000000D0000000D0000000E000000161B44629248A5D8FFDDFE
          FDFF5DCBF2FF206EBFFF3883BCFF07193E910000000A00000002735146BFA070
          61FF9F6F61FF9F6F60FF9E6F60FFA07161FFB89489FFC8B0A9FF7A98B2FF4BAB
          DAFFDDFEFDFF64D5F7FF2474C1FF3C8BC1FF071B418E00000006A47667FFF9F6
          F4FFF6F5F3FFF7F5F4FFF4F3F1FFF7F5F4FFF1F0EEFFF2F1EFFFF3F2F1FF8CB4
          D1FF4EAFDDFFDDFEFDFF6BDEFBFF287AC5FF15438DFF00000008A87C6DFFF5F3
          F2FF643C2CFFE5E4E3FF633B2BFFEBEAE9FF643C2CFF643E2DFFD7CFCBFFF6F5
          F4FF92B9D5FF51B2DFFFDDFEFDFF4CA7D7FF0F2B4F8800000004AD8274FFF4F3
          F2FF68402FFF673F2FFF673F2FFFE9E8E6FF663E2EFFDEDCDBFF68402FFFF7F5
          F4FFF6F3EFFF93BBD8FF327FBFFF163A5A8B0000000500000001B1887AFFF6F5
          F4FF6E4433FFE9E7E6FF6D4432FFECEBEAFF6C4331FF6C4231FFB3A19AFFF6F5
          F3FFF9F4EFFFF9F6F3FFD2BBB4FF0000000E0000000100000000B78F80FFF8F7
          F6FF724836FFCFC4BFFF714836FFF1EFEEFF714635FFE8E6E5FF704635FFF7F6
          F5FFF8F1ECFFF8F1ECFFAF8576FF0000000A0000000000000000BB9587FFFBFA
          F9FFD8CDC8FF764A3BFFD7CBC6FFF7F6F5FF754B39FF754B39FFD6CAC5FFFBFA
          F9FFF8F2EEFFF8F2EDFFB38B7CFF000000090000000000000000C09C8DFFFDFB
          F9FFFDFDFCFFFBFBFAFFFDFDFCFFFDFDFCFFFAFAF9FFFAFAF9FFFCFBFBFFFDFA
          F8FFFBF9F7FFFBF9F7FFB89282FF00000008000000000000000091786DC1C4A1
          92FFC3A091FFC3A091FFC29F90FFC19D8FFFC09D8EFFC09C8DFFBF9B8CFFBF9A
          8BFFBE9A8BFFBD998AFF8C7064C2000000050000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000010000
          00090000001B0000001F0000000F000000020000000000000000000000000000
          000000000003000000140000002C0000002B0000001000000002000000060102
          0F45090B67F9090A68FF02021E7C000000270000002100000024000000260000
          00260000003001011A8F010258FF010154FC00000C630000000D0000000D0809
          4CC2191CA7FF1B1EAFFF0D0E74F2050752E3050650E5050551E904054FEA0304
          4BE903044AEB050458F8050567FF030360FF01023CDA000000200000000F0B0D
          64E92023BFFF2024C2FF1B1DAFFF171AA2FF15179BFF131494FF10128CFF0E0E
          82FF0B0B7AFF0A0A75FF080870FF060568FF02024EF50000002C050507130E0F
          68EA5E60D6FF6668E1FF6264DCFF5F61D6FF5A5BD0FF5557C8FF4F51C0FF494A
          B6FF4545AEFF3E3EA4FF38389AFF2C2C8BFF02034FF40000002B0404050C0E10
          56C03436BBFF4447D9FF4144D4FF585CD5FFC0C1EDFFF6F6FCFFF5F5FCFFBDBD
          E5FF4849B0FF26269AFF212190FF151579FF02033ED70000001F02020204090A
          1F47131587FD272AD4FF2528CFFFD8D9F5FFBABAD5FF4B4B91FF4B4B91FFBABA
          D5FFD9D9EFFF121495FF10118AFF060764FE0101116C0000000C000001010303
          04090D0D42941B1EA7FF262AD5FFE0E1F8FFBDBDD7FF4B4B91FF4B4B91FFBDBD
          D7FFDEDFF3FF15179EFF0D0E7BFF030331B20000001C00000002090A27480B0C
          5ACC050511290E105EC92125BFFF4043D0FF9E9FE2FFE2E2F6FFE2E2F5FF9B9C
          DAFF3839B4FF141596FF04064CDA00010B40020247CD0101194823268BF31B1E
          B2FF090A57C705050E240F126DE3181A96F10B0D5DD80A0D5DDD090A5BDE090A
          57DD111384F407095EEB01010841020247C9070772FF020254F32A2B95FC1D1F
          C4FF1719A1FF070841990C0E57BC08093379010101110000000E000000100000
          001A04052D8C06084CC9030337A0080873FF0A097FFF030258FC20226DB12124
          BAFF1D20C2FF0E1073F40B0D59BF080833720000000400000000000000000000
          000704052E7E07084EC806065FF50D0C87FF080976FF02023BA80506111B2829
          8BDD2527AEFF1E21BEFF101272E80707429B0304225202021738020217380203
          205304053C9F06065DE90E0F8DFF090974FF030452DD00000A1B000000000202
          080C16164875252684DE252699FF1B1D96FF171990FF141585FF111480FF1011
          81FF0C0D7CFF08096BFF050555DE02032C750000040C00000000000000000000
          00000000000000000000050614210C0D2E510E0E38660C0D396D0B0B366D0809
          30660506245101020E2100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0004000000150000002B00000033000000330000003400000035000000350000
          0036000000360000003600000030000000180000000500000000000000000000
          00141615149B34312FFF302C2BFF2A2826FF262322FF221F1EFF1D1B1AFF1917
          16FF151313FF100F0FFF0D0D0CFF040404A40000001800000000000000000000
          0024393534F8827A74FF554840FF493C37FF423731FF13100EFF100C0CFF2D23
          1FFF261C19FF211815FF1F1714FF0C0C0CFA0000002D00000000000000000000
          00243D3937F88B817BFF675B53FF564941FF2F2B29FF323182FF1A1A6CFF2523
          21FF302520FF281E1BFF221A17FF0F0E0DFB0000003100000000000000000000
          001C363330E0847B75FF7E7269FF63554CFF5E5B5AFF615FA1FF35357DFF5654
          53FF3D302BFF312622FF261E1BFF100E0EE90000002700000000000000000000
          000F242120A3706864FF988C86FF7A6D65FFBBB9B9FF5E5CA0FF4C4C8CFFB7B6
          B6FF463A34FF3C302AFF302B28FF0B0B0AB40000001700000000000000000000
          00040505043144403CEC807772FF958B84FFF7F7F7FF2A2984FF232371FFF5F5
          F5FF5E544FFF564F4CFF1F1E1CF2020202430000000600000000000000000000
          0000000000070303032D312D2BC64A4543FF74849DFF436296FF3C588DFF6370
          8BFF353230FF1B1919D10201013F0000000B0000000100000000000000000000
          000000000000000000040000001E202E41A76484AFFF7FA3C6FF4B83B4FF224B
          87FF0B152BB50000002B00000007000000000000000000000000000000000000
          00000000000000000000000000112A4467CCB0C1D8FF96CCECFF70AFD6FF4377
          AAFF0A1F4ACD0000001B00000000000000000000000000000000000000000000
          000000000000000000000001021E1A2F51F9E8EDF4FFA7DDF6FF84C2E5FF6099
          C3FF102F6BF10000033300000000000000000000000000000000000000000000
          00000000000000000000030B19800A1938FEE4E9F0FFCAEBFBFF96D3F1FF689F
          C6FF14346EF1000213A100000000000000000000000000000000000000000000
          00000000000000000000061126AE1F395BFF212D49FF687387FF97B7CBFF7297
          BDFF071235EB000216B400000000000000000000000000000000000000000000
          00000000000000000000061122921F375AFF233E61FF0C2041FF071432FF2C3E
          62FE030927FF0103138800000000000000000000000000000000000000000000
          0000000000000000000002050A280F2444F7264165FF2A476BFF223D60FF0612
          2FFC020715810000020E00000000000000000000000000000000000000000000
          0000000000000000000000000000040A144F07152DC1071633F304102AD90105
          0F58000000010000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0004000000150000002B00000033000000330000003400000035000000350000
          0036000000360000003600000030000000180000000500000000000000000000
          00143D322A9B947C67FF9F5632FF984F2CFF8F4626FF823E1FFF773419FF6D2C
          13FF652710FF61240EFF533F2FFF1E1610A40000001800000000000000000000
          0024927B67F8F4F3F1FFA15733FFC88B66FFC3845EFFBE7D55FFB9764EFFB46F
          46FFB06841FF62250EFF9F9686FF4C3A2BFA0000002D00000000000000000000
          0024937C67F8F5F3F2FFB37B60FFA15733FF9A522EFF904928FF854021FF7A36
          1AFF6F2D14FF794834FFA49C8CFF513E30FB0000003100000000000000000000
          001C7B6856E0E7E0DBFFF1EFEDFF8B563AFFDCD7D1FFD5D0C8FFCDC8BFFFC6C0
          B4FF754328FFB6AEA1FF9E9384FF49392DE90000002700000000000000000000
          000F4C4035A3CABDB1FFFBFAF9FF915C40FFC3BCB4FF8D8176FF7D6F62FFA399
          8EFF7B482DFFBEB6AAFF988C7FFF2F261FB40000001700000000000000000000
          00040A0807318D7867ECDBD1CBFF966144FFA0988EFF8DB2C7FF6184A7FF7161
          54FF814F33FFC4BCB5FF68594CF2070604430000000600000000000000000000
          0000000000070706052D665647C69A6548FF687487FF335990FF2B4E87FF4449
          5DFF885538FF52453BD10504043F0000000B0000000100000000000000000000
          000000000000000000040000001E2B3647A76484AFFF7FA3C6FF4B83B4FF234B
          88FF151D32B50000002B00000007000000000000000000000000000000000000
          0000000000000000000000000011314E72C4B0C1D8FF96CCECFF70AFD6FF4377
          AAFF0A1F4ACD0000001B00000000000000000000000000000000000000000000
          000000000000000000000814224D325D90F74C6D9AFF244C82FF1F447BFF264E
          82FF12316AF8040B195600000000000000000000000000000000000000000000
          000000000000000000001E5488F8459EC5FF55C0E0FF58D1EFFF4BC6EAFF36A1
          CEFF2277ABFF113064F800000000000000000000000000000000000000000000
          00000000000000000000145687E87B98B9FF3A6D9EFF1E4D84FF1B477FFF1B54
          8AFF196196FF0F3463E900000000000000000000000000000000000000000000
          000000000000000000000A3E5E9BA0C1D6FFD3F4FCFF91DDF3FF53C2E6FF48B7
          DFFF5194BBFF0A27469D00000000000000000000000000000000000000000000
          00000000000000000000041B28414B7F9DDAA0C0D5FFE2EBF2FFE2EBF1FF9FBA
          CFFF4A6F8DDB04121F4100000000000000000000000000000000000000000000
          0000000000000000000000000000041B28410B3E5E9B0F5684E10F5380E10A35
          549B041522410000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000010000000A09070663583F36EC573D35EC1911105A000000020000
          00090000000E0000000F00000010000000100000001100000011000000110000
          00130000001A0E0A09745D4C44FEC8A995FFC9A996FF553C34E900000008815A
          4EC0B37E6CFFB37D6AFFB37E6CFFB27D6BFFB27C69FFB17D6AFFBE9081FFD1B6
          ADFF947E77FF6D594FFFD6B6A1FFD4B6A1FFDBC7B9FF584037EC0000000CB581
          6FFFFDFBF9FFFBF5F2FFF9F4F0FFF5EFEBFFF1EBE7FFEEE7E3FFECE4E0FFADA2
          9DFF79645AFFD8BBAAFFD8BBA8FFE6D4C7FF8C766CFE1D15125D0000000CB884
          71FFFDFBFAFFF5EBE4FFEBE1DAFFA29089FF6A534BFF4B332BFF574239FF856F
          64FFDCC1B2FFDCC2B0FFEAD7CCFF978177FF2219166F000000080000000BB886
          75FFFCFAFAFFEAE1DBFF816A61FF937A6FFFBFA99CFFDEC8BAFFC7B0A2FFE0C8
          B8FFDFC7B7FFE9DACFFF9B857BFFA88F87FF00000018000000010000000ABA89
          78FFFAF8F7FFAC9A92FFA08A80FFEEE1D9FFF5EDE7FFF0E4DBFFE9D6C8FFE2CC
          BDFFE2CEBFFFA08A80FFBEB1ABFFD6BBB3FF000000110000000000000009BD8C
          7AFFF8F7F6FF8E7368FFC8B6ADFFB4A098FF8F766AFFB09C93FFD8C8BFFFE5CE
          BFFFD1B9ABFF82675DFFEFE9E5FFC4998AFF0000000F0000000000000009C08F
          7FFFF8F7F6FF8C7165FFB7A299FFBFAFA7FFEEE6E1FFBBAAA1FFAF9B92FFE6D1
          C3FFE6D2C7FF7E6459FFF2EDE9FFBB8A77FF0000000E0000000000000008C394
          84FFFAFAF9FF9D867BFFC7B8B0FFF6F0EAFFF8F1ECFFEAE1DCFF71574DFFE7D4
          C6FFD2C0B8FF8C7369FFF5F0EDFFBC8D7AFF0000000D0000000000000007C597
          87FFFDFDFCFFF8F3EEFFF9F3EFFFFAF4EFFFF7F0ECFFA89791FF937C72FFEEE0
          D8FFB09C92FFB9A8A0FFF9F4F1FFC08F7EFF0000000D0000000000000006C79A
          8CFFFEFEFEFFFAF6F3FFFAF5F3FFF9F4F0FFAB9B93FF8F7A72FFCABAB2FFB6A2
          97FFA38C81FFF4ECE8FFFCF8F6FFC39282FF0000000C0000000000000006CA9E
          8EFFFFFEFEFFFBF7F4FFFBF6F4FFF9F4F2FFAC9589FF987D6FFFA58E85FFC6B6
          AFFFF6EFEAFFF9F4EFFFFDFAF8FFC49687FF0000000B0000000000000005CCA3
          91FFFFFEFEFFFCF8F7FFFCF8F6FFFCF7F5FFFAF5F3FFF8F3F1FFF8F3F1FFFAF4
          F1FFFCF6F2FFFBF6F1FFFDFBF9FFC79A8BFF0000000A0000000000000004CEA4
          95FFFFFFFEFFFFFFFEFFFFFEFEFFFFFEFEFFFEFEFEFFFEFEFEFFFEFEFDFFFEFE
          FDFFFEFDFDFFFEFDFDFFFEFDFCFFC99E8EFF0000000900000000000000029A7B
          6FC0CFA696FFCFA696FFCEA695FFCEA595FFCEA595FFCFA494FFCDA494FFCEA3
          93FFCCA293FFCDA292FFCBA292FF97776BC20000000600000000}
      end>
  end
  object cxLookAndFeelController1: TcxLookAndFeelController
    NativeStyle = False
    Left = 760
    Top = 232
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=scmdb'
      'User_Name=sa'
      'Password=masterkey'
      'DriverID=MSSQL'
      'Server=127.0.0.1')
    LoginPrompt = False
    Left = 808
    Top = 184
  end
  object dxTabbedMDIManager: TdxTabbedMDIManager
    Active = True
    TabProperties.AllowTabDragDrop = True
    TabProperties.CloseButtonMode = cbmActiveTab
    TabProperties.CloseTabWithMiddleClick = True
    TabProperties.CustomButtons.Buttons = <>
    TabProperties.HotTrack = True
    TabProperties.NavigatorPosition = npLeftBottom
    TabProperties.OwnerDraw = True
    TabProperties.RaggedRight = True
    TabProperties.TabPosition = tpBottom
    Left = 56
    Top = 256
    PixelsPerInch = 96
  end
end
