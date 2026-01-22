inherited frmSalesInvoice: TfrmSalesInvoice
  Caption = 'Transaksi Penjualan'
  ClientHeight = 644
  ClientWidth = 1077
  KeyPreview = True
  OnKeyDown = FormKeyDown
  ExplicitWidth = 1093
  ExplicitHeight = 683
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 609
    TabOrder = 3
    ExplicitTop = 606
    ExplicitWidth = 984
    Width = 1077
    object Label7: TLabel [0]
      AlignWithMargins = True
      Left = 4
      Top = 8
      Width = 440
      Height = 16
      Margins.Top = 1
      Margins.Bottom = 1
      Caption = 
        '** Untuk pembayaran gabungan Tunai dan Debit/Credit Card, gunaka' +
        'n :  [F9] Opsi Bayar'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    inherited btnCancel: TcxButton
      Left = 992
      OptionsImage.Images = frmMain.ImageList
      ExplicitLeft = 899
    end
    inherited btnPrint: TcxButton
      Left = 906
      OptionsImage.Images = frmMain.ImageList
      Visible = True
      OnClick = btnPrintClick
      ExplicitLeft = 813
    end
    inherited btnSave: TcxButton
      Left = 694
      Width = 100
      OptionsImage.Images = frmMain.ImageList
      OnClick = btnSaveClick
      ExplicitLeft = 601
      ExplicitWidth = 100
    end
    object btnPayment: TcxButton
      AlignWithMargins = True
      Left = 800
      Top = 5
      Width = 100
      Height = 25
      Align = alRight
      Caption = 'Opsi Bayar'
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 3
      OnClick = btnPaymentClick
      ExplicitLeft = 707
    end
  end
  inherited Panel2: TPanel
    Top = 588
    Width = 1077
    TabOrder = 4
    ExplicitTop = 585
    ExplicitWidth = 984
    inherited lbEscape: TLabel
      Left = 997
      Height = 17
      ExplicitLeft = 904
    end
    inherited lgndSave: TLabel
      Left = 814
      Width = 77
      Height = 17
      Margins.Right = 25
      Caption = '[F9] Opsi Bayar'
      ExplicitLeft = 721
      ExplicitWidth = 77
    end
    inherited lgndPrint: TLabel
      Left = 919
      Height = 17
      Visible = True
      ExplicitLeft = 826
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 99
      Top = 1
      Width = 152
      Height = 17
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alLeft
      Caption = '[F12 : Show / Hide Detail Jasa]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 90
      Height = 17
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alLeft
      Caption = '[F5: Lookup Data]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
    object Label3: TLabel
      AlignWithMargins = True
      Left = 257
      Top = 1
      Width = 62
      Height = 17
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alLeft
      Caption = 'Harga Umum'
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
      ExplicitHeight = 16
    end
    object Label4: TLabel
      AlignWithMargins = True
      Left = 325
      Top = 1
      Width = 71
      Height = 17
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alLeft
      Caption = 'Harga Bengkel'
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
      ExplicitHeight = 16
    end
    object Label5: TLabel
      AlignWithMargins = True
      Left = 402
      Top = 1
      Width = 64
      Height = 17
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alLeft
      Caption = 'Harga Grosir'
      Color = 9877758
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
      ExplicitHeight = 16
    end
    object Label6: TLabel
      AlignWithMargins = True
      Left = 472
      Top = 1
      Width = 67
      Height = 17
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alLeft
      Caption = 'Harga Keliling'
      Color = 6612733
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
      ExplicitHeight = 16
    end
    object Label8: TLabel
      AlignWithMargins = True
      Left = 717
      Top = 1
      Width = 69
      Height = 17
      Margins.Top = 1
      Margins.Right = 25
      Margins.Bottom = 1
      Align = alRight
      Caption = 'Alt+S [Simpan]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 624
      ExplicitHeight = 16
    end
  end
  object cxGroupBox1: TcxGroupBox [2]
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Invoice [F1] '
    TabOrder = 0
    ExplicitLeft = -8
    ExplicitTop = -6
    ExplicitWidth = 1084
    DesignSize = (
      1077
      161)
    Height = 161
    Width = 1077
    object cxLabel1: TcxLabel
      Left = 104
      Top = 17
      Caption = 'No Invoice'
    end
    object edNoInv: TcxTextEdit
      Left = 160
      Top = 17
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Text = '01.FPK.1906.0001'
      Width = 109
    end
    object cxLabel4: TcxLabel
      Left = 109
      Top = 37
      Caption = 'Customer'
    end
    object cxLabel6: TcxLabel
      Left = 418
      Top = 79
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 461
      Top = 78
      TabStop = False
      TabOrder = 14
      OnKeyDown = edNotesKeyDown
      Height = 41
      Width = 214
    end
    object dtInvoice: TcxDateEdit
      Left = 318
      Top = 16
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnEditValueChanged = dtInvoicePropertiesEditValueChanged
      TabOrder = 2
      Width = 85
    end
    object cxLabel8: TcxLabel
      Left = 276
      Top = 17
      Caption = 'Tanggal'
    end
    object dtJtTempo: TcxDateEdit
      Left = 318
      Top = 78
      TabStop = False
      Properties.ImmediatePost = True
      Properties.ReadOnly = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 8
      Width = 85
    end
    object cxLabel9: TcxLabel
      Left = 270
      Top = 78
      Caption = 'Jt Tempo'
    end
    object edCustomer: TcxButtonEdit
      Left = 160
      Top = 37
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edCustomerPropertiesButtonClick
      Properties.OnValidate = edCustomerPropertiesValidate
      TabOrder = 3
      OnKeyDown = edCustomerKeyDown
      Width = 243
    end
    object crAmount: TcxCurrencyEdit
      Left = 905
      Top = 64
      TabStop = False
      Anchors = [akTop, akRight]
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.##;(,0.##)'
      Properties.ReadOnly = True
      Style.Color = clCream
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Consolas'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 17
      ExplicitLeft = 912
      Width = 161
    end
    object cxLabel2: TcxLabel
      Left = 871
      Top = 13
      Anchors = [akTop, akRight]
      Caption = 'DPP'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      ExplicitLeft = 878
      AnchorX = 901
    end
    object cxLabel3: TcxLabel
      Left = 828
      Top = 92
      Anchors = [akTop, akRight]
      Caption = 'Pot Retur'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      ExplicitLeft = 795
      AnchorX = 903
    end
    object crRetur: TcxCurrencyEdit
      Left = 905
      Top = 90
      TabStop = False
      Anchors = [akTop, akRight]
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.##;(,0.##)'
      Properties.ReadOnly = True
      Style.Color = 13031929
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Consolas'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 18
      ExplicitLeft = 912
      Width = 161
    end
    object cxLabel5: TcxLabel
      Left = 850
      Top = 120
      Anchors = [akTop, akRight]
      Caption = 'Bayar'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      ExplicitLeft = 817
      AnchorX = 903
    end
    object crTotal: TcxCurrencyEdit
      Left = 905
      Top = 116
      TabStop = False
      Anchors = [akTop, akRight]
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.##;(,0.##)'
      Properties.ReadOnly = True
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -24
      Style.Font.Name = 'Consolas'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 19
      ExplicitLeft = 912
      Width = 161
    end
    object cxLabel7: TcxLabel
      Left = 118
      Top = 119
      Caption = 'Gudang'
    end
    object cxLookupSalesman: TcxExtLookupComboBox
      Left = 461
      Top = 15
      TabOrder = 11
      Width = 214
    end
    object cxLookupGudang: TcxExtLookupComboBox
      Left = 160
      Top = 118
      TabOrder = 10
      Width = 243
    end
    object cxLabel11: TcxLabel
      Left = 412
      Top = 16
      Caption = 'Salesman'
    end
    object cxLabel12: TcxLabel
      Left = 419
      Top = 58
      Caption = 'Mekanik'
    end
    object cxLookupMekanik: TcxExtLookupComboBox
      Left = 461
      Top = 57
      TabOrder = 13
      Width = 214
    end
    object cbBayar: TcxComboBox
      Left = 160
      Top = 78
      Properties.CharCase = ecUpperCase
      Properties.DropDownListStyle = lsFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'CASH'
        'TEMPO')
      Properties.OnEditValueChanged = cbBayarPropertiesEditValueChanged
      Style.ButtonStyle = btsUltraFlat
      Style.ButtonTransparency = ebtNone
      TabOrder = 6
      Text = 'CASH'
      Width = 70
    end
    object cxLabel10: TcxLabel
      Left = 101
      Top = 79
      Caption = 'Cara Bayar'
    end
    object cxLabel13: TcxLabel
      Left = 111
      Top = 99
      Caption = 'Rekening'
    end
    object cxLookupRekening: TcxExtLookupComboBox
      Left = 160
      Top = 98
      TabStop = False
      TabOrder = 9
      Width = 243
    end
    object cxLookupFee: TcxExtLookupComboBox
      Left = 461
      Top = 36
      TabOrder = 12
      Width = 214
    end
    object cxLabel14: TcxLabel
      Left = 412
      Top = 37
      Caption = 'Jenis Fee'
    end
    object spTempo: TcxSpinEdit
      Left = 227
      Top = 78
      Properties.ImmediatePost = True
      Properties.OnEditValueChanged = spTempoPropertiesEditValueChanged
      TabOrder = 7
      Width = 42
    end
    object cxLabel15: TcxLabel
      Left = 102
      Top = 58
      Caption = 'Credit Limit'
    end
    object crCreditLimit: TcxCurrencyEdit
      Left = 160
      Top = 57
      TabStop = False
      Enabled = False
      Properties.DisplayFormat = ',0.##;(,0.##)'
      StyleDisabled.Color = clInfoBk
      TabOrder = 4
      Width = 108
    end
    object crCreditUsed: TcxCurrencyEdit
      Left = 318
      Top = 57
      TabStop = False
      Enabled = False
      Properties.DisplayFormat = ',0.##;(,0.##)'
      StyleDisabled.Color = clInfoBk
      TabOrder = 5
      Width = 85
    end
    object cxLabel16: TcxLabel
      Left = 273
      Top = 58
      Caption = 'Terpakai'
    end
    object rbHarga: TcxRadioGroup
      AlignWithMargins = True
      Left = 680
      Top = 12
      Margins.Left = 10
      Margins.Top = 0
      Margins.Bottom = 4
      Caption = ' Harga Aktif '
      Properties.ImmediatePost = True
      Properties.Items = <
        item
          Caption = 'Umum'
        end
        item
          Caption = 'Bengkel'
        end
        item
          Caption = 'Grosir'
        end
        item
          Caption = 'Keliling'
        end>
      Properties.OnEditValueChanged = rbHargaPropertiesEditValueChanged
      ItemIndex = 0
      TabOrder = 16
      Height = 124
      Width = 105
    end
    object rbJenis: TcxRadioGroup
      AlignWithMargins = True
      Left = 7
      Top = 19
      Margins.Left = 10
      Margins.Top = 0
      Margins.Bottom = 4
      Caption = 'Jenis Penjualan'
      Properties.ImmediatePost = True
      Properties.Items = <
        item
          Caption = 'Front End'
        end
        item
          Caption = 'Salesman'
        end>
      Properties.OnEditValueChanged = rbJenisPropertiesEditValueChanged
      ItemIndex = 0
      TabOrder = 0
      Height = 81
      Width = 90
    end
    object cxLabel17: TcxLabel
      Left = 414
      Top = 119
      Caption = 'No Retur'
    end
    object edRetur: TcxButtonEdit
      Left = 461
      Top = 118
      TabStop = False
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = False
      Properties.OnButtonClick = edReturPropertiesButtonClick
      Properties.OnValidate = edReturPropertiesValidate
      TabOrder = 15
      OnKeyDown = edReturKeyDown
      Width = 214
    end
    object crPPN: TcxCurrencyEdit
      Left = 905
      Top = 38
      TabStop = False
      Anchors = [akTop, akRight]
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.##;(,0.##)'
      Properties.ReadOnly = True
      Style.Color = clWhite
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Consolas'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 37
      ExplicitLeft = 872
      Width = 161
    end
    object lbPPN: TcxLabel
      Left = 871
      Top = 39
      Anchors = [akTop, akRight]
      Caption = 'PPN'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      ExplicitLeft = 878
      AnchorX = 901
    end
    object crDPP: TcxCurrencyEdit
      Left = 905
      Top = 12
      TabStop = False
      Anchors = [akTop, akRight]
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.##;(,0.##)'
      Properties.ReadOnly = True
      Style.Color = clWhite
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Consolas'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 39
      ExplicitLeft = 872
      Width = 161
    end
    object cxLabel18: TcxLabel
      Left = 859
      Top = 65
      Anchors = [akTop, akRight]
      Caption = 'Total'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      ExplicitLeft = 826
      AnchorX = 901
    end
  end
  object cxGridItem: TcxGrid [3]
    Left = 0
    Top = 161
    Width = 1077
    Height = 269
    Align = alClient
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitTop = 158
    ExplicitWidth = 1184
    object cxGrdItem: TcxGridDBTableView
      PopupMenu = pmMain
      Navigator.Buttons.CustomButtons = <>
      OnEditKeyDown = cxGrdItemEditKeyDown
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          Column = colQty
        end
        item
          Kind = skSum
          Column = colSubTotal
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Appending = True
      OptionsSelection.HideSelection = True
      OptionsSelection.InvertSelect = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      Styles.ContentOdd = styleOdd
      object colNo: TcxGridDBColumn
        Caption = 'No.'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        OnGetDisplayText = colNoGetDisplayText
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Width = 39
      end
      object colKode: TcxGridDBColumn
        Caption = 'Kode Barang'
        DataBinding.FieldName = 'Kode'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = colKodePropertiesButtonClick
        Properties.OnValidate = colKodePropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 131
      end
      object colNama: TcxGridDBColumn
        Caption = 'Nama Barang'
        DataBinding.FieldName = 'Nama'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 392
      end
      object colUOM: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'UOM'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.OnCloseUp = colUOMPropertiesCloseUp
        Properties.OnEditValueChanged = colUOMPropertiesEditValueChanged
        Properties.OnInitPopup = colUOMPropertiesInitPopup
        HeaderAlignmentHorz = taCenter
        Width = 51
      end
      object colQty: TcxGridDBColumn
        DataBinding.FieldName = 'Qty'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.OnEditValueChanged = colQtyPropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Width = 53
      end
      object colHarga: TcxGridDBColumn
        Caption = 'Harga Excl.'
        DataBinding.FieldName = 'Harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 90
      end
      object colPPN: TcxGridDBColumn
        Caption = 'PPN%'
        DataBinding.FieldName = 'PPN'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 41
      end
      object colDiscP: TcxGridDBColumn
        Caption = 'Disc %'
        DataBinding.FieldName = 'DiscP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##%;(,0.##%)'
        Properties.OnEditValueChanged = colDiscPPropertiesEditValueChanged
        Properties.OnValidate = colDiscPPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 47
      end
      object colDisc: TcxGridDBColumn
        Caption = 'Disc Rp'
        DataBinding.FieldName = 'Discount'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.ReadOnly = False
        Properties.OnEditValueChanged = colDiscPropertiesEditValueChanged
        Properties.OnValidate = colDiscPropertiesValidate
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object colSubTotal: TcxGridDBColumn
        Caption = 'Sub Total'
        DataBinding.FieldName = 'SubTotal'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 123
      end
      object colWarehouse: TcxGridDBColumn
        Caption = 'Gudang'
        DataBinding.FieldName = 'Warehouse'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 153
      end
      object colItemID: TcxGridDBColumn
        DataBinding.FieldName = 'Item'
        Visible = False
        Options.Editing = False
      end
      object colKonversi: TcxGridDBColumn
        DataBinding.FieldName = 'Konversi'
        Visible = False
        Options.Editing = False
      end
      object colPriceType: TcxGridDBColumn
        DataBinding.FieldName = 'PriceType'
        Visible = False
      end
      object colNetPrice: TcxGridDBColumn
        Caption = 'Harga Bersih'
        DataBinding.FieldName = 'NetPrice'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Styles.OnGetContentStyle = colNetPriceStylesGetContentStyle
        Styles.Header = styleHeader
        Width = 105
      end
      object colNetAmt: TcxGridDBColumn
        Caption = 'Sub Total'
        DataBinding.FieldName = 'NetAmt'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Styles.Header = styleHeader
        Width = 104
      end
    end
    object cxGridItemLevel1: TcxGridLevel
      Caption = 'Detail Barang [F2]'
      GridView = cxGrdItem
    end
  end
  object cxSplitter: TcxSplitter [4]
    Left = 0
    Top = 430
    Width = 1077
    Height = 8
    HotZoneClassName = 'TcxXPTaskBarStyle'
    AlignSplitter = salBottom
    ExplicitTop = 427
    ExplicitWidth = 984
  end
  object cxGridService: TcxGrid [5]
    Left = 0
    Top = 438
    Width = 1077
    Height = 150
    Align = alBottom
    TabOrder = 2
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitTop = 435
    ExplicitWidth = 984
    object cxGrdService: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          Column = colSrvQty
        end
        item
          Kind = skSum
          Column = colSrvSubTotal
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsData.Appending = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      object colSrvKode: TcxGridDBColumn
        Caption = 'Kode Jasa'
        DataBinding.FieldName = 'Service'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.OnEditValueChanged = colSrvKodePropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Width = 137
      end
      object colSrvName: TcxGridDBColumn
        Caption = 'Nama Jasa'
        DataBinding.FieldName = 'Service'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.OnEditValueChanged = colSrvNamePropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Width = 349
      end
      object colSrvQty: TcxGridDBColumn
        DataBinding.FieldName = 'Qty'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.OnEditValueChanged = colSrvQtyPropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Width = 60
      end
      object colSrvHarga: TcxGridDBColumn
        DataBinding.FieldName = 'Harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 99
      end
      object colSrvDisc: TcxGridDBColumn
        DataBinding.FieldName = 'Discount Rp'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.ReadOnly = True
        Properties.OnValidate = colSrvDiscPropertiesValidate
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 79
      end
      object colSrvSubTotal: TcxGridDBColumn
        Caption = 'Sub Total'
        DataBinding.FieldName = 'SubTotal'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 149
      end
      object colSrvID: TcxGridDBColumn
        DataBinding.FieldName = 'Service'
        Visible = False
        Options.Editing = False
      end
      object colSrvPPN: TcxGridDBColumn
        Caption = 'PPN%'
        DataBinding.FieldName = 'PPN'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 60
      end
      object colSrvNetPrice: TcxGridDBColumn
        Caption = 'Harga Bersih'
        DataBinding.FieldName = 'NetPrice'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Styles.Header = styleHeader
        Width = 110
      end
      object colSrvNetAmt: TcxGridDBColumn
        Caption = 'Sub Total'
        DataBinding.FieldName = 'NetAmt'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 107
      end
    end
    object cxGridLevel1: TcxGridLevel
      Caption = 'Detail Jasa / Service [F3]'
      GridView = cxGrdService
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 112
    Top = 360
    PixelsPerInch = 96
    object styleUmum: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object styleBengkel: TcxStyle
      AssignedValues = [svColor]
      Color = clSkyBlue
    end
    object styleGrosir: TcxStyle
      AssignedValues = [svColor]
      Color = 9877758
    end
    object styleKeliling: TcxStyle
      AssignedValues = [svColor]
      Color = 6612733
    end
    object styleHeader: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object pmMain: TPopupMenu
    Left = 48
    Top = 360
    object UpdateKeHargaUmum1: TMenuItem
      Caption = 'Update ke Harga Umum'
      OnClick = UpdateKeHargaUmum1Click
    end
    object UpdatekeHargaGrosir1: TMenuItem
      Caption = 'Update ke Harga Bengkel'
      OnClick = UpdatekeHargaGrosir1Click
    end
    object UpdatekeHargaGrosir2: TMenuItem
      Caption = 'Update ke Harga Grosir'
      OnClick = UpdatekeHargaGrosir2Click
    end
    object UpdatekeHargaKeliling1: TMenuItem
      Caption = 'Update ke Harga Keliling'
      OnClick = UpdatekeHargaKeliling1Click
    end
  end
end
