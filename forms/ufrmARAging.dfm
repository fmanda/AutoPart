inherited frmARAging: TfrmARAging
  Caption = 'Aging AR / Umur Piutang'
  ClientWidth = 712
  ExplicitWidth = 728
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    ExplicitWidth = 712
    Width = 712
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    ExplicitWidth = 712
    Width = 712
    inherited btnTutup: TcxButton
      Left = 632
      ExplicitLeft = 632
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
    Height = 60
    Width = 712
    object cxLabel3: TcxLabel
      Left = 24
      Top = 25
      Caption = 'Per Tanggal'
    end
    object dtRefDate: TcxDateEdit
      Left = 86
      Top = 25
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      Width = 123
    end
    object rbJenis: TcxRadioGroup
      Left = 233
      Top = 10
      Caption = ' Jenis Report '
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = 'Per Customer'
        end
        item
          Caption = 'Per Salesman'
        end>
      ItemIndex = 0
      TabOrder = 2
      Height = 43
      Width = 203
    end
  end
  object cxGrid1: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 101
    Width = 706
    Height = 269
    Align = alClient
    TabOrder = 3
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colRange1
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colRange2
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colRange3
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colRange4
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colRange5
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.OnDetailExpanded = cxGrdMainDataControllerDetailExpanded
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
      Styles.ContentOdd = styleOdd
      object colKode: TcxGridDBColumn
        DataBinding.FieldName = 'Salesman'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 243
      end
      object colNotes: TcxGridDBColumn
        DataBinding.FieldName = 'Customer'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 324
      end
      object colCurrent: TcxGridDBColumn
        Caption = 'Belum Jt Tempo'
        DataBinding.FieldName = 'Current'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Styles.OnGetContentStyle = colCurrentStylesGetContentStyle
        Width = 110
      end
      object colRange1: TcxGridDBColumn
        Caption = '0 - 30 Hari'
        DataBinding.FieldName = 'Range1'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Styles.OnGetContentStyle = colRange1StylesGetContentStyle
        Width = 110
      end
      object colRange2: TcxGridDBColumn
        Caption = '31 - 60 Hari'
        DataBinding.FieldName = 'Range2'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Styles.OnGetContentStyle = colRange2StylesGetContentStyle
        Width = 110
      end
      object colRange3: TcxGridDBColumn
        Caption = '61 - 90 Hari'
        DataBinding.FieldName = 'Range3'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Styles.OnGetContentStyle = colRange3StylesGetContentStyle
        Width = 110
      end
      object colRange4: TcxGridDBColumn
        Caption = '> 90 Hari'
        DataBinding.FieldName = 'Range4'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Styles.OnGetContentStyle = colRange4StylesGetContentStyle
        Width = 110
      end
      object colRange5: TcxGridDBColumn
        DataBinding.FieldName = 'Total'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 110
      end
    end
    object cxGrdDetail: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Data Stock'
      GridView = cxGrdMain
      object cxGrid1Level2: TcxGridLevel
        GridView = cxGrdDetail
      end
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 528
    Top = 0
    PixelsPerInch = 96
    object styleCurrent: TcxStyle
      AssignedValues = [svColor]
      Color = 12320699
    end
    object styleRange1: TcxStyle
      AssignedValues = [svColor]
      Color = 8454143
    end
    object styleRange2: TcxStyle
      AssignedValues = [svColor]
      Color = 8432127
    end
    object styleRange3: TcxStyle
      AssignedValues = [svColor]
      Color = 8421631
    end
    object styleRange4: TcxStyle
      AssignedValues = [svColor]
      Color = clRed
    end
  end
end
