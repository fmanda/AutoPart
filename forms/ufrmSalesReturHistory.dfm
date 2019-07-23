inherited frmSalesReturHistory: TfrmSalesReturHistory
  Caption = 'History Pemotongan Retur Penjualan'
  ClientHeight = 528
  ClientWidth = 911
  ExplicitWidth = 927
  ExplicitHeight = 567
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    ExplicitWidth = 911
    Width = 911
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 493
    ExplicitTop = 493
    ExplicitWidth = 911
    Width = 911
    inherited btnTutup: TcxButton
      Left = 831
      ExplicitLeft = 831
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
    Caption = ' Report Parameter '
    TabOrder = 2
    Height = 123
    Width = 911
    object cxLabel1: TcxLabel
      Left = 42
      Top = 26
      Caption = 'No. Retur'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 93
    end
    object cxLabel2: TcxLabel
      Left = 43
      Top = 66
      Caption = 'Customer'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 93
    end
    object edCustomer: TcxTextEdit
      Left = 93
      Top = 65
      TabStop = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      TabOrder = 1
      Width = 312
    end
    object edReturNo: TcxButtonEdit
      Left = 93
      Top = 25
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.CharCase = ecUpperCase
      Properties.OnButtonClick = edReturNoPropertiesButtonClick
      Properties.OnValidate = edReturNoPropertiesValidate
      TabOrder = 0
      OnKeyDown = edReturNoKeyDown
      Width = 164
    end
    object cxLabel8: TcxLabel
      Left = 263
      Top = 25
      Caption = 'Tanggal'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 305
    end
    object dtTransdate: TcxDateEdit
      Left = 305
      Top = 25
      TabStop = False
      Properties.ImmediatePost = True
      Properties.ReadOnly = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 5
      Width = 100
    end
    object crAmount: TcxCurrencyEdit
      Left = 643
      Top = 20
      TabStop = False
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
      TabOrder = 6
      Width = 180
    end
    object cxLabel4: TcxLabel
      Left = 574
      Top = 21
      Caption = 'Nilai Retur'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 642
    end
    object cxLabel5: TcxLabel
      Left = 530
      Top = 47
      Caption = 'Retur Terpotong'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 642
    end
    object crPaid: TcxCurrencyEdit
      Left = 643
      Top = 46
      TabStop = False
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
    object cxLabel6: TcxLabel
      Left = 560
      Top = 76
      Caption = 'Sisa Retur'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 640
    end
    object crRemain: TcxCurrencyEdit
      Left = 643
      Top = 72
      TabStop = False
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
      TabOrder = 11
      Width = 180
    end
    object cxLabel7: TcxLabel
      Left = 16
      Top = 86
      Caption = 'Gudang Tujuan'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 93
    end
    object cxLookupGudang: TcxExtLookupComboBox
      Left = 93
      Top = 85
      Properties.ReadOnly = True
      TabOrder = 13
      Width = 312
    end
    object edInvoiceNo: TcxTextEdit
      Left = 93
      Top = 45
      TabStop = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      TabOrder = 14
      Width = 312
    end
    object cxLabel3: TcxLabel
      Left = 34
      Top = 46
      Caption = 'Ref. Faktur'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 93
    end
  end
  object cxGrid1: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 164
    Width = 905
    Height = 326
    Align = alClient
    TabOrder = 3
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colReturAmt
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      Styles.ContentOdd = styleOdd
      object colTransDate: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'TransDate'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.SaveTime = False
        Properties.ShowTime = False
        HeaderAlignmentHorz = taCenter
        Width = 92
      end
      object colRefNo: TcxGridDBColumn
        Caption = 'No. Ref'
        DataBinding.FieldName = 'RefNo'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 143
      end
      object colReturNo: TcxGridDBColumn
        Caption = 'Potong Faktur'
        DataBinding.FieldName = 'InvoiceNo'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 129
      end
      object colNotes: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'Notes'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 271
      end
      object colReturAmt: TcxGridDBColumn
        Caption = 'Retur Terpotong'
        DataBinding.FieldName = 'ReturAmt'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 127
      end
      object colSaldo: TcxGridDBColumn
        Caption = 'Saldo Retur'
        DataBinding.FieldName = 'Saldo'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 117
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 144
    Top = 65528
    PixelsPerInch = 96
  end
end
