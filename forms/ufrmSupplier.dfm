inherited frmSupplier: TfrmSupplier
  Caption = 'Update Data Supplier'
  ClientHeight = 292
  ClientWidth = 484
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  ExplicitWidth = 500
  ExplicitHeight = 331
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 257
    TabOrder = 7
    ExplicitTop = 236
    ExplicitWidth = 484
    Width = 484
    inherited btnCancel: TcxButton
      Left = 399
      ExplicitLeft = 399
    end
    inherited btnPrint: TcxButton
      Left = 313
      ExplicitLeft = 313
    end
    inherited btnSave: TcxButton
      Left = 227
      OnClick = btnSaveClick
      ExplicitLeft = 227
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
    Top = 236
    Width = 484
    TabOrder = 8
    ExplicitTop = 241
    ExplicitWidth = 484
    inherited lbEscape: TLabel
      Left = 404
      ExplicitLeft = 497
    end
    inherited lgndSave: TLabel
      Left = 239
      ExplicitLeft = 332
      ExplicitTop = 1
      ExplicitHeight = 16
    end
    inherited lgndPrint: TLabel
      Left = 326
      ExplicitLeft = 419
    end
  end
  object cxLabel1: TcxLabel
    Left = 39
    Top = 22
    Caption = 'Kode Supplier'
  end
  object edKode: TcxTextEdit
    Left = 109
    Top = 21
    Properties.CharCase = ecUpperCase
    TabOrder = 0
    Width = 116
  end
  object cxLabel2: TcxLabel
    Left = 36
    Top = 42
    Caption = 'Nama Supplier'
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
    Top = 181
    Caption = 'Modified By'
  end
  object edModifiedBy: TcxTextEdit
    Left = 109
    Top = 181
    TabStop = False
    Properties.CharCase = ecUpperCase
    TabOrder = 6
    Width = 292
  end
  object lbModified: TcxLabel
    Left = 38
    Top = 160
    Caption = 'Date Modified'
  end
  object dtModified: TcxDateEdit
    Left = 109
    Top = 160
    TabStop = False
    TabOrder = 5
    Width = 292
  end
  object chkActive: TcxCheckBox
    Left = 347
    Top = 22
    TabStop = False
    Caption = 'Active'
    State = cbsChecked
    TabOrder = 14
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
  object crTempo: TcxSpinEdit
    Left = 109
    Top = 139
    TabOrder = 4
    Width = 133
  end
end
