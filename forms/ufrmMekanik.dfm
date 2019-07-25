inherited frmMekanik: TfrmMekanik
  Caption = 'Update Data Mekanik'
  ClientHeight = 246
  ClientWidth = 465
  ExplicitWidth = 481
  ExplicitHeight = 285
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 211
    TabOrder = 5
    ExplicitTop = 211
    ExplicitWidth = 465
    Width = 465
    inherited btnCancel: TcxButton
      Left = 380
      ExplicitLeft = 380
    end
    inherited btnPrint: TcxButton
      Left = 294
      ExplicitLeft = 294
    end
    inherited btnSave: TcxButton
      Left = 208
      OnClick = btnSaveClick
      ExplicitLeft = 208
    end
  end
  inherited Panel2: TPanel
    Top = 190
    Width = 465
    TabOrder = 6
    ExplicitWidth = 465
    inherited lbEscape: TLabel
      Left = 385
      Height = 17
      ExplicitLeft = 385
    end
    inherited lgndSave: TLabel
      Left = 220
      Height = 17
      ExplicitLeft = 220
    end
    inherited lgndPrint: TLabel
      Left = 307
      Height = 17
      ExplicitLeft = 307
    end
  end
  object cxLabel1: TcxLabel [2]
    Left = 39
    Top = 21
    Caption = 'Kode Mekanik'
  end
  object edKode: TcxTextEdit [3]
    Left = 109
    Top = 21
    Properties.CharCase = ecUpperCase
    TabOrder = 0
    Width = 116
  end
  object cxLabel2: TcxLabel [4]
    Left = 36
    Top = 42
    Caption = 'Nama Mekanik'
  end
  object edNama: TcxTextEdit [5]
    Left = 109
    Top = 42
    Properties.CharCase = ecUpperCase
    TabOrder = 2
    Width = 292
  end
  object cxLabel6: TcxLabel [6]
    Left = 28
    Top = 63
    Caption = 'Alamat Lengkap'
  end
  object edAlamat: TcxMemo [7]
    Left = 109
    Top = 63
    Properties.CharCase = ecUpperCase
    TabOrder = 3
    Height = 55
    Width = 292
  end
  object chkActive: TcxCheckBox [8]
    Left = 347
    Top = 22
    TabStop = False
    Caption = 'Active'
    State = cbsChecked
    TabOrder = 1
  end
  object cxLabel4: TcxLabel [9]
    Left = 46
    Top = 118
    Caption = 'No. Telepon'
  end
  object edTelp: TcxTextEdit [10]
    Left = 109
    Top = 118
    Properties.CharCase = ecUpperCase
    TabOrder = 4
    Width = 133
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
