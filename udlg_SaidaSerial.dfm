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
    inherited btnOk: TBitBtn
      Left = 124
      ExplicitLeft = 168
    end
    inherited btnCancelar: TBitBtn
      Left = 215
      ExplicitLeft = 259
    end
  end
  inherited Panel2: TPanel
    Width = 374
    Height = 392
    object cxGrid1: TcxGrid
      Left = 0
      Top = 0
      Width = 374
      Height = 392
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 40
      ExplicitTop = 56
      ExplicitWidth = 250
      ExplicitHeight = 200
      object TvSeriais: TcxGridDBTableView
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
              Value = 'I'
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
      object cxGrid1Level1: TcxGridLevel
        GridView = TvSeriais
      end
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
