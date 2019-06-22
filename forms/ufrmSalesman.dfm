inherited frmSalesman: TfrmSalesman
  Caption = 'Update Data Salesman'
  ClientHeight = 239
  ClientWidth = 477
  OnCreate = FormCreate
  ExplicitWidth = 493
  ExplicitHeight = 278
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 204
    TabOrder = 5
    Width = 477
    inherited btnCancel: TcxButton
      Left = 392
    end
    inherited btnPrint: TcxButton
      Left = 306
    end
    inherited btnSave: TcxButton
      Left = 220
      OnClick = btnSaveClick
    end
  end
  inherited Panel2: TPanel
    Top = 183
    Width = 477
    TabOrder = 6
    ExplicitTop = 321
    inherited lbEscape: TLabel
      Left = 397
      Height = 17
    end
    inherited lgndSave: TLabel
      Left = 232
      Height = 17
    end
    inherited lgndPrint: TLabel
      Left = 319
      Height = 17
    end
  end
  object cxLabel1: TcxLabel
    Left = 31
    Top = 21
    Caption = 'Kode Salesman'
  end
  object edKode: TcxTextEdit
    Left = 109
    Top = 21
    Properties.CharCase = ecUpperCase
    TabOrder = 0
    Width = 116
  end
  object cxLabel2: TcxLabel
    Left = 28
    Top = 42
    Caption = 'Nama Salesman'
  end
  object edNama: TcxTextEdit
    Left = 109
    Top = 42
    Properties.CharCase = ecUpperCase
    TabOrder = 2
    Width = 292
  end
  object cxLabel6: TcxLabel
    Left = 28
    Top = 63
    Caption = 'Alamat Lengkap'
  end
  object edAlamat: TcxMemo
    Left = 109
    Top = 63
    Properties.CharCase = ecUpperCase
    TabOrder = 3
    Height = 55
    Width = 292
  end
  object chkActive: TcxCheckBox
    Left = 347
    Top = 22
    TabStop = False
    Caption = 'Active'
    State = cbsChecked
    TabOrder = 1
  end
  object cxLabel4: TcxLabel
    Left = 46
    Top = 118
    Caption = 'No. Telepon'
  end
  object edTelp: TcxTextEdit
    Left = 109
    Top = 118
    Properties.CharCase = ecUpperCase
    TabOrder = 4
    Width = 133
  end
end
