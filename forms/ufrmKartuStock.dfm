inherited frmKartuStock: TfrmKartuStock
  Caption = 'Kartu Stock'
  ClientHeight = 611
  ClientWidth = 760
  FormStyle = fsStayOnTop
  Position = poMainFormCenter
  Visible = False
  WindowState = wsNormal
  ExplicitWidth = 776
  ExplicitHeight = 650
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    TabOrder = 2
    Visible = False
    ExplicitWidth = 760
    Width = 760
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 576
    TabOrder = 3
    OnClick = cxGroupBox2Click
    ExplicitTop = 576
    ExplicitWidth = 760
    Width = 760
    inherited btnTutup: TcxButton
      Left = 680
      ExplicitLeft = 680
    end
    inherited btnExport: TcxButton
      OnClick = btnExportClick
    end
    inherited btnRefresh: TcxButton
      OnClick = btnRefreshClick
    end
  end
  object cxGroupBox3: TcxGroupBox [2]
    AlignWithMargins = True
    Left = 0
    Top = 38
    Margins.Left = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Caption = ' Report Parameter '
    TabOrder = 0
    Height = 123
    Width = 760
    object cxLabel1: TcxLabel
      Left = 46
      Top = 45
      Caption = 'Kode Barang'
    end
    object cxLabel2: TcxLabel
      Left = 43
      Top = 65
      Caption = 'Nama Barang'
    end
    object edNama: TcxTextEdit
      Left = 112
      Top = 64
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      TabOrder = 4
      Width = 312
    end
    object cxLabel3: TcxLabel
      Left = 45
      Top = 24
      Caption = 'Periode Awal'
    end
    object cxLabel4: TcxLabel
      Left = 70
      Top = 85
      Caption = 'Gudang'
    end
    object cxLookupGudang: TcxExtLookupComboBox
      Left = 112
      Top = 84
      TabOrder = 5
      Width = 216
    end
    object dtStart: TcxDateEdit
      Left = 112
      Top = 23
      TabOrder = 0
      Width = 117
    end
    object chkAll: TcxCheckBox
      Left = 328
      Top = 84
      TabStop = False
      Caption = 'Semua Gudang'
      Properties.OnEditValueChanged = chkAllPropertiesEditValueChanged
      TabOrder = 6
    end
    object edKode: TcxButtonEdit
      Left = 112
      Top = 44
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.CharCase = ecUpperCase
      Properties.OnButtonClick = edKodePropertiesButtonClick
      Properties.OnValidate = edKodePropertiesValidate
      TabOrder = 2
      OnKeyDown = edKodeKeyDown
      Width = 135
    end
    object dtEnd: TcxDateEdit
      Left = 307
      Top = 23
      TabOrder = 1
      Width = 117
    end
    object cxLabel5: TcxLabel
      Left = 240
      Top = 24
      Caption = 'Periode Akhir'
    end
    object cxLookupUOM: TcxExtLookupComboBox
      Left = 343
      Top = 44
      Properties.OnCloseUp = cxLookupUOMPropertiesCloseUp
      Properties.OnInitPopup = cxLookupUOMPropertiesInitPopup
      TabOrder = 3
      Width = 81
    end
    object cxLabel6: TcxLabel
      Left = 270
      Top = 45
      Caption = 'Dalam Satuan'
    end
  end
  object cxGrid1: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 164
    Width = 754
    Height = 409
    Align = alClient
    TabOrder = 1
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
        6E005300650074006400000001000000000700000033004100720072006F0077
        007300030000000000000003000000FFFFFF7F00020000000200000000000200
        0000010000000500000000000000000000000000000100000001000000050000
        00000000000000000100000000000000}
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
        Width = 132
      end
      object colNotes: TcxGridDBColumn
        Caption = 'Transaksi'
        DataBinding.FieldName = 'Notes'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 253
      end
      object colQty: TcxGridDBColumn
        DataBinding.FieldName = 'Qty'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 79
      end
      object colSaldo: TcxGridDBColumn
        DataBinding.FieldName = 'Saldo'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 87
      end
      object colUOM: TcxGridDBColumn
        DataBinding.FieldName = 'Satuan'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 71
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 416
    Top = 65520
    PixelsPerInch = 96
  end
end
