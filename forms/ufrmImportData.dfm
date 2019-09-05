inherited frmImportData: TfrmImportData
  Caption = 'Import Data'
  ClientHeight = 556
  ClientWidth = 642
  Position = poDesktopCenter
  ExplicitWidth = 658
  ExplicitHeight = 595
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 0
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Caption = ' Parameter '
    TabOrder = 0
    Height = 57
    Width = 642
    object edFile: TcxButtonEdit
      Left = 67
      Top = 23
      Properties.Buttons = <
        item
          Default = True
          ImageIndex = 8
          Kind = bkGlyph
        end>
      Properties.Images = frmMain.ImageList
      Properties.OnButtonClick = edFilePropertiesButtonClick
      TabOrder = 0
      OnKeyDown = edFileKeyDown
      Width = 415
    end
    object cxLabel1: TcxLabel
      Left = 16
      Top = 25
      Caption = 'Nama File'
    end
    object btnRefresh: TcxButton
      AlignWithMargins = True
      Left = 488
      Top = 22
      Width = 90
      Height = 24
      Cursor = crHandPoint
      Margins.Top = 2
      Margins.Bottom = 2
      Caption = '&Import'
      OptionsImage.ImageIndex = 7
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 2
      OnClick = btnRefreshClick
    end
  end
  object pgBar: TcxProgressBar
    Left = 0
    Top = 535
    Align = alBottom
    Properties.ShowTextStyle = cxtsText
    TabOrder = 1
    Width = 642
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 57
    Width = 642
    Height = 478
    Align = alClient
    TabOrder = 2
    Properties.ActivePage = tsJSON
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 478
    ClientRectRight = 642
    ClientRectTop = 24
    object tsPriceQuotation: TcxTabSheet
      Caption = 'Class Yang Akan Diimport'
      ImageIndex = 1
    end
    object tsJSON: TcxTabSheet
      Caption = 'File Preview'
      ImageIndex = 3
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
        Height = 454
        Width = 642
      end
    end
  end
  object opDialog: TOpenDialog
    Filter = 'AutoPart JSON File|*.json'
    FilterIndex = 0
    Left = 328
    Top = 153
  end
end
