inherited frmLapNeraca: TfrmLapNeraca
  Caption = 'Lap Neraca'
  ClientHeight = 662
  ClientWidth = 1234
  OnResize = FormResize
  ExplicitWidth = 1250
  ExplicitHeight = 701
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    Caption = ' Neraca'
    PanelStyle.Active = False
    ParentFont = False
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    ExplicitWidth = 1234
    ExplicitHeight = 57
    Height = 57
    Width = 1234
    inherited lblTitle: TcxLabel
      Left = 382
      Top = 3
      Align = alNone
      Caption = 'Neraca'
      Style.IsFontAssigned = True
      Visible = False
      ExplicitLeft = 382
      ExplicitTop = 3
      ExplicitWidth = 43
      ExplicitHeight = 17
      AnchorY = 12
    end
    object cbMonth: TcxComboBox
      Left = 68
      Top = 24
      ParentFont = False
      Properties.Items.Strings = (
        'Januari'
        'Februari'
        'Maret'
        'April'
        'Mei'
        'Juni'
        'Juli'
        'Agustus'
        'September'
        'Oktober'
        'November'
        'Desember')
      Properties.OnChange = cbMonthPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 1
      Text = 'Januari'
      Width = 98
    end
    object spYear: TcxSpinEdit
      Left = 168
      Top = 24
      ParentFont = False
      Properties.OnChange = spYearPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      Value = 2024
      Width = 74
    end
    object cxLabel3: TcxLabel
      Left = 27
      Top = 25
      Caption = 'Bulan'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cbMonthPrev: TcxComboBox
      Left = 1023
      Top = 23
      ParentFont = False
      Properties.Items.Strings = (
        'Januari'
        'Februari'
        'Maret'
        'April'
        'Mei'
        'Juni'
        'Juli'
        'Agustus'
        'September'
        'Oktober'
        'November'
        'Desember')
      Properties.OnChange = cbMonthPropertiesChange
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 4
      Text = 'Januari'
      Visible = False
      Width = 98
    end
    object spYearPrev: TcxSpinEdit
      Left = 1123
      Top = 23
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 5
      Value = 2024
      Visible = False
      Width = 74
    end
    object chkDetail: TCheckBox
      Left = 640
      Top = 25
      Width = 169
      Height = 17
      Caption = 'Tampilkan Detail Per COA'
      TabOrder = 6
      OnClick = chkDetailClick
    end
    object ckCabang: TCheckBox
      Left = 256
      Top = 25
      Width = 120
      Height = 17
      Caption = 'Filter By Cabang'
      TabOrder = 7
      OnClick = ckCabangClick
    end
    object cxLookupCabang: TcxExtLookupComboBox
      Left = 371
      Top = 24
      Properties.ImmediatePost = True
      TabOrder = 8
      Width = 232
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 627
    ExplicitTop = 627
    ExplicitWidth = 1234
    Width = 1234
    inherited btnTutup: TcxButton
      Left = 1154
      ExplicitLeft = 1154
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
  object cxGrid1: TcxGrid [2]
    AlignWithMargins = True
    Left = 3
    Top = 60
    Width = 600
    Height = 564
    Align = alLeft
    TabOrder = 2
    object cxGrdActiva: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = clActivaBalance
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = clActivaBalancePrev
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = clActivaBalance
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = clActivaBalancePrev
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
      Styles.Footer = styleBold
      Styles.Group = styleBold
      Styles.GroupSummary = styleBold
      object clActivaParent: TcxGridDBColumn
        Caption = 'Group'
        DataBinding.FieldName = 'Parent'
        Visible = False
        OnGetDisplayText = clActivaParentGetDisplayText
        GroupIndex = 0
        GroupSummaryAlignment = taRightJustify
        HeaderAlignmentHorz = taCenter
        Options.SortByDisplayText = isbtOff
        Options.Sorting = False
      end
      object clActivaSubAcc: TcxGridDBColumn
        Caption = 'AKTIVA'
        DataBinding.FieldName = 'SubAccount'
        OnGetDisplayText = clActivaSubAccGetDisplayText
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 200
      end
      object clActivaAcc: TcxGridDBColumn
        DataBinding.FieldName = 'Account'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 200
      end
      object clActivaBalancePrev: TcxGridDBColumn
        DataBinding.FieldName = 'PrevMonth'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0;(,0)'
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 90
      end
      object clActivaBalance: TcxGridDBColumn
        DataBinding.FieldName = 'CurrMonth'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0;(,0)'
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 90
      end
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'A K T I V A'
      GridView = cxGrdActiva
    end
  end
  object cxGrid2: TcxGrid [3]
    AlignWithMargins = True
    Left = 609
    Top = 60
    Width = 622
    Height = 564
    Align = alClient
    TabOrder = 3
    object cxGrdPassiva: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = clPassivaBalance
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = clPassivaBalancePrev
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = clPassivaBalance
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = clPassivaBalancePrev
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
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      OptionsView.HeaderHeight = 30
      Styles.Footer = styleBold
      Styles.Group = styleBold
      Styles.GroupSummary = styleBold
      object clPassivaParent: TcxGridDBColumn
        Caption = 'Group'
        DataBinding.FieldName = 'Parent'
        Visible = False
        OnGetDisplayText = clPassivaParentGetDisplayText
        GroupIndex = 0
        HeaderAlignmentHorz = taCenter
        Options.SortByDisplayText = isbtOff
        Options.Sorting = False
      end
      object clPassivaSubAcc: TcxGridDBColumn
        Caption = 'PASSIVA'
        DataBinding.FieldName = 'SubAccount'
        OnGetDisplayText = clPassivaSubAccGetDisplayText
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 200
      end
      object clPassivaAcc: TcxGridDBColumn
        DataBinding.FieldName = 'Account'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 200
      end
      object clPassivaBalancePrev: TcxGridDBColumn
        DataBinding.FieldName = 'PrevMonth'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0;(,0)'
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 90
      end
      object clPassivaBalance: TcxGridDBColumn
        DataBinding.FieldName = 'CurrMonth'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0;(,0)'
        HeaderAlignmentHorz = taCenter
        HeaderGlyphAlignmentHorz = taCenter
        Width = 90
      end
    end
    object cxGridLevel1: TcxGridLevel
      Caption = 'P A S S I V A'
      GridView = cxGrdPassiva
    end
  end
  object cxGrid3: TcxGrid [4]
    Left = 144
    Top = 132
    Width = 809
    Height = 393
    TabOrder = 4
    Visible = False
    object cxGrdMerge: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
    end
    object cxGrid3Level1: TcxGridLevel
      GridView = cxGrdMerge
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 504
    Top = 160
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
