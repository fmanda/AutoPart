inherited frmPurchaseRetur: TfrmPurchaseRetur
  Caption = 'Retur Pembelian'
  ClientHeight = 558
  ClientWidth = 941
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  ExplicitWidth = 957
  ExplicitHeight = 597
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 523
    ExplicitTop = 523
    ExplicitWidth = 936
    Width = 941
    inherited btnCancel: TcxButton
      Left = 856
      ExplicitLeft = 851
    end
    inherited btnPrint: TcxButton
      Left = 770
      ExplicitLeft = 765
    end
    inherited btnSave: TcxButton
      Left = 684
      ExplicitLeft = 679
    end
  end
  inherited Panel2: TPanel
    Top = 502
    Width = 941
    ExplicitTop = 502
    ExplicitWidth = 936
    inherited lbEscape: TLabel
      Left = 861
      Height = 17
      ExplicitLeft = 856
    end
    inherited lgndSave: TLabel
      Left = 696
      Height = 17
      ExplicitLeft = 691
    end
    inherited lgndPrint: TLabel
      Left = 783
      Height = 17
      ExplicitLeft = 778
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 165
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
      ExplicitLeft = 194
      ExplicitHeight = 16
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 146
      Height = 17
      Margins.Top = 1
      Margins.Right = 13
      Margins.Bottom = 1
      Align = alLeft
      Caption = 'F5 [Lookup Invoice / Barang]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Trebuchet MS'
      Font.Style = []
      ParentFont = False
      ExplicitHeight = 16
    end
  end
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Data [F1] '
    TabOrder = 2
    DesignSize = (
      941
      147)
    Height = 147
    Width = 941
    object cxLabel1: TcxLabel
      Left = 42
      Top = 22
      Caption = 'No. Retur'
    end
    object edNoInv: TcxTextEdit
      Left = 95
      Top = 21
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      Width = 139
    end
    object cxLabel4: TcxLabel
      Left = 51
      Top = 63
      Caption = 'Supplier'
    end
    object cxLabel6: TcxLabel
      Left = 50
      Top = 104
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 95
      Top = 103
      TabOrder = 6
      Height = 35
      Width = 298
    end
    object dtRetur: TcxDateEdit
      Left = 290
      Top = 21
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 1
      Width = 103
    end
    object cxLabel8: TcxLabel
      Left = 242
      Top = 22
      Caption = 'Tgl Retur'
    end
    object edInv: TcxButtonEdit
      Left = 95
      Top = 42
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edInvPropertiesButtonClick
      TabOrder = 2
      OnKeyDown = edInvKeyDown
      Width = 139
    end
    object crSubTotal: TcxCurrencyEdit
      Left = 683
      Top = 46
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
      Width = 241
    end
    object cxLabel2: TcxLabel
      Left = 611
      Top = 47
      Anchors = [akTop, akRight]
      Caption = 'Sub Total'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object cxLabel3: TcxLabel
      Left = 647
      Top = 74
      Anchors = [akTop, akRight]
      Caption = 'PPN'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -15
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object crPPN: TcxCurrencyEdit
      Left = 683
      Top = 73
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
      TabOrder = 9
      Width = 241
    end
    object cxLabel5: TcxLabel
      Left = 624
      Top = 102
      Anchors = [akTop, akRight]
      Caption = 'TOTAL'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -17
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.IsFontAssigned = True
    end
    object crTotal: TcxCurrencyEdit
      Left = 683
      Top = 99
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
      TabOrder = 10
      Width = 241
    end
    object cxLabel7: TcxLabel
      Left = 29
      Top = 84
      Caption = 'Gudang Asal'
    end
    object cxLookupGudang: TcxExtLookupComboBox
      Left = 95
      Top = 82
      TabOrder = 5
      Width = 298
    end
    object cxLabel9: TcxLabel
      Left = 38
      Top = 43
      Caption = 'No. Faktur'
    end
    object edSupp: TcxTextEdit
      Left = 95
      Top = 62
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 4
      Width = 298
    end
    object dtInvoice: TcxDateEdit
      Left = 290
      Top = 42
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 3
      Width = 103
    end
    object cxLabel11: TcxLabel
      Left = 238
      Top = 43
      Caption = 'Tgl Faktur'
    end
    object rbJenis: TcxRadioGroup
      Left = 403
      Top = 19
      Anchors = [akTop, akRight]
      Caption = ' Jenis Retur Pembelian'
      Properties.Items = <
        item
          Caption = 'Retur Pembelian'
        end
        item
          Caption = 'Pembatalan Faktur'
        end>
      ItemIndex = 0
      TabOrder = 7
      Height = 77
      Width = 149
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 147
    Width = 941
    Height = 355
    Align = alClient
    TabOrder = 3
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitTop = 168
    ExplicitHeight = 333
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
        HeaderAlignmentHorz = taCenter
        Width = 63
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
end
