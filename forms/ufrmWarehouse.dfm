inherited frmWarehouse: TfrmWarehouse
  Caption = 'Update Data Gudang / Warehouse'
  ClientHeight = 273
  ClientWidth = 502
  OnCreate = FormCreate
  ExplicitWidth = 518
  ExplicitHeight = 312
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 238
    TabOrder = 4
    Width = 502
    inherited btnCancel: TcxButton
      Left = 417
    end
    inherited btnPrint: TcxButton
      Left = 331
    end
    inherited btnSave: TcxButton
      Left = 245
      OnClick = btnSaveClick
    end
  end
  object cxLabel1: TcxLabel
    Left = 35
    Top = 22
    Caption = 'Kode Gudang'
  end
  object edKode: TcxTextEdit
    Left = 109
    Top = 21
    Properties.CharCase = ecUpperCase
    TabOrder = 0
    Width = 116
  end
  object cxLabel2: TcxLabel
    Left = 32
    Top = 43
    Caption = 'Nama Gudang'
  end
  object edNama: TcxTextEdit
    Left = 109
    Top = 42
    Properties.CharCase = ecUpperCase
    TabOrder = 1
    Width = 292
  end
  object chkActive: TcxCheckBox
    Left = 347
    Top = 22
    TabStop = False
    Caption = 'Active'
    State = cbsChecked
    TabOrder = 3
  end
  object rbJenis: TcxRadioGroup
    Left = 109
    Top = 66
    Caption = ' Jenis Gudang '
    Properties.Items = <
      item
        Caption = 'Barang Baik'
      end
      item
        Caption = 'Barang Rusak'
      end
      item
        Caption = 'Barang Promosi'
      end
      item
        Caption = 'Transit'
      end>
    ItemIndex = 0
    TabOrder = 2
    Height = 127
    Width = 292
  end
end
