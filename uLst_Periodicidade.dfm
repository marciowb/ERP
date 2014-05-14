inherited frmLst_Periodicidade: TfrmLst_Periodicidade
  Caption = 'Cadastro de periodicidade'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel3: TPanel
      ExplicitLeft = 311
      inherited edtCodigo: TLabelDBEdit
        Top = 25
        Width = 241
        DataField = ''
        Titulo.Top = 10
        Titulo.Width = 46
        Titulo.Caption = 'Descri'#231#227'o'
        Titulo.ExplicitTop = 10
        Titulo.ExplicitWidth = 46
        ExplicitTop = 25
        ExplicitWidth = 241
      end
      inherited Panel4: TPanel
        inherited BitBtn1: TBitBtn
          Glyph.Data = {00000000}
        end
        inherited BitBtn2: TBitBtn
          Glyph.Data = {00000000}
        end
      end
      object LabelDBEdit2: TLabelDBEdit
        Left = 16
        Top = 25
        Width = 241
        Height = 21
        DataField = 'DESCRICAOPERIODICIDADE'
        DataSource = DataCadastro
        TabOrder = 2
        Titulo.Left = 16
        Titulo.Top = 10
        Titulo.Width = 46
        Titulo.Height = 13
        Titulo.Caption = 'Descri'#231#227'o'
        IsNull = False
        PodeRepetir = False
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
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
