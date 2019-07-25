inherited frmSaldoRekening: TfrmSaldoRekening
  Caption = 'Saldo Rekening Kas / Bank'
  ClientHeight = 461
  ClientWidth = 684
  Position = poDesktopCenter
  ExplicitWidth = 700
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    ExplicitWidth = 684
    Width = 684
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 426
    ExplicitTop = 426
    ExplicitWidth = 684
    Width = 684
    inherited btnTutup: TcxButton
      Left = 604
      ExplicitLeft = 604
    end
    inherited btnExport: TcxButton
      OnClick = btnExportClick
    end
    inherited btnRefresh: TcxButton
      OnClick = btnRefreshClick
    end
  end
  object cxGroupBox3: TcxGroupBox [2]
    Left = 0
    Top = 35
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Caption = ' Report Parameter '
    TabOrder = 2
    Height = 75
    Width = 684
    object cxLabel3: TcxLabel
      Left = 40
      Top = 24
      Caption = 'Saldo Per Tanggal'
    end
    object cxLookupRekening: TcxExtLookupComboBox
      Left = 134
      Top = 44
      TabOrder = 1
      Width = 216
    end
    object dtSaldo: TcxDateEdit
      Left = 134
      Top = 23
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      Width = 130
    end
    object ckRekening: TcxCheckBox
      Left = 35
      Top = 43
      TabStop = False
      Caption = 'Filter Rekening'
      Properties.Alignment = taLeftJustify
      Properties.OnEditValueChanged = ckRekeningPropertiesEditValueChanged
      TabOrder = 2
    end
  end
  object cxGrid1: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 113
    Width = 678
    Height = 310
    Align = alClient
    TabOrder = 3
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colValue
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      Styles.ContentOdd = styleOdd
      object colKode: TcxGridDBColumn
        Caption = 'Kode Rekening'
        DataBinding.FieldName = 'Kode'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 104
      end
      object colNotes: TcxGridDBColumn
        Caption = 'Nama Rekening'
        DataBinding.FieldName = 'Nama'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 265
      end
      object colHrgAvg: TcxGridDBColumn
        Caption = 'Total Debet'
        DataBinding.FieldName = 'Debet'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 71
      end
      object colQty: TcxGridDBColumn
        Caption = 'Total Credit'
        DataBinding.FieldName = 'Credit'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 89
      end
      object colValue: TcxGridDBColumn
        Caption = 'Saldo'
        DataBinding.FieldName = 'Balance'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 123
      end
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Data Stock'
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 520
    Top = 8
    PixelsPerInch = 96
  end
end
