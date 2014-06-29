inherited frmLst_Entrada: TfrmLst_Entrada
  Caption = 'Listagem de entrada'
  ClientHeight = 532
  ClientWidth = 879
  ExplicitTop = -13
  ExplicitWidth = 895
  ExplicitHeight = 571
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 879
    ExplicitWidth = 124
  end
  inherited Panel2: TPanel
    Width = 879
    ExplicitWidth = 124
  end
  inherited Status: TdxStatusBar
    Top = 512
    Width = 879
    ExplicitTop = -20
    ExplicitWidth = 124
  end
  inherited pnlCaption: TPanel
    Width = 879
    ExplicitWidth = 124
    inherited Panel4: TPanel
      Left = 528
      ExplicitLeft = -227
    end
  end
  inherited PageControl: TcxPageControl
    Width = 879
    Height = 424
    ExplicitWidth = 124
    ClientRectBottom = 424
    ClientRectRight = 879
    inherited tsListagem: TcxTabSheet
      ExplicitTop = 20
      ExplicitWidth = 124
      ExplicitHeight = 402
      inherited cxGrid1: TcxGrid
        Width = 879
        Height = 404
        ExplicitWidth = 124
        inherited TvListagem: TcxGridDBTableView
          Styles.Inactive = nil
          Styles.Selection = nil
          Styles.Group = nil
        end
      end
    end
  end
end
