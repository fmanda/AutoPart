inherited frmTransferStock: TfrmTransferStock
  Caption = 'Transfer Stock Antar Gudang'
  ClientHeight = 535
  ClientWidth = 753
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  ExplicitWidth = 769
  ExplicitHeight = 574
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 500
    TabOrder = 2
    ExplicitTop = 500
    ExplicitWidth = 747
    Width = 753
    inherited btnCancel: TcxButton
      Left = 668
      ExplicitLeft = 662
    end
    inherited btnPrint: TcxButton
      Left = 582
      ExplicitLeft = 576
    end
    inherited btnSave: TcxButton
      Left = 496
      OnClick = btnSaveClick
      ExplicitLeft = 490
    end
  end
  inherited Panel2: TPanel
    Top = 479
    Width = 753
    TabOrder = 3
    ExplicitTop = 479
    ExplicitWidth = 747
    inherited lbEscape: TLabel
      Left = 673
      Height = 17
      ExplicitLeft = 667
    end
    inherited lgndSave: TLabel
      Left = 508
      Height = 17
      ExplicitLeft = 502
    end
    inherited lgndPrint: TLabel
      Left = 595
      Height = 17
      ExplicitLeft = 589
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Transfer [F1] '
    TabOrder = 0
    ExplicitWidth = 774
    Height = 133
    Width = 753
    object cxLabel1: TcxLabel
      Left = 223
      Top = 23
      Caption = 'No. Bukti'
    end
    object edRefno: TcxTextEdit
      Left = 272
      Top = 22
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Width = 155
    end
    object cxLabel6: TcxLabel
      Left = 227
      Top = 86
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 272
      Top = 85
      TabOrder = 5
      OnKeyDown = edNotesKeyDown
      Height = 35
      Width = 335
    end
    object dtTransfer: TcxDateEdit
      Left = 499
      Top = 22
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 2
      Width = 108
    end
    object cxLabel8: TcxLabel
      Left = 454
      Top = 22
      Caption = 'Tanggal'
    end
    object cxLabel7: TcxLabel
      Left = 206
      Top = 44
      Caption = 'Gudang Asal'
    end
    object cxLookupWHAsal: TcxExtLookupComboBox
      Left = 272
      Top = 43
      TabOrder = 3
      Width = 335
    end
    object cxLookupWHTujuan: TcxExtLookupComboBox
      Left = 272
      Top = 64
      TabOrder = 4
      Width = 335
    end
    object cxLabel4: TcxLabel
      Left = 193
      Top = 65
      Caption = 'Gudang Tujuan'
    end
    object rbTransfer: TcxRadioGroup
      Left = 22
      Top = 21
      Caption = ' Jenis Transfer'
      Properties.Items = <
        item
          Caption = 'Antar Gudang Internal'
        end
        item
          Caption = 'Kirim Ke Cabang Lain'
        end
        item
          Caption = 'Terima Dari Cabang Lain'
        end>
      Properties.OnEditValueChanged = rbTransferPropertiesEditValueChanged
      ItemIndex = 0
      TabOrder = 0
      Height = 91
      Width = 159
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 133
    Width = 753
    Height = 346
    Align = alClient
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitTop = 139
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnEditKeyDown = cxGrdMainEditKeyDown
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          Column = colQty
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
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      object colKode: TcxGridDBColumn
        Caption = 'Kode Barang'
        DataBinding.FieldName = 'Kode'
        PropertiesClassName = 'TcxButtonEditProperties'
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.OnButtonClick = colKodePropertiesButtonClick
        Properties.OnValidate = colKodePropertiesValidate
        HeaderAlignmentHorz = taCenter
        Width = 137
      end
      object colNama: TcxGridDBColumn
        Caption = 'Nama Barang'
        DataBinding.FieldName = 'Nama'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 430
      end
      object colUOM: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'UOM'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.OnCloseUp = colUOMPropertiesCloseUp
        Properties.OnEditValueChanged = colUOMPropertiesEditValueChanged
        Properties.OnInitPopup = colUOMPropertiesInitPopup
        HeaderAlignmentHorz = taCenter
        Width = 69
      end
      object colQty: TcxGridDBColumn
        DataBinding.FieldName = 'Qty'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 68
      end
      object colItemID: TcxGridDBColumn
        DataBinding.FieldName = 'Item'
        Visible = False
        Options.Editing = False
      end
      object colKonversi: TcxGridDBColumn
        DataBinding.FieldName = 'Konversi'
        Visible = False
        Options.Editing = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Detail Transaksi [F2]'
      GridView = cxGrdMain
    end
  end
end
