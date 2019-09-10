inherited frmTransferRequest: TfrmTransferRequest
  Caption = 'Transfer Request'
  ClientHeight = 539
  ClientWidth = 765
  KeyPreview = True
  OnKeyDown = FormKeyDown
  ExplicitWidth = 781
  ExplicitHeight = 578
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 504
    TabOrder = 2
    Width = 765
    inherited btnCancel: TcxButton
      Left = 680
    end
    inherited btnPrint: TcxButton
      Left = 594
      OnClick = btnPrintClick
    end
    inherited btnSave: TcxButton
      Left = 508
      OnClick = btnSaveClick
    end
  end
  inherited Panel2: TPanel
    Top = 483
    Width = 765
    TabOrder = 3
    inherited lbEscape: TLabel
      Left = 685
      Height = 17
    end
    inherited lgndSave: TLabel
      Left = 520
      Height = 17
    end
    inherited lgndPrint: TLabel
      Left = 607
      Height = 17
    end
  end
  object cxGroupBox1: TcxGroupBox [2]
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Transfer [F1] '
    TabOrder = 0
    Height = 113
    Width = 765
    object cxLabel1: TcxLabel
      Left = 23
      Top = 22
      Caption = 'No. Bukti'
    end
    object edRefno: TcxTextEdit
      Left = 72
      Top = 21
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      Width = 155
    end
    object cxLabel6: TcxLabel
      Left = 27
      Top = 44
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 72
      Top = 43
      TabOrder = 2
      OnKeyDown = edNotesKeyDown
      Height = 35
      Width = 335
    end
    object dtTransfer: TcxDateEdit
      Left = 299
      Top = 21
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 108
    end
    object cxLabel8: TcxLabel
      Left = 254
      Top = 21
      Caption = 'Tanggal'
    end
    object cxLabel2: TcxLabel
      Left = 459
      Top = 23
      Caption = 'Kode Cabang'
    end
    object edKodeCabang: TcxTextEdit
      Left = 528
      Top = 21
      TabStop = False
      Enabled = False
      Properties.CharCase = ecUpperCase
      TabOrder = 7
      Width = 69
    end
    object edNamaCabang: TcxTextEdit
      Left = 528
      Top = 44
      TabStop = False
      Enabled = False
      Properties.CharCase = ecUpperCase
      TabOrder = 8
      Width = 208
    end
    object cxLabel3: TcxLabel
      Left = 456
      Top = 45
      Caption = 'Nama Cabang'
    end
    object ckPriceQuot: TcxCheckBox
      Left = 14
      Top = 79
      Caption = 'Export'
      State = cbsChecked
      TabOrder = 10
    end
    object edFile: TcxButtonEdit
      Left = 72
      Top = 79
      Properties.Buttons = <
        item
          Default = True
          ImageIndex = 8
          Kind = bkGlyph
        end>
      Properties.Images = frmMain.ImageList
      TabOrder = 11
      Width = 335
    end
  end
  object cxGrid1: TcxGrid [3]
    Left = 0
    Top = 113
    Width = 765
    Height = 370
    Align = alClient
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitTop = 95
    ExplicitWidth = 744
    ExplicitHeight = 394
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
      OptionsCustomize.ColumnSorting = False
      OptionsData.Appending = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      Styles.ContentOdd = styleOdd
      object colNo: TcxGridDBColumn
        Caption = 'No.'
        OnGetDisplayText = colNoGetDisplayText
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 44
      end
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
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
