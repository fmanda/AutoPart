inherited frmHutangZakat: TfrmHutangZakat
  Caption = 'Input Hutang Zakat'
  ClientHeight = 413
  ClientWidth = 704
  ExplicitWidth = 720
  ExplicitHeight = 452
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 378
    ExplicitTop = 504
    ExplicitWidth = 634
    Width = 704
    inherited btnCancel: TcxButton
      Left = 619
      TabOrder = 0
      ExplicitLeft = 549
    end
    inherited btnPrint: TcxButton
      Left = 533
      TabOrder = 1
      ExplicitLeft = 463
    end
    inherited btnSave: TcxButton
      Left = 447
      TabOrder = 2
      OnClick = btnSaveClick
      ExplicitLeft = 447
      ExplicitTop = 3
    end
    object cxLabel14: TcxLabel
      AlignWithMargins = True
      Left = 5
      Top = 7
      Margins.Top = 5
      Align = alClient
      Caption = 
        '** Untuk menghapus inputan bisa lewat Browse Faktur Pembelian di' +
        ' '
      ExplicitLeft = 56
      ExplicitTop = 16
      ExplicitWidth = 332
      ExplicitHeight = 17
    end
  end
  inherited Panel2: TPanel
    Top = 357
    Width = 704
    ExplicitTop = 483
    ExplicitWidth = 634
    inherited lbEscape: TLabel
      Left = 624
      Height = 17
      ExplicitLeft = 554
    end
    inherited lgndSave: TLabel
      Left = 459
      Height = 17
      ExplicitLeft = 389
    end
    inherited lgndPrint: TLabel
      Left = 546
      Height = 17
      ExplicitLeft = 476
    end
  end
  object cxGroupBox1: TcxGroupBox [2]
    Left = 0
    Top = 0
    Align = alTop
    Caption = ' Parameter '
    TabOrder = 2
    ExplicitWidth = 680
    Height = 169
    Width = 704
    object edURL: TcxTextEdit
      Left = 109
      Top = 15
      TabOrder = 0
      Text = 'http://api.motoroli.web.id'
      Width = 208
    end
    object cxLabel1: TcxLabel
      Left = 48
      Top = 16
      Caption = 'URL Server'
    end
    object cbBulan: TcxComboBox
      Left = 109
      Top = 37
      Properties.CharCase = ecUpperCase
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Januari'
        'Februari'
        'Maret'
        'April'
        'Mei'
        'Juni'
        'Juli'
        'Agustus'
        'September'
        'Oktober'
        'November'
        'Desember')
      TabOrder = 2
      Text = 'JANUARI'
      Width = 79
    end
    object cxLabel2: TcxLabel
      Left = 40
      Top = 38
      Caption = 'Periode Awal'
    end
    object spTahun: TcxSpinEdit
      Left = 250
      Top = 36
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 4
      Value = 2019
      Width = 67
    end
    object cxLabel3: TcxLabel
      Left = 215
      Top = 37
      Caption = 'Tahun'
    end
    object btnCalc: TcxButton
      Left = 236
      Top = 81
      Width = 81
      Height = 42
      Caption = 'Hitung Data'
      TabOrder = 6
      OnClick = btnCalcClick
    end
    object crNetProfit: TcxCurrencyEdit
      Left = 109
      Top = 79
      TabStop = False
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.##;(,0.##)'
      Properties.ReadOnly = True
      Style.Color = clCream
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 7
      Width = 121
    end
    object cxLabel4: TcxLabel
      Left = 56
      Top = 81
      Caption = 'Net Profit'
    end
    object cxLabel5: TcxLabel
      Left = 26
      Top = 103
      Caption = '2.5% Net Profit'
    end
    object crCalc: TcxCurrencyEdit
      Left = 109
      Top = 101
      TabStop = False
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.##;(,0.##)'
      Properties.ReadOnly = True
      Style.Color = clCream
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 10
      Width = 121
    end
    object cbBulan2: TcxComboBox
      Left = 109
      Top = 58
      Properties.CharCase = ecUpperCase
      Properties.DropDownListStyle = lsEditFixedList
      Properties.ImmediatePost = True
      Properties.Items.Strings = (
        'Januari'
        'Februari'
        'Maret'
        'April'
        'Mei'
        'Juni'
        'Juli'
        'Agustus'
        'September'
        'Oktober'
        'November'
        'Desember')
      TabOrder = 11
      Text = 'DESEMBER'
      Width = 79
    end
    object cxLabel11: TcxLabel
      Left = 39
      Top = 59
      Caption = 'Periode Akhir'
    end
    object spTahun2: TcxSpinEdit
      Left = 250
      Top = 57
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 13
      Value = 2019
      Width = 67
    end
    object cxLabel12: TcxLabel
      Left = 215
      Top = 58
      Caption = 'Tahun'
    end
    object cxLabel13: TcxLabel
      Left = 22
      Top = 125
      Caption = 'Total Uang Muka'
    end
    object crUangMuka: TcxCurrencyEdit
      Left = 109
      Top = 123
      TabStop = False
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.##;(,0.##)'
      Properties.ReadOnly = True
      Style.Color = clCream
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 16
      Width = 121
    end
    object cxLabel6: TcxLabel
      Left = 347
      Top = 37
      Caption = 'Badan Zakat'
    end
    object edSupplier: TcxButtonEdit
      Left = 412
      Top = 36
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edSupplierPropertiesButtonClick
      TabOrder = 18
      OnKeyDown = edSupplierKeyDown
      Width = 245
    end
    object edNotes: TcxMemo
      Left = 412
      Top = 57
      TabOrder = 19
      Height = 40
      Width = 245
    end
    object cxLabel7: TcxLabel
      Left = 368
      Top = 58
      Caption = 'Catatan'
    end
    object cxLabel8: TcxLabel
      Left = 352
      Top = 15
      Caption = 'No. Invoice'
    end
    object edNoInv: TcxTextEdit
      Left = 412
      Top = 15
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 22
      Width = 109
    end
    object cxLabel9: TcxLabel
      Left = 530
      Top = 15
      Caption = 'Tanggal'
    end
    object dtInvoice: TcxDateEdit
      Left = 572
      Top = 14
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 24
      Width = 85
    end
    object cxLabel10: TcxLabel
      Left = 358
      Top = 99
      Caption = 'Nilai Zakat'
    end
    object crValue: TcxCurrencyEdit
      Left = 412
      Top = 97
      TabStop = False
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.##;(,0.##)'
      Properties.ReadOnly = False
      Style.Color = clCream
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -12
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 26
      Width = 109
    end
    object cxMemo2: TcxMemo
      AlignWithMargins = True
      Left = 352
      Top = 130
      Enabled = False
      Lines.Strings = (
        '** Nilai Zakat = 2.5% Net Profit - Uang Muka'
        '** Nilai Zakat bisa diedt')
      StyleDisabled.TextColor = clBlack
      TabOrder = 27
      Height = 33
      Width = 317
    end
  end
  object cxGrid: TcxGrid [3]
    Left = 0
    Top = 169
    Width = 704
    Height = 188
    Align = alClient
    TabOrder = 3
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitLeft = 2
    ExplicitTop = 193
    ExplicitWidth = 630
    ExplicitHeight = 121
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Filter.Options = [fcoCaseInsensitive]
      DataController.Filter.Active = True
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.ApplyChanges = fracImmediately
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      Styles.ContentOdd = styleOdd
    end
    object lvl: TcxGridLevel
      Caption = 'Daftar Pembayaran Uang Muka Zakat'
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 608
    Top = 72
    PixelsPerInch = 96
  end
  object RstRequest: TRESTRequest
    Client = RstClient
    Params = <>
    Response = RstResponse
    SynchronizedEvents = False
    Left = 632
    Top = 72
  end
  object RstClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    AutoCreateParams = False
    BaseURL = 'http://api.motoroli.web.id/netprofit/2020.1/2020.6'
    Params = <>
    HandleRedirects = True
    Left = 600
    Top = 72
  end
  object RstResponse: TRESTResponse
    ContentType = 'application/json'
    Left = 760
    Top = 184
  end
end
