inherited frmRekening: TfrmRekening
  Caption = 'Update Data Rekening'
  ClientHeight = 237
  ClientWidth = 450
  OnCreate = FormCreate
  ExplicitWidth = 466
  ExplicitHeight = 276
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 202
    TabOrder = 4
    ExplicitTop = 181
    ExplicitWidth = 450
    Width = 450
    inherited btnCancel: TcxButton
      Left = 365
      ExplicitLeft = 365
    end
    inherited btnPrint: TcxButton
      Left = 279
      ExplicitLeft = 279
    end
    inherited btnSave: TcxButton
      Left = 193
      OnClick = btnSaveClick
      ExplicitLeft = 193
    end
  end
  inherited Panel2: TPanel
    Top = 181
    Width = 450
    TabOrder = 5
    ExplicitLeft = -8
    ExplicitTop = 169
    ExplicitWidth = 450
    inherited lbEscape: TLabel
      Left = 370
      ExplicitLeft = 497
    end
    inherited lgndSave: TLabel
      Left = 205
      ExplicitLeft = 332
      ExplicitTop = 1
      ExplicitHeight = 16
    end
    inherited lgndPrint: TLabel
      Left = 292
      ExplicitLeft = 419
    end
  end
  object cxLabel1: TcxLabel
    Left = 31
    Top = 21
    Caption = 'Kode Rekening'
  end
  object edKode: TcxTextEdit
    Left = 109
    Top = 21
    Properties.CharCase = ecUpperCase
    TabOrder = 0
    Width = 232
  end
  object cxLabel2: TcxLabel
    Left = 28
    Top = 42
    Caption = 'Nama Rekening'
  end
  object edNama: TcxTextEdit
    Left = 109
    Top = 42
    Properties.CharCase = ecUpperCase
    TabOrder = 2
    Width = 292
  end
  object chkActive: TcxCheckBox
    Left = 347
    Top = 22
    TabStop = False
    Caption = 'Active'
    State = cbsChecked
    TabOrder = 1
  end
  object rbJenis: TcxRadioGroup
    Left = 56
    Top = 69
    Caption = ' Jenis Rekening '
    Properties.Items = <
      item
        Caption = 'Kas'
      end
      item
        Caption = 'Bank'
      end
      item
        Caption = 'Perantara'
      end>
    ItemIndex = 0
    TabOrder = 3
    Height = 94
    Width = 345
  end
end
