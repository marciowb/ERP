inherited frmLst_StatusOS: TfrmLst_StatusOS
  Caption = 'Listagem de status de O.S.'
  ExplicitWidth = 658
  ExplicitHeight = 412
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel3: TPanel
      inherited Panel4: TPanel
        inherited BitBtn1: TBitBtn
          Glyph.Data = {00000000}
        end
        inherited BitBtn2: TBitBtn
          Glyph.Data = {00000000}
        end
      end
      object cxDBColorComboBox1: TcxDBColorComboBox
        Left = 16
        Top = 121
        DataBinding.DataField = 'COR'
        DataBinding.DataSource = DataCadastro
        Properties.ColorDialogType = cxcdtCustom
        Properties.ColorValueFormat = cxcvHexadecimal
        Properties.CustomColors = <>
        Properties.DefaultDescription = 'Cor n'#227'o selecionada'
        Properties.ImmediatePost = True
        Properties.ImmediateUpdateText = True
        Properties.NamingConvention = cxncHTML4
        Properties.PrepareList = cxplHTML4
        TabOrder = 2
        Width = 193
      end
    end
    inherited ToolBar1: TToolBar
      inherited ToolButton1: TToolButton
        ExplicitWidth = 24
      end
      inherited ToolButton2: TToolButton
        ExplicitWidth = 24
      end
      inherited ToolButton3: TToolButton
        ExplicitWidth = 24
      end
      inherited ToolButton4: TToolButton
        ExplicitWidth = 24
      end
      inherited btnNovo: TToolButton
        ExplicitWidth = 24
      end
      inherited ToolButton9: TToolButton
        ExplicitWidth = 24
      end
      inherited ToolButton10: TToolButton
        ExplicitWidth = 24
      end
      inherited ToolButton11: TToolButton
        ExplicitWidth = 24
      end
    end
    inherited Panel2: TPanel
      inherited PageControl: TcxPageControl
        inherited tsGrid: TcxTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 293
          ExplicitHeight = 294
        end
        inherited tsTree: TcxTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 293
          ExplicitHeight = 294
          inherited pnlTree: TPanel
            Width = 293
            Height = 294
            ExplicitWidth = 293
            ExplicitHeight = 294
            inherited TvTree: TcxDBTreeList
              Width = 293
              Height = 294
              ExplicitWidth = 293
              ExplicitHeight = 294
            end
          end
        end
      end
    end
  end
end
