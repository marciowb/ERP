inherited frmLst_Proposta: TfrmLst_Proposta
  Caption = 'Listagem de prop'#243'sta'
  ClientWidth = 872
  ExplicitWidth = 888
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 872
    ExplicitWidth = 872
  end
  inherited Panel2: TPanel
    Width = 872
    ExplicitWidth = 872
  end
  inherited Status: TdxStatusBar
    Width = 872
    ExplicitTop = -20
    ExplicitWidth = 872
  end
  inherited pnlCaption: TPanel
    Width = 872
    ExplicitWidth = 872
    inherited Panel4: TPanel
      Left = 521
      ExplicitLeft = 521
    end
  end
  inherited PageControl: TcxPageControl
    Width = 872
    ExplicitWidth = 872
    ClientRectRight = 872
    inherited tsListagem: TcxTabSheet
      ExplicitTop = 20
      ExplicitWidth = 872
      ExplicitHeight = 402
      inherited cxGrid1: TcxGrid
        Width = 872
        ExplicitWidth = 872
        inherited TvListagem: TcxGridDBTableView
          Styles.Inactive = nil
          Styles.Selection = nil
          Styles.Group = nil
        end
      end
    end
  end
end
