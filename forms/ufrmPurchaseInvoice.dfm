inherited frmPurchaseInvoice: TfrmPurchaseInvoice
  Caption = 'Faktur Pembelian Barang'
  ClientHeight = 587
  ClientWidth = 978
  KeyPreview = True
  OnKeyDown = FormKeyDown
  ExplicitWidth = 994
  ExplicitHeight = 626
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 552
    TabOrder = 2
    ExplicitTop = 552
    ExplicitWidth = 978
    Width = 978
    inherited btnCancel: TcxButton
      Left = 893
      ExplicitLeft = 893
    end
    inherited btnPrint: TcxButton
      Left = 807
      OnClick = btnPrintClick
      ExplicitLeft = 807
    end
    inherited btnSave: TcxButton
      Left = 721
      OnClick = btnSaveClick
      ExplicitLeft = 721
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
  object cxGroupBox1: TcxGroupBox [1]
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Invoice [F1] '
    TabOrder = 0
    DesignSize = (
      978
      121)
    Height = 121
    Width = 978
    object cxLabel1: TcxLabel
      Left = 13
      Top = 28
      Caption = 'No. Invoice'
    end
    object edNoInv: TcxTextEdit
      Left = 73
      Top = 28
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      Width = 131
    end
    object cxLabel4: TcxLabel
      Left = 30
      Top = 69
      Caption = 'Supplier'
    end
    object cxLabel6: TcxLabel
      Left = 388
      Top = 69
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 431
      Top = 68
      TabOrder = 9
      OnKeyDown = edNotesKeyDown
      Height = 40
      Width = 250
    end
    object dtInvoice: TcxDateEdit
      Left = 257
      Top = 28
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 85
    end
    object cxLabel8: TcxLabel
      Left = 215
      Top = 29
      Caption = 'Tanggal'
    end
    object dtJtTempo: TcxDateEdit
      Left = 257
      Top = 89
      TabStop = False
      Properties.ImmediatePost = True
      Properties.ReadOnly = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 6
      Width = 85
    end
    object cxLabel9: TcxLabel
      Left = 205
      Top = 90
      Caption = 'Jt. Tempo'
    end
    object edSupplier: TcxButtonEdit
      Left = 73
      Top = 68
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edSupplierPropertiesButtonClick
      TabOrder = 3
      OnKeyDown = edSupplierKeyDown
      Width = 269
    end
    object crSubTotal: TcxCurrencyEdit
      Left = 782
      Top = 22
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
      TabOrder = 10
      Width = 185
    end
    object cxLabel2: TcxLabel
      Left = 714
      Top = 23
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
      Left = 750
      Top = 49
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
      Left = 782
      Top = 48
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
      TabOrder = 11
      Width = 185
    end
    object cxLabel5: TcxLabel
      Left = 727
      Top = 77
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
      Left = 782
      Top = 74
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
      TabOrder = 12
      Width = 185
    end
    object cxLabel7: TcxLabel
      Left = 354
      Top = 29
      Caption = 'Gudang Tujuan'
    end
    object cxLookupGudang: TcxExtLookupComboBox
      Left = 431
      Top = 28
      TabOrder = 7
      Width = 250
    end
    object cbBayar: TcxComboBox
      Left = 73
      Top = 89
      Properties.CharCase = ecUpperCase
      Properties.Items.Strings = (
        'CASH'
        'TEMPO')
      Properties.OnEditValueChanged = cbBayarPropertiesEditValueChanged
      TabOrder = 4
      Text = 'CASH'
      Width = 89
    end
    object cxLabel10: TcxLabel
      Left = 14
      Top = 90
      Caption = 'Cara Bayar'
    end
    object cxLabel13: TcxLabel
      Left = 382
      Top = 49
      Caption = 'Rekening'
    end
    object cxLookupRekening: TcxExtLookupComboBox
      Left = 431
      Top = 48
      TabOrder = 8
      Width = 250
    end
    object spTempo: TcxSpinEdit
      Left = 162
      Top = 89
      Properties.ImmediatePost = True
      Properties.OnEditValueChanged = spTempoPropertiesEditValueChanged
      TabOrder = 5
      Width = 42
    end
    object cxLabel11: TcxLabel
      Left = 13
      Top = 49
      Caption = '* Referensi'
    end
    object edReferensi: TcxTextEdit
      Left = 73
      Top = 48
      Properties.CharCase = ecUpperCase
      TabOrder = 2
      Width = 131
    end
    object cxLabel12: TcxLabel
      Left = 204
      Top = 53
      Caption = '* Faktur Supplier / Surat Jalan'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -9
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsItalic]
      Style.IsFontAssigned = True
    end
  end
  object cxGrid1: TcxGrid [2]
    Left = 0
    Top = 121
    Width = 978
    Height = 410
    Align = alClient
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpTop
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnEditKeyDown = cxGrdMainEditKeyDown
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
      OptionsCustomize.ColumnSorting = False
      OptionsData.Appending = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      Styles.ContentOdd = styleOdd
      object cxGrdMainColumn1: TcxGridDBColumn
        Caption = 'No.'
        OnGetDisplayText = cxGrdMainColumn1GetDisplayText
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 41
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
      object colHrgBeli: TcxGridDBColumn
        Caption = 'Harga Beli'
        DataBinding.FieldName = 'Harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 90
      end
      object colDisc: TcxGridDBColumn
        DataBinding.FieldName = 'Discount'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.ReadOnly = True
        Properties.OnEditValueChanged = colDiscPropertiesEditValueChanged
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
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Detail Transaksi [F2]'
      GridView = cxGrdMain
    end
  end
  inherited Panel2: TPanel
    Top = 531
    Width = 978
    TabOrder = 3
    ExplicitTop = 531
    ExplicitWidth = 978
    inherited lbEscape: TLabel
      Left = 898
      Height = 17
      ExplicitLeft = 898
    end
    inherited lgndSave: TLabel
      Left = 733
      Height = 17
      ExplicitLeft = 733
    end
    inherited lgndPrint: TLabel
      Left = 820
      Height = 17
      ExplicitLeft = 820
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 194
      Top = 1
      Width = 84
      Height = 17
      Margins.Top = 1
      Margins.Right = 13
      Margins.Bottom = 1
      Align = alLeft
      Caption = 'Esc [Cancel Edit]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 175
      Height = 17
      Margins.Top = 1
      Margins.Right = 13
      Margins.Bottom = 1
      Align = alLeft
      Caption = 'F5 [Lookup Data Barang / Supplier]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 584
    Top = 272
    PixelsPerInch = 96
  end
end
