inherited frmDefaultReport: TfrmDefaultReport
  Caption = 'frmDefaultReport'
  ClientHeight = 408
  ClientWidth = 639
  FormStyle = fsMDIChild
  Visible = True
  WindowState = wsMaximized
  ExplicitWidth = 655
  ExplicitHeight = 447
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    TabOrder = 0
    Height = 35
    Width = 639
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
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 373
    Align = alBottom
    PanelStyle.Active = True
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Height = 35
    Width = 639
    object btnTutup: TcxButton
      AlignWithMargins = True
      Left = 559
      Top = 5
      Width = 75
      Height = 25
      Align = alRight
      Caption = '&Tutup'
      OptionsImage.ImageIndex = 61
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 0
      OnClick = btnTutupClick
    end
    object btnExport: TcxButton
      AlignWithMargins = True
      Left = 172
      Top = 5
      Width = 75
      Height = 25
      Align = alLeft
      Caption = '&Export'
      OptionsImage.ImageIndex = 56
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 1
    end
    object btnPrint: TcxButton
      AlignWithMargins = True
      Left = 86
      Top = 5
      Width = 80
      Height = 25
      Align = alLeft
      Caption = '&Cetak'
      OptionsImage.ImageIndex = 68
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 2
    end
    object btnRefresh: TcxButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 75
      Height = 25
      Align = alLeft
      Caption = '&Refresh'
      OptionsImage.ImageIndex = 4
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 3
    end
  end
  object styleRepo: TcxStyleRepository
    Left = 184
    Top = 104
    PixelsPerInch = 96
    object styleOdd: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
  end
end
