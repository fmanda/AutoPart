inherited frmExportData: TfrmExportData
  Caption = 'Export Data'
  ClientHeight = 588
  ClientWidth = 853
  Position = poDesktopCenter
  ExplicitWidth = 869
  ExplicitHeight = 627
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 553
    Width = 853
    Height = 35
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = 14079702
    TabOrder = 0
    ExplicitTop = 496
    ExplicitWidth = 791
    object btnClose: TcxButton
      AlignWithMargins = True
      Left = 774
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
      ExplicitLeft = 712
    end
    object btnExport: TcxButton
      AlignWithMargins = True
      Left = 664
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
      ExplicitLeft = 602
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
    ExplicitWidth = 791
    Height = 113
    Width = 853
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
      Enabled = False
      TabOrder = 1
    end
    object ckTransfer: TcxCheckBox
      Left = 9
      Top = 48
      Caption = 'Transfer Stock Antar Cabang'
      Enabled = False
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
      ExplicitLeft = 7
      Height = 35
      Width = 843
      object EndDate: TcxDateEdit
        AlignWithMargins = True
        Left = 202
        Top = 5
        Align = alLeft
        Enabled = False
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 0
        Visible = False
        Width = 100
      end
      object StartDate: TcxDateEdit
        AlignWithMargins = True
        Left = 77
        Top = 5
        Align = alLeft
        Enabled = False
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 1
        Visible = False
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
        Enabled = False
        Properties.Alignment.Vert = taVCenter
        Visible = False
        AnchorY = 18
      end
      object cxLabel2: TcxLabel
        Left = 180
        Top = 2
        Align = alLeft
        Caption = 's/d'
        Enabled = False
        Properties.Alignment.Vert = taVCenter
        Visible = False
        AnchorY = 18
      end
      object btnRefresh: TcxButton
        AlignWithMargins = True
        Left = 308
        Top = 4
        Width = 90
        Height = 27
        Cursor = crHandPoint
        Margins.Top = 2
        Margins.Bottom = 2
        Align = alLeft
        Caption = '&Load Data'
        Enabled = False
        OptionsImage.ImageIndex = 4
        OptionsImage.Images = frmMain.ImageList
        TabOrder = 4
        ExplicitLeft = 686
      end
    end
    object cxMemo1: TcxMemo
      AlignWithMargins = True
      Left = 416
      Top = 21
      Align = alRight
      Enabled = False
      Lines.Strings = (
        
          '** Transfer Stock diexport menjadi file terpisah dengan Master B' +
          'arang & Quotation.'
        '** Export Quotation otomatis mengexport Data Barang juga.'
        
          '** Load Data melakukan load inputan diperiode terpilih (Barang, ' +
          'Quotation, Transfer)')
      StyleDisabled.TextColor = clBlack
      TabOrder = 4
      Visible = False
      Height = 46
      Width = 432
    end
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 113
    Width = 853
    Height = 419
    Align = alClient
    TabOrder = 2
    Properties.ActivePage = tsItem
    Properties.CustomButtons.Buttons = <>
    ExplicitWidth = 791
    ExplicitHeight = 383
    ClientRectBottom = 419
    ClientRectRight = 853
    ClientRectTop = 24
    object tsItem: TcxTabSheet
      Caption = 'List Master Barang'
      ImageIndex = 0
      ExplicitWidth = 791
      ExplicitHeight = 359
      object cxGridItem: TcxGrid
        Left = 0
        Top = 0
        Width = 853
        Height = 395
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 791
        ExplicitHeight = 359
        object cxGrdItem: TcxGridDBTableView
          PopupMenu = pmGrid
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
      ExplicitWidth = 791
      ExplicitHeight = 359
    end
    object tsTransfer: TcxTabSheet
      Caption = 'List Transfer Stock'
      ImageIndex = 2
      ExplicitWidth = 791
      ExplicitHeight = 359
    end
    object tsJSON: TcxTabSheet
      Caption = 'File Preview'
      ImageIndex = 3
      ExplicitWidth = 791
      ExplicitHeight = 359
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
        ExplicitWidth = 791
        ExplicitHeight = 359
        Height = 395
        Width = 853
      end
    end
  end
  object pgBar: TcxProgressBar
    Left = 0
    Top = 532
    Align = alBottom
    Properties.ShowTextStyle = cxtsPosition
    TabOrder = 3
    ExplicitLeft = 128
    ExplicitTop = 296
    ExplicitWidth = 642
    Width = 853
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '*.json'
    Filter = 'AutoPart JSON File|*.json'
    FilterIndex = 0
    Left = 440
    Top = 329
  end
  object pmGrid: TPopupMenu
    Left = 352
    Top = 320
    object F6LookupDataBarangterakhirdiinputedit1: TMenuItem
      Caption = 'Lookup Data Barang terakhir diinput / edit [F6]'
      OnClick = F6LookupDataBarangterakhirdiinputedit1Click
    end
  end
end
