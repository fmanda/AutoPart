inherited frmItem: TfrmItem
  Caption = 'Update Data Barang'
  ClientHeight = 588
  ClientWidth = 1194
  KeyPreview = True
  OnKeyDown = FormKeyDown
  ExplicitWidth = 1210
  ExplicitHeight = 627
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 553
    TabOrder = 2
    ExplicitTop = 525
    ExplicitWidth = 1194
    Width = 1194
    inherited btnCancel: TcxButton
      Left = 1109
      ExplicitLeft = 1109
    end
    inherited btnPrint: TcxButton
      Left = 1023
      OnClick = btnPrintClick
      ExplicitLeft = 1023
    end
    inherited btnSave: TcxButton
      Left = 937
      OnClick = btnSaveClick
      ExplicitLeft = 937
    end
    object btnDel: TcxButton
      AlignWithMargins = True
      Left = 119
      Top = 5
      Width = 103
      Height = 25
      Align = alLeft
      Caption = '&Hapus Satuan'
      OptionsImage.ImageIndex = 2
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 3
      Visible = False
      OnClick = btnDelClick
    end
    object btnAdd: TcxButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 108
      Height = 25
      Align = alLeft
      Caption = 'T&ambah Satuan'
      OptionsImage.ImageIndex = 0
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 4
      Visible = False
      OnClick = btnAddClick
    end
  end
  inherited Panel2: TPanel
    Top = 532
    Width = 1194
    TabOrder = 3
    ExplicitTop = 504
    ExplicitWidth = 1194
    inherited lbEscape: TLabel
      Left = 949
      ExplicitLeft = 949
    end
    inherited lgndSave: TLabel
      Left = 1028
      ExplicitLeft = 1028
    end
    inherited lgndPrint: TLabel
      Left = 1115
      ExplicitLeft = 1115
    end
  end
  object cxGroupBox1: TcxGroupBox [2]
    Left = 0
    Top = 0
    Align = alTop
    Caption = ' Informasi Barang [F1] '
    TabOrder = 0
    Height = 177
    Width = 1194
    object cxLabel1: TcxLabel
      Left = 45
      Top = 43
      Caption = 'Kode'
    end
    object edKode: TcxTextEdit
      Left = 77
      Top = 42
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Width = 145
    end
    object cxLabel2: TcxLabel
      Left = 42
      Top = 64
      Caption = 'Nama'
    end
    object edNama: TcxTextEdit
      Left = 77
      Top = 63
      Properties.CharCase = ecUpperCase
      TabOrder = 2
      Width = 292
    end
    object cxLookupGroup: TcxExtLookupComboBox
      Left = 77
      Top = 21
      Properties.OnEditValueChanged = cxLookupGroupPropertiesEditValueChanged
      TabOrder = 0
      OnKeyDown = cxLookupGroupKeyDown
      Width = 244
    end
    object cxLabel3: TcxLabel
      Left = 40
      Top = 22
      Caption = 'Group'
    end
    object cxLabel4: TcxLabel
      Left = 46
      Top = 86
      Caption = 'Merk'
    end
    object cxLookupMerk: TcxExtLookupComboBox
      Left = 77
      Top = 85
      TabOrder = 3
      Width = 292
    end
    object cxLabel5: TcxLabel
      Left = 578
      Top = 22
      Caption = 'Rak'
      Visible = False
    end
    object edRak: TcxTextEdit
      Left = 601
      Top = 21
      Properties.CharCase = ecUpperCase
      TabOrder = 6
      Visible = False
      OnKeyDown = edRakKeyDown
      Width = 81
    end
    object cxLabel6: TcxLabel
      Left = 30
      Top = 107
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 77
      Top = 106
      TabOrder = 4
      Height = 55
      Width = 292
    end
    object crPPN: TcxCurrencyEdit
      Left = 481
      Top = 42
      TabStop = False
      EditValue = 0.000000000000000000
      Enabled = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ',0.00;(,0.00)'
      TabOrder = 7
      Width = 69
    end
    object cxLabel7: TcxLabel
      Left = 434
      Top = 43
      Caption = 'PPN (%)'
      Enabled = False
    end
    object lbModifiedBy: TcxLabel
      Left = 420
      Top = 140
      Caption = 'Modified By'
    end
    object edModifiedBy: TcxTextEdit
      Left = 481
      Top = 140
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 10
      Width = 201
    end
    object lbModified: TcxLabel
      Left = 409
      Top = 119
      Caption = 'Date Modified'
    end
    object dtModified: TcxDateEdit
      Left = 481
      Top = 118
      TabStop = False
      TabOrder = 9
      Width = 133
    end
    object chkActive: TcxCheckBox
      Left = 228
      Top = 42
      TabStop = False
      Caption = 'Active'
      State = cbsChecked
      TabOrder = 20
    end
    object cxLookUpUOM: TcxExtLookupComboBox
      Left = 481
      Top = 21
      TabOrder = 5
      Width = 69
    end
    object cxLabel8: TcxLabel
      Left = 410
      Top = 22
      Caption = 'Satuan Stock'
    end
    object cxLabel11: TcxLabel
      Left = 425
      Top = 65
      Caption = 'Lead Time'
    end
    object spLeadTime: TcxSpinEdit
      Left = 481
      Top = 64
      Properties.Alignment.Horz = taRightJustify
      Properties.MinValue = 1.000000000000000000
      TabOrder = 8
      Value = 1
      Width = 69
    end
    object cxLabel12: TcxLabel
      Left = 556
      Top = 65
      Caption = 'Hari'
    end
  end
  object pgcMain: TcxPageControl [3]
    Left = 0
    Top = 177
    Width = 1194
    Height = 315
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = tsUOM
    Properties.CustomButtons.Buttons = <>
    Properties.TabHeight = 30
    ExplicitHeight = 287
    ClientRectBottom = 315
    ClientRectRight = 1194
    ClientRectTop = 32
    object tsUOM: TcxTabSheet
      Caption = 'Konversi && Harga Satuan [F2]'
      ImageIndex = 0
      ExplicitHeight = 255
      object cxGrid1: TcxGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1188
        Height = 277
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 249
        object cxGrdUOM: TcxGridDBBandedTableView
          PopupMenu = pmMain
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
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
              Caption = 'Satuan'
              Width = 70
            end
            item
              Caption = 'Konversi'#13'(In PCS)'
              Width = 60
            end
            item
              Caption = 'Price List (+PPN)'
              Width = 80
            end
            item
              Caption = 'Harga Beli'
              Styles.Content = styleInfoBk
              Width = 195
            end
            item
              Caption = 'Harga Umum'
              Width = 195
            end
            item
              Caption = '%'
              Position.BandIndex = 4
              Position.ColIndex = 0
              Width = 25
            end
            item
              Caption = 'Rp'
              Position.BandIndex = 4
              Position.ColIndex = 1
              Width = 80
            end
            item
              Caption = 'Harga Bengkel'
              Width = 195
            end
            item
              Caption = '%'
              Position.BandIndex = 7
              Position.ColIndex = 0
              Width = 25
            end
            item
              Caption = 'Rp'
              Position.BandIndex = 7
              Position.ColIndex = 1
              Width = 80
            end
            item
              Caption = 'Harga Grosir'
              Width = 195
            end
            item
              Caption = '%'
              Position.BandIndex = 10
              Position.ColIndex = 0
              Width = 25
            end
            item
              Caption = 'Rp'
              Position.BandIndex = 10
              Position.ColIndex = 1
              Width = 80
            end
            item
              Caption = 'Harga Keliling'
              Width = 195
            end
            item
              Caption = '%'
              Position.BandIndex = 13
              Position.ColIndex = 0
              Width = 25
            end
            item
              Caption = 'Rp'
              Position.BandIndex = 13
              Position.ColIndex = 1
              Width = 80
            end
            item
              Caption = 'Harga Avg'
              Visible = False
              Width = 100
            end
            item
              Caption = '%'
              Position.BandIndex = 3
              Position.ColIndex = 0
              Width = 25
            end
            item
              Caption = 'Rp'
              Position.BandIndex = 3
              Position.ColIndex = 1
              Width = 80
            end
            item
              Caption = '+PPN'
              Position.BandIndex = 3
              Position.ColIndex = 2
              Width = 80
            end
            item
              Caption = '+PPN'
              Position.BandIndex = 4
              Position.ColIndex = 2
              Width = 80
            end
            item
              Caption = '+PPN'
              Position.BandIndex = 7
              Position.ColIndex = 2
              Width = 80
            end
            item
              Caption = '+PPN'
              Position.BandIndex = 10
              Position.ColIndex = 2
              Width = 80
            end
            item
              Caption = '+PPN'
              Position.BandIndex = 13
              Position.ColIndex = 2
              Width = 80
            end>
          object colSatuan: TcxGridDBBandedColumn
            DataBinding.FieldName = 'UOM'
            PropertiesClassName = 'TcxExtLookupComboBoxProperties'
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colKonversi: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Konversi'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0;(,0)'
            Position.BandIndex = 1
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colMarginBeli: TcxGridDBBandedColumn
            DataBinding.FieldName = 'MarginBeli'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.0;(,0.0)'
            Properties.OnEditValueChanged = colMarginBeliPropertiesEditValueChanged
            Styles.Content = styleInfoBk
            Width = 37
            Position.BandIndex = 17
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colHrgBeli: TcxGridDBBandedColumn
            Caption = 'Harga Beli'
            DataBinding.FieldName = 'HargaBeli'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.##;(,0.##)'#10
            Properties.OnEditValueChanged = colHrgBeliPropertiesEditValueChanged
            Styles.Content = styleInfoBk
            Width = 72
            Position.BandIndex = 18
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colMargin1: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Margin1'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.0;(,0.0)'
            Properties.OnEditValueChanged = colMargin1PropertiesEditValueChanged
            Styles.Content = styleMoney
            Position.BandIndex = 5
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colHrgJual1: TcxGridDBBandedColumn
            Caption = 'Harga Umum'
            DataBinding.FieldName = 'HargaJual1'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.##;(,0.##)'#10
            Properties.OnEditValueChanged = colHrgJual1PropertiesEditValueChanged
            Styles.Content = styleMoney
            Position.BandIndex = 6
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colMargin2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Margin2'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.0;(,0.0)'
            Properties.OnEditValueChanged = colMargin2PropertiesEditValueChanged
            Styles.Content = styleInfoBk
            Position.BandIndex = 8
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colHrgJual2: TcxGridDBBandedColumn
            Caption = 'Harga Bengkel'
            DataBinding.FieldName = 'HargaJual2'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.##;(,0.##)'#10
            Properties.OnEditValueChanged = colHrgJual2PropertiesEditValueChanged
            Styles.Content = styleInfoBk
            Position.BandIndex = 9
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colMargin3: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Margin3'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.0;(,0.0)'
            Properties.OnEditValueChanged = colMargin3PropertiesEditValueChanged
            Styles.Content = styleMoney
            Position.BandIndex = 11
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colHrgJual3: TcxGridDBBandedColumn
            Caption = 'Harga Grosir'
            DataBinding.FieldName = 'HargaJual3'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.##;(,0.##)'#10
            Properties.OnEditValueChanged = colHrgJual3PropertiesEditValueChanged
            Styles.Content = styleMoney
            Position.BandIndex = 12
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colMargin4: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Margin4'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.0;(,0.0)'
            Properties.OnEditValueChanged = colMargin4PropertiesEditValueChanged
            Styles.Content = styleInfoBk
            Position.BandIndex = 14
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colHrgJual4: TcxGridDBBandedColumn
            Caption = 'Harga Keliling'
            DataBinding.FieldName = 'HargaJual4'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.##;(,0.##)'#10
            Properties.OnEditValueChanged = colHrgJual4PropertiesEditValueChanged
            Styles.Content = styleInfoBk
            Position.BandIndex = 15
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colPriceList: TcxGridDBBandedColumn
            DataBinding.FieldName = 'PriceList'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0;(,0)'
            Properties.OnEditValueChanged = colPriceListPropertiesEditValueChanged
            Styles.Content = styleMoney
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colPPNBeli: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IncPPNBeli'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.##;(,0.##)'#10
            Properties.OnEditValueChanged = colPPNBeliPropertiesEditValueChanged
            Position.BandIndex = 19
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colPPN1: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IncPPN1'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.##;(,0.##)'#10
            Properties.OnEditValueChanged = colPPN1PropertiesEditValueChanged
            Position.BandIndex = 20
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colPPN2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IncPPN2'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.##;(,0.##)'#10
            Properties.OnEditValueChanged = colPPN2PropertiesEditValueChanged
            Position.BandIndex = 21
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colPPN3: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IncPPN3'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.##;(,0.##)'#10
            Properties.OnEditValueChanged = colPPN3PropertiesEditValueChanged
            Position.BandIndex = 22
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colPPN4: TcxGridDBBandedColumn
            DataBinding.FieldName = 'IncPPN4'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.##;(,0.##)'#10
            Properties.OnEditValueChanged = colPPN4PropertiesEditValueChanged
            Position.BandIndex = 23
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrdUOM
        end
      end
    end
    object tsHistory: TcxTabSheet
      Caption = 'History Perubahan Harga'
      ImageIndex = 1
      TabVisible = False
      ExplicitHeight = 255
    end
    object tsRack: TcxTabSheet
      Caption = 'Update Informasi Rak [F3]'
      ImageIndex = 2
      ExplicitHeight = 255
      object cxGrid2: TcxGrid
        Left = 0
        Top = 0
        Width = 1194
        Height = 283
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 255
        object cxGrdRak: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
            end
            item
              Kind = skSum
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsData.Appending = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 30
          Styles.ContentOdd = styleOdd
          object colRak: TcxGridDBColumn
            DataBinding.FieldName = 'Rak'
            PropertiesClassName = 'TcxButtonEditProperties'
            Properties.Buttons = <
              item
                Default = True
                Kind = bkEllipsis
              end>
            Properties.ReadOnly = False
            Properties.OnButtonClick = colRakPropertiesButtonClick
            HeaderAlignmentHorz = taCenter
            Width = 226
          end
          object colWarehouse: TcxGridDBColumn
            DataBinding.FieldName = 'Warehouse'
            PropertiesClassName = 'TcxExtLookupComboBoxProperties'
            HeaderAlignmentHorz = taCenter
            Width = 231
          end
        end
        object cxGridLevel2: TcxGridLevel
          Caption = 'Detail Transaksi [F2]'
          GridView = cxGrdRak
        end
      end
    end
    object tsAvgCost: TcxTabSheet
      Caption = 'History Harga Pokok Penjualan / Harga Average'
      Enabled = False
      ImageIndex = 1
      ExplicitHeight = 255
      object cxGroupBox3: TcxGroupBox
        Left = 0
        Top = 0
        Align = alTop
        PanelStyle.Active = True
        Style.BorderStyle = ebsFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Height = 35
        Width = 1194
        object btnRefresh: TcxButton
          AlignWithMargins = True
          Left = 1114
          Top = 5
          Width = 75
          Height = 25
          Align = alRight
          Caption = '&Refresh'
          OptionsImage.ImageIndex = 5
          OptionsImage.Images = frmMain.ImageList
          TabOrder = 0
          OnClick = btnRefreshClick
        end
        object EndDate: TcxDateEdit
          AlignWithMargins = True
          Left = 1008
          Top = 5
          Align = alRight
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 1
          Width = 100
        end
        object StartDate: TcxDateEdit
          AlignWithMargins = True
          Left = 883
          Top = 5
          Align = alRight
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 2
          Width = 100
        end
        object cxLabel9: TcxLabel
          Left = 813
          Top = 2
          Align = alRight
          Caption = 'Filter Periode'
          Properties.Alignment.Vert = taVCenter
          AnchorY = 18
        end
        object cxLabel10: TcxLabel
          Left = 986
          Top = 2
          Align = alRight
          Caption = 's/d'
          Properties.Alignment.Vert = taVCenter
          AnchorY = 18
        end
      end
      object cxGrid: TcxGrid
        Left = 0
        Top = 35
        Width = 1194
        Height = 248
        Align = alClient
        TabOrder = 1
        ExplicitHeight = 220
        object cxGrdAvg: TcxGridServerModeTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Filtering.MRUItemsList = False
          Filtering.ColumnAddValueItems = False
          Filtering.ColumnMRUItemsList = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.GroupByBox = False
        end
        object cxGridLevel1: TcxGridLevel
          GridView = cxGrdAvg
        end
      end
    end
  end
  object cxMemo1: TcxMemo [4]
    Left = 0
    Top = 492
    Align = alBottom
    Enabled = False
    Lines.Strings = (
      '*   Harga exclude PPN , Pricelist Inlcude PPN'
      '** Prosentase (%) adalah Diskon dari Harga Price List')
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
    ExplicitTop = 464
    Height = 40
    Width = 1194
  end
  inherited styleRepo: TcxStyleRepository
    Left = 944
    Top = 352
    PixelsPerInch = 96
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 752
    Top = 48
    PixelsPerInch = 96
    object styleMoney: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object styleInfoBk: TcxStyle
      AssignedValues = [svColor]
      Color = clInfoBk
    end
  end
  object pmMain: TPopupMenu
    OnPopup = pmMainPopup
    Left = 440
    Top = 337
    object pmMenuSetHargaIncPPN: TMenuItem
      Caption = 'Set Harga Include PPN'
      OnClick = pmMenuSetHargaIncPPNClick
    end
  end
end
