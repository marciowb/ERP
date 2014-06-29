inherited frmLst_OperacaoEstoque: TfrmLst_OperacaoEstoque
  Caption = 'Opera'#231#227'o de estoque'
  ExplicitWidth = 658
  ExplicitHeight = 412
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel3: TPanel
      ExplicitLeft = 311
      inherited Panel4: TPanel
        TabOrder = 7
        inherited BitBtn1: TBitBtn
          Glyph.Data = {00000000}
        end
        inherited BitBtn2: TBitBtn
          Glyph.Data = {00000000}
        end
      end
      object LabelDBEdit1: TLabelDBEdit
        Left = 16
        Top = 72
        Width = 241
        Height = 21
        DataField = 'NOMEOPERACAOESTOQUE'
        DataSource = DataCadastro
        TabOrder = 1
        Titulo.Left = 16
        Titulo.Top = 57
        Titulo.Width = 47
        Titulo.Height = 13
        Titulo.Caption = 'Opera'#231#227'o'
        IsNull = False
        PodeRepetir = False
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
        AsInteger = 0
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 16
        Top = 99
        Width = 241
        Height = 46
        Caption = ' Tipo de opera'#231#227'o '
        Columns = 2
        DataField = 'FLAGTIPOOPERACAO'
        DataSource = DataCadastro
        Items.Strings = (
          'Entrada'
          'Sa'#237'da')
        ParentBackground = True
        TabOrder = 2
        Values.Strings = (
          'E'
          'S')
      end
      object cxDBCheckBox1: TcxDBCheckBox
        Left = 16
        Top = 208
        Caption = 'Venda'
        DataBinding.DataField = 'FLAGVENDA'
        DataBinding.DataSource = DataCadastro
        Properties.ValueChecked = 'Y'
        Properties.ValueGrayed = 'N'
        Properties.ValueUnchecked = 'N'
        TabOrder = 4
        Width = 57
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 16
        Top = 151
        Width = 241
        Height = 50
        Caption = ' Tipo de pessoa '
        Columns = 2
        DataField = 'FLAGTIPOPESSOA'
        DataSource = DataCadastro
        Items.Strings = (
          'Fornecedor'
          'Cliente')
        ParentBackground = True
        TabOrder = 3
        Values.Strings = (
          'F'
          'C')
      end
      object cxDBCheckBox2: TcxDBCheckBox
        Left = 91
        Top = 208
        Caption = 'Gera financeiro'
        DataBinding.DataField = 'FLAGGERAFINANCEIRO'
        DataBinding.DataSource = DataCadastro
        Properties.ValueChecked = 'Y'
        Properties.ValueGrayed = 'N'
        Properties.ValueUnchecked = 'N'
        TabOrder = 5
        Width = 100
      end
      object cxDBCheckBox3: TcxDBCheckBox
        Left = 16
        Top = 235
        Caption = 'Movimenta estoque'
        DataBinding.DataField = 'FLAGMOVIMENTAESTOQUE'
        DataBinding.DataSource = DataCadastro
        Properties.ValueChecked = 'Y'
        Properties.ValueGrayed = 'N'
        Properties.ValueUnchecked = 'N'
        TabOrder = 6
        Width = 137
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
