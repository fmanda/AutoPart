inherited frmPurchaseInvoice: TfrmPurchaseInvoice
  Caption = 'Faktur Pembelian Barang'
  ClientHeight = 587
  ClientWidth = 984
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  ExplicitWidth = 1000
  ExplicitHeight = 626
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 552
    TabOrder = 2
    ExplicitTop = 526
    ExplicitWidth = 809
    Width = 984
    inherited btnCancel: TcxButton
      Left = 899
      ExplicitLeft = 724
    end
    inherited btnPrint: TcxButton
      Left = 813
      ExplicitLeft = 638
    end
    inherited btnSave: TcxButton
      Left = 727
      OnClick = btnSaveClick
      ExplicitLeft = 552
    end
  end
  object cxGroupBox1: TcxGroupBox [1]
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Invoice [F1] '
    TabOrder = 0
    ExplicitTop = -6
    DesignSize = (
      984
      153)
    Height = 153
    Width = 984
    object cxLabel1: TcxLabel
      Left = 53
      Top = 20
      Caption = 'No. Invoice'
    end
    object edNoInv: TcxTextEdit
      Left = 114
      Top = 20
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      Width = 155
    end
    object cxLabel4: TcxLabel
      Left = 70
      Top = 41
      Caption = 'Supplier'
    end
    object cxLabel6: TcxLabel
      Left = 69
      Top = 103
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 114
      Top = 102
      TabOrder = 6
      OnKeyDown = edNotesKeyDown
      Height = 35
      Width = 335
    end
    object dtInvoice: TcxDateEdit
      Left = 114
      Top = 61
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 3
      Width = 108
    end
    object cxLabel8: TcxLabel
      Left = 56
      Top = 61
      Caption = 'Tgl Invoice'
    end
    object dtJtTempo: TcxDateEdit
      Left = 341
      Top = 61
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 4
      Width = 108
    end
    object cxLabel9: TcxLabel
      Left = 287
      Top = 62
      Caption = 'Jt. Tempo'
    end
    object edSupplier: TcxButtonEdit
      Left = 114
      Top = 40
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edSupplierPropertiesButtonClick
      TabOrder = 2
      OnKeyDown = edSupplierKeyDown
      Width = 335
    end
    object crSubTotal: TcxCurrencyEdit
      Left = 728
      Top = 48
      TabStop = False
      Anchors = [akTop, akRight]
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Properties.ReadOnly = True
      Style.Color = clCream
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Consolas'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 7
      ExplicitLeft = 553
      Width = 241
    end
    object cxLabel2: TcxLabel
      Left = 656
      Top = 49
      Anchors = [akTop, akRight]
      Caption = 'Sub Total'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      ExplicitLeft = 481
    end
    object cxLabel3: TcxLabel
      Left = 692
      Top = 76
      Anchors = [akTop, akRight]
      Caption = 'PPN'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      ExplicitLeft = 517
    end
    object crPPN: TcxCurrencyEdit
      Left = 728
      Top = 75
      TabStop = False
      Anchors = [akTop, akRight]
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Properties.ReadOnly = True
      Style.Color = clCream
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Consolas'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 8
      ExplicitLeft = 553
      Width = 241
    end
    object cxLabel5: TcxLabel
      Left = 669
      Top = 104
      Anchors = [akTop, akRight]
      Caption = 'TOTAL'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      ExplicitLeft = 494
    end
    object crTotal: TcxCurrencyEdit
      Left = 728
      Top = 101
      TabStop = False
      Anchors = [akTop, akRight]
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.DisplayFormat = ',0.00;(,0.00)'
      Properties.ReadOnly = True
      Style.Color = clMoneyGreen
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -24
      Style.Font.Name = 'Consolas'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 9
      ExplicitLeft = 553
      Width = 241
    end
    object cxLabel7: TcxLabel
      Left = 35
      Top = 83
      Caption = 'Gudang Tujuan'
    end
    object cxLookupGudang: TcxExtLookupComboBox
      Left = 114
      Top = 82
      TabOrder = 5
      Width = 335
    end
    object cbBayar: TcxComboBox
      Left = 341
      Top = 20
      Properties.CharCase = ecUpperCase
      Properties.Items.Strings = (
        'CASH'
        'TEMPO')
      TabOrder = 1
      Text = 'CASH'
      Width = 108
    end
    object cxLabel10: TcxLabel
      Left = 275
      Top = 21
      Caption = 'Pembayaran'
    end
  end
  object cxGrid1: TcxGrid [2]
    Left = 0
    Top = 153
    Width = 984
    Height = 378
    Align = alClient
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitTop = 152
    ExplicitWidth = 905
    ExplicitHeight = 373
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
          Column = colSubTotal
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
        Width = 290
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
        Width = 49
      end
      object colQty: TcxGridDBColumn
        DataBinding.FieldName = 'Qty'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0;(,0)'
        Properties.OnEditValueChanged = colQtyPropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Width = 53
      end
      object colHrgBeli: TcxGridDBColumn
        Caption = 'Harga Beli'
        DataBinding.FieldName = 'Harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0;(,0)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 90
      end
      object colDisc: TcxGridDBColumn
        DataBinding.FieldName = 'Discount'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0;(,0)'
        Properties.OnEditValueChanged = colDiscPropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object colSubTotal: TcxGridDBColumn
        Caption = 'Sub Total'
        DataBinding.FieldName = 'SubTotal'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0;(,0)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 100
      end
      object colWarehouse: TcxGridDBColumn
        Caption = 'Gudang'
        DataBinding.FieldName = 'Warehouse'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        HeaderAlignmentHorz = taCenter
        Width = 153
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
      object colPPN: TcxGridDBColumn
        DataBinding.FieldName = 'PPN'
        Visible = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Detail Transaksi [F2]'
      GridView = cxGrdMain
    end
  end
  inherited Panel2: TPanel
    Top = 531
    Width = 984
    TabOrder = 3
    ExplicitTop = 531
    ExplicitWidth = 984
    inherited lbEscape: TLabel
      Left = 904
      ExplicitLeft = 509
    end
    inherited lgndSave: TLabel
      Left = 739
      ExplicitLeft = 348
    end
    inherited lgndPrint: TLabel
      Left = 826
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 194
      Top = 1
      Width = 84
      Height = 17
      Margins.Top = 1
      Margins.Right = 13
      Margins.Bottom = 1
      Align = alLeft
      Caption = 'Esc [Cancel Edit]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 116
      ExplicitHeight = 16
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 175
      Height = 17
      Margins.Top = 1
      Margins.Right = 13
      Margins.Bottom = 1
      Align = alLeft
      Caption = 'F5 [Lookup Data Barang / Supplier]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
  end
end
