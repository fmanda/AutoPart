inherited frmPriceQuotation: TfrmPriceQuotation
  Caption = 'Price Quotation / Update Price List'
  ClientHeight = 611
  ClientWidth = 1034
  KeyPreview = True
  OnKeyDown = FormKeyDown
  ExplicitWidth = 1050
  ExplicitHeight = 650
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 576
    TabOrder = 2
    ExplicitTop = 576
    ExplicitWidth = 1034
    Width = 1034
    inherited btnCancel: TcxButton
      Left = 949
      ExplicitLeft = 949
    end
    inherited btnPrint: TcxButton
      Left = 863
      ExplicitLeft = 863
    end
    inherited btnSave: TcxButton
      Left = 777
      OnClick = btnSaveClick
      ExplicitLeft = 777
    end
  end
  inherited Panel2: TPanel
    Top = 555
    Width = 1034
    TabOrder = 3
    ExplicitTop = 555
    ExplicitWidth = 1034
    inherited lbEscape: TLabel
      Left = 954
      Height = 17
      ExplicitLeft = 954
    end
    inherited lgndSave: TLabel
      Left = 789
      Height = 17
      ExplicitLeft = 789
    end
    inherited lgndPrint: TLabel
      Left = 876
      Height = 17
      ExplicitLeft = 876
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 124
      Height = 17
      Margins.Top = 1
      Margins.Right = 13
      Margins.Bottom = 1
      Align = alLeft
      Caption = 'F5 [Lookup Data Barang]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 143
      Top = 1
      Width = 239
      Height = 17
      Margins.Top = 1
      Margins.Right = 13
      Margins.Bottom = 1
      Align = alLeft
      Caption = 'F6 [Lookup Data Barang terakhir diinput / edit]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
  end
  object cxGroupBox1: TcxGroupBox [2]
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header [F1] '
    TabOrder = 0
    Height = 81
    Width = 1034
    object cxLabel1: TcxLabel
      Left = 25
      Top = 20
      Caption = 'No. Bukti'
    end
    object edRefno: TcxTextEdit
      Left = 74
      Top = 19
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      Width = 155
    end
    object cxLabel6: TcxLabel
      Left = 29
      Top = 40
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 74
      Top = 39
      TabOrder = 2
      OnKeyDown = edNotesKeyDown
      Height = 35
      Width = 335
    end
    object dtQuot: TcxDateEdit
      Left = 301
      Top = 19
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 108
    end
    object cxLabel8: TcxLabel
      Left = 256
      Top = 19
      Caption = 'Tanggal'
    end
    object chkActive: TcxCheckBox
      Left = 415
      Top = 20
      TabStop = False
      Caption = 'Active'
      State = cbsChecked
      TabOrder = 6
    end
    object lbModifiedBy: TcxLabel
      Left = 540
      Top = 20
      Caption = 'Modified By'
    end
    object edModifiedBy: TcxTextEdit
      Left = 601
      Top = 19
      TabStop = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      TabOrder = 8
      Width = 201
    end
    object lbModified: TcxLabel
      Left = 529
      Top = 40
      Caption = 'Date Modified'
    end
    object dtModified: TcxDateEdit
      Left = 601
      Top = 39
      TabStop = False
      Properties.ReadOnly = True
      TabOrder = 10
      Width = 133
    end
  end
  object cxGrid1: TcxGrid [3]
    AlignWithMargins = True
    Left = 3
    Top = 84
    Width = 1028
    Height = 446
    Align = alClient
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpTop
    object cxGrdMain: TcxGridDBBandedTableView
      PopupMenu = pmGrid
      Navigator.Buttons.CustomButtons = <>
      OnEditKeyDown = cxGrdMainEditKeyDown
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.Visible = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsCustomize.BandMoving = False
      OptionsData.Appending = True
      OptionsSelection.HideSelection = True
      OptionsView.GroupByBox = False
      OptionsView.BandHeaderHeight = 30
      Bands = <
        item
          Caption = 'Kode Item'
          Width = 74
        end
        item
          Caption = 'Nama Item'
          Width = 194
        end
        item
          Caption = 'Satuan'
          Width = 43
        end
        item
          Caption = 'Konversi'
          Width = 50
        end
        item
          Caption = 'Price List'
          Width = 90
        end
        item
          Caption = 'Harga Beli'
          Width = 131
        end
        item
          Caption = 'Harga Umum'
          Width = 118
        end
        item
          Caption = '%'
          Position.BandIndex = 6
          Position.ColIndex = 0
          Width = 35
        end
        item
          Caption = 'Rp'
          Position.BandIndex = 6
          Position.ColIndex = 1
          Width = 75
        end
        item
          Caption = 'Harga Bengkel'
          Width = 110
        end
        item
          Caption = '%'
          Position.BandIndex = 9
          Position.ColIndex = 0
          Width = 35
        end
        item
          Caption = 'Rp'
          Position.BandIndex = 9
          Position.ColIndex = 1
          Width = 75
        end
        item
          Caption = 'Harga Grosir'
          Width = 110
        end
        item
          Caption = '%'
          Position.BandIndex = 12
          Position.ColIndex = 0
          Width = 35
        end
        item
          Caption = 'Rp'
          Position.BandIndex = 12
          Position.ColIndex = 1
          Width = 75
        end
        item
          Caption = 'Harga Keliling'
          Width = 110
        end
        item
          Caption = '%'
          Position.BandIndex = 15
          Position.ColIndex = 0
          Width = 35
        end
        item
          Caption = 'Rp'
          Position.BandIndex = 15
          Position.ColIndex = 1
          Width = 75
        end
        item
          Caption = 'Harga Avg'
          Visible = False
          Width = 100
        end
        item
          Caption = '%'
          Position.BandIndex = 5
          Position.ColIndex = 0
          Width = 42
        end
        item
          Caption = 'Rp'
          Position.BandIndex = 5
          Position.ColIndex = 1
          Width = 74
        end>
      object colItemCode: TcxGridDBBandedColumn
        DataBinding.FieldName = 'ItemCode'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = colItemCodePropertiesButtonClick
        Properties.OnValidate = colItemCodePropertiesValidate
        Width = 20
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colItemName: TcxGridDBBandedColumn
        DataBinding.FieldName = 'ItemName'
        PropertiesClassName = 'TcxTextEditProperties'
        Width = 20
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colSatuan: TcxGridDBBandedColumn
        DataBinding.FieldName = 'UOM'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Options.Editing = False
        Options.Focusing = False
        Width = 20
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colKonversi: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Konversi'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0;(,0)'
        Options.Editing = False
        Options.Focusing = False
        Width = 20
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colHrgBeli: TcxGridDBBandedColumn
        DataBinding.FieldName = 'HargaBeli'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0;(,0)'
        Properties.OnEditValueChanged = colHrgBeliPropertiesEditValueChanged
        Styles.Content = styleOdd
        Position.BandIndex = 20
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colMargin1: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Margin1'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.0;(,0.0)'
        Properties.OnEditValueChanged = colMargin1PropertiesEditValueChanged
        Styles.Content = styleGreen
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colHrgJual1: TcxGridDBBandedColumn
        DataBinding.FieldName = 'HargaJual1'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0;(,0)'
        Properties.OnEditValueChanged = colHrgJual1PropertiesEditValueChanged
        Styles.Content = styleGreen
        Position.BandIndex = 8
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colMargin2: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Margin2'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.0;(,0.0)'
        Properties.OnEditValueChanged = colMargin2PropertiesEditValueChanged
        Styles.Content = styleOdd
        Position.BandIndex = 10
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colHrgJual2: TcxGridDBBandedColumn
        DataBinding.FieldName = 'HargaJual2'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0;(,0)'
        Properties.OnEditValueChanged = colHrgJual2PropertiesEditValueChanged
        Styles.Content = styleOdd
        Position.BandIndex = 11
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colMargin3: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Margin3'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.0;(,0.0)'
        Properties.OnEditValueChanged = colMargin3PropertiesEditValueChanged
        Styles.Content = styleGreen
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colHrgJual3: TcxGridDBBandedColumn
        DataBinding.FieldName = 'HargaJual3'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0;(,0)'
        Properties.OnEditValueChanged = colHrgJual3PropertiesEditValueChanged
        Styles.Content = styleGreen
        Position.BandIndex = 14
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colMargin4: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Margin4'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.0;(,0.0)'
        Properties.OnEditValueChanged = colMargin4PropertiesEditValueChanged
        Styles.Content = styleOdd
        Position.BandIndex = 16
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colHrgJual4: TcxGridDBBandedColumn
        DataBinding.FieldName = 'HargaJual4'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0;(,0)'
        Properties.OnEditValueChanged = colHrgJual4PropertiesEditValueChanged
        Styles.Content = styleOdd
        Position.BandIndex = 17
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colItemID: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Item'
        Visible = False
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 1
      end
      object colPriceList: TcxGridDBBandedColumn
        DataBinding.FieldName = 'PriceList'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0;(,0)'
        Properties.OnEditValueChanged = colPriceListPropertiesEditValueChanged
        Styles.Content = styleGreen
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colMarginBeli: TcxGridDBBandedColumn
        DataBinding.FieldName = 'MarginBeli'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.OnEditValueChanged = colMarginBeliPropertiesEditValueChanged
        Styles.Content = styleOdd
        Position.BandIndex = 19
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Detail Item'
      GridView = cxGrdMain
    end
  end
  object cxMemo1: TcxMemo [4]
    Left = 0
    Top = 533
    Align = alBottom
    Enabled = False
    Lines.Strings = (
      '** Prosentase (%) dihitung dari Harga Price List')
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.TextColor = clBlack
    Style.TextStyle = [fsBold]
    Style.IsFontAssigned = True
    StyleDisabled.TextColor = clBlack
    TabOrder = 4
    Height = 22
    Width = 1034
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
    object styleGreen: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
  end
  object pmGrid: TPopupMenu
    Left = 352
    Top = 320
    object F6LookupDataBarangterakhirdiinputedit1: TMenuItem
      Caption = 'Lookup Data Barang terakhir diinput / edit [F6]'
      OnClick = F6LookupDataBarangterakhirdiinputedit1Click
    end
  end
end
