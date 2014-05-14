inherited frmLst_Unidade: TfrmLst_Unidade
  Caption = 'Cadastro de unidade'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel3: TPanel
      object DBCheckBox1: TDBCheckBox
        Left = 16
        Top = 104
        Width = 193
        Height = 17
        Caption = 'Permitir francionado?'
        DataField = 'FLAGFRACIONADO'
        DataSource = DataCadastro
        TabOrder = 2
        ValueChecked = 'Y'
        ValueUnchecked = 'N'
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
