inherited frmKKSO: TfrmKKSO
  Caption = 'Kartu Kerja Stock Opname (KKSO)'
  ClientHeight = 661
  ClientWidth = 783
  KeyPreview = True
  OnKeyDown = FormKeyDown
  ExplicitWidth = 799
  ExplicitHeight = 700
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 626
    TabOrder = 2
    ExplicitTop = 626
    ExplicitWidth = 783
    Width = 783
    inherited btnCancel: TcxButton
      Left = 698
      ExplicitLeft = 698
    end
    inherited btnPrint: TcxButton
      Left = 612
      Visible = True
      OnClick = btnPrintClick
      ExplicitLeft = 612
    end
    inherited btnSave: TcxButton
      Left = 526
      OnClick = btnSaveClick
      ExplicitLeft = 526
    end
  end
  inherited Panel2: TPanel
    Top = 605
    Width = 783
    TabOrder = 3
    ExplicitTop = 605
    ExplicitWidth = 783
    inherited lbEscape: TLabel
      Left = 703
      ExplicitLeft = 703
    end
    inherited lgndSave: TLabel
      Left = 538
      ExplicitLeft = 538
    end
    inherited lgndPrint: TLabel
      Left = 625
      Visible = True
      ExplicitLeft = 625
    end
  end
  object cxGroupBox1: TcxGroupBox [2]
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header KKSO [F1] '
    TabOrder = 0
    Height = 113
    Width = 783
    object cxLabel1: TcxLabel
      Left = 31
      Top = 23
      Caption = 'No. Bukti'
    end
    object edRefno: TcxTextEdit
      Left = 80
      Top = 22
      TabStop = False
      Properties.CharCase = ecUpperCase
      Properties.ReadOnly = True
      TabOrder = 0
      Width = 133
    end
    object cxLabel6: TcxLabel
      Left = 35
      Top = 65
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 80
      Top = 64
      TabStop = False
      TabOrder = 3
      Height = 35
      Width = 309
    end
    object dtSO: TcxDateEdit
      Left = 291
      Top = 22
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 98
    end
    object cxLabel8: TcxLabel
      Left = 246
      Top = 22
      Caption = 'Tanggal'
    end
    object cxLabel7: TcxLabel
      Left = 37
      Top = 44
      Caption = 'Gudang'
    end
    object cxLookupWH: TcxExtLookupComboBox
      Left = 80
      Top = 43
      TabOrder = 2
      Width = 309
    end
    object edPIC: TcxTextEdit
      Left = 487
      Top = 22
      Properties.CharCase = ecUpperCase
      TabOrder = 4
      Width = 155
    end
    object cxLabel2: TcxLabel
      Left = 398
      Top = 23
      Caption = 'PIC / Penghitung'
    end
    object edRak: TcxTextEdit
      Left = 487
      Top = 43
      Properties.CharCase = ecUpperCase
      TabOrder = 5
      OnKeyDown = edRakKeyDown
      Width = 155
    end
    object cxLabel3: TcxLabel
      Left = 424
      Top = 44
      Caption = 'Lokasi / Rak'
    end
    object cxLabel4: TcxLabel
      Left = 567
      Top = 90
      Caption = '* Pastikan Tgl KKSO = Tgl Stock Opname'
      Style.TextColor = clMaroon
    end
  end
  object cxGrid1: TcxGrid [3]
    Left = 0
    Top = 113
    Width = 783
    Height = 492
    Align = alClient
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpTop
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
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      Styles.ContentOdd = styleOdd
      object colNo: TcxGridDBColumn
        Caption = 'No.'
        PropertiesClassName = 'TcxTextEditProperties'
        OnGetDisplayText = colNoGetDisplayText
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 33
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
        Width = 368
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
        DataBinding.FieldName = 'Qty'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 74
      end
      object colItemID: TcxGridDBColumn
        DataBinding.FieldName = 'Item'
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
