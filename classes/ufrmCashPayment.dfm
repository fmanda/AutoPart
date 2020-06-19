inherited frmCashPayment: TfrmCashPayment
  Caption = 'Kas Keluar / Pengeluaran Kas'
  ClientHeight = 523
  ClientWidth = 737
  KeyPreview = True
  OnKeyDown = FormKeyDown
  ExplicitWidth = 753
  ExplicitHeight = 562
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 488
    TabOrder = 1
    ExplicitTop = 488
    ExplicitWidth = 737
    Width = 737
    inherited btnCancel: TcxButton
      Left = 652
      ExplicitLeft = 652
    end
    inherited btnPrint: TcxButton
      Left = 566
      ExplicitLeft = 566
    end
    inherited btnSave: TcxButton
      Left = 480
      OnClick = btnSaveClick
      ExplicitLeft = 480
    end
    object btnLoad: TcxButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 164
      Height = 25
      Align = alLeft
      Caption = 'Daftar Fee Salesman'
      OptionsImage.ImageIndex = 25
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 3
      OnClick = btnLoadClick
    end
  end
  inherited Panel2: TPanel
    Top = 467
    Width = 737
    TabOrder = 2
    ExplicitTop = 467
    ExplicitWidth = 737
    inherited lbEscape: TLabel
      Left = 657
      Height = 17
      ExplicitLeft = 657
    end
    inherited lgndSave: TLabel
      Left = 492
      Height = 17
      ExplicitLeft = 492
    end
    inherited lgndPrint: TLabel
      Left = 579
      Height = 17
      ExplicitLeft = 579
    end
  end
  object cxGroupBox1: TcxGroupBox [2]
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Invoice [F1] '
    TabOrder = 0
    DesignSize = (
      737
      115)
    Height = 115
    Width = 737
    object cxLabel1: TcxLabel
      Left = 52
      Top = 23
      Caption = 'No. Bukti'
    end
    object edRefno: TcxTextEdit
      Left = 99
      Top = 22
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      Width = 118
    end
    object cxLabel6: TcxLabel
      Left = 56
      Top = 64
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 99
      Top = 62
      TabOrder = 3
      Height = 40
      Width = 259
    end
    object dtTransDate: TcxDateEdit
      Left = 268
      Top = 22
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 90
    end
    object cxLabel8: TcxLabel
      Left = 225
      Top = 23
      Caption = 'Tanggal'
    end
    object cxLabel5: TcxLabel
      Left = 508
      Top = 25
      Anchors = [akTop, akRight]
      Caption = 'Cash'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 548
    end
    object crCash: TcxCurrencyEdit
      Left = 550
      Top = 22
      TabStop = False
      Anchors = [akTop, akRight]
      EditValue = 0.000000000000000000
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
      TabOrder = 4
      Width = 170
    end
    object lbRekening: TcxLabel
      Left = 27
      Top = 43
      Caption = 'Rekening Asal'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 98
    end
    object cxLookupRekening: TcxExtLookupComboBox
      Left = 99
      Top = 42
      Properties.ImmediatePost = True
      TabOrder = 2
      Width = 259
    end
  end
  object pgcMain: TcxPageControl [3]
    Left = 0
    Top = 115
    Width = 737
    Height = 352
    Align = alClient
    TabOrder = 3
    Properties.ActivePage = tsFee
    Properties.CustomButtons.Buttons = <>
    OnChange = pgcMainChange
    ClientRectBottom = 352
    ClientRectRight = 737
    ClientRectTop = 24
    object tsDetail: TcxTabSheet
      Caption = 'Detail Pengeluaran [F2]'
      ImageIndex = 0
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 737
        Height = 328
        Align = alClient
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
          OptionsData.Appending = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 30
          object colCostAccount: TcxGridDBColumn
            DataBinding.FieldName = 'Account'
            PropertiesClassName = 'TcxExtLookupComboBoxProperties'
            HeaderAlignmentHorz = taCenter
            Width = 205
          end
          object colCostNotes: TcxGridDBColumn
            Caption = 'Deskripsi'
            DataBinding.FieldName = 'Notes'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 380
          end
          object colCostAmount: TcxGridDBColumn
            Caption = 'Nilai'
            DataBinding.FieldName = 'Amount'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Properties.OnEditValueChanged = colCostAmountPropertiesEditValueChanged
            HeaderAlignmentHorz = taCenter
            Width = 134
          end
        end
        object cxGrid1Level2: TcxGridLevel
          Caption = 'Detail Pengeluaran [F2]'
          GridView = cxGrdMain
        end
      end
    end
    object tsFee: TcxTabSheet
      Caption = 'Pembayaran Fee Salesman'
      ImageIndex = 1
      object cxGrid2: TcxGrid
        Left = 0
        Top = 33
        Width = 737
        Height = 295
        Align = alClient
        TabOrder = 0
        object cxGrdFee: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;(,0.00)'
              Kind = skSum
              Column = cxGridDBColumn3
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsData.CancelOnExit = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 30
          object cxGrdFeeColumn2: TcxGridDBColumn
            Caption = 'No'
            OnGetDisplayText = cxGrdFeeColumn2GetDisplayText
            HeaderAlignmentHorz = taCenter
            Width = 38
          end
          object cxGridDBColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'Salesman'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 209
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = 'Nomor Faktur'
            DataBinding.FieldName = 'RefNo'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 142
          end
          object cxGrdFeeColumn1: TcxGridDBColumn
            Caption = 'Tgl Lunas'
            DataBinding.FieldName = 'PaidOffDate'
            PropertiesClassName = 'TcxDateEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 89
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = 'Nilai'
            DataBinding.FieldName = 'Amount'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Properties.OnEditValueChanged = colCostAmountPropertiesEditValueChanged
            HeaderAlignmentHorz = taCenter
            Width = 113
          end
        end
        object cxGridLevel1: TcxGridLevel
          Caption = 'Detail Pengeluaran [F2]'
          GridView = cxGrdFee
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 737
        Height = 33
        Align = alTop
        TabOrder = 1
        object cxLabel2: TcxLabel
          Left = 11
          Top = 6
          Caption = 'Account Biaya'
          Properties.Alignment.Horz = taRightJustify
          AnchorX = 83
        end
        object cxLookupAccFee: TcxExtLookupComboBox
          Left = 84
          Top = 5
          Properties.ImmediatePost = True
          TabOrder = 1
          Width = 259
        end
      end
    end
    object tsRetur: TcxTabSheet
      Caption = 'Pembayaran Retur Customer'
      ImageIndex = 2
      object cxGrid3: TcxGrid
        Left = 0
        Top = 0
        Width = 737
        Height = 328
        Align = alClient
        TabOrder = 0
        object cxGrdRetur: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.00;(,0.00)'
              Kind = skSum
              Column = cxGridDBColumn8
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsData.CancelOnExit = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 30
          object cxGridDBColumn4: TcxGridDBColumn
            Caption = 'No'
            OnGetDisplayText = cxGrdFeeColumn2GetDisplayText
            HeaderAlignmentHorz = taCenter
            Width = 38
          end
          object cxGridDBColumn6: TcxGridDBColumn
            Caption = 'Nomor Retur'
            DataBinding.FieldName = 'ReturNo'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 135
          end
          object cxGridDBColumn7: TcxGridDBColumn
            Caption = 'Tgl Retur'
            DataBinding.FieldName = 'ReturDate'
            PropertiesClassName = 'TcxDateEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 89
          end
          object cxGridDBColumn5: TcxGridDBColumn
            DataBinding.FieldName = 'Customer'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 247
          end
          object cxGridDBColumn8: TcxGridDBColumn
            Caption = 'Nilai'
            DataBinding.FieldName = 'Amount'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Properties.OnEditValueChanged = colCostAmountPropertiesEditValueChanged
            HeaderAlignmentHorz = taCenter
            Width = 113
          end
        end
        object cxGridLevel2: TcxGridLevel
          Caption = 'Detail Pengeluaran [F2]'
          GridView = cxGrdRetur
        end
      end
    end
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
