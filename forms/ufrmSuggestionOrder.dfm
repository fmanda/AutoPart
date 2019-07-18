inherited frmSuggestionOrder: TfrmSuggestionOrder
  Caption = 'frmSuggestionOrder'
  ClientWidth = 782
  ExplicitWidth = 798
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    Width = 782
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Width = 782
    inherited btnTutup: TcxButton
      Left = 702
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
    ExplicitLeft = -345
    ExplicitWidth = 984
    Height = 67
    Width = 782
    object cxLabel3: TcxLabel
      Left = 16
      Top = 24
      Caption = 'Stock Per Tanggal'
    end
    object dtStock: TcxDateEdit
      Left = 110
      Top = 23
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      Width = 123
    end
    object ckGrupMerk: TcxCheckBox
      Left = 417
      Top = 22
      TabStop = False
      Caption = 'Tampilkan Merk && Group Barang'
      Properties.Alignment = taLeftJustify
      State = cbsChecked
      TabOrder = 2
    end
    object rbJenis: TcxRadioGroup
      Left = 254
      Top = 11
      Caption = ' Atas Penjualan '
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = '90 Hari'
        end
        item
          Caption = '30 Hari'
        end>
      ItemIndex = 0
      TabOrder = 3
      Height = 43
      Width = 139
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 424
    Top = 65528
    PixelsPerInch = 96
  end
end
