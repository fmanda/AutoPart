inherited frmSalesAnalysis: TfrmSalesAnalysis
  Caption = 'Analisa Penjualan'
  ClientWidth = 809
  ExplicitWidth = 825
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    ExplicitWidth = 809
    Width = 809
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    ExplicitWidth = 809
    Width = 809
    inherited btnTutup: TcxButton
      Left = 729
      ExplicitLeft = 729
    end
    inherited btnExport: TcxButton
      OnClick = btnExportClick
    end
    inherited btnRefresh: TcxButton
      OnClick = btnRefreshClick
    end
  end
  object pgcMain: TcxPageControl [2]
    Left = 0
    Top = 74
    Width = 809
    Height = 299
    Align = alClient
    TabOrder = 2
    Properties.ActivePage = tsPivot
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 299
    ClientRectRight = 809
    ClientRectTop = 24
    object tsPivot: TcxTabSheet
      Caption = 'Pivot Data'
      ImageIndex = 0
      object cxGrdPivot: TcxDBPivotGrid
        Left = 0
        Top = 0
        Width = 809
        Height = 275
        Align = alClient
        Groups = <>
        OptionsView.MarkNarrowCells = True
        OptionsView.RowTotalsLocation = rtlTree
        OptionsView.TotalsForSingleValues = True
        TabOrder = 0
      end
    end
    object tsChart: TcxTabSheet
      Caption = 'Grafis / Chart'
      ImageIndex = 1
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 809
        Height = 275
        Align = alClient
        TabOrder = 0
        object cxChart: TcxGridChartView
          DiagramArea.AxisCategory.Visible = False
          DiagramBar.Active = True
          DiagramBar.AxisCategory.Visible = False
          ToolBox.Border = tbNone
          ToolBox.CustomizeButton = True
          ToolBox.DiagramSelector = True
        end
        object cxGrid1DBChartView1: TcxGridDBChartView
          DiagramColumn.Active = True
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxChart
        end
      end
    end
    object tsRaw: TcxTabSheet
      Caption = 'Data Mentah'
      ImageIndex = 2
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGrid2: TcxGrid
        Left = 0
        Top = 0
        Width = 809
        Height = 275
        Align = alClient
        TabOrder = 0
        object cxGrdRaw: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.Visible = True
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGrdRaw
        end
      end
    end
  end
  object cxGroupBox3: TcxGroupBox [3]
    Left = 0
    Top = 35
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 3
    Height = 39
    Width = 809
    object cxLabel3: TcxLabel
      Left = 14
      Top = 8
      Caption = 'Periode Awal'
    end
    object dtStart: TcxDateEdit
      Left = 86
      Top = 7
      TabOrder = 0
      Width = 117
    end
    object dtEnd: TcxDateEdit
      Left = 281
      Top = 7
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 117
    end
    object cxLabel5: TcxLabel
      Left = 214
      Top = 8
      Caption = 'Periode Akhir'
    end
    object cbTemplate: TcxComboBox
      Left = 516
      Top = 7
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '1. Per Jenis Penjualan'
        '2. Per Periode'
        '3. Per Salesman'
        '4. Per Item'
        '5. Per Customer')
      Properties.OnEditValueChanged = cbTemplatePropertiesEditValueChanged
      TabOrder = 4
      Width = 157
    end
    object cxLabel1: TcxLabel
      Left = 438
      Top = 8
      Caption = 'Template Pivot '
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 728
    Top = 8
    PixelsPerInch = 96
  end
  object cxPivotGridChartConnection1: TcxPivotGridChartConnection
    GridChartView = cxChart
    PivotGrid = cxGrdPivot
    OnGetDataCells = cxPivotGridChartConnection1GetDataCells
    Left = 80
    Top = 282
  end
end
