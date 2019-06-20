inherited frmLapStock: TfrmLapStock
  Caption = 'Laporan Stock'
  ClientHeight = 557
  ClientWidth = 1009
  ExplicitWidth = 1025
  ExplicitHeight = 596
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    Width = 1009
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 522
    Width = 1009
    inherited btnTutup: TcxButton
      Left = 929
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
    Caption = ' Report Parameter '
    TabOrder = 2
    ExplicitWidth = 758
    Height = 123
    Width = 1009
    object edNama: TcxTextEdit
      Left = 134
      Top = 86
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      TabOrder = 3
      Width = 329
    end
    object cxLabel3: TcxLabel
      Left = 40
      Top = 24
      Caption = 'Stock Per Tanggal'
    end
    object cxLookupGudang: TcxExtLookupComboBox
      Left = 134
      Top = 44
      TabOrder = 1
      Width = 216
    end
    object dtStock: TcxDateEdit
      Left = 134
      Top = 23
      TabOrder = 0
      Width = 130
    end
    object chkAll: TcxCheckBox
      Left = 46
      Top = 43
      TabStop = False
      Caption = 'Filter Gudang'
      Properties.Alignment = taLeftJustify
      TabOrder = 4
    end
    object edKode: TcxButtonEdit
      Left = 134
      Top = 65
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.CharCase = ecUpperCase
      TabOrder = 2
      Width = 130
    end
    object cxCheckBox1: TcxCheckBox
      Left = 47
      Top = 65
      TabStop = False
      Caption = 'Filter Barang'
      Properties.Alignment = taLeftJustify
      TabOrder = 6
    end
    object cxCheckBox2: TcxCheckBox
      Left = 513
      Top = 44
      TabStop = False
      Caption = 'Tampilkan Stock 0'
      Properties.Alignment = taLeftJustify
      TabOrder = 7
    end
    object cxCheckBox3: TcxCheckBox
      Left = 513
      Top = 64
      TabStop = False
      Caption = 'Tampilkan Harga Avg && Total'
      Properties.Alignment = taLeftJustify
      TabOrder = 8
    end
    object cxCheckBox4: TcxCheckBox
      Left = 513
      Top = 86
      TabStop = False
      Caption = 'Tampilkan Merk && Group Barnag'
      Properties.Alignment = taLeftJustify
      TabOrder = 9
    end
  end
  object cxGrid1: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 164
    Width = 1003
    Height = 355
    Align = alClient
    TabOrder = 3
    ExplicitLeft = 8
    ExplicitWidth = 1011
    object cxGrdMain: TcxGridDBTableView
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
      object colGroup: TcxGridDBColumn
        Caption = 'Group'
        DataBinding.FieldName = 'GroupBrg'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 125
      end
      object colMerk: TcxGridDBColumn
        DataBinding.FieldName = 'Merk'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 114
      end
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
      object colUOM: TcxGridDBColumn
        DataBinding.FieldName = 'Satuan'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 51
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
      object colQty: TcxGridDBColumn
        Caption = 'Total Qty'
        DataBinding.FieldName = 'Qty'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 67
      end
      object colValue: TcxGridDBColumn
        Caption = 'Qty x Harga Avg'
        DataBinding.FieldName = 'Stockvalue'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 103
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 600
    Top = 65528
    PixelsPerInch = 96
  end
end
