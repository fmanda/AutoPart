inherited frmBrowseStockAdjustment: TfrmBrowseStockAdjustment
  Caption = 'Browse Stock Adjustment'
  ClientHeight = 482
  ClientWidth = 683
  ExplicitWidth = 699
  ExplicitHeight = 521
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGrid: TcxGrid
    Width = 683
    Height = 412
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 447
    Width = 683
    inherited btnTutup: TcxButton
      Left = 603
    end
    inherited btnHapus: TcxButton
      OnClick = btnHapusClick
    end
    inherited btnEdit: TcxButton
      Visible = False
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
    Width = 683
    inherited btnRefresh: TcxButton
      Left = 603
    end
    inherited EndDate: TcxDateEdit
      Left = 497
      Visible = True
      ExplicitHeight = 25
    end
    inherited StartDate: TcxDateEdit
      Left = 372
      Visible = True
      ExplicitHeight = 25
    end
    inherited cxLabel1: TcxLabel
      Left = 302
      Visible = True
      ExplicitLeft = 260
      AnchorY = 18
    end
    inherited cxLabel2: TcxLabel
      Left = 475
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
