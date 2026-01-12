inherited frmBukuBesar: TfrmBukuBesar
  Caption = 'Buku Besar'
  ClientHeight = 500
  ClientWidth = 658
  ExplicitWidth = 674
  ExplicitHeight = 539
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    Visible = False
    ExplicitWidth = 658
    Width = 658
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      Visible = False
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 465
    ExplicitTop = 465
    ExplicitWidth = 658
    Width = 658
    inherited btnTutup: TcxButton
      Left = 578
      ExplicitLeft = 578
    end
    inherited btnExport: TcxButton
      OnClick = btnExportClick
    end
    inherited btnPrint: TcxButton
      Visible = False
    end
    inherited btnRefresh: TcxButton
      OnClick = btnRefreshClick
    end
  end
  object cxGroupBox3: TcxGroupBox [2]
    Left = 0
    Top = 35
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Caption = ' Buku Besar '
    TabOrder = 2
    Height = 94
    Width = 658
    object cxLabel1: TcxLabel
      Left = 25
      Top = 40
      Caption = 'Kode Account'
    end
    object cxLabel2: TcxLabel
      Left = 22
      Top = 60
      Caption = 'Nama Account'
    end
    object edNama: TcxTextEdit
      Left = 96
      Top = 59
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      TabOrder = 3
      OnKeyDown = edNamaKeyDown
      Width = 312
    end
    object cxLabel3: TcxLabel
      Left = 29
      Top = 19
      Caption = 'Periode Awal'
    end
    object dtStart: TcxDateEdit
      Left = 96
      Top = 18
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      Width = 117
    end
    object edKode: TcxButtonEdit
      Left = 96
      Top = 39
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.CharCase = ecUpperCase
      Properties.OnButtonClick = edKodePropertiesButtonClick
      TabOrder = 2
      Width = 135
    end
    object dtEnd: TcxDateEdit
      Left = 291
      Top = 18
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 117
    end
    object cxLabel5: TcxLabel
      Left = 224
      Top = 19
      Caption = 'Periode Akhir'
    end
  end
  object cxGrid1: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 132
    Width = 652
    Height = 330
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
    Left = 520
    Top = 64
    PixelsPerInch = 96
  end
end
