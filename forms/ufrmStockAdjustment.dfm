inherited frmStockAdjustment: TfrmStockAdjustment
  Caption = 'Stock Adjustment'
  ClientHeight = 575
  ClientWidth = 890
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  ExplicitWidth = 906
  ExplicitHeight = 614
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 540
    TabOrder = 1
    ExplicitTop = 540
    ExplicitWidth = 890
    Width = 890
    inherited btnCancel: TcxButton
      Left = 805
      ExplicitLeft = 805
    end
    inherited btnPrint: TcxButton
      Left = 719
      ExplicitLeft = 719
    end
    inherited btnSave: TcxButton
      Left = 633
      OnClick = btnSaveClick
      ExplicitLeft = 633
    end
  end
  inherited Panel2: TPanel
    Top = 519
    Width = 890
    TabOrder = 3
    ExplicitTop = 519
    ExplicitWidth = 890
    inherited lbEscape: TLabel
      Left = 810
      ExplicitLeft = 810
    end
    inherited lgndSave: TLabel
      Left = 645
      ExplicitLeft = 645
    end
    inherited lgndPrint: TLabel
      Left = 732
      ExplicitLeft = 732
    end
  end
  object cxGroupBox1: TcxGroupBox [2]
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Stock Adjustment [F1] '
    TabOrder = 0
    Height = 105
    Width = 890
    object cxLabel1: TcxLabel
      Left = 23
      Top = 18
      Caption = 'No. Stock Opname'
    end
    object cxLabel6: TcxLabel
      Left = 447
      Top = 18
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 447
      Top = 32
      Properties.ReadOnly = False
      TabOrder = 4
      Height = 35
      Width = 294
    end
    object dtSO: TcxDateEdit
      Left = 181
      Top = 32
      TabStop = False
      Properties.ImmediatePost = True
      Properties.ReadOnly = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 108
    end
    object cxLabel8: TcxLabel
      Left = 300
      Top = 18
      Caption = 'Tgl Adjustment'
    end
    object cxLabel7: TcxLabel
      Left = 23
      Top = 55
      Caption = 'Gudang'
    end
    object cxLookupWH: TcxExtLookupComboBox
      Left = 23
      Top = 69
      TabStop = False
      Properties.ReadOnly = True
      TabOrder = 3
      Width = 266
    end
    object dtAdj: TcxDateEdit
      Left = 300
      Top = 32
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 2
      Width = 108
    end
    object cxLabel3: TcxLabel
      Left = 181
      Top = 17
      Caption = 'Tgl Stock Opname'
    end
    object edStockOpname: TcxButtonEdit
      Left = 23
      Top = 32
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.ReadOnly = True
      Properties.OnButtonClick = edStockOpnamePropertiesButtonClick
      TabOrder = 0
      OnKeyDown = edStockOpnameKeyDown
      Width = 146
    end
  end
  object cxGrid1: TcxGrid [3]
    Left = 0
    Top = 105
    Width = 890
    Height = 414
    Align = alClient
    TabOrder = 2
    RootLevelOptions.DetailTabsPosition = dtpTop
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
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
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
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
        Caption = 'Adjustment'
        DataBinding.FieldName = 'Variant'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 75
      end
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Detail Adjustment'
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
