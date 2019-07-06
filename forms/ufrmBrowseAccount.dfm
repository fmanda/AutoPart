inherited frmBrowseAccount: TfrmBrowseAccount
  Caption = 'Browse Account'
  ClientHeight = 459
  ClientWidth = 747
  FormStyle = fsMDIChild
  Visible = True
  WindowState = wsMaximized
  OnShow = FormShow
  ExplicitWidth = 763
  ExplicitHeight = 498
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 424
    Align = alBottom
    PanelStyle.Active = True
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    TabOrder = 0
    Height = 35
    Width = 747
    object btnTutup: TcxButton
      AlignWithMargins = True
      Left = 667
      Top = 5
      Width = 75
      Height = 25
      Align = alRight
      Caption = '&Tutup'
      OptionsImage.ImageIndex = 32
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 0
    end
    object btnExport: TcxButton
      AlignWithMargins = True
      Left = 329
      Top = 5
      Width = 75
      Height = 25
      Align = alLeft
      Caption = 'E&xport'
      OptionsImage.ImageIndex = 31
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 1
    end
    object btnHapus: TcxButton
      AlignWithMargins = True
      Left = 248
      Top = 5
      Width = 75
      Height = 25
      Align = alLeft
      Caption = '&Hapus'
      OptionsImage.ImageIndex = 34
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 2
      OnClick = btnHapusClick
    end
    object btnEdit: TcxButton
      AlignWithMargins = True
      Left = 167
      Top = 5
      Width = 75
      Height = 25
      Align = alLeft
      Caption = '&Edit'
      OptionsImage.ImageIndex = 35
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 3
      OnClick = btnEditClick
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
      OnClick = btnLihatClick
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
      OnClick = btnBaruClick
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
    TabOrder = 1
    Height = 35
    Width = 747
    object btnRefresh: TcxButton
      AlignWithMargins = True
      Left = 667
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
  object cxTreeView: TcxDBTreeList
    Left = 0
    Top = 35
    Width = 747
    Height = 389
    Align = alClient
    Bands = <>
    Navigator.Buttons.CustomButtons = <>
    OptionsBehavior.ExpandOnIncSearch = True
    OptionsData.Editing = False
    OptionsData.Deleting = False
    OptionsView.Headers = False
    RootValue = -1
    TabOrder = 2
  end
end
