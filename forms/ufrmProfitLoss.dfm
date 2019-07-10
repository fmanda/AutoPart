inherited frmProfitLoss: TfrmProfitLoss
  Caption = 'Laba Rugi'
  ClientHeight = 584
  ClientWidth = 700
  ExplicitWidth = 716
  ExplicitHeight = 623
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    Visible = True
    ExplicitWidth = 700
    Width = 700
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 549
    ExplicitTop = 549
    ExplicitWidth = 700
    Width = 700
    inherited btnTutup: TcxButton
      Left = 620
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
    Height = 30
    Width = 700
    object dtStart: TcxDateEdit
      Left = 352
      Top = 6
      TabOrder = 0
      Width = 117
    end
    object dtEnd: TcxDateEdit
      Left = 492
      Top = 6
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 117
    end
    object cxLabel5: TcxLabel
      Left = 472
      Top = 7
      Caption = 's/d'
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
      Left = 294
      Top = 6
      Caption = 'Periode'
      Properties.OnEditValueChanged = chkPeriodePropertiesEditValueChanged
      TabOrder = 7
    end
  end
  object cxGrid1: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 68
    Width = 694
    Height = 478
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
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
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideSelection = True
      OptionsSelection.UnselectFocusedRecordOnExit = False
      OptionsView.GridLines = glNone
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      OptionsView.HeaderHeight = 25
      Styles.OnGetContentStyle = cxGrdMainStylesGetContentStyle
      object cxGrdMainColumn1: TcxGridDBColumn
        Caption = 'Account'
        DataBinding.FieldName = 'REPORTNAME'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 446
      end
      object colReportval: TcxGridDBColumn
        Caption = 'Nilai'
        DataBinding.FieldName = 'REPORTVAL'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        HeaderAlignmentHorz = taCenter
        Width = 163
      end
      object colReportgroup: TcxGridDBColumn
        DataBinding.FieldName = 'REPORTGROUP'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 191
      end
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Data Hutang'
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 376
    Top = 608
    PixelsPerInch = 96
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 384
    Top = 88
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
      Color = 12177710
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object styleNetProfit: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 682229
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
