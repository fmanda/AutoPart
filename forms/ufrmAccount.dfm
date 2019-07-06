inherited frmAccount: TfrmAccount
  Caption = 'Data Account COA'
  ClientHeight = 342
  ClientWidth = 475
  OnCreate = FormCreate
  ExplicitWidth = 491
  ExplicitHeight = 381
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 307
    TabOrder = 7
    Width = 475
    inherited btnCancel: TcxButton
      Left = 390
    end
    inherited btnPrint: TcxButton
      Left = 304
    end
    inherited btnSave: TcxButton
      Left = 218
      OnClick = btnSaveClick
    end
  end
  inherited Panel2: TPanel
    Top = 286
    Width = 475
    TabOrder = 8
    ExplicitTop = 321
    inherited lbEscape: TLabel
      Left = 395
      Height = 17
    end
    inherited lgndSave: TLabel
      Left = 230
      Height = 17
    end
    inherited lgndPrint: TLabel
      Left = 317
      Height = 17
    end
  end
  object cxLabel1: TcxLabel
    Left = 45
    Top = 43
    Caption = 'Kode'
  end
  object edKode: TcxTextEdit
    Left = 77
    Top = 42
    Properties.CharCase = ecUpperCase
    TabOrder = 1
    Width = 145
  end
  object cxLabel2: TcxLabel
    Left = 42
    Top = 64
    Caption = 'Nama'
  end
  object edNama: TcxTextEdit
    Left = 77
    Top = 63
    TabOrder = 3
    Width = 292
  end
  object cxLookupAccount: TcxExtLookupComboBox
    Left = 77
    Top = 21
    TabOrder = 0
    Width = 292
  end
  object cxLabel3: TcxLabel
    Left = 42
    Top = 22
    Caption = 'Induk'
  end
  object chkActive: TcxCheckBox
    Left = 228
    Top = 42
    TabStop = False
    Caption = 'Active'
    State = cbsChecked
    TabOrder = 2
  end
  object chkCredit: TcxCheckBox
    Left = 77
    Top = 90
    TabStop = False
    Caption = 'Saldo Normal Credit'
    TabOrder = 4
  end
  object chkIsDetail: TcxCheckBox
    Left = 291
    Top = 90
    TabStop = False
    Caption = 'Akun Detail'
    TabOrder = 5
  end
  object rbJenis: TcxRadioGroup
    Left = 77
    Top = 125
    Caption = ' Tipe Akun '
    Properties.Items = <
      item
        Caption = 'Asset'
      end
      item
        Caption = 'Kewajiban'
      end
      item
        Caption = 'Pendapatan'
      end
      item
        Caption = 'Expense'
      end>
    ItemIndex = 0
    TabOrder = 6
    Height = 108
    Width = 292
  end
end
