inherited frmCustomer: TfrmCustomer
  Caption = 'Update Data Pelanggan'
  ClientHeight = 352
  ClientWidth = 491
  KeyPreview = True
  OnKeyDown = FormKeyDown
  ExplicitWidth = 507
  ExplicitHeight = 391
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 317
    TabOrder = 9
    ExplicitTop = 317
    ExplicitWidth = 491
    Width = 491
    inherited btnCancel: TcxButton
      Left = 406
      ExplicitLeft = 406
    end
    inherited btnPrint: TcxButton
      Left = 320
      ExplicitLeft = 320
    end
    inherited btnSave: TcxButton
      Left = 234
      OnClick = btnSaveClick
      ExplicitLeft = 234
    end
    object cxLabel3: TcxLabel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Align = alLeft
      Caption = '[F5] Generate Kode'
      Properties.Alignment.Vert = taVCenter
      AnchorY = 18
    end
  end
  inherited Panel2: TPanel
    Top = 296
    Width = 491
    TabOrder = 10
    ExplicitTop = 296
    ExplicitWidth = 491
    inherited lbEscape: TLabel
      Left = 411
      Height = 17
      ExplicitLeft = 411
    end
    inherited lgndSave: TLabel
      Left = 246
      Height = 17
      ExplicitLeft = 246
    end
    inherited lgndPrint: TLabel
      Left = 333
      Height = 17
      ExplicitLeft = 333
    end
  end
  object cxLabel1: TcxLabel [2]
    Left = 31
    Top = 21
    Caption = 'Kode Customer'
  end
  object edKode: TcxTextEdit [3]
    Left = 109
    Top = 21
    Properties.CharCase = ecUpperCase
    TabOrder = 0
    Width = 116
  end
  object cxLabel2: TcxLabel [4]
    Left = 28
    Top = 42
    Caption = 'Nama Customer'
  end
  object edNama: TcxTextEdit [5]
    Left = 109
    Top = 42
    Properties.CharCase = ecUpperCase
    TabOrder = 1
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
    TabOrder = 2
    Height = 55
    Width = 292
  end
  object cxLabel7: TcxLabel [8]
    Left = 42
    Top = 140
    Caption = 'Tempo (Hari)'
  end
  object lbModifiedBy: TcxLabel [9]
    Left = 49
    Top = 229
    Caption = 'Modified By'
  end
  object edModifiedBy: TcxTextEdit [10]
    Left = 109
    Top = 229
    TabStop = False
    Properties.CharCase = ecUpperCase
    TabOrder = 8
    Width = 292
  end
  object lbModified: TcxLabel [11]
    Left = 38
    Top = 208
    Caption = 'Date Modified'
  end
  object dtModified: TcxDateEdit [12]
    Left = 109
    Top = 208
    TabStop = False
    TabOrder = 7
    Width = 292
  end
  object chkActive: TcxCheckBox [13]
    Left = 347
    Top = 22
    TabStop = False
    Caption = 'Active'
    State = cbsChecked
    TabOrder = 16
  end
  object cxLabel4: TcxLabel [14]
    Left = 46
    Top = 118
    Caption = 'No. Telepon'
  end
  object edTelp: TcxTextEdit [15]
    Left = 109
    Top = 118
    Properties.CharCase = ecUpperCase
    TabOrder = 3
    Width = 133
  end
  object rbHarga: TcxRadioGroup [16]
    Left = 109
    Top = 160
    Caption = ' Default Harga '
    Properties.Columns = 4
    Properties.Items = <
      item
        Caption = 'Umum'
      end
      item
        Caption = 'Bengkel'
      end
      item
        Caption = 'Grosir'
      end
      item
        Caption = 'Keliling'
      end>
    ItemIndex = 0
    TabOrder = 6
    Height = 44
    Width = 292
  end
  object crTempo: TcxSpinEdit [17]
    Left = 109
    Top = 139
    TabOrder = 4
    Width = 84
  end
  object crCreditLimit: TcxCurrencyEdit [18]
    Left = 294
    Top = 139
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = ',0.00;(,0.00)'
    TabOrder = 5
    Width = 107
  end
  object cxLabel5: TcxLabel [19]
    Left = 234
    Top = 140
    Caption = 'Credit Limit'
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
