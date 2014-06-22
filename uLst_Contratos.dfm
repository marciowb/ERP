inherited frmLst_Contratos: TfrmLst_Contratos
  Caption = 'Centro de contratos'
  ClientHeight = 488
  ClientWidth = 949
  ExplicitWidth = 965
  ExplicitHeight = 527
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 949
    ExplicitWidth = 949
  end
  inherited Panel2: TPanel
    Width = 949
    ExplicitWidth = 949
  end
  inherited Status: TdxStatusBar
    Top = 468
    Width = 949
    ExplicitTop = 468
    ExplicitWidth = 949
  end
  inherited pnlCaption: TPanel
    Width = 949
    ExplicitWidth = 949
    inherited Panel4: TPanel
      Left = 598
      ExplicitLeft = 598
    end
  end
  inherited PageControl: TcxPageControl
    Width = 949
    Height = 380
    ExplicitWidth = 949
    ExplicitHeight = 380
    ClientRectBottom = 380
    ClientRectRight = 949
    inherited tsListagem: TcxTabSheet
      ExplicitTop = 20
      ExplicitWidth = 949
      ExplicitHeight = 360
      inherited cxGrid1: TcxGrid
        Width = 949
        Height = 360
        ExplicitWidth = 949
        ExplicitHeight = 360
        inherited TvListagem: TcxGridDBTableView
          Styles.Inactive = nil
          Styles.Selection = nil
          Styles.Group = nil
        end
      end
    end
  end
end
