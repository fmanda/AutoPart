inherited frmProfitLoss: TfrmProfitLoss
  Caption = 'Laba Rugi'
  ClientHeight = 584
  ClientWidth = 720
  ExplicitWidth = 736
  ExplicitHeight = 623
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    ExplicitWidth = 700
    Width = 720
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 549
    ExplicitTop = 549
    ExplicitWidth = 700
    Width = 720
    inherited btnTutup: TcxButton
      Left = 640
      ExplicitLeft = 620
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
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 2
    ExplicitWidth = 700
    Height = 30
    Width = 720
    object dtStart: TcxDateEdit
      Left = 608
      Top = 6
      TabOrder = 0
      Visible = False
      Width = 117
    end
    object dtEnd: TcxDateEdit
      Left = 748
      Top = 6
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Visible = False
      Width = 117
    end
    object cxLabel5: TcxLabel
      Left = 728
      Top = 7
      Caption = 's/d'
      Visible = False
    end
    object cbBulan: TcxComboBox
      Left = 47
      Top = 6
      Properties.CharCase = ecUpperCase
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
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
      Properties.OnEditValueChanged = cbBulanPropertiesEditValueChanged
      TabOrder = 3
      Text = 'JANUARI'
      Width = 79
    end
    object cxLabel1: TcxLabel
      Left = 15
      Top = 7
      Caption = 'Bulan'
    end
    object spTahun: TcxSpinEdit
      Left = 169
      Top = 6
      Properties.Alignment.Horz = taRightJustify
      Properties.OnEditValueChanged = spTahunPropertiesEditValueChanged
      TabOrder = 5
      Value = 2019
      Width = 72
    end
    object cxLabel2: TcxLabel
      Left = 134
      Top = 7
      Caption = 'Tahun'
    end
    object chkPeriode: TcxCheckBox
      Left = 550
      Top = 6
      Caption = 'Periode'
      Properties.OnEditValueChanged = chkPeriodePropertiesEditValueChanged
      TabOrder = 7
      Visible = False
    end
    object cxLookupCabang: TcxExtLookupComboBox
      Left = 362
      Top = 6
      Properties.ImmediatePost = True
      TabOrder = 8
      Width = 190
    end
    object ckCabang: TCheckBox
      Left = 255
      Top = 7
      Width = 101
      Height = 17
      Caption = 'Filter By Cabang'
      TabOrder = 9
      OnClick = ckCabangClick
    end
  end
  object cxGrid2: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 68
    Width = 714
    Height = 478
    Align = alClient
    TabOrder = 3
    ExplicitWidth = 694
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
        Visible = False
      end
      object clHasValue: TcxGridDBColumn
        Visible = False
      end
    end
    object cxGridLevel1: TcxGridLevel
      Caption = 'A K T I V A'
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 376
    Top = 608
    PixelsPerInch = 96
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 520
    Top = 112
    PixelsPerInch = 96
    object styleCaption: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object styleFooter: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object styleGrossProfit: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9742117
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object styleNetProfit: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 679902
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object styleBackGround: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
  end
end
