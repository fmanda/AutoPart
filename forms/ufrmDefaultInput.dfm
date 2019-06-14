inherited frmDefaultInput: TfrmDefaultInput
  Caption = 'frmDefaultInput'
  ClientHeight = 377
  ClientWidth = 577
  Position = poDesktopCenter
  ExplicitWidth = 593
  ExplicitHeight = 416
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 342
    Align = alBottom
    PanelStyle.Active = True
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    TabOrder = 0
    Height = 35
    Width = 577
    object btnCancel: TcxButton
      AlignWithMargins = True
      Left = 492
      Top = 5
      Width = 80
      Height = 25
      Align = alRight
      Caption = 'Ba&tal'
      OptionsImage.ImageIndex = 5
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnPrint: TcxButton
      AlignWithMargins = True
      Left = 406
      Top = 5
      Width = 80
      Height = 25
      Align = alRight
      Caption = '&Cetak'
      OptionsImage.ImageIndex = 26
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 2
      Visible = False
    end
    object btnSave: TcxButton
      AlignWithMargins = True
      Left = 320
      Top = 5
      Width = 80
      Height = 25
      Align = alRight
      Caption = '&Simpan'
      OptionsImage.ImageIndex = 28
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 321
    Width = 577
    Height = 21
    Align = alBottom
    BevelEdges = [beLeft, beTop, beRight]
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = 14079702
    TabOrder = 1
    ExplicitTop = 294
    object lbEscape: TLabel
      AlignWithMargins = True
      Left = 497
      Top = 1
      Width = 61
      Height = 17
      Margins.Top = 1
      Margins.Right = 15
      Margins.Bottom = 1
      Align = alRight
      Caption = 'Alt+T [Batal]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 515
      ExplicitHeight = 16
    end
    object lgndSave: TLabel
      AlignWithMargins = True
      Left = 332
      Top = 1
      Width = 69
      Height = 17
      Margins.Top = 1
      Margins.Right = 15
      Margins.Bottom = 1
      Align = alRight
      Caption = 'Alt+S [Simpan]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 285
      ExplicitTop = 3
    end
    object lgndPrint: TLabel
      AlignWithMargins = True
      Left = 419
      Top = 1
      Width = 60
      Height = 17
      Margins.Top = 1
      Margins.Right = 15
      Margins.Bottom = 1
      Align = alRight
      Caption = 'Alt+P [Print]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      Visible = False
      ExplicitLeft = 3
      ExplicitHeight = 16
    end
  end
end
