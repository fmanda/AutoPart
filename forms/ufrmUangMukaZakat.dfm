inherited frmUangMukaZakat: TfrmUangMukaZakat
  Caption = 'Pembayaran Uang Muka Zakat'
  ClientHeight = 271
  ClientWidth = 463
  ExplicitWidth = 479
  ExplicitHeight = 310
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 236
    TabOrder = 1
    ExplicitTop = 236
    ExplicitWidth = 463
    Width = 463
    inherited btnCancel: TcxButton
      Left = 378
      ExplicitLeft = 378
    end
    inherited btnPrint: TcxButton
      Left = 292
      ExplicitLeft = 292
    end
    inherited btnSave: TcxButton
      Left = 206
      OnClick = btnSaveClick
      ExplicitLeft = 206
    end
  end
  inherited Panel2: TPanel
    Top = 215
    Width = 463
    TabOrder = 7
    ExplicitTop = 215
    ExplicitWidth = 463
    inherited lbEscape: TLabel
      Left = 383
      Height = 17
      ExplicitLeft = 383
    end
    inherited lgndSave: TLabel
      Left = 218
      Height = 17
      ExplicitLeft = 218
    end
    inherited lgndPrint: TLabel
      Left = 305
      Height = 17
      ExplicitLeft = 305
    end
  end
  object cxLabel1: TcxLabel [2]
    Left = 44
    Top = 19
    Caption = 'No. Bukti'
  end
  object edRefno: TcxTextEdit [3]
    Left = 92
    Top = 18
    TabStop = False
    Properties.CharCase = ecUpperCase
    TabOrder = 0
    Width = 118
  end
  object cxLabel6: TcxLabel [4]
    Left = 48
    Top = 102
    Caption = 'Catatan'
  end
  object edNotes: TcxMemo [5]
    Left = 92
    Top = 100
    TabOrder = 6
    Height = 40
    Width = 259
  end
  object dtTransDate: TcxDateEdit [6]
    Left = 261
    Top = 18
    TabStop = False
    Properties.ImmediatePost = True
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 2
    Width = 90
  end
  object cxLabel8: TcxLabel [7]
    Left = 218
    Top = 19
    Caption = 'Tanggal'
  end
  object lbRekening: TcxLabel [8]
    Left = 20
    Top = 81
    Caption = 'Rekening Asal'
    Properties.Alignment.Horz = taRightJustify
    AnchorX = 91
  end
  object cxLookupRekening: TcxExtLookupComboBox [9]
    Left = 92
    Top = 80
    Properties.ImmediatePost = True
    TabOrder = 5
    Width = 259
  end
  object cxLabel2: TcxLabel [10]
    Left = 27
    Top = 40
    Caption = 'Tahun Zakat'
  end
  object spTahun: TcxSpinEdit [11]
    Left = 92
    Top = 39
    Properties.Alignment.Horz = taRightJustify
    TabOrder = 3
    Value = 2019
    Width = 72
  end
  object crAmount: TcxCurrencyEdit [12]
    Left = 92
    Top = 59
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.##;(,0.##)'
    TabOrder = 4
    Width = 121
  end
  object cxLabel3: TcxLabel [13]
    Left = 37
    Top = 60
    Caption = 'Nilai Bayar'
  end
  object cxMemo1: TcxMemo [14]
    AlignWithMargins = True
    Left = 3
    Top = 179
    Align = alBottom
    Enabled = False
    Lines.Strings = (
      
        '** Pembayaran Uang Muka Zakat sebagai pengurang nilai saat Entry' +
        ' Data Hutang Zakat')
    StyleDisabled.TextColor = clBlack
    TabOrder = 14
    Height = 33
    Width = 457
  end
  inherited styleRepo: TcxStyleRepository
    Left = 360
    Top = 440
    PixelsPerInch = 96
  end
end
