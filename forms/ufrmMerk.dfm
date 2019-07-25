inherited frmMerk: TfrmMerk
  Caption = 'Update Merk'
  ClientHeight = 144
  ClientWidth = 439
  ExplicitWidth = 455
  ExplicitHeight = 183
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 109
    ExplicitTop = 109
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
    ExplicitTop = 88
    ExplicitWidth = 439
    inherited lbEscape: TLabel
      Left = 359
      Height = 17
    end
    inherited lgndSave: TLabel
      Left = 194
      Height = 17
    end
    inherited lgndPrint: TLabel
      Left = 281
      Height = 17
    end
  end
  object cxLabel1: TcxLabel [2]
    Left = 34
    Top = 26
    Caption = 'Kode'
  end
  object edKode: TcxTextEdit [3]
    Left = 68
    Top = 25
    Properties.CharCase = ecUpperCase
    TabOrder = 2
    Width = 77
  end
  object cxLabel2: TcxLabel [4]
    Left = 31
    Top = 53
    Caption = 'Nama'
  end
  object edNama: TcxTextEdit [5]
    Left = 68
    Top = 52
    Properties.CharCase = ecUpperCase
    TabOrder = 4
    Width = 293
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
