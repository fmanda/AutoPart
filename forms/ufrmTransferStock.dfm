inherited frmTransferStock: TfrmTransferStock
  Caption = 'Transfer Stock Antar Gudang'
  ClientHeight = 535
  ClientWidth = 747
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  ExplicitWidth = 763
  ExplicitHeight = 574
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 500
    Width = 747
    inherited btnCancel: TcxButton
      Left = 662
    end
    inherited btnPrint: TcxButton
      Left = 576
    end
    inherited btnSave: TcxButton
      Left = 490
      OnClick = btnSaveClick
    end
  end
  inherited Panel2: TPanel
    Top = 479
    Width = 747
    ExplicitTop = 321
    inherited lbEscape: TLabel
      Left = 667
      Height = 17
    end
    inherited lgndSave: TLabel
      Left = 502
      Height = 17
    end
    inherited lgndPrint: TLabel
      Left = 589
      Height = 17
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Transfer [F1] '
    TabOrder = 2
    ExplicitWidth = 874
    Height = 129
    Width = 747
    object cxLabel1: TcxLabel
      Left = 63
      Top = 21
      Caption = 'No. Bukti'
    end
    object edRefno: TcxTextEdit
      Left = 114
      Top = 20
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      Width = 155
    end
    object cxLabel6: TcxLabel
      Left = 67
      Top = 84
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 114
      Top = 83
      TabOrder = 4
      OnKeyDown = edNotesKeyDown
      Height = 35
      Width = 335
    end
    object dtTransfer: TcxDateEdit
      Left = 341
      Top = 20
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 108
    end
    object cxLabel8: TcxLabel
      Left = 296
      Top = 20
      Caption = 'Tanggal'
    end
    object cxLabel7: TcxLabel
      Left = 46
      Top = 42
      Caption = 'Gudang Asal'
    end
    object cxLookupWHAsal: TcxExtLookupComboBox
      Left = 114
      Top = 41
      TabOrder = 2
      Width = 335
    end
    object cxLookupWHTujuan: TcxExtLookupComboBox
      Left = 114
      Top = 62
      TabOrder = 3
      Width = 335
    end
    object cxLabel4: TcxLabel
      Left = 33
      Top = 63
      Caption = 'Gudang Tujuan'
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 129
    Width = 747
    Height = 350
    Align = alClient
    TabOrder = 3
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitLeft = -110
    ExplicitTop = 153
    ExplicitWidth = 984
    ExplicitHeight = 378
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
