inherited frmSalesPayment: TfrmSalesPayment
  Caption = 'Pembayaran Faktur Penjualan'
  ClientHeight = 561
  ClientWidth = 984
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  ExplicitWidth = 1000
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 526
    TabOrder = 2
    ExplicitTop = 526
    ExplicitWidth = 984
    Width = 984
    inherited btnCancel: TcxButton
      Left = 899
      ExplicitLeft = 899
    end
    inherited btnPrint: TcxButton
      Left = 813
      ExplicitLeft = 813
    end
    inherited btnSave: TcxButton
      Left = 727
      OnClick = btnSaveClick
      ExplicitLeft = 727
    end
  end
  inherited Panel2: TPanel
    Top = 505
    Width = 984
    TabOrder = 3
    ExplicitTop = 505
    ExplicitWidth = 984
    inherited lbEscape: TLabel
      Left = 904
      Height = 17
      ExplicitLeft = 904
    end
    inherited lgndSave: TLabel
      Left = 739
      Height = 17
      ExplicitLeft = 739
    end
    inherited lgndPrint: TLabel
      Left = 826
      Height = 17
      ExplicitLeft = 826
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 187
      Height = 17
      Margins.Top = 1
      Margins.Right = 13
      Margins.Bottom = 1
      Align = alLeft
      Caption = 'F5 [Lookup Supplier / Faktur / Retur]'
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
      Left = 206
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
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Invoice [F1] '
    TabOrder = 0
    DesignSize = (
      984
      127)
    Height = 127
    Width = 984
    object cxLabel1: TcxLabel
      Left = 26
      Top = 25
      Caption = 'No. Bukti'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 73
    end
    object edRefno: TcxTextEdit
      Left = 74
      Top = 24
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      Width = 118
    end
    object cxLabel4: TcxLabel
      Left = 24
      Top = 45
      Caption = 'Salesman'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 73
    end
    object cxLabel6: TcxLabel
      Left = 30
      Top = 66
      Caption = 'Catatan'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 73
    end
    object edNotes: TcxMemo
      Left = 74
      Top = 64
      TabOrder = 3
      Height = 39
      Width = 252
    end
    object dtTransDate: TcxDateEdit
      Left = 236
      Top = 24
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 90
    end
    object cxLabel8: TcxLabel
      Left = 194
      Top = 25
      Caption = 'Tanggal'
    end
    object dtDueDate: TcxDateEdit
      Left = 443
      Top = 84
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 7
      OnKeyDown = dtDueDateKeyDown
      Width = 90
    end
    object cxLabel9: TcxLabel
      Left = 390
      Top = 85
      Caption = 'Jt. Tempo'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 442
    end
    object crRetur: TcxCurrencyEdit
      Left = 799
      Top = 54
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
      Width = 170
    end
    object cxLabel2: TcxLabel
      Left = 760
      Top = 81
      Anchors = [akTop, akRight]
      Caption = 'Total'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 797
    end
    object cxLabel3: TcxLabel
      Left = 758
      Top = 55
      Anchors = [akTop, akRight]
      Caption = 'Retur'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 797
    end
    object crTotal: TcxCurrencyEdit
      Left = 799
      Top = 80
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
      Width = 170
    end
    object cxLabel5: TcxLabel
      Left = 757
      Top = 24
      Anchors = [akTop, akRight]
      Caption = 'Cash'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 797
    end
    object crCash: TcxCurrencyEdit
      Left = 799
      Top = 19
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
      Width = 170
    end
    object cbMedia: TcxComboBox
      Left = 443
      Top = 24
      Properties.CharCase = ecUpperCase
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'CASH / TUNAI'
        'TRANSFER'
        'BG / CEK')
      Properties.OnEditValueChanged = cbMediaPropertiesEditValueChanged
      TabOrder = 4
      Text = 'CASH / TUNAI'
      Width = 90
    end
    object cxLabel10: TcxLabel
      Left = 383
      Top = 25
      Caption = 'Jenis Media'
    end
    object lbRekening: TcxLabel
      Left = 358
      Top = 65
      Caption = 'Rekening Tujuan'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 442
    end
    object cxLookupRekening: TcxExtLookupComboBox
      Left = 443
      Top = 64
      Properties.ImmediatePost = True
      TabOrder = 6
      Width = 202
    end
    object lbNoMedia: TcxLabel
      Left = 394
      Top = 45
      Caption = 'No Media'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 442
    end
    object edNoMedia: TcxTextEdit
      Left = 443
      Top = 44
      Properties.CharCase = ecUpperCase
      TabOrder = 5
      Width = 202
    end
    object cxLookupSalesman: TcxExtLookupComboBox
      Left = 74
      Top = 44
      Properties.ImmediatePost = True
      TabOrder = 2
      Width = 252
    end
    object ckFilterSalesman: TcxCheckBox
      Left = 6
      Top = 103
      Anchors = [akLeft, akBottom]
      Caption = 'Filter Faktur Atas Salesman Terpilih [F4]'
      State = cbsChecked
      TabOrder = 22
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 127
    Width = 984
    Height = 378
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
          Column = colPaidAmt
        end
        item
          Kind = skSum
          Column = colReturAmt
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
      object colInvoiceNo: TcxGridDBColumn
        Caption = 'No. Faktur'
        DataBinding.FieldName = 'InvoiceNo'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = colInvoiceNoPropertiesButtonClick
        Properties.OnValidate = colInvoiceNoPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 115
      end
      object colInvoiceDate: TcxGridDBColumn
        Caption = 'Tgl Faktur'
        DataBinding.FieldName = 'InvoiceDate'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.SaveTime = False
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 70
      end
      object colCustomer: TcxGridDBColumn
        DataBinding.FieldName = 'Customer'
        HeaderAlignmentHorz = taCenter
        Width = 239
      end
      object colInvoiceAmt: TcxGridDBColumn
        Caption = 'Nilai Faktur'
        DataBinding.FieldName = 'InvoiceAmt'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Width = 78
      end
      object colInvoiceRemain: TcxGridDBColumn
        Caption = 'Sisa Piutang'
        DataBinding.FieldName = 'InvoiceRemain'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Width = 82
      end
      object colPaidAmt: TcxGridDBColumn
        Caption = 'Nilai Bayar'
        DataBinding.FieldName = 'Amount'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.OnEditValueChanged = colPaidAmtPropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Width = 107
      end
      object colReturNo: TcxGridDBColumn
        Caption = 'No. Retur'
        DataBinding.FieldName = 'ReturNo'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ReadOnly = False
        Properties.OnButtonClick = colReturNoPropertiesButtonClick
        Properties.OnValidate = colReturNoPropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 83
      end
      object colReturRemain: TcxGridDBColumn
        Caption = 'Sisa Retur'
        DataBinding.FieldName = 'ReturRemain'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 93
      end
      object colReturAmt: TcxGridDBColumn
        Caption = 'Potong Retur'
        DataBinding.FieldName = 'ReturAmt'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.ReadOnly = False
        Properties.OnEditValueChanged = colReturAmtPropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Width = 81
      end
      object colInvoiceID: TcxGridDBColumn
        DataBinding.FieldName = 'SalesInvoice'
        PropertiesClassName = 'TcxSpinEditProperties'
        Visible = False
        Options.Editing = False
      end
      object colReturID: TcxGridDBColumn
        DataBinding.FieldName = 'SalesRetur'
        PropertiesClassName = 'TcxSpinEditProperties'
        Visible = False
        Options.Editing = False
      end
      object colCustomerID: TcxGridDBColumn
        DataBinding.FieldName = 'CustomerID'
        Visible = False
      end
    end
    object cxGrdCost: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsData.Appending = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      object colCostAccount: TcxGridDBColumn
        DataBinding.FieldName = 'Account'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        HeaderAlignmentHorz = taCenter
        Width = 205
      end
      object colCostNotes: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'Notes'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 380
      end
      object colCostAmount: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'Amount'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.OnEditValueChanged = colCostAmountPropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Width = 134
      end
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Detail Transaksi [F2]'
      GridView = cxGrdMain
    end
    object cxGrid1Level2: TcxGridLevel
      Caption = 'Biaya Lain [F3]'
      GridView = cxGrdCost
    end
  end
end
