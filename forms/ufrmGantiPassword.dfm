inherited frmGantiPassword: TfrmGantiPassword
  Caption = 'Ganti Password'
  ClientHeight = 264
  ClientWidth = 364
  ExplicitWidth = 380
  ExplicitHeight = 303
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 229
    Width = 364
    inherited btnCancel: TcxButton
      Left = 279
    end
    inherited btnPrint: TcxButton
      Left = 193
    end
    inherited btnSave: TcxButton
      Left = 107
      OnClick = btnSaveClick
    end
  end
  inherited Panel2: TPanel
    Top = 208
    Width = 364
    inherited lbEscape: TLabel
      Left = 284
    end
    inherited lgndSave: TLabel
      Left = 119
    end
    inherited lgndPrint: TLabel
      Left = 206
    end
  end
  object edNewPass: TcxTextEdit [2]
    Left = 39
    Top = 79
    Properties.CharCase = ecUpperCase
    Properties.EchoMode = eemPassword
    Properties.PasswordChar = '*'
    TabOrder = 2
    Width = 232
  end
  object cxLabel3: TcxLabel [3]
    Left = 39
    Top = 63
    Caption = 'Password Baru'
  end
  object edNewPass2: TcxTextEdit [4]
    Left = 39
    Top = 122
    Properties.CharCase = ecUpperCase
    Properties.EchoMode = eemPassword
    Properties.PasswordChar = '*'
    TabOrder = 4
    Width = 232
  end
  object cxLabel4: TcxLabel [5]
    Left = 39
    Top = 104
    Caption = 'Ulangi Password'
  end
  object edOldPass: TcxTextEdit [6]
    Left = 39
    Top = 31
    Properties.CharCase = ecUpperCase
    Properties.EchoMode = eemPassword
    Properties.PasswordChar = '*'
    TabOrder = 6
    Width = 232
  end
  object cxLabel1: TcxLabel [7]
    Left = 39
    Top = 14
    Caption = 'Password Lama'
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
