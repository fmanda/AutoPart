inherited frmUOM: TfrmUOM
  Caption = 'Update Data Satuan / UOM'
  ClientHeight = 189
  ClientWidth = 417
  ExplicitWidth = 433
  ExplicitHeight = 228
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel [0]
    Left = 38
    Top = 42
    Caption = 'Satuan'
  end
  object edUOM: TcxTextEdit [1]
    Left = 76
    Top = 41
    Properties.CharCase = ecUpperCase
    TabOrder = 0
    Width = 77
  end
  object cxLabel2: TcxLabel [2]
    Left = 27
    Top = 69
    Caption = 'Deskripsi'
  end
  object edDesc: TcxTextEdit [3]
    Left = 76
    Top = 68
    Properties.CharCase = ecUpperCase
    TabOrder = 1
    Width = 293
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 154
    TabOrder = 5
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
  inherited Panel2: TPanel
    Top = 133
    Width = 417
    TabOrder = 2
    ExplicitTop = 133
    ExplicitWidth = 417
    inherited lbEscape: TLabel
      Left = 337
      Height = 17
      ExplicitLeft = 337
    end
    inherited lgndSave: TLabel
      Left = 172
      Height = 17
      ExplicitLeft = 172
    end
    inherited lgndPrint: TLabel
      Left = 259
      Height = 17
      ExplicitLeft = 259
    end
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
