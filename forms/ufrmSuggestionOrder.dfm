inherited frmSuggestionOrder: TfrmSuggestionOrder
  Caption = 'Suggestion Order'
  ClientHeight = 476
  ClientWidth = 782
  ExplicitWidth = 798
  ExplicitHeight = 515
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    Visible = False
    ExplicitWidth = 782
    Width = 782
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 441
    ExplicitTop = 441
    ExplicitWidth = 782
    Width = 782
    inherited btnTutup: TcxButton
      Left = 702
      ExplicitLeft = 702
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
    Caption = '  Suggestion Order '
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    TabOrder = 2
    DesignSize = (
      782
      67)
    Height = 67
    Width = 782
    object cxLabel3: TcxLabel
      Left = 16
      Top = 24
      Caption = 'Stock Per Tanggal'
    end
    object dtStock: TcxDateEdit
      Left = 110
      Top = 23
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      Width = 123
    end
    object ckGrupMerk: TcxCheckBox
      Left = 417
      Top = 22
      TabStop = False
      Caption = 'Tampilkan Merk && Group Barang'
      Properties.Alignment = taLeftJustify
      Properties.OnEditValueChanged = ckGrupMerkPropertiesEditValueChanged
      State = cbsChecked
      TabOrder = 2
    end
    object rbJenis: TcxRadioGroup
      Left = 254
      Top = 11
      Caption = ' Atas Penjualan '
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = '90 Hari'
        end
        item
          Caption = '30 Hari'
        end>
      ItemIndex = 0
      TabOrder = 3
      Height = 43
      Width = 139
    end
    object cxButton1: TcxButton
      Left = 688
      Top = 39
      Width = 91
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Show/Hide Hints'
      TabOrder = 4
      OnClick = cxButton1Click
    end
  end
  object cxGrid1: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 192
    Width = 776
    Height = 246
    Align = alClient
    TabOrder = 3
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
        end>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.HideSelection = True
      OptionsSelection.InvertSelect = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      Styles.OnGetContentStyle = cxGrdMainStylesGetContentStyle
      object colGroup: TcxGridDBColumn
        Caption = 'Group'
        DataBinding.FieldName = 'ItemGroup'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 125
      end
      object colMerk: TcxGridDBColumn
        DataBinding.FieldName = 'Merk'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        HeaderAlignmentHorz = taCenter
        Width = 114
      end
      object colKode: TcxGridDBColumn
        Caption = 'Kode Barang'
        DataBinding.FieldName = 'Kode'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 98
      end
      object colNama: TcxGridDBColumn
        Caption = 'Nama Barang'
        DataBinding.FieldName = 'Nama'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 309
      end
      object colUOM: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'UOM'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Width = 66
      end
      object colLeadTime: TcxGridDBColumn
        Caption = 'Lead Time (Days)'
        DataBinding.FieldName = 'LeadTime'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 98
      end
      object colADS: TcxGridDBColumn
        Caption = 'Avg Daily Sales'
        DataBinding.FieldName = 'ADS'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 91
      end
      object colROP: TcxGridDBColumn
        DataBinding.FieldName = 'ROP'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 75
      end
      object colStock: TcxGridDBColumn
        Caption = 'Current Stock'
        DataBinding.FieldName = 'Stock'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 80
      end
      object colStockCover: TcxGridDBColumn
        Caption = 'Stock Cover (Day)'
        DataBinding.FieldName = 'StockCover'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 105
      end
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Data Stock'
      GridView = cxGrdMain
    end
  end
  object cxMemo1: TcxMemo [4]
    AlignWithMargins = True
    Left = 3
    Top = 108
    Align = alTop
    Enabled = False
    Lines.Strings = (
      
        '** Lead Time = Waktu yang dibutuhkan untuk pembelian stock dari ' +
        'PO Supplier s/d Barang Datang (dalam Hari)'
      
        '** Avg Daily Sales (ADS) = Rata-rata mutasi keluar / hari baik d' +
        'ari penjualan maupun mutasi stock yang lain (transfer, retur pem' +
        'belian)'
      '** ROP = Reorder Point , 2x LeadTime x Avg Daily Sales'
      
        '** Stock Cover = Perkiraan stock saat ini mencukup untuk berapa ' +
        'hari'
      '** Apabila Stock < ROP , baris item akan diblok merah')
    StyleDisabled.TextColor = clBlack
    TabOrder = 4
    Visible = False
    Height = 78
    Width = 776
  end
  inherited styleRepo: TcxStyleRepository
    Left = 424
    Top = 65528
    PixelsPerInch = 96
    object styleWarning: TcxStyle
      AssignedValues = [svColor]
      Color = 8421631
    end
  end
end
