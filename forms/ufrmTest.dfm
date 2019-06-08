inherited frmTest: TfrmTest
  Caption = 'frmTest'
  ClientHeight = 513
  ClientWidth = 719
  Visible = True
  ExplicitWidth = 735
  ExplicitHeight = 552
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    ExplicitWidth = 719
    Width = 719
    inherited lblTitle: TcxLabel
      Caption = 'Testing Purpose'
      Style.IsFontAssigned = True
      ExplicitWidth = 95
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 478
    ExplicitTop = 478
    ExplicitWidth = 719
    Width = 719
    inherited btnCancel: TcxButton
      Left = 634
      ExplicitLeft = 634
    end
    inherited btnPrint: TcxButton
      Left = 548
      ExplicitLeft = 548
    end
    inherited btnSave: TcxButton
      Left = 462
      OnClick = btnSaveClick
      ExplicitLeft = 462
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 35
    Width = 719
    Height = 443
    Align = alClient
    TabOrder = 2
    object cxGrid1ServerModeTableView1: TcxGridServerModeTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1ServerModeTableView1
    end
  end
  object cxExtLookupComboBox1: TcxExtLookupComboBox
    Left = 320
    Top = 192
    TabOrder = 3
    Width = 145
  end
  object dxServerModeFireDACQueryDataSource1: TdxServerModeFireDACQueryDataSource
    SQL.Strings = (
      'select * from TblStok')
    Left = 160
    Top = 240
  end
  object cxGridViewRepository1: TcxGridViewRepository
    Left = 200
    Top = 152
    object cxGridViewRepository1ServerModeTableView1: TcxGridServerModeTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGridViewRepository1TableView1: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGridViewRepository1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGridViewRepository1ServerModeBandedTableView1: TcxGridServerModeBandedTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Bands = <
        item
        end>
    end
  end
end
