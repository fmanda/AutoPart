inherited frmVariable: TfrmVariable
  Caption = 'Update Variable'
  ClientHeight = 461
  ClientWidth = 555
  ExplicitTop = -3
  ExplicitWidth = 571
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 426
    ExplicitTop = 626
    ExplicitWidth = 584
    Width = 555
    inherited btnCancel: TcxButton
      Left = 470
      ExplicitLeft = 499
    end
    inherited btnPrint: TcxButton
      Left = 384
      ExplicitLeft = 413
    end
    inherited btnSave: TcxButton
      Left = 298
      OnClick = btnSaveClick
      ExplicitLeft = 327
    end
  end
  inherited Panel2: TPanel
    Top = 405
    Width = 555
    ExplicitTop = 605
    ExplicitWidth = 584
    inherited lbEscape: TLabel
      Left = 475
      Height = 17
      ExplicitLeft = 504
    end
    inherited lgndSave: TLabel
      Left = 310
      Height = 17
      ExplicitLeft = 339
    end
    inherited lgndPrint: TLabel
      Left = 397
      Height = 17
      ExplicitLeft = 426
    end
  end
  object cxVertGrid: TcxVerticalGrid [2]
    Left = 0
    Top = 0
    Width = 555
    Height = 405
    Align = alClient
    OptionsView.CellAutoHeight = True
    OptionsView.CategoryExplorerStyle = True
    OptionsView.RowHeaderWidth = 197
    OptionsView.ShowEmptyRowImage = True
    OptionsBehavior.GoToNextCellOnEnter = True
    OptionsBehavior.GoToNextCellOnTab = True
    OptionsBehavior.FocusCellOnCycle = True
    TabOrder = 2
    ExplicitTop = -1
    ExplicitHeight = 605
    Version = 1
    object cxVertGridCategoryRow1: TcxCategoryRow
      Properties.Caption = 'Informasi Perusahaan'
      ID = 0
      ParentID = -1
      Index = 0
      Version = 1
    end
    object colNamaCabang: TcxEditorRow
      Properties.Caption = 'Nama Cabang'
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 1
      ParentID = 0
      Index = 0
      Version = 1
    end
    object colKodePusat: TcxEditorRow
      Properties.Caption = 'Kode Pusat'
      Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
      Properties.EditProperties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.EditProperties.OnButtonClick = colKodePusatEditPropertiesButtonClick
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 2
      ParentID = 0
      Index = 1
      Version = 1
    end
    object colKodeCabang: TcxEditorRow
      Properties.Caption = 'Kode Cabang'
      Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
      Properties.EditProperties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.EditProperties.OnButtonClick = colKodeCabangEditPropertiesButtonClick
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 3
      ParentID = 0
      Index = 2
      Version = 1
    end
    object colTelpCabang: TcxEditorRow
      Properties.Caption = 'Telepon Cabang'
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 4
      ParentID = 0
      Index = 3
      Version = 1
    end
    object colAlamat1: TcxEditorRow
      Properties.Caption = 'Alamat 1 Cabang'
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 5
      ParentID = 0
      Index = 4
      Version = 1
    end
    object colAlamat2: TcxEditorRow
      Properties.Caption = 'Alamat 2 Cabang'
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 6
      ParentID = 0
      Index = 5
      Version = 1
    end
    object cxVertGridCategoryRow2: TcxCategoryRow
      Properties.Caption = 'Setting Transaksi'
      ID = 7
      ParentID = -1
      Index = 1
      Version = 1
    end
    object colDefRekening: TcxEditorRow
      Properties.Caption = 'Default : Rekening Kas'
      Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
      Properties.EditProperties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.EditProperties.OnButtonClick = colDefRekeningEditPropertiesButtonClick
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = ''
      ID = 8
      ParentID = 7
      Index = 0
      Version = 1
    end
    object colDefCustUmum: TcxEditorRow
      Properties.Caption = 'Default : Kode Customer Umum'
      Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
      Properties.EditProperties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.EditProperties.OnButtonClick = colDefCustUmumEditPropertiesButtonClick
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 9
      ParentID = 7
      Index = 1
      Version = 1
    end
    object colDefCustBengkel: TcxEditorRow
      Properties.Caption = 'Default : Kode Customer Bengkel'
      Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
      Properties.EditProperties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.EditProperties.OnButtonClick = colDefCustBengkelEditPropertiesButtonClick
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      Visible = False
      ID = 10
      ParentID = 7
      Index = 2
      Version = 1
    end
    object colCOAPengeluaran: TcxEditorRow
      Properties.Caption = 'Induk Akun Biaya / Expense'
      Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
      Properties.EditProperties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.EditProperties.OnButtonClick = colCOAPengeluaranEditPropertiesButtonClick
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 11
      ParentID = 7
      Index = 3
      Version = 1
    end
    object colCOAPendapatan: TcxEditorRow
      Properties.Caption = 'Induk Akun Pendapatan Lain'
      Properties.EditPropertiesClassName = 'TcxButtonEditProperties'
      Properties.EditProperties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.EditProperties.OnButtonClick = colCOAPendapatanEditPropertiesButtonClick
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 12
      ParentID = 7
      Index = 4
      Version = 1
    end
    object colToleransiPiutang: TcxEditorRow
      Properties.Caption = 'Toleransi Sisa Piutang'
      Properties.EditPropertiesClassName = 'TcxCurrencyEditProperties'
      Properties.EditProperties.DisplayFormat = ',0.##;(,0.##)'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 13
      ParentID = 7
      Index = 5
      Version = 1
    end
    object colCheckStock: TcxEditorRow
      Properties.Caption = 'Check Stock'
      Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
      Properties.EditProperties.Columns = 2
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.Items = <
        item
          Caption = 'Aktif'
          Value = 1
        end
        item
          Caption = 'Non Aktif'
          Value = 0
        end>
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = '0'
      ID = 14
      ParentID = 7
      Index = 6
      Version = 1
    end
    object colCheckCreditLimit: TcxEditorRow
      Properties.Caption = 'Check CreditLimit'
      Properties.EditPropertiesClassName = 'TcxRadioGroupProperties'
      Properties.EditProperties.Columns = 2
      Properties.EditProperties.ImmediatePost = True
      Properties.EditProperties.Items = <
        item
          Caption = 'Aktif'
          Value = 1
        end
        item
          Caption = 'Non Aktif'
          Value = 0
        end>
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = '0'
      ID = 15
      ParentID = 7
      Index = 7
      Version = 1
    end
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
