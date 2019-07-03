inherited frmDialogPayment: TfrmDialogPayment
  BorderStyle = bsNone
  Caption = 'Dialog Pembayaran'
  ClientHeight = 243
  ClientWidth = 477
  FormStyle = fsStayOnTop
  KeyPreview = True
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  ExplicitWidth = 477
  ExplicitHeight = 243
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel2: TcxLabel
    Left = 40
    Top = 63
    Anchors = [akTop, akRight]
    Caption = 'Nilai yg Harus Dibayar'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    ExplicitLeft = 24
  end
  object cxLabel5: TcxLabel
    Left = 82
    Top = 96
    Anchors = [akTop, akRight]
    Caption = 'NILAI BAYAR'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -17
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taRightJustify
    ExplicitLeft = 66
    AnchorX = 186
  end
  object crBayar: TcxCurrencyEdit
    Left = 192
    Top = 91
    Anchors = [akTop, akRight]
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.##;(,0.##)'
    Properties.ReadOnly = False
    Properties.OnChange = crBayarPropertiesChange
    Properties.OnValidate = crBayarPropertiesValidate
    Style.Color = clMoneyGreen
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -24
    Style.Font.Name = 'Consolas'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    ExplicitLeft = 176
    Width = 274
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 190
    Align = alBottom
    PanelStyle.Active = True
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    TabOrder = 3
    ExplicitTop = 450
    ExplicitWidth = 618
    Height = 53
    Width = 477
    object btnCancel: TcxButton
      AlignWithMargins = True
      Left = 392
      Top = 5
      Width = 80
      Height = 43
      Align = alRight
      Caption = 'Ba&tal'
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 1
      TabStop = False
      OnClick = btnCancelClick
      ExplicitLeft = 533
    end
    object btnSave: TcxButton
      AlignWithMargins = True
      Left = 267
      Top = 5
      Width = 119
      Height = 43
      Align = alRight
      Caption = '&Bayar && &Simpan'
      OptionsImage.ImageIndex = 1
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 0
      OnClick = btnSaveClick
      ExplicitLeft = 408
    end
  end
  object crTotal: TcxCurrencyEdit
    Left = 192
    Top = 55
    TabStop = False
    Anchors = [akTop, akRight]
    EditValue = 0.000000000000000000
    Enabled = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.##;(,0.##)'
    Properties.ReadOnly = True
    Style.Color = clMoneyGreen
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -24
    Style.Font.Name = 'Consolas'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    StyleDisabled.Color = clInfoBk
    StyleDisabled.TextColor = clDefault
    TabOrder = 0
    ExplicitLeft = 176
    Width = 274
  end
  object cxLabel1: TcxLabel
    Left = 105
    Top = 133
    Anchors = [akTop, akRight]
    Caption = 'Kembalian'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -17
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taRightJustify
    ExplicitLeft = 89
    AnchorX = 186
  end
  object crKembali: TcxCurrencyEdit
    Left = 192
    Top = 127
    TabStop = False
    Anchors = [akTop, akRight]
    EditValue = 0.000000000000000000
    Enabled = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.##;(,0.##)'
    Properties.ReadOnly = True
    Style.Color = clMoneyGreen
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -24
    Style.Font.Name = 'Consolas'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    StyleDisabled.Color = clInfoBk
    StyleDisabled.TextColor = clDefault
    TabOrder = 2
    ExplicitLeft = 176
    Width = 274
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    TabOrder = 7
    ExplicitWidth = 461
    Height = 41
    Width = 477
    object cxLabel4: TcxLabel
      Left = 2
      Top = 2
      Align = alClient
      Caption = 'Pembayaran Tunai'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      ExplicitLeft = 305
      ExplicitWidth = 37
      ExplicitHeight = 20
      AnchorX = 239
      AnchorY = 21
    end
  end
end
