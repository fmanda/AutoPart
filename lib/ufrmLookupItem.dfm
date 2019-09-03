inherited frmLookupItem: TfrmLookupItem
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlHeader: TPanel
    inherited lblFilterData: TcxLabel
      AnchorY = 16
    end
    inherited lblsdFilter: TcxLabel
      AnchorY = 16
    end
  end
  inherited Panel2: TPanel
    inherited Label2: TLabel
      Left = 121
      ExplicitLeft = 121
    end
    object Label3: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 102
      Height = 17
      Margins.Top = 1
      Margins.Right = 13
      Margins.Bottom = 1
      Align = alLeft
      Caption = 'F4 [Tampilkan Stock]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
  end
  inherited Panel1: TPanel
    object btnStock: TcxButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 86
      Height = 25
      Align = alLeft
      Caption = 'Stock'
      OptionsImage.ImageIndex = 67
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 2
      OnClick = btnStockClick
    end
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
