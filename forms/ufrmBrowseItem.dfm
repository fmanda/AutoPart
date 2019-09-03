inherited frmBrowseItem: TfrmBrowseItem
  Caption = 'Browse Data Barang'
  ClientHeight = 543
  ClientWidth = 920
  ExplicitWidth = 936
  ExplicitHeight = 582
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGrid: TcxGrid
    Width = 920
    Height = 445
    ExplicitWidth = 920
    ExplicitHeight = 445
    inherited cxGrdMain: TcxGridServerModeTableView
      OnKeyDown = cxGrdMainKeyDown
      Styles.OnGetContentStyle = cxGrdMainStylesGetContentStyle
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 508
    ExplicitTop = 508
    ExplicitWidth = 920
    Width = 920
    inherited btnTutup: TcxButton
      Left = 840
      ExplicitLeft = 840
    end
    inherited btnExport: TcxButton
      Left = 496
      ExplicitLeft = 496
    end
    inherited btnHapus: TcxButton
      Left = 415
      OnClick = btnHapusClick
      ExplicitLeft = 415
    end
    inherited btnEdit: TcxButton
      Left = 334
      OnClick = btnEditClick
      ExplicitLeft = 334
    end
    inherited btnLihat: TcxButton
      Left = 167
      OnClick = btnLihatClick
      ExplicitLeft = 167
    end
    inherited btnBaru: TcxButton
      Left = 86
      OnClick = btnBaruClick
      ExplicitLeft = 86
    end
    inherited btnPrint: TcxButton
      Left = 248
      ExplicitLeft = 248
    end
    object btnStock: TcxButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 75
      Height = 25
      Align = alLeft
      Caption = '&Stock'
      OptionsImage.ImageIndex = 67
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 7
      OnClick = btnStockClick
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    ExplicitWidth = 920
    Width = 920
    inherited btnRefresh: TcxButton
      Left = 840
      ExplicitLeft = 840
    end
    inherited EndDate: TcxDateEdit
      Left = 734
      ExplicitLeft = 734
    end
    inherited StartDate: TcxDateEdit
      Left = 609
      ExplicitLeft = 609
    end
    inherited cxLabel1: TcxLabel
      Left = 539
      ExplicitLeft = 539
      AnchorY = 18
    end
    inherited cxLabel2: TcxLabel
      Left = 712
      ExplicitLeft = 712
      AnchorY = 18
    end
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  object cxMemo1: TcxMemo [3]
    AlignWithMargins = True
    Left = 3
    Top = 483
    Align = alBottom
    Enabled = False
    Lines.Strings = (
      
        '** Tekan [Enter] / Double Click pada record untuk menampilkan st' +
        'ock Barang')
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextColor = clBlack
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    StyleDisabled.TextColor = clBlack
    TabOrder = 3
    Height = 22
    Width = 914
  end
  inherited styleRepo: TcxStyleRepository
    Top = 65520
    PixelsPerInch = 96
    object styleNonActive: TcxStyle
      AssignedValues = [svColor]
      Color = clScrollBar
    end
  end
end
