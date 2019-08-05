inherited frmEndOfDay: TfrmEndOfDay
  Caption = 'End Of Day'
  ClientHeight = 512
  ClientWidth = 804
  ExplicitWidth = 820
  ExplicitHeight = 551
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 477
    TabOrder = 1
    ExplicitTop = 477
    ExplicitWidth = 804
    Width = 804
    inherited btnCancel: TcxButton
      Left = 719
      ExplicitLeft = 719
    end
    inherited btnPrint: TcxButton
      Left = 633
      ExplicitLeft = 633
    end
    inherited btnSave: TcxButton
      Left = 547
      OnClick = btnSaveClick
      ExplicitLeft = 547
    end
  end
  inherited Panel2: TPanel
    Top = 456
    Width = 804
    TabOrder = 2
    ExplicitTop = 456
    ExplicitWidth = 804
    inherited lbEscape: TLabel
      Left = 724
      Height = 17
      ExplicitLeft = 724
    end
    inherited lgndSave: TLabel
      Left = 559
      Height = 17
      ExplicitLeft = 559
    end
    inherited lgndPrint: TLabel
      Left = 646
      Height = 17
      ExplicitLeft = 646
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 335
      Height = 17
      Margins.Top = 1
      Margins.Right = 15
      Margins.Bottom = 1
      Align = alLeft
      Caption = 
        '** Inputkan Saldo Aktual dari masing-masing kas ke Kolom Saldo F' +
        'isik'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
  end
  object cxGroupBox1: TcxGroupBox [2]
    Left = 0
    Top = 0
    Align = alTop
    PanelStyle.Active = True
    TabOrder = 0
    DesignSize = (
      804
      41)
    Height = 41
    Width = 804
    object dtEOD: TcxDateEdit
      Left = 65
      Top = 9
      TabStop = False
      ParentFont = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnEditValueChanged = dtEODPropertiesEditValueChanged
      Properties.OnValidate = dtEODPropertiesValidate
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      Width = 101
    end
    object cxLabel8: TcxLabel
      Left = 14
      Top = 10
      Caption = 'Tanggal'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object dtLast: TcxDateEdit
      Left = 678
      Top = 9
      TabStop = False
      Anchors = [akTop, akRight]
      Enabled = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 2
      Width = 90
    end
    object cxLabel1: TcxLabel
      Left = 630
      Top = 10
      Anchors = [akTop, akRight]
      Caption = 'Last EOD'
      Enabled = False
    end
  end
  object cxPageControl1: TcxPageControl [3]
    Left = 0
    Top = 41
    Width = 804
    Height = 415
    Align = alClient
    TabOrder = 3
    Properties.ActivePage = tsCashOpname
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 415
    ClientRectRight = 804
    ClientRectTop = 24
    object tsCashOpname: TcxTabSheet
      Caption = 'Cash Opname'
      ImageIndex = 0
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 804
        Height = 391
        Align = alClient
        BevelInner = bvLowered
        BevelOuter = bvNone
        BorderStyle = cxcbsNone
        TabOrder = 0
        object cxGrdMain: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsData.Deleting = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 30
          object colRekening: TcxGridDBColumn
            Caption = 'Rekening Kas'
            DataBinding.FieldName = 'Rekening'
            PropertiesClassName = 'TcxExtLookupComboBoxProperties'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 164
          end
          object colSys: TcxGridDBColumn
            Caption = 'Saldo System'
            DataBinding.FieldName = 'SaldoSystem'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 94
          end
          object colFisik: TcxGridDBColumn
            Caption = 'Saldo Fisik'
            DataBinding.FieldName = 'SaldoFisik'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Properties.OnEditValueChanged = colFisikPropertiesEditValueChanged
            HeaderAlignmentHorz = taCenter
            Styles.Content = styleFisik
            Width = 97
          end
          object colVariant: TcxGridDBColumn
            Caption = 'Selisih'
            DataBinding.FieldName = 'Variant'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 102
          end
          object colNotes: TcxGridDBColumn
            Caption = 'Catatan Atas Selisih'
            DataBinding.FieldName = 'Notes'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 322
          end
        end
        object cxGrdDetail: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;(,0.00)'
              Kind = skSum
              Column = cxGrdDetailColumn2
            end
            item
              Kind = skCount
              OnGetText = cxGrdDetailTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems1GetText
              Column = cxGrdDetailColumn1
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.Footer = True
          OptionsView.GridLines = glVertical
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 23
          object cxGrdDetailColumn1: TcxGridDBColumn
            Caption = 'Jenis Transaksi'
            DataBinding.FieldName = 'TransName'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 272
          end
          object cxGrdDetailColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'Total'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            HeaderAlignmentHorz = taCenter
            Width = 106
          end
        end
        object cxGrid1Level1: TcxGridLevel
          Caption = 'Detail Transfer [F2]'
          GridView = cxGrdMain
          object cxGrid1Level2: TcxGridLevel
            Caption = 'Rekap Mutasi Harian'
            GridView = cxGrdDetail
          end
        end
        object cxGrid1Level3: TcxGridLevel
          Visible = False
        end
      end
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 584
    Top = 0
    PixelsPerInch = 96
    object styleFisik: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
end
