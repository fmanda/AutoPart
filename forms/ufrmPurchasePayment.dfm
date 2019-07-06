inherited frmPurchasePayment: TfrmPurchasePayment
  Caption = 'Pembayaran Faktur Pembelian'
  ClientHeight = 561
  ClientWidth = 867
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  ExplicitWidth = 883
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 526
    TabOrder = 2
    ExplicitTop = 526
    ExplicitWidth = 867
    Width = 867
    inherited btnCancel: TcxButton
      Left = 782
      ExplicitLeft = 782
    end
    inherited btnPrint: TcxButton
      Left = 696
      ExplicitLeft = 696
    end
    inherited btnSave: TcxButton
      Left = 610
      OnClick = btnSaveClick
      ExplicitLeft = 610
    end
  end
  inherited Panel2: TPanel
    Top = 505
    Width = 867
    TabOrder = 3
    ExplicitTop = 505
    ExplicitWidth = 867
    inherited lbEscape: TLabel
      Left = 787
      Height = 17
      ExplicitLeft = 787
    end
    inherited lgndSave: TLabel
      Left = 622
      Height = 17
      ExplicitLeft = 622
    end
    inherited lgndPrint: TLabel
      Left = 709
      Height = 17
      ExplicitLeft = 709
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 147
      Height = 17
      Margins.Top = 1
      Margins.Right = 13
      Margins.Bottom = 1
      Align = alLeft
      Caption = 'F5 [Lookup Faktur / Supplier]'
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
      Left = 166
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
      867
      121)
    Height = 121
    Width = 867
    object cxLabel1: TcxLabel
      Left = 20
      Top = 28
      Caption = 'No. Bukti'
    end
    object edRefno: TcxTextEdit
      Left = 67
      Top = 27
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      Width = 118
    end
    object cxLabel4: TcxLabel
      Left = 25
      Top = 48
      Caption = 'Supplier'
    end
    object cxLabel6: TcxLabel
      Left = 24
      Top = 69
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 67
      Top = 67
      TabOrder = 3
      Height = 40
      Width = 259
    end
    object dtTransDate: TcxDateEdit
      Left = 236
      Top = 27
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 90
    end
    object cxLabel8: TcxLabel
      Left = 187
      Top = 28
      Caption = 'Tgl Bayar'
    end
    object dtDueDate: TcxDateEdit
      Left = 414
      Top = 87
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 7
      OnKeyDown = dtDueDateKeyDown
      Width = 90
    end
    object cxLabel9: TcxLabel
      Left = 361
      Top = 88
      Caption = 'Jt. Tempo'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 413
    end
    object edSupplier: TcxButtonEdit
      Left = 67
      Top = 47
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edSupplierPropertiesButtonClick
      TabOrder = 2
      OnKeyDown = edSupplierKeyDown
      Width = 259
    end
    object crRetur: TcxCurrencyEdit
      Left = 680
      Top = 57
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
      Left = 641
      Top = 84
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
      AnchorX = 678
    end
    object cxLabel3: TcxLabel
      Left = 639
      Top = 58
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
      AnchorX = 678
    end
    object crTotal: TcxCurrencyEdit
      Left = 680
      Top = 83
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
      Left = 638
      Top = 27
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
      AnchorX = 678
    end
    object crCash: TcxCurrencyEdit
      Left = 680
      Top = 22
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
      Left = 414
      Top = 27
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
      Left = 354
      Top = 28
      Caption = 'Jenis Media'
    end
    object lbRekening: TcxLabel
      Left = 342
      Top = 68
      Caption = 'Rekening Asal'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 413
    end
    object cxLookupRekening: TcxExtLookupComboBox
      Left = 414
      Top = 67
      Properties.ImmediatePost = True
      TabOrder = 6
      Width = 202
    end
    object lbNoMedia: TcxLabel
      Left = 365
      Top = 48
      Caption = 'No Media'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 413
    end
    object edNoMedia: TcxTextEdit
      Left = 414
      Top = 47
      Properties.CharCase = ecUpperCase
      TabOrder = 5
      Width = 202
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 121
    Width = 867
    Height = 384
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
        Width = 146
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
      object colInvoiceAmt: TcxGridDBColumn
        Caption = 'Nilai Faktur'
        DataBinding.FieldName = 'InvoiceAmt'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Width = 89
      end
      object colInvoiceRemain: TcxGridDBColumn
        Caption = 'Sisa Hutang'
        DataBinding.FieldName = 'InvoiceRemain'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Focusing = False
        Width = 90
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
        Width = 71
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
        DataBinding.FieldName = 'PurchaseInvoice'
        PropertiesClassName = 'TcxSpinEditProperties'
        Visible = False
        Options.Editing = False
      end
      object colReturID: TcxGridDBColumn
        DataBinding.FieldName = 'PurchaseRetur'
        PropertiesClassName = 'TcxSpinEditProperties'
        Visible = False
        Options.Editing = False
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
