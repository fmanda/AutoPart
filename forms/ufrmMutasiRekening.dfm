inherited frmMutasiRekening: TfrmMutasiRekening
  Caption = 'Laporan Mutasi Kas / Bank'
  ClientWidth = 791
  ExplicitWidth = 807
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    Width = 791
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Width = 791
    inherited btnTutup: TcxButton
      Left = 711
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
    Caption = ' Kartu Stock '
    TabOrder = 2
    ExplicitWidth = 639
    Height = 70
    Width = 791
    object cxLabel3: TcxLabel
      Left = 77
      Top = 14
      Caption = 'Periode Awal'
    end
    object cxLabel4: TcxLabel
      Left = 95
      Top = 35
      Caption = 'Rekening'
    end
    object cxLookupRekening: TcxExtLookupComboBox
      Left = 144
      Top = 34
      TabOrder = 2
      Width = 312
    end
    object dtStart: TcxDateEdit
      Left = 144
      Top = 13
      TabOrder = 0
      Width = 117
    end
    object dtEnd: TcxDateEdit
      Left = 339
      Top = 13
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 117
    end
    object cxLabel5: TcxLabel
      Left = 272
      Top = 14
      Caption = 'Periode Akhir'
    end
  end
  object cxGrid1: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 108
    Width = 785
    Height = 262
    Align = alClient
    TabOrder = 3
    ExplicitLeft = -2
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colQty
        end
        item
          Kind = skSum
          Column = colSaldo
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      Styles.ContentOdd = styleOdd
      ConditionalFormatting = {
        020000000A0000002E0000005400640078005300700072006500610064005300
        680065006500740043006F006E0064006900740069006F006E0061006C004600
        6F0072006D0061007400740069006E006700520075006C006500490063006F00
        6E00530065007400560000000100000000000000000200000000000000020000
        00FFFFFF7F000200000002000000000002000000010000000500000000000000
        00000000000000FFFFFFFF010000000500000000000000000000010000000000
        00002E0000005400640078005300700072006500610064005300680065006500
        740043006F006E0064006900740069006F006E0061006C0046006F0072006D00
        61007400740069006E006700520075006C006500490063006F006E0053006500
        740044000000010000000000000000030000000000000003000000FFFFFF7F00
        020000000200000000000000000002000000020000000000FFFFFFFF02000000
        02000100000002000000}
      object colTransDate: TcxGridDBColumn
        Caption = 'Tanggal'
        DataBinding.FieldName = 'TransDate'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.SaveTime = False
        Properties.ShowTime = False
        HeaderAlignmentHorz = taCenter
        Width = 102
      end
      object colRefNo: TcxGridDBColumn
        Caption = 'No. Ref'
        DataBinding.FieldName = 'RefNo'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 141
      end
      object colQty: TcxGridDBColumn
        DataBinding.FieldName = 'Debet'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 86
      end
      object colSaldo: TcxGridDBColumn
        DataBinding.FieldName = 'Credit'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 90
      end
      object colUOM: TcxGridDBColumn
        Caption = 'Saldo'
        DataBinding.FieldName = 'Balance'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 90
      end
      object colNotes: TcxGridDBColumn
        Caption = 'Deskripsi'
        DataBinding.FieldName = 'Notes'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 276
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 560
    Top = 24
    PixelsPerInch = 96
  end
end
