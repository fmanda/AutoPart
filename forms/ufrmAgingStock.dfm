inherited frmAgingStock: TfrmAgingStock
  Caption = 'Aging Stock / Umur Stock'
  ClientHeight = 608
  ClientWidth = 984
  ExplicitWidth = 1000
  ExplicitHeight = 647
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox1: TcxGroupBox
    ExplicitWidth = 984
    Width = 984
    inherited lblTitle: TcxLabel
      Style.IsFontAssigned = True
      AnchorY = 18
    end
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 573
    ExplicitTop = 573
    ExplicitWidth = 984
    Width = 984
    inherited btnTutup: TcxButton
      Left = 904
      ExplicitLeft = 904
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
    TabOrder = 2
    Height = 67
    Width = 984
    object cxLabel3: TcxLabel
      Left = 40
      Top = 28
      Caption = 'Stock Per Tanggal'
    end
    object dtStock: TcxDateEdit
      Left = 134
      Top = 27
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 0
      Width = 123
    end
    object ckGrupMerk: TcxCheckBox
      Left = 497
      Top = 30
      TabStop = False
      Caption = 'Tampilkan Merk && Group Barang'
      Properties.Alignment = taLeftJustify
      State = cbsChecked
      TabOrder = 2
    end
    object rbJenis: TcxRadioGroup
      Left = 286
      Top = 12
      Caption = ' Jenis Report '
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = 'Qty Stock'
        end
        item
          Caption = 'Nilai Stock'
        end>
      Properties.OnEditValueChanged = rbJenisPropertiesEditValueChanged
      ItemIndex = 0
      TabOrder = 3
      Height = 43
      Width = 185
    end
    object cxMemo1: TcxMemo
      AlignWithMargins = True
      Left = 565
      Top = 21
      Align = alRight
      Enabled = False
      Lines.Strings = (
        
          '** Aging stock memetakan umur stock dalam range hari dengan asum' +
          'si FIFO'
        '** Aging stock akan di reset setiap awal tahun / End Of Year')
      StyleDisabled.TextColor = clBlack
      TabOrder = 4
      Height = 41
      Width = 414
    end
  end
  object cxGrid1: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 108
    Width = 978
    Height = 462
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
          Column = colQty
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colValue
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colRange1
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colRange2
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colRange3
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colRange4
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colRange5
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colValue1
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colValue2
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colValue3
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colValue4
        end
        item
          Format = ',0.##;(,0.##)'
          Kind = skSum
          Column = colValue5
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
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      Styles.ContentOdd = styleOdd
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
      object colNotes: TcxGridDBColumn
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
        Width = 51
      end
      object colRange1: TcxGridDBColumn
        Caption = '0 - 30 Hari'
        DataBinding.FieldName = 'Range1'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Styles.OnGetContentStyle = colRange1StylesGetContentStyle
        Width = 75
      end
      object colRange2: TcxGridDBColumn
        Caption = '31 - 60 Hari'
        DataBinding.FieldName = 'Range2'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Styles.OnGetContentStyle = colRange2StylesGetContentStyle
        Width = 75
      end
      object colRange3: TcxGridDBColumn
        Caption = '61 - 90 Hari'
        DataBinding.FieldName = 'Range3'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Styles.OnGetContentStyle = colRange3StylesGetContentStyle
        Width = 75
      end
      object colRange4: TcxGridDBColumn
        Caption = '91 - 120 Hari'
        DataBinding.FieldName = 'Range4'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Styles.OnGetContentStyle = colRange4StylesGetContentStyle
        Width = 75
      end
      object colRange5: TcxGridDBColumn
        Caption = '> 120 Hari'
        DataBinding.FieldName = 'Range5'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Styles.OnGetContentStyle = colRange5StylesGetContentStyle
        Width = 75
      end
      object colValue1: TcxGridDBColumn
        Caption = '0 - 30 Hari'
        DataBinding.FieldName = 'ValueRange1'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Styles.OnGetContentStyle = colValue1StylesGetContentStyle
        Width = 75
      end
      object colValue2: TcxGridDBColumn
        Caption = '31 - 60 Hari'
        DataBinding.FieldName = 'ValueRange2'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Styles.OnGetContentStyle = colValue2StylesGetContentStyle
        Width = 75
      end
      object colValue3: TcxGridDBColumn
        Caption = '61 - 90 Hari'
        DataBinding.FieldName = 'ValueRange3'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Styles.OnGetContentStyle = colValue3StylesGetContentStyle
        Width = 75
      end
      object colValue4: TcxGridDBColumn
        Caption = '91 - 120 Hari'
        DataBinding.FieldName = 'ValueRange4'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Styles.OnGetContentStyle = colValue4StylesGetContentStyle
        Width = 75
      end
      object colValue5: TcxGridDBColumn
        Caption = '> 120 Hari'
        DataBinding.FieldName = 'ValueRange5'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Styles.OnGetContentStyle = colValue5StylesGetContentStyle
        Width = 75
      end
      object colQty: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'TotalQty'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 67
      end
      object colValue: TcxGridDBColumn
        Caption = 'Total'
        DataBinding.FieldName = 'TotalValue'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
      end
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Data Stock'
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 336
    Top = 304
    PixelsPerInch = 96
    object styleRange1: TcxStyle
      AssignedValues = [svColor]
      Color = 12320699
    end
    object styleRange2: TcxStyle
      AssignedValues = [svColor]
      Color = 8454143
    end
    object styleRange3: TcxStyle
      AssignedValues = [svColor]
      Color = 8432127
    end
    object styleRange4: TcxStyle
      AssignedValues = [svColor]
      Color = 8421631
    end
    object styleRange5: TcxStyle
      AssignedValues = [svColor]
      Color = 5197823
    end
    object cxStyle1: TcxStyle
    end
  end
end
