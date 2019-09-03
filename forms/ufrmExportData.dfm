inherited frmExportData: TfrmExportData
  Caption = 'Export Data'
  ClientHeight = 531
  ClientWidth = 791
  Position = poDesktopCenter
  ExplicitWidth = 807
  ExplicitHeight = 570
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 496
    Width = 791
    Height = 35
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = 14079702
    TabOrder = 0
    ExplicitLeft = -247
    ExplicitTop = 412
    ExplicitWidth = 784
    object btnClose: TcxButton
      AlignWithMargins = True
      Left = 712
      Top = 2
      Width = 72
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 2
      Margins.Bottom = 2
      Align = alRight
      Cancel = True
      Caption = 'Close'
      OptionsImage.ImageIndex = 10
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 0
      ExplicitLeft = 705
    end
    object btnExport: TcxButton
      AlignWithMargins = True
      Left = 602
      Top = 2
      Width = 104
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 2
      Margins.Bottom = 2
      Align = alRight
      Caption = '&Export'
      OptionsImage.ImageIndex = 51
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnExportClick
      ExplicitTop = 3
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 0
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Caption = ' Parameter '
    TabOrder = 1
    Height = 113
    Width = 791
    object ckItem: TcxCheckBox
      Left = 9
      Top = 15
      Caption = 'Master Barang'
      TabOrder = 0
    end
    object ckPriceQuot: TcxCheckBox
      Left = 9
      Top = 31
      Caption = 'Price Quotation'
      TabOrder = 1
    end
    object ckTransfer: TcxCheckBox
      Left = 9
      Top = 48
      Caption = 'Transfer Stock Antar Cabang'
      TabOrder = 2
    end
    object cxGroupBox2: TcxGroupBox
      AlignWithMargins = True
      Left = 5
      Top = 73
      Align = alBottom
      PanelStyle.Active = True
      Style.BorderStyle = ebsFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      TabOrder = 3
      ExplicitLeft = 0
      ExplicitTop = 63
      ExplicitWidth = 533
      Height = 35
      Width = 781
      object EndDate: TcxDateEdit
        AlignWithMargins = True
        Left = 202
        Top = 5
        Align = alLeft
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 0
        Visible = False
        ExplicitLeft = 358
        Width = 100
      end
      object StartDate: TcxDateEdit
        AlignWithMargins = True
        Left = 77
        Top = 5
        Align = alLeft
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 1
        Visible = False
        ExplicitLeft = 131
        Width = 100
      end
      object cxLabel1: TcxLabel
        AlignWithMargins = True
        Left = 7
        Top = 5
        Margins.Left = 5
        Margins.Right = 0
        Align = alLeft
        Caption = 'Filter Periode'
        Properties.Alignment.Vert = taVCenter
        Visible = False
        AnchorY = 18
      end
      object cxLabel2: TcxLabel
        Left = 180
        Top = 2
        Align = alLeft
        Caption = 's/d'
        Properties.Alignment.Vert = taVCenter
        Visible = False
        AnchorY = 18
      end
      object btnRefresh: TcxButton
        AlignWithMargins = True
        Left = 686
        Top = 4
        Width = 90
        Height = 27
        Cursor = crHandPoint
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alRight
        Caption = '&Load Data'
        OptionsImage.ImageIndex = 4
        OptionsImage.Images = frmMain.ImageList
        TabOrder = 4
        ExplicitLeft = 432
      end
    end
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 113
    Width = 791
    Height = 383
    Align = alClient
    TabOrder = 2
    Properties.ActivePage = tsJSON
    Properties.CustomButtons.Buttons = <>
    ExplicitTop = 112
    ExplicitHeight = 302
    ClientRectBottom = 383
    ClientRectRight = 791
    ClientRectTop = 24
    object tsItem: TcxTabSheet
      Caption = 'List Master Barang'
      ImageIndex = 0
      ExplicitTop = 23
      ExplicitHeight = 278
      object cxGridItem: TcxGrid
        Left = 0
        Top = 0
        Width = 791
        Height = 359
        Align = alClient
        TabOrder = 0
        ExplicitTop = 147
        ExplicitWidth = 984
        ExplicitHeight = 280
        object cxGrdItem: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
            end
            item
              Kind = skSum
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnSorting = False
          OptionsData.Appending = True
          OptionsSelection.HideSelection = True
          OptionsSelection.InvertSelect = False
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 30
          object colNo: TcxGridDBColumn
            Caption = 'No.'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taCenter
            OnGetDisplayText = colNoGetDisplayText
            HeaderAlignmentHorz = taCenter
            Options.Focusing = False
            Width = 39
          end
          object colKode: TcxGridDBColumn
            Caption = 'Kode Barang'
            DataBinding.FieldName = 'Kode'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.OnButtonClick = colKodePropertiesButtonClick
            HeaderAlignmentHorz = taCenter
            Width = 131
          end
          object colNama: TcxGridDBColumn
            Caption = 'Nama Barang'
            DataBinding.FieldName = 'Nama'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Focusing = False
            Width = 516
          end
          object colItemID: TcxGridDBColumn
            DataBinding.FieldName = 'ID'
            Visible = False
            Options.Editing = False
          end
        end
        object cxGridItemLevel1: TcxGridLevel
          Caption = 'Detail Barang [F2]'
          GridView = cxGrdItem
        end
      end
    end
    object tsPriceQuotation: TcxTabSheet
      Caption = 'List Price Quotation'
      ImageIndex = 1
      ExplicitWidth = 289
      ExplicitHeight = 169
    end
    object tsTransfer: TcxTabSheet
      Caption = 'List Transfer Stock'
      ImageIndex = 2
      ExplicitWidth = 289
      ExplicitHeight = 169
    end
    object tsJSON: TcxTabSheet
      Caption = 'File Preview'
      ImageIndex = 3
      ExplicitWidth = 537
      ExplicitHeight = 267
      object mmJSON: TcxMemo
        Left = 0
        Top = 0
        Align = alClient
        Lines.Strings = (
          'mmJSON')
        ParentFont = False
        Properties.ReadOnly = True
        Properties.ScrollBars = ssVertical
        Style.BorderColor = cl3DDkShadow
        Style.Color = cl3DDkShadow
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = 8454143
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        ExplicitLeft = 136
        ExplicitTop = 88
        ExplicitWidth = 185
        ExplicitHeight = 89
        Height = 359
        Width = 791
      end
    end
  end
end
