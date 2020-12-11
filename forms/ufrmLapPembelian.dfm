inherited frmLapPembelian: TfrmLapPembelian
  Caption = 'Laporan Pembelian'
  ClientHeight = 498
  ClientWidth = 726
  ExplicitWidth = 742
  ExplicitHeight = 537
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    Visible = False
    ExplicitWidth = 726
    Width = 726
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 463
    ExplicitTop = 463
    ExplicitWidth = 726
    Width = 726
    inherited btnTutup: TcxButton
      Left = 646
      ExplicitLeft = 646
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
    Caption = ' Laporan Pembelian '
    Style.TextStyle = [fsBold]
    TabOrder = 2
    Height = 54
    Width = 726
    object cxLabel3: TcxLabel
      Left = 38
      Top = 25
      Caption = 'Periode'
    end
    object dtStart: TcxDateEdit
      Left = 79
      Top = 24
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      Width = 98
    end
    object cxLabel1: TcxLabel
      Left = 179
      Top = 24
      Caption = 's/d'
    end
    object dtEnd: TcxDateEdit
      Left = 200
      Top = 24
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 3
      Width = 98
    end
  end
  object cxGrid1: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 95
    Width = 720
    Height = 365
    Align = alClient
    TabOrder = 3
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
    Left = 280
    Top = 65520
    PixelsPerInch = 96
  end
end
