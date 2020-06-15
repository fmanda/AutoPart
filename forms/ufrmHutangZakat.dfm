inherited frmHutangZakat: TfrmHutangZakat
  Caption = 'Input Hutang Zakat'
  ClientHeight = 388
  ClientWidth = 456
  ExplicitWidth = 472
  ExplicitHeight = 427
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 353
    Width = 456
    inherited btnCancel: TcxButton
      Left = 371
    end
    inherited btnPrint: TcxButton
      Left = 285
    end
    inherited btnSave: TcxButton
      Left = 199
      OnClick = btnSaveClick
    end
  end
  inherited Panel2: TPanel
    Top = 332
    Width = 456
    inherited lbEscape: TLabel
      Left = 376
      Height = 17
    end
    inherited lgndSave: TLabel
      Left = 211
      Height = 17
    end
    inherited lgndPrint: TLabel
      Left = 298
      Height = 17
    end
  end
  object cxGroupBox1: TcxGroupBox [2]
    Left = 0
    Top = 0
    Align = alTop
    Caption = ' Simulasi '
    TabOrder = 2
    ExplicitWidth = 769
    Height = 153
    Width = 456
    object edURL: TcxTextEdit
      Left = 109
      Top = 23
      TabOrder = 0
      Text = 'http://api.motoroli.web.id'
      Width = 276
    end
    object cxLabel1: TcxLabel
      Left = 48
      Top = 24
      Caption = 'URL Server'
    end
    object cbBulan: TcxComboBox
      Left = 109
      Top = 47
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
      Left = 39
      Top = 48
      Caption = 'Periode Awal'
    end
    object spTahun: TcxSpinEdit
      Left = 231
      Top = 47
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 4
      Value = 2019
      Width = 67
    end
    object cxLabel3: TcxLabel
      Left = 196
      Top = 48
      Caption = 'Tahun'
    end
    object btnCalc: TcxButton
      Left = 304
      Top = 44
      Width = 81
      Height = 41
      Caption = 'Hitung Data'
      TabOrder = 6
      OnClick = btnCalcClick
    end
    object crNetProfit: TcxCurrencyEdit
      Left = 109
      Top = 91
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
      Width = 189
    end
    object cxLabel4: TcxLabel
      Left = 56
      Top = 93
      Caption = 'Net Profit'
    end
    object cxLabel5: TcxLabel
      Left = 26
      Top = 116
      Caption = '2.5% Net Profit'
    end
    object crCalc: TcxCurrencyEdit
      Left = 109
      Top = 114
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
      Width = 189
    end
    object cbBulan2: TcxComboBox
      Left = 109
      Top = 69
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
      Top = 70
      Caption = 'Periode Akhir'
    end
    object spTahun2: TcxSpinEdit
      Left = 231
      Top = 69
      Properties.Alignment.Horz = taRightJustify
      TabOrder = 13
      Value = 2019
      Width = 67
    end
    object cxLabel12: TcxLabel
      Left = 196
      Top = 70
      Caption = 'Tahun'
    end
  end
  object cxGroupBox3: TcxGroupBox [3]
    Left = 0
    Top = 153
    Align = alClient
    Caption = ' Input Hutang Zakat '
    TabOrder = 3
    ExplicitTop = 128
    ExplicitWidth = 769
    ExplicitHeight = 394
    Height = 179
    Width = 456
    object cxLabel6: TcxLabel
      Left = 42
      Top = 42
      Caption = 'Badan Zakat'
    end
    object edSupplier: TcxButtonEdit
      Left = 109
      Top = 41
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edSupplierPropertiesButtonClick
      TabOrder = 1
      OnKeyDown = edSupplierKeyDown
      Width = 269
    end
    object edNotes: TcxMemo
      Left = 109
      Top = 62
      TabOrder = 2
      Height = 40
      Width = 269
    end
    object cxLabel7: TcxLabel
      Left = 66
      Top = 63
      Caption = 'Catatan'
    end
    object cxLabel8: TcxLabel
      Left = 49
      Top = 20
      Caption = 'No. Invoice'
    end
    object edNoInv: TcxTextEdit
      Left = 109
      Top = 20
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 5
      Width = 131
    end
    object cxLabel9: TcxLabel
      Left = 251
      Top = 21
      Caption = 'Tanggal'
    end
    object dtInvoice: TcxDateEdit
      Left = 293
      Top = 20
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 7
      Width = 85
    end
    object cxLabel10: TcxLabel
      Left = 55
      Top = 104
      Caption = 'Nilai Zakat'
    end
    object crValue: TcxCurrencyEdit
      Left = 109
      Top = 102
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
      TabOrder = 9
      Width = 189
    end
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
  object RstRequest: TRESTRequest
    Client = RstClient
    Params = <>
    Response = RstResponse
    SynchronizedEvents = False
    Left = 80
    Top = 304
  end
  object RstClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    AutoCreateParams = False
    BaseURL = 'http://api.motoroli.web.id/netprofit/2020.1/2020.6'
    Params = <>
    HandleRedirects = True
    Left = 16
    Top = 304
  end
  object RstResponse: TRESTResponse
    ContentType = 'application/json'
    Left = 48
    Top = 288
  end
end
