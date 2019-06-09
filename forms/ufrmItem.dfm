inherited frmItem: TfrmItem
  Caption = 'Update Data Barang'
  ClientHeight = 545
  ClientWidth = 738
  ExplicitWidth = 754
  ExplicitHeight = 584
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 510
    TabOrder = 2
    ExplicitTop = 545
    ExplicitWidth = 801
    Width = 738
    inherited btnCancel: TcxButton
      Left = 653
      ExplicitLeft = 716
    end
    inherited btnPrint: TcxButton
      Left = 567
      ExplicitLeft = 630
    end
    inherited btnSave: TcxButton
      Left = 481
      ExplicitLeft = 544
    end
    object btnAdd: TcxButton
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
    end
    object btnDel: TcxButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 108
      Height = 25
      Align = alLeft
      Caption = '&Tambah Satuan'
      OptionsImage.ImageIndex = 0
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 4
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = ' Informasi Barang '
    TabOrder = 0
    ExplicitWidth = 911
    Height = 177
    Width = 738
    object cxLabel1: TcxLabel
      Left = 45
      Top = 43
      Caption = 'Kode'
    end
    object edKode: TcxTextEdit
      Left = 77
      Top = 42
      Properties.CharCase = ecUpperCase
      TabOrder = 2
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
      TabOrder = 3
      Width = 292
    end
    object cxExtLookupComboBox1: TcxExtLookupComboBox
      Left = 77
      Top = 21
      TabOrder = 1
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
    object cxExtLookupComboBox2: TcxExtLookupComboBox
      Left = 77
      Top = 85
      TabOrder = 4
      Width = 292
    end
    object cxLabel5: TcxLabel
      Left = 450
      Top = 22
      Caption = 'Rak'
    end
    object cxTextEdit1: TcxTextEdit
      Left = 476
      Top = 21
      Properties.CharCase = ecUpperCase
      TabOrder = 6
      Width = 201
    end
    object cxLabel6: TcxLabel
      Left = 30
      Top = 107
      Caption = 'Catatan'
    end
    object cxMemo1: TcxMemo
      Left = 77
      Top = 106
      TabOrder = 5
      Height = 55
      Width = 292
    end
    object cxCurrencyEdit1: TcxCurrencyEdit
      Left = 476
      Top = 42
      EditValue = 0.000000000000000000
      Properties.Alignment.Horz = taRightJustify
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = ',0.00;(,0.00)'
      TabOrder = 7
      Width = 69
    end
    object cxLabel7: TcxLabel
      Left = 429
      Top = 43
      Caption = 'PPN (%)'
    end
    object cxLabel8: TcxLabel
      Left = 415
      Top = 85
      Caption = 'Modified By'
    end
    object cxTextEdit2: TcxTextEdit
      Left = 476
      Top = 85
      Properties.CharCase = ecUpperCase
      TabOrder = 9
      Width = 201
    end
    object cxLabel9: TcxLabel
      Left = 404
      Top = 64
      Caption = 'Date Modified'
    end
    object cxDateEdit1: TcxDateEdit
      Left = 476
      Top = 63
      TabOrder = 8
      Width = 133
    end
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 177
    Width = 738
    Height = 333
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = tsUOM
    Properties.CustomButtons.Buttons = <>
    Properties.TabHeight = 30
    ExplicitLeft = 224
    ExplicitTop = 56
    ExplicitWidth = 289
    ExplicitHeight = 193
    ClientRectBottom = 333
    ClientRectRight = 738
    ClientRectTop = 32
    object tsUOM: TcxTabSheet
      Caption = 'Konversi && Harga Satuan'
      ImageIndex = 0
      ExplicitTop = 24
      ExplicitWidth = 289
      ExplicitHeight = 169
      object cxGrid1: TcxGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 732
        Height = 295
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 283
        ExplicitHeight = 163
        object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnMoving = False
          OptionsCustomize.ColumnSorting = False
          OptionsCustomize.BandMoving = False
          OptionsView.GroupByBox = False
          OptionsView.Header = False
          OptionsView.BandHeaderHeight = 30
          Bands = <
            item
              Caption = 'Satuan'
              Width = 70
            end
            item
              Caption = 'Konversi'#13'(Dalam PCS)'
              Width = 75
            end
            item
              Caption = 'Harga Beli'
              Width = 75
            end
            item
              Caption = 'Harga Jual 1'
              Width = 110
            end
            item
              Caption = '%'
              Position.BandIndex = 3
              Position.ColIndex = 0
              Width = 35
            end
            item
              Caption = 'Rp'
              Position.BandIndex = 3
              Position.ColIndex = 1
              Width = 75
            end
            item
              Caption = 'Harga Jual 2'
              Width = 110
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
              Caption = 'Harga Jual 3'
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
              Caption = 'Harga Jual 4'
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
              Caption = 'Harga Avg'
              Visible = False
              Width = 100
            end>
          object colSatuan: TcxGridDBBandedColumn
            DataBinding.FieldName = 'UOM_ID'
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
          object colHrgBeli: TcxGridDBBandedColumn
            DataBinding.FieldName = 'HargaBeli'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0;(,0)'
            Position.BandIndex = 2
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colMargin1: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Margin1'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Position.BandIndex = 4
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colHrgJual1: TcxGridDBBandedColumn
            DataBinding.FieldName = 'HargaJual1'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0;(,0)'
            Position.BandIndex = 5
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colMargin2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Margin2'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Position.BandIndex = 7
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object clHrgJual2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'HargaJual2'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0;(,0)'
            Position.BandIndex = 8
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colMargin3: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Margin3'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Position.BandIndex = 10
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colHrgJual3: TcxGridDBBandedColumn
            DataBinding.FieldName = 'HargaJual3'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0;(,0)'
            Position.BandIndex = 11
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colMargin4: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Margin4'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.00;(,0.00)'
            Position.BandIndex = 13
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object colHrgJual4: TcxGridDBBandedColumn
            DataBinding.FieldName = 'HargaJual4'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0;(,0)'
            Position.BandIndex = 14
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBBandedTableView1
        end
      end
    end
    object tsHistory: TcxTabSheet
      Caption = 'History Perubahan Harga'
      ImageIndex = 1
      ExplicitTop = 24
      ExplicitWidth = 742
      ExplicitHeight = 283
    end
  end
end
