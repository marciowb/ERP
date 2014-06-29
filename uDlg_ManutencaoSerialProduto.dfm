inherited frmDlg_ManutencaoSerialProduto: TfrmDlg_ManutencaoSerialProduto
  ActiveControl = cxGrid1
  Caption = 'Inclus'#227'o de Serial'
  ClientHeight = 351
  ClientWidth = 407
  ExplicitWidth = 423
  ExplicitHeight = 390
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 310
    Width = 407
    ExplicitTop = 310
    ExplicitWidth = 407
    inherited btnOk: TBitBtn
      Left = 145
      ExplicitLeft = 145
    end
    inherited btnCancelar: TBitBtn
      Left = 236
      ExplicitLeft = 236
    end
  end
  inherited Panel2: TPanel
    Width = 407
    Height = 310
    ExplicitWidth = 407
    ExplicitHeight = 310
    object cxGrid1: TcxGrid
      Left = 0
      Top = 0
      Width = 407
      Height = 310
      Align = alClient
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        Tag = 99
        NavigatorButtons.ConfirmDelete = False
        NavigatorButtons.First.Visible = False
        NavigatorButtons.PriorPage.Visible = False
        NavigatorButtons.Prior.Visible = False
        NavigatorButtons.Next.Visible = False
        NavigatorButtons.NextPage.Visible = False
        NavigatorButtons.Last.Visible = False
        NavigatorButtons.Insert.Hint = 'Incluir'
        NavigatorButtons.Insert.Visible = True
        NavigatorButtons.Append.Visible = False
        NavigatorButtons.Delete.Hint = 'Apagar'
        NavigatorButtons.Edit.Hint = 'Atualizar'
        NavigatorButtons.Post.Hint = 'Gravar'
        NavigatorButtons.Post.Visible = True
        NavigatorButtons.Cancel.Hint = 'Cancelar'
        NavigatorButtons.Refresh.Visible = False
        NavigatorButtons.SaveBookmark.Visible = False
        NavigatorButtons.GotoBookmark.Visible = False
        NavigatorButtons.Filter.Visible = False
        DataController.DataSource = DataSeriais
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = 'Quantidade total: 000'
            Kind = skCount
            Column = cxGrid1DBTableView1Column1
          end>
        DataController.Summary.SummaryGroups = <>
        OptionsView.Navigator = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        object cxGrid1DBTableView1Column1: TcxGridDBColumn
          Caption = 'Seriais'
          DataBinding.FieldName = 'SERIAL'
          HeaderAlignmentHorz = taCenter
          HeaderAlignmentVert = vaCenter
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object DataSeriais: TDataSource
    Left = 200
    Top = 184
  end
end
