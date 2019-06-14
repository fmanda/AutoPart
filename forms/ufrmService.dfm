inherited frmService: TfrmService
  Caption = 'Update Data Service'
  ClientHeight = 198
  ClientWidth = 468
  OnCreate = FormCreate
  ExplicitWidth = 484
  ExplicitHeight = 237
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 163
    TabOrder = 7
    ExplicitTop = 142
    ExplicitWidth = 468
    Width = 468
    inherited btnCancel: TcxButton
      Left = 383
      ExplicitLeft = 383
    end
    inherited btnPrint: TcxButton
      Left = 297
      ExplicitLeft = 297
    end
    inherited btnSave: TcxButton
      Left = 211
      OnClick = btnSaveClick
      ExplicitLeft = 211
    end
  end
  inherited Panel2: TPanel
    Top = 142
    Width = 468
    TabOrder = 8
    ExplicitLeft = 8
    ExplicitTop = 125
    ExplicitWidth = 468
    inherited lbEscape: TLabel
      Left = 388
      ExplicitLeft = 497
    end
    inherited lgndSave: TLabel
      Left = 223
      ExplicitLeft = 332
      ExplicitTop = 1
      ExplicitHeight = 16
    end
    inherited lgndPrint: TLabel
      Left = 310
      ExplicitLeft = 419
    end
  end
  object cxLabel1: TcxLabel
    Left = 44
    Top = 16
    Caption = 'Kode'
  end
  object edKode: TcxTextEdit
    Left = 76
    Top = 15
    Properties.CharCase = ecUpperCase
    TabOrder = 0
    Width = 145
  end
  object cxLabel2: TcxLabel
    Left = 41
    Top = 37
    Caption = 'Nama'
  end
  object edNama: TcxTextEdit
    Left = 76
    Top = 36
    Properties.CharCase = ecUpperCase
    TabOrder = 1
    Width = 343
  end
  object crPPN: TcxCurrencyEdit
    Left = 76
    Top = 103
    TabStop = False
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = ',0.00;(,0.00)'
    TabOrder = 4
    Width = 109
  end
  object cxLabel7: TcxLabel
    Left = 27
    Top = 104
    Caption = 'PPN (%)'
  end
  object lbModifiedBy: TcxLabel
    Left = 211
    Top = 102
    Caption = 'Modified By'
  end
  object edModifiedBy: TcxTextEdit
    Left = 274
    Top = 102
    TabStop = False
    Properties.CharCase = ecUpperCase
    TabOrder = 6
    Width = 145
  end
  object lbModified: TcxLabel
    Left = 200
    Top = 81
    Caption = 'Date Modified'
  end
  object dtModified: TcxDateEdit
    Left = 274
    Top = 80
    TabStop = False
    TabOrder = 5
    Width = 145
  end
  object chkActive: TcxCheckBox
    Left = 227
    Top = 15
    TabStop = False
    Caption = 'Active'
    State = cbsChecked
    TabOrder = 13
  end
  object crBiaya: TcxCurrencyEdit
    Left = 76
    Top = 80
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = ',0.00;(,0.00)'
    TabOrder = 3
    Width = 109
  end
  object cxLabel3: TcxLabel
    Left = 42
    Top = 81
    Caption = 'Biaya'
  end
  object cxLabel4: TcxLabel
    Left = 34
    Top = 59
    Caption = 'Satuan'
  end
  object cxLookupUOM: TcxExtLookupComboBox
    Left = 76
    Top = 58
    TabOrder = 2
    Width = 109
  end
end
