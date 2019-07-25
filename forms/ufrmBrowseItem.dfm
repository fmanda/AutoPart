inherited frmBrowseItem: TfrmBrowseItem
  Caption = 'Browse Data Barang'
  ClientWidth = 706
  ExplicitWidth = 722
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGrid: TcxGrid
    Width = 706
    ExplicitWidth = 706
    inherited cxGrdMain: TcxGridServerModeTableView
      Styles.OnGetContentStyle = cxGrdMainStylesGetContentStyle
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    ExplicitWidth = 706
    Width = 706
    inherited btnTutup: TcxButton
      Left = 626
      ExplicitLeft = 626
    end
    inherited btnHapus: TcxButton
      OnClick = btnHapusClick
    end
    inherited btnEdit: TcxButton
      OnClick = btnEditClick
    end
    inherited btnLihat: TcxButton
      OnClick = btnLihatClick
    end
    inherited btnBaru: TcxButton
      OnClick = btnBaruClick
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    ExplicitWidth = 706
    Width = 706
    inherited btnRefresh: TcxButton
      Left = 626
      ExplicitLeft = 626
    end
    inherited EndDate: TcxDateEdit
      Left = 520
      ExplicitLeft = 520
    end
    inherited StartDate: TcxDateEdit
      Left = 395
      ExplicitLeft = 395
    end
    inherited cxLabel1: TcxLabel
      Left = 325
      ExplicitLeft = 169
      AnchorY = 18
    end
    inherited cxLabel2: TcxLabel
      Left = 498
      ExplicitLeft = 396
      AnchorY = 18
    end
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 192
    Top = 8
    PixelsPerInch = 96
    object styleNonActive: TcxStyle
      AssignedValues = [svColor]
      Color = clScrollBar
    end
  end
end
