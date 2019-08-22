inherited frmPurchaseRetur: TfrmPurchaseRetur
  Caption = 'Retur Pembelian'
  ClientHeight = 558
  ClientWidth = 941
  KeyPreview = True
  OnKeyDown = FormKeyDown
  ExplicitWidth = 957
  ExplicitHeight = 597
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 523
    TabOrder = 2
    ExplicitTop = 523
    ExplicitWidth = 941
    Width = 941
    inherited btnCancel: TcxButton
      Left = 856
      ExplicitLeft = 856
    end
    inherited btnPrint: TcxButton
      Left = 770
      Visible = True
      OnClick = btnPrintClick
      ExplicitLeft = 770
    end
    inherited btnSave: TcxButton
      Left = 684
      OnClick = btnSaveClick
      ExplicitLeft = 684
    end
  end
  inherited Panel2: TPanel
    Top = 502
    Width = 941
    TabOrder = 3
    ExplicitTop = 502
    ExplicitWidth = 941
    inherited lbEscape: TLabel
      Left = 861
      Height = 17
      ExplicitLeft = 861
    end
    inherited lgndSave: TLabel
      Left = 696
      Height = 17
      ExplicitLeft = 696
    end
    inherited lgndPrint: TLabel
      Left = 783
      Height = 17
      Visible = True
      ExplicitLeft = 783
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
    TabOrder = 0
    DesignSize = (
      941
      147)
    Height = 147
    Width = 941
    object cxLabel1: TcxLabel
      Left = 182
      Top = 20
      Caption = 'No. Retur'
    end
    object edNoRetur: TcxTextEdit
      Left = 235
      Top = 19
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Width = 139
    end
    object cxLabel4: TcxLabel
      Left = 191
      Top = 41
      Caption = 'Supplier'
    end
    object cxLabel6: TcxLabel
      Left = 190
      Top = 102
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 235
      Top = 101
      TabOrder = 7
      OnKeyDown = edNotesKeyDown
      Height = 35
      Width = 298
    end
    object dtRetur: TcxDateEdit
      Left = 430
      Top = 19
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 2
      Width = 103
    end
    object cxLabel8: TcxLabel
      Left = 382
      Top = 20
      Caption = 'Tgl Retur'
    end
    object edInv: TcxButtonEdit
      Left = 235
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
      Top = 47
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
      Top = 48
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
      Top = 75
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
      Top = 74
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
      Top = 103
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
      Top = 100
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
      Left = 169
      Top = 82
      Caption = 'Gudang Asal'
    end
    object cxLookupGudang: TcxExtLookupComboBox
      Left = 235
      Top = 80
      TabOrder = 6
      Width = 298
    end
    object cxLabel9: TcxLabel
      Left = 178
      Top = 61
      Caption = 'No. Faktur'
    end
    object dtInvoice: TcxDateEdit
      Left = 430
      Top = 60
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 5
      Width = 103
    end
    object cxLabel11: TcxLabel
      Left = 378
      Top = 61
      Caption = 'Tgl Faktur'
    end
    object rbJenis: TcxRadioGroup
      Left = 15
      Top = 24
      Anchors = [akTop, akRight]
      Caption = ' Jenis Retur Pembelian'
      Properties.Items = <
        item
          Caption = 'Retur Pembelian'
        end
        item
          Caption = 'Pembatalan Faktur'
        end>
      Properties.OnEditValueChanged = rbJenisPropertiesEditValueChanged
      ItemIndex = 0
      TabOrder = 0
      Height = 77
      Width = 136
    end
    object edSupp: TcxButtonEdit
      Left = 235
      Top = 40
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edSuppPropertiesButtonClick
      TabOrder = 3
      OnKeyDown = edSuppKeyDown
      Width = 298
    end
    object ckReferensiFaktur: TcxCheckBox
      Left = 15
      Top = 107
      Caption = 'Dengan Referensi Faktur'
      Properties.ImmediatePost = True
      Properties.OnEditValueChanged = ckReferensiFakturPropertiesEditValueChanged
      State = cbsChecked
      TabOrder = 21
    end
  end
  object cxGrid1: TcxGrid [3]
    Left = 0
    Top = 147
    Width = 941
    Height = 311
    Align = alClient
    PopupMenu = pmMain
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitTop = 144
    object cxGrdMain: TcxGridDBTableView
      PopupMenu = pmMain
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
      object colNo: TcxGridDBColumn
        Caption = 'No.'
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
      object colPriceList: TcxGridDBColumn
        DataBinding.FieldName = 'PriceList'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 90
      end
      object colDisc: TcxGridDBColumn
        Caption = 'Disc %'
        DataBinding.FieldName = 'DiscP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.ReadOnly = False
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
      object colHrgBeli: TcxGridDBColumn
        DataBinding.FieldName = 'Harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
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
    Top = 461
    Align = alBottom
    Enabled = False
    Lines.Strings = (
      
        '** Retur Pembelian = Mengeluarkan barang pembelian dari stock, T' +
        'idak otomatis memotong Faktur Pembelian (Lakukan pemotongan retu' +
        'r dengan fitur Pembayaran)'
      
        '** Pembatalan Retur = Mengeluarkan semua barang pembelian dari s' +
        'tock dan memotong hutang faktur tsb. (Hanya bisa apabila faktur ' +
        'yg dipanggil belum ada pembayaran)')
    StyleDisabled.TextColor = clBlack
    TabOrder = 4
    Visible = False
    Height = 38
    Width = 935
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
  object pmMain: TPopupMenu
    Left = 232
    Top = 368
    object AmbilHargaDariFakturPembelian1: TMenuItem
      Caption = 'Ambil Harga Dari Faktur Pembelian ...'
      OnClick = AmbilHargaDariFakturPembelian1Click
    end
  end
end
