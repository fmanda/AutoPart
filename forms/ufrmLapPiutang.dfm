inherited frmLapPiutang: TfrmLapPiutang
  Caption = 'Laporan Piutang'
  ClientHeight = 494
  ClientWidth = 792
  ExplicitWidth = 808
  ExplicitHeight = 533
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    Width = 792
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 459
    Width = 792
    inherited btnTutup: TcxButton
      Left = 712
    end
    inherited btnExport: TcxButton
      OnClick = btnExportClick
      ExplicitTop = 7
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
    Caption = ' Report Parameter '
    TabOrder = 2
    ExplicitLeft = -234
    ExplicitWidth = 873
    Height = 59
    Width = 792
    object cxLabel3: TcxLabel
      Left = 38
      Top = 24
      Caption = 'Piutang Per Tanggal'
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
      Left = 513
      Top = 20
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
    Top = 100
    Width = 786
    Height = 356
    Align = alClient
    TabOrder = 3
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitLeft = -228
    ExplicitTop = -43
    ExplicitWidth = 867
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
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Data Hutang'
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
