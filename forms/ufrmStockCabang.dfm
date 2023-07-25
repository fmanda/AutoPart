object frmStockCabang: TfrmStockCabang
  Left = 0
  Top = 0
  Caption = 'frmStockCabang'
  ClientHeight = 440
  ClientWidth = 748
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 50
    Width = 748
    Height = 350
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Trebuchet MS'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    object cxGrdMain: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      Styles.ContentEven = styleEven
      object colCabang: TcxGridColumn
        Caption = 'Cabang'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 131
      end
      object colGudang: TcxGridColumn
        Caption = 'Gudang'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 106
      end
      object colKode: TcxGridColumn
        Caption = 'Kode'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 94
      end
      object colNama: TcxGridColumn
        Caption = 'Nama Barang'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 311
      end
      object colStock: TcxGridColumn
        Caption = 'Stock'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrdMain
    end
  end
  object pnButtom: TcxGroupBox
    Left = 0
    Top = 400
    Align = alBottom
    PanelStyle.Active = True
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    Style.Color = clDefault
    TabOrder = 1
    Transparent = True
    Height = 40
    Width = 748
    object btnOK: TcxButton
      AlignWithMargins = True
      Left = 599
      Top = 5
      Width = 144
      Height = 30
      Align = alRight
      Caption = 'OK'
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      ModalResult = 1
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      OnClick = btnOKClick
    end
  end
  object pnTop: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = 'Pesan :'
    PanelStyle.Active = True
    ParentBackground = False
    ParentColor = False
    Style.Color = clBtnFace
    Style.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    TabOrder = 2
    Height = 50
    Width = 748
    object mmPesan: TcxMemo
      Left = 2
      Top = 2
      Align = alClient
      Enabled = False
      Lines.Strings = (
        'STOCK CABANG')
      ParentFont = False
      Properties.Alignment = taCenter
      Properties.ReadOnly = True
      Style.BorderStyle = ebsNone
      Style.Color = clBtnFace
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Trebuchet MS'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.Shadow = False
      Style.TextColor = clBlack
      Style.TextStyle = [fsBold]
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.TextColor = clInfoText
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      TabOrder = 0
      Height = 46
      Width = 744
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 96
    Top = 88
    PixelsPerInch = 96
    object styleEven: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
    end
    object styleDefault: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
    end
    object styleInfoBk: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      TextColor = clHighlightText
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 416
    Top = 144
    object CheckAll1: TMenuItem
      Caption = 'Check All'
    end
    object UnCheckAll1: TMenuItem
      Caption = 'UnCheck All'
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 144
    Top = 168
  end
end
