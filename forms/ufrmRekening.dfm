inherited frmRekening: TfrmRekening
  Caption = 'Update Data Rekening'
  ClientHeight = 369
  ClientWidth = 452
  ExplicitWidth = 468
  ExplicitHeight = 408
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 334
    TabOrder = 4
    ExplicitTop = 202
    ExplicitWidth = 450
    Width = 452
    inherited btnCancel: TcxButton
      Left = 367
      ExplicitLeft = 365
    end
    inherited btnPrint: TcxButton
      Left = 281
      ExplicitLeft = 279
    end
    inherited btnSave: TcxButton
      Left = 195
      OnClick = btnSaveClick
      ExplicitLeft = 193
    end
  end
  inherited Panel2: TPanel
    Top = 313
    Width = 452
    TabOrder = 5
    ExplicitTop = 181
    ExplicitWidth = 450
    inherited lbEscape: TLabel
      Left = 372
      Height = 17
      ExplicitLeft = 370
    end
    inherited lgndSave: TLabel
      Left = 207
      Height = 17
      ExplicitLeft = 205
    end
    inherited lgndPrint: TLabel
      Left = 294
      Height = 17
      ExplicitLeft = 292
    end
  end
  object cxLabel1: TcxLabel [2]
    Left = 31
    Top = 21
    Caption = 'Kode Rekening'
  end
  object edKode: TcxTextEdit [3]
    Left = 109
    Top = 21
    Properties.CharCase = ecUpperCase
    TabOrder = 0
    Width = 232
  end
  object cxLabel2: TcxLabel [4]
    Left = 28
    Top = 42
    Caption = 'Nama Rekening'
  end
  object edNama: TcxTextEdit [5]
    Left = 109
    Top = 42
    Properties.CharCase = ecUpperCase
    TabOrder = 2
    Width = 292
  end
  object chkActive: TcxCheckBox [6]
    Left = 347
    Top = 22
    TabStop = False
    Caption = 'Active'
    State = cbsChecked
    TabOrder = 1
  end
  object rbJenis: TcxRadioGroup [7]
    Left = 28
    Top = 189
    Caption = ' Jenis Rekening '
    Properties.Items = <
      item
        Caption = 'Kas'
      end
      item
        Caption = 'Bank'
      end
      item
        Caption = 'Perantara'
      end>
    ItemIndex = 0
    TabOrder = 3
    Height = 94
    Width = 345
  end
  object cxLabel3: TcxLabel [8]
    Left = 60
    Top = 65
    Caption = 'Account'
  end
  object cxLookupCOA: TcxExtLookupComboBox [9]
    Left = 109
    Top = 64
    TabOrder = 9
    Width = 292
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
