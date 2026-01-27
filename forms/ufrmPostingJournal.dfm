inherited frmPostingJournal: TfrmPostingJournal
  Caption = 'Posting Journal'
  ClientHeight = 611
  ClientWidth = 984
  ExplicitWidth = 1000
  ExplicitHeight = 650
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 555
    ExplicitTop = 480
    ExplicitWidth = 794
    ExplicitHeight = 56
    Height = 56
    Width = 984
    inherited btnCancel: TcxButton
      Left = 899
      Height = 46
      ExplicitLeft = 709
      ExplicitHeight = 46
    end
    inherited btnPrint: TcxButton
      Left = 5
      Width = 132
      Height = 46
      Align = alLeft
      Caption = 'Preview'
      Visible = True
      OnClick = btnPrintClick
      ExplicitLeft = 5
      ExplicitWidth = 132
      ExplicitHeight = 46
    end
    inherited btnSave: TcxButton
      Left = 143
      Width = 750
      Height = 46
      Align = alClient
      Caption = '&Process'
      OptionsImage.ImageIndex = 4
      OnClick = btnSaveClick
      ExplicitLeft = 143
      ExplicitWidth = 560
      ExplicitHeight = 46
    end
  end
  inherited Panel2: TPanel
    Top = 534
    Width = 984
    Visible = False
    ExplicitTop = 459
    ExplicitWidth = 794
    inherited lbEscape: TLabel
      Left = 904
      Height = 17
      ExplicitLeft = 714
    end
    inherited lgndSave: TLabel
      Left = 739
      Height = 17
      Visible = False
      ExplicitLeft = 549
    end
    inherited lgndPrint: TLabel
      Left = 826
      Height = 17
      ExplicitLeft = 636
    end
  end
  object cxGroupBox1: TcxGroupBox [2]
    AlignWithMargins = True
    Left = 0
    Top = 3
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Caption = ' Periode '
    Style.TextStyle = [fsBold]
    TabOrder = 2
    ExplicitWidth = 794
    Height = 94
    Width = 984
    object cbMonth: TcxComboBox
      Left = 79
      Top = 32
      Properties.Items.Strings = (
        'Januari'
        'Februari'
        'Maret'
        'April'
        'Mei'
        'Juni'
        'Juli'
        'Agustus'
        'September'
        'Oktober'
        'November'
        'Desember')
      Properties.OnChange = cbMonthPropertiesChange
      TabOrder = 0
      Text = 'Januari'
      Width = 98
    end
    object cbBulan: TCheckBox
      Left = 26
      Top = 33
      Width = 42
      Height = 17
      Caption = 'Bulan'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = cbBulanClick
    end
    object spYear: TcxSpinEdit
      Left = 179
      Top = 32
      Properties.OnChange = spYearPropertiesChange
      TabOrder = 2
      Value = 2024
      Width = 74
    end
    object cxLabel3: TcxLabel
      Left = 27
      Top = 57
      Caption = 'Tanggal'
    end
    object dtStart: TcxDateEdit
      Left = 79
      Top = 56
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 4
      Width = 98
    end
    object cxLabel1: TcxLabel
      Left = 179
      Top = 56
      Caption = 's/d'
    end
    object dtEnd: TcxDateEdit
      Left = 200
      Top = 56
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 6
      Width = 98
    end
  end
  object cxGrid: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 100
    Width = 978
    Height = 431
    Align = alClient
    TabOrder = 3
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitLeft = 8
    ExplicitWidth = 788
    ExplicitHeight = 356
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      Styles.ContentOdd = styleOdd
    end
    object cxGrdSummary: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      Styles.ContentOdd = styleOdd
    end
    object cxGridLevel2: TcxGridLevel
      Caption = 'Summary Journal'
      GridView = cxGrdSummary
    end
    object cxGridLevel1: TcxGridLevel
      Caption = 'Detail Journal'
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 672
    Top = 32
    PixelsPerInch = 96
  end
  object cxPropertiesStore1: TcxPropertiesStore
    Components = <>
    StorageName = 'cxPropertiesStore1'
    Left = 688
    Top = 304
  end
end
