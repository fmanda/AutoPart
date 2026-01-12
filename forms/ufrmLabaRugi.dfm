inherited frmLabaRugi: TfrmLabaRugi
  Caption = 'Laba Rugi'
  ClientHeight = 659
  ClientWidth = 776
  ExplicitWidth = 792
  ExplicitHeight = 698
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    ExplicitWidth = 776
    Width = 776
    inherited lblTitle: TcxLabel
      Caption = 'Laba Rugi'
      Style.IsFontAssigned = True
      ExplicitWidth = 59
      AnchorY = 18
    end
    object dtDate: TcxDateEdit
      AlignWithMargins = True
      Left = 137
      Top = 5
      Align = alLeft
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 130
    end
    object cxLabel3: TcxLabel
      AlignWithMargins = True
      Left = 70
      Top = 5
      Align = alLeft
      Caption = 'Per Tanggal'
      Properties.Alignment.Vert = taVCenter
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 624
    ExplicitTop = 624
    ExplicitWidth = 776
    Width = 776
    inherited btnTutup: TcxButton
      Left = 696
      ExplicitLeft = 696
    end
    inherited btnExport: TcxButton
      OnClick = btnExportClick
    end
    inherited btnPrint: TcxButton
      OnClick = btnPrintClick
    end
    inherited btnRefresh: TcxButton
      OnClick = btnRefreshClick
    end
  end
  object cxGrid2: TcxGrid [2]
    AlignWithMargins = True
    Left = 3
    Top = 38
    Width = 770
    Height = 583
    Align = alClient
    TabOrder = 2
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = clYTD
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = clMTD
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = clYTD
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = clMTD
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.FooterMultiSummaries = True
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      OptionsView.GroupFooterMultiSummaries = True
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.HeaderHeight = 30
      object clDesription: TcxGridDBColumn
        Caption = 'DESCRIPTION'
        DataBinding.FieldName = 'Description'
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Styles.OnGetContentStyle = clDesriptionStylesGetContentStyle
        Width = 240
      end
      object clMTD: TcxGridDBColumn
        DataBinding.FieldName = 'MTD'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0;(,0)'
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 90
      end
      object clYTD: TcxGridDBColumn
        DataBinding.FieldName = 'YTD'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0;(,0)'
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 90
      end
      object clReportFlag: TcxGridDBColumn
        DataBinding.FieldName = 'report_flag'
        Visible = False
      end
      object clHasValue: TcxGridDBColumn
        DataBinding.FieldName = 'has_value'
        Visible = False
      end
    end
    object cxGridLevel1: TcxGridLevel
      Caption = 'A K T I V A'
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 656
    PixelsPerInch = 96
    object styleBold: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
end
