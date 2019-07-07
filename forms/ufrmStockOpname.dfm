inherited frmStockOpname: TfrmStockOpname
  Caption = 'Stock Opname'
  ClientHeight = 580
  ClientWidth = 870
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  ExplicitWidth = 886
  ExplicitHeight = 619
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 545
    TabOrder = 1
    Width = 870
    inherited btnCancel: TcxButton
      Left = 785
    end
    inherited btnPrint: TcxButton
      Left = 699
    end
    inherited btnSave: TcxButton
      Left = 613
      OnClick = btnSaveClick
    end
    object btnReloadStock: TcxButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 180
      Height = 25
      Align = alLeft
      Caption = 'Load Stock System'
      OptionsImage.ImageIndex = 5
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 3
      OnClick = btnReloadStockClick
    end
  end
  inherited Panel2: TPanel
    Top = 524
    Width = 870
    TabOrder = 2
    ExplicitTop = 321
    inherited lbEscape: TLabel
      Left = 790
      Height = 17
    end
    inherited lgndSave: TLabel
      Left = 625
      Height = 17
    end
    inherited lgndPrint: TLabel
      Left = 712
      Height = 17
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Stock Opname [F1] '
    TabOrder = 0
    Height = 130
    Width = 870
    object cxLabel1: TcxLabel
      Left = 191
      Top = 22
      Caption = 'No. Bukti'
    end
    object edRefno: TcxTextEdit
      Left = 240
      Top = 21
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Width = 155
    end
    object cxLabel6: TcxLabel
      Left = 195
      Top = 64
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 240
      Top = 63
      TabOrder = 4
      OnKeyDown = edNotesKeyDown
      Height = 35
      Width = 335
    end
    object dtSO: TcxDateEdit
      Left = 467
      Top = 21
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 2
      Width = 108
    end
    object cxLabel8: TcxLabel
      Left = 422
      Top = 21
      Caption = 'Tanggal'
    end
    object cxLabel7: TcxLabel
      Left = 197
      Top = 43
      Caption = 'Gudang'
    end
    object cxLookupWH: TcxExtLookupComboBox
      Left = 240
      Top = 42
      Properties.OnEditValueChanged = cxLookupWHPropertiesEditValueChanged
      TabOrder = 3
      Width = 335
    end
    object rbSO: TcxRadioGroup
      Left = 14
      Top = 18
      Caption = ' Jenis Stock Opname '
      Properties.Items = <
        item
          Caption = 'Parsial / Barang tertentu'
        end
        item
          Caption = 'Full / Semua Barang'
        end>
      Properties.OnEditValueChanged = rbSOPropertiesEditValueChanged
      ItemIndex = 0
      TabOrder = 0
      Height = 78
      Width = 163
    end
    object cxLabel2: TcxLabel
      Left = 3
      Top = 110
      Caption = 
        '* Pastikan Jenis && Gudang dipilih terlebih dahulu, Merubah jeni' +
        's / gudang akan mereset item yang sudah diinput'
      Style.TextColor = clMaroon
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 130
    Width = 870
    Height = 394
    Align = alClient
    TabOrder = 3
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitTop = 120
    ExplicitWidth = 770
    ExplicitHeight = 403
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
      FilterRow.Visible = True
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
        Width = 355
      end
      object colUOM: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'UOM'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.ReadOnly = True
        Properties.OnCloseUp = colUOMPropertiesCloseUp
        Properties.OnEditValueChanged = colUOMPropertiesEditValueChanged
        Properties.OnInitPopup = colUOMPropertiesInitPopup
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 69
      end
      object colKonversi: TcxGridDBColumn
        DataBinding.FieldName = 'Konversi'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
      end
      object colQty: TcxGridDBColumn
        Caption = 'Qty Fisik'
        DataBinding.FieldName = 'Qty'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.OnEditValueChanged = colQtyPropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Width = 74
      end
      object colQtySys: TcxGridDBColumn
        Caption = 'Qty System'
        DataBinding.FieldName = 'QtySys'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 71
      end
      object colItemID: TcxGridDBColumn
        DataBinding.FieldName = 'Item'
        Visible = False
        Options.Editing = False
      end
      object colVariant: TcxGridDBColumn
        Caption = 'Selisih'
        DataBinding.FieldName = 'Variant'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Detail Transaksi [F2]'
      GridView = cxGrdMain
    end
  end
end
