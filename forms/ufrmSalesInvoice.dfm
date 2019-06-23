inherited frmSalesInvoice: TfrmSalesInvoice
  Caption = 'Transaksi Penjualan'
  ClientHeight = 661
  ClientWidth = 984
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  ExplicitWidth = 1000
  ExplicitHeight = 700
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 626
    TabOrder = 3
    Width = 984
    inherited btnCancel: TcxButton
      Left = 899
    end
    inherited btnPrint: TcxButton
      Left = 813
    end
    inherited btnSave: TcxButton
      Left = 707
      Width = 100
      OnClick = btnSaveClick
      ExplicitLeft = 727
      ExplicitWidth = 100
    end
  end
  inherited Panel2: TPanel
    Top = 605
    Width = 984
    TabOrder = 4
    ExplicitLeft = 12
    ExplicitTop = 632
    ExplicitWidth = 984
    inherited lbEscape: TLabel
      Left = 904
      Height = 17
    end
    inherited lgndSave: TLabel
      Left = 729
      Height = 17
      Margins.Right = 25
      ExplicitLeft = 729
      ExplicitTop = 2
      ExplicitHeight = 17
    end
    inherited lgndPrint: TLabel
      Left = 826
      Height = 17
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 1
      Width = 152
      Height = 17
      Margins.Top = 1
      Margins.Bottom = 1
      Align = alLeft
      Caption = '[F12 : Show / Hide Detail Jasa]'
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
    TabOrder = 0
    DesignSize = (
      984
      129)
    Height = 129
    Width = 984
    object cxLabel1: TcxLabel
      Left = 109
      Top = 28
      Caption = 'No Invoice'
    end
    object edNoInv: TcxTextEdit
      Left = 168
      Top = 27
      TabStop = False
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Width = 243
    end
    object cxLabel4: TcxLabel
      Left = 116
      Top = 49
      Caption = 'Customer'
    end
    object cxLabel6: TcxLabel
      Left = 429
      Top = 70
      Caption = 'Catatan'
    end
    object edNotes: TcxMemo
      Left = 474
      Top = 69
      TabOrder = 8
      OnKeyDown = edNotesKeyDown
      Height = 42
      Width = 238
    end
    object dtInvoice: TcxDateEdit
      Left = 168
      Top = 69
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 3
      Width = 90
    end
    object cxLabel8: TcxLabel
      Left = 110
      Top = 69
      Caption = 'Tgl Invoice'
    end
    object dtJtTempo: TcxDateEdit
      Left = 321
      Top = 69
      TabStop = False
      Properties.ImmediatePost = True
      Properties.SaveTime = False
      Properties.ShowTime = False
      TabOrder = 4
      Width = 90
    end
    object cxLabel9: TcxLabel
      Left = 269
      Top = 70
      Caption = 'Jt. Tempo'
    end
    object edCustomer: TcxButtonEdit
      Left = 168
      Top = 48
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnButtonClick = edCustomerPropertiesButtonClick
      TabOrder = 2
      OnKeyDown = edCustomerKeyDown
      Width = 243
    end
    object crSubTotal: TcxCurrencyEdit
      Left = 798
      Top = 27
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
      Width = 180
    end
    object cxLabel2: TcxLabel
      Left = 731
      Top = 27
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
      Left = 767
      Top = 55
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
      Left = 798
      Top = 54
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
      TabOrder = 10
      Width = 180
    end
    object cxLabel5: TcxLabel
      Left = 744
      Top = 83
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
      Left = 798
      Top = 80
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
      TabOrder = 11
      Width = 180
    end
    object cxLabel7: TcxLabel
      Left = 124
      Top = 91
      Caption = 'Gudang'
    end
    object cxLookupSalesman: TcxExtLookupComboBox
      Left = 474
      Top = 27
      TabOrder = 6
      Width = 238
    end
    object rbHarga: TcxRadioGroup
      AlignWithMargins = True
      Left = 12
      Top = 18
      Margins.Left = 10
      Margins.Top = 0
      Margins.Bottom = 4
      Align = alLeft
      Caption = ' Jenis Harga '
      Properties.ImmediatePost = True
      Properties.Items = <
        item
          Caption = 'Umum'
        end
        item
          Caption = 'Bengkel'
        end
        item
          Caption = 'Grosir'
        end
        item
          Caption = 'Keliling'
        end>
      ItemIndex = 0
      TabOrder = 0
      ExplicitHeight = 104
      Height = 105
      Width = 85
    end
    object cxLookupGudang: TcxExtLookupComboBox
      Left = 168
      Top = 90
      TabOrder = 5
      Width = 243
    end
    object cxLabel11: TcxLabel
      Left = 423
      Top = 28
      Caption = 'Salesman'
    end
    object cxLabel12: TcxLabel
      Left = 430
      Top = 48
      Caption = 'Mekanik'
    end
    object cxLookupMekanik: TcxExtLookupComboBox
      Left = 474
      Top = 48
      TabOrder = 7
      Width = 238
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 129
    Width = 984
    Height = 268
    Align = alClient
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitTop = 187
    ExplicitHeight = 207
    object cxGrdItem: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnEditKeyDown = cxGrdItemEditKeyDown
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
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.OnEditValueChanged = colQtyPropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Width = 53
      end
      object colHarga: TcxGridDBColumn
        Caption = 'Harga Jual'
        DataBinding.FieldName = 'Harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 90
      end
      object colDisc: TcxGridDBColumn
        DataBinding.FieldName = 'Discount'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.ReadOnly = True
        Properties.OnEditValueChanged = colDiscPropertiesEditValueChanged
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object colSubTotal: TcxGridDBColumn
        Caption = 'Sub Total'
        DataBinding.FieldName = 'SubTotal'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
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
      Caption = 'Detail Barang [F2]'
      GridView = cxGrdItem
    end
  end
  object cxSplitter: TcxSplitter
    Left = 0
    Top = 397
    Width = 984
    Height = 8
    HotZoneClassName = 'TcxXPTaskBarStyle'
    AlignSplitter = salBottom
    ExplicitTop = 391
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 405
    Width = 984
    Height = 200
    Align = alBottom
    TabOrder = 2
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitTop = 455
    object cxGrdService: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          Column = colSrvQty
        end
        item
          Kind = skSum
          Column = colSrvSubTotal
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsData.Appending = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderHeight = 30
      object colSrvKode: TcxGridDBColumn
        Caption = 'Kode Jasa'
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
      object colSrvName: TcxGridDBColumn
        Caption = 'Nama Jasa'
        DataBinding.FieldName = 'Nama'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 290
      end
      object colSrvUOM: TcxGridDBColumn
        Caption = 'Satuan'
        DataBinding.FieldName = 'UOM'
        PropertiesClassName = 'TcxExtLookupComboBoxProperties'
        Properties.ImmediatePost = True
        HeaderAlignmentHorz = taCenter
        Width = 49
      end
      object colSrvQty: TcxGridDBColumn
        DataBinding.FieldName = 'Qty'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Width = 53
      end
      object colSrvHarga: TcxGridDBColumn
        Caption = 'Harga Jasa'
        DataBinding.FieldName = 'Harga'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 90
      end
      object colSrvDisc: TcxGridDBColumn
        DataBinding.FieldName = 'Discount'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 70
      end
      object colSrvSubTotal: TcxGridDBColumn
        Caption = 'Sub Total'
        DataBinding.FieldName = 'SubTotal'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.DisplayFormat = ',0.##;(,0.##)'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 100
      end
      object colSrvID: TcxGridDBColumn
        DataBinding.FieldName = 'Service'
        Visible = False
        Options.Editing = False
      end
    end
    object cxGridLevel1: TcxGridLevel
      Caption = 'Detail Jasa / Service [F3]'
      GridView = cxGrdService
    end
  end
end
