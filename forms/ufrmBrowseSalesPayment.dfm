inherited frmBrowseSalesPayment: TfrmBrowseSalesPayment
  Caption = 'Browse Pembayaran Piutang'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGrid: TcxGrid
    Height = 343
    ExplicitHeight = 343
  end
  inherited cxGroupBox2: TcxGroupBox
    ExplicitTop = 378
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
  object chkFrontEnd: TcxCheckBox [3]
    AlignWithMargins = True
    Left = 3
    Top = 381
    TabStop = False
    Align = alBottom
    Caption = 'Tampilkan Pembayaran Faktur Front End'
    Properties.Alignment = taLeftJustify
    TabOrder = 3
    ExplicitLeft = 8
    ExplicitTop = 351
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
