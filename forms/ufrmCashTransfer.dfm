inherited frmCashTransfer: TfrmCashTransfer
  Caption = 'Transfer Antar Rekening'
  ClientHeight = 515
  ClientWidth = 760
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  ExplicitWidth = 776
  ExplicitHeight = 554
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 480
    TabOrder = 2
    ExplicitTop = 480
    ExplicitWidth = 760
    Width = 760
    inherited btnCancel: TcxButton
      Left = 675
      ExplicitLeft = 675
    end
    inherited btnPrint: TcxButton
      Left = 589
      ExplicitLeft = 589
    end
    inherited btnSave: TcxButton
      Left = 503
      OnClick = btnSaveClick
      ExplicitLeft = 503
      ExplicitTop = 6
    end
  end
  inherited Panel2: TPanel
    Top = 459
    Width = 760
    TabOrder = 3
    ExplicitTop = 459
    ExplicitWidth = 760
    inherited lbEscape: TLabel
      Left = 680
      Height = 17
      ExplicitLeft = 680
    end
    inherited lgndSave: TLabel
      Left = 515
      Height = 17
      ExplicitLeft = 515
    end
    inherited lgndPrint: TLabel
      Left = 602
      Height = 17
      ExplicitLeft = 602
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Transfer [F1] '
    TabOrder = 0
    Height = 115
    Width = 760
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
      OnKeyDown = edNotesKeyDown
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
      Left = 219
      Top = 23
      Caption = 'Tanggal'
    end
    object cxLabel5: TcxLabel
      Left = 455
      Top = 27
      Caption = 'Total'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 497
    end
    object crTotal: TcxCurrencyEdit
      Left = 499
      Top = 22
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
      TabOrder = 4
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
    Width = 760
    Height = 344
    Align = alClient
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpTop
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
      object colRekening: TcxGridDBColumn
        Caption = 'Rekening Tujuan'
        DataBinding.FieldName = 'Rekening'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        HeaderAlignmentHorz = taCenter
        Width = 178
      end
      object colNotes: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'Notes'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 354
      end
      object colDebet: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'Amount'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.OnEditValueChanged = colDebetPropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Width = 115
      end
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Detail Transfer [F2]'
      GridView = cxGrdMain
    end
  end
end
