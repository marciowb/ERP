inherited frmDlg_SaidaSerial: TfrmDlg_SaidaSerial
  BorderIcons = [biMinimize]
  Caption = 'Saida de serial'
  ClientHeight = 433
  ClientWidth = 374
  ExplicitWidth = 390
  ExplicitHeight = 472
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 392
    Width = 374
    ExplicitTop = 392
    ExplicitWidth = 374
    inherited btnOk: TBitBtn
      Left = 116
      ExplicitLeft = 116
    end
    inherited btnCancelar: TBitBtn
      Left = 207
      ExplicitLeft = 207
    end
  end
  inherited Panel2: TPanel
    Width = 374
    Height = 392
    ExplicitWidth = 374
    ExplicitHeight = 392
    object GridSerial: TcxGrid
      Left = 0
      Top = 21
      Width = 374
      Height = 371
      Align = alClient
      TabOrder = 0
      ExplicitTop = 0
      ExplicitHeight = 392
      object TvSeriais: TcxGridDBTableView
        OnDblClick = TvSeriaisDblClick
        NavigatorButtons.ConfirmDelete = False
        DataController.DataSource = DataSeriais
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object vSeriaisColumn1: TcxGridDBColumn
          Caption = 'Serial'
          DataBinding.FieldName = 'SERIAL'
          Width = 296
        end
        object vSeriaisColumn2: TcxGridDBColumn
          DataBinding.FieldName = 'FLAGEDICAO'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Images = DMConexao.ImageList16_16
          Properties.Items = <
            item
              ImageIndex = 14
              Value = 'U'
            end
            item
              ImageIndex = 9
              Value = 'N'
            end
            item
              ImageIndex = 6
              Value = 'D'
            end>
          Width = 56
          IsCaptionAssigned = True
        end
      end
      object GridSerialLevel1: TcxGridLevel
        GridView = TvSeriais
      end
    end
    object edtPesquisa: TEdit
      Left = 0
      Top = 0
      Width = 374
      Height = 21
      Align = alTop
      TabOrder = 1
      TextHint = 'Pesquisar'
      OnKeyPress = edtPesquisaKeyPress
      ExplicitLeft = 224
      ExplicitTop = 72
      ExplicitWidth = 121
    end
  end
  object DataSeriais: TDataSource
    DataSet = CdsSeriais
    Left = 32
    Top = 112
  end
  object CdsSeriais: TpFIBClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 112
  end
end
