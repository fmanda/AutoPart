inherited frmLapHutang: TfrmLapHutang
  Caption = 'Laporan Hutang'
  ClientHeight = 589
  ClientWidth = 873
  ExplicitWidth = 889
  ExplicitHeight = 628
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    Width = 873
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 554
    Width = 873
    inherited btnTutup: TcxButton
      Left = 793
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
    Height = 83
    Width = 873
    object cxLabel3: TcxLabel
      Left = 38
      Top = 24
      Caption = 'Hutang Per Tanggal'
    end
    object dtStock: TcxDateEdit
      Left = 140
      Top = 23
      TabOrder = 0
      Width = 130
    end
    object edKode: TcxButtonEdit
      Left = 140
      Top = 44
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Width = 329
    end
    object ckItem: TcxCheckBox
      Left = 53
      Top = 44
      TabStop = False
      Caption = 'Filter Supplier'
      Properties.Alignment = taLeftJustify
      TabOrder = 3
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
    Top = 124
    Width = 867
    Height = 427
    Align = alClient
    TabOrder = 3
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitLeft = -130
    ExplicitTop = 164
    ExplicitWidth = 1003
    ExplicitHeight = 355
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
    Left = 792
    Top = 48
    PixelsPerInch = 96
  end
end
