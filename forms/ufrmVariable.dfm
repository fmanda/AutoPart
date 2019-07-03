inherited frmVariable: TfrmVariable
  Caption = 'Update Variable'
  ClientHeight = 661
  ClientWidth = 584
  OnCreate = FormCreate
  ExplicitWidth = 600
  ExplicitHeight = 700
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 626
    ExplicitTop = 626
    ExplicitWidth = 584
    Width = 584
    inherited btnCancel: TcxButton
      Left = 499
      ExplicitLeft = 499
    end
    inherited btnPrint: TcxButton
      Left = 413
      ExplicitLeft = 413
    end
    inherited btnSave: TcxButton
      Left = 327
      OnClick = btnSaveClick
      ExplicitLeft = 327
    end
  end
  inherited Panel2: TPanel
    Top = 605
    Width = 584
    ExplicitTop = 605
    ExplicitWidth = 584
    inherited lbEscape: TLabel
      Left = 504
      Height = 17
      ExplicitLeft = 504
    end
    inherited lgndSave: TLabel
      Left = 339
      Height = 17
      ExplicitLeft = 339
    end
    inherited lgndPrint: TLabel
      Left = 426
      Height = 17
      ExplicitLeft = 426
    end
  end
  object cxVertGrid: TcxVerticalGrid
    Left = 0
    Top = 0
    Width = 584
    Height = 605
    Align = alClient
    OptionsView.CellAutoHeight = True
    OptionsView.CategoryExplorerStyle = True
    OptionsView.RowHeaderWidth = 208
    OptionsView.ShowEmptyRowImage = True
    OptionsBehavior.GoToNextCellOnEnter = True
    OptionsBehavior.GoToNextCellOnTab = True
    OptionsBehavior.FocusCellOnCycle = True
    TabOrder = 2
    Version = 1
    object cxVertGridCategoryRow1: TcxCategoryRow
      Properties.Caption = 'Informasi Perusahaan'
      ID = 0
      ParentID = -1
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
      ID = 1
      ParentID = 0
      Index = 0
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
      ID = 2
      ParentID = 0
      Index = 1
      Version = 1
    end
    object colTelpCabang: TcxEditorRow
      Properties.Caption = 'Telepon Cabang'
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 3
      ParentID = 0
      Index = 2
      Version = 1
    end
    object colAlamat1: TcxEditorRow
      Properties.Caption = 'Alamat 1 Cabang'
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 4
      ParentID = 0
      Index = 3
      Version = 1
    end
    object colAlamat2: TcxEditorRow
      Properties.Caption = 'Alamat 2 Cabang'
      Properties.EditPropertiesClassName = 'TcxTextEditProperties'
      Properties.DataBinding.ValueType = 'String'
      Properties.Value = Null
      ID = 5
      ParentID = 0
      Index = 4
      Version = 1
    end
    object cxVertGridCategoryRow2: TcxCategoryRow
      Properties.Caption = 'Setting Transaksi'
      ID = 6
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
      ID = 7
      ParentID = 6
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
      ID = 8
      ParentID = 6
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
      ID = 9
      ParentID = 6
      Index = 2
      Version = 1
    end
  end
end
