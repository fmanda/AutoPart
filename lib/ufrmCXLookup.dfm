object frmCXLookup: TfrmCXLookup
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 411
  ClientWidth = 734
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 734
    Height = 33
    Align = alTop
    BevelEdges = [beLeft, beTop, beRight]
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = 14079702
    TabOrder = 1
    ExplicitWidth = 684
    object lblHeader: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 7
      Width = 146
      Height = 21
      Margins.Left = 5
      Margins.Top = 7
      Align = alLeft
      Caption = 'LABEL HEADER GOES HERE..'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitHeight = 14
    end
    object lblFilterData: TcxLabel
      Left = 377
      Top = 0
      Align = alRight
      AutoSize = False
      Caption = 'Filter Data'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitLeft = 327
      Height = 31
      Width = 58
      AnchorY = 16
    end
    object StartDate: TcxDateEdit
      AlignWithMargins = True
      Left = 438
      Top = 4
      Margins.Top = 4
      Margins.Bottom = 4
      Align = alRight
      EditValue = 0d
      Properties.DateButtons = [btnClear, btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      ExplicitLeft = 388
      Width = 89
    end
    object EndDate: TcxDateEdit
      AlignWithMargins = True
      Left = 554
      Top = 4
      Margins.Top = 4
      Margins.Bottom = 4
      Align = alRight
      EditValue = 0d
      Properties.DateButtons = [btnClear, btnToday]
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 2
      ExplicitLeft = 504
      Width = 89
    end
    object btnRefresh: TcxButton
      AlignWithMargins = True
      Left = 649
      Top = 2
      Width = 78
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 2
      Margins.Bottom = 2
      Align = alRight
      Caption = '&Refresh'
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360800000000000036000000280000002000000010000000010020000000
        000000000000C40E0000C40E00000000000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00195000FF195000FF195000FF195000FF1950
        00FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FFFFFFFF9F9F9FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F
        7FFFFFFFFFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00009900FF195000FF009900FF33CC66FF33CC66FF33CC66FF0099
        00FF195000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF007F7F7FFF7F7F7FFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF007F7F7FFFFFFFFFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00009900FF33CC66FF66FF99FF66FF99FF66FF99FF33CC66FF33CC
        66FF009900FF195000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FFFFFFFF7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF00FF00
        FF00FF00FF007F7F7FFFFFFFFFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00009900FF33CC66FF009900FF009900FF009900FF009900FFCCFFCCFF33CC
        66FF33CC66FF009900FF195000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF007F7F7FFFFFFFFFFF7F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFFFFFFFFFFFF00
        FF00FF00FF00FF00FF007F7F7FFFFFFFFFFFFF00FF00FF00FF00FF00FF00FF00
        FF00009900FF009900FFFF00FF00FF00FF00FF00FF00FF00FF0033CC66FFCCFF
        CCFF33CC66FF33CC66FF195000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF007F7F7FFF7F7F7FFFFF00FF00FF00FF00FF00FF00FF00FF007F7F7FFFFFFF
        FFFFFF00FF00FF00FF007F7F7FFFFFFFFFFFFFFFFFFFFF00FF00FF00FF00FF00
        FF00009900FFFF00FF00FF00FF00FF00FF00009900FF009900FF195000FF66FF
        99FF33CC66FF33CC66FF33CC66FF195000FF195000FFFF00FF00FF00FF00FF00
        FF007F7F7FFFFF00FF00FFFFFFFFFF00FF009F9F9FFF9F9F9FFF7F7F7FFFFFFF
        FFFFFF00FF00FF00FF007F7F7FFF7F7F7FFF7F7F7FFFFF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00195000FFFF00FF00FF00FF00009900FFCCFFCCFF66FF
        99FF66FF99FF66FF99FF009900FF195000FFFF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FFFFFFFF7F7F7FFFFFFFFFFFFF00FF007F7F7FFFFFFFFFFFFF00
        FF00FF00FF00FF00FF00FF00FF007F7F7FFFFFFFFFFFFF00FF00FF00FF00FF00
        FF00FF00FF00009900FF009900FF195000FFFF00FF00FF00FF00009900FFCCFF
        CCFF66FF99FF009900FF195000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FFFFFFFF7F7F7FFFFF00FF007F7F7FFFFFFFFFFFFF00FF007F7F7FFFFFFF
        FFFFFF00FF00FF00FF007F7F7FFFFFFFFFFFFF00FF00FF00FF00FF00FF00FF00
        FF00009900FF33CC66FF33CC66FF009900FF195000FFFF00FF00FF00FF000099
        00FF009900FF195000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFF
        FFFF7F7F7FFFFF00FF00FF00FF00FF00FF007F7F7FFFFFFFFFFFFF00FF007F7F
        7FFFFFFFFFFF7F7F7FFFFFFFFFFFFF00FF00FF00FF00FF00FF00FF00FF000099
        00FF33CC66FF33CC66FF33CC66FF33CC66FF009900FF195000FFFF00FF00FF00
        FF00009900FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFFFF7F7F
        7FFFFFFFFFFFFFFFFFFFFF00FF00FF00FF00FF00FF007F7F7FFFFFFFFFFFFF00
        FF007F7F7FFFFFFFFFFFFFFFFFFFFF00FF00FF00FF00FF00FF00009900FF0099
        00FF009900FF66FF99FF33CC66FF009900FF195000FF195000FF195000FFFF00
        FF00FF00FF00FF00FF00195000FFFF00FF00FF00FF00FF00FF009F9F9FFF9F9F
        9FFF7F7F7FFFFFFFFFFFFF00FF00FF00FF007F7F7FFF9F9F9FFF9F9F9FFFFF00
        FF00FF00FF00FFFFFFFF7F7F7FFFFFFFFFFFFF00FF00FF00FF00FF00FF00FF00
        FF00009900FF66FF99FF66FF99FF009900FF195000FFFF00FF00FF00FF00FF00
        FF00FF00FF00195000FF195000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF007F7F7FFFFFFFFFFFFF00FF00FF00FF009F9F9FFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF7F7F7FFF7F7F7FFFFFFFFFFFFF00FF00FF00FF00FF00FF00FF00
        FF00009900FFCCFFCCFF66FF99FF66FF99FF009900FF195000FF195000FF1950
        00FF195000FF009900FF195000FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF007F7F7FFFFFFFFFFFDCDCDCFFFF00FF00FF00FF009F9F9FFF7F7F7FFF7F7F
        7FFF7F7F7FFFDCDCDCFF9F9F9FFFFFFFFFFFFF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00009900FFCCFFCCFF66FF99FF66FF99FF33CC66FF33CC66FF33CC
        66FF009900FF009900FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF007F7F7FFFFFFFFFFFDCDCDCFFFF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00DCDCDCFFDCDCDCFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00009900FFCCFFCCFF66FF99FF66FF99FF33CC66FF0099
        00FF009900FF009900FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF007F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF7F7F7FFF9F9F9FFFFFFFFFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00009900FF009900FF009900FF009900FF0099
        00FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF007F7F7FFF7F7F7FFF7F7F7FFF7F7F7FFF9F9F
        9FFFFFFFFFFFFF00FF00FF00FF00FF00FF00FF00FF00}
      OptionsImage.NumGlyphs = 2
      TabOrder = 4
      OnClick = btnRefreshClick
      ExplicitLeft = 599
    end
    object lblsdFilter: TcxLabel
      AlignWithMargins = True
      Left = 530
      Top = 3
      Margins.Left = 0
      Margins.Right = 0
      Align = alRight
      AutoSize = False
      Caption = 's/d'
      Properties.Alignment.Vert = taVCenter
      Transparent = True
      ExplicitLeft = 480
      Height = 25
      Width = 21
      AnchorY = 16
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 376
    Width = 734
    Height = 35
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = 14079702
    TabOrder = 2
    ExplicitWidth = 684
    object lbBenchmark: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 99
      Height = 29
      Margins.Top = 1
      Margins.Right = 13
      Margins.Bottom = 1
      Align = alLeft
      Caption = 'Debug Benchmark : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
    object btnClose: TcxButton
      AlignWithMargins = True
      Left = 655
      Top = 2
      Width = 72
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 2
      Margins.Bottom = 2
      Align = alRight
      Cancel = True
      Caption = 'Close'
      OptionsImage.ImageIndex = 6
      TabOrder = 0
      OnClick = btnCloseClick
      ExplicitLeft = 605
    end
    object btnOK: TcxButton
      AlignWithMargins = True
      Left = 569
      Top = 2
      Width = 80
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 2
      Margins.Bottom = 2
      Align = alRight
      Caption = 'Select'
      OptionsImage.ImageIndex = 13
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnOKClick
      ExplicitLeft = 519
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 355
    Width = 734
    Height = 21
    Align = alBottom
    BevelEdges = [beLeft, beTop, beRight]
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = 14079702
    TabOrder = 3
    ExplicitWidth = 684
    object lbEscape: TLabel
      AlignWithMargins = True
      Left = 655
      Top = 1
      Width = 72
      Height = 17
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alRight
      Caption = 'Escape [Close]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 605
      ExplicitHeight = 16
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 570
      Top = 1
      Width = 69
      Height = 17
      Margins.Top = 1
      Margins.Right = 13
      Margins.Bottom = 1
      Align = alRight
      Caption = 'Enter [Select]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 520
      ExplicitHeight = 16
    end
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 33
    Width = 734
    Height = 322
    Align = alClient
    TabOrder = 0
    LockedStateImageOptions.Text = 'Mohon ditunggu...'
    LookAndFeel.NativeStyle = False
    ExplicitWidth = 684
    object cxGridView: TcxGridDBTableView
      PopupMenu = pmSelect
      OnKeyDown = cxGridViewKeyDown
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = True
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Append.Enabled = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.InfoPanel.Visible = True
      Navigator.Visible = True
      FindPanel.DisplayMode = fpdmManual
      FindPanel.InfoText = 'ketik teks yang dicari...'
      OnCellDblClick = cxGridViewCellDblClick
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.InfoText = 
        'Klik untuk memfilter data / Atau gunakan CTRL-F untuk panel filt' +
        'er'
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
      NewItemRow.InfoText = 'Baris baru'
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.NoDataToDisplayInfoText = '<Data kosong>'
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
    end
    object cxlvMaster: TcxGridLevel
      GridView = cxGridView
    end
  end
  object pmSelect: TPopupMenu
    Left = 336
    Top = 208
    object CheckSelected1: TMenuItem
      Caption = 'Check Selected'
      OnClick = CheckSelected1Click
    end
    object UnCheckSelected1: TMenuItem
      Caption = 'Uncheck Selected'
      OnClick = UnCheckSelected1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object CheckAll1: TMenuItem
      Caption = 'Check All'
      OnClick = CheckAll1Click
    end
    object UncheckAll1: TMenuItem
      Caption = 'Uncheck All'
      OnClick = UncheckAll1Click
    end
  end
end
