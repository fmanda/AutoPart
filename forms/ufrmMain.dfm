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
    object dxRTUtilities: TdxRibbonTab
      Active = True
      Caption = 'Utilities'
      Groups = <
        item
          ToolbarName = 'dxBarManagerBar13'
        end>
      Index = 6
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
        end
        item
          Visible = True
          ItemName = 'dxBarButton89'
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
      DockedLeft = 318
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
      DockedLeft = 95
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
    object dxBarManagerBar13: TdxBar
      Caption = 'Export - Import'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1384
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton90'
        end>
      OneOnRow = True
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
      ImageIndex = 35
    end
    object dxBarButton2: TdxBarButton
      Action = actSettingKoneksi
      Category = 0
      ImageIndex = 76
    end
    object dxBarButton3: TdxBarButton
      Action = actItemGroup
      Category = 0
      ImageIndex = 21
    end
    object dxBarButton4: TdxBarButton
      Action = actMerk
      Category = 0
      ImageIndex = 37
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
      ImageIndex = 25
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
      ImageIndex = 69
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
      ImageIndex = 31
    end
    object dxBarButton31: TdxBarButton
      Action = actQuotation
      Category = 0
      ImageIndex = 36
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
      ImageIndex = 47
    end
    object dxBarButton34: TdxBarButton
      Action = actCustomer
      Category = 0
      ImageIndex = 26
    end
    object dxBarButton35: TdxBarButton
      Action = actSupplier
      Category = 0
      ImageIndex = 17
    end
    object dxBarButton36: TdxBarButton
      Action = actWarehouse
      Category = 0
      ImageIndex = 78
    end
    object dxBarButton37: TdxBarButton
      Action = actRekening
      Category = 0
      ImageIndex = 79
    end
    object dxBarButton38: TdxBarButton
      Action = actPurchaseInvoice
      Category = 0
      ImageIndex = 16
    end
    object dxBarButton39: TdxBarButton
      Action = actPurchaseRetur
      Category = 0
    end
    object dxBarButton40: TdxBarButton
      Action = actTransferStock
      Category = 0
      ImageIndex = 15
    end
    object dxBarButton41: TdxBarButton
      Action = actStockOpname
      Category = 0
      ImageIndex = 21
    end
    object dxBarButton42: TdxBarButton
      Action = actStockAdjustment
      Category = 0
      ImageIndex = 51
    end
    object dxBarButton43: TdxBarButton
      Action = actKartuStock
      Category = 0
      ImageIndex = 22
    end
    object dxBarButton44: TdxBarButton
      Action = actLapStock
      Category = 0
      ImageIndex = 32
    end
    object dxBarButton45: TdxBarButton
      Action = actLapStockOpname
      Category = 0
      ImageIndex = 69
    end
    object dxBarButton46: TdxBarButton
      Action = actSalesman
      Category = 0
      ImageIndex = 28
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
      ImageIndex = 20
    end
    object dxBarButton49: TdxBarButton
      Action = actAccount
      Category = 0
      ImageIndex = 86
    end
    object dxBarButton50: TdxBarButton
      Action = actVariable
      Category = 0
      ImageIndex = 27
    end
    object dxBarButton51: TdxBarButton
      Action = actUser
      Category = 0
      ImageIndex = 40
    end
    object dxBarButton52: TdxBarButton
      Action = actSales
      Category = 0
      ImageIndex = 23
    end
    object dxBarButton53: TdxBarButton
      Action = actSalesRetur
      Category = 0
      ImageIndex = 5
    end
    object dxBarButton54: TdxBarButton
      Action = actCashIn
      Category = 0
      ImageIndex = 62
    end
    object dxBarButton55: TdxBarButton
      Action = actCashOut
      Category = 0
      ImageIndex = 63
    end
    object dxBarButton56: TdxBarButton
      Action = actInternalTransfer
      Caption = 'Transfer Antar Kas/Bank'
      Category = 0
      ImageIndex = 15
    end
    object dxBarButton57: TdxBarButton
      Action = actCashOpname
      Category = 0
      Visible = ivNever
    end
    object dxBarButton58: TdxBarButton
      Action = actDetPenjualan
      Category = 0
      ImageIndex = 42
    end
    object dxBarButton59: TdxBarButton
      Action = actSaldoKas
      Category = 0
      ImageIndex = 79
    end
    object dxBarButton60: TdxBarButton
      Action = actLapCashOpname
      Category = 0
      ImageIndex = 59
    end
    object dxBarButton61: TdxBarButton
      Action = actMutasiKas
      Category = 0
      ImageIndex = 84
    end
    object dxBarButton62: TdxBarButton
      Action = actBiaya
      Category = 0
      ImageIndex = 63
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
      ImageIndex = 33
    end
    object dxBarButton65: TdxBarButton
      Action = actSalesPayment
      Category = 0
      ImageIndex = 34
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
      ImageIndex = 21
    end
    object dxBarButton67: TdxBarButton
      Action = actPurchaseInvoiceHistory
      Category = 0
      ImageIndex = 85
    end
    object dxBarButton68: TdxBarButton
      Action = actSaldoPiutang
      Caption = 'Laporan Saldo Piutang'
      Category = 0
      ImageIndex = 34
    end
    object dxBarButton69: TdxBarButton
      Action = actSalesInvoiceHistory
      Category = 0
    end
    object dxBarButton70: TdxBarButton
      Action = actEndOfDay
      Category = 0
      ImageIndex = 25
    end
    object dxBarButton71: TdxBarButton
      Action = actSalesInvoiceHistory
      Category = 0
      ImageIndex = 85
    end
    object dxBarButton72: TdxBarButton
      Action = actSettingFee
      Category = 0
    end
    object dxBarButton73: TdxBarButton
      Action = actSettingFee
      Category = 0
      ImageIndex = 42
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
      ImageIndex = 14
    end
    object dxBarButton77: TdxBarButton
      Action = actSalesAnalysis
      Category = 0
      ImageIndex = 82
    end
    object dxBarButton78: TdxBarButton
      Action = actLabaRugi
      Category = 0
      ImageIndex = 83
    end
    object dxBarButton79: TdxBarButton
      Action = actInventoryMov
      Category = 0
    end
    object dxBarButton80: TdxBarButton
      Action = actAgingStock
      Category = 0
      ImageIndex = 85
    end
    object dxBarButton81: TdxBarButton
      Action = actAgingAR
      Category = 0
      ImageIndex = 81
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
      ImageIndex = 39
    end
    object dxBarButton85: TdxBarButton
      Action = actGantiPass
      Category = 0
      ImageIndex = 77
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
    end
    object dxBarSubItem4: TdxBarSubItem
      Caption = 'New SubItem'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarButton89: TdxBarButton
      Action = actLog
      Category = 0
      ImageIndex = 12
    end
    object dxBarButton90: TdxBarButton
      Action = actExportData
      Category = 0
      ImageIndex = 51
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
      OnExecute = actLapStockOpnameExecute
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
    object actLog: TAction
      Category = 'Application'
      Caption = 'Lihat Log'
      OnExecute = actLogExecute
    end
    object actExportData: TAction
      Category = 'Utilities'
      Caption = 'Export Data'
      OnExecute = actExportDataExecute
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
          00000000000000000001000000050000000D0000000F00000005000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000020000000A170F093B72472CC3A1643DFF00000010000000000000
          0000000000000000000000000000000000000000000000000000000000010000
          00060604031955382594AB754CF9D5A670FFA56942FF00000022000000110000
          000D000000080000000300000000000000000000000000000000000000053525
          195F9A6A48E5CB9C6DFFE8C089FFE8C189FFA86F48FF88512EFC724125E4532E
          17B92F1A0D7B090502270000000700000001000000000000000000000008BD8D
          64FFECD4B3FFF1D8ACFFEBCA95FFEAC68FFFE7CBA4FFF2DBB9FFE1C39EFFC59D
          74FFA16F47FF512C16BE1B0E065200000008000000010000000000000004392C
          1F59A8815EE2DBBB97FFF3DFBDFFF0D4A6FFC69C74FFBB8B62FFC49870FFD3AE
          89FFE0C29BFFB78A60FF5C351CCB120A043E0000000400000000000000010000
          000407050415614B378CC39D76F9E7CEADFFC1936AFF060503242B21174E644A
          359AB48F6BECD7B891FFAB7E56FF3C2110970000000A00000000000000020000
          00080000000B0000000F1A140F328A6C4FBBC79A70FF0000000C000000040000
          000C56412F86D2AD87FFD8BD9DFF60351CD50000000F00000000000000062379
          49F9237B4AFF247A4AFF030A06220000000900000009000000060000000A0000
          000B100C0927C5996FFFC4986EFFAE7C57F90000000D0000000000000005246E
          49CE5BC49EFF308E62FF0D311C7E00000008000000030000000A247B4AFF0A37
          1ABF020B053900000015000000110000000D000000030000000000000003194B
          32885BB691FF6DC3A6FF2F7A54EA103B229107190F470104021C267F4DFF34A5
          78FF17633BF9092B169101030218000000060000000100000000000000010919
          112F2C7451C07AC8AAFF8BD7BFFF56A886FF33875DFF207345FF3A976AFF6ADA
          BBFF4BC89FFF30966AFF145530E5061D0F5F0000000600000000000000000000
          00020E251A41266C4BB263BB96FF8AD3BAFFA8E7D6FFBAF3E7FFA4E4D2FF89EA
          D5FF77E1C6FF75DDBDFF80D7BCFF278551FF0000000A00000000000000000000
          000000000002050D091A17412D6A276D4CAD338E64DF3AA06FFB3AA271FF9EF0
          E0FFB4F1E5FF6EC5A3FF348B60E1102E1F5A0000000500000000000000000000
          000000000000000000010000000200000004000000050000000C3EA977FF9AE0
          C9FF4CAC82F81E52398902060415000000040000000100000000000000000000
          000000000000000000000000000000000000000000000000000541AF7DFF2D79
          56B70816102B0000000500000001000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000000000006714F44BE9E6D5DFF9E6C5DFF9D6C
          5CFF9D6B5BFF9C6B5BFF9C6B5BFF9C6A5AFF9B6959FF704B41BE000000000000
          000000000000000000000000000000000009DCC8BFFFF8F1ECFFF7EEE9FFCCAB
          9FFFF7EEEAFFF7EEE9FFCCAB9FFFF7EEE9FFF7EEE9FF9D6C5CFF000000000000
          0000000000000000000000000000000000095B997BFFE4E0D9FFF8F0EBFFDCC3
          BAFFF7EEEAFFF7EEEAFFCCACA0FFF8EEEAFFF9F2EFFF9F7061FF000000000000
          000000000000000000000000000000000008137248FF184E30FFA4AFA2FFF8F0
          EBFFEADBD4FFD1B3A7FFCEADA2FFCDADA2FFD9BFB6FFA37464FF000000000000
          0000000000000000000103190C5C052D17AD147449FF2ECA96FF126B45FF4F6F
          58FFE4E0D9FFF8F0EBFFDCC5BCFFF8F0EBFFFAF4F1FFA67969FF000000070000
          000B0000000C052714861F8259FF30AF82FF3CD4A3FF3EDDABFF3BDCA8FF2EA8
          7DFF1B5033FFA4B0A2FFDDC6BDFFF8F0ECFFF9F3F1FFAA7E6FFF856053BEE3CD
          C3FFA2B8A7FF2B8A64FF6CECC7FF69EBC6FF6EEBC7FF4DE4B5FF5DE7BFFF4AC3
          9BFF2D8860FFAEC6B4FFDEC6BEFFD0B2A7FFDBC4BAFFAE8274FFBB8978FFF8F0
          ECFF5C8D70FF4BB68FFF2A8E64FF298E63FF197A4EFF6BE4C1FF359E76FF61A0
          81FFE5E6DEFFF8F0EBFFDDC6BDFFF8F0EDFFFAF5F2FFB28879FFBE8E7EFFF8F0
          ECFF45946EFF8AB89EFFD4DDD1FFF8F0EBFF1B7D4FFF348F66FFB1CBB9FFF8F0
          EBFFF9F2EDFFFAF5F1FFDCC5BDFFFAF5F2FFFAF4F2FFB68D7FFFC19383FFF1E5
          E0FF90B69DFFEEE1DBFFDDC8C0FFF8F0EBFF66A685FFE6E7DEFFF3E9E3FFCFB2
          A7FFBC9487FFBB9487FFBB9385FFBA9285FFBA9184FF8A6C61C0C59A89FFF9F2
          EEFFF8F0ECFFDCC6BDFFF8EFEBFFF8F0ECFFEDE1DCFFF8F2EDFFFAF6F4FFDCC7
          BEFF0000000B0000000300000004000000040000000300000002C89E8FFFF9F4
          F2FFF8F0EDFFC6A599FFF7F0ECFFF8F0EDFFC5A499FFF8F0ECFFF9F3F1FFC397
          87FF000000070000000000000000000000000000000000000000C48F63FFDBB5
          8FFFCF9F71FFCF9E6FFFCF9D6EFFCF9D6EFFCE9B6EFFCE9A6CFFDAB089FFC28B
          5FFF000000070000000000000000000000000000000000000000C79469FFEEDA
          B8FFE9CEA3FFCDA381FFE8CEA3FFE8CEA3FFCCA27EFFE8CDA3FFEED9B7FFC491
          65FF000000060000000000000000000000000000000000000000CA9A6EFFEFDA
          B9FFEEDAB8FFDBBA9EFFEEDAB8FFEEDAB8FFDAB89BFFEEDAB8FFEEDAB8FFC897
          6BFF000000050000000000000000000000000000000000000000987655BFCC9E
          71FFCC9D71FFCC9C70FFCB9B6FFFCA9A6EFFC9986DFFC9986CFFCC9C70FF9774
          53C0000000030000000000000000000000000000000000000000}
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
          2000000000000004000000000000000000000000000000000000000000090000
          000E000000100000001000000010000000100000001000000011000000110000
          0011000000110000001100000011000000100000000B0000000377544AC1A474
          66FFA47465FFA47465FFA37364FFA37264FFA27263FFA27263FFA27162FFA271
          62FFA17062FFA17061FFA17061FFA17061FF735046C30000000AAC7E71FFF8F1
          EEFFF8F0EDFFF8F1ECFFF8F0ECFFF8F0ECFFF5EDE9FFF2EAE6FFF5EDE9FFF8EF
          EBFFF7EFEBFFF7EFEBFFF7EFEBFFF7F0EBFFA8796AFF0000000FAD8172FFF8F2
          EFFFF6EDE8FFF7EDE8FFF6ECE8FFF4EBE6FFE6DBD6FFA87A62FFE7DCD8FFF5EB
          E6FFF6EDE7FFF6ECE8FFF6ECE8FFF8F0ECFFA97B6BFF00000010AF8375FFF9F2
          EFFFF6ECE8FFF6EDE9FFF6ECE7FFEDE5E0FFAD836EFFC58A51FFB08975FFEDE4
          E0FFF6ECE7FFF6ECE8FFF6ECE8FFF8F1EDFFAA7C6DFF0000000FB18577FFF9F3
          F0FFF7EDE9FFF7EDE8FFF3EAE5FFCDB3A8FFAC6E41FFF7C67AFFA96B40FFCDB6
          ABFFF1E8E4FFF7EDE8FFF6EDE9FFF9F1EDFFAB7E6FFF0000000EB2887AFFF9F4
          F0FFF7EEE9FFF5EBE7FFE4D8D1FFA06544FFEFBE79FFF9CA82FFEDBB78FF9F63
          42FFE3D7D2FFF4EBE7FFF7EEE9FFF8F1EEFFAD8072FF0000000EB48A7CFFF9F4
          F1FFF7EEEAFFF4EBE7FFC69E83FFB47C54FFB47B53FFFACF88FFB37851FFB277
          4FFFC3987EFFF2E9E5FFF7EEE9FFF9F2EFFFAF8274FF0000000DB68D7FFFFAF4
          F2FFF7EEEAFFF6EDE9FFF2E9E5FFE9E1DDFFB77F57FFFDD48EFFB1744CFFE8DF
          DBFFF1E7E4FFF6EDE9FFF7EEEAFFF9F2EFFFB08476FF0000000CB88F82FFFAF5
          F2FFF7EEEAFFF7EEEBFFF7EEEAFFF0E7E5FFBA845CFFFEEAC1FFB2774FFFEFE7
          E3FFF7EEEAFFF7EFEAFFF7EEEAFFF9F3F0FFB28679FF0000000CB99184FFFAF5
          F3FFF8EFEBFFF7EFEAFFF7EFEBFFF2EAE6FFCB9E76FFCB9E76FFCB9E76FFF2E8
          E5FFF7EFEAFFF7EEEAFFF7EFEBFFFAF4F1FFB3897BFF0000000BBB9387FFFAF6
          F4FFF7EFEBFFF7EEEBFFF8EFEBFFF6EDEAFFF2EAE6FFF1E9E5FFF2EAE6FFF6ED
          EAFFF7EFEBFFF7EFEBFFF7EEEBFFFAF3F2FFB58B7DFF0000000AD4A477FFD8B1
          8BFFD2A373FFD1A372FFD1A272FFD1A170FFD0A070FFD09F6FFFCF9F6EFFCE9E
          6DFFCF9D6CFFCE9C6BFFCE9C6AFFD3A77CFFCE9764FF00000009D4A678FFEED7
          B6FFE2BB87FFE2BA86FFE2B985FFE2BA85FFE2BA85FFE1B984FFE1B984FFE1B8
          84FFE1B883FFE1B883FFE0B783FFEBD0AAFFCE9864FF00000009D4A679FFF1DC
          BCFFF0DCBCFFF0DBBCFFF0DBBCFFF0DCBBFFEFDABBFFEFDABBFFEFDABAFFEFDA
          B9FFEFD8B9FFEFD9B8FFEFD8B6FFEED5B1FFCE9865FF000000089E7B5AC0D4A6
          79FFD4A577FFD4A476FFD3A375FFD3A272FFD2A071FFD1A06FFFD09F6FFFD09D
          6DFFD09C6CFFD09B6AFFCF9B68FFCF9A67FF99714BC200000005}
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
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000030000000B00000013000000190000001A0000
          00140000000B0000000300000000000000000000000000000000000000000000
          000000000000000000060402011C4827118B7C431ED2A65927FFA55927FF7E44
          1ED442230F7B0100000F0000000E000000070000000000000000000000000000
          000000000005120A05348A4F26DDC58A53FFDCB37CFFEFD298FFEFD198FFB676
          43FF2E1A0C62100904398F5127E10E05013A0000000600000000000000000000
          0002040201198D552BDCD1A169FFF1D6A5FFCE9E6EFFC08656FFBD8251FF613A
          1DA6000000227D4B26CBE2B97BFF5F290FCF0101001900000003000000000000
          00074C2F1B82C99765FFECD2A3FFB98154FB5238238A120C07300F0A06270201
          01194C2F1B88CE9D66FFF6DC9BFFBA8657FF3F1C0C910000000D000000000000
          000A8C5B36D0E3C598FFCB9D75FF573B258C0000000C00000003000000062014
          0C43BD875AFBF8E5BCFFF8DFA5FFF7E4BAFFA16540FC1C0E074C000000080000
          0014B37A4BFAF5E6BDFFBC8356FF0D0704300000000C00000003000000079666
          3FD5B87D4DFFBB8153FFF2D9A1FFB87D4DFFB87C4DFF9C6941DE845331D3A263
          3BFFBB8557FFF6E7BFFFBF8B5EFFA06238FF87522FDC00000006000000020000
          000B0D08042FA1653CFFF4DEAEFFB68155FA000000180000000A1F170F34C79D
          75FBFBF5DCFFFCF3CCFFFAF4DAFFB3855FFB21150C4100000004000000020000
          0009492C1886BA8B5EFFE7CEA7FF926B48CB0000000900000000000000045540
          2D77DDC1A2FFFDF7D9FFD4B598FF5037227F0202010C0D08041F110A05274B2D
          1986A1683EFAF3E4C3FFD8B692FF533F2C780000000400000000000000000000
          00058F6F50BCEFE1CDFF886343C20202010D58382091A3693CFFA66F43FFBE94
          6DFFF4E9D1FFE3CAADFFA47E5BD60504030E0000000100000000000000000000
          0001130F0B1DAB8863DA18130E242C1E1248B78B63FDF8F3E2FFF9F3E4FFEDDE
          C7FFDCC1A1FFA3815ED215110C22000000020000000000000000000000000000
          000000000001000000010101000342301E629A7B5CC2C6A078F9C6A078F9997B
          5DC3564634710504030A00000001000000000000000000000000000000000000
          0000000000000000000000000000000000010000000200000002000000020000
          0002000000010000000000000000000000000000000000000000000000000000
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
          0000000000000000000200000007000000070000000400000007000000070000
          0004000000070000000700000002000000000000000000000000000000000000
          000000000000352A288A614D4AFF6B5955FF7A6865FF786865FF756460FF705D
          5AFF604D49FF5B4743FF33272687000000000000000000000000000000000000
          0000000000005C4843EAAE9E95FFB5A69EFF9C887DFFBEB1AAFFBAACA5FF957F
          74FFB2A39AFFA99990FF574540E3000000000000000000000000000000000000
          00000000000068524CFFD9CBC3FFD1C6BFFF9E8B81FFDFD3CDFFD5CAC3FF9682
          77FFD9CBC3FFCCC0B8FF67514BFF000000000000000000000000000000000000
          0000000000006A5550FFD9CBC3FFD1C6BFFFA18E83FFDFD3CDFFD4CAC3FF9A86
          7BFFD9CBC3FFCCC0B8FF69544FFF000000000000000000000000000000000000
          0000000000006E5953FFD9CBC3FFD1C6BEFFA49188FFDED3CCFFD4C9C3FF9D89
          7FFFD9CBC3FFCCC0B8FF6D5852FF000000000000000000000000000000000000
          000000000000725C56FFD8CBC3FFD1C5BEFFA6958BFFDED3CCFFD4C9C2FFA08D
          83FFD8CBC3FFCCC0B8FF715B55FF000000000000000000000000000000010000
          000100000003755F58FFD5C7BFFFCDC1BBFFA6968DFFDACFC8FFD0C5BFFFA190
          86FFD5C7BFFFC8BCB5FF745E57FF000000030000000100000001000000010000
          00030101010874605AFFCDC0B9FFC5BAB3FFA6958DFFD3C8C1FFC8BEB8FFA08F
          85FFCCBFB7FFC0B5AEFF735F59FF010101090101010400000001000000010101
          01060202020E76625BFFC1B6AFFFBAAFA9FFA3948DFFC6BBB5FFBDB3ADFF9E8F
          87FFC0B4ADFFB6ABA4FF76625BFF0202020F0101010600000002000000010101
          010669514BFF6A524CFF6B534DFF6E5751FF725B56FF735D57FF725B56FF6E57
          51FF6B534DFF6A524CFF69514BFF69514BFF0101010600000002000000010000
          00036B544DFFAB9588FFB29D91FFBFAEA4FFCEC0B9FFD3C8C1FFCEC0B9FFBFAE
          A4FFB29D91FFAB9588FFAA9386FF6B544DFF0000000300000001000000000000
          000141332E97907E78FFB0A39FFFC5BBB8FFD2CAC8FFD6D0CDFFD2CAC8FFC7BE
          BBFFBAAFABFFAA9D98FF8D7A73FF40322E950000000100000000000000000000
          00000000000055433EC46F5852FF8D7971FF8E7A72FF715B55FF715A54FF8D79
          71FF8C7870FF6E5751FF55433EC4000000000000000000000000000000000000
          0000000000000000000001010101725B55FF453836900C0C0C0C0B0B0B0B4236
          348C725B55FF0000000000000000000000000000000000000000000000000000
          00000000000000000000010101015A4844C4887570FF8F7D78FF8E7D78FF8976
          71FF594743C40000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000070000
          000B0000000B0000000B0000000C0000000C0000000C0000000C0000000C0000
          000C0000000C0000000C0000000C0000000C00000008000000027F5447BEB074
          62FFAF7461FFAF7460FFAE735FFFAE725FFFAD715EFFAD715EFFAC705CFFAC70
          5CFFAC6F5BFFAC6F5BFFAB6F5BFFAB6E5AFF7B4F40BF00000008B67E6CFFFBF6
          F3FFFAF5F2FFFAF5F2FFFAF5F2FFFAF5F1FFFAF4F1FFFAF4F1FFF9F4F0FFF9F4
          F0FFF9F3F0FFF8F3EFFFF9F3EFFFF8F2EEFFB37968FF0000000BB77F6FFFFBF7
          F4FF6585B8FF2A5BA5FF2A5AA5FF6483B8FFF6EEE9FFF7EEE8FFF6EEE8FF6282
          B7FF2858A4FF2758A3FF6281B6FFF9F4F0FFB47B6AFF0000000BB88171FFFBF8
          F5FF2E5DA7FF97D2F6FF74C0F2FF2C5BA6FFF7EFEAFFF7EFE9FFF7EEE9FF2A59
          A4FF84C8F3FF65B7F0FF2858A4FFFAF4F2FFB47C6BFF0000000BB98472FFFCF9
          F7FF2F5FA8FFA2D8F7FF7EC6F3FF2D5DA7FFF8F0EBFFF7F0EBFFF7F0EAFF2C5C
          A6FF8ECEF5FF6DBCF2FF2A5AA5FFFAF6F3FFB67F6DFF0000000ABB8674FFFDFA
          F8FF997164FFE2CAC3FFD4B2A9FF966E61FF1A6DD3FF1A6DD3FF196CD3FF2E5E
          A7FF9AD4F6FF76C2F3FF2C5CA6FFFAF7F5FFB7806FFF00000009BB8674FFFDFA
          F8FF9C7367FFE4CDC6FFD4B3A9FF997063FFF8F2EDFFF8F1EDFFF8F1ECFF966E
          60FFE2C9C3FFD4B2A9FF956C5FFFFAF7F5FFB7806FFF00000009BF8C7AFFFEFC
          FBFF9E766AFFF2E6E2FFF2E6E2FF9B7366FFF9F4F1FFF8F4F0FFF9F3EFFF9870
          63FFE3CCC5FFD5B3AAFF966D60FFFCFAF9FFBB8675FF00000008C08D7DFFFEFD
          FCFFB89A90FFA0796DFF9F786BFFB6978DFFBCD0E9FFF9F4F1FFF9F4F0FF9A72
          66FFE4CEC7FFD5B4AAFF986F62FFFDFBFAFFBC8877FF00000008C28F7EFFFEFD
          FDFFFBF6F3FFFAF6F4FFFAF7F3FFFAF6F3FF3680D8FFBDD1EAFFFAF4F2FF9D75
          69FFE6D1CAFFD5B6ABFF9A7266FFFDFCFAFFBE8A79FF00000007C39281FFFEFE
          FDFFFBF7F4FFFBF7F4FFFAF7F5FFFBF7F4FFD2DEEEFF3881D8FFBDD1EBFFA079
          6DFFE7D2CCFFD6B6ABFF9E7569FFFDFCFCFFBF8D7BFF00000007C49483FFFFFE
          FEFFFBF8F5FFFBF7F6FFFBF8F5FFFBF7F5FFFAF7F5FFD3DFEFFF3983D9FFA37C
          70FFF3E9E5FFF3E9E5FFA0786DFFFEFDFCFFC08F7EFF00000006C59584FFFFFE
          FEFFFCF8F7FFFBF8F6FFFCF8F6FFFBF8F5FFFBF8F6FFFBF8F5FFD4E0EFFFBC9E
          95FFA57F73FFA47E71FFBA9D91FFFEFDFDFFC2907FFF00000005C69786FFFFFF
          FEFFFFFFFEFFFFFEFEFFFFFFFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFEFE
          FEFFFEFEFEFFFFFEFEFFFFFEFDFFFEFEFDFFC39281FF000000059A796DBFCFA4
          94FFCFA393FFCEA393FFCEA393FFCEA292FFCEA292FFCDA292FFCDA191FFCDA0
          90FFCCA090FFCC9F8FFFCB9E8EFFCB9E8EFF967569C000000003}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000010000000300000003000000010000000000000000000000000000
          0002000000060000000A0000000A000000060000000200000000000000000000
          000100000005122615750F1F1069000000050000000100000000000000000000
          00061F4124C3295830FF295630FF1F3F23C30000000600000000000000000000
          00030A140C4532724AFB2B673EF90710083C0000000300000000000000000000
          0008316840FF50CB9DFF3EC28FFF31673FFF0000000900000000000000020408
          041E2B5D3AE940BD8DFF3BB786FF25532EE30306031C00000002000000000000
          0008336C44FF53CEA2FF3EC793FF336B41FF00000009000000000101010A2248
          2BC040AF82FF3DCA99FF3DC998FF37A97AFF1E3F23BE0001010B000000010000
          0008346F47FF55D4AAFF3CC997FF346D45FF000000080000000018331E8B51A1
          7EFF72DEBEFF58D5AEFF40CC9FFF57D4ADFF4C9A76FF152C1889000000040000
          000736734CFF5BD6B0FF3FCB9CFF357149FF00000008000000003A875DFF3A85
          5CFF39835AFF64D8B4FF46CEA4FF37774EFF37764DFF37764DFF000000050000
          000737784FFF64D9B8FF46CEA4FF36754CFF0000000700000000000000040000
          000A3B895FFF6DDBBCFF4FD1AAFF397C53FF0000000B00000005000000010000
          0006387B53FF71DCBEFF4ED1AAFF387950FF0000000700000000000000000000
          00053D9067FF78DFC3FF56D3B0FF398057FF0000000600000000000000000000
          00063A8158FF7BE0C6FF56D3B0FF397D53FF0000000600000000000000000000
          00043D946CFF83E2CBFF5DD5B6FF3B865DFF0000000500000001000000040000
          00093C875DFF85E2CCFF5DD5B6FF3A8158FF0000000A00000005000000000000
          00043E9A72FF8BE5D1FF63D7BBFF3C8A61FF0000000400000003337149FF3371
          49FF3D8B61FF64D8BCFF64D8BCFF3C885EFF326E46FF326E46FF000000000000
          00033E9E76FF93E7D6FF69DAC1FF3E9066FF0000000400000002204C36887EC3
          A9FF9EE9DBFF75DEC7FF68DAC1FF74DEC6FF66B195FF173B2786000000000000
          00033FA278FF9AE9DAFF6DDBC5FF3E946AFF0000000300000000010201062F6E
          50BE9BD8C6FF9CE9DAFF79DFCBFF7DCBB5FF225B3CBB01010107000000000000
          00023FA57DFFA0EBDDFF70DDC9FF3F996EFF000000030000000000000001050D
          091944926EE7B0E9DBFFA5E2D4FF337956E10309061700000001000000000000
          00013EA881FFC5F4ECFFC5F4ECFF409F72FF0000000200000000000000000000
          00010E23193D5DAF8AFA4C9A75F8091911340000000100000000000000000000
          00012F7F61BE3FAA82FF3FAA82FF2F7D5FBE0000000100000000000000000000
          0000000000011A47366E153C2D62000000010000000000000000}
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
          00000000000000000000000000000000000F4C4C4CC7626262FF343B9EFF2D36
          97FF262D8DFF1F2681FF181E74FF121767FF414141FF303030BD000000000000
          00000000000000000000000000030D0D0D39787878FFDCDCDCFF3941A2FF5B65
          CEFF4E57C2FF3E47B1FF31389EFF171D72FFA1A1A1FF4C4C4CFF000000000000
          000000000000000000000000000514141450808080FFDEDEDEFF656BB2FF3840
          A2FF333B9EFF2C3595FF252D8AFF43488AFFA5A5A5FF525252FF5D4B3BBD7960
          4BFF7D543CFF7A5037FF754B31FF644331FF7B7B7BFFDFDFDFFFDCDCDCFF1F27
          7EFFCECECEFFC6C6C6FF171D6EFFB3B3B3FFAAAAAAFF434343D28D7563FFE0DC
          D8FF9B7965FFCC9F84FFC2967BFFA77F66FF736861FF959595FFD8D8D8FF242D
          85FFCCCCCCFFC3C3C3FF1C2275FFB2B2B2FF6D6D6DFF1C1C1C68947F6DFFE2DE
          DAFFB29989FF9A7864FF926E58FF86624CFF74523EFF695B52FF6D6F71FF253B
          80FF3A567AFE375478FE1E3275FF505254F21A1A1A5A00000000796657D2E3DF
          DBFFE0DDD8FF926953FFD3CFCAFFCBC7C1FF794D34FFA5A09AFF556272FF607A
          9AFF7BA5C6FF4F89B8FF2E5B88FF0F1E30780000000000000000372D2468A593
          84FFDDD8D3FF9B755FFFD2CCC7FFC9C5BEFF81563DFFA19C96FF2F4968FFB6C2
          D1FF7FBEE3FF6EB0DBFF4D86B2FF173152C20000000100000000000000002F26
          1F5A7B6758F25F5A63FF3C5678FE395476FE50494FFF465154F834739EFE65A1
          C5FF3B80ADFF316F9FFF346D9EFF1F4877FB060F1C4500000000000000000000
          000014223475607A9AFF7BA5C6FF4F89B8FF284E75FF4198C1FD5FCDE3FF61DF
          EFFF5AEBFAFF4EE0F9FF3DBFE5FF2B93C4FF15386EF800000002000000000000
          00001C3859BEB6C2D1FF7FBEE3FF6EB0DBFF43759BFF317094F574B0D1FF69A7
          C9FF3D86B2FF2F77A7FF2776ABFF1D65A1FF0D254CBB00000004000000001128
          323F34749FFB67A4C7FF3D84B1FF3375A4FF346A99FF214C71FD6392AEF3ADC9
          DDFFC5EBF3FF87DFF1FF3A9CCCFF1E5785E4050D1B5100000003000000004299
          C2F75FCFE4FF62E0EFFF5BEBFAFF4EE1F9FF3DBEE4FF2989B5FF1D466EFB204B
          67C628618DF0235483EE133252B807111F5B0000000900000001000000002E6B
          89B276B4D3FF6BAACCFF448CB7FF377DACFF2A7CAFFF216DA6FF123052B70000
          001B000000240000002000000014000000080000000100000000000000001127
          32406699B4DAB1D1E3FFE7F0F5FFBFE9F4FF61B1D6FF266896DA091522400000
          0000000000000000000000000000000000000000000000000000000000000000
          00001127324026597399347AA3E030729BE01D4764990B1B2740000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000040000
          00150000002B000000330000003300000034000000360000003D0D0603662F15
          0AAF481F0EDF552310FB3F1A0BD7260F06900A04022D00000003000000140A20
          409B1952A1FF19509DFF194F9BFF184F97FF164990FF213F6FFF4F3331FF893B
          1AFF9D411AFFA9451BFF903A16FF6F2D11FF321509B50A04022D00000024164C
          9AF870A6DDFF3D88D5FF3987D2FF3582CEFF2A77BAFF4C4853FF984320FFC253
          23FFDEA993FFFFFFFFFFD7A590FFA44118FF6F2D11FF260F068D00000024174F
          9AF870A6DDFF468ED7FF3A88D3FF3483CFFF2971B0FF6E3F2FFFBD5427FFCD59
          27FFC45423FFFFFFFFFFB34A1DFFAC461AFF8F3A16FF401A0BD30000001C1342
          7FE06197D3FF5899DBFF3986D4FF3682D0FF296DAAFF8A4124FFDA622DFFD55D
          2AFFE6AE96FFFFFFFFFFBB4E20FFB44A1DFFA9441AFF532410FA0000000F0C28
          4FA3457CC1FF72A9E0FF4D92D8FF3769A9FF2D3D64FF763C28FFCC5D2DFFDD62
          2EFFD55D2AFFDA8561FFC35424FFBB4E20FF9D411BFF491E0ED7000000040205
          0A311A4D91EC568DCCFF75ABE1FF435078FF7297B4FF644946FFB4532AFFE366
          31FFE68961FFFFFFFFFFDA8561FFC25323FF893B1AFF30150A9A000000000000
          00070104072D10366BC62A64AEFF354D7FFF2E548BFF2F3E62FF67382BFFB453
          2AFFCC5C2CFFE58C66FFBD5427FF984320FF4A2110C40D06033D000000000000
          0000000000040000001E1B304EA76484B0FF7EA2C4FF477BA9FF2A3C62FF4A29
          24E970351CE9884022FC683019E23E1D0EA60F0704420000000A000000000000
          000000000000000000112A4467CCB0C1D8FF96CCECFF6FAED4FF4073A4FF091C
          43D20000003B0000002900000021000000140000000700000001000000000000
          0000000000000001021E1A2F51F9E8EDF4FFA7DDF6FF84C2E5FF6099C3FF102F
          6BF1000003330000000000000000000000000000000000000000000000000000
          000000000000030B19800A1938FEE4E9F0FFCAEBFBFF96D3F1FF689FC6FF1434
          6EF1000213A10000000000000000000000000000000000000000000000000000
          000000000000061126AE1F395BFF212D49FF687387FF97B7CBFF7297BDFF0712
          35EB000216B40000000000000000000000000000000000000000000000000000
          000000000000061122921F375AFF233E61FF0C2041FF071432FF2C3E62FE0309
          27FF010313880000000000000000000000000000000000000000000000000000
          00000000000002050A280F2444F7264165FF2A476BFF223D60FF06122FFC0207
          15810000020E0000000000000000000000000000000000000000000000000000
          00000000000000000000040A144F07152DC1071633F304102AD901050F580000
          0001000000000000000000000000000000000000000000000000}
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
          0000000000000000000000000000000000000000000000000000000000020000
          000A0000000B0000000400000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000500000010000000240B19
          2A740F2037850000001200000000000000000000000000000000000000000000
          00000000000000000002000000070000001404070B38152C479F254F84ED3778
          B0FF26528BF60103053300000004000000000000000000000000000000000000
          00020000000A000000170C18245A224368BE3669A0FA4C94C4FF5FBFE8FF5ECA
          F3FF3980B6FF0E20379000000010000000000000000000000000000000080205
          071E1A30467F325C8AD84D88BAFF6BB3DAFF7CD5F4FF75D4F6FF67C8EDFF51A6
          D1FF54B3DFFF214575E0000000210000000200000000000000001C32456D487E
          AFF16AA7D1FF8BCEEBFF96E3F9FF8CDFF9FF72C0E2FF5091BBFF3C74A3FF4B93
          BFFF65CBF0FF3773ABFF091420640000000900000000000000001627365966A2
          CEFFA9EAFCFF9EE3F8FF76B3D3FF5185AEFF4D83AEFF65ACD0FF76D1F1FF73D3
          F5FF65BEE4FF5099C7FF1D3C61C0000000170000000100000000010202104274
          A3E29DDCF2FF5B8CB1FF6599BDFF83C6E3FF91E1F9FF82D4EFFF60A4CAFF437A
          A7FF3F75A3FF5AA1C7FF35689FFA04080D3C000000050000000000000006233F
          588677B4D9FFA6E6F8FFA4E8FCFF88C9E4FF6198BDFF4879A4FF5F9BC2FF5A98
          BFFF528FB6FF61A6CAFF5291BFFF19324C990000000F0000000000000002060A
          0E20508BBEF8A6E6F8FF5E8DB2FF5988AFFF79B4D3FF96DFF5FF629DC0FF497D
          A6FF5993B8FF69AACCFF72B6D8FF346193E80101021F00000002000000000000
          0007315779AB89C7E5FF9EDBEFFFA9EBFCFFA6EAFCFF6079C0FF040493FF263E
          92FF6199BDFF72B1D1FF85C9E4FF5892C3FF1222326700000006000000000000
          0002111E2A4363A0CEFFAEEDFDFFAEEDFDFFACEBFDFF5F61CFFF2D2DB5FF0407
          93FF6DA4C5FF71ADD0FF609BC7FF4177A9F2192F447600000007000000000000
          00000000000742729DCF9AD8F1FFAEEDFDFFAEEDFDFF85A2EAFF5E5ED0FF617C
          C5FF528ABDFF386591D51B30457A0304061F0000000A00000002000000000000
          00000000000320384C6A76B4DBFFAEEDFDFFA1DFF5FF78B6DBFF508ABEF82E52
          74AB101C284A0000000F00000007000000020000000000000000000000000000
          0000000000010305070F538DBDED6EACD8FF477CABDF2440587F060A0E200000
          0008000000040000000100000000000000000000000000000000000000000000
          0000000000000000000221384B62192B3A4F0000000700000004000000010000
          0000000000000000000000000000000000000000000000000000}
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
          0004000000150000002B00000033000000330000003400000035000000350000
          0036000000360000003600000030000000180000000500000000000000000000
          00143D322A9B947C67FF8F7763FF89715FFF826C59FF7A6553FF735E4CFF6A55
          44FF624E3DFF5A4636FF533F2FFF1E1610A40000001800000000000000000000
          0024927B67F8F4F3F1FFCEB1A4FFC7A694FFD0CAC1FFBD9885FFB88E78FFB8B0
          A4FFB0856FFFAE7D64FF9F9686FF4C3A2BFA0000002D00000000000000000000
          0024937C67F8F5F3F2FFD3B9ABFFCAAB9CFFD6D0C9FFC09E8BFFBC9581FFBFB7
          ACFFB38A74FFB0836DFFA49C8CFF513E30FB0000003100000000000000000000
          001C7B6856E0E7E0DBFFE9DFDAFFDBCDC5FFDCD7D1FFCFC0B5FFC8B8ACFFC6C0
          B4FFBCA899FFB5A190FF9E9384FF49392DE90000002700000000000000000000
          000F4C4035A3CABDB1FFFBFAF9FFEEEAE7FFC3BCB4FF8D8176FF7D6F62FFA399
          8EFFC5BEB4FFBEB6AAFF988C7FFF2F261FB40000001700000000000000000000
          00040A0807318D7867ECDBD1CBFFFBFBFAFFA0988EFF8DB2C7FF6184A7FF7161
          54FFDED9D4FFC4BCB5FF68594CF2070604430000000600000000000000000000
          0000000000070706052D665647C6AB9787FF687487FF335990FF2B4E87FF4449
          5DFF99887CFF52453BD10504043F0000000B0000000100000000000000000000
          000000000000000000040000001E2B3647A76484AFFF7FA3C6FF4B83B4FF234B
          88FF151D32B50000002B00000007000000000000000000000000000000000000
          00000000000000000000000000112A466ECCB0C1D8FF96CCECFF70AFD6FF4377
          AAFF0A1F4ACD0000001B00000000000000000000000000000000000000000000
          000000000000000000000001041E1A346EF9E8EDF4FFA7DDF6FF84C2E5FF6099
          C3FF102F6BF10003073300000000000000000000000000000000000000000000
          00000000000000000000020D2E800B2162FEE4E9F1FFCAEBFBFF96D3F1FF689F
          C6FF14356FF102122CA100000000000000000000000000000000000000000000
          00000000000000000000031444AE486C9EFF203570FF69789FFF97B9D4FF7298
          BEFF0B2552EB041634B400000000000000000000000000000000000000000000
          0000000000000000000003123B92446699FF5A82B0FF355990FF152D68FF2E49
          7BFE072352FF0312298800000000000000000000000000000000000000000000
          0000000000000000000001051128173273F7597EACFF648DB8FF4E76A5FF0B20
          59FC041128810002040E00000000000000000000000000000000000000000000
          0000000000000000000000000000020A214F04164CC1041A5BF303144DD90107
          1C58000000010000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000001511C6FF1511C6FF1511C5FE00000000AB6F4DFFAB6F
          4DFFA76C4BF9000000000070EEFF0070EEFF0070EEFF00000000000000000000
          000000000000000000000C0CCDFF0C0CCDFF0C0CCDFF00000000B06F48FFB06F
          48FFB06F48FF000000000070EEFF0070EEFF0070EEFF00000000000000000000
          000000000000000000000C0CCDFF0C0CCDFF0C0CCDFF00000000B06F48FFB06F
          48FFB06F48FF000000000070EEFF0070EEFF0070EEFF00000000000000000000
          000000000000000000000C0CCDFF0C0CCDFF0C0CCDFF00000000B06F48FFB06F
          48FFB06F48FF000000000070EEFF0070EEFF0070EEFF00000000000000000000
          000000000000000000000C0CCDFF0C0CCDFF0C0CCDFF00000000B06F48FFB06F
          48FFB06F48FF000000000070EEFF0070EEFF0070EEFF00000000000000000000
          000000000000000000001511C6FF1511C6FF1511C5FE00000000B06F48FFB06F
          48FFB06F48FF000000000070EEFF0070EEFF0070EEFF00000000000000000000
          0000000000000000000000000000000000000000000000000000B06F48FFB06F
          48FFB06F48FF000000000070EEFF0070EEFF0070EEFF00000000000000001F24
          BBFF181CB3FF1016ACFF0C11A8FF0C11A8FF0C11A8FF00000000B06F48FFB06F
          48FFB06F48FF000000000070EEFF0070EEFF0070EEFF00000000000000000000
          00001F24BBFF0F1272A300000000000000000C11A8FF00000000AB6F4DFFAB6F
          4DFFA76C4BF9000000000070EEFF0070EEFF0070EEFF00000000000000000000
          0000000000001C21ACEA0F1272A3000000000000000000000000000000000000
          000000000000000000000070EEFF0070EEFF0070EEFF00000000000000000000
          000000000000262AB9F2141777A3000000000000000000000000000000000000
          000000000000000000000070EEFF0070EEFF0070EEFF00000000000000000000
          0000373CD3FF1F2282A30000000000000000171CB3FF00000000000000000000
          000000000000000000000070EEFF0070EEFF0070EEFF00000000000000004347
          DEFF3F43DAFF383CD3FF3034CBFF272CC3FF1F24BAFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000002B2B2B725D5D
          5DFF5A595AFF575657FF535353FF505050FF4D4D4DFF4A4949FF434242FF4242
          43FF404040FF3E3D3DFF3B3A3BFF393838FF363536FF17161772616161F8B1B1
          B1FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FF696996FF4F4F7BFFB0B0
          B0FFC4C4C4FFC7C7C7FFC7C7C7FFC7C7C7FFA8A8A8FF353435F8626162F3F4F4
          F4FFF9F9F9FFF7F7F7FFF4F4F4FFF2F2F2FF7E7EAEFF1E1E8CFF18187EFF5858
          85FFD7D7D7FFE7E7E7FFE5E5E5FFDEDEDEFFC0C0C0FF363436F35A5A5AD8E6E6
          E6FFFBFBFBFFF9F9F9FFF7F7F7FFF4F4F4FF262680FF3535BEFF2A2AA6FF1A1A
          6DFFD2D2D2FFE8E8E8FFE6E6E6FFE4E4E4FFB2B2B2FF323132D8505050BAD7D6
          D7FFFDFDFDFFFBFBFBFFF9F9F9FFF6F6F6FF55559CFF3232BAFF2C2DADFF3E3E
          7FFFD8D8D8FFE9E9E9FFE8E8E8FFE2E2E2FFA3A2A3FF2D2C2DBA4646469FC8C8
          C8FFFFFFFFFFFDFDFDFFFAFAFAFFF3F3F3FF8686B9FF2929A7FF2929A5FF6B6B
          9AFFDDDDDDFFE8E8E8FFE9E9E9FFDFDFDFFF959596FF2928299F3A3B3A81B8B8
          B9FFFFFFFFFFFCFCFCFFECECECFFB7B7B7FFA8A8C4FF222296FF212194FF9797
          B4FFAFAFAFFFD8D8D8FFE7E7E7FFDCDCDCFF888788FF2222228129282857A3A3
          A3FFFFFFFFFFF7F7F7FF949595FF555554FF6D6D84FF141484FF12127BFF7D7D
          94FF565757FF808080FFDBDBDBFFD9D9D9FF757475FF18181857090809127E7E
          7FFCFDFDFDFFEDEDEDFF484848FFE6E6E6FF59595CFF181865FF23237BFF6869
          6AFFD8D8D8FF404141FFC4C4C4FFCDCDCDFF555455FC05050512000000005353
          53AED3D3D4FFAFAFAEFF888888FFF5F5F5FFBDBEBDFF484848FF727272FFBEBE
          BEFFE7E7E7FF7F7F7FFF878888FF9C9B9CFF373637AE00000000000000001313
          13278B8B8CFC747473FFCECECEFFC3C3C3FF656565FFCBCBCBFFE2E2E2FF8989
          89FFBFBFBFFFC1C1C1FF5A5A5BFF5F5E5FFC0D0D0D2800000000000000000000
          00004646469560605FFFDFDFDFFF646463FFCCCCCCFFDEDEDEFFE2E2E2FFD9D9
          D9FF767776FFD5D5D5FF525252FF3030309B0000000100000000000000000000
          00000606060F5E5E5EE97C7E7DFF8D8D8DFFB4B4B4FFBDBDBDFFBCBCBCFFB3B3
          B3FF8F8F8FFF808080FF525252EB040404140000000100000000000000000000
          0000000000000505050C424242AB40404087575657BA5D5E5DCE5A5A5BCE5050
          50BA38383887444444AB0404040C000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0002000000070000000A0000000C0000000D0000000F0000000D000000040000
          000000000005000000130000001A000000160000000700000000000000000000
          00040D5B9DFF0D599BFF0C5799FF0B5496FF095293FF084F90FF000000190000
          00120000001F044583FF024280FF02407EFF0000001500000000000000000000
          00030E5C9EFF95C5E4FF60A8D7FF5DA6D5FF57A0D2FF095193FF0B5496FF0B54
          96FF0B5496FF044685FF7AB1D9FF03417FFF0000001900000000000000000000
          00020E5C9FFFA5D5F0FF78BFE8FF6DB5E1FF5199CBFF0A5394FF25619AFF2967
          A2FF2C6DA9FF064887FF72A8D2FF034481FF0000001600000000000000000000
          00000E5C9FFFA7D6F0FF6CB2DDFF5CA3D2FF4A91C5FF0B5597FF0A5294FF0950
          90FF074E8EFF064B8AFF3C87C1FF044584FF0000001300000000000000000000
          00000E5C9FFF8BBEE0FF549ACAFF5299CAFF438ABEFF4188BEFF3F87BDFF3D86
          BDFF3C84BCFF448EC6FF3781BBFF054786FF0000001100000000000000000000
          00000E5C9FFF629BC6FF4B91C2FF4A8FC2FF488FC1FF478EC1FF458DC1FF438B
          C0FF418AC0FF3E88BFFF337CB6FF054A89FF0000001600000003000000000E5C
          9FFF0E5C9FFF0E5C9FFF0E5C9FFF0E5C9FFF0E5B9EFF0D5A9CFF0D589AFF0B56
          98FF0B5394FF095192FF084E8EFF074B8BFF064888FF00000008000000000000
          00000000000000000014664231ED9A6C57FF9F715BFFD4C0B6FFD1BEB6FF8D5A
          46FF844E3BFF53221AFB0100002D000000090000000700000002000000000000
          0000000000000000000A3D281E9C8A5E4AFF9F715BFFE7DCD6FFE6DAD5FF9563
          4FFF7C4A3AFF3A1A14C100000015000000000000000000000000000000000000
          00000000000000000002030201174A3125B65E4D4BFF1A558BFF19548AFE5640
          41FF47261DCE0402022B00000005000000000000000000000000000000000000
          000000000000000000000000000200000015094477D55B91BFFF528DBFFF0943
          77D9000000220000000500000001000000000000000000000000000000000000
          000000000000000000000000000014253A65165694F883ACCFFF7BA8CFFF0F53
          91F70103051C0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000254265A22E5E96F75587B5FF6193BFFF1F52
          89EF0B1A2B580000000000000000000000000000000000000000000000000000
          00000000000000000000000000001E344E793A68A1FF34629BFF24578FF5325F
          99FD0D1B2D510000000000000000000000000000000000000000000000000000
          00000000000000000000000000000203040629476BA6376197F0274A75C50B14
          2037000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000010000000B0000001C00000018000000070000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000020000001302070E54102E5CDB0B2145C0000103390000
          000D000000020000000000000000000000000000000000000000000000000000
          0000000000050000001E081729841D4D88F74988BBFF1D61A7FF113263EA0308
          1163000000180000000400000000000000000000000000000000000000010000
          000A0102042C113356B9296AA8FF4197D4FF68A9D3FF247DC7FF206DB7FF153F
          7EFB07132B9A0000002500000008000000010000000000000000000000090611
          1A4E1D5587E33986C2FF47A1DBFF449EDAFF77B2D8FF257FC8FF237BC6FF1F72
          C1FF184E93FF0B2148CB0102053F0000000F000000020000000000000015296E
          AAF74CA2D7FF4FAADFFF4BA6DDFF47A1DBFF89BCDDFF2782CAFF247CC7FF2278
          C5FF1F75C2FF1A5CA5FF113066EE0309166C0000001900000004000000152E7A
          B7FF5AB6E4FF54B0E2FF50ABDFFF4CA6DEFF9BC6E2FF2884CBFF257FC8FF237B
          C6FF2076C4FF1E73C2FF1C67B5FF143E7FFD0715309D0000001300000010307F
          BCFF60BDE7FF5BB7E5FF56B1E2FF51ACE0FFACD0E7FF2986CCFF2782CAFF257D
          C8FF2279C6FF2074C3FF1E71C1FF1C6ABBFF10306BF7000000210000000C3384
          C0FF67C4EBFF61BEE8FF5CB8E5FF56B3E2FFBEDAECFF2A89CEFF2885CBFF2680
          C9FF237BC6FF2077C4FF1F72C2FF1D6CBCFF11336EF700000021000000083489
          C4FF6DCBEDFF67C5EBFF62BFE8FF69BFE7FFF0F6FBFFC1DDF1FF4799D4FF2782
          CAFF247EC8FF2279C5FF2075C3FF1E6EBDFF133873F60000001E00000005368D
          C8FF73D2F0FF6ECCEEFF9AD9F2FFE7F5FAFF93D1E4FF88CCE3FFDFF0F8FF95C3
          E6FF2E84CBFF247CC6FF2177C4FF1F70BEFF153C76F50000001A000000023792
          CAFF7CD4EFFFD3F1FBFFC1DDEFFF509ED2FF3C94CDFF3892CCFF3B94CFFF96C6
          E5FFDDECF6FF68A5D8FF237AC6FF2072C0FF17407AF400000017000000001A47
          647E2E7DB2E464B6DEFF77D6F1FF80E0F6FF7EDDF5FF7AD8F2FF78D3F0FF318F
          CCFF55B3DAFFC1E3F2FFBED8EFFF3F87C9FF194681F400000013000000000000
          0000000000000F293B4B225E87B13C90C7FC5CB4DBFF74D4F0FF7AD6F1FF318F
          CDFF3CA8D5FF339DD1FF4A98CCFF5688BBFF1A4986F20000000C000000000000
          0000000000000000000000000000050D1218173F5C7B296EA5E14499CDFF2D83
          C2FF2975B3FF1F568DDA13355892091A2D530104071500000003000000000000
          00000000000000000000000000000000000000000000000000000D2335480F2A
          405A040C131B0000000100000001000000010000000100000000}
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
          00020000000B000000160000001D0000001F0000002100000022000000230000
          002400000025000000250000001F000000110000000400000000000000000000
          000A452D1F8A8A5A3DEA9C6645FF9C6645FF9C6544FF9C6544FF9B6543FF9B64
          43FF9B6443FF9B6342FF87573AEE442C1D990000001200000000000000000000
          0010956244F3BE8E60FFD8AA6AFFD8AA68FFD7A966FFD7A764FFD5A561FFD5A3
          60FFD5A25FFFD4A15BFFD3A15AFF925F40F60000001F00000000000000000000
          0012A16D4CFFDDB377FFBD8B5CFFB07F56FFB07E55FFAF7D53FFAF7C53FFAE7A
          51FFAD7A50FFB98655FFD6A660FF9E6848FF0000002400000000000000000000
          0010A47050FFE1B983FFB4855CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFB07D54FFD8A967FFA06C4AFF0000002300000000000000000000
          000EA67555FFE3C18FFFB78961FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFB28159FFDAAE6EFFA26F4EFF0000002100000000000000000000
          000CA97959FFE7CA9DFFBA8D67FFFFFFFFFFD0A57EFFCC9F76FFC8996FFFC595
          6AFFFFFFFFFFB5865FFFDDB274FFA57352FF0000002000000000000000000000
          000AAC7D5DFFEBD0A9FFBD926CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFB88B64FFDFB67BFFA87756FF0000001E00000000000000000000
          0008AF8261FFEED8B6FFBF9771FFFFFFFFFFD5AB86FFD1A67FFFCEA179FFCC9F
          76FFFDFDFDFFB88E69FFE0BB82FFAA7B5BFF0000001B00000000000000000000
          0006B18566FFF0DEC1FFC19B76FFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FFE9E9
          E9FFE7E7E7FFB58F6EFFDEBB89FFAE7F5FFF0000001900000000000000000000
          0004B38A69FFF3E4CAFFC49F7AFFFFFFFFFFF7F7F7FFDADADAFFC8C8C8FFCECE
          CEFFDBDBDBFFB29070FFDCBE8CFFAF8363FF0000001600000000000000000000
          0003B68D6DFFF6E9D4FFC6A27EFFD4D4D4FFAEAEAEFFAAAAAAFFB6B6B6FFC4C4
          C4FFD2D2D2FFB09174FFD8BC90FFB08767FF0000001300000000000000000000
          0001B89170FFF8EDDCFF9D866FFF9A816BFF967D65FF927961FF8F765DFF8D73
          5AFF8B7158FF886E55FFDDC297FFB58B6BFF0000001000000000000000000000
          0001A38165E0D9C2ABFFCEBEABFFC9B8A4FFC3B19CFFBEAB95FFBAA68FFFB6A0
          89FFB29C84FF947B63FFD2AF89FFA27E60E50000000B00000000000000000000
          000053423371A58367E0BB9574FFBC9576FFD8C8B7FFD6C8B6FFD1C2AFFFCBB9
          A4FFBA9474FFBA9372FFA48164E45140327B0000000500000000000000000000
          0000000000000000000000000001000000016A666073EAE1D3FFDDD3C6F76A61
          598A000000050000000500000005000000030000000100000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          200000000000000400000000000000000000000000000000000000000000A06D
          4BFF9E6C49FF9E6A48FF9D6947FF9C6846FF9C6745FF9B6644FF9A6543FF9963
          42FF996241FF986140FF97603FFF975F3EFF965E3DFF0000000000000000A271
          4FFFF6EDE4FFF6EDE5FFF6EEE5FFF6EEE6FFF6EEE7FFF7EFE6FFF6EEE5FFF5ED
          E4FFF5EAE0FFF4E8DEFFF3E6DBFFF0E3D5FF98603FFF0000000000000000A676
          53FFF7EEE7FFF7EEE7FFF7EFE7FFF7EFE7FFF7EFE8FFF8F0E9FFF7F0E9FFF7EF
          E9FFF7EFE6FFF5ECE3FFF3EBE1FFF3E8DDFF9A6442FF0000000000000000A97B
          58FFF8F0EAFFF8F0EAFFF8F1EAFFF8F1EAFFA77D5DFFA67B5BFFA57959FFA377
          57FFA17555FFF8F0E9FFF6EEE7FFF6ECE4FF9C6644FF0000000000000000AC80
          5EFFF8F2ECFFF8F2ECFFF8F3ECFFF8F3EDFFFAF3EDFFF9F4EEFFF9F4EEFFF9F4
          EFFFF9F4F0FFFAF4EEFFF9F2EDFFF8F0EAFF9D6947FF0000000000000000AF85
          62FFF9F3EDFFF9F3EDFFF9F4EFFFF9F4EEFFC5A68AFFC3A387FFC1A084FFBF9D
          80FFBD997CFFBB967AFFB89476FFF9F3EFFF9F6C49FF0000000000000000B28A
          68FFFAF4EFFFFAF4EFFFFAF5F0FFFAF5F0FFFAF5F1FFFAF6F1FFFAF6F2FFFAF6
          F2FFFBF6F3FFFBF7F3FFFBF7F3FFFBF7F3FFA06E4CFF0000000000000000B58E
          6EFFFAF6F1FF8C6C65FF62372FFF62372FFF62372FFF8D6C66FFFBF8F4FFFBF8
          F4FFFCF8F5FFFCF8F5FFFCF8F5FFFCF9F6FFA2714EFF0000000000000000B993
          72FFFBF7F3FF8D6C66FF73473EFFC29284FF73473EFF8D6D66FFFCF9F5FFFCF9
          F6FFFCF9F6FFFDF9F7FFFDF9F7FFFDFAF7FFA37450FF0000000000000000BC98
          77FFFBF9F6FFD0C2BEFFBDA59EFFE5D2CBFFBEA59EFFD1C3BFFFFDFAF8FFFDFB
          F8FFFCFBF8FFFDFBF9FFFDFBF9FFFDFBF9FFA67854FF0000000000000000BF9D
          7DFFFCFAF8FFFCFAF8FFBDD0E1FF6A91B9FFB7C6D7FFFDFBF9FFFDFBFAFFFDFB
          F9FFFDFBFAFFFDFCFAFFFDFCFAFFFDFCFAFFA97C58FF0000000000000000C2A0
          81FFFDFAF8FF98ABC0FF33618FFF5891C0FF7397BBFFFAF9F8FFFDFCFAFFFDFC
          FAFFFEFCFBFFFEFCFBFFFEFCFBFFFEFDFBFFAC805DFF0000000000000000C5A5
          86FFFDFCFAFF91A6BDFF466B93FF38608BFF225080FFFEFDFCFFFEFDFCFFFEFD
          FCFFFEFDFCFFFEFDFDFFFEFDFDFFFEFEFDFFAF8562FF0000000000000000C7A8
          8BFFFEFDFBFFD8DFE5FF587EA4FF1E4C7EFF7293B4FFFEFEFDFFFFFEFEFFFFFE
          FEFFFFFEFEFFFFFFFEFFFFFFFEFFFFFFFEFFB18967FF0000000000000000CAAC
          8FFFFFFEFDFFFFFEFDFFFFFEFEFFFFFEFEFFFFFFFEFFFFFFFEFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB58E6CFF0000000000000000CCAF
          93FFCBAD90FFC9AA8EFFC8A98BFFC6A689FFC4A486FFC3A283FFC1A081FFC09E
          7EFFBE9B7BFFBD9979FFBB9776FFB99473FFB89271FF00000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000020000
          000A0000000B0000000400000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000500000010000000240B19
          2A740F2037850000001200000000000000000000000000000000000000000000
          00000000000000000002000000070000001404070B38152C479F254F84ED3778
          B0FF26528BF60103053300000004000000000000000000000000000000000000
          00020000000A000000170C18245A224368BE3669A0FA4C94C4FF5FBFE8FF5ECA
          F3FF3980B6FF0E20379000000010000000000000000000000000000000080205
          071E1A30467F325C8AD84D88BAFF6BB3DAFF7CD5F4FF75D4F6FF67C8EDFF51A6
          D1FF54B3DFFF214575E0000000210000000200000000000000001C32456D487E
          AFF16AA7D1FF8BCEEBFF96E3F9FF8CDFF9FF72C0E2FF5091BBFF3C74A3FF4B93
          BFFF65CBF0FF3773ABFF091420640000000900000000000000001627365966A2
          CEFFA9EAFCFF9EE3F8FF76B3D3FF5185AEFF4D83AEFF65ACD0FF76D1F1FF73D3
          F5FF65BEE4FF5099C7FF1D3C61C0000000170000000100000000010202104274
          A3E29DDCF2FF5B8CB1FF6599BDFF83C6E3FF91E1F9FF82D4EFFF60A4CAFF437A
          A7FF3F75A3FF5AA1C7FF35689FFA04080D3C000000050000000000000006233F
          588677B4D9FFA6E6F8FFA4E8FCFF88C9E4FF6198BDFF4879A4FF5F9BC2FF5A98
          BFFF528FB6FF61A6CAFF5291BFFF19324C990000000F0000000000000002060A
          0E20508BBEF8A6E6F8FF5E8DB2FF5988AFFF79B4D3FF96DFF5FF629DC0FF497D
          A6FF5993B8FF69AACCFF72B6D8FF346193E80101021F00000002000000000000
          0007315779AB89C7E5FF9EDBEFFFA9EBFCFFA6EAFCFF6079C0FF040493FF263E
          92FF6199BDFF72B1D1FF85C9E4FF5892C3FF1222326700000006000000000000
          0002111E2A4363A0CEFFAEEDFDFFAEEDFDFFACEBFDFF5F61CFFF2D2DB5FF0407
          93FF6DA4C5FF71ADD0FF609BC7FF4177A9F2192F447600000007000000000000
          00000000000742729DCF9AD8F1FFAEEDFDFFAEEDFDFF85A2EAFF5E5ED0FF617C
          C5FF528ABDFF386591D51B30457A0304061F0000000A00000002000000000000
          00000000000320384C6A76B4DBFFAEEDFDFFA1DFF5FF78B6DBFF508ABEF82E52
          74AB101C284A0000000F00000007000000020000000000000000000000000000
          0000000000010305070F538DBDED6EACD8FF477CABDF2440587F060A0E200000
          0008000000040000000100000000000000000000000000000000000000000000
          0000000000000000000221384B62192B3A4F0000000700000004000000010000
          0000000000000000000000000000000000000000000000000000}
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
          000000000000000000000000000000000000000000000000000000000000331A
          0C963E200FB70302010900000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000371D0F969059
          32FF975E34FF452412BA03020109000000000000000000000000000000000000
          0000000000000000000002060B15102D58AE0E2952A83B22149C9D643BFFBC90
          6FFFB58561FF985F34FF472613BA030201090000000000000000000000000000
          0000000000000A1C30541D4E89EC4D8EC4FF4D505DFFA96D43FFC49875FFFFFF
          FFFFFFFFFFFFDACDC3FF9A6035FF492914BA0302010900000000000000000308
          0E1517416CAE2E72AFFF449BD5FF74B7E4FF575A60FFB5774BFFD1BBABFFE3D9
          D2FFC19A7CFFF4F1EFFFB57544FF9A6036FF4D2B16BA040201090E273C57296A
          A2EC4597CEFF4FAADFFF4BA6DDFF88C2E8FF2881C8FF5D5B60FFBE9D85FFD1BB
          ABFFCFBAAAFFC5A892FFD3C2B6FFBD9B82FF9C6237FF4D2C17B72B76B4FF5BB6
          E2FF5AB6E4FF54B0E2FF50ABDFFF9DCEEDFF2884CBFF267EC6FF605D61FFB97C
          4DFFDCCEC5FFC8AA93FFE2D9D2FFEBE5E0FFB57545FF724324FF2D7BB9FF66C3
          EBFF60BDE7FF5BB7E5FF56B1E2FFB1DAF1FF2986CCFF2782CAFF267CC6FF615F
          62FFB98A67FFF5F2EFFFDBCEC4FFCEB9A9FFBC7C4AFF794827FF2F80BDFF6CCA
          EEFF67C4EBFF61BEE8FF5CB8E5FFC3E4F5FF2A89CEFF2885CBFF2680C9FF247B
          C4FF625F64FFBD7E4FFFD4915CFFCD8B56FFBA7A4AFF6B4024D53085C1FF72D0
          F0FF6DCBEDFF67C5EBFF77C8EBFFF3FAFDFFBADAF0FF3E94D2FF2782CAFF247E
          C8FF2379C3FF635F63FF87532FFF86532FFF6F4426D50C0804183288C5FF78D7
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
          2000000000000004000000000000000000000000000000000000000000000B0A
          0A241A19195A00000001010101090303031504040420050505290505052A0505
          0524030303190101010B000000020D0D0C5A0505052400000000000000001B1A
          1A5A494747FF302E2EB41817176B282727AD343231DF353434F7302F2FF82525
          25E21B1B1BB7101010771C1C1CB6252525FF0C0C0C5A00000000000000000000
          0003323030B4464343FF5B5858FE8A8786FFADAAA8FFC5C2BEFFC0BDBAFF9E9C
          99FF716E6CFF393938FE252525FF1B1B1BB80101010500000000000000010202
          020F28272795737170FEB9B7B6FFCFC6BAFFBEB19EFFB7A68EFFB9AA91FFBFB3
          A2FFC4BCB1FF979491FF4A4949FF171717AB0303031B00000002010101051413
          13505A5757E7C1BFBFFFC9BEAEFFBFAB8BFFDECAA8FFF5DBB2FFF6DCB0FFE2CA
          A3FFCAB797FFC2B8AAFF979491FF363635F10E0E0E6B0101010B0101010A2C2A
          2A9A9A9998FFD7CEC0FFBAA37FFFEDE2CFFFFFE9C5FFFFE8C2FFFFE7BEFFFFE5
          BAFFF0D6ACFFC9B696FFC4BCB1FF716E6DFF1B1B1BB7030303190202020E3F3D
          3DCFCBC9C9FFBBAA91FFD9C39FFFFFFDF9FFFFF0D9FFFFEBCCFFFFEAC7FFFFE7
          C1FFFFE5BAFFE1CAA2FFBEB3A0FF9F9C99FF262525E2050505240202020F4C49
          49F1EFEFEFFFA48E6BFFF3E0C1FFFFFDFAFFFFF8ECFF535353FF464646FF3B3A
          3AFF2F2F30FFF6DCB0FFB7A790FFC1BEBAFF302F2FF80505052A0202020D4C49
          49F1F1F0F0FFA28A67FFF3E2C6FFFFF9F1FFFFFDFBFF605F60FFFFEED5FFFFEC
          CCFFFFE8C2FFF5DCB2FFB5A48BFFC6C3C0FF353434F705050529010101093E3C
          3CCBCECDCDFFBAA88EFFD6C2A3FFFFF5E7FFFFFDFAFF6B6B6BFFFFF7ECFFFFEF
          D8FFFFE9C5FFDDC8A6FFBDAF9AFFAEABA9FF343232DF04040420010101062D2B
          2B9A9D9C9CFFDAD0C2FFB29A76FFEADAC1FFFFF5E7FF767676FFFFFDFAFFFFFD
          F9FFEDE1CEFFBDA887FFCEC6B9FF8A8887FF292828B503030315000000022725
          259F686666FFC9C8C8FFCBBEAAFFB29B76FFD6C2A3FFF3E1C6FFF3DFC1FFD8C2
          9EFFB8A07CFFC9BDABFFBAB8B7FF5F5C5CFF202020AF01010109000000003533
          33D6939191FF7D7C7CFFC9C8C8FFDAD0C2FFBAA88EFFA28B66FFA28C68FFBAA9
          8FFFD7CEC0FFC2C1C1FF787575FF807F7FFF242423D800000001000000003B39
          39D5CCCBCBFFADACACFF797777FF9D9C9CFFCECDCDFFF1F0F0FFF0F0F0FFCCCB
          CBFF9B9A99FF726F6FFF9A9999FFC1C1C1FF2A2929D600000000000000002725
          2580848382FFCDCCCCFFADACACFF5E5C5CFF424141E54C4949F14C4949F14744
          44E7636161FFA6A5A5FFC9C8C8FF81807FFF1D1C1C8000000000000000000808
          081A272525803B3A39D5353534D51D1C1C82060606230202020D0202020F0A09
          092628272785434141D6424040D5252424800706061A00000000}
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
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000070000
          000B0000000C0000000C0000000C0000000C0000000C0000000C0000000C0000
          000C0000000C0000000D0000000D0000000C0000000800000002825B4DBEB57E
          6CFFB47D6BFFB47C6AFFB47C6AFFB37B6AFFB37B69FFB37B69FFB27A68FFB27A
          67FFB27967FFB17967FFB27866FFB17866FF7F5549BF00000007B88170FFFCF8
          F6FFFCF7F5FFFBF7F4FFFBF7F4FFFBF7F4FFFBF7F3FFFBF6F3FFFAF5F3FFFBF5
          F2FFFBF5F2FFFAF5F1FFFAF5F1FFFAF4F1FFB27968FF0000000BBA8573FFFCF9
          F7FFF8EFEAFFF8EFEAFFF8EFE9FFF8EFE9FFF7EFE9FFF8EFE9FFF7EEE8FFF7EE
          E7FFF7EEE7FFF7EDE7FFF7EDE6FFFBF6F2FFB47C6AFF0000000BBC8877FFFDFB
          F9FFF9F1EDFF4F3D36FFF9F1EBFFF8F0EBFFF8F0EBFFF9F0EAFFF8F0EAFFF8EF
          EAFFF8EFEAFF4E3B34FFF7EFE9FFFBF7F5FFB67F6DFF0000000ABF8B7AFFFDFB
          FAFFF9F3EFFF59463DFFC3B8B3FF513E37FFD9D0CBFF503E37FFC2B7B1FF4F3D
          36FFD9CEC9FF57443BFFF8F0EBFFFCF9F7FFB98271FF00000009C18F7EFFFEFC
          FCFFFAF4F1FF5B483EFFC7BCB6FF5B473EFFDCD3CDFF59463DFFC6BBB6FF5946
          3DFFDBD2CCFF59463CFFF9F1EDFFFDFAF8FFBB8675FF00000008C49482FFFEFD
          FDFFFBF6F3FF5D493FFFC8BEB9FF5C483EFFDDD4D0FF5C473EFFC8BCB7FF5B47
          3DFFDCD3CEFF5A463DFFF9F3F0FFFDFBFAFFBD8A78FF00000008C69786FFFEFE
          FDFFFCF7F5FF5E4A40FFC9BFBBFF5D4A3FFFDDD5D2FF5D493FFFC8BEB9FF5C49
          3FFFDDD5D0FF5C493EFFFAF4F1FFFEFCFBFFBF8D7CFF00000007C89B8AFFFFFE
          FEFFFCF8F7FF5F4C41FFCAC0BCFF5F4B41FFDED7D4FF5E4B40FFCAC0BBFF5E4A
          40FFDDD6D2FF5E4A40FFFBF7F4FFFEFDFCFFC39180FF00000006CB9E8DFFFFFF
          FEFFFCFAF9FFFDFAF9FFFCF9F8FFFDF9F7FFFCF9F8FFFCF9F7FFFCF9F7FFFDF8
          F7FFFCF8F6FFFCF8F6FFFCF8F6FFFEFEFDFFC59484FF00000006CDA191FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFEFFFFFEFEFFFFFEFEFFFFFE
          FEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFC89987FF000000059A796DBFCFA3
          93FFCEA393FFCEA292FFCDA292FFCDA191FFCDA090FFCDA08FFFCC9F8FFFCB9F
          8EFFCC9E8EFFCB9D8DFFCB9D8CFFCA9D8CFF967467C000000003000000020000
          0003000000030000000300000003000000030000000300000003000000030000
          0003000000040000000400000004000000030000000200000001000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0002000000060000000A0000000B0000000B0000000C0000000C0000000C0000
          000C0000000C0000000D0000000C000000080000000200000000000000000000
          000681594BBEB37B67FFB27B66FFB27A66FFB27864FFB17965FFB17965FFB177
          65FFB17763FFB07664FFB07664FF7E5448C00000000800000000000000000000
          0009B57D6BFFFDFBF9FFFBF6F2FFFBF5F2FFFAF5F1FFFBF4EFFFF9F3EEFFF9F2
          EEFFFAF2ECFFF8F0EBFFF9F0EAFFB17866FF0000000C00000000000000000000
          0009B7816DFFFDFBFAFFF7EEE7FFF8EDE7FFF7EDE7FFF7EDE6FFF6ECE5FFF6EC
          E5FFF8EBE4FFF6EBE4FFF9F1ECFFB37A68FF0000000C00000000000000000000
          0008B98472FFFDFCFBFFF8EFE8FFF7EEE8FFF7EEE8FFF8EEE7FFF7EEE7FFF7EC
          E6FFF7ECE5FFF6ECE5FFFAF2EEFFB57D6BFF0000000C00000000000000000000
          0008BB8775FFFEFCFBFFF9F0EAFFBF9685FFBE9585FFBE9584FFBD9484FFBE94
          83FFBD9382FFF8EDE7FFFAF4EFFFB7816EFF0000000B00000000000000000000
          0007BE8A79FFFEFDFCFFF9F2EDFFF3E9E3FFF3E7E1FFF3E7E0FFF2E7E0FFF2E7
          DFFFF2E6DFFFF8EFE8FFFAF5F1FFBA8571FF0000000A00000000000000000000
          0006C08F7EFFFEFDFDFFFAF3EFFFC29A8AFFC19A8AFFC09989FFC09888FFC098
          87FFBF9787FFF8F0EAFFFBF6F3FFBB8975FF0000000A00000000000000000000
          0006C49380FFFEFEFDFFFBF5F1FFF5ECE6FFF5EBE6FFF4EAE5FFF4EAE5FFF3EA
          E3FFF3E9E3FFF9F1EBFFFCF7F4FFBE8B79FF0000000900000000000000000000
          0006C69686FFFEFEFDFFFAF5F3FFC4A090FFC49F8FFFC39E8EFFC39D8EFFC39C
          8CFFC39B8CFFFAF3EFFFFDF9F7FFC18E7DFF0000000900000000000000000000
          0005C99B8AFFFEFEFEFFFBF6F4FFF6EDEAFFF6EDE9FFF6EDE9FFF6EBE8FFF5EC
          E7FFF5ECE6FFFAF5F0FFFDFAF8FFC39382FF0000000800000000000000000000
          0005C99E8DFFFFFEFEFFFCF8F6FFC7A495FFC7A494FFC7A393FFC7A392FFC6A2
          92FFC5A192FFFBF6F1FFFDFBF9FFC69786FF0000000800000000000000000000
          0004CEA190FFFFFFFEFFFDF9F7FFFDF9F7FFFCF8F7FFFCF8F6FFFCF7F5FFFBF7
          F5FFFBF7F4FFFCF7F3FFFDFCFAFFC89B8AFF0000000700000000000000000000
          0004CEA393FFFFFFFFFFFDFAF9FFFDFAF8FFFDFAF8FFFDF9F7FFFCF8F7FFFBF8
          F6FFFBF7F6FFFCF7F5FFFEFCFCFFCB9D8DFF0000000700000000000000000000
          0003D0A696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFEFFFEFEFEFFFFFE
          FEFFFEFEFEFFFEFEFEFFFEFEFDFFCDA191FF0000000600000000000000000000
          00029C7C70BFD2A898FFD1A897FFD1A897FFD1A797FFD0A696FFD0A696FFD0A6
          95FFD0A595FFCFA595FFCFA494FF99786EC00000000300000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00020000000A0000000F00000011000000110000001200000012000000130000
          00130000001300000014000000130000000D0000000300000000000000000000
          000981594BC1B37B67FFB27B66FFB27A66FFB27864FFB17965FFB17965FFB177
          65FFB17763FFB07664FFB07664FF7E5548C50000000C00000000000000000000
          000DB57D6BFFFDFBF9FFFBF6F2FFFBF5F2FFFAF5F1FFFBF4EFFFF9F3EEFFF9F2
          EEFFFAF2ECFFF8F0EBFFF9F0EAFFB17866FF0000001200000000000000000000
          000DB7816DFFFDFBFAFFF7EEE7FFF8EDE7FFF7EDE7FFF7EDE6FFF6ECE5FFF6EC
          E5FFF8EBE4FFF6EBE4FFF9F1ECFFB37A68FF0000001300000000000000000000
          000DB98472FFFDFCFBFFF8EFE8FFF7EEE8FFF7EEE8FFF8EEE7FFF7EEE7FFF7EC
          E6FFF7ECE5FFF6ECE5FFFAF2EEFFB57D6BFF0000001200000000000000000000
          000CBB8775FFFEFCFBFF89746BFF593F35FF8F7B72FFF8EFE8FFB0A098FF573E
          33FF563D33FF867067FFFAF4EFFFB7816EFF0000001100000000000000000000
          000BBE8A79FFFEFDFCFFF9F2EDFF826D64FFDDD1CBFFF9F0EAFFE5DBD5FF5840
          36FF776056FFF8EFE8FFFAF5F1FFBA8571FF0000001000000000000000000000
          000AC08F7EFFFEFDFDFFFAF3EFFFCABEB7FF5C4439FF5C4339FF5B4238FF5A41
          37FFBFB1A9FFF8F0EAFFFBF6F3FFBB8975FF0000000F00000000000000000000
          0009C49380FFFEFEFDFFFBF5F1FFF9F3EEFF826C63FFF6EFEBFF725B51FF6850
          46FFF3ECE7FFF9F1EBFFFCF7F4FFBE8B79FF0000000F00000000000000000000
          0009C69686FFFEFEFDFFFAF5F3FFFBF6F2FFB6A8A1FFA5958CFF5F463BFFA291
          89FFFAF4EEFFFAF3EFFFFDF9F7FFC18E7DFF0000000E00000000000000000000
          0008C99B8AFFFEFEFEFFFBF6F4FFFBF6F4FFF1EAE6FF685045FF62493EFFE2D9
          D3FFFBF5F0FFFAF5F0FFFDFAF8FFC39382FF0000000D00000000000000000000
          0007C99E8DFFFFFEFEFFFCF8F6FFFCF7F5FFFCF7F5FF9D8B84FF88736BFFFCF6
          F3FFFCF6F2FFFBF6F1FFFDFBF9FFC69786FF0000000C00000000000000000000
          0006CEA190FFFFFFFEFFFDF9F7FFFDF9F7FFFCF8F7FFFCF8F6FFFCF7F5FFFBF7
          F5FFFBF7F4FFFCF7F3FFFDFCFAFFC89B8AFF0000000B00000000000000000000
          0006CEA393FFFFFFFFFFFDFAF9FFFDFAF8FFFDFAF8FFFDF9F7FFFCF8F7FFFBF8
          F6FFFBF7F6FFFCF7F5FFFEFCFCFFCB9D8DFF0000000B00000000000000000000
          0005D0A696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFEFFFEFEFEFFFFFE
          FEFFFEFEFEFFFEFEFEFFFEFEFDFFCDA191FF0000000900000000000000000000
          00039C7C71C0D2A898FFD1A897FFD1A897FFD1A797FFD0A696FFD0A696FFD0A6
          95FFD0A595FFCFA595FFCFA494FF98796EC20000000600000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000051543
          30BC1D5D42FF1D5D42FF15422FBD000000050000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000061E65
          48FF63DBB3FF2FCB95FF1B5F43FF000000070000000000000000000000010000
          00050000000A0000000D0000000F00000011000000130000001300000015216E
          4FFF6EDEBAFF36D09CFF1E6649FF0000000D00000007000000050000000B1122
          386522416DB3284F86D53060A1FA6A8CBCFF387D72FE237556FF237152FF2475
          56FF41D5A4FF40D2A4FF216E50FF1F6448FF1E6246FF154531BC274A76B86295
          C5FF9CC0DFFFC7DCEEFFA1E3F8FF9BDFF2FF298663FF88E8CBFF4EDAADFF4CDA
          ACFF4BD9ACFF48D9AAFF47D7ABFF46D6AAFF45D6A6FF216F50FF3C72B1FFB9EA
          F9FFD3F0FBFFEBF9FFFFA4E6FAFF9BDFF2FF2C8E6BFF90EBD0FF8EEACFFF8DEA
          CFFF8BE9CDFF52DEB3FF51DCB2FF86E7C9FF83E7C9FF247757FF3F75B3FFB9EA
          F9FFD3F0FBFFEBF9FFFFA4E6FAFF97DFF3FF47A28FFF2E926EFF2E906DFF2D8E
          6BFF92EBD3FF59E0B8FF2A8764FF298362FF288260FF1D5E46C0437AB6FFB9EA
          F9FFD3F0FBFFEBF9FFFFA4E6FAFF79D8F2FF83CBEBFF7EAEDDFF7AA8D9FF2F95
          71FF9BEED7FF5FE4BEFF2D8F6CFF000000080000000400000003467EB9FFB9EA
          F9FFD3F0FBFFEBF9FFFFA4E6FAFF6ED5F1FF5ABCE7FF438BD2FF7CAADBFF329B
          77FF9EF0DAFF9DEFDAFF2F9572FF0000000400000000000000004883BCFFB9EA
          F9FFD3F0FBFFEBF9FFFFA4E6FAFF6ED5F1FF5ABCE7FF438BD2FF77A7DCFF4BAA
          98FF34A07BFF339E78FF257358BF0000000200000000000000004C86C0FFB9EA
          F9FFD3F0FBFFEBF9FFFFA4E6FAFF6ED5F1FF5ABCE7FF438BD2FF4E8ED3FF82C0
          EBFF7A9EC8FF0000000B000000020000000000000000000000004F8BC2FFB9EA
          F9FFD3F0FBFFEBF9FFFFA4E6FAFF6ED5F1FF5ABCE7FF438BD2FF3F84CFFF58AC
          E6FF4077B4FF0000000800000000000000000000000000000000518EC4FFC8EF
          FBFFE9FAFFFFE5F9FFFFDDF7FFFFD6F4FEFFCBF0FCFFABD9F4FF8FC7EDFF76C0
          EDFF437BB7FF00000007000000000000000000000000000000005493C7FFE8FA
          FFFFE5F9FFFFDFF7FFFFD8F4FEFFCFF2FEFFC6EEFEFFBDEBFDFFB3E8FCFFABE5
          FBFF4780BAFF0000000600000000000000000000000000000000406E93BD82B3
          DAFFA2CAE6FFB0D6EDFFBAE1F3FFC8EFFEFFABDAF2FF95CBEAFF82BCE1FF67A2
          D1FF38638EC30000000400000000000000000000000000000000000000031B2F
          3E5330536F913C688CB44579A5D45491C6FF4377A2D4386388B52C4D6B92182A
          3B54000000040000000100000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0001000000040000000B00000011000000160000001A0000001B0000001C0000
          001C00000018000000150000000E000000050000000100000000000000000000
          000504091032122749931A386AC61C417DE2214B95FF1F4893FF1E4692FF1C44
          91FF17397AE6122D63CA0D20479E03070F390000000700000000000000000000
          000F2A558EE8619CC8FFA6C6E0FFD2E0EFFFA7E7FAFF6CD1F1FF44BDE6FF3F98
          D9FF2565B8FF2966B7FF3174BBFF1E427DE20000001500000000000000000000
          00133365A6FF9FE2F7FFDBF6FDFFF3FCFFFFABE9FAFF71D4F2FF49C0E8FF449D
          DAFF296DC1FF2E74C6FF419DE1FF275298FF0000001B00000000000000000000
          0012396CAAFFADE7F9FFE3F8FDFFF7FCFFFFC1EFFBFF8FDFF6FF67CEEDFF5EAF
          E2FF3B7ECAFF3A80CCFF49A3E4FF29579BFF0000001B00000000000000000000
          00114277B1FF91CBE7FFAECDE3FFB8C9E0FF6FADD6FF469BCEFF2E8BC5FF2B6F
          B9FF2155ABFF2662B4FF3B8AD2FF2D5B9DFF0000001A00000000000000000000
          000B2C5588CE89C6E4FFCAE4F2FFE8F2F9FFB6EDFCFF80DAF4FF59C9ECFF54A9
          E0FF3374C4FF3274C3FF3C8BD2FF21467CCE0000001100000000000000000000
          000E437CB6FFB3E9F9FFE3F8FDFFF7FCFFFFBAEDFCFF86DCF5FF5FCCECFF59AD
          E2FF3C82CDFF4288D1FF56ADE7FF3366A6FF0000001700000000000000000000
          000D4984BCFFC0EDFAFFEAFAFDFFF9FCFFFFCDF3FDFFA1E5F7FF7DD8F1FF73BD
          E8FF4F92D5FF4E95D7FF5FB3EAFF386BAAFF0000001600000000000000000000
          000C528EC2FFA1D0E9FFB5CEE3FFBAC9E0FF7BB2D7FF54A2D1FF3B95CAFF387C
          C0FF2C65B5FF3470BEFF4C99D8FF3A70AEFF0000001400000000000000000000
          000A366795CE98CBE7FFD0E6F3FFEBF3F9FFC4F0FCFF94E1F6FF6FD4EFFF69B8
          E7FF4587CEFF4486CCFF4C99D8FF2C5689CE0000000E00000000000000000000
          00095394C8FFC2EEFAFFE8F9FEFFF8FDFFFFC6F1FCFF97E3F7FF73D5F0FF6EBB
          E8FF4F94D6FF559BDAFF6BBBECFF437DB7FF0000001100000000000000000000
          0008569ACBFFC6EFFBFFE9FAFEFFF8FDFFFFC9F2FCFF9CE4F7FF78D7F1FF73BE
          E9FF5498D8FF5A9FDCFF70BEEDFF4883BBFF0000001000000000000000000000
          00075A9FD0FFE3F8FCFFF3FCFEFFF3FDFEFFEFFBFEFFE8F9FEFFE1F7FDFFDAF4
          FDFFC5E9FAFFB2DFF7FFA4DDF6FF4B89BFFF0000000E00000000000000000000
          00045291BAE3A4CDE7FFC3DFEFFFCFE9F5FFE2F8FDFFD8F5FDFFCEF1FDFFC2ED
          FBFFA5D8F2FF97CEECFF81BBE1FF4277A4DB0000000A00000000000000000000
          00010910141D2D4F647E417191B34B83A9D05BA0D0FC5AA1D1FF5A9FD0FF579B
          CCFC467CA4D23C6A8DBA2A4B648A091015270000000300000000}
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
          0000000000000000000000000000000000030000000C00000010000000110000
          0011000000120000001200000013000000130000001000000004000000000000
          00000000000000000000000000000000000BA97563FFA87462FFA77261FFA571
          5FFFA5705EFFA36F5DFFA36D5CFFA26D5BFFA26C5AFF0000000F000000000000
          00000000000000000000000000000000000DAB7866FFFDFBF8FFF7EFE8FFF6EF
          E6FFF6EEE6FFF5EEE5FFF5EDE4FFF5EDE4FFA36D5CFF00000013000000000000
          0000265080B7336CB1FF326BB0FF2E63A6FFAD7C6AFFFDFCFAFFF7F0E9FFF7F0
          E8FFF7EFE7FFF6EFE7FFF6EEE6FFF5EEE5FFA46F5DFF00000012000000000000
          00003976B8FF91D2F4FF66BEEEFF60B5E4FFB07F6DFFFEFDFCFFF7F2EAFFF8F1
          E9FFF7F0E9FFF6F0E8FFF6EFE7FFF6EFE6FFA67260FF00000011000000000000
          00003F7DBCFF9AD6F5FF6CC3F0FF66B8E5FFB28070FFFEFEFDFFF8F3ECFFF8F2
          EBFFF7F1EAFFF7F1E9FFF7F0E8FFF7EFE8FFA87563FF00000010000000000000
          00004384C1FFA4DBF6FF73C7F1FF6CBEE8FFB48473FFFFFFFEFFF9F3EEFFF9F3
          EDFFF9F2ECFFF8F2EBFFF7F1EAFFF7F0E9FFAB7766FF0000000F000000000000
          0000488BC5FFADE1F8FF7ACCF2FF73C3E9FFB68676FFFFFFFFFFF9F5EEFFF9F4
          EEFFF9F3EDFFF8F3ECFFF8F2EBFFF7F2EBFFAC7A6AFF0000000E000000000000
          00004C92CAFFB6E6FAFF81D2F4FF7AC9EBFFB88878FFFFFFFFFFFAF5F0FFF9F5
          EFFFF9F5EFFFF9F4EEFFF9F3EDFFF9F3ECFFAF7E6CFF0000000D000000000000
          00005098CDFFBEE9FAFF88D6F6FF81CEEEFFBB8B7BFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFAFFB1816FFF0000000C000000000000
          0000539DD1FFC5EDFBFF8FDBF7FF89D5F2FFBD8D7DFFBB8C7CFFBA8B7BFFB989
          79FFB98977FFB78876FFB68674FFB58373FFB38371FF00000009000000000000
          000056A1D4FFCBF0FCFF95E0F8FF82CBE9FF72B7D9FF71B7D9FF70B7DAFF70B8
          DBFF6FB7DBFF4385BBFF00000009000000090000000800000002000000000000
          000058A5D7FFCBEDF8FF73B2D0FF5792B7FF5893B7FF5995BAFF5B99BDFF62A3
          C9FF69AFD4FF4184BBFF00000000000000000000000000000000000000000000
          000059A8D9FFBCDBE7FF8E7875FF9B7061FF946A5BFF8F6456FF885D50FF7B65
          63FF97BCD3FF488EC4FF00000000000000000000000000000000000000000000
          0000437EA2BD4A90BFFFB48E7FFFF3EDE7FFDEC9B8FFDDC8B5FFDBC4B2FF9770
          60FF3B7BAEFF40799EBD00000000000000000000000000000000000000000000
          00000000000000000000876B60BDB69181FFB69080FFB58E7FFFB28C7DFF7D60
          54BD000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000020000
          000A0000000F0000001000000010000000100000001100000011000000110000
          001100000011000000100000000B000000030000000000000000000000094633
          2CC160453BFF644A41FFB87D4EFFB97A4AFFB47444FFB06C3DFFA76436FFA764
          36FF583D36FF5B3E37FF3B2821C20000000A00000000000000000000000D6F53
          47FF947869FF6A4F46FFD8B07BFFD7AE77FFD7AB74FFD6A970FFD5A66DFFD4A5
          6AFF5D413AFF684B41FF543931FF0000000E00000000000000000000000C7357
          4AFF987D6EFF70564BFFFFFFFFFFF6EFEAFFF6EFE9FFF6EEE9FFF5EEE9FFF6EE
          E8FF62473FFF715348FF573B33FF0000000F00000000000000000000000B785C
          4EFF9D8273FF765C50FFFFFFFFFFF7F0EBFFF7F0EBFFF7EFEBFFF6EFEAFFF6EF
          EAFF684E44FF72554BFF593E35FF0000000E00000000000000000000000A7C60
          50FFA28777FF7B6154FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFFF1F1
          F1FF89756EFF8A7269FF5F443BFF0000000C0000000000000000000000097F63
          54FFA78E7DFF977A6AFF967969FF957967FF84695CFF705548FF8F7B73FF0B67
          37FF295D3CFF81746BFF806C63FF0000000C0000000000000000000000088367
          57FFAB9382FF634A41FF614740FF5E463DFF5C443CFF5B433BFF776761FF0A67
          37FF2AAF7FFF106137FF5B6352FF00000016000000030000000000000007866A
          59FFAF9788FF674E44FFF3EAE4FFE8D9CEFFE9DFD7FFE5DBD5FFD8CFC9FF0B6A
          3BFF4EDCB2FF27C48DFF0C7746FF022E179C000201190000000500000006886D
          5CFFB39C8CFF6B5248FFF4ECE6FFEBE3DCFF47916BFF046B38FF046B38FF056B
          38FF3AD7A5FF37D6A2FF32D3A0FF199966FF044A26D5000D063A000000058B70
          5EFFB7A091FF70564DFFF6EFEAFFEBE4DFFF167E4EFF84EDD1FF52E1B6FF4DDF
          B3FF48DDAFFF44DBACFF3FD9A9FF3AD7A6FF32BE8EFF0F6A3FF6000000048E72
          60FFBBA595FF755A50FFF7F1ECFFF1EEEBFF188252FFB8F7E7FFB4F5E6FFAFF4
          E4FF85EDD2FF52E1B7FF4DDFB3FF5DE2BBFF66D0AEFF16794CF6000000026A56
          49BF8F7361FF795E54FF765D52FFAFA19CFF3B8963FF0D814DFF0D804DFF0D80
          4CFF95F1DAFF65E7C2FF83ECCFFF57B28FFF065932D2010E0832000000010000
          000200000003000000030000000300000005000000090000000C000000140D7B
          4BF2AEF6E5FF94E5CEFF339167FD033A1F910001010F00000003000000000000
          0000000000000000000000000000000000000000000000000000000000070F7F
          4EF287CBB3FF106D42E6011C0F4C000000060000000100000000000000000000
          0000000000000000000000000000000000000000000000000000000000051081
          52F1034B2AAE0007041700000003000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000946332CC160453BFF644A41FFB87D4EFFB97A4AFFB474
          44FFB06C3DFFA76436FF593E37FF5C4037FF3B2823C20000000A000000090000
          000E0000000F0000001C6F5347FF947869FF6A4F46FFD8B07BFFD7AE77FFD7AB
          74FFD6A970FFD5A66DFF5F443CFF694C42FF553A32FF0000000E7B5043C0AB70
          5CFFAB6F5AFFA36B58FF73574AFF987D6EFF70564BFFFFFFFFFFF6EFEAFFF6EF
          E9FFF6EEE9FFF5EEE9FF644A41FF72544AFF583D34FF0000000EAD735FFFFDFB
          F9FFFBF5F2FFEFEAE7FF785C4EFF9D8273FF765C50FFFFFFFFFFF7F0EBFFF7F0
          EBFFF7EFEBFFF6EFEAFF6A5046FF73554BFF5B4037FF0000000DB07762FFFDFB
          FAFFF7EDE6FFEDE3DCFF7C6050FFA28777FF7B6154FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF6F564BFF74584EFF5E4339FF0000000CB07966FFFDFB
          FBFFF8EEE8FFEEE6DFFF7F6354FFA78E7DFF977A6AFF967969FF957967FF8469
          5CFF785D53FF775C51FF775C51FF775A50FF62463CFF0000000BB37C69FFFEFC
          FBFFF8F0EAFFF0E8E1FF836757FFAB9382FF634A41FF614740FF5E463DFF5C44
          3CFF5B433BFF594139FF584037FF795C52FF654A3FFF0000000AB67F6CFFFEFD
          FCFFF9F0EBFFF2E9E4FF866A59FFAF9788FF674E44FFF3EAE4FFE7D5C8FFE7D4
          C6FFE6D3C5FFE6D3C5FF5B433AFF7A5F54FF694E42FF00000009B98371FFFEFD
          FCFFFAF3EEFFF3ECE7FF886D5CFFB39C8CFF6B5248FFF4ECE6FFE9D9CDFFE8D7
          CAFFE7D5C8FFE6D4C6FF5E463EFF7C6156FF6C5145FF00000008BC8877FFFEFE
          FDFFFBF4EFFFF5EEEAFF8B705EFFB7A091FF70564DFFF6EFEAFFF5EDE8FFF4EC
          E6FFF4EBE4FFF3EAE3FF634A41FF7E6358FF715549FF00000007BF8C7AFFFEFE
          FDFFFBF6F1FFF8F2EEFFA79183FF8C715FFF755A50FF8D766CFF897369FF856D
          65FF81695FFF7C645BFF674D45FF775B4DFF564239C100000004C18F7FFFFEFE
          FEFFFAF6F3FFF9F4F2FFF9F4F0FFF7F1EDFFF7F1ECFFF7F1ECFFF6F0EBFFF5EF
          E9FFF8F4F3FFDABFB6FF00000010000000050000000300000001C49382FFFFFE
          FEFFFBF7F4FFFBF6F4FFFBF6F4FFFCF6F3FFFCF6F3FFFCF4F2FFFBF5F1FFFBF5
          F0FFFDFBF9FFBF8C7BFF0000000B000000000000000000000000C79985FFFFFE
          FEFFFCF8F7FFFCF8F6FFFCF7F5FFFCF7F5FFFBF6F4FFFBF6F4FFFCF6F3FFFCF6
          F2FFFDFCFAFFC28F7FFF0000000A000000000000000000000000C99A89FFFFFF
          FEFFFFFFFEFFFFFEFEFFFFFEFEFFFEFEFEFFFEFEFEFFFEFEFDFFFEFEFDFFFEFD
          FDFFFEFDFDFFC49382FF00000008000000000000000000000000977567C0CA9C
          8BFFCA9C8BFFC99C8AFFC99B89FFC99B8AFFCA9A88FFC89A88FFC99987FFC798
          87FFC89886FF927163C200000005000000000000000000000000}
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
          62FFFDFBFAFFCEAF69FFBA8D2CFFB68B2AFFB3892AFFB18728FFAF8526FFAD82
          25FFAA7F24FFA77D22FFA67C21FFA57A20FFA2761FFF6C4F14AD0000000BB079
          66FFFDFBFBFFBD932FFFDBC292FFFAF5F4FFF9F5F3FFB3892AFFF8F2F1FFF7F2
          EFFFD2B98AFFAA7E23FFC4A86EFFF5EEEAFFC2A66CFFA1791FFF0000000AB37C
          69FFFEFCFBFFC09430FFFBF7F6FFBB8E2DFFB88D2BFFB58B2AFFB3872AFFAF85
          27FFF7F2EFFFAC8124FFE4D5BCFFCEB686FFE2D3BAFFA37A20FF00000009B67F
          6CFFFEFDFCFFC19531FFFBF8F7FFBC922EFFBA8D2CFFB68C2BFFD7C08EFFF9F4
          F1FFD4BC8CFFAD8225FFF6F1EEFFA97E22FFF6EEEAFFA37B21FF00000009B983
          71FFFEFDFCFFC29732FFFCF8F8FFC0932FFFBB912FFFBA8D2DFFFAF5F3FFB489
          2AFFB18728FFAF8526FFF7F1EFFFAA7F24FFF6F0ECFFA67C21FF00000008BC88
          77FFFEFEFDFFC69933FFDFC996FFFCF8F8FFFAF8F7FFBB912EFFDAC291FFFAF5
          F4FFF8F3F0FFB18728FFF8F2F0FFAC8225FFF6F0EDFFA77D22FF00000007BF8C
          7AFFFEFEFDFFD7B871FFC39932FFC29532FFC09431FFBC922FFFBB8E2DFFB88D
          2CFFB58B2AFFB38729FFB18628FFAE8325FFAC8124FF735618AD00000006C18F
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
          2000000000000004000000000000000000000000000000000000000000020000
          00090000000E0000000F00000010000000100000001100000011000000110000
          001200000012000000110000000C000000030000000000000000000000087B50
          43C0AB705CFFAB6F5AFFAB705CFFAA6F5BFFAA6E59FFA96F5AFFAA6D59FFAA6C
          59FFAA6C59FFA96C58FF794D3FC30000000B00000000000000000000000CAD73
          5FFFFDFBF9FFFBF5F2FFFAF5F1FFFAF4F0FFFAF4EFFFFAF2EEFFFAF1EDFFF8F1
          ECFFF8F0EBFFF8F0EAFFD5B6ADFF0000001100000000000000000000000CB077
          62FFFDFBFAFF7674D8FF3737D1FF3334CDFF3131CBFF2F2FC9FF2B2BC5FF2929
          C4FF2626C2FF2425BFFF2222BCFF2020BBFF1E1EB8FF14147CAD0000000BB079
          66FFFDFBFBFF3C3DD3FFFAF6F6FF3636D0FF3233CCFF3030CAFFF8F2F1FFF7F2
          EFFF6B69D1FF2526C2FFF6EEEBFF2121BCFF1F1FBBFF1D1EB9FF0000000AB37C
          69FFFEFCFBFF3E3ED4FFFBF7F6FF3738D2FF3536D0FF3232CCFFF8F4F2FF2D2E
          C7FFF7F2EFFF2728C2FFF6F0ECFF2223BDFF2121BCFF1E1EB9FF00000009B67F
          6CFFFEFDFCFF4040D7FFFBF8F7FFFBF7F6FF7574DCFF3435CDFFF9F5F2FF2F2F
          CAFFF8F3F0FF292AC4FFF6F1EEFFF6EFECFF2222BDFF2020BBFF00000009B983
          71FFFEFDFCFF4042D9FFFCF8F8FF3C3CD3FFFBF7F6FF3637D0FFFAF5F3FF3030
          CAFFF8F3F1FF2B2BC5FFF7F1EFFF2526C2FF2323BFFF2121BCFF00000008BC88
          77FFFEFEFDFF4243D9FFFBFAF9FFFCF8F8FF7878DFFF3838D2FFFAF7F5FFFAF5
          F4FF706FD7FF2D2EC7FFF8F2F0FFF7F2EFFFF6F0EDFF2222BDFF00000007BF8C
          7AFFFEFEFDFF7F7DE1FF4242D8FF4040D7FF3D3ED4FF3A3AD3FF3737D0FF3435
          CDFF3132CBFF2F2FC9FF2B2CC7FF292AC4FF2727C2FF181982AD00000006C18F
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
          2000000000000004000000000000000000000000000000000000000000020000
          00090000000E0000000F00000010000000100000001100000011000000110000
          001200000012000000110000000C000000030000000000000000000000087B50
          43C0AB705CFFAB6F5AFFAB705CFFAA6F5BFFAA6E59FFA96F5AFFAA6D59FFAA6C
          59FFAA6C59FFA96C58FF794D3FC30000000B00000000000000000000000CAD73
          5FFFFDFBF9FFFBF5F2FFFAF5F1FFFAF4F0FFFAF4EFFFFAF2EEFFFAF1EDFFF8F1
          ECFFF8F0EBFFF8F0EAFFD5B6ADFF0000001100000000000000000000000CB077
          62FFFDFBFAFF736962FF665C55FF645951FF60574FFF5E544CFF5C5149FF594E
          47FF564C44FF554B42FF53473FFF50463DFF4F443BFF4D423AFF0000000BB079
          66FFFDFBFBFF756B64FF675D56FFFAF7F6FF635851FF5F554EFFF9F4F2FF5B50
          48FFF7F1EFFF564C44FF544841FFF7EEECFF50453DFF4F443BFF0000000AB37C
          69FFFEFCFBFF766E66FF695F57FFFAF7F6FF645951FF61574FFFF8F5F3FF5D51
          4BFFF7F3F0FF574D45FF554B42FFF6EFEDFF51463FFF4F453BFF00000009B67F
          6CFFFEFDFCFF797169FF6A6058FFFAF8F7FF655C54FF635950FF928984FFF8F4
          F2FF8E857FFF594F47FF564C44FFF7EFEEFF53473FFF50453DFF00000009B983
          71FFFEFDFCFF7B736CFF6C615BFFFBF9F7FF665D55FF655B53FFF9F6F5FF5F55
          4DFFF9F3F2FF5B5048FF584E46FFF7F0EEFF544840FF51473FFF00000008BC88
          77FFFEFEFDFF7E746DFFFBF9F8FFFBF9F8FFFAF8F7FF665C55FFF9F7F5FF6156
          4FFFF9F5F3FF5C5149FFF8F2EFFFF7F1EFFFF7F0EDFF534840FF00000007BF8C
          7AFFFEFEFDFF7F7570FF7D746CFF7A706AFF766E66FF746A63FF706760FF6E63
          5BFF6A6058FF665C54FF635850FF60554EFF5C524BFF5A4F47FF00000006C18F
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
          0002000000090000000E0000000F000000100000001000000011000000110000
          00110000001200000012000000110000000C0000000300000000000000000000
          00087B5043C0AB705CFFAB6F5AFFAB705CFFAA6F5BFFAA6E59FFA96F5AFFAA6D
          59FFAA6C59FFAA6C59FFA96C58FF794D3FC30000000B00000000000000000000
          000CAD735FFFFDFBF9FFFBF5F2FFFAF5F1FFFAF4F0FFFAF4EFFFFAF2EEFFFAF1
          EDFFF8F1ECFFF8F0EBFFF8F0EAFFD5B6ADFF00000011000000003E5803AD5D81
          05FF5C8004FF5B7F04FF5A7E03FF5A7D03FF587C02FF577B02FF567902FF5679
          01FF557800FF537700FF547700FF537600FF537600FF385000AD5E8306FFFAF6
          F6FF5D8105FFF9F5F3FF5C7F04FFF8F2F1FFF7F2EFFFA7B678FFF7EFEDFFF6EE
          EBFFA6B476FF557801FFF4ECE7FF547700FFF3EAE5FF537600FF5F8406FFFBF7
          F6FF5D8205FFF9F5F4FF5C8004FFF8F4F2FF5A7E03FF597D03FF587C02FFA8B6
          78FFF6EEEBFF567901FFF5EDE8FF537700FFF4EBE6FF537600FF618507FFADBE
          7FFFFBF7F6FFACBD7DFF5B8104FFF9F5F2FF5B7F04FF5A7E03FFA9B879FFF6F1
          EEFF597B03FF557A01FFA6B376FFF5EDE8FFA4B274FF547700FF608606FFFCF8
          F8FF5F8406FFFBF7F6FF5F8206FFFAF5F3FF5C8004FF5B7F04FFF8F3F0FF5A7D
          03FF587C02FF577A02FFF6EEEAFF547801FFF4ECE8FF537700FF618607FFFBFA
          F9FF618507FFFAF8F7FF5D8306FFFAF7F5FF5D8105FF5D8005FFAAB97BFFF8F2
          F0FFF7F2EFFF597C02FFF6EFECFF557A01FFF5EDE9FF557801FF425B05AD6186
          07FF608507FF5F8506FF5F8406FF5E8306FF5E8305FF5D8105FF5D8005FF5B7F
          04FF5A7E03FF577C03FF567B02FF577B02FF567A01FF3A5201AD000000000000
          0006C18F7FFFFEFEFEFFFAF6F3FFFAF5F3FFFBF6F2FFFBF5F1FFFBF5F0FFFBF5
          F0FFFAF4EFFFFAF4EEFFFDF9F8FFDEC3BAFF0000000B00000000000000000000
          0006C49382FFFFFEFEFFFBF7F4FFFBF6F4FFFBF6F4FFFCF6F3FFFCF6F3FFFCF4
          F2FFFBF5F1FFFBF5F0FFFDFBF9FFBF8C7BFF0000000B00000000000000000000
          0005C79985FFFFFEFEFFFCF8F7FFFCF8F6FFFCF7F5FFFCF7F5FFFBF6F4FFFBF6
          F4FFFCF6F3FFFCF6F2FFFDFCFAFFC28F7FFF0000000A00000000000000000000
          0004C99A89FFFFFFFEFFFFFFFEFFFFFEFEFFFFFEFEFFFEFEFEFFFEFEFEFFFEFE
          FDFFFEFEFDFFFEFDFDFFFEFDFDFFC49382FF0000000800000000000000000000
          0002977567C0CA9C8BFFCA9C8BFFC99C8AFFC99B89FFC99B8AFFCA9A88FFC89A
          88FFC99987FFC79887FFC89886FF927163C20000000500000000000000000000
          0001000000020000000300000004000000040000000500000005000000050000
          0006000000060000000600000006000000050000000100000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000020000
          000A000000160000001B000000170000000B0000000200000000000000010000
          00060000000B0000000F0000000C0000000600000001000000000000000F2616
          1072583424D8693D2AFF4D2C1FD91D110B750000001200000003000000082416
          1162513023CF613927FF45281BD01A0F0A630000000900000001291A136DA380
          70FFD4C5BDFFEDE5E1FFCFBEB7FF907163FF1F120C770000000F2C1C1663A181
          72FFD4C6BEFFEEE8E4FFCDC0B8FF866A5DFF190E096000000005734937DEE3D7
          D1FFCEAE9EFFAF7957FFD0B39EFFD7C9C3FF553324E00000001B77503FD8E2D7
          D2FFD0AD9BFFB37753FFD2B29AFFD6CBC5FF4A2B1ED90000000A8E5A47FBF8F6
          F4FFAE725BFFE7AF66FFB27F5EFFF0EBE8FF744835FF000000489A6B55FFF8F6
          F3FFB27056FFE8AF64FFB67E59FFEAE3DFFF613B29FA0000000B90604DF8F1E8
          E4FFD2B0A5FFAA6C53FFD4B6A7FFCDC0BAFF71422FFF4C2920FF80513DFFF1E8
          E3FFD3ADA1FFAE684FFFD4B2A1FFC5B6AFFF6A4231F700000009583C31A2CAAF
          A3FFF7F2EEFFFDFCFBFFEAE0DAFF9E847AFF774835FF663E36FF855944FFE8D9
          CFFFF7F0EDFFFCFAF9FFDFD4CEFF8A6657FF452D229A000000050805041D9F72
          5DF8E8DBD4FFE6D7CEFFCDB7AAFF8B6B5EFF7D4C3AFF865F56FF8B5F4BFFE9D8
          CEFFEADCD4FFCFB9ACFF997B6DFF966A54F70705041600000001000000076047
          3BA4D0B7ADFFEEE3DFFFD5C1B7FF93766CFF82533FFF734635FF926550FFECE0
          D9FFEBDED8FFC4B0A5FF9B7868FF5F45389D0000000400000000000000022219
          1541B89383FFF3EBE8FFD9C9C2FFA99389FFA67966FF00000026B48B76FFF0E7
          E3FFEADED9FFBDA79FFFA67D6CFF211915390000000100000000000000000000
          0007846554C6DDCCC4FFE6DCD8FFC2A99EFFA67E69F90000000CB38E79F8E0D1
          C9FFE9DFDAFFBCA497FF846555C2000000030000000000000000000000000000
          0002130F0D237D6152B7AF8673FA7B6050B9130E0C270000000414100E1E8365
          58B3B68F79F9806455B3130F0D1E000000010000000000000000000000000000
          0000000000010000000400000006000000050000000200000000000000000000
          0001000000010000000100000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000714B3EB79E68
          57FF9E6756FF9E6556FF9E6756FF9E6755FF9E6655FF9E6655FF9D6655FF9D65
          54FF9D6455FF9D6654FF9D6554FF9C6554FF9D6353FF70483CB7A06959FFFAF4
          F1FFFAF3F1FFF8F2F0FFF4EEEBFFDBCCC5FFF4EDEBFFF8F2EEFFF9F3F0FFF9F2
          F0FFC5A59BFFF9F3EFFFF9F3EFFFF9F2EFFFF9F2EEFF9D6655FFA16C5BFFFAF4
          F2FFF8EFECFFF3EAE7FFAEBBAFFF06572DFFAEBAAEFFF2EAE6FFF6EDEAFFF7EE
          EBFFC6A69CFFF7EEEBFFF7EFEBFFF7EEEBFFF9F3F0FF9F6857FFA46E5DFFFAF4
          F3FFF6EEEBFFDEDCD8FF1F6B45FF44BC96FF1E6944FFDEDAD6FFF5EDEAFFF8EF
          EBFFC7A89DFFF8EFECFFF7EEEBFFF7EEEBFFF9F3F0FFA06A59FFA57160FFF9F5
          F2FFF1E9E6FF588A6FFF33A079FF52CBA8FF329E78FF56886CFFEFE8E5FFF7EF
          EBFFC8AA9FFFF8F0ECFFF8F0ECFFF8EFEBFFFAF3F1FFA26C5CFFA87365FFE2D2
          CCFF93A593FF22825AFF9CE7D4FF54CDAAFF5BD0AEFF1E7F57FF91A190FFDECE
          C7FFC9ABA0FFC9ABA0FFC9ABA1FFC9ABA0FFC9ABA1FFA46E5EFFA97668FFF6F1
          F0FF1C8A5BFF09804FFF097F4EFF57CEACFF087D4CFF077C4AFF188455FFECE5
          E3FFDFCFC8FFF7EFEDFFF8F0EDFFF8F0EDFFFAF4F2FFA67161FFAC796AFFF9F4
          F3FFF5EDEBFFECE6E4FF0B8251FF5DD0AFFF09804FFFE9E4E1FFECE6E3FF1985
          57FF94A693FFF2EBE7FFF7EFECFFF8F1EEFFFAF4F3FFA87463FFAE7D6EFFFCF8
          F6FFF9F3F1FFF2ECE9FF0C8553FF5FD1B0FF0B8251FFECE6E4FFECE6E4FF097F
          4EFF1F8359FF5B8F74FFE4E2DCFFF6EFECFFFAF5F3FFAA7768FFB18072FFFCF8
          F7FFFAF4F2FFF4EDEBFF0E8856FF63D4B4FF0D8654FF087042FF076F40FF0A82
          51FF5DD0AFFF3AA57FFF24754EFFB3C5B8FFF8F3F2FFAC7A6CFFB28375FFCFB5
          ACFFCFB5ACFFE4D7D3FF108B5AFFB3EDDFFF7ADCC1FF78DBC0FF76DBBEFF73D9
          BDFF61D3B1FF66D4B4FF60CBACFF0C8351FFE5D7D3FFAF7E6FFFB58778FFFCF9
          F8FFFBF5F4FFF8F3F1FF51AB86FF189363FF179362FF179162FF179161FF0F89
          57FFAAEBDBFF4CB994FF2D956AFFBED3C7FFF9F5F4FFB18171FFB78A7BFFFDF9
          F8FFFAF5F4FFFAF4F3FFF8F3F1FFE7D9D4FFF8F2F1FFF6F1EFFFF5EFEDFF118B
          5AFF30A378FF69B092FFEAEAE6FFF8F2F0FFFCF8F7FFB48575FFBA8E7FFFFDFA
          F9FFFBF6F4FFFBF6F5FFFBF6F4FFD2B9B0FFFAF6F5FFFAF5F4FFF8F4F2FF2697
          69FFA6C2AFFFF9F2F1FFF9F4F2FFFAF5F2FFFDF8F7FFB58779FFBB9082FFFDFB
          FAFFFDFAFAFFFDFBFAFFFDFBFAFFD3BBB2FFFDFAF9FFFDF9F9FFFDF9F8FFFCF8
          F7FFE9DBD7FFFDF9F8FFFDF9F8FFFCF9F8FFFCF9F8FFB88A7CFF937971BDC6A3
          98FFC6A397FFC6A397FFC6A397FFC6A297FFC6A296FFC5A296FFC5A296FFC5A2
          96FFC5A196FFC6A296FFC5A195FFC5A195FFC5A195FF92776EBD}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000090000
          000E0000000F0000000F0000000F0000000F0000001000000010000000100000
          0010000000100000001000000010000000100000000F0000000A815A4DC1B47D
          6BFFB37C6CFFB37C6BFFB37C6BFFB37C6AFFB37B6AFFB37B6AFFB27B69FFB37B
          69FFB37A69FFB37A69FFB27968FFB27968FFB27968FF80574BC1B57F6FFFF8F2
          EFFFF8F2EEFFF8F2EEFFF8F2EEFFCFA89CFFF7F2EEFFF8F2EEFFF7F2EEFFF8F2
          EEFFCFA89CFFF9F3EFFFF7F2EEFFF7F2EDFFF7F2EDFFB37B69FFB68272FFF9F3
          EFFFF8F0ECFFF7F0ECFFF8F0ECFFC69A8DFFF8F1ECFFF7F0ECFFF7F0EBFFF7F0
          EBFFC69A8CFFF9F1EFFFF7F0EBFFF7EFEBFFF8F2EEFFB47D6CFFB88575FFF9F3
          F1FFF8F1EEFFF8F1EEFFF8F1EDFFC79C8EFFF8F1EEFFF8F1EDFFF8F1EDFFF8F1
          EDFFC69C8EFFF9F3F0FFF8F2EFFFF9F3F0FFFAF5F1FFB57F6EFF1F59AEFF497C
          C3FF3568B8FF3568B8FF3568B8FF3568B8FF3568B8FF3568B9FF3568B8FF3568
          B8FF3568B8FF3568B9FF3568B8FF3568B8FF497BC3FF1B4DA6FF2261B3FF9DDB
          F7FF81CFF4FF80CFF4FF80CFF5FF386FBCFF81CFF4FF80D0F5FF80CFF4FF80D0
          F4FF386FBCFF81CFF4FF80CFF4FF81CFF4FF91D6F6FF1D52A9FF2569B9FFA4E0
          F8FF85D4F5FF85D4F6FF86D4F6FF3A77C1FF86D4F6FF85D4F6FF85D3F6FF86D3
          F6FF3A77C1FF85D3F6FF85D3F6FF86D4F5FF96DBF7FF1F58AEFF2770BCFFBCE9
          FBFFB0E7FAFFAFE6FAFFAEE6FAFF5B9AD4FFA3E1F9FFA3E1F9FFA3E2FAFFA3E1
          F9FF5C9AD3FFA3E2F9FFA3E2F9FFA3E1F9FFB0E5FAFF215FB3FF2975C1FF3279
          C3FF3279C1FF3278C1FF3277C0FF266FBDFF266EBDFF266EBBFF266DBBFF256C
          BAFF266BBAFF256BB8FF256AB8FF2469B8FF2469B7FF2467B7FFC1998CFFFCF9
          F7FFFCF7F5FFFCF7F6FFFBF8F5FFCCA497FFFBF7F6FFFCF7F5FFFBF7F5FFFCF7
          F6FFCCA495FFFCF7F5FFFCF7F4FFFBF6F4FFFCF8F7FFBE9285FFC29B8FFFFCF9
          F8FFFCF8F6FFFDF9F7FFFCF8F7FFCDA698FFFCF8F6FFFCF8F6FFFCF8F7FFFCF8
          F6FFCDA597FFFCF8F7FFFBF8F6FFFCF8F6FFFCF9F7FFBF9688FFC39E91FFFCFA
          F9FFFCFAF9FFFCFAF8FFFCFAF9FFD5B4A6FFFCFAF9FFFDFAF9FFFDFAF9FFFCFA
          F8FFD5B3A6FFFCF9F8FFFCF9F8FFFCFAF8FFFCFAF8FFC1998BFF91776EC0C4A0
          94FFC4A094FFC49F93FFC39F93FFC49F92FFC49F92FFC39E91FFC39E91FFC39E
          91FFC39D91FFC39D90FFC29C90FFC29C90FFC29C90FF907469C0000000020000
          0003000000040000000400000004000000040000000400000004000000040000
          0004000000040000000400000004000000040000000400000003}
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
          2000000000000004000000000000000000000000000000000000000000090000
          000E000000100000001000000010000000100000001000000011000000110000
          0011000000110000001100000011000000100000000B000000037B5A4FC1AA7C
          6EFFAA7C6EFFAA7C6DFFAA7B6DFFA97A6CFFA97A6BFFA97A6BFFA9796BFFA87A
          6BFFA7786AFFB77848FFB77746FFB77746FF845632C30000000AAC7E71FFF8F1
          EEFFF8F0EDFFF8F1ECFFF8F0ECFFF8F0ECFFF8F0ECFFF8F0ECFFF7EFEBFFF8EF
          EBFFF7EFEBFFD6AE84FFDFBC94FFDFBC93FFC58C5CFF0000000FAD8172FFF8F2
          EFFFF6EDE8FFF7EDE8FFF6ECE8FFF6EDE8FFF6ECE8FFF6EDE8FFF6ECE8FFF7ED
          E8FFF6EDE7FFD3A779FFDBB385FFE1C098FFC68D5DFF00000010AF8375FFF9F2
          EFFFF6ECE8FFF6EDE9FFF6ECE7FFF3EAE5FFF0E7E3FFF4EBE6FFF6EDE8FFF6EC
          E8FFF7EDE8FFD4AA7CFFDCB689FFE3C49EFFC78F5FFF0000000FB18577FFF9F3
          F0FFF7EDE9FFF6ECE7FFF2E9E4FFE4D7D1FFC2967AFFEFE6E2FFF7EDE8FFF7ED
          E9FFF6EDE9FFD6AC7FFFDEB98EFFE5C8A4FFC99061FF0000000EB2887AFFF9F4
          F0FFF5ECE7FFEFE6E2FFD0BAAEFFA7704FFFB47950FFE3D9D6FFEAE1DDFFEDE4
          E0FFF3EAE6FFD7AF82FFDFBD92FFE7CCA8FFCA9363FF0000000EB48A7CFFF7F2
          EFFFEBE1DCFFB9937FFFB27A4EFFF1C47FFFB67D54FFAC7049FFAC6F48FFB77F
          57FFEDE4E0FFD8B185FFE1C196FFE9CFADFFCA9464FF0000000DB68D7FFFF7F1
          EFFFC19980FFD3A97EFFF5D8A8FFFCD38DFFFCD18DFFFCD38DFFF5D8A8FFBB84
          5DFFECE3DFFFDAB488FFE3C399FFEBD3B1FFCC9666FF0000000CB88F82FFF9F4
          F1FFEEE4E1FFC8A691FFC28E62FFEDCC9EFFBF8C64FFBF8B63FFBF8A63FFBE89
          61FFEFE7E3FFDAB68BFFE4C79DFFECD6B7FFCD9968FF0000000CB99184FFFAF5
          F3FFF7EEEAFFF3EBE6FFDDCBBEFFBC8B69FFC28F68FFEBE2DFFFEFE8E4FFF1E7
          E5FFF5EDE8FFDCB88DFFE6C9A1FFEED9BBFFCE9B6CFF0000000BBB9387FFFAF6
          F4FFF7EFEBFFF7EEEBFFF6EDE9FFEDE1DDFFD2B195FFF3EBE7FFF7EFEBFFF7EE
          EBFFF7EFEBFFDDBB90FFE8CCA3FFEFDCBFFFCF9C6EFF0000000ABD968AFFFAF6
          F4FFF8EFECFFF7EFECFFF7EFECFFF7EEEBFFF6EDEAFFF6EEEBFFF7EFECFFF7EF
          ECFFF7EFEBFFDEBC92FFE9CFA6FFF1DFC2FFD09E70FF00000009BE998BFFFAF7
          F4FFF7F0ECFFF8F0ECFFF8F0EDFFF8EFECFFF8EFECFFF8EFECFFF8F0ECFFF7F0
          ECFFF8EFECFFDFBE94FFEAD1A9FFF1E1C6FFD0A071FF00000009C09B8EFFFAF8
          F6FFFBF8F6FFFBF8F6FFFAF8F5FFFAF8F6FFFAF8F5FFFAF8F6FFFAF8F5FFFAF8
          F5FFFAF8F5FFE7D0B2FFF5E8D1FFF4E5CDFFD1A273FF000000088F756CC0C19D
          90FFC19C8FFFC09B8EFFC09B8EFFC09A8EFFBF9A8DFFBF998CFFBE988CFFBE98
          8BFFBD978AFFD3A375FFD3A375FFD2A375FF9C7956C200000005}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000090000
          000E000000100000001000000010000000100000001000000011000000110000
          0011000000110000001100000011000000100000000B00000003845633C1B777
          46FFB77746FFB77746FFAA7B6DFFA97A6CFFA97A6BFFA97A6BFFA9796BFFA87A
          6BFFA7786AFFA7786AFFA77869FFA77869FF78564AC30000000AC68C5CFFE0BF
          99FFE0BC94FFD7AD84FFF8F0ECFFF8F0ECFFF8F0ECFFF8F0ECFFF7EFEBFFF8EF
          EBFFF7EFEBFFF7EFEBFFF7EFEBFFF7F0EBFFA8796AFF0000000FC68E5DFFE2C4
          9DFFD8B081FFD1A476FFF6ECE8FFF6EDE8FFF6ECE8FFF6EDE8FFF6ECE8FFF7ED
          E8FFF6EDE7FFF6ECE8FFF6ECE8FFF8F0ECFFA97B6BFF00000010C7905FFFE4C6
          A2FFDAB285FFD3A679FFF7EDE8FFF6EDE8FFF6EDE8FFF6EDE8FFF6EDE8FFF6EC
          E8FFF7EDE8FFF6ECE8FFF6ECE8FFF8F1EDFFAA7C6DFF0000000FC89261FFE6C9
          A8FFDCB589FFD4A87BFFF7EEE9FFF7EDE9FFF7EDE9FFF7EDE9FFBC8D73FFF1E4
          DEFFF6EDE9FFF7EDE8FFF6EDE9FFF9F1EDFFAB7E6FFF0000000ECA9463FFE7CE
          ACFFDEB88BFFD6AA7DFFF7EEE9FFF7EDE9FFF7EEE9FFF7EDE9FFA2613AFFA46B
          4AFFDDC6BAFFF6EDE9FFF7EEE9FFF8F1EEFFAD8072FF0000000ECB9565FFE9D1
          B0FFDEBA8FFFD6AC80FFF7EDEAFFB57D56FFA76740FFA6663FFFA6653EFFEEBB
          75FFB17548FFC29A86FFF4E9E3FFF9F2EFFFAF8274FF0000000DCC9767FFEBD4
          B5FFE0BD92FFD7AE82FFF7EEEAFFB8825BFFFEEAC1FFF9CA82FFF8C980FFF9C8
          80FFF8C87EFFCD955EFFBB8E77FFF9F2EFFFB08476FF0000000CCE996AFFECD7
          B9FFE1BF96FFD8B085FFF7EEEAFFBC875FFFBB855EFFBB845DFFB9835CFFF3DA
          B2FFB7835EFFC7A28CFFF5EBE6FFF9F3F0FFB28679FF0000000CCF9B6DFFEDD9
          BEFFE3C299FFD9B187FFF7EFEBFFF7EFEBFFF7EFEBFFF8EEEBFFBC8861FFB47F
          5DFFE2CDC0FFF7EEEAFFF7EFEBFFFAF4F1FFB3897BFF0000000BCF9D6EFFEFDC
          C0FFE4C59CFFDAB48AFFF8EFEBFFF7EEEBFFF7EFEBFFF7EFEBFFD3AF94FFF2E7
          E1FFF7EFEBFFF7EFEBFFF7EEEBFFFAF3F2FFB58B7DFF0000000AD09F70FFF0DF
          C4FFE5C89FFFDBB68CFFF7EFECFFF8EFECFFF8EFECFFF7EFECFFF7EFECFFF7EF
          ECFFF7EFEBFFF7EFEBFFF7EFECFFFAF5F2FFB68D80FF00000009D2A072FFF2E0
          C7FFE6CAA2FFDCB88EFFF8F0EDFFF8EFECFFF8EFECFFF8EFECFFF8F0ECFFF7F0
          ECFFF8EFECFFF8EFECFFF7EFECFFFAF5F2FFB99083FF00000009D2A274FFF3E4
          CEFFF3E4CEFFE6CCAFFFFAF8F5FFFAF8F6FFFAF8F5FFFAF8F6FFFAF8F5FFFAF8
          F5FFFAF8F5FFFAF8F5FFFAF7F5FFFAF6F4FFBB9286FF000000089D7857C0D3A3
          75FFD2A375FFD3A374FFC09B8EFFC09A8EFFBF9A8DFFBF998CFFBE988CFFBE98
          8BFFBD978AFFBD978AFFBD9689FFBD9589FF8A6E64C200000005}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000090101
          010E010101100101011001010110010101100101011001010111010101110101
          011101010111010101100101010B0000000300000000000000001D4783CA2860
          AFFF2962B1FF2961B1FF2860B0FF285FB0FF275EAFFF275EAEFF275CAEFF275C
          AEFF275BADFF265AADFF2659ABFF214C94E304091129000000022965AFFF3671
          B7FF5C9FD8FF75C1EFFF4BAAE8FF49A7E8FF46A5E7FF44A3E6FF41A3E6FF40A1
          E5FF3D9FE4FF3B9FE5FF3A9EE5FF2E7AC7FF132C528B000000082F6FB8FF4E89
          C4FF4A8FCDFF9FDAF7FF67BDEFFF59B3ECFF56B2ECFF52B0EBFF91C9F0FFA1CE
          EBFF9DC9E6FF9BC8E6FF9DCBEAFF83BBE7FF214D8DD50101010D3376BDFF70AB
          D6FF428DCCFFA2D6F2FF97D7F7FF6AC1F2FF67BEF1FF64BDEFFFAAD5EFFF2B7F
          5FFF046635FF046633FF2C7E61FFA3CFECFF306DBBFF060C162F367BC2FF92CA
          E9FF54A3DAFF83BFE5FFC4EFFDFF7BCCF5FF78CBF5FF76C9F4FFB1D9EEFF067B
          45FF2FD19DFF23CD94FF057A44FFA9D4EBFF4690CFFF153052813982C5FFB1E4
          F6FF78CBF0FF5AA7DCFFD3F5FEFFE8F9FDFFE2F2F7FFDDF0F4FFD4E7ECFF077D
          48FF36D6A5FF27D199FF067C47FFC1DBE7FFB9D6E8FF7692B4E13C88CAFFC9F6
          FFFF9AE7FEFF66BFEBFF50A4DBFFA3CCE6FF05723FFF05713EFF05703DFF087F
          4AFF3EDBACFF2DD49FFF077D48FF046C39FF046C39FF046B38FF3B8ECEFFCEF8
          FFFFA9EDFFFF9FEAFFFF95E5FDFFC5EDFAFF469B7FFF6BB498FF4DDCB1FF34D9
          A9FF36D9A9FF34D9A9FF30D6A3FF40D7A8FF63AA8EFF04391CB53E93D0FFD1F9
          FFFFB1F1FFFFADEFFFFFA9EEFFFFC2F1FEFFCEECEEFF2D966CFF8BD1BAFF58E3
          BEFF5CE6C0FF5BE5BEFF51DFB7FF7DCCB2FF0E633BE40006031A4097D3FFD4FA
          FFFFB8F4FFFFB5F2FEFFB3F3FFFFBBEEFBFF98C4E3FF7AB3C0FF359C71FF9DE5
          D2FF6EEDCBFF6DECC9FF91E2CAFF2E895EFD021A0E4700000003429CD6FFE2FC
          FEFFE2FCFEFFE1FCFEFFD4F5FBFF4793C6EC080E121E0303030C0B472F8964B4
          94FF96EDD7FF8BEAD2FF5CA98AFF053A228A00000005000000013276A0BF439F
          D8FF439ED8FF439ED8FF439CD7FF16344759000000020000000000020107136F
          4AC791CCB6FF8BC9B2FF0A6039CB000101090000000100000000000000020000
          0003000000030000000400000003000000020000000000000000000000010313
          0D252D956CF321875AF501100A27000000010000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00010A35245D052F1D6000000002000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000100000004000000070000000A0000000B0000000D0000000D0000
          000D0000000C0000000A00000007000000020000000000000000000000000000
          0000000000040C2D527E103F74B4114887D2104789DB1250A0FF114C9CFF0D3C
          7FDC0B3777D4092D63B806204789000000080000000000000000000000000000
          0000000000061E6CBCFF429FE5FF3096EAFF208CE9FF1D90F3FF188AF1FF147E
          E2FF1177DDFF0E6CD0FF0E4596FF0000000C0000000000000000000000000000
          0000000000041B5FA1D54AA5E5FF5DBEFAFF54BCFCFF31A3F8FF2599F7FF2194
          F4FF2293F2FF217ED2FF0F3F82DA000000090000000000000000000000090000
          000E00000011040D1530144878A72679C2F856B2EBFF56B4ECFF369DE8FF2E94
          E5FF1B62AFFA0D3565AA020A133800000015000000100000000A0F3761941651
          8FD11F5895D94C7EB7F46C95C9FF638CBAF92F6EAAFC3A6C9FFF316498FF2865
          9FFC618AB8F86B95C7FF497AB3F71A4C89DB0E3E7CD3082751981F71BEFD5FB0
          E9FF49A2E7FF43A2ECFF48A6F0FF7BB1E0FF4671A3FF7DA4CDFF588BC1FF2F5A
          8FFF7CB2DBFF48A6F0FF3D9CEAFF3894E0FF3D95DEFF1351A1FD18548CBE4593
          D5FF74BDEDFF59B4F3FF7CBFF3FF83B6DCFF567DB1FFBDE0F5FF8BC2EBFF345D
          97FF7EAFD1FF72BBF1FF50ADF1FF58A9E7FF2F7AC3FF0F3E77C1000000090C28
          42631E619FD673B6E1FFA4CFE9FF3E6699FF5C80B0FFCAE8F6FF94C6E9FF375D
          95FF466792FFA1CBE5FF67AEDEFF185494D708213B670000000D000000010000
          000608090C2B336097F67890B5FF245597FF4F7CB1FF517CAFFF2C5088FF325D
          98FF1E3F79FF758EB2FF235089F607080B2E0101010700000001000000000202
          0208222E3F706791BFFFA2CFF3FF326BAEFF6C9ED1FF5C8CC1FF76A5D3FF5385
          BEFF214784FFA0CCEFFF3A6DABFF121D2F6E0303030A00000000000000000303
          030C2B4770C98DB4D6FFAFD8F7FF759FCCFF4179B6F63878BAF13174BBFC3A6C
          A6F882A1C3FFB1D8F5FF5288C1FF18315AC20505051100000000000000000303
          030D1B4884FA7DA2C7FF5381B1FF698AB4FF617DA2FC6262626F606060696F8A
          B0FCA2BCD5FF5784B3FF2E5E98FF113B74FB0505061600000000000000000202
          02071F5090F53C70ADFE5790CDFF437FC2FF194989FF04070A1A020202071F50
          90F53C70ADFE5790CDFF437FC2FF194989FF04070A1A00000000000000000000
          00020E223B6121528FD62661A7F71E4F89D80F25407301010103000000020E22
          3B6121528FD62661A7F71E4F89D80F2540730101010300000000000000000000
          0000000000000000000100000001000000010000000100000000000000000000
          0000000000010000000100000001000000010000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000100000004000000070000000A0000000B0000000D0000000D0000
          000D0000000C0000000A00000007000000020000000000000000000000000000
          0000000000040E38297E134F37B414593DD212583BDB126441FF105D3DFF0D49
          2FDC0A432AD4063521B804251689000000080000000000000000000000000000
          000000000006278A63FF4EBB98FF3CBB90FF2FB586FF2FBF8DFF2DBD8BFF27AE
          7DFF24A878FF209A6CFF0D5535FF0000000C0000000000000000000000000000
          000000000004267B5BD557C09FFF6CDBBCFF65DAB7FF45CBA0FF39C697FF37C4
          95FF3AC396FF36A47EFF0F5136DA000000090000000000000000010101090101
          010E0101011106120E301D5E45A7349875F868CEB1FF6AD1B4FF4BC59EFF42BD
          95FF237F5EFA114732AA040E0A3801010115010101100101010A194737942266
          4ED1286A54D9548F7AF471A392FF679988F93A8870FC40768EFF386E87FF327B
          63FB679988F770A391FF4D8A74F7205E47DB14523BD30D3627983A9275FD6EC6
          ABFF52B795FF46B08DFF47AF8CFF79B5A1FF487591FF7DA4CDFF588BC1FF315F
          81FF7EBAA6FF47AF8CFF3AA17EFF359875FF379878FF1A6B4EFD2F725CBE5EB5
          9AFF84D4BDFF65CBABFF80CFB5FF86BFADFF567EB0FFBDE0F5FF8BC2EBFF345E
          97FF84BAADFF79CBB1FF55BC9BFF5DB89CFF399173FF195540C1010101091838
          2D6339836BD687D0BBFFAEDDD0FF416992FF5C80B0FFCAE8F6FF94C6E9FF375D
          95FF4A6C8BFFACDACDFF78C7AFFF2D745ED7112E25670101010D000000010101
          01060A0C0C2B44708BF67D96B8FF255696FF4F7CB1FF517CAFFF2C5088FF325D
          98FF1E3F79FF7C95B5FF33617CF60A0B0B2E0101010700000001000000000303
          0308273242707097C3FFA7D2F4FF326BAEFF6C9ED1FF5C8CC1FF76A5D3FF5385
          BEFF214784FFA5CEF0FF4676B0FF1822336E0303030A00000000000000000404
          040C354F75C994B8D8FFB4DAF7FF79A2CEFF427BB8F63878BAF13174BBFC3C6D
          A6F885A2C3FFB6DAF6FF5C8FC5FF223A60C20505051100000000000000000404
          040D28528BFA85A7CAFF5D88B5FF7291B8FF6A83A8FC6262636F606060697890
          B5FCA7BFD7FF618BB7FF3A679EFF1F467CFB0606071600000000000000000202
          02072B5996F54778B2FE6197D0FF4E87C6FF275490FF06080B1A020202072B59
          96F54778B2FE6197D0FF4E87C6FF275490FF06080B1A00000000000000000101
          010213263E612C5A93D6326AABF729578DD81529447301010103010101021326
          3E612C5A93D6326AABF729578DD8152944730101010300000000000000000000
          0000000000000000000100000001000000010000000100000000000000000000
          0000000000010000000100000001000000010000000000000000}
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
          00020000000A0000000F00000011000000110000001200000012000000130000
          00130000001300000014000000130000000D0000000300000000000000000000
          000981594BC1B37B67FFB27B66FFB27A66FFB27864FFB17965FFB17965FFB177
          65FFB17763FFB07664FFB07664FF7E5548C50000000C00000000000000000000
          000DB57D6BFFFDFBF9FFFBF6F2FFFBF5F2FFFAF5F1FFFBF4EFFFF9F3EEFFF9F2
          EEFFFAF2ECFFF8F0EBFFF9F0EAFFB17866FF0000001200000000000000000000
          000DB7816DFFFDFBFAFFD2AA98FFD3A998FFD2A796FFD2A897FFD1A796FFD1A6
          96FFD2A595FFD1A595FFF9F1ECFFB37A68FF0000001300000000000000000000
          000DB98472FFFDFCFBFFD3AB9AFFD3AA9AFFD3A999FFD3AA99FFD2AA99FFD2A8
          98FFD2A897FFD1A897FFFAF2EEFFB57D6BFF0000001200000000000000000000
          000CBB8775FFFEFCFBFFD5AC9DFFD5AC9DFFD5AC9CFFD4AC9BFFD4AC9BFFD3AB
          9AFFD3AA99FFD3AA99FFFAF4EFFFB7816EFF0000001100000000000000000000
          000BBE8A79FFFEFDFCFFF9F2EDFFF9F2EDFFF9F0EBFFF9F0EAFFF8F0EAFFF8F0
          E9FFF8EFE9FFF8EFE8FFFAF5F1FFBA8571FF0000001000000000000000000000
          000AC08F7EFFFEFDFDFFFAF3EFFFFAF4EEFFFAF3EEFFFAF1ECFFF9F1EBFFF9F0
          EBFFF9F1EBFFF8F0EAFFFBF6F3FFBB8975FF0000000F00000000000000000000
          0009C49380FFFEFEFDFFFBF5F1FFFBF5F0FFFBF4F0FFFAF3EFFFFAF3EFFFF9F3
          EDFFF9F2EDFFF9F1EBFFFCF7F4FFBE8B79FF0000000F00000000000000000000
          0009C69686FFFEFEFDFFFAF5F3FFFBF6F2FFFBF5F1FFFBF5F0FFFBF5F0FFFAF4
          EFFFFAF4EEFFFAF3EFFFFDF9F7FFC18E7DFF0000000E00000000000000000000
          0008C99B8AFFFEFEFEFFFBF6F4FFFBF6F4FFFCF6F3FFFCF6F3FFFCF4F2FFFBF5
          F1FFFBF5F0FFFAF5F0FFFDFAF8FFC39382FF0000000D00000000000000000000
          0007C99E8DFFFFFEFEFFDCBAAEFFDCB9ADFFDCB9ACFFDBB8ACFFDBB7A9FFDBB7
          A9FFDBB7A8FFDAB6A7FFFDFBF9FFC69786FF0000000C00000000000000000000
          0006CEA190FFFFFFFEFFDDBCB0FFDDBCB0FFDDBCAFFFDCBBAEFFDCBAADFFDBBA
          ADFFDBB9ACFFDCB8AAFFFDFCFAFFC89B8AFF0000000B00000000000000000000
          0006CEA393FFFFFFFFFFDFBFB3FFDFBFB2FFDFBFB2FFDEBEB1FFDEBDAFFFDDBD
          B0FFDDBAAFFFDDBBAEFFFEFCFCFFCB9D8DFF0000000B00000000000000000000
          0005D0A696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFEFFFEFEFEFFFFFE
          FEFFFEFEFEFFFEFEFEFFFEFEFDFFCDA191FF0000000900000000000000000000
          00039C7C71C0D2A898FFD1A897FFD1A897FFD1A797FFD0A696FFD0A696FFD0A6
          95FFD0A595FFCFA595FFCFA494FF98796EC20000000600000000}
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
          2000000000000004000000000000000000000000000000000000000000020000
          000A0000000F0000001000000010000000100000001100000011000000110000
          0011000000100000000B00000003000000000000000000000000000000094633
          2CC160453BFF644A41FFB87D4EFFB97A4AFFB47444FFB06C3DFFA76436FF593E
          37FF5C4037FF3B2823C20000000A0000000000000000000000000000000D6F53
          47FF947869FF6A4F46FFD8B07BFFD7AE77FFD7AB74FFD6A970FFD5A66DFF5F44
          3CFF694C42FF553A32FF0000000E0000000000000000000000000000000C7357
          4AFF987D6EFF70564BFFFFFFFFFFF6EFEAFFF6EFE9FFF6EEE9FFF5EEE9FF644A
          41FF72544AFF583D34FF01010116020202100101010B000000030000000B785C
          4EFF9D8273FF765C50FFFFFFFFFFF7F0EBFFF7F0EBFFF7EFEBFFF6EFEAFF6A50
          46FF73554BFF5B4037FF2B201E786C534BFF483832C20101010A0000000A7C60
          50FFA28777FF7B6154FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F56
          4BFF74584EFF5E4339FF352A2678785E55FF664D46FF0101010E000000097F63
          54FFA78E7DFF977A6AFF967969FF957967FF84695CFF785D53FF775C51FF775C
          51FF775A50FF62463CFF362A277780655CFF685048FF0101010E000000088367
          57FFAB9382FF634A41FF614740FF5E463DFF5C443CFF5B433BFF594139FF5840
          37FF795C52FF654A3FFF372C287781665DFF6B534BFF0101010D00000007866A
          59FFAF9788FF674E44FFF3EAE4FFE7D5C8FFE7D4C6FFE6D3C5FFE6D3C5FF5B43
          3AFF7A5F54FF694E42FF382D297682685FFF6E554CFF0101010C00000006886D
          5CFFB39C8CFF6B5248FFF4ECE6FFE9D9CDFFE8D7CAFFE7D5C8FFE6D4C6FF5E46
          3EFF7C6156FF6C5145FF382E2A75846A61FF71584FFF0101010B000000058B70
          5EFFB7A091FF70564DFFF6EFEAFFF5EDE8FFF4ECE6FFF4EBE4FFF3EAE3FF634A
          41FF7E6358FF715549FF3A302B75866C63FF745C52FF0101010A000000036954
          47C08C715FFF755A50FF8D766CFF897369FF856D65FF81695FFF7C645BFF674D
          45FF775B4DFF644E43DC3B312C73876F65FF785F55FF01010109000000010000
          0002000000040000000740362F73514842734B4139744A4038744A3F3874493E
          3774463B35743C322E733D322E72897067FF7A6257FF01010108000000000000
          00000000000000000005967E6EFFBEA99CFFAE9685FFAD9584FFAC9583FFAB92
          83FFAA9182FF947B70FF8C7369FF8B7268FF7F665BFF01010107000000000000
          00000000000000000003725F53C0977F6FFF967D6EFF957C6DFF947A6BFF9279
          6AFF907868FF8E7667FF8C7365FF846B5EFF614E46C100000004000000000000
          0000000000000000000100000002000000040000000400000004000000040000
          0005000000050000000500000005000000050000000300000001}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000003000000090000000A00000006000000000000
          0000000000000000000000000001000000060000000A0000000B0000000B0000
          000B0000000B0000000F0E0A08446F5348FF6F5248FF3729248D000000000000
          0000000000000000000000000006815D4FBDB3816EFFB3806DFFB3806CFFB27E
          6CFFC9A599FFAC8C81FF735A4FFFC5A794FFC5A794FF715449FF000000000000
          0000000000000000000000000008B68370FFF8F1EDFFF7F0EBFFF4EEE9FFF1EA
          E6FFD0C7C1FF796055FFC7AB98FFDBBEA8FFEBDACDFF74584DFF000000000000
          0000000000000000000000000008B78572FFF9F3F0FFEDE5E0FF94837CFF896D
          62FF684E45FFC9AD9BFFDEC1ADFFEDDCD2FF947A6EFF16100E401B487EB72563
          AEFF2560AEFF2560AEFF235BA7FFB98775FFF8F3F0FF9A8983FFA0887EFFE3D0
          C3FFDDC6B6FFE1C6B4FFF1E3DAFF998074FFB6978BFF0000000C296AB3FF87C8
          EDFF61B4E7FF60B3E7FF5CADE2FFBB8978FFF8F3F1FF92776AFFE7D6CBFF886A
          5EFF957A6FFFE4D2C6FF84675AFFDCD3CEFFCBA99DFF000000082C6FB7FF9FDD
          F7FF6EC3F0FF6DC1F0FF69BBE9FFBC8C7AFFFAF7F5FF967B6EFF8D6F62FFBDAB
          A2FF6B5045FFE8DAD0FF907569FFF7F2F0FFB78572FF000000082F75BCFFABE4
          F9FF75C8F2FF73C6F1FF6EC0EBFFBE8E7DFFFDFBFAFFF8F2EFFFF6F0ECFF6D52
          47FFE7DDD6FFC2AEA3FFBCAAA2FFFBF8F6FFB88775FF00000007327CBFFFB6EA
          FBFF7BCDF4FF79CBF3FF74C6EEFFC09180FFFEFDFCFFFAF6F3FFFAF5F1FF9E82
          75FF9C8274FFC2B0A7FFF6F0EDFFFDFBFAFFBA8977FF000000063582C4FFBFEF
          FCFF81D1F5FF80D0F4FF7CCBF1FFC29383FFFEFEFDFFFEFEFDFFFEFDFDFFFDFC
          FCFFFDFCFBFFFDFCFBFFFEFDFCFFFEFDFCFFBC8B7AFF000000053688C8FFC7F3
          FDFF87D6F6FF85D5F6FF83D0F4FFB2A4A1FFC39685FFC29584FFC29383FFC193
          82FFC19281FFC09180FFBF907FFFBE8F7EFF8C695DC000000003398ECBFFCDF6
          FDFF8DDAF8FF8BD8F8FF89D8F7FF89D6F5FFA7E5F8FFCDF3FAFFCEF3FAFFCCF2
          FAFFCAF0FAFFC7EFF9FF327EBFFF0000000400000002000000013B92CEFFD1F8
          FEFF93DFFAFF91DDF9FF92DCF9FFA5E3F8FF4595CEFF378CC9FF378AC9FF3689
          C8FF3688C8FF3787C6FF286393BD0000000000000000000000003D97D1FFE2FC
          FEFFE1FCFEFFE0FBFEFFD1F2FAFF428FC2EB040A0F1200000000000000000000
          00000000000000000000000000000000000000000000000000002F739CBD3E9A
          D3FF3E99D3FF3E99D3FF3E97D2FF143245540000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
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
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000001010306110B3F6F1F1473CB25188AF425188AF41F14
          73CB110B3F6F0101030600000000000000000000000000000000000000000000
          0000000000000503101B251B79CF2A28B0FF242FC0FF2535C8FF2435C8FF232F
          C1FF2A27B0FF261B7AD00503101B000000000000000000000000000000000000
          0000010104072B227FD03236BCFF263AC7FF2231C0FF2A3AC6FF2A3AC6FF202F
          C0FF263AC7FF3135BCFF2B2280D1010104070000000000000000000000000000
          00001A16466E3B3CBFFF283DC8FF646ECEFF9EA2DBFF3744C3FF3544C3FF9A9D
          D6FF6069CBFF283DC9FF393ABDFF1A16466E0000000000000000000000000000
          0000363085C73E4ED1FF1F33C4FF9B93C1FFFFFFECFFB3B1DBFFB2AFD8FFFFFF
          F4FF9A94C3FF1B2EC0FF3E4ED3FF363085C70000000000000000000000000000
          00004B46AEF94158DAFF364ED4FF3540B8FFAA9AB5FFFFFFF2FFFFFFF7FFB1A5
          C1FF343FB8FF374ED3FF4258DAFF4945AAF30000000000000000000000000000
          00005350B6F9435BDDFF576CDBFF4C5DD1FFACABD8FFFFFFF1FFFFFFF1FFA9A8
          D5FF4353CAFF5268DBFF455EDDFF5350B5F80000000000000000000000000000
          0000494897C7778AE6FF6579DBFF9E97C5FFFFFFF7FFAFA6C7FFA395B5FFFFFF
          F2FF9C97C7FF4D61D1FF6A7DE5FF494897C70000000000000000000000000000
          00002B2B556D8890E0FF859BECFF7D80C4FF8E81ADFF636ECBFF5D67C4FF8C7E
          A9FF767AC5FF6B83E4FF7B84E0FF2B2B556D0000000000000000000000000000
          0000030305065859A8CF95A1E8FF8CA1EBFF6C7DD8FF97ACF1FF95ABF2FF6273
          D5FF778EE5FF8A97E8FF585AA9D0030306070000000000000000000000000000
          0000000000000C0C161B5D60ACCF9CA5E7FFAEBFF5FFA6BBF3FFA4B7F2FFA4B8
          F4FF959FE7FF5D60ACCF0C0C161B000000000000000000000000000000000000
          000000000000000000000303050634355E6E5E61A9C77276CFF37276CFF35E61
          A9C734355E6E0303050600000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000050000
          0008000000090000000900000009000000090000000900000009000000090000
          0009000000090000000900000009000000090000000800000005000000140000
          00260000002B0000002B0000002B0000002B0000002B0000002B0000002B0000
          002B0000002B0000002B0000002B0000002B00000026000000141A3B6CB0295C
          A8FF295CA8FF295CA8FF295CA8FF295CA8FF295CA8FF2E60AAFF2E60AAFF295C
          A8FF295CA8FF295CA8FF295CA8FF295CA8FF295CA8FF1A3B6AAE27589DEB84B6
          DDFF9ACDF0FF94CBEFFFA7D4F2FFB9DDF5FFCEE7F8FFD9E7F1FFD1E4F0FFB6DC
          F4FF94CBEFFF84C3EDFF78BEEBFF81C1ECFF7EB2DBFF27589DEB1B3D699E5586
          BEFFA7D3F0FF6DB9EAFF61B3E8FF61B3E8FFA3D3F2FF453F3EFF453F3EFFA3D3
          F2FF61B3E8FF61B3E8FF69B7E9FF87C2EAFF437BB8FF1B3C679C0205080E285B
          97DB7EA8D1FF9BD0F1FF72BCEBFF79C0ECFFA0D2F2FF7E858DFF7E858DFFA0D2
          F2FF7AC0ECFF73BDEBFF85C5EEFF6196C8FF285A96D90204070D000000000A16
          2437306DB1F9C0DAEDFFA4D6F2FF91CCF0FF95CDF1FF93C7E8FF93C7E8FF95CD
          F1FF91CCF0FF9BD1F1FF95C2E3FF306DB1F90A16243600000000000000000000
          00011837577C558DC2FFDCEFFAFF9FD4F1FFAFDBF4FF83939EFF83939FFFAFDB
          F4FF9DD3F1FFB3DDF5FF538CC2FF183654790000000100000000000000000000
          000001010205285D8DC273A6D1FFCFEBF9FFC0E3F7FF727071FF727071FFC0E3
          F7FFAFDDF5FF6EA3CFFF285B8BBF000001030000000000000000000000000000
          000000000000060F16213579B3EFA3CCE7FFDAEFFAFF665D5BFF665D5BFFCFEB
          F9FF99C6E4FF3578B2ED060E141F000000000000000000000000000000000000
          00000000000000000001142F435C5B9ACBFFDEF3FBFF766F6DFF766F6EFFD9F0
          FBFF5899CBFF132B3E5500000001000000000000000000000000000000000000
          000000000000000000000000000226587CA385B8DBFFDEF3FCFFDAF2FBFF84B7
          DBFF2555779D0000000200000000000000000000000000000000000000000000
          000000000000000000000000000003070A10377FAFDFA2CEE8FF9FCCE7FF367B
          AAD90306090E0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010E212C3B4095CAFB4094C9FA0D1E
          2937000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000119394C5F1836495B0000
          0001000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
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
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000000000000000001000000050000000C050D1F520E28
          5DCD113379FF0D275CCD040C1E520000000D0000000500000001000000020000
          00070000000B0000000C0000000C00000011050F2157112E63CF275DA0FF4DA4
          E0FFC1E6F9FF275DA3FF194389FF0E295ECD040D1E5000000005000000062D25
          7ABE3F32A9FF3E32A9FF3D31A8FF3A2DA0FF1F5095FF5BAFE6FF6FCBFFFF6ECC
          FFFFCDECFAFF2F6DB2FF306DB3FF2A64AAFF163E84FF0000000A000000094439
          ADFF6373DEFF5566DAFF5464D9FF4E5FD0FF245B9EFF7ED2FFFF7ED4FFFF7ED4
          FFFFDAF0FBFF3272B6FF3172B5FF3172B6FF19458AFF0000000C00000009483F
          B1FF6D7DE1FF596ADBFF5869DBFF5364D2FF2963A7FF8EDBFFFF8EDBFFFF8EDB
          FFFFE5F5FCFF3476B8FF3475B8FF3376B8FF1D4D91FF0000000B000000084D44
          B5FF7787E3FF5E6FDDFF5C6EDCFF5868D4FF2C6CAEFF9DE1FFFF9DE1FFFF9CE1
          FFFFF0F9FEFF3578BAFF3578BAFF3578BAFF215599FF0000000A000000075149
          B8FF8192E6FF6274DEFF6173DEFF5C6DD6FF2F73B4FFABE6FFFFC6EFFFFFF0FB
          FFFFFFFFFFFFE9F4FBFF81AFD7FF3578BAFF245C9FFF0000000900000007564F
          BDFF8C9BE9FF6679E0FF6578DFFF6272D9FF3074B6FFC2DAEDFFF2FCFFFFD6F3
          FDFFC7EFFCFFD1F1FDFFF0FAFEFFBBD4EAFF2862A5FF00000006000000065A54
          C0FF95A3ECFF6B7EE1FF6F81E3FF6E81E1FF5E7CD2FF3E75BDFF5491C7FFA2D1
          EBFFC6EFFCFF9FCFEBFF5290C6FF245789C70A17274400000002000000055F5A
          C4FFA0AFEFFF798DE5FF7A8EE6FF788BE5FF778AE3FF7388E1FF6280D4FF3F77
          BEFF3074B6FF4279BEFF4955B4FF0000000D0000000200000000000000056561
          C8FFB0BEF2FF8196E8FF8095E8FF7F93E8FF7D92E7FF7D91E8FF7B8FE5FF788D
          E3FF768CE2FF8EA0E8FF5B55C0FF000000070000000000000000000000046D6B
          CFFFB8C7F4FF879CEAFF869BEAFF859AE9FF8399E9FF8398E9FF8297E9FF8195
          E8FF8094E8FF97AAEDFF6360C6FF000000070000000000000000000000047271
          D1FFBFCCF5FFBECCF6FFBCCBF5FFBCCBF5FFBBCAF5FFBACAF5FFBAC8F5FFB9C8
          F4FFB8C6F4FFB7C5F4FF6A66CBFF000000060000000000000000000000037777
          D6FF7576D7FF7474D5FF7171D4FF6F6ED2FF6D6CD0FF6B68CEFF6966CCFF6663
          CAFF6360C8FF615DC7FF6F6CCEFF000000050000000000000000000000028282
          DBFFC5C5EFFFFEFEFEFFFDFCFCFFFCFAF9FFFAF8F6FFF8F5F3FFF7F2F0FFF6F0
          ECFFF4EDE9FFF2ECE7FF7979D4FF000000040000000000000000000000016264
          A6BF8587E0FF8486DFFF8485DFFF8385DDFF8284DEFF8284DCFF8283DCFF8083
          DCFF8082DCFF8081DBFF5E5FA2C0000000030000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0002000000070000000B0000000C0000000C0000000C0000000C0000000D0000
          000D0000000D0000000D0000000C000000080000000200000000000000000000
          000619563DBE207151FF207050FF206F4FFF216D4EFF206C4DFF216B4CFF216A
          4BFF21694BFF21684AFF21674AFF174935C00000000800000000000000000000
          000925825FFF53D0A8FF45CB9FFF44CB9FFF44CB9EFF64D7B3FF82E1C5FF63D7
          B2FF43CA9DFF42CA9CFF48CCA0FF1E7754FF0000000C00000000000000000000
          0009278662FF5CD4AEFF48CDA1FF58D2ABFF70DBBBFF1C724FFF1C7350FF7CE0
          C1FF66D8B4FF4CCEA4FF4ECFA3FF207956FF0000000C00000000000000000000
          00082B8A66FF65D7B3FF4ACEA3FF3E9F7CFF2B8360FF176745FF1A6D4BFF348C
          6CFF69C5A7FF65D7B4FF53D1A7FF227C58FF0000000B00000000000000000000
          00072C8D6AFF6EDBBAFF4ECFA5FF227957FF43A886FF63C4A5FF207756FF2078
          55FF257D59FF61D6B1FF58D3ACFF237E5BFF0000000A00000000000000000000
          000730916DFF77DEC0FF51D1A8FF60D4B0FF4CA887FF27805CFF227A57FF1F74
          51FF2B8362FF4DCFA5FF5ED6B0FF26805EFF0000000900000000000000000000
          0006329471FF80E1C5FF54D2AAFF3F9F7DFF227A58FF247F5BFF287F5BFF48A9
          87FF77DBBEFF65D8B4FF65D8B4FF288361FF0000000900000000000000000000
          0005349875FF8BE6CCFF5ED9B4FF359471FF1F7351FF257E5AFF7AD0B6FF54AB
          8EFF409978FF67DAB9FF6DDBBBFF2A8663FF0000000800000000000000000000
          0005389D79FF98EBD6FF63DCB9FF5CD0ADFF318C6AFF227956FF288460FF2980
          5EFF42AA87FF5FDAB6FF79E1C5FF2E8B68FF0000000700000000000000000000
          000440A380FFA1EDD9FF69DFBDFF68DFBDFF68DEBCFF1E6F4DFF1D6F4DFF66DD
          BBFF65DCBBFF65DDBAFF80E4C9FF36926EFF0000000700000000000000000000
          000445A884FFA6F0DEFFA6F0DEFFA6EFDDFFA6EFDDFFA5EFDCFFA4EFDCFFA4EF
          DCFFA3EFDCFFA3EEDCFFA2EEDBFF3A9772FF0000000600000000000000000000
          000348AC86FF389976FF379976FF379875FF379774FF369673FF369673FF3595
          72FF349471FF339370FF32936FFF3D9A76FF0000000500000000000000000000
          000252B38FFFAFD3C5FFFEFEFEFFFDFCFCFFFCFAF9FFFAF8F6FFF8F5F3FFF7F2
          F0FFF6F0ECFFF4EDE9FFF2ECE7FF47A27FFF0000000400000000000000000000
          00013F876DBF55B693FF55B693FF56B592FF55B592FF55B592FF55B492FF55B4
          91FF55B491FF54B490FF54B390FF3E856BC00000000300000000000000000000
          0000000000010000000200000002000000020000000200000003000000030000
          0003000000030000000300000003000000020000000100000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000000000000000000000000000000000000000000A0000
          0010000000110000001100000011000000110000001100000012000000120000
          0012000000120000001200000012000000110000000B000000037E5131C2AF70
          44FFAF7044FFAF7044FFAF7044FFAF7044FFAF7044FFAF7044FFAF7044FFAF70
          44FFAF7044FFAF7044FFAF7044FFAF7044FF7D5031C30000000AAF7245FFFBF8
          F6FFFBF8F5FFFBF8F6FFFBF8F6FFFBF7F5FFFBF8F5FFFBF8F5FFFBF7F5FFFBF7
          F5FFFBF7F5FFFBF7F5FFFBF7F5FFFCF8F7FFAF7044FF0000000FB17348FFFCF9
          F7FFF8F2EDFFF8F2EDFFF8F2EDFFF8F2EDFFF8F1ECFFF8F1EDFFF8F1ECFFF8F0
          ECFFF8F0ECFFF7F0ECFFF7F1ECFFFCF9F7FFAF7044FF0000000FB3764AFFFCFA
          F7FFF8F3EEFFF9F2EEFFF8F2EEFFF8F2EEFFF8F1EEFFF8F1EDFFF8F1EDFFF8F2
          EDFFF8F2EDFFF8F1EDFFF7F1EDFFFCF9F7FFB17246FF0000000EB5794EFFFCFA
          F8FFF8F3EFFFF9F2EFFFF9F3EFFFF8F3EFFFF9F2EEFFF9F2EEFFF9F2EEFFF8F2
          EEFFF8F2EEFFF8F2EDFFF8F2EDFFFCF9F7FFB27448FF0000000EB77D51FFFCFA
          F9FFF9F4F1FFF9F4F0FFF9F4F0FFF9F3F0FFF9F3EFFFF9F4EFFFB5794EFFB579
          4DFFB5794DFFB4784DFFB4784CFFB4774BFFB4774BFF0000000DB98055FFFCFB
          F9FFFAF4F1FFFAF5F1FFF9F4F1FFFAF4F1FFFAF5F1FFF9F4F0FFB77C51FFB77C
          50FFB67C50FFB67C4FFFB67C4FFFB57B4FFFB67B4FFF0000000CBC8458FFBB84
          58FFBB8357FFBB8357FFBB8357FFBA8256FFBA8255FFBA8154FFB98055FFB980
          55FFB98054FFB87F53FFB87E53FFB87E52FFB77E52FF0000000BBE885CFFFDFC
          FAFFFAF7F3FFFBF6F4FFFBF6F4FFFAF6F3FFFAF5F2FFFAF5F2FFFBF6F3FFFAF6
          F2FFFAF5F2FFFAF5F2FFFAF5F2FFFCFBF9FFB98255FF0000000AC08B60FFFDFC
          FBFFFBF7F5FFFBF6F4FFFBF7F4FFFBF7F4FFFBF6F4FFFBF6F4FFFAF6F4FFFBF6
          F3FFFBF5F3FFFBF5F3FFFBF5F3FFFCFBF9FFBD8559FF00000009C39063FFFDFC
          FBFFFCF7F6FFFCF8F5FFFCF8F6FFFBF7F6FFFBF8F5FFFBF7F5FFFCF7F4FFFBF7
          F4FFFBF7F4FFFBF7F4FFFBF6F4FFFDFBFAFFBE895DFF00000008C59468FFFDFC
          FCFFFCF9F7FFFCF9F7FFFCF8F6FFFCF8F7FFFBF8F6FFFCF7F6FFFBF7F6FFFCF7
          F5FFFBF7F6FFFBF7F5FFFBF7F5FFFDFCFBFFC18C61FF00000007C7976AFFFEFC
          FCFFFCF9F8FFFCF9F7FFFCF9F8FFFCF9F7FFFCF8F7FFFCF9F7FFC59367FFC493
          67FFC59366FFC59266FFC49165FFC39165FFC49165FF00000007C99A6EFFFEFC
          FCFFFDFCFCFFFEFCFCFFFEFCFCFFFEFCFCFFFDFCFCFFFEFCFCFFC7976AFFC696
          6AFFC7966AFFC6966AFFC69569FFC69569FFC59568FF00000005977553C0CB9D
          70FFCA9C71FFCA9C70FFCA9B6FFFCA9B6FFFC99A6EFFC99A6EFFCA9A6EFFC899
          6EFFC8996DFFC9996DFFC8996DFFC8986CFF947050C000000003}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000070000
          000B0000000C0000000C0000000C0000000C0000000C0000000C0000000D0000
          000D0000000D0000000D0000000D0000000D0000000C0000000882594DBEB47C
          6AFFB37C69FFB37B6AFFB37B69FFB37B68FFB37B68FFB37A69FFB37A68FFB37A
          68FFB37A68FFB27968FFB37967FFB27967FFB27967FF7F574ABFB67F6DFFF9F2
          EEFFF9F2EEFFF9F2EDFFF9F1EDFFC69A8CFFF9F2ECFFF9F1EDFFF9F1ECFFF9F1
          ECFFC5998BFFF8F0EBFFF8F0EBFFF8F0EBFFF8F0EBFFB37B69FFB78170FFF9F3
          EFFFF7EEE9FFF8EEE8FFF8EEE9FFC79C8DFFF7EEE9FFF8EEE8FFF8EEE9FFF7EE
          E8FFC69A8BFFF8EEE8FFF7EDE8FFF7EEE8FFF9F1ECFFB57D6BFFBA8472FFFAF4
          F0FFF8EFEAFFF8F0EAFFF8EFE9FFC99D8FFFF8EFEAFFF8EFEAFFF7EEEAFFF8EF
          EAFFC89D8EFFF7EFE9FFF8EFE9FFF7EFE9FFF9F1EDFFB7806EFFBB8776FFCCA2
          95FFCAA193FFCBA193FFCAA193FFCAA192FFCBA192FFCAA091FFCA9F91FFCA9F
          91FFC99F91FFC99F90FFC99E90FFC99E8FFFC99F90FFB88371FFBD8A79FFFBF6
          F2FFF9F1ECFFF9F1ECFFF9F0EDFFCCA295FFF8F1ECFFF9F1EBFFF9F0ECFFF9F1
          ECFFCAA194FFF9F0ECFFF9F1EBFFF8F0EBFFF9F3F0FFBA8574FFC08E7CFFFBF6
          F3FFF9F2EEFFFAF2EEFFF9F1EDFFCEA697FFF9F1EDFFF9F1EDFFF9F2EDFFF9F2
          ECFFCDA496FFF9F1EDFFF9F1ECFFF9F1EDFFFBF5F1FFBC8977FFC29180FFFCF8
          F5FFF9F2EFFFFAF3EFFFFAF2EFFFCFA89AFFFAF3EEFFF9F2EEFFF9F2EEFFFAF3
          EEFFCEA799FFF9F2EEFFF9F2EEFFF9F2EDFFFBF5F2FFBF8C7AFFC88E5AFFD9AD
          80FFCE9964FFCD9763FFCD9660FFCD9460FFCB935EFFCA925DFFC9905BFFC88F
          5AFFC88E59FFC88D57FFC88C56FFC78B55FFD19D6CFFBB7943FFC98F5AFFF1DA
          B5FFE7C28DFFE7C18DFFE7C18CFFCD9660FFE6BF89FFE5BE89FFE5BD87FFE5BC
          87FFC98E59FFE4BA84FFE4BA83FFE4B983FFECCDA3FFBC7A44FFCA905CFFF1DB
          B8FFE8C28EFFE7C28DFFE7C18CFFCD9662FFE6BF8BFFE6BE89FFE5BD88FFE5BC
          87FFC98F5AFFE4BB86FFE4BB84FFE4BA83FFEDCEA5FFBD7B45FFCA915EFFF2DD
          B9FFF1DAB9FFF1DAB7FFF1D9B6FFD8AC7EFFF0D8B3FFF0D6B2FFF0D6B1FFEFD5
          AFFFD5A576FFEFD2ACFFEED2A9FFEDD1A9FFEDD1A8FFBE7B45FF976C47BECA91
          5DFFCA8F5BFFC88E5AFFC78C58FFC68B57FFC58955FFC48852FFC48651FFC284
          50FFC2834EFFC0814CFFC0804BFFBF7F49FFBE7D48FF8D5D34BF000000010000
          0002000000020000000200000002000000020000000200000002000000020000
          0003000000030000000300000003000000030000000300000002000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
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
          20000000000000040000000000000000000000000000000000007E5446B7B074
          62FFAF7461FFAF7460FFAE735FFFAE725FFFAD715EFFAD715EFFAC705CFFAC70
          5CFFAC705CFFAC6F5BFFAC6F5BFFAB6F5BFFAB6E5AFF7B4F41B7B67E6CFFFBF6
          F3FFFAF5F2FFFAF5F2FFFAF5F2FFFAF5F1FFFAF4F1FFFAF4F1FFF9F4F0FFF9F4
          F0FFF9F4F0FFF9F3F0FFF8F3EFFFF9F3EFFFF8F2EEFFB37968FFB77F6FFFFBF7
          F4FF6E78D1FF3748C6FF3647C6FF3547C6FF3545C5FF3344C5FF3343C3FF3242
          C3FF6972CDFFF6EEE8FFF6EDE7FFF5EDE7FFF9F4F0FFB47B6AFFB88171FFFBF8
          F5FF3F51CCFFB5C3FBFF8396F5FF8396F5FF8294F4FF8193F4FF8092F4FF7E91
          F4FF3748C7FFF6EFE8FFF6EFE8FFF6EEE9FFFAF4F2FFB47C6BFFB98472FFFCF9
          F7FF6687CDFF416BC5FF4069C5FF3E67C3FF3C65C2FF3B64C1FF3962C0FF3760
          BFFF3462BBFF2E68B2FF2D66B2FF648CC1FFFAF6F3FFB67F6DFFBB8674FFFDFA
          F8FF5189CAFFB0E2FFFF84CCFEFF82CCFEFF80CBFEFF7EC9FEFF7DC9FEFF7BC8
          FEFF79C7FEFF78C7FEFF76C6FEFF3770B8FFFAF7F5FFB7806FFFBB8674FFFDFA
          F8FF95C0E6FF71ACE2FF6FABE1FF6CA8DFFF6AA6DEFF68A3DCFF66A0DAFF639D
          D8FF5F9BD6FF5D98D3FF5A94D2FF80AAD7FFFAF7F5FFB7806FFFBC8877FFFDFB
          F9FFF9F3EFFFF9F2EEFFF9F2EDFFF8F2EEFFF8F2EEFFF8F2EDFFF8F1ECFFF8F1
          ECFFF8F1ECFFF8F1ECFFF7F1ECFFF7F0ECFFFBF8F6FFB98271FFBF8C7AFFFEFC
          FBFFFAF5F1FFFAF4F0FFF9F4F0FFF9F4F0FFF9F4EFFFF9F4F0FFF9F3EFFFF9F3
          EFFFF9F3EEFFF9F3EEFFF9F2EEFFF9F2EEFFFCFAF9FFBB8675FFC08D7DFFFEFD
          FCFF6F7AD3FF3748C6FF3647C6FF3547C6FF3545C5FF3344C5FF3343C3FF3242
          C3FF3141C3FF6973CFFFF9F3EFFFF9F3F0FFFDFBFAFFBC8877FFC28F7EFFFEFD
          FDFF3F51CCFFB5C3FBFF8799F5FF8597F5FF8496F5FF8295F4FF8093F4FF8092
          F4FF7E91F4FF3648C6FFF9F4F1FFFAF4F0FFFDFCFAFFBE8A79FFC39281FFFEFE
          FDFF6182CAFF3A63C0FF3961BFFF3660BEFF355EBDFF5575C8FF3F52CCFF3F50
          CCFF3E4FCBFF6E7AD4FFFAF5F2FFF9F6F2FFFDFCFCFFBF8D7BFFC49483FFFFFE
          FEFF427BC0FFB0E2FFFF81CBFEFF80CAFEFF7ECAFEFF3770B8FFFBF6F4FFFBF6
          F4FFFAF7F3FFFAF6F3FFFAF6F3FFFAF6F3FFFEFDFCFFC08F7EFFC59584FFFFFE
          FEFF91BCE5FF68A3DCFF64A0DAFF629CD8FF5E99D5FF84AFDBFFFCF8F5FFFCF8
          F5FFFBF8F5FFFBF7F4FFFBF7F4FFFBF7F4FFFEFDFDFFC2907FFFC69786FFFFFF
          FEFFFFFFFEFFFFFEFEFFFFFFFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFEFEFFFFFE
          FEFFFEFEFEFFFEFEFEFFFFFEFEFFFFFEFDFFFEFEFDFFC39281FF997A6EBDCFA4
          94FFCFA393FFCEA393FFCEA393FFCEA292FFCEA292FFCDA292FFCDA191FFCDA1
          91FFCDA090FFCCA090FFCC9F8FFFCB9E8EFFCB9E8EFF967469BD}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000100000005040F0B2F104531A51A68
          49EB1B7350FF196849EB104530A6030F0A310000000600000001000000000000
          000000000000000000000000000000000005082117531D7352F5299F75FF31BD
          8DFF54D9B0FF2EBD8BFF279D73FF1B7050F50820175600000006000000000000
          000000000000000000000000000204100C2C237958F536BF90FF3FD2A2FF5ADC
          B4FF135C3BFF57DBB1FF3AD09DFF30BC8CFF217655F5040F0B2F000000000000
          0000000000000000000000000004164C389F3AAE86FF41D5A5FF3AC597FF1560
          3FFF15603FFF155F3EFF40C599FF38D09DFF31A980FF154A35A1000000000000
          000000000001000000030000000925785AE746CEA3FF47D8AAFF45D6A8FF53DB
          B0FF63DFB9FF176442FF2FA67CFF3DD2A1FF3BC898FF227355E7000000000000
          0003060C16281D39669F1B3560972D8968FD55DBB3FF4DDAAEFF4FDBAFFF44AA
          87FF196B47FF2C966EFF45D7A8FF43D6A6FF48D6A8FF298262FA000000020E1B
          304C3462A7F45091CDFF5B859EB0368F71F66BDBBAFF52DDB3FF4ACFA4FF1C70
          4DFF68DCB9FF6CE3C1FF52DBB1FF49D8AAFF60D7B2FF287C5EE7070E1726396A
          ADF46AB5E3FF8BCEF0FF315387C5236365D863C0A3FF66E3BFFF55DFB6FF1E75
          51FF1E7550FF1E7550FF42C097FF5DDFB9FF5CBC9EFF1C533F9A25426D9A67A6
          D9FF80D0F2FF5E8DC5FF315F9DE040788DAE399677FA7FDAC1FF7CE9CCFF64E3
          BFFF207954FF62E2BDFF77E7C8FF79D8BDFF338D6DF106110D253D6AABE586CD
          EFFFBBEAFAFF2E58A8FF98CAE9FF8AB3C5CB42838BBB3A9A79FB64C1A4FF86DF
          C7FF97EFD9FF84DFC6FF62C0A2FF379272F40F29204B000000024779BEF99CE0
          F7FF1B48A3FF1A47A2FF1A46A2FF18439AF661A1BFCB478093AD3E8D83D93B97
          7BF43A9C79FF348A6BE3235D489D07120E2200000002000000004573B4E5A9DE
          F4FF9BE1F9FF3060B3FF96CCECFF8DD7F5FFA3DEF7FF78B9D5E05B9BB9C55B88
          A2B028456D9200000004000000020000000100000000000000002F4D77958EBB
          E4FFADEAFAFF5F9AD4FF5286C9FFB0DDF4FF4E82C6FF6BB1E2FF8BD4F3FF7BAF
          DFFF2C4A729600000002000000000000000000000000000000000A1019205184
          C5F0B2DBF2FFB7E9F9FF528ACEFF255AB7FF4D85CBFFA3DDF6FF9FD0EEFF4D7E
          C0F1090F18220000000000000000000000000000000000000000000000011826
          39475488CAF38EBCE6FFB7DFF4FFCAF1FCFFB0DCF4FF87B7E3FF5284C6F31725
          3848000000010000000000000000000000000000000000000000000000000000
          00010B11192035557E974F7FBCE15990D5FF4F7EBBE23556809B0A1119200000
          0001000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000002000000090000
          000E0000000F0000000F000000100000000F0000000A00000002000000000000
          0000000000000000000000000000000000000000000000000008173E72C01C4A
          99FF1C4A98FF1B4997FF1B4897FF1B4896FF15366FC100000009000000000000
          000000000000000000000000000000000000000000000000000B2A66ADFF87CE
          F2FF63BBEDFF63BBEDFF62BBEEFF81CAF2FF2761A9FF0000000D000000090000
          000E00000010000000100000001000000010000000100000001A2C6BB0FF8FD2
          F3FF67BEEEFF67BDEEFF66BDEEFF89CFF2FF2A66ACFF0000000D855F52C1B984
          72FFB98472FFB98371FFB88271FFB88270FFB88270FFD3B8B1FF2E6FB3FFACDF
          F7FF93D4F4FF97D6F5FF92D4F4FFA7DDF7FF2B6AAFFF0000000CBC8978FFFCFA
          F8FFF9F1EDFFF8F0ECFFF8F0EBFFF9F0EBFFF9F0EAFFF4EFEDFF3073B5FFDCF3
          FCFFDCF2FCFFDBF3FCFFDBF2FCFFDAF2FCFF2D6EB2FF0000000AC08E7DFFFCFA
          F9FFC19C8DFFEDDFD9FFC0998BFFEDDFD8FFBF9788FFF0E9E4FF6298C3FF3C8B
          C7FF3C8AC6FF3B89C6FF3B88C5FF3A87C4FF2B6391C300000006C39482FFFCFA
          FAFFEEE2DCFFEEE1DBFFEEE1DBFFEEE0DBFFEEE0DBFFEFE3DEFFF1E8E4FFEFE8
          E6FFEFE8E6FFF4F1EFFFD9C1B8FF000000170000000600000002C79887FFFDFB
          FAFFC5A192FFEEE2DEFFC49F90FFEEE2DCFFC29D8EFFEEE1DBFFC19B8BFFEEE1
          DBFFC09889FFFAF4F1FFC49482FF0000000E0000000000000000C99D8CFFFDFC
          FCFFEFE4DFFFEFE3DFFFEFE3DFFFEEE3DEFFEFE2DEFFEEE2DDFFEEE2DDFFEEE2
          DCFFEEE2DCFFFAF6F3FFC79987FF0000000D0000000000000000CDA190FFFEFC
          FCFFC9A597FFEFE4E0FFC7A495FFEFE4E0FFC6A293FFEFE3DFFFC49F91FFEFE3
          DFFFC39D8FFFFBF7F6FFCA9E8CFF0000000C0000000000000000CFA594FFFEFC
          FCFFFDFAF9FFFDF9F9FFFDFAF8FFFDF9F8FFFDFAF8FFFCF9F7FFFCF9F7FFFCF9
          F7FFFDF8F7FFFCFAF8FFCDA291FF0000000C00000000000000004B53C3FF8D9E
          ECFF687CE3FF6678E2FF6476E1FF6172E0FF5F70DFFF5D6CDEFF5B69DCFF5966
          DBFF5664DAFF6270DDFF3538ABFF0000000B00000000000000004C55C4FF93A4
          EEFF6C80E6FF6A7EE4FF687BE4FF6678E2FF6375E1FF6172E0FF5E6FDEFF5C6C
          DDFF5A69DCFF6775DFFF363AACFF0000000A00000000000000004D56C6FF96A7
          EFFF95A6EFFF93A4EDFF90A2EDFF8F9FEDFF8B9BEBFF8898EAFF8595EAFF8291
          E7FF7F8DE7FF7D89E5FF373BADFF0000000900000000000000003A4093C14D55
          C5FF4B53C3FF4A51C1FF484FBFFF464DBEFF444BBBFF4249B9FF4046B7FF3E44
          B4FF3C41B3FF3A3EB0FF2A2C81C2000000060000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000004205689BC246B
          B8FF2367B6FF2165B4FF2063B3FF17457FBD0000000500000000000000000000
          00000000000000000000000000000000000000000000000000053181C5FF78C6
          F0FF68BBEDFF61B6EBFF63B6EBFF2366B5FF0000000700000000000000000000
          000000000000000000005D443CCF725349FF715248FF6E5046FF378AC9FF8DD5
          F5FF79CAF3FF73C5F1FF79C6F1FF256CB9FF0000000600000000000000000000
          0000000000000000000078594FFF0000000000000000000000033B91CDFFA1E3
          FAFF9CDFF8FF95DBF7FF8ED6F6FF2973BEFF0000000500000000000000000000
          000000000000000000007D5F54FF0000000000000000000000012F709ABE3E95
          CFFF3D93CEFF3C91CDFF3B90CCFF2A6997BF0000000200000000000000000000
          0000000000000000000083655AFF000000000000000000000001000000060000
          00090000000B0000000C0000000B000000070000000200000000000000000000
          00000000000000000000886C5FFF000000000000000000000004205689BC246B
          B8FF2367B6FF2165B4FF2063B3FF17457FBD0000000500000000000000000000
          000000000000000000008E7166FF0000000000000000000000053181C5FF78C6
          F0FF68BBEDFF61B6EBFF63B6EBFF2366B5FF0000000700000000000000000000
          0000000000000000000094786BFF927669FF917568FF8E7165FF378AC9FF8DD5
          F5FF79CAF3FF73C5F1FF79C6F1FF256CB9FF0000000600000000000000000000
          00000000000000000000997D70FF0000000000000000000000033B91CDFFA1E3
          FAFF9CDFF8FF95DBF7FF8ED6F6FF2973BEFF0000000500000000000000000000
          00010000000500000008987D71FF0000000A00000009000000072E709ABF3E95
          CFFF3D93CEFF3C91CDFF3B90CCFF2A6997BF0000000200000000000000000000
          0004205689BC246BB8FF2367B6FF2165B4FF2063B3FF17457FBD000000060000
          0001000000020000000200000002000000010000000000000000000000000000
          00053181C5FF78C6F0FF68BBEDFF61B6EBFF63B6EBFF2366B5FF000000070000
          0000000000000000000000000000000000000000000000000000000000000000
          0004378AC9FF8DD5F5FF79CAF3FF73C5F1FF79C6F1FF256CB9FF000000060000
          0000000000000000000000000000000000000000000000000000000000000000
          00033B91CDFFA1E3FAFF9CDFF8FF95DBF7FF8ED6F6FF2973BEFF000000050000
          0000000000000000000000000000000000000000000000000000000000000000
          00012F709ABE3E95CFFF3D93CEFF3C91CDFF3B90CCFF2A6997BF000000020000
          0000000000000000000000000000000000000000000000000000}
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
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 352
    Top = 256
  end
end
