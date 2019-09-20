inherited frmTransferStock: TfrmTransferStock
  Caption = 'Transfer Stock Antar Gudang'
  ClientHeight = 535
  ClientWidth = 780
  KeyPreview = True
  OnKeyDown = FormKeyDown
  ExplicitWidth = 796
  ExplicitHeight = 574
  PixelsPerInch = 96
  TextHeight = 13
  object lbWarning: TLabel [0]
    AlignWithMargins = True
    Left = 3
    Top = 140
    Width = 762
    Height = 18
    Margins.Top = 1
    Margins.Right = 15
    Margins.Bottom = 1
    Align = alTop
    Caption = 
      'Sebelum Simpan, Pastikan Item yang diimport sama dengan Dokumen ' +
      'Transfer / Surat Jalan yang diampirkan !!!'
    Color = 8454143
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = False
    ExplicitWidth = 627
  end
  inherited cxGroupBox2: TcxGroupBox
    Top = 500
    TabOrder = 2
    ExplicitTop = 500
    ExplicitWidth = 753
    Width = 780
    inherited btnCancel: TcxButton
      Left = 695
      ExplicitLeft = 668
    end
    inherited btnPrint: TcxButton
      Left = 609
      Visible = True
      OnClick = btnPrintClick
      ExplicitLeft = 582
    end
    inherited btnSave: TcxButton
      Left = 523
      OnClick = btnSaveClick
      ExplicitLeft = 496
    end
    object btnTransfer: TcxButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 106
      Height = 25
      Align = alLeft
      Caption = '&Transfer File'
      OptionsImage.ImageIndex = 5
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 3
      OnClick = btnTransferClick
    end
  end
  inherited Panel2: TPanel
    Top = 479
    Width = 780
    TabOrder = 3
    ExplicitTop = 479
    ExplicitWidth = 753
    inherited lbEscape: TLabel
      Left = 700
      Height = 17
      ExplicitLeft = 673
    end
    inherited lgndSave: TLabel
      Left = 535
      Height = 17
      ExplicitLeft = 508
    end
    inherited lgndPrint: TLabel
      Left = 622
      Height = 17
      Visible = True
      ExplicitLeft = 595
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 538
      Height = 17
      Margins.Top = 1
      Margins.Right = 15
      Margins.Bottom = 1
      Align = alLeft
      Caption = 
        'Sebelum Klik Tombol Simpan, Lakukan pengecekan Item Import denga' +
        'n dokumen Fisik Transfer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Trebuchet MS'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitHeight = 18
    end
  end
  object cxGroupBox1: TcxGroupBox [3]
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Transfer [F1] '
    TabOrder = 0
    ExplicitWidth = 753
    Height = 139
    Width = 780
    object cxLabel1: TcxLabel
      Left = 212
      Top = 21
      Caption = 'No. Bukti'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 259
    end
    object edRefno: TcxTextEdit
      Left = 261
      Top = 20
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Width = 155
    end
    object cxLabel6: TcxLabel
      Left = 216
      Top = 84
      Caption = 'Catatan'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 259
    end
    object edNotes: TcxMemo
      Left = 261
      Top = 83
      TabOrder = 5
      OnKeyDown = edNotesKeyDown
      Height = 40
      Width = 335
    end
    object dtTransfer: TcxDateEdit
      Left = 488
      Top = 20
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 2
      Width = 108
    end
    object cxLabel8: TcxLabel
      Left = 443
      Top = 20
      Caption = 'Tanggal'
    end
    object cxLabel7: TcxLabel
      Left = 195
      Top = 42
      Caption = 'Gudang Asal'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 259
    end
    object cxLookupWHAsal: TcxExtLookupComboBox
      Left = 261
      Top = 41
      TabOrder = 3
      Width = 335
    end
    object cxLookupWHTujuan: TcxExtLookupComboBox
      Left = 261
      Top = 62
      TabOrder = 4
      Width = 335
    end
    object cxLabel4: TcxLabel
      Left = 182
      Top = 63
      Caption = 'Gudang Tujuan'
      Properties.Alignment.Horz = taRightJustify
      AnchorX = 259
    end
    object rbTransfer: TcxRadioGroup
      Left = 13
      Top = 16
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
      Height = 82
      Width = 156
    end
    object btnLoadFromFile: TcxButton
      AlignWithMargins = True
      Left = 13
      Top = 99
      Width = 156
      Height = 24
      Cursor = crHandPoint
      Margins.Top = 2
      Margins.Bottom = 2
      Caption = '&Load From File...'
      OptionsImage.ImageIndex = 7
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 11
      OnClick = btnLoadFromFileClick
    end
  end
  object cxGrid1: TcxGrid [4]
    Left = 0
    Top = 159
    Width = 780
    Height = 320
    Align = alClient
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitTop = 139
    ExplicitWidth = 753
    ExplicitHeight = 340
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
    Left = 648
    Top = 344
    PixelsPerInch = 96
  end
  object opDialog: TOpenDialog
    FilterIndex = 0
    Left = 616
    Top = 65
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '*.trf'
    Filter = 'AutoPart Transfer File|*.trf'
    FilterIndex = 0
    Left = 440
    Top = 329
  end
end
