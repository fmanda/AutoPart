inherited frmBrowseSalesman: TfrmBrowseSalesman
  Caption = 'Browse Salesman'
  ExplicitTop = -23
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    inherited btnHapus: TcxButton
      OnClick = btnHapusClick
    end
    inherited btnEdit: TcxButton
      OnClick = btnEditClick
      ExplicitTop = 3
    end
    inherited btnLihat: TcxButton
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
