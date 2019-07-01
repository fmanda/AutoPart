inherited frmPurchasePayment: TfrmPurchasePayment
  Caption = 'Pembayaran Faktur Pembelian'
  ClientHeight = 561
  ClientWidth = 866
  OnCreate = FormCreate
  ExplicitWidth = 882
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 526
    ExplicitTop = 526
    ExplicitWidth = 866
    Width = 866
    inherited btnCancel: TcxButton
      Left = 781
      ExplicitLeft = 781
    end
    inherited btnPrint: TcxButton
      Left = 695
      ExplicitLeft = 695
    end
    inherited btnSave: TcxButton
      Left = 609
      ExplicitLeft = 609
    end
  end
  inherited Panel2: TPanel
    Top = 505
    Width = 866
    ExplicitTop = 505
    ExplicitWidth = 866
    inherited lbEscape: TLabel
      Left = 786
      Height = 17
      ExplicitLeft = 786
    end
    inherited lgndSave: TLabel
      Left = 621
      Height = 17
      ExplicitLeft = 621
    end
    inherited lgndPrint: TLabel
      Left = 708
      Height = 17
      ExplicitLeft = 708
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Invoice [F1] '
    TabOrder = 2
    DesignSize = (
      866
      121)
    Height = 121
    Width = 866
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
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 7
      Width = 90
    end
    object cxLabel9: TcxLabel
      Left = 361
      Top = 88
      Caption = 'Jt. Tempo'
    end
    object edSupplier: TcxButtonEdit
      Left = 67
      Top = 47
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      TabOrder = 2
      Width = 259
    end
    object crRetur: TcxCurrencyEdit
      Left = 679
      Top = 57
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
      TabOrder = 8
      Width = 170
    end
    object cxLabel2: TcxLabel
      Left = 640
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
      AnchorX = 677
    end
    object cxLabel3: TcxLabel
      Left = 638
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
      AnchorX = 677
    end
    object crTotal: TcxCurrencyEdit
      Left = 679
      Top = 83
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
      TabOrder = 9
      Width = 170
    end
    object cxLabel5: TcxLabel
      Left = 637
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
      AnchorX = 677
    end
    object crCash: TcxCurrencyEdit
      Left = 679
      Top = 22
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
      TabOrder = 10
      Width = 170
    end
    object cbMedia: TcxComboBox
      Left = 414
      Top = 27
      Properties.CharCase = ecUpperCase
      Properties.Items.Strings = (
        'CASH / TUNAI'
        'TRANSFER'
        'CEK / BG')
      TabOrder = 4
      Text = 'CASH / TUNAI'
      Width = 90
    end
    object cxLabel10: TcxLabel
      Left = 354
      Top = 28
      Caption = 'Jenis Media'
    end
    object cxLabel13: TcxLabel
      Left = 342
      Top = 68
      Caption = 'Rekening Asal'
    end
    object cxLookupRekening: TcxExtLookupComboBox
      Left = 414
      Top = 67
      TabOrder = 6
      Width = 202
    end
    object cxLabel7: TcxLabel
      Left = 365
      Top = 48
      Caption = 'No Media'
    end
    object edNoMedia: TcxTextEdit
      Left = 414
      Top = 47
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 5
      Width = 202
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 121
    Width = 866
    Height = 384
    Align = alClient
    TabOrder = 3
    RootLevelOptions.DetailTabsPosition = dtpTop
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
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
        HeaderAlignmentHorz = taCenter
        Width = 181
      end
      object colInvoiceDate: TcxGridDBColumn
        Caption = 'Tgl Faktur'
        DataBinding.FieldName = 'InvoiceDate'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.SaveTime = False
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 79
      end
      object colInvoiceAmt: TcxGridDBColumn
        Caption = 'Nilai Faktur'
        DataBinding.FieldName = 'InvoiceAmt'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 105
      end
      object colRemain: TcxGridDBColumn
        Caption = 'Sisa Hutang'
        DataBinding.FieldName = 'Remain'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 108
      end
      object colPaidAmt: TcxGridDBColumn
        Caption = 'Nilai Bayar'
        DataBinding.FieldName = 'Amount'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 99
      end
      object colReturAmt: TcxGridDBColumn
        Caption = 'Potong Retur'
        DataBinding.FieldName = 'ReturAmt'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 100
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
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 177
      end
      object colInvoiceID: TcxGridDBColumn
        DataBinding.FieldName = 'Invoice'
        Visible = False
        Options.Editing = False
      end
      object colReturID: TcxGridDBColumn
        DataBinding.FieldName = 'SalesRetur'
        Visible = False
        Options.Editing = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Detail Transaksi [F2]'
      GridView = cxGrdMain
    end
  end
end
