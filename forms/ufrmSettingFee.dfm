inherited frmSettingFee: TfrmSettingFee
  Caption = 'Update Komisi / Fee Salesman'
  ClientHeight = 211
  ClientWidth = 364
  OnCreate = FormCreate
  ExplicitWidth = 380
  ExplicitHeight = 250
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 176
    TabOrder = 8
    ExplicitTop = 176
    ExplicitWidth = 364
    Width = 364
    inherited btnCancel: TcxButton
      Left = 279
      ExplicitLeft = 279
    end
    inherited btnPrint: TcxButton
      Left = 193
      ExplicitLeft = 193
    end
    inherited btnSave: TcxButton
      Left = 107
      OnClick = btnSaveClick
      ExplicitLeft = 107
    end
  end
  inherited Panel2: TPanel
    Top = 155
    Width = 364
    TabOrder = 9
    ExplicitTop = 155
    ExplicitWidth = 364
    inherited lbEscape: TLabel
      Left = 284
      Height = 17
      ExplicitLeft = 284
    end
    inherited lgndSave: TLabel
      Left = 119
      Height = 17
      ExplicitLeft = 119
    end
    inherited lgndPrint: TLabel
      Left = 206
      Height = 17
      ExplicitLeft = 206
    end
  end
  object edNama: TcxTextEdit
    Left = 62
    Top = 21
    Properties.CharCase = ecUpperCase
    TabOrder = 0
    Width = 219
  end
  object cxLabel2: TcxLabel
    Left = 29
    Top = 22
    Caption = 'Nama'
  end
  object chkActive: TcxCheckBox
    Left = 283
    Top = 21
    TabStop = False
    Caption = 'Active'
    State = cbsChecked
    TabOrder = 1
  end
  object crFee1: TcxCurrencyEdit
    Left = 62
    Top = 43
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = ',0.00;(,0.00)'
    TabOrder = 2
    Width = 59
  end
  object cxLabel5: TcxLabel
    Left = 29
    Top = 44
    Caption = 'Fee 1'
  end
  object spTempo1: TcxSpinEdit
    Left = 213
    Top = 43
    TabOrder = 3
    Width = 68
  end
  object cxLabel7: TcxLabel
    Left = 152
    Top = 44
    Caption = 'Max Tempo'
  end
  object cxLabel1: TcxLabel
    Left = 123
    Top = 44
    Caption = '%'
  end
  object crFee2: TcxCurrencyEdit
    Left = 62
    Top = 64
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = ',0.00;(,0.00)'
    TabOrder = 4
    Width = 59
  end
  object cxLabel3: TcxLabel
    Left = 29
    Top = 65
    Caption = 'Fee 2'
  end
  object spTempo2: TcxSpinEdit
    Left = 213
    Top = 64
    TabOrder = 5
    Width = 68
  end
  object cxLabel4: TcxLabel
    Left = 152
    Top = 65
    Caption = 'Max Tempo'
  end
  object cxLabel6: TcxLabel
    Left = 123
    Top = 65
    Caption = '%'
  end
  object crFee3: TcxCurrencyEdit
    Left = 62
    Top = 85
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = ',0.00;(,0.00)'
    TabOrder = 6
    Width = 59
  end
  object cxLabel8: TcxLabel
    Left = 29
    Top = 86
    Caption = 'Fee 3'
  end
  object spTempo3: TcxSpinEdit
    Left = 213
    Top = 85
    TabOrder = 7
    Width = 68
  end
  object cxLabel9: TcxLabel
    Left = 152
    Top = 86
    Caption = 'Max Tempo'
  end
  object cxLabel10: TcxLabel
    Left = 123
    Top = 86
    Caption = '%'
  end
  object cxLabel11: TcxLabel
    Left = 0
    Top = 135
    Anchors = [akLeft, akBottom]
    Caption = 
      '* ctt : Pelunasan melebihi tempo maksimal akan menyebabkan fee h' +
      'angus'
    Style.TextStyle = [fsItalic]
  end
end
