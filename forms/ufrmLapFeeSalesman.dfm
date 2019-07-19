inherited frmLapFeeSalesman: TfrmLapFeeSalesman
  Caption = 'Laporan Fee / Komisi Salesman'
  ClientHeight = 537
  ClientWidth = 704
  ExplicitWidth = 720
  ExplicitHeight = 576
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    Width = 704
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 502
    Width = 704
    inherited btnTutup: TcxButton
      Left = 624
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
    Caption = ' Report Parameter '
    TabOrder = 2
    Height = 75
    Width = 704
    object cxLabel3: TcxLabel
      Left = 49
      Top = 20
      Caption = 'Periode Awal'
    end
    object dtStart: TcxDateEdit
      Left = 118
      Top = 19
      TabOrder = 1
      Width = 117
    end
    object dtEnd: TcxDateEdit
      Left = 313
      Top = 19
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 2
      Width = 117
    end
    object cxLabel5: TcxLabel
      Left = 246
      Top = 20
      Caption = 'Periode Akhir'
    end
    object ckSalesman: TcxCheckBox
      Left = 20
      Top = 42
      TabStop = False
      Caption = 'Filter Salesman'
      Properties.Alignment = taLeftJustify
      Properties.OnEditValueChanged = ckSalesmanPropertiesEditValueChanged
      TabOrder = 4
    end
    object cxLookupSalesman: TcxExtLookupComboBox
      Left = 118
      Top = 42
      TabOrder = 5
      Width = 312
    end
  end
  object cxGrid1: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 116
    Width = 698
    Height = 383
    Align = alClient
    TabOrder = 3
    ExplicitLeft = 35
    ExplicitTop = 107
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
      OptionsSelection.HideSelection = True
      OptionsSelection.InvertSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      Styles.OnGetContentStyle = cxGrdMainStylesGetContentStyle
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Data Hutang'
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 520
    Top = 16
    PixelsPerInch = 96
    object styleCancel: TcxStyle
      AssignedValues = [svColor]
      Color = 8421631
    end
    object styleProcess: TcxStyle
      AssignedValues = [svColor]
      Color = 8454143
    end
    object stylePaid: TcxStyle
      AssignedValues = [svColor]
      Color = 8454016
    end
  end
end
