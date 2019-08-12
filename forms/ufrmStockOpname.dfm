inherited frmStockOpname: TfrmStockOpname
  Caption = 'Stock Opname'
  ClientHeight = 611
  ClientWidth = 906
  KeyPreview = True
  OnKeyDown = FormKeyDown
  ExplicitWidth = 922
  ExplicitHeight = 650
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 576
    TabOrder = 1
    ExplicitTop = 545
    ExplicitWidth = 870
    Width = 906
    inherited btnCancel: TcxButton
      Left = 821
      ExplicitLeft = 785
    end
    inherited btnPrint: TcxButton
      Left = 735
      ExplicitLeft = 699
    end
    inherited btnSave: TcxButton
      Left = 649
      OnClick = btnSaveClick
      ExplicitLeft = 613
    end
    object btnReloadStock: TcxButton
      AlignWithMargins = True
      Left = 143
      Top = 5
      Width = 180
      Height = 25
      Align = alLeft
      Caption = 'Load Stock System'
      OptionsImage.ImageIndex = 5
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 3
      OnClick = btnReloadStockClick
      ExplicitLeft = 5
    end
    object btnLoadKKSO: TcxButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 132
      Height = 25
      Align = alLeft
      Caption = 'Load KKSO'
      OptionsImage.ImageIndex = 8
      OptionsImage.Images = frmMain.ImageList
      TabOrder = 4
      OnClick = btnLoadKKSOClick
    end
  end
  inherited Panel2: TPanel
    Top = 555
    Width = 906
    TabOrder = 2
    ExplicitTop = 524
    ExplicitWidth = 870
    inherited lbEscape: TLabel
      Left = 826
      Height = 17
      ExplicitLeft = 790
    end
    inherited lgndSave: TLabel
      Left = 661
      Height = 17
      ExplicitLeft = 625
    end
    inherited lgndPrint: TLabel
      Left = 748
      Height = 17
      ExplicitLeft = 712
    end
  end
  object cxGroupBox1: TcxGroupBox [2]
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Stock Opname [F1] '
    TabOrder = 0
    ExplicitWidth = 870
    Height = 129
    Width = 906
    object cxLabel1: TcxLabel
      Left = 195
      Top = 22
      Caption = 'No. Bukti'
    end
    object edRefno: TcxTextEdit
      Left = 244
      Top = 21
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Width = 155
    end
    object cxLabel6: TcxLabel
      Left = 199
      Top = 64
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 244
      Top = 63
      TabOrder = 4
      OnKeyDown = edNotesKeyDown
      Height = 35
      Width = 335
    end
    object dtSO: TcxDateEdit
      Left = 471
      Top = 21
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 2
      Width = 108
    end
    object cxLabel8: TcxLabel
      Left = 426
      Top = 21
      Caption = 'Tanggal'
    end
    object cxLabel7: TcxLabel
      Left = 201
      Top = 43
      Caption = 'Gudang'
    end
    object cxLookupWH: TcxExtLookupComboBox
      Left = 244
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
          Caption = 'Semua Barang / Dengan KKSO'
        end>
      Properties.OnEditValueChanged = rbSOPropertiesEditValueChanged
      ItemIndex = 0
      TabOrder = 0
      Height = 78
      Width = 177
    end
    object cxLabel2: TcxLabel
      Left = 3
      Top = 104
      Caption = 
        '* Pastikan Jenis && Gudang dipilih terlebih dahulu, Merubah jeni' +
        's / gudang akan mereset item yang sudah diinput'
      Style.TextColor = clMaroon
    end
  end
  object pgcMain: TcxPageControl [3]
    Left = 0
    Top = 129
    Width = 906
    Height = 426
    Align = alClient
    TabOrder = 3
    Properties.ActivePage = tsKKSO
    Properties.CustomButtons.Buttons = <>
    ExplicitTop = 128
    ExplicitWidth = 870
    ClientRectBottom = 426
    ClientRectRight = 906
    ClientRectTop = 24
    object tsKKSO: TcxTabSheet
      Caption = 'Detail KKSO'
      ImageIndex = 1
      ExplicitWidth = 289
      ExplicitHeight = 169
      object cxGrid2: TcxGrid
        Left = 0
        Top = 0
        Width = 906
        Height = 402
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 3
        ExplicitTop = -1
        ExplicitWidth = 870
        ExplicitHeight = 370
        object cxGrdKKSO: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          OnEditKeyDown = cxGrdMainEditKeyDown
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
            end
            item
              Kind = skSum
              Column = cxGridDBColumn8
            end>
          DataController.Summary.SummaryGroups = <>
          FilterRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.Footer = True
          OptionsView.HeaderHeight = 30
          Styles.ContentOdd = styleOdd
          object cxGrdKKSOColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'KKSO'
            Visible = False
            GroupIndex = 0
            HeaderAlignmentHorz = taCenter
          end
          object cxGrdKKSOColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'Rak'
            Visible = False
            GroupIndex = 1
            HeaderAlignmentHorz = taCenter
          end
          object cxGridDBColumn1: TcxGridDBColumn
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
            Width = 118
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = 'Nama Barang'
            DataBinding.FieldName = 'Nama'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Focusing = False
            Width = 310
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = 'Satuan KKSO'
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
            Width = 82
          end
          object cxGridDBColumn5: TcxGridDBColumn
            Caption = 'Qty KKSO'
            DataBinding.FieldName = 'Qty'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.##;(,0.##)'
            Properties.OnEditValueChanged = colQtyPropertiesEditValueChanged
            HeaderAlignmentHorz = taCenter
            Width = 74
          end
          object cxGridDBColumn4: TcxGridDBColumn
            DataBinding.FieldName = 'Konv KKSO'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.##;(,0.##)'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Focusing = False
          end
          object cxGridDBColumn6: TcxGridDBColumn
            Caption = 'UOM Stock'
            DataBinding.FieldName = 'UOMStock'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.##;(,0.##)'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Width = 71
          end
          object cxGridDBColumn7: TcxGridDBColumn
            DataBinding.FieldName = 'Item'
            Visible = False
            Options.Editing = False
          end
          object cxGrdKKSOColumn3: TcxGridDBColumn
            Caption = 'Konv Stock'
            DataBinding.FieldName = 'KonversiStock'
            HeaderAlignmentHorz = taCenter
          end
          object cxGridDBColumn8: TcxGridDBColumn
            Caption = 'Qty Stock'
            DataBinding.FieldName = 'QtyStock'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.DisplayFormat = ',0.##;(,0.##)'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Focusing = False
          end
        end
        object cxGridLevel1: TcxGridLevel
          Caption = 'Detail Transaksi [F2]'
          GridView = cxGrdKKSO
        end
      end
    end
    object tsDetail: TcxTabSheet
      Caption = 'Detail Transaksi [F2]'
      ImageIndex = 0
      ExplicitWidth = 289
      ExplicitHeight = 169
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 906
        Height = 402
        Align = alClient
        TabOrder = 0
        ExplicitTop = 130
        ExplicitWidth = 870
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
          FilterRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsData.Appending = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 30
          Styles.ContentOdd = styleOdd
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
  end
  inherited styleRepo: TcxStyleRepository
    Left = 784
    Top = 64
    PixelsPerInch = 96
  end
end
