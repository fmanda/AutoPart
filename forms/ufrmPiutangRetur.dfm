inherited frmPiutangRetur: TfrmPiutangRetur
  Caption = 'Piutang Retur (Daftar Retur Customer yang belum terpotong)'
  ClientHeight = 539
  ClientWidth = 813
  ExplicitWidth = 829
  ExplicitHeight = 578
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    Width = 813
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 504
    Width = 813
    inherited btnTutup: TcxButton
      Left = 733
    end
    inherited btnExport: TcxButton
      OnClick = btnExportClick
    end
    inherited btnRefresh: TcxButton
      OnClick = btnRefreshClick
    end
  end
  object cxGroupBox3: TcxGroupBox [2]
    AlignWithMargins = True
    Left = 0
    Top = 38
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Caption = ' Report Parameter '
    TabOrder = 2
    ExplicitLeft = -153
    ExplicitWidth = 792
    Height = 59
    Width = 813
    object cxLabel3: TcxLabel
      Left = 38
      Top = 24
      Caption = 'Per Tanggal'
    end
    object dtRefDate: TcxDateEdit
      Left = 100
      Top = 23
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      Width = 130
    end
    object ckDueDate: TcxCheckBox
      Left = 513
      Top = 20
      TabStop = False
      Caption = 'Hanya tampilkan yang sudah jatuh tempo'
      Properties.Alignment = taLeftJustify
      State = cbsChecked
      TabOrder = 2
      Visible = False
    end
  end
  object cxGrid1: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 100
    Width = 807
    Height = 401
    Align = alClient
    TabOrder = 3
    ExplicitWidth = 786
    ExplicitHeight = 356
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      Styles.ContentOdd = styleOdd
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Data Hutang'
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 296
    Top = 8
    PixelsPerInch = 96
  end
end
