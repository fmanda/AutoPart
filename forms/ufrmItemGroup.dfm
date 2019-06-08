inherited frmItemGroup: TfrmItemGroup
  Caption = 'Update Item Group'
  ClientHeight = 146
  ClientWidth = 418
  OnCreate = FormCreate
  ExplicitWidth = 434
  ExplicitHeight = 185
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 111
    Width = 418
    inherited btnCancel: TcxButton
      Left = 333
    end
    inherited btnPrint: TcxButton
      Left = 247
    end
    inherited btnSave: TcxButton
      Left = 161
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
