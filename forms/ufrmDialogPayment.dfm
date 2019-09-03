inherited frmDialogPayment: TfrmDialogPayment
  BorderStyle = bsNone
  Caption = 'Dialog Pembayaran'
  ClientHeight = 337
  ClientWidth = 439
  FormStyle = fsStayOnTop
  KeyPreview = True
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  ExplicitWidth = 439
  ExplicitHeight = 337
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel2: TcxLabel
    Left = 74
    Top = 63
    Anchors = [akTop, akRight]
    Caption = 'Nilai Faktur'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taRightJustify
    AnchorX = 148
  end
  object cxLabel5: TcxLabel
    Left = 56
    Top = 96
    Anchors = [akTop, akRight]
    Caption = 'Bayar Tunai'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -17
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taRightJustify
    AnchorX = 148
  end
  object crBayar: TcxCurrencyEdit
    Left = 154
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
    Width = 274
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 284
    Align = alBottom
    PanelStyle.Active = True
    Style.BorderStyle = ebsFlat
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    TabOrder = 5
    Height = 53
    Width = 439
    object btnCancel: TcxButton
      AlignWithMargins = True
      Left = 354
      Top = 5
      Width = 80
      Height = 43
      Align = alRight
      Caption = 'Ba&tal'
      OptionsImage.ImageIndex = 10
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 1
      TabStop = False
      OnClick = btnCancelClick
    end
    object btnSave: TcxButton
      AlignWithMargins = True
      Left = 229
      Top = 5
      Width = 119
      Height = 43
      Align = alRight
      Caption = '&Bayar && &Simpan'
      OptionsImage.ImageIndex = 70
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 0
      OnClick = btnSaveClick
    end
  end
  object crTotal: TcxCurrencyEdit
    Left = 154
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
    Width = 274
  end
  object cxLabel1: TcxLabel
    Left = 70
    Top = 218
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
    AnchorX = 151
  end
  object crKembali: TcxCurrencyEdit
    Left = 154
    Top = 212
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
    TabOrder = 4
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
    TabOrder = 9
    Height = 41
    Width = 439
    object cxLabel4: TcxLabel
      Left = 2
      Top = 2
      Align = alClient
      Caption = 'Pembayaran'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taCenter
      Properties.Alignment.Vert = taVCenter
      AnchorX = 220
      AnchorY = 21
    end
  end
  object cxLabel3: TcxLabel
    Left = 57
    Top = 133
    Anchors = [akTop, akRight]
    Caption = 'Bayar Kartu'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -17
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taRightJustify
    AnchorX = 148
  end
  object crCard: TcxCurrencyEdit
    Left = 154
    Top = 127
    Anchors = [akTop, akRight]
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.DisplayFormat = ',0.##;(,0.##)'
    Properties.ReadOnly = False
    Properties.OnChange = crCardPropertiesChange
    Properties.OnValidate = crCardPropertiesValidate
    Style.Color = 16112837
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -24
    Style.Font.Name = 'Consolas'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    StyleDisabled.Color = clInfoBk
    StyleDisabled.TextColor = clDefault
    TabOrder = 2
    OnKeyDown = crCardKeyDown
    Width = 274
  end
  object cxLookupRekening: TcxExtLookupComboBox
    Left = 154
    Top = 160
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -24
    Style.Font.Name = 'Consolas'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 3
    Width = 274
  end
  object cxLabel6: TcxLabel
    Left = 52
    Top = 166
    Anchors = [akTop, akRight]
    Caption = 'Bank Tujuan'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -17
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Properties.Alignment.Horz = taRightJustify
    AnchorX = 148
  end
end
