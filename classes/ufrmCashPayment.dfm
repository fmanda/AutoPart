inherited frmCashPayment: TfrmCashPayment
  Caption = 'Kas Keluar / Pengeluaran Kas'
  ClientHeight = 523
  ClientWidth = 737
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  ExplicitWidth = 753
  ExplicitHeight = 562
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 488
    TabOrder = 2
    Width = 737
    inherited btnCancel: TcxButton
      Left = 652
    end
    inherited btnPrint: TcxButton
      Left = 566
    end
    inherited btnSave: TcxButton
      Left = 480
      OnClick = btnSaveClick
    end
  end
  inherited Panel2: TPanel
    Top = 467
    Width = 737
    TabOrder = 3
    ExplicitTop = 321
    inherited lbEscape: TLabel
      Left = 657
      Height = 17
    end
    inherited lgndSave: TLabel
      Left = 492
      Height = 17
    end
    inherited lgndPrint: TLabel
      Left = 579
      Height = 17
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Invoice [F1] '
    TabOrder = 0
    ExplicitWidth = 910
    DesignSize = (
      737
      115)
    Height = 115
    Width = 737
    object cxLabel1: TcxLabel
      Left = 52
      Top = 23
      Caption = 'No. Bukti'
    end
    object edRefno: TcxTextEdit
      Left = 99
      Top = 22
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      Width = 118
    end
    object cxLabel6: TcxLabel
      Left = 56
      Top = 64
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 99
      Top = 62
      TabOrder = 3
      Height = 40
      Width = 259
    end
    object dtTransDate: TcxDateEdit
      Left = 268
      Top = 22
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 90
    end
    object cxLabel8: TcxLabel
      Left = 225
      Top = 23
      Caption = 'Tanggal'
    end
    object cxLabel5: TcxLabel
      Left = 508
      Top = 25
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
      AnchorX = 548
    end
    object crCash: TcxCurrencyEdit
      Left = 550
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
      TabOrder = 4
      ExplicitLeft = 680
      Width = 170
    end
    object lbRekening: TcxLabel
      Left = 27
      Top = 43
      Caption = 'Rekening Asal'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 98
    end
    object cxLookupRekening: TcxExtLookupComboBox
      Left = 99
      Top = 42
      Properties.ImmediatePost = True
      TabOrder = 2
      Width = 259
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 115
    Width = 737
    Height = 352
    Align = alClient
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitLeft = -8
    ExplicitTop = 109
    ExplicitWidth = 910
    ExplicitHeight = 389
    object cxGrdMain: TcxGridDBTableView
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
    object cxGrid1Level2: TcxGridLevel
      Caption = 'Detail Pengeluaran [F2]'
      GridView = cxGrdMain
    end
  end
end
