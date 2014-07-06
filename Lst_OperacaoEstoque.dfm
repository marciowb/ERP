inherited frmLst_OperacaoEstoque: TfrmLst_OperacaoEstoque
  Caption = 'Opera'#231#227'o de estoque'
  ClientHeight = 434
  ExplicitWidth = 658
  ExplicitHeight = 473
  PixelsPerInch = 96
  TextHeight = 13
  inherited Status: TStatusBar
    Top = 415
  end
  inherited Panel1: TPanel
    Height = 415
    inherited cxSplitter1: TcxSplitter
      Height = 385
    end
    inherited Panel3: TPanel
      Height = 385
      inherited Panel4: TPanel
        Top = 344
        TabOrder = 8
      end
      object LabelDBEdit1: TLabelDBEdit
        Left = 16
        Top = 72
        Width = 265
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
        Width = 265
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
        Top = 280
        Caption = 'Venda'
        DataBinding.DataField = 'FLAGVENDA'
        DataBinding.DataSource = DataCadastro
        Properties.ValueChecked = 'Y'
        Properties.ValueGrayed = 'N'
        Properties.ValueUnchecked = 'N'
        TabOrder = 5
        Width = 57
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 16
        Top = 151
        Width = 265
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
        Top = 280
        Caption = 'Gera financeiro'
        DataBinding.DataField = 'FLAGGERAFINANCEIRO'
        DataBinding.DataSource = DataCadastro
        Properties.ValueChecked = 'Y'
        Properties.ValueGrayed = 'N'
        Properties.ValueUnchecked = 'N'
        TabOrder = 6
        Width = 100
      end
      object cxDBCheckBox3: TcxDBCheckBox
        Left = 16
        Top = 307
        Caption = 'Movimenta estoque'
        DataBinding.DataField = 'FLAGMOVIMENTAESTOQUE'
        DataBinding.DataSource = DataCadastro
        Properties.ValueChecked = 'Y'
        Properties.ValueGrayed = 'N'
        Properties.ValueUnchecked = 'N'
        TabOrder = 7
        Width = 137
      end
      object DBRadioGroup3: TDBRadioGroup
        Left = 16
        Top = 207
        Width = 265
        Height = 61
        Caption = ' Tipo de documento'
        Columns = 3
        DataField = 'FLAGDOCUMENTO'
        DataSource = DataCadastro
        Items.Strings = (
          'Nada'
          'NFe'
          'NFSe'
          'Nfe / NFSe'
          'Comprovante')
        ParentBackground = True
        TabOrder = 4
        Values.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4')
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
      Height = 385
      inherited PageControl: TcxPageControl
        Height = 383
        ClientRectBottom = 379
        inherited tsGrid: TcxTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 293
          ExplicitHeight = 294
          inherited pnlGrid: TPanel
            Height = 355
            inherited TvCadastro: TcxGrid
              Height = 355
            end
          end
        end
        inherited tsTree: TcxTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 293
          ExplicitHeight = 355
          inherited pnlTree: TPanel
            Width = 293
            Height = 355
            ExplicitWidth = 293
            ExplicitHeight = 355
            inherited TvTree: TcxDBTreeList
              Width = 293
              Height = 355
              ExplicitWidth = 293
              ExplicitHeight = 355
            end
          end
        end
      end
    end
  end
end
