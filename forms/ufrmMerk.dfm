inherited frmMerk: TfrmMerk
  Caption = 'Update Merk'
  ClientHeight = 144
  ClientWidth = 439
  OnCreate = FormCreate
  ExplicitWidth = 455
  ExplicitHeight = 183
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 109
    ExplicitTop = 88
    ExplicitWidth = 439
    Width = 439
    inherited btnCancel: TcxButton
      Left = 354
      ExplicitLeft = 354
    end
    inherited btnPrint: TcxButton
      Left = 268
      ExplicitLeft = 268
    end
    inherited btnSave: TcxButton
      Left = 182
      OnClick = btnSaveClick
      ExplicitLeft = 182
    end
  end
  inherited Panel2: TPanel
    Top = 88
    Width = 439
    ExplicitLeft = 8
    ExplicitTop = 76
    ExplicitWidth = 439
    inherited lbEscape: TLabel
      Left = 359
      ExplicitLeft = 497
    end
    inherited lgndSave: TLabel
      Left = 194
      ExplicitLeft = 332
      ExplicitTop = 1
      ExplicitHeight = 16
    end
    inherited lgndPrint: TLabel
      Left = 281
      ExplicitLeft = 419
    end
  end
  object cxLabel1: TcxLabel
    Left = 34
    Top = 26
    Caption = 'Kode'
  end
  object edKode: TcxTextEdit
    Left = 68
    Top = 25
    Properties.CharCase = ecUpperCase
    TabOrder = 2
    Width = 77
  end
  object cxLabel2: TcxLabel
    Left = 31
    Top = 53
    Caption = 'Nama'
  end
  object edNama: TcxTextEdit
    Left = 68
    Top = 52
    Properties.CharCase = ecUpperCase
    TabOrder = 4
    Width = 293
  end
end
