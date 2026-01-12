inherited frmPostingJournal: TfrmPostingJournal
  Caption = 'Posting Journal'
  ClientHeight = 536
  ClientWidth = 794
  ExplicitWidth = 810
  ExplicitHeight = 575
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 480
    ExplicitTop = 480
    ExplicitWidth = 794
    ExplicitHeight = 56
    Height = 56
    Width = 794
    inherited btnCancel: TcxButton
      Left = 709
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
      Width = 560
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
    Top = 459
    Width = 794
    Visible = False
    ExplicitTop = 459
    ExplicitWidth = 794
    inherited lbEscape: TLabel
      Left = 714
      Height = 17
      ExplicitLeft = 714
    end
    inherited lgndSave: TLabel
      Left = 549
      Height = 17
      Visible = False
      ExplicitLeft = 549
    end
    inherited lgndPrint: TLabel
      Left = 636
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
    Height = 94
    Width = 794
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
      Top = 34
      Width = 42
      Height = 17
      Caption = 'Bulan'
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
    Left = 0
    Top = 97
    Width = 794
    Height = 362
    Align = alClient
    TabOrder = 3
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
    end
    object cxGridLevel1: TcxGridLevel
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
