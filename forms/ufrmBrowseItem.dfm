inherited frmBrowseItem: TfrmBrowseItem
  Caption = 'Browse Data Barang'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    inherited btnEdit: TcxButton
      OnClick = btnEditClick
    end
    inherited btnLihat: TcxButton
      Visible = True
      OnClick = btnLihatClick
    end
    inherited btnBaru: TcxButton
      OnClick = btnBaruClick
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    inherited EndDate: TcxDateEdit
      ExplicitHeight = 25
    end
    inherited StartDate: TcxDateEdit
      ExplicitHeight = 25
    end
    inherited cxLabel1: TcxLabel
      ExplicitLeft = 260
      AnchorY = 18
    end
    inherited cxLabel2: TcxLabel
      ExplicitLeft = 433
      AnchorY = 18
    end
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
