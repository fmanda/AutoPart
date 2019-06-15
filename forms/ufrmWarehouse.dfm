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
    TabOrder = 7
    ExplicitTop = 238
    ExplicitWidth = 502
    Width = 502
    inherited btnCancel: TcxButton
      Left = 417
      ExplicitLeft = 417
    end
    inherited btnPrint: TcxButton
      Left = 331
      ExplicitLeft = 331
    end
    inherited btnSave: TcxButton
      Left = 245
      OnClick = btnSaveClick
      ExplicitLeft = 245
    end
  end
  object cxLabel1: TcxLabel [1]
    Left = 35
    Top = 22
    Caption = 'Kode Gudang'
  end
  object edKode: TcxTextEdit [2]
    Left = 109
    Top = 21
    Properties.CharCase = ecUpperCase
    TabOrder = 0
    Width = 116
  end
  object cxLabel2: TcxLabel [3]
    Left = 32
    Top = 43
    Caption = 'Nama Gudang'
  end
  object edNama: TcxTextEdit [4]
    Left = 109
    Top = 42
    Properties.CharCase = ecUpperCase
    TabOrder = 1
    Width = 292
  end
  object chkActive: TcxCheckBox [5]
    Left = 347
    Top = 22
    TabStop = False
    Caption = 'Active'
    State = cbsChecked
    TabOrder = 3
  end
  object rbJenis: TcxRadioGroup [6]
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
  inherited Panel2: TPanel
    Top = 217
    Width = 502
    TabOrder = 4
    ExplicitTop = 217
    ExplicitWidth = 502
    inherited lbEscape: TLabel
      Left = 422
      Height = 17
    end
    inherited lgndSave: TLabel
      Left = 257
      Height = 17
    end
    inherited lgndPrint: TLabel
      Left = 344
      Height = 17
    end
  end
end
