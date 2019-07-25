inherited frmLapCashOpname: TfrmLapCashOpname
  Caption = 'Laporan Cash Opname'
  ClientHeight = 622
  ClientWidth = 985
  ExplicitWidth = 1001
  ExplicitHeight = 661
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    ExplicitWidth = 985
    Width = 985
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 587
    ExplicitTop = 587
    ExplicitWidth = 985
    Width = 985
    inherited btnTutup: TcxButton
      Left = 905
      ExplicitLeft = 905
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
    PanelStyle.Active = True
    Style.BorderStyle = ebsNone
    TabOrder = 2
    Height = 46
    Width = 985
    object cxLabel3: TcxLabel
      Left = 19
      Top = 15
      Caption = 'Periode Awal'
    end
    object dtStart: TcxDateEdit
      Left = 86
      Top = 14
      TabOrder = 0
      Width = 117
    end
    object dtEnd: TcxDateEdit
      Left = 281
      Top = 14
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 117
    end
    object cxLabel5: TcxLabel
      Left = 214
      Top = 15
      Caption = 'Periode Akhir'
    end
  end
  object cxGrid1: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 84
    Width = 979
    Height = 500
    Align = alClient
    TabOrder = 3
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colQty
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
        010000000A0000002E0000005400640078005300700072006500610064005300
        680065006500740043006F006E0064006900740069006F006E0061006C004600
        6F0072006D0061007400740069006E006700520075006C006500490063006F00
        6E00530065007400560000000100000000000000000400000000000000040000
        00FFFFFF7F000200000002000000000002000000010000000500000000000000
        00000000000000FFFFFFFF010000000500000000000000000000010000000000
        0000}
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
        DataBinding.FieldName = 'Rekening'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 196
      end
      object colQty: TcxGridDBColumn
        Caption = 'Saldo System'
        DataBinding.FieldName = 'SaldoSystem'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 93
      end
      object colSaldo: TcxGridDBColumn
        Caption = 'Saldo Fisik'
        DataBinding.FieldName = 'SaldoFisik'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 104
      end
      object colUOM: TcxGridDBColumn
        Caption = 'Selisih'
        DataBinding.FieldName = 'Variant'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 100
      end
      object colNotes: TcxGridDBColumn
        Caption = 'Catatan Atas Selisih'
        DataBinding.FieldName = 'Notes'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 369
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 696
    Top = 480
    PixelsPerInch = 96
  end
end
