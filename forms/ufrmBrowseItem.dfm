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
    Height = 473
    ExplicitWidth = 706
    inherited cxGrdMain: TcxGridServerModeTableView
      Styles.OnGetContentStyle = cxGrdMainStylesGetContentStyle
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 508
    ExplicitWidth = 706
    Width = 920
    inherited btnTutup: TcxButton
      Left = 840
      ExplicitLeft = 626
    end
    inherited btnExport: TcxButton
      Left = 496
    end
    inherited btnHapus: TcxButton
      Left = 415
      OnClick = btnHapusClick
    end
    inherited btnEdit: TcxButton
      Left = 334
      OnClick = btnEditClick
    end
    inherited btnLihat: TcxButton
      Left = 167
      OnClick = btnLihatClick
    end
    inherited btnBaru: TcxButton
      Left = 86
      OnClick = btnBaruClick
    end
    inherited btnPrint: TcxButton
      Left = 248
    end
    object btnStock: TcxButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 75
      Height = 25
      Align = alLeft
      Caption = '&Stock'
      OptionsImage.ImageIndex = 25
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 7
      OnClick = btnStockClick
      ExplicitLeft = -18
      ExplicitTop = 7
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    ExplicitWidth = 706
    Width = 920
    inherited btnRefresh: TcxButton
      Left = 840
      ExplicitLeft = 626
    end
    inherited EndDate: TcxDateEdit
      Left = 734
      ExplicitLeft = 520
    end
    inherited StartDate: TcxDateEdit
      Left = 609
      ExplicitLeft = 395
    end
    inherited cxLabel1: TcxLabel
      Left = 539
      ExplicitLeft = 325
      AnchorY = 18
    end
    inherited cxLabel2: TcxLabel
      Left = 712
      ExplicitLeft = 498
      AnchorY = 18
    end
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
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
