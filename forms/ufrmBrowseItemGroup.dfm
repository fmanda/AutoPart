inherited frmBrowseItemGroup: TfrmBrowseItemGroup
  Caption = 'Browse Item Group'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGrid: TcxGrid
    inherited cxGrdMain: TcxGridServerModeTableView
      OptionsSelection.HideSelection = True
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    inherited btnHapus: TcxButton
      OnClick = btnHapusClick
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
    PixelsPerInch = 96
  end
end
