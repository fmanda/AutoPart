inherited frmSalesInvoice: TfrmSalesInvoice
  Caption = 'Transaksi Penjualan'
  ClientHeight = 661
  ClientWidth = 984
  KeyPreview = True
  OnKeyDown = FormKeyDown
  ExplicitWidth = 1000
  ExplicitHeight = 700
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 626
    TabOrder = 3
    ExplicitTop = 626
    ExplicitWidth = 984
    Width = 984
    inherited btnCancel: TcxButton
      Left = 899
      ExplicitLeft = 899
    end
    inherited btnPrint: TcxButton
      Left = 813
      Visible = True
      OnClick = btnPrintClick
      ExplicitLeft = 813
    end
    inherited btnSave: TcxButton
      Left = 707
      Width = 100
      OnClick = btnSaveClick
      ExplicitLeft = 707
      ExplicitWidth = 100
    end
    object btnGenerate: TcxButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 124
      Height = 25
      Align = alLeft
      Caption = 'Generate Dummy '
      TabOrder = 3
      OnClick = btnGenerateClick
    end
  end
  inherited Panel2: TPanel
    Top = 605
    Width = 984
    TabOrder = 4
    ExplicitTop = 605
    ExplicitWidth = 984
    inherited lbEscape: TLabel
      Left = 904
      Height = 17
      ExplicitLeft = 904
    end
    inherited lgndSave: TLabel
      Left = 729
      Height = 17
      Margins.Right = 25
      ExplicitLeft = 729
    end
    inherited lgndPrint: TLabel
      Left = 826
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
      ExplicitTop = 2
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
      Transparent = False
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
      Transparent = False
      ExplicitLeft = 369
      ExplicitTop = 2
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
      Transparent = False
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
      Transparent = False
      ExplicitTop = 2
    end
  end
  object cxGroupBox1: TcxGroupBox [2]
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Invoice [F1] '
    TabOrder = 0
    DesignSize = (
      984
      151)
    Height = 151
    Width = 984
    object cxLabel1: TcxLabel
      Left = 109
      Top = 21
      Caption = 'No Invoice'
    end
    object edNoInv: TcxTextEdit
      Left = 165
      Top = 20
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Text = '01.FPK.1906.0001'
      Width = 109
    end
    object cxLabel4: TcxLabel
      Left = 114
      Top = 42
      Caption = 'Customer'
    end
    object cxLabel6: TcxLabel
      Left = 419
      Top = 84
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 462
      Top = 83
      TabOrder = 14
      OnKeyDown = edNotesKeyDown
      Height = 41
      Width = 221
    end
    object dtInvoice: TcxDateEdit
      Left = 323
      Top = 20
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnEditValueChanged = dtInvoicePropertiesEditValueChanged
      TabOrder = 2
      Width = 85
    end
    object cxLabel8: TcxLabel
      Left = 281
      Top = 21
      Caption = 'Tanggal'
    end
    object dtJtTempo: TcxDateEdit
      Left = 323
      Top = 83
      TabStop = False
      Properties.ImmediatePost = True
      Properties.ReadOnly = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 8
      Width = 85
    end
    object cxLabel9: TcxLabel
      Left = 275
      Top = 83
      Caption = 'Jt Tempo'
    end
    object edCustomer: TcxButtonEdit
      Left = 165
      Top = 41
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
    object crSubTotal: TcxCurrencyEdit
      Left = 835
      Top = 16
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
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 16
      Width = 140
    end
    object cxLabel2: TcxLabel
      Left = 768
      Top = 17
      Anchors = [akTop, akRight]
      Caption = 'Sub Total'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cxLabel3: TcxLabel
      Left = 804
      Top = 44
      Anchors = [akTop, akRight]
      Caption = 'PPN'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object crPPN: TcxCurrencyEdit
      Left = 835
      Top = 43
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
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 17
      Width = 140
    end
    object cxLabel5: TcxLabel
      Left = 781
      Top = 72
      Anchors = [akTop, akRight]
      Caption = 'TOTAL'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object crTotal: TcxCurrencyEdit
      Left = 835
      Top = 69
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
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 18
      Width = 140
    end
    object cxLabel7: TcxLabel
      Left = 123
      Top = 124
      Caption = 'Gudang'
    end
    object cxLookupSalesman: TcxExtLookupComboBox
      Left = 462
      Top = 20
      TabOrder = 11
      Width = 221
    end
    object cxLookupGudang: TcxExtLookupComboBox
      Left = 165
      Top = 123
      TabOrder = 10
      Width = 243
    end
    object cxLabel11: TcxLabel
      Left = 413
      Top = 21
      Caption = 'Salesman'
    end
    object cxLabel12: TcxLabel
      Left = 420
      Top = 63
      Caption = 'Mekanik'
    end
    object cxLookupMekanik: TcxExtLookupComboBox
      Left = 462
      Top = 62
      TabOrder = 13
      Width = 221
    end
    object cbBayar: TcxComboBox
      Left = 165
      Top = 83
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
      Left = 106
      Top = 84
      Caption = 'Cara Bayar'
    end
    object cxLabel13: TcxLabel
      Left = 116
      Top = 104
      Caption = 'Rekening'
    end
    object cxLookupRekening: TcxExtLookupComboBox
      Left = 165
      Top = 103
      TabStop = False
      TabOrder = 9
      Width = 243
    end
    object cxLookupFee: TcxExtLookupComboBox
      Left = 462
      Top = 41
      TabOrder = 12
      Width = 221
    end
    object cxLabel14: TcxLabel
      Left = 413
      Top = 42
      Caption = 'Jenis Fee'
    end
    object spTempo: TcxSpinEdit
      Left = 232
      Top = 83
      Properties.ImmediatePost = True
      Properties.OnEditValueChanged = spTempoPropertiesEditValueChanged
      TabOrder = 7
      Width = 42
    end
    object cxLabel15: TcxLabel
      Left = 107
      Top = 63
      Caption = 'Credit Limit'
    end
    object crCreditLimit: TcxCurrencyEdit
      Left = 165
      Top = 62
      TabStop = False
      Enabled = False
      Properties.DisplayFormat = ',0.##;(,0.##)'
      StyleDisabled.Color = clInfoBk
      TabOrder = 4
      Width = 108
    end
    object crCreditUsed: TcxCurrencyEdit
      Left = 323
      Top = 62
      TabStop = False
      Enabled = False
      Properties.DisplayFormat = ',0.##;(,0.##)'
      StyleDisabled.Color = clInfoBk
      TabOrder = 5
      Width = 85
    end
    object cxLabel16: TcxLabel
      Left = 278
      Top = 63
      Caption = 'Terpakai'
    end
    object rbHarga: TcxRadioGroup
      AlignWithMargins = True
      Left = 685
      Top = 17
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
      TabOrder = 15
      Height = 107
      Width = 77
    end
    object rbJenis: TcxRadioGroup
      AlignWithMargins = True
      Left = 8
      Top = 19
      Margins.Left = 10
      Margins.Top = 0
      Margins.Bottom = 4
      TabStop = False
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
      Height = 83
      Width = 92
    end
  end
  object cxGridItem: TcxGrid [3]
    Left = 0
    Top = 151
    Width = 984
    Height = 246
    Align = alClient
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitTop = 150
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
        Width = 137
      end
      object colNama: TcxGridDBColumn
        Caption = 'Nama Barang'
        DataBinding.FieldName = 'Nama'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 290
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
        Width = 49
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
        Caption = 'Harga Jual'
        DataBinding.FieldName = 'Harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Styles.OnGetContentStyle = colHargaStylesGetContentStyle
        Width = 90
      end
      object colDisc: TcxGridDBColumn
        DataBinding.FieldName = 'Discount'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.ReadOnly = False
        Properties.OnEditValueChanged = colDiscPropertiesEditValueChanged
        Properties.OnValidate = colDiscPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object colSubTotal: TcxGridDBColumn
        Caption = 'Sub Total'
        DataBinding.FieldName = 'SubTotal'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 100
      end
      object colWarehouse: TcxGridDBColumn
        Caption = 'Gudang'
        DataBinding.FieldName = 'Warehouse'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
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
      object colPPN: TcxGridDBColumn
        DataBinding.FieldName = 'PPN'
        Visible = False
      end
      object colPriceType: TcxGridDBColumn
        DataBinding.FieldName = 'PriceType'
        Visible = False
      end
    end
    object cxGridItemLevel1: TcxGridLevel
      Caption = 'Detail Barang [F2]'
      GridView = cxGrdItem
    end
  end
  object cxSplitter: TcxSplitter [4]
    Left = 0
    Top = 397
    Width = 984
    Height = 8
    HotZoneClassName = 'TcxXPTaskBarStyle'
    AlignSplitter = salBottom
  end
  object cxGridService: TcxGrid [5]
    Left = 0
    Top = 405
    Width = 984
    Height = 200
    Align = alBottom
    TabOrder = 2
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitTop = 404
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
        Width = 357
      end
      object colSrvQty: TcxGridDBColumn
        DataBinding.FieldName = 'Qty'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.OnEditValueChanged = colSrvQtyPropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Width = 67
      end
      object colSrvHarga: TcxGridDBColumn
        Caption = 'Harga Jasa'
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
        DataBinding.FieldName = 'Discount'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.ReadOnly = True
        Properties.OnValidate = colSrvDiscPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 79
      end
      object colSrvSubTotal: TcxGridDBColumn
        Caption = 'Sub Total'
        DataBinding.FieldName = 'SubTotal'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 116
      end
      object colSrvID: TcxGridDBColumn
        DataBinding.FieldName = 'Service'
        Visible = False
        Options.Editing = False
      end
      object colSrvPPN: TcxGridDBColumn
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Visible = False
      end
    end
    object cxGridLevel1: TcxGridLevel
      Caption = 'Detail Jasa / Service [F3]'
      GridView = cxGrdService
    end
  end
  inherited styleRepo: TcxStyleRepository
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
  end
  object pmMain: TPopupMenu
    Left = 256
    Top = 328
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
