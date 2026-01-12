inherited frmJournalMemorial: TfrmJournalMemorial
  Caption = 'Journal Memorial'
  ClientHeight = 497
  ClientWidth = 823
  ExplicitWidth = 839
  ExplicitHeight = 536
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 462
    ExplicitTop = 462
    ExplicitWidth = 823
    Width = 823
    inherited btnCancel: TcxButton
      Left = 738
      ExplicitLeft = 738
    end
    inherited btnPrint: TcxButton
      Left = 652
      ExplicitLeft = 652
    end
    inherited btnSave: TcxButton
      Left = 566
      OnClick = btnSaveClick
      ExplicitLeft = 566
    end
  end
  inherited Panel2: TPanel
    Top = 441
    Width = 823
    ExplicitTop = 441
    ExplicitWidth = 823
    inherited lbEscape: TLabel
      Left = 743
      Height = 17
      ExplicitLeft = 743
    end
    inherited lgndSave: TLabel
      Left = 578
      Height = 17
      ExplicitLeft = 578
    end
    inherited lgndPrint: TLabel
      Left = 665
      Height = 17
      ExplicitLeft = 665
    end
  end
  object cxGroupBox1: TcxGroupBox [2]
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Transfer [F1] '
    TabOrder = 2
    Height = 107
    Width = 823
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
      Top = 48
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 99
      Top = 46
      TabOrder = 2
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
  end
  object cxGrid1: TcxGrid [3]
    Left = 0
    Top = 107
    Width = 823
    Height = 334
    Align = alClient
    TabOrder = 3
    RootLevelOptions.DetailTabsPosition = dtpTop
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = clDebet
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = clCredit
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
      object clAccount: TcxGridDBColumn
        Caption = 'Account'
        DataBinding.FieldName = 'AccountCode'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        HeaderAlignmentHorz = taCenter
        Width = 170
      end
      object clDescription: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'Description'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 380
      end
      object clDebet: TcxGridDBColumn
        DataBinding.FieldName = 'Debet'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.Nullable = False
        Properties.OnEditValueChanged = clDebetPropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Width = 134
      end
      object clCredit: TcxGridDBColumn
        DataBinding.FieldName = 'Credit'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.Nullable = False
        Properties.OnEditValueChanged = clCreditPropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Width = 122
      end
    end
    object cxGrid1Level2: TcxGridLevel
      Caption = 'Detail Journal [F2]'
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
