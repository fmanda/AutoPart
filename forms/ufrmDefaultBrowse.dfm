inherited frmDefaultBrowse: TfrmDefaultBrowse
  Caption = 'frmDefaultBrowse'
  ClientHeight = 383
  ClientWidth = 611
  FormStyle = fsMDIChild
  Visible = True
  WindowState = wsMaximized
  ExplicitWidth = 627
  ExplicitHeight = 422
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid: TcxGrid
    Left = 0
    Top = 35
    Width = 611
    Height = 313
    Align = alClient
    TabOrder = 0
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Filter.Active = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      FilterRow.ApplyChanges = fracImmediately
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
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 348
    Align = alBottom
    PanelStyle.Active = True
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Height = 35
    Width = 611
    object btnTutup: TcxButton
      AlignWithMargins = True
      Left = 531
      Top = 5
      Width = 75
      Height = 25
      Align = alRight
      Caption = '&Tutup'
      OptionsImage.ImageIndex = 32
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 0
      OnClick = btnTutupClick
    end
    object btnExport: TcxButton
      AlignWithMargins = True
      Left = 415
      Top = 5
      Width = 75
      Height = 25
      Align = alLeft
      Caption = '&Export'
      OptionsImage.ImageIndex = 31
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 1
      OnClick = btnExportClick
    end
    object btnHapus: TcxButton
      AlignWithMargins = True
      Left = 334
      Top = 5
      Width = 75
      Height = 25
      Align = alLeft
      Caption = '&Hapus'
      OptionsImage.ImageIndex = 34
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 2
    end
    object btnEdit: TcxButton
      AlignWithMargins = True
      Left = 253
      Top = 5
      Width = 75
      Height = 25
      Align = alLeft
      Caption = '&Edit'
      OptionsImage.ImageIndex = 35
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 3
    end
    object btnLihat: TcxButton
      AlignWithMargins = True
      Left = 86
      Top = 5
      Width = 75
      Height = 25
      Align = alLeft
      Caption = '&Lihat'
      OptionsImage.ImageIndex = 7
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 4
      Visible = False
    end
    object btnBaru: TcxButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 75
      Height = 25
      Align = alLeft
      Caption = '&Baru'
      OptionsImage.ImageIndex = 33
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 5
    end
    object btnPrint: TcxButton
      AlignWithMargins = True
      Left = 167
      Top = 5
      Width = 80
      Height = 25
      Align = alLeft
      Caption = '&Cetak'
      OptionsImage.ImageIndex = 26
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 6
      Visible = False
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    TabOrder = 2
    Height = 35
    Width = 611
    object btnRefresh: TcxButton
      AlignWithMargins = True
      Left = 531
      Top = 5
      Width = 75
      Height = 25
      Align = alRight
      Caption = '&Refresh'
      OptionsImage.ImageIndex = 5
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 0
      OnClick = btnRefreshClick
    end
    object EndDate: TcxDateEdit
      AlignWithMargins = True
      Left = 425
      Top = 5
      Align = alRight
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Visible = False
      Width = 100
    end
    object StartDate: TcxDateEdit
      AlignWithMargins = True
      Left = 300
      Top = 5
      Align = alRight
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 2
      Visible = False
      Width = 100
    end
    object cxLabel1: TcxLabel
      Left = 230
      Top = 2
      Align = alRight
      Caption = 'Filter Periode'
      Properties.Alignment.Vert = taVCenter
      Visible = False
      AnchorY = 18
    end
    object cxLabel2: TcxLabel
      Left = 403
      Top = 2
      Align = alRight
      Caption = 's/d'
      Properties.Alignment.Vert = taVCenter
      Visible = False
      AnchorY = 18
    end
    object lblTitle: TcxLabel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Align = alLeft
      Caption = 'Form Title Here'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taLeftJustify
      Properties.Alignment.Vert = taVCenter
      AnchorY = 18
    end
  end
  object styleRepo: TcxStyleRepository
    Left = 64
    Top = 80
    PixelsPerInch = 96
    object styleOdd: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
  end
end
