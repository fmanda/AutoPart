inherited frmUser: TfrmUser
  Caption = 'Update Data User'
  ClientHeight = 553
  ClientWidth = 663
  ExplicitWidth = 679
  ExplicitHeight = 592
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGroupBox2: TcxGroupBox
    Top = 518
    TabOrder = 1
    ExplicitTop = 440
    ExplicitWidth = 666
    Width = 663
    inherited btnCancel: TcxButton
      Left = 578
      ExplicitLeft = 581
    end
    inherited btnPrint: TcxButton
      Left = 492
      ExplicitLeft = 495
    end
    inherited btnSave: TcxButton
      Left = 406
      OnClick = btnSaveClick
      ExplicitLeft = 409
    end
  end
  inherited Panel2: TPanel
    Top = 497
    Width = 663
    TabOrder = 2
    ExplicitTop = 419
    ExplicitWidth = 666
    inherited lbEscape: TLabel
      Left = 583
      Height = 17
      ExplicitLeft = 586
    end
    inherited lgndSave: TLabel
      Left = 418
      Height = 17
      ExplicitLeft = 421
    end
    inherited lgndPrint: TLabel
      Left = 505
      Height = 17
      ExplicitLeft = 508
    end
  end
  object cxGroupBox1: TcxGroupBox [2]
    Left = 0
    Top = 0
    Align = alTop
    Caption = ' Informasi User '
    TabOrder = 0
    ExplicitWidth = 603
    Height = 121
    Width = 663
    object cxLabel1: TcxLabel
      Left = 48
      Top = 43
      Caption = 'User Login'
    end
    object edUser: TcxTextEdit
      Left = 103
      Top = 42
      Properties.CharCase = ecUpperCase
      TabOrder = 1
      Width = 232
    end
    object cxLabel2: TcxLabel
      Left = 28
      Top = 21
      Caption = 'Nama Lengkap'
    end
    object edNama: TcxTextEdit
      Left = 103
      Top = 20
      Properties.CharCase = ecUpperCase
      TabOrder = 0
      Width = 232
    end
    object edPassw1: TcxTextEdit
      Left = 103
      Top = 63
      Properties.CharCase = ecUpperCase
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      TabOrder = 2
      Width = 232
    end
    object cxLabel3: TcxLabel
      Left = 52
      Top = 64
      Caption = 'Password'
    end
    object edPassw2: TcxTextEdit
      Left = 103
      Top = 84
      Properties.CharCase = ecUpperCase
      Properties.EchoMode = eemPassword
      Properties.PasswordChar = '*'
      TabOrder = 6
      Width = 232
    end
    object cxLabel4: TcxLabel
      Left = 20
      Top = 85
      Caption = 'Ulangi Password'
    end
  end
  object cxGrid1: TcxGrid [3]
    Left = 0
    Top = 121
    Width = 663
    Height = 376
    Align = alClient
    TabOrder = 3
    RootLevelOptions.DetailTabsPosition = dtpTop
    ExplicitLeft = -87
    ExplicitTop = 129
    ExplicitWidth = 753
    ExplicitHeight = 346
    object cxGrdMain: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          Column = colDoAccess
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
      OptionsCustomize.ColumnSorting = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Inserting = False
      OptionsView.HeaderHeight = 30
      Styles.ContentOdd = styleOdd
      object colGroup: TcxGridDBColumn
        Caption = 'Group'
        DataBinding.FieldName = 'GroupName'
        PropertiesClassName = 'TcxTextEditProperties'
        Visible = False
        GroupIndex = 0
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 156
      end
      object colNama: TcxGridDBColumn
        Caption = 'Task / From'
        DataBinding.FieldName = 'TaskName'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Options.Focusing = False
        Width = 355
      end
      object colKode: TcxGridDBColumn
        Caption = 'Kode'
        DataBinding.FieldName = 'TaskCode'
        PropertiesClassName = 'TcxTextEditProperties'
        HeaderAlignmentHorz = taCenter
        Options.Editing = False
        Width = 168
      end
      object colDoAccess: TcxGridDBColumn
        Caption = 'Akses'
        DataBinding.FieldName = 'DoAccess'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.ImmediatePost = True
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        Width = 83
      end
    end
    object cxGrid1Level1: TcxGridLevel
      Caption = 'Detail Hak Akses'
      GridView = cxGrdMain
    end
  end
  inherited styleRepo: TcxStyleRepository
    Left = 472
    Top = 16
    PixelsPerInch = 96
  end
end
