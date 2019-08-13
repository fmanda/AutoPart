inherited frmLapStockOpname: TfrmLapStockOpname
  Caption = 'Lap Stock Opname'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    Visible = False
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
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
    Caption = ' Laporan Stock Opname '
    Style.TextStyle = [fsBold]
    TabOrder = 2
    ExplicitLeft = -87
    ExplicitWidth = 726
    Height = 54
    Width = 639
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
  object pgcMain: TcxPageControl [3]
    Left = 0
    Top = 92
    Width = 639
    Height = 281
    Align = alClient
    TabOrder = 3
    Properties.ActivePage = tsDetail
    Properties.CustomButtons.Buttons = <>
    ExplicitTop = 91
    ClientRectBottom = 281
    ClientRectRight = 639
    ClientRectTop = 24
    object tsDetail: TcxTabSheet
      Caption = 'Data Detail'
      ImageIndex = 0
      ExplicitWidth = 289
      ExplicitHeight = 169
      object cxGrid1: TcxGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 633
        Height = 251
        Align = alClient
        TabOrder = 0
        ExplicitLeft = -81
        ExplicitTop = 43
        ExplicitWidth = 720
        ExplicitHeight = 365
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
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Data Pivot'
      ImageIndex = 1
      ExplicitWidth = 289
      ExplicitHeight = 169
      object cxGrdPivot: TcxDBPivotGrid
        Left = 0
        Top = 0
        Width = 639
        Height = 257
        Align = alClient
        Groups = <>
        TabOrder = 0
        ExplicitLeft = 64
        ExplicitTop = 72
        ExplicitWidth = 300
        ExplicitHeight = 250
      end
    end
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
