inherited frmBrowsePurchaseInvoice: TfrmBrowsePurchaseInvoice
  Caption = 'Browse Faktur Pembelian'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
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
    inherited btnPrint: TcxButton
      Visible = True
      OnClick = btnPrintClick
    end
  end
  inherited cxGroupBox1: TcxGroupBox
    inherited EndDate: TcxDateEdit
      Visible = True
      ExplicitHeight = 25
    end
    inherited StartDate: TcxDateEdit
      Visible = True
      ExplicitHeight = 25
    end
    inherited cxLabel1: TcxLabel
      Visible = True
      ExplicitLeft = 260
      AnchorY = 18
    end
    inherited cxLabel2: TcxLabel
      Visible = True
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
