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
    Width = 439
    inherited btnCancel: TcxButton
      Left = 354
    end
    inherited btnPrint: TcxButton
      Left = 268
    end
    inherited btnSave: TcxButton
      Left = 182
      OnClick = btnSaveClick
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
