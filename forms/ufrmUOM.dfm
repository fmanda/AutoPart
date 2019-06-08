inherited frmUOM: TfrmUOM
  Caption = 'Update Data Satuan / UOM'
  ClientHeight = 189
  ClientWidth = 417
  OnCreate = FormCreate
  ExplicitWidth = 433
  ExplicitHeight = 228
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 154
    TabOrder = 3
    ExplicitTop = 154
    ExplicitWidth = 417
    Width = 417
    inherited btnCancel: TcxButton
      Left = 332
      ExplicitLeft = 332
    end
    inherited btnPrint: TcxButton
      Left = 246
      ExplicitLeft = 246
    end
    inherited btnSave: TcxButton
      Left = 160
      OnClick = btnSaveClick
      ExplicitLeft = 160
    end
  end
  object cxLabel1: TcxLabel
    Left = 38
    Top = 42
    Caption = 'Satuan'
  end
  object edUOM: TcxTextEdit
    Left = 76
    Top = 41
    Properties.CharCase = ecUpperCase
    TabOrder = 0
    Width = 77
  end
  object cxLabel2: TcxLabel
    Left = 27
    Top = 69
    Caption = 'Deskripsi'
  end
  object edDesc: TcxTextEdit
    Left = 76
    Top = 68
    Properties.CharCase = ecUpperCase
    TabOrder = 1
    Width = 293
  end
end
