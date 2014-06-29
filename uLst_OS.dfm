inherited frmLst_OS: TfrmLst_OS
  Caption = 'Listagem de Ordens de servi'#231'os'
  ClientHeight = 531
  ClientWidth = 873
  ExplicitWidth = 889
  ExplicitHeight = 570
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFiltros: TPanel
    Width = 873
    ExplicitWidth = 873
  end
  inherited Panel2: TPanel
    Width = 873
    ExplicitWidth = 873
    inherited BitBtn1: TBitBtn
      Left = 796
      ExplicitLeft = 796
    end
    inherited BitBtn9: TBitBtn
      Left = 705
      ExplicitLeft = 705
    end
    object btnBaixaOS: TBitBtn
      Left = 611
      Top = 0
      Width = 94
      Height = 31
      Action = actBaixaOS
      Align = alLeft
      Caption = 'Baixar O.S.'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 10
    end
    object BitBtn11: TBitBtn
      Left = 536
      Top = 0
      Width = 75
      Height = 31
      Action = actReabrirOS
      Align = alLeft
      Caption = 'Reabrir'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 11
    end
  end
  inherited Status: TdxStatusBar
    Top = 511
    Width = 873
    ExplicitTop = 511
    ExplicitWidth = 873
  end
  inherited pnlCaption: TPanel
    Width = 873
    ExplicitWidth = 873
    inherited Panel4: TPanel
      Left = 522
      ExplicitLeft = 522
    end
  end
  inherited PageControl: TcxPageControl
    Width = 873
    Height = 423
    ExplicitWidth = 873
    ExplicitHeight = 423
    ClientRectBottom = 423
    ClientRectRight = 873
    inherited tsListagem: TcxTabSheet
      ExplicitWidth = 873
      ExplicitHeight = 403
      inherited cxGrid1: TcxGrid
        Width = 873
        Height = 403
        ExplicitWidth = 873
        ExplicitHeight = 403
        inherited TvListagem: TcxGridDBTableView
          Styles.Inactive = nil
          Styles.Selection = nil
          Styles.OnGetContentStyle = TvListagemStylesGetContentStyle
          Styles.Group = nil
        end
      end
    end
  end
  inherited ActionList1: TActionList
    object actBaixaOS: TAction
      Caption = 'Baixar O.S.'
      ImageIndex = 50
      OnExecute = actBaixaOSExecute
    end
    object actReabrirOS: TAction
      Caption = 'Reabrir'
      ImageIndex = 49
      OnExecute = actReabrirOSExecute
    end
  end
end
