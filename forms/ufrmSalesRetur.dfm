inherited frmSalesRetur: TfrmSalesRetur
  Caption = 'Retur Penjualan'
  ClientHeight = 561
  ClientWidth = 934
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  ExplicitTop = -161
  ExplicitWidth = 950
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 526
    ExplicitTop = 526
    ExplicitWidth = 934
    Width = 934
    inherited btnCancel: TcxButton
      Left = 849
      ExplicitLeft = 849
    end
    inherited btnPrint: TcxButton
      Left = 763
      ExplicitLeft = 763
    end
    inherited btnSave: TcxButton
      Left = 677
      OnClick = btnSaveClick
      ExplicitLeft = 677
    end
  end
  inherited Panel2: TPanel
    Top = 505
    Width = 934
    ExplicitTop = 505
    ExplicitWidth = 934
    inherited lbEscape: TLabel
      Left = 854
      Height = 17
      ExplicitLeft = 854
    end
    inherited lgndSave: TLabel
      Left = 689
      Height = 17
      ExplicitLeft = 689
    end
    inherited lgndPrint: TLabel
      Left = 776
      Height = 17
      ExplicitLeft = 776
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 165
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
      Width = 146
      Height = 17
      Margins.Top = 1
      Margins.Right = 13
      Margins.Bottom = 1
      Align = alLeft
      Caption = 'F5 [Lookup Invoice / Barang]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
  end
  object cxGroupBox1: TcxGroupBox [2]
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Data [F1] '
    TabOrder = 2
    ExplicitTop = -6
    DesignSize = (
      934
      147)
    Height = 147
    Width = 934
    object cxLabel1: TcxLabel
      Left = 174
      Top = 20
      Caption = 'No. Retur'
    end
    object edNoRetur: TcxTextEdit
      Left = 227
      Top = 19
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Width = 139
    end
    object cxLabel4: TcxLabel
      Left = 175
      Top = 41
      Caption = 'Customer'
    end
    object cxLabel6: TcxLabel
      Left = 182
      Top = 102
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 227
      Top = 101
      TabOrder = 7
      OnKeyDown = edNotesKeyDown
      Height = 35
      Width = 298
    end
    object dtRetur: TcxDateEdit
      Left = 422
      Top = 19
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 2
      Width = 103
    end
    object cxLabel8: TcxLabel
      Left = 374
      Top = 20
      Caption = 'Tgl Retur'
    end
    object edInv: TcxButtonEdit
      Left = 227
      Top = 60
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edInvPropertiesButtonClick
      TabOrder = 4
      OnKeyDown = edInvKeyDown
      Width = 139
    end
    object crSubTotal: TcxCurrencyEdit
      Left = 746
      Top = 45
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
      TabOrder = 8
      Width = 180
    end
    object cxLabel2: TcxLabel
      Left = 674
      Top = 46
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
      Left = 710
      Top = 73
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
      Left = 746
      Top = 72
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
      TabOrder = 9
      Width = 180
    end
    object cxLabel5: TcxLabel
      Left = 687
      Top = 101
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
      Left = 746
      Top = 98
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
      TabOrder = 10
      Width = 180
    end
    object cxLabel7: TcxLabel
      Left = 148
      Top = 82
      Caption = 'Gudang Tujuan'
    end
    object cxLookupGudang: TcxExtLookupComboBox
      Left = 227
      Top = 80
      TabOrder = 6
      Width = 298
    end
    object cxLabel9: TcxLabel
      Left = 170
      Top = 61
      Caption = 'No. Faktur'
    end
    object dtInvoice: TcxDateEdit
      Left = 422
      Top = 60
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 5
      Width = 103
    end
    object cxLabel11: TcxLabel
      Left = 370
      Top = 61
      Caption = 'Tgl Faktur'
    end
    object rbJenis: TcxRadioGroup
      Left = 16
      Top = 19
      Anchors = [akTop, akRight]
      Caption = ' Jenis Retur Penjualan'
      Properties.Items = <
        item
          Caption = 'Retur Penjualan'
        end
        item
          Caption = 'Pembatalan Faktur'
        end>
      Properties.OnEditValueChanged = rbJenisPropertiesEditValueChanged
      ItemIndex = 0
      TabOrder = 0
      Height = 82
      Width = 124
    end
    object edCustomer: TcxButtonEdit
      Left = 227
      Top = 40
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edCustomerPropertiesButtonClick
      TabOrder = 3
      OnKeyDown = edCustomerKeyDown
      Width = 298
    end
    object ckReferensiFaktur: TcxCheckBox
      Left = 710
      Top = 18
      Caption = 'Dengan Referensi Faktur'
      Properties.ImmediatePost = True
      Properties.OnEditValueChanged = ckReferensiFakturPropertiesEditValueChanged
      State = cbsChecked
      TabOrder = 21
      Visible = False
    end
    object rbHarga: TcxRadioGroup
      AlignWithMargins = True
      Left = 533
      Top = 34
      Margins.Left = 10
      Margins.Top = 0
      Margins.Bottom = 4
      Caption = ' Jenis Harga '
      Enabled = False
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
      ItemIndex = 0
      TabOrder = 22
      Height = 100
      Width = 84
    end
  end
  object cxGrid1: TcxGrid [3]
    Left = 0
    Top = 147
    Width = 934
    Height = 314
    Align = alClient
    TabOrder = 3
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitHeight = 358
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
      OptionsData.Appending = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      Styles.ContentOdd = styleOdd
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
        Width = 282
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
      object colHrgJual: TcxGridDBColumn
        Caption = 'Harga Jual'
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
        Width = 63
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
  object cxMemo1: TcxMemo [4]
    AlignWithMargins = True
    Left = 3
    Top = 464
    Align = alBottom
    Enabled = False
    Lines.Strings = (
      
        '** Retur Penjualan = Mengembalikan barang penjualan ke Stock, Ti' +
        'dak otomatis memotong Faktur Penjualan (Lakukan pemotongan retur' +
        ' dengan fitur Pembayaran)'
      
        '** Pembatalan Retur = Mengembalikan semua barang penjualan ke St' +
        'ock dan memotong piutang faktur tsb. (Hanya bisa apabila faktur ' +
        'yg dipanggil belum ada pembayaran)')
    StyleDisabled.TextColor = clBlack
    TabOrder = 4
    Visible = False
    Height = 38
    Width = 928
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
