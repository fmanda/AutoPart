inherited frmPurchaseInvoiceHistory: TfrmPurchaseInvoiceHistory
  Caption = 'History Pembayaran Faktur Pembelian'
  ClientHeight = 525
  ClientWidth = 934
  FormStyle = fsStayOnTop
  Position = poDesktopCenter
  Visible = False
  WindowState = wsNormal
  ExplicitWidth = 950
  ExplicitHeight = 564
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    Width = 934
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 490
    Width = 934
    inherited btnTutup: TcxButton
      Left = 854
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
    Caption = ' Report Parameter '
    TabOrder = 2
    ExplicitLeft = -88
    ExplicitWidth = 908
    DesignSize = (
      934
      123)
    Height = 123
    Width = 934
    object cxLabel1: TcxLabel
      Left = 38
      Top = 25
      Caption = 'No. Faktur'
    end
    object cxLabel2: TcxLabel
      Left = 49
      Top = 66
      Caption = 'Supplier'
    end
    object edSupplier: TcxTextEdit
      Left = 93
      Top = 65
      TabStop = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      TabOrder = 1
      Width = 312
    end
    object edInvoice: TcxButtonEdit
      Left = 93
      Top = 25
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.CharCase = ecUpperCase
      Properties.OnButtonClick = edInvoicePropertiesButtonClick
      Properties.OnValidate = edInvoicePropertiesValidate
      TabOrder = 0
      OnKeyDown = edInvoiceKeyDown
      Width = 164
    end
    object cxLabel8: TcxLabel
      Left = 37
      Top = 45
      Caption = 'Tgl Invoice'
    end
    object dtInvoice: TcxDateEdit
      Left = 93
      Top = 45
      TabStop = False
      Properties.ImmediatePost = True
      Properties.ReadOnly = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 5
      Width = 100
    end
    object cxLabel9: TcxLabel
      Left = 237
      Top = 46
      Caption = 'Jatuh Tempo'
    end
    object dtJtTempo: TcxDateEdit
      Left = 305
      Top = 45
      TabStop = False
      Properties.ImmediatePost = True
      Properties.ReadOnly = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 7
      Width = 100
    end
    object cxLabel10: TcxLabel
      Left = 273
      Top = 25
      Caption = 'Cara Bayar'
    end
    object cbBayar: TcxComboBox
      Left = 335
      Top = 25
      TabStop = False
      Properties.CharCase = ecUpperCase
      Properties.DropDownListStyle = lsFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'CASH'
        'TEMPO')
      Properties.ReadOnly = True
      TabOrder = 9
      Text = 'CASH'
      Width = 70
    end
    object crAmount: TcxCurrencyEdit
      Left = 730
      Top = 20
      TabStop = False
      Anchors = [akTop, akRight]
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Properties.ReadOnly = True
      Style.Color = clCream
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Consolas'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 10
      ExplicitLeft = 704
      Width = 180
    end
    object cxLabel4: TcxLabel
      Left = 655
      Top = 21
      Anchors = [akTop, akRight]
      Caption = 'Nilai Faktur'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      ExplicitLeft = 629
    end
    object cxLabel5: TcxLabel
      Left = 627
      Top = 47
      Anchors = [akTop, akRight]
      Caption = 'Total Terbayar'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      ExplicitLeft = 601
    end
    object crPaid: TcxCurrencyEdit
      Left = 730
      Top = 46
      TabStop = False
      Anchors = [akTop, akRight]
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Properties.ReadOnly = True
      Style.Color = clCream
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Consolas'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 13
      ExplicitLeft = 704
      Width = 180
    end
    object cxLabel6: TcxLabel
      Left = 635
      Top = 76
      Anchors = [akTop, akRight]
      Caption = 'Sisa Hutang'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      ExplicitLeft = 521
    end
    object crRemain: TcxCurrencyEdit
      Left = 730
      Top = 72
      TabStop = False
      Anchors = [akTop, akRight]
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Properties.ReadOnly = True
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -24
      Style.Font.Name = 'Consolas'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 15
      ExplicitLeft = 704
      Width = 180
    end
    object cxLabel7: TcxLabel
      Left = 16
      Top = 86
      Caption = 'Gudang Tujuan'
    end
    object cxLookupGudang: TcxExtLookupComboBox
      Left = 93
      Top = 86
      Properties.ReadOnly = True
      TabOrder = 17
      Width = 312
    end
  end
  object cxGrid1: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 164
    Width = 928
    Height = 323
    Align = alClient
    TabOrder = 3
    ExplicitLeft = -2
    ExplicitWidth = 814
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colAmount
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
        Width = 95
      end
      object colRefNo: TcxGridDBColumn
        Caption = 'No. Ref'
        DataBinding.FieldName = 'RefNo'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 112
      end
      object colReturNo: TcxGridDBColumn
        Caption = 'No. Retur'
        DataBinding.FieldName = 'ReturNo'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 114
      end
      object colNotes: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'Notes'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 248
      end
      object colAmount: TcxGridDBColumn
        Caption = 'Terbayar'
        DataBinding.FieldName = 'Amount'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 103
      end
      object colReturAmt: TcxGridDBColumn
        Caption = 'Retur'
        DataBinding.FieldName = 'ReturAmt'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 91
      end
      object colSaldo: TcxGridDBColumn
        DataBinding.FieldName = 'Saldo'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 107
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 424
    Top = 65520
    PixelsPerInch = 96
  end
end
