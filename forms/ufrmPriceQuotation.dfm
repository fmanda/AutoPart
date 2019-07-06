inherited frmPriceQuotation: TfrmPriceQuotation
  Caption = 'Price Quotation / Update Price List'
  ClientHeight = 611
  ClientWidth = 984
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  ExplicitWidth = 1000
  ExplicitHeight = 650
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 576
    TabOrder = 2
    ExplicitTop = 576
    ExplicitWidth = 984
    Width = 984
    inherited btnCancel: TcxButton
      Left = 899
      ExplicitLeft = 899
    end
    inherited btnPrint: TcxButton
      Left = 813
      ExplicitLeft = 813
    end
    inherited btnSave: TcxButton
      Left = 727
      OnClick = btnSaveClick
      ExplicitLeft = 727
    end
  end
  inherited Panel2: TPanel
    Top = 555
    Width = 984
    TabOrder = 3
    ExplicitTop = 555
    ExplicitWidth = 984
    inherited lbEscape: TLabel
      Left = 904
      Height = 17
      ExplicitLeft = 904
    end
    inherited lgndSave: TLabel
      Left = 739
      Height = 17
      ExplicitLeft = 739
    end
    inherited lgndPrint: TLabel
      Left = 826
      Height = 17
      ExplicitLeft = 826
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
      Width = 266
      Height = 17
      Margins.Top = 1
      Margins.Right = 13
      Margins.Bottom = 1
      Align = alLeft
      Caption = 'Otomatis ditambahkan semua satuan atas barang tsb'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header [F1] '
    TabOrder = 0
    Height = 81
    Width = 984
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
  object cxGrid1: TcxGrid
    AlignWithMargins = True
    Left = 3
    Top = 84
    Width = 978
    Height = 468
    Align = alClient
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpTop
    object cxGrdMain: TcxGridDBBandedTableView
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
          Width = 92
        end
        item
          Caption = 'Nama Item'
          Width = 260
        end
        item
          Caption = 'Satuan'
          Width = 44
        end
        item
          Caption = 'Konversi'
          Width = 53
        end
        item
          Caption = 'Harga Beli'
          Width = 75
        end
        item
          Caption = 'Harga Umum'
          Width = 110
        end
        item
          Caption = '%'
          Position.BandIndex = 5
          Position.ColIndex = 0
          Width = 35
        end
        item
          Caption = 'Rp'
          Position.BandIndex = 5
          Position.ColIndex = 1
          Width = 75
        end
        item
          Caption = 'Harga Bengkel'
          Width = 110
        end
        item
          Caption = '%'
          Position.BandIndex = 8
          Position.ColIndex = 0
          Width = 35
        end
        item
          Caption = 'Rp'
          Position.BandIndex = 8
          Position.ColIndex = 1
          Width = 75
        end
        item
          Caption = 'Harga Grosir'
          Width = 110
        end
        item
          Caption = '%'
          Position.BandIndex = 11
          Position.ColIndex = 0
          Width = 35
        end
        item
          Caption = 'Rp'
          Position.BandIndex = 11
          Position.ColIndex = 1
          Width = 75
        end
        item
          Caption = 'Harga Keliling'
          Width = 110
        end
        item
          Caption = '%'
          Position.BandIndex = 14
          Position.ColIndex = 0
          Width = 35
        end
        item
          Caption = 'Rp'
          Position.BandIndex = 14
          Position.ColIndex = 1
          Width = 75
        end
        item
          Caption = 'Harga Avg'
          Visible = False
          Width = 100
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
        Options.Editing = False
        Options.Focusing = False
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
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colMargin1: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Margin1'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.0;(,0.0)'
        Properties.OnEditValueChanged = colMargin1PropertiesEditValueChanged
        Position.BandIndex = 6
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colHrgJual1: TcxGridDBBandedColumn
        DataBinding.FieldName = 'HargaJual1'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0;(,0)'
        Properties.OnEditValueChanged = colHrgJual1PropertiesEditValueChanged
        Position.BandIndex = 7
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colMargin2: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Margin2'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.0;(,0.0)'
        Properties.OnEditValueChanged = colMargin2PropertiesEditValueChanged
        Position.BandIndex = 9
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colHrgJual2: TcxGridDBBandedColumn
        DataBinding.FieldName = 'HargaJual2'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0;(,0)'
        Properties.OnEditValueChanged = colHrgJual2PropertiesEditValueChanged
        Position.BandIndex = 10
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colMargin3: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Margin3'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.0;(,0.0)'
        Properties.OnEditValueChanged = colMargin3PropertiesEditValueChanged
        Position.BandIndex = 12
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colHrgJual3: TcxGridDBBandedColumn
        DataBinding.FieldName = 'HargaJual3'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0;(,0)'
        Properties.OnEditValueChanged = colHrgJual3PropertiesEditValueChanged
        Position.BandIndex = 13
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colMargin4: TcxGridDBBandedColumn
        DataBinding.FieldName = 'Margin4'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.0;(,0.0)'
        Properties.OnEditValueChanged = colMargin4PropertiesEditValueChanged
        Position.BandIndex = 15
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object colHrgJual4: TcxGridDBBandedColumn
        DataBinding.FieldName = 'HargaJual4'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0;(,0)'
        Properties.OnEditValueChanged = colHrgJual4PropertiesEditValueChanged
        Position.BandIndex = 16
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
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Detail Item'
      GridView = cxGrdMain
    end
  end
end
