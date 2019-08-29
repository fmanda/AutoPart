inherited frmLapStock: TfrmLapStock
  Caption = 'Laporan Stock'
  ClientHeight = 557
  ClientWidth = 1009
  ExplicitWidth = 1025
  ExplicitHeight = 596
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    Visible = False
    ExplicitWidth = 1009
    Width = 1009
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 522
    ExplicitTop = 522
    ExplicitWidth = 1009
    Width = 1009
    inherited btnTutup: TcxButton
      Left = 929
      ExplicitLeft = 929
    end
    inherited btnExport: TcxButton
      OnClick = btnExportClick
    end
    inherited btnRefresh: TcxButton
      OnClick = btnRefreshClick
    end
  end
  object cxGroupBox3: TcxGroupBox [2]
    AlignWithMargins = True
    Left = 0
    Top = 38
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Caption = ' Laporan Stock '
    Style.TextStyle = [fsBold]
    TabOrder = 2
    Height = 67
    Width = 1009
    object edNama: TcxTextEdit
      Left = 861
      Top = 37
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      TabOrder = 3
      Visible = False
      Width = 130
    end
    object cxLabel3: TcxLabel
      Left = 23
      Top = 17
      Caption = 'Stock Per Tanggal'
    end
    object cxLookupGudang: TcxExtLookupComboBox
      Left = 117
      Top = 37
      TabOrder = 1
      Width = 216
    end
    object dtStock: TcxDateEdit
      Left = 117
      Top = 16
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      Width = 130
    end
    object ckGudang: TcxCheckBox
      Left = 29
      Top = 36
      TabStop = False
      Caption = 'Filter Gudang'
      Properties.Alignment = taLeftJustify
      Properties.OnEditValueChanged = ckGudangPropertiesEditValueChanged
      State = cbsChecked
      TabOrder = 4
    end
    object edKode: TcxButtonEdit
      Left = 861
      Top = 16
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.CharCase = ecUpperCase
      Properties.OnButtonClick = edKodePropertiesButtonClick
      Properties.OnValidate = edKodePropertiesValidate
      TabOrder = 2
      Visible = False
      OnKeyDown = edKodeKeyDown
      Width = 130
    end
    object ckItem: TcxCheckBox
      Left = 774
      Top = 16
      TabStop = False
      Caption = 'Filter Barang'
      Properties.Alignment = taLeftJustify
      TabOrder = 6
      Visible = False
    end
    object ckZeroStock: TcxCheckBox
      Left = 352
      Top = 16
      TabStop = False
      Caption = 'Tampilkan Stock 0'
      Properties.Alignment = taLeftJustify
      TabOrder = 7
    end
    object ckShowPrice: TcxCheckBox
      Left = 352
      Top = 36
      TabStop = False
      Caption = 'Tampilkan Harga'
      Properties.Alignment = taLeftJustify
      Properties.OnEditValueChanged = ckShowPricePropertiesEditValueChanged
      State = cbsChecked
      TabOrder = 8
    end
    object ckGrupMerk: TcxCheckBox
      Left = 480
      Top = 17
      TabStop = False
      Caption = 'Tampilkan Merk && Group Barang'
      Properties.Alignment = taLeftJustify
      Properties.OnEditValueChanged = ckGrupMerkPropertiesEditValueChanged
      TabOrder = 9
    end
    object ckShowAvgCost: TcxCheckBox
      Left = 480
      Top = 36
      TabStop = False
      Caption = 'Tampilkan Harga Avg && Total'
      Properties.Alignment = taLeftJustify
      Properties.OnEditValueChanged = ckShowAvgCostPropertiesEditValueChanged
      TabOrder = 10
    end
  end
  object cxGrid1: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 108
    Width = 1003
    Height = 411
    Align = alClient
    TabOrder = 3
    object cxGrdMain: TcxGridDBTableView
      PopupMenu = pmMain
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colValue
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      Styles.ContentOdd = styleOdd
      object colKode: TcxGridDBColumn
        Caption = 'Kode Barang'
        DataBinding.FieldName = 'Kode'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 110
      end
      object colNotes: TcxGridDBColumn
        Caption = 'Nama Barang'
        DataBinding.FieldName = 'Nama'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 352
      end
      object colRak: TcxGridDBColumn
        DataBinding.FieldName = 'Rak'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 73
      end
      object colGroup: TcxGridDBColumn
        Caption = 'Group'
        DataBinding.FieldName = 'ItemGroup'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 125
      end
      object colMerk: TcxGridDBColumn
        DataBinding.FieldName = 'Merk'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 110
      end
      object colPriceList: TcxGridDBColumn
        DataBinding.FieldName = 'PriceList'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
      end
      object colHrgBeli: TcxGridDBColumn
        Caption = 'Hrg Beli'
        DataBinding.FieldName = 'HargaBeli'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
      end
      object colHrgJual1: TcxGridDBColumn
        Caption = 'Hrg Umum'
        DataBinding.FieldName = 'HargaUmum'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
      end
      object colHrgJual2: TcxGridDBColumn
        Caption = 'Hrg Bengkel'
        DataBinding.FieldName = 'HargaBengkel'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
      end
      object colHrgJual3: TcxGridDBColumn
        Caption = 'Hrg Grosir'
        DataBinding.FieldName = 'HargaGrosir'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
      end
      object colHrgJual4: TcxGridDBColumn
        Caption = 'Hrg Keliling'
        DataBinding.FieldName = 'HargaKeliling'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
      end
      object colUOM: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'UOM'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 51
      end
      object colQty: TcxGridDBColumn
        Caption = 'Total Qty'
        DataBinding.FieldName = 'Qty'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Styles.Content = styleQty
        Width = 67
      end
      object colHrgAvg: TcxGridDBColumn
        Caption = 'Harga Avg'
        DataBinding.FieldName = 'HargaAvg'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 71
      end
      object colValue: TcxGridDBColumn
        Caption = 'Qty x Harga Avg'
        DataBinding.FieldName = 'Total'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 103
      end
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Data Stock'
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 600
    Top = 65528
    PixelsPerInch = 96
    object styleQty: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
  object pmMain: TPopupMenu
    Left = 256
    Top = 344
    object LihatKartuStock1: TMenuItem
      Caption = 'Lihat Kartu Stock'
      OnClick = LihatKartuStock1Click
    end
  end
end
