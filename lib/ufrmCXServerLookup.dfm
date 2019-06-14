object frmCXServerLookup: TfrmCXServerLookup
  Left = 0
  Top = 0
  ClientHeight = 472
  ClientWidth = 670
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 670
    Height = 33
    Align = alTop
    BevelEdges = [beLeft, beTop, beRight]
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = 14079702
    TabOrder = 0
    ExplicitLeft = -67
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
      Left = 313
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
      Left = 374
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
      Left = 490
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
      Left = 585
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
      Left = 466
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
  object Panel2: TPanel
    Left = 0
    Top = 416
    Width = 670
    Height = 21
    Align = alBottom
    BevelEdges = [beLeft, beTop, beRight]
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = 14079702
    TabOrder = 1
    ExplicitLeft = -67
    ExplicitTop = 355
    ExplicitWidth = 684
    object lbEscape: TLabel
      AlignWithMargins = True
      Left = 591
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
      Left = 481
      Top = 1
      Width = 94
      Height = 17
      Margins.Top = 1
      Margins.Right = 13
      Margins.Bottom = 1
      Align = alRight
      Caption = 'Ctrl+Enter [Select]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 487
      ExplicitHeight = 16
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 119
      Height = 17
      Margins.Top = 1
      Margins.Right = 13
      Margins.Bottom = 1
      Align = alLeft
      Caption = 'F5 [Focus To Filter Row]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 437
    Width = 670
    Height = 35
    Align = alBottom
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = 14079702
    TabOrder = 2
    ExplicitLeft = -67
    ExplicitTop = 366
    ExplicitWidth = 684
    object btnClose: TcxButton
      AlignWithMargins = True
      Left = 591
      Top = 2
      Width = 72
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 2
      Margins.Bottom = 2
      Align = alRight
      Cancel = True
      Caption = 'Close'
      OptionsImage.ImageIndex = 5
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 0
      OnClick = btnCloseClick
      ExplicitLeft = 605
    end
    object btnOK: TcxButton
      AlignWithMargins = True
      Left = 481
      Top = 2
      Width = 104
      Height = 27
      Cursor = crHandPoint
      Margins.Top = 2
      Margins.Bottom = 2
      Align = alRight
      Caption = 'Select'
      OptionsImage.ImageIndex = 1
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = btnOKClick
    end
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 33
    Width = 670
    Height = 383
    Align = alClient
    TabOrder = 3
    ExplicitLeft = 40
    ExplicitTop = -15
    object cxGrdMain: TcxGridServerModeTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellDblClick = cxGrdMainCellDblClick
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Filtering.MRUItemsList = False
      Filtering.ColumnAddValueItems = False
      Filtering.ColumnMRUItemsList = False
      FilterRow.Visible = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      Styles.ContentOdd = styleOdd
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGrdMain
    end
  end
  object styleRepo: TcxStyleRepository
    Left = 264
    Top = 8
    PixelsPerInch = 96
    object styleOdd: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
  end
end
