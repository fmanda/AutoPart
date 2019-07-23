inherited frmLapHutang: TfrmLapHutang
  Caption = 'Laporan Hutang'
  ClientHeight = 589
  ClientWidth = 873
  ExplicitWidth = 889
  ExplicitHeight = 628
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    Visible = False
    ExplicitWidth = 873
    Width = 873
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 554
    ExplicitTop = 554
    ExplicitWidth = 873
    Width = 873
    inherited btnTutup: TcxButton
      Left = 793
      ExplicitLeft = 793
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
    Caption = ' Laporan Hutang Ke Supplier '
    Style.TextStyle = [fsBold]
    TabOrder = 2
    Height = 52
    Width = 873
    object cxLabel3: TcxLabel
      Left = 38
      Top = 24
      Caption = 'Hutang Per Tanggal'
    end
    object dtRefDate: TcxDateEdit
      Left = 140
      Top = 23
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      Width = 130
    end
    object edKode: TcxButtonEdit
      Left = 460
      Top = 23
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Visible = False
      Width = 329
    end
    object ckItem: TcxCheckBox
      Left = 373
      Top = 23
      TabStop = False
      Caption = 'Filter Supplier'
      Properties.Alignment = taLeftJustify
      TabOrder = 3
      Visible = False
    end
    object ckDueDate: TcxCheckBox
      Left = 409
      Top = 3
      TabStop = False
      Caption = 'Hanya tampilkan yang sudah jatuh tempo'
      Properties.Alignment = taLeftJustify
      State = cbsChecked
      TabOrder = 4
      Visible = False
    end
  end
  object cxGrid1: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 93
    Width = 867
    Height = 458
    Align = alClient
    TabOrder = 3
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitTop = 100
    ExplicitHeight = 451
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
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      Styles.ContentOdd = styleOdd
      Styles.OnGetContentStyle = cxGrdMainStylesGetContentStyle
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Data Hutang'
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 792
    Top = 48
    PixelsPerInch = 96
    object styleRed: TcxStyle
      AssignedValues = [svColor]
      Color = 8421631
    end
  end
end
