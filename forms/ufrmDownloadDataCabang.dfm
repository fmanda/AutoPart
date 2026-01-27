inherited frmDownloadDataCabang: TfrmDownloadDataCabang
  Caption = 'Download Data Journal Cabang'
  ClientHeight = 389
  ClientWidth = 613
  ExplicitWidth = 629
  ExplicitHeight = 428
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 354
    Width = 613
    inherited btnCancel: TcxButton
      Left = 528
    end
    inherited btnPrint: TcxButton
      Left = 442
    end
    inherited btnSave: TcxButton
      Left = 356
      Caption = '&Download'
      OptionsImage.ImageIndex = 51
      OnClick = btnSaveClick
      ExplicitLeft = 356
      ExplicitTop = 6
    end
  end
  inherited Panel2: TPanel
    Top = 333
    Width = 613
    inherited lbEscape: TLabel
      Left = 533
      Height = 17
    end
    inherited lgndSave: TLabel
      Left = 355
      Width = 82
      Height = 17
      Caption = 'Alt+S [Download]'
      ExplicitLeft = 325
      ExplicitWidth = 82
    end
    inherited lgndPrint: TLabel
      Left = 455
      Height = 17
    end
  end
  object cxGroupBox1: TcxGroupBox [2]
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Periode '
    ParentFont = False
    Style.BorderStyle = ebsFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.NativeStyle = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    TabOrder = 2
    ExplicitLeft = -657
    ExplicitWidth = 1234
    Height = 57
    Width = 613
    object cbMonth: TcxComboBox
      Left = 68
      Top = 24
      ParentFont = False
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
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      Text = 'Januari'
      Width = 98
    end
    object spYear: TcxSpinEdit
      Left = 168
      Top = 24
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 1
      Value = 2024
      Width = 74
    end
    object cxLabel3: TcxLabel
      Left = 27
      Top = 25
      Caption = 'Bulan'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
  end
  object cxGrid1: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 60
    Width = 607
    Height = 270
    Align = alClient
    TabOrder = 3
    ExplicitLeft = 2
    ExplicitTop = 13
    ExplicitWidth = 680
    ExplicitHeight = 376
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.HeaderHeight = 30
      Styles.ContentOdd = styleOdd
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Data Hutang'
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 400
    Top = 192
    PixelsPerInch = 96
  end
end
