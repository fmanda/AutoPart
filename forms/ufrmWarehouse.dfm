inherited frmWarehouse: TfrmWarehouse
  Caption = 'Update Data Gudang / Warehouse'
  ClientHeight = 463
  ClientWidth = 485
  ExplicitWidth = 501
  ExplicitHeight = 502
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 428
    TabOrder = 1
    ExplicitTop = 428
    ExplicitWidth = 485
    Width = 485
    inherited btnCancel: TcxButton
      Left = 400
      ExplicitLeft = 400
    end
    inherited btnPrint: TcxButton
      Left = 314
      ExplicitLeft = 314
    end
    inherited btnSave: TcxButton
      Left = 228
      OnClick = btnSaveClick
      ExplicitLeft = 228
    end
  end
  inherited Panel2: TPanel
    Top = 407
    Width = 485
    TabOrder = 0
    ExplicitTop = 407
    ExplicitWidth = 485
    inherited lbEscape: TLabel
      Left = 405
      Height = 17
      ExplicitLeft = 405
    end
    inherited lgndSave: TLabel
      Left = 240
      Height = 17
      ExplicitLeft = 240
    end
    inherited lgndPrint: TLabel
      Left = 327
      Height = 17
      ExplicitLeft = 327
    end
  end
  object pgcMain: TcxPageControl [2]
    Left = 0
    Top = 0
    Width = 485
    Height = 407
    Align = alClient
    TabOrder = 2
    Properties.ActivePage = cxTabSheet2
    Properties.CustomButtons.Buttons = <>
    ClientRectBottom = 407
    ClientRectRight = 485
    ClientRectTop = 24
    object tsHeader: TcxTabSheet
      Caption = 'Data Gudang'
      ImageIndex = 0
      object cxLabel1: TcxLabel
        Left = 38
        Top = 22
        Caption = 'Kode Gudang'
      end
      object edKode: TcxTextEdit
        Left = 109
        Top = 21
        Properties.CharCase = ecUpperCase
        TabOrder = 1
        Width = 116
      end
      object cxLabel2: TcxLabel
        Left = 35
        Top = 43
        Caption = 'Nama Gudang'
      end
      object edNama: TcxTextEdit
        Left = 109
        Top = 42
        Properties.CharCase = ecUpperCase
        TabOrder = 3
        Width = 292
      end
      object chkActive: TcxCheckBox
        Left = 347
        Top = 22
        TabStop = False
        Caption = 'Active'
        State = cbsChecked
        TabOrder = 4
      end
      object rbJenis: TcxRadioGroup
        Left = 109
        Top = 69
        Caption = ' Jenis Gudang '
        Properties.Items = <
          item
            Caption = 'Barang Baik'
          end
          item
            Caption = 'Barang Rusak'
          end
          item
            Caption = 'Barang Promosi'
          end
          item
            Caption = 'Transit'
          end>
        ItemIndex = 0
        TabOrder = 5
        Height = 116
        Width = 289
      end
      object ckExternal: TcxCheckBox
        Left = 32
        Top = 207
        TabStop = False
        Caption = 'Gudang External / Cabang Lain'
        Properties.OnEditValueChanged = ckExternalPropertiesEditValueChanged
        State = cbsChecked
        TabOrder = 6
      end
      object cxLookupCabang: TcxExtLookupComboBox
        Left = 106
        Top = 234
        TabOrder = 7
        Width = 292
      end
      object cxLabel3: TcxLabel
        Left = 62
        Top = 235
        Caption = 'Cabang'
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Data Rak'
      ImageIndex = 1
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 485
        Height = 383
        Align = alClient
        TabOrder = 0
        ExplicitTop = -1
        object cxGrdRak: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Kind = skSum
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
          object colNO: TcxGridDBColumn
            Caption = 'No'
            OnGetDisplayText = colNOGetDisplayText
            HeaderAlignmentHorz = taCenter
            Options.Editing = False
            Options.Focusing = False
            Width = 41
          end
          object colKode: TcxGridDBColumn
            DataBinding.FieldName = 'Rak'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 169
          end
          object colNama: TcxGridDBColumn
            DataBinding.FieldName = 'Lokasi'
            PropertiesClassName = 'TcxTextEditProperties'
            HeaderAlignmentHorz = taCenter
            Width = 173
          end
        end
        object cxGrid1Level1: TcxGridLevel
          Caption = 'Detail Transaksi [F2]'
          GridView = cxGrdRak
        end
      end
    end
  end
  inherited styleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
