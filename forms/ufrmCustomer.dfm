inherited frmCustomer: TfrmCustomer
  Caption = 'Update Data Pelanggan'
  ClientHeight = 349
  ClientWidth = 491
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  ExplicitWidth = 507
  ExplicitHeight = 388
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 314
    TabOrder = 8
    ExplicitTop = 314
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
    Top = 293
    Width = 491
    TabOrder = 9
    inherited lbEscape: TLabel
      Left = 411
      Height = 17
    end
    inherited lgndSave: TLabel
      Left = 246
      Height = 17
    end
    inherited lgndPrint: TLabel
      Left = 333
      Height = 17
    end
  end
  object cxLabel1: TcxLabel
    Left = 31
    Top = 21
    Caption = 'Kode Customer'
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
    Caption = 'Nama Customer'
  end
  object edNama: TcxTextEdit
    Left = 109
    Top = 42
    Properties.CharCase = ecUpperCase
    TabOrder = 1
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
    TabOrder = 2
    Height = 55
    Width = 292
  end
  object cxLabel7: TcxLabel
    Left = 42
    Top = 140
    Caption = 'Tempo (Hari)'
  end
  object lbModifiedBy: TcxLabel
    Left = 49
    Top = 229
    Caption = 'Modified By'
  end
  object edModifiedBy: TcxTextEdit
    Left = 109
    Top = 229
    TabStop = False
    Properties.CharCase = ecUpperCase
    TabOrder = 7
    Width = 292
  end
  object lbModified: TcxLabel
    Left = 38
    Top = 208
    Caption = 'Date Modified'
  end
  object dtModified: TcxDateEdit
    Left = 109
    Top = 208
    TabStop = False
    TabOrder = 6
    Width = 292
  end
  object chkActive: TcxCheckBox
    Left = 347
    Top = 22
    TabStop = False
    Caption = 'Active'
    State = cbsChecked
    TabOrder = 15
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
    TabOrder = 3
    Width = 133
  end
  object rbHarga: TcxRadioGroup
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
    TabOrder = 5
    Height = 44
    Width = 292
  end
  object crTempo: TcxSpinEdit
    Left = 109
    Top = 139
    TabOrder = 4
    Width = 133
  end
end
