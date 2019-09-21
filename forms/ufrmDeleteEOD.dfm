inherited frmDeleteEndOfDay: TfrmDeleteEndOfDay
  Caption = 'Hapus End Of Day'
  ClientHeight = 116
  ClientWidth = 277
  ExplicitWidth = 293
  ExplicitHeight = 155
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 81
    Width = 277
    inherited btnCancel: TcxButton
      Left = 192
    end
    inherited btnPrint: TcxButton
      Left = 106
    end
    inherited btnSave: TcxButton
      Left = 20
      Caption = '&Delete'
      OptionsImage.ImageIndex = 3
      OnClick = btnSaveClick
    end
  end
  inherited Panel2: TPanel
    Top = 60
    Width = 277
    inherited lbEscape: TLabel
      Left = 197
      Height = 17
    end
    inherited lgndSave: TLabel
      Left = 32
      Height = 17
      Caption = 'Alt+D [Delete]'
      ExplicitLeft = 338
    end
    inherited lgndPrint: TLabel
      Left = 119
      Height = 17
    end
  end
  object dtEOD: TcxDateEdit [2]
    Left = 105
    Top = 16
    TabStop = False
    ParentFont = False
    Properties.ImmediatePost = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 2
    Width = 101
  end
  object cxLabel8: TcxLabel [3]
    Left = 27
    Top = 18
    Caption = 'Tanggal EOD'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
