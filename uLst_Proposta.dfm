inherited frmLst_Proposta: TfrmLst_Proposta
  Caption = 'Listagem de prop'#243'sta'
  ClientHeight = 523
  ClientWidth = 998
  ExplicitWidth = 1014
  ExplicitHeight = 562
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 998
    ExplicitWidth = 872
  end
  inherited Panel2: TPanel
    Width = 998
    ExplicitWidth = 872
    inherited BitBtn1: TBitBtn
      Left = 788
      ExplicitLeft = 742
      ExplicitTop = -2
    end
    object BitBtn11: TBitBtn
      Left = 627
      Top = 0
      Width = 161
      Height = 31
      Action = actConverteContrato
      Align = alLeft
      Caption = 'Converter em Contrato'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 10
    end
  end
  inherited Status: TdxStatusBar
    Top = 503
    Width = 998
    ExplicitTop = -20
    ExplicitWidth = 872
  end
  inherited pnlCaption: TPanel
    Width = 998
    ExplicitWidth = 872
    inherited Panel4: TPanel
      Left = 647
      ExplicitLeft = 521
    end
  end
  inherited PageControl: TcxPageControl
    Width = 998
    Height = 415
    ExplicitWidth = 872
    ClientRectBottom = 415
    ClientRectRight = 998
    inherited tsListagem: TcxTabSheet
      ExplicitTop = 20
      ExplicitWidth = 872
      ExplicitHeight = 402
      inherited cxGrid1: TcxGrid
        Width = 998
        Height = 395
        ExplicitWidth = 872
        inherited TvListagem: TcxGridDBTableView
          Styles.Inactive = nil
          Styles.Selection = nil
          Styles.Group = nil
        end
      end
    end
  end
  inherited ActionList1: TActionList
    object actConverteContrato: TAction
      Caption = 'Converter em Contrato'
      ImageIndex = 12
      OnExecute = actConverteContratoExecute
    end
  end
end
