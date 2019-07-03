inherited frmWarehouse: TfrmWarehouse
  Caption = 'Update Data Gudang / Warehouse'
  ClientHeight = 373
  ClientWidth = 495
  OnCreate = FormCreate
  ExplicitWidth = 511
  ExplicitHeight = 412
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 338
    TabOrder = 9
    ExplicitTop = 238
    ExplicitWidth = 502
    Width = 495
    inherited btnCancel: TcxButton
      Left = 410
      ExplicitLeft = 417
    end
    inherited btnPrint: TcxButton
      Left = 324
      ExplicitLeft = 331
    end
    inherited btnSave: TcxButton
      Left = 238
      OnClick = btnSaveClick
      ExplicitLeft = 245
    end
  end
  object cxLabel1: TcxLabel [1]
    Left = 38
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
    Left = 35
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
    TabOrder = 5
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
    Width = 289
  end
  inherited Panel2: TPanel
    Top = 317
    Width = 495
    TabOrder = 6
    ExplicitTop = 217
    ExplicitWidth = 502
    inherited lbEscape: TLabel
      Left = 415
      Height = 17
      ExplicitLeft = 422
    end
    inherited lgndSave: TLabel
      Left = 250
      Height = 17
      ExplicitLeft = 257
    end
    inherited lgndPrint: TLabel
      Left = 337
      Height = 17
      ExplicitLeft = 344
    end
  end
  object ckExternal: TcxCheckBox
    Left = 35
    Top = 221
    TabStop = False
    Caption = 'Gudang External / Cabang Lain'
    Properties.OnEditValueChanged = ckExternalPropertiesEditValueChanged
    State = cbsChecked
    TabOrder = 3
  end
  object cxLookupCabang: TcxExtLookupComboBox
    Left = 109
    Top = 248
    TabOrder = 4
    Width = 292
  end
  object cxLabel3: TcxLabel
    Left = 65
    Top = 249
    Caption = 'Cabang'
  end
end
