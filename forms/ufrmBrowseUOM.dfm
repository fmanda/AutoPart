inherited frmBrowseUOM: TfrmBrowseUOM
  Caption = 'Browse Data Satuan'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    inherited btnHapus: TcxButton
      Visible = False
    end
    inherited btnEdit: TcxButton
      OnClick = btnEditClick
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
      AnchorY = 18
    end
    inherited cxLabel2: TcxLabel
      AnchorY = 18
    end
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 176
    Top = 184
    PixelsPerInch = 96
  end
end
