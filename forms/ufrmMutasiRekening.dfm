inherited frmMutasiRekening: TfrmMutasiRekening
  Caption = 'Laporan Mutasi Kas / Bank'
  ClientHeight = 526
  ClientWidth = 802
  ExplicitWidth = 818
  ExplicitHeight = 565
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    ExplicitWidth = 791
    Width = 802
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 491
    ExplicitWidth = 791
    Width = 802
    inherited btnTutup: TcxButton
      Left = 722
      ExplicitLeft = 711
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
    ExplicitLeft = 72
    ExplicitTop = 56
    DesignSize = (
      802
      70)
    Height = 70
    Width = 802
    object cxLabel3: TcxLabel
      Left = 51
      Top = 17
      Caption = 'Periode Awal'
    end
    object cxLabel4: TcxLabel
      Left = 69
      Top = 38
      Caption = 'Rekening'
    end
    object cxLookupRekening: TcxExtLookupComboBox
      Left = 118
      Top = 37
      TabOrder = 2
      Width = 312
    end
    object dtStart: TcxDateEdit
      Left = 118
      Top = 16
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      Width = 117
    end
    object dtEnd: TcxDateEdit
      Left = 313
      Top = 16
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 117
    end
    object cxLabel5: TcxLabel
      Left = 246
      Top = 17
      Caption = 'Periode Akhir'
    end
    object cxLabel1: TcxLabel
      Left = 471
      Top = 32
      Anchors = [akLeft, akRight]
      Caption = 'Saldo'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object crSaldo: TcxCurrencyEdit
      Left = 515
      Top = 31
      TabStop = False
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.##;(,0.##)'
      Properties.ReadOnly = True
      Style.Color = clCream
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = 16744448
      Style.Font.Height = -16
      Style.Font.Name = 'Consolas'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 7
      Width = 175
    end
  end
  object pgcMain: TcxPageControl [3]
    Left = 0
    Top = 105
    Width = 802
    Height = 386
    Align = alClient
    TabOrder = 3
    Properties.ActivePage = tsDetail
    Properties.CustomButtons.Buttons = <>
    ExplicitLeft = 96
    ExplicitTop = 168
    ExplicitWidth = 289
    ExplicitHeight = 193
    ClientRectBottom = 386
    ClientRectRight = 802
    ClientRectTop = 24
    object tsDetail: TcxTabSheet
      Caption = 'Detail Transaksi Per No Transaksi'
      ImageIndex = 0
      ExplicitWidth = 289
      ExplicitHeight = 169
      object cxGrid1: TcxGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 796
        Height = 356
        Align = alClient
        TabOrder = 0
        ExplicitTop = 108
        ExplicitWidth = 785
        ExplicitHeight = 262
        object cxGrdMain: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          FindPanel.DisplayMode = fpdmManual
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
            6E00530065007400560000000100000000000000000300000000000000030000
            00FFFFFF7F000200000002000000000002000000010000000500000000000000
            00000000000000FFFFFFFF010000000500000000000000000000010000000000
            00002E0000005400640078005300700072006500610064005300680065006500
            740043006F006E0064006900740069006F006E0061006C0046006F0072006D00
            61007400740069006E006700520075006C006500490063006F006E0053006500
            740044000000010000000000000000040000000000000004000000FFFFFF7F00
            020000000200000000000000000002000000020000000000FFFFFFFF02000000
            02000100000002000000}
          object colNo: TcxGridDBColumn
            Caption = 'No'
            OnGetDisplayText = colNoGetDisplayText
            HeaderAlignmentHorz = taCenter
            Width = 35
          end
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
            Width = 235
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrdMain
        end
      end
    end
    object tsRekap: TcxTabSheet
      Caption = 'Rekap Mutasi Per Jenis Transaksi'
      ImageIndex = 1
      ExplicitWidth = 289
      ExplicitHeight = 169
      object cxGrid2: TcxGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 796
        Height = 356
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 6
        ExplicitTop = 6
        ExplicitWidth = 785
        ExplicitHeight = 271
        object cxGrdRekap: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = ',0.##;(,0.##)'
              Kind = skSum
              Column = cxGridDBColumn3
            end
            item
              Kind = skSum
            end
            item
              Column = cxGridDBColumn2
              DisplayText = 'Saldo'
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
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = 'Jenis Transaksi'
            DataBinding.FieldName = 'TransName'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 313
          end
          object cxGridDBColumn3: TcxGridDBColumn
            DataBinding.FieldName = 'Total'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.DisplayFormat = ',0.##;(,0.##)'
            HeaderAlignmentHorz = taCenter
            Width = 136
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGrdRekap
        end
      end
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 288
    Top = 65528
    PixelsPerInch = 96
  end
end
