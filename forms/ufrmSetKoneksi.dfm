inherited frmSetKoneksi: TfrmSetKoneksi
  Caption = 'Setting Koneksi Server'
  ClientHeight = 198
  ClientWidth = 389
  Position = poDesktopCenter
  ExplicitWidth = 405
  ExplicitHeight = 237
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 163
    Align = alBottom
    PanelStyle.Active = True
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    TabOrder = 0
    Height = 35
    Width = 389
    object btnTutup: TcxButton
      AlignWithMargins = True
      Left = 309
      Top = 5
      Width = 75
      Height = 25
      Align = alRight
      Caption = '&Tutup'
      OptionsImage.ImageIndex = 32
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 0
      OnClick = btnTutupClick
    end
    object btnTest: TcxButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 108
      Height = 25
      Align = alLeft
      Caption = 'Test Koneksi'
      OptionsImage.ImageIndex = 5
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 1
      OnClick = btnTestClick
    end
    object btnSave: TcxButton
      AlignWithMargins = True
      Left = 119
      Top = 5
      Width = 120
      Height = 25
      Align = alLeft
      Caption = '&Simpan Koneksi'
      OptionsImage.ImageIndex = 28
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 2
      OnClick = btnSaveClick
    end
  end
  object cxLabel1: TcxLabel
    Left = 62
    Top = 24
    Caption = 'Server'
  end
  object txtServer: TcxTextEdit
    Left = 100
    Top = 23
    TabOrder = 2
    Text = '127.0.0.1'
    Width = 181
  end
  object cxLabel2: TcxLabel
    Left = 48
    Top = 51
    Caption = 'Database'
  end
  object txtDatabase: TcxTextEdit
    Left = 100
    Top = 50
    TabOrder = 4
    Text = 'autopart'
    Width = 181
  end
  object cxLabel3: TcxLabel
    Left = 72
    Top = 78
    Caption = 'User'
  end
  object txtUser: TcxTextEdit
    Left = 100
    Top = 77
    TabOrder = 6
    Text = 'sa'
    Width = 121
  end
  object cxLabel4: TcxLabel
    Left = 48
    Top = 105
    Caption = 'Password'
  end
  object txtPassword: TcxTextEdit
    Left = 100
    Top = 104
    Properties.EchoMode = eemPassword
    Properties.PasswordChar = '*'
    TabOrder = 8
    Text = 'masterkey'
    Width = 121
  end
end
