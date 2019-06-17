inherited frmPurchaseRetur: TfrmPurchaseRetur
  Caption = 'Purchase Retur'
  ClientHeight = 558
  ClientWidth = 936
  ExplicitWidth = 952
  ExplicitHeight = 597
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 523
    Width = 936
    inherited btnCancel: TcxButton
      Left = 851
    end
    inherited btnPrint: TcxButton
      Left = 765
    end
    inherited btnSave: TcxButton
      Left = 679
    end
  end
  inherited Panel2: TPanel
    Top = 502
    Width = 936
    ExplicitTop = 321
    inherited lbEscape: TLabel
      Left = 856
      Height = 17
    end
    inherited lgndSave: TLabel
      Left = 691
      Height = 17
    end
    inherited lgndPrint: TLabel
      Left = 778
      Height = 17
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
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Header Invoice [F1] '
    TabOrder = 2
    DesignSize = (
      936
      153)
    Height = 153
    Width = 936
    object cxLabel1: TcxLabel
      Left = 61
      Top = 23
      Caption = 'No. Retur'
    end
    object edNoInv: TcxTextEdit
      Left = 114
      Top = 22
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      Width = 143
    end
    object cxLabel4: TcxLabel
      Left = 70
      Top = 64
      Caption = 'Supplier'
    end
    object cxLabel6: TcxLabel
      Left = 69
      Top = 105
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 114
      Top = 104
      TabOrder = 5
      Height = 35
      Width = 343
    end
    object dtInvoice: TcxDateEdit
      Left = 114
      Top = 83
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 3
      Width = 103
    end
    object cxLabel8: TcxLabel
      Left = 64
      Top = 84
      Caption = 'Tgl Retur'
    end
    object edSupplier: TcxButtonEdit
      Left = 114
      Top = 43
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      TabOrder = 2
      Width = 176
    end
    object crSubTotal: TcxCurrencyEdit
      Left = 680
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
      TabOrder = 6
      ExplicitLeft = 728
      Width = 241
    end
    object cxLabel2: TcxLabel
      Left = 608
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
      ExplicitLeft = 656
    end
    object cxLabel3: TcxLabel
      Left = 644
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
      ExplicitLeft = 692
    end
    object crPPN: TcxCurrencyEdit
      Left = 680
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
      TabOrder = 7
      ExplicitLeft = 728
      Width = 241
    end
    object cxLabel5: TcxLabel
      Left = 621
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
      ExplicitLeft = 669
    end
    object crTotal: TcxCurrencyEdit
      Left = 680
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
      TabOrder = 8
      ExplicitLeft = 728
      Width = 241
    end
    object cxLabel7: TcxLabel
      Left = 222
      Top = 84
      Caption = 'Gudang Asal'
    end
    object cxLookupGudang: TcxExtLookupComboBox
      Left = 288
      Top = 83
      TabOrder = 4
      Width = 169
    end
    object cbJenis: TcxComboBox
      Left = 296
      Top = 22
      Properties.CharCase = ecUpperCase
      Properties.Items.Strings = (
        'RETUR PEMBELIAN'
        'PEMBATALAN PEMBELIAN')
      TabOrder = 1
      Text = 'RETUR PEMBELIAN'
      Width = 161
    end
    object cxLabel10: TcxLabel
      Left = 267
      Top = 23
      Caption = 'Jenis'
    end
    object cxLabel9: TcxLabel
      Left = 53
      Top = 44
      Caption = 'No. Invoice'
    end
    object cxTextEdit1: TcxTextEdit
      Left = 114
      Top = 63
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 19
      Width = 343
    end
    object cxDateEdit1: TcxDateEdit
      Left = 354
      Top = 43
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 20
      Width = 103
    end
    object cxLabel11: TcxLabel
      Left = 298
      Top = 44
      Caption = 'Tgl Invoice'
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 153
    Width = 936
    Height = 349
    Align = alClient
    TabOrder = 3
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitTop = 176
    ExplicitHeight = 325
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
end
