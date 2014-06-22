inherited frmPrincipal: TfrmPrincipal
  Caption = 'ERP'
  ClientHeight = 529
  ClientWidth = 842
  ExplicitWidth = 858
  ExplicitHeight = 588
  PixelsPerInch = 96
  TextHeight = 13
  inherited Status: TdxRibbonStatusBar
    Top = 506
    Width = 842
    ExplicitTop = 506
    ExplicitWidth = 842
  end
  object dxDockSite1: TdxDockSite [1]
    Left = 0
    Top = 0
    Width = 842
    Height = 506
    Align = alClient
    DockType = 0
    OriginalWidth = 842
    OriginalHeight = 506
    object dxLayoutDockSite2: TdxLayoutDockSite
      Left = 0
      Top = 0
      Width = 842
      Height = 366
      DockType = 1
      OriginalWidth = 300
      OriginalHeight = 200
      object dxLayoutDockSite1: TdxLayoutDockSite
        Left = 0
        Top = 0
        Width = 520
        Height = 366
        DockType = 1
        OriginalWidth = 300
        OriginalHeight = 200
      end
      object DockAgenda: TdxDockPanel
        Left = 520
        Top = 0
        Width = 322
        Height = 366
        AllowDockClients = [dtNone, dtClient, dtLeft, dtTop, dtRight, dtBottom]
        AllowFloating = True
        AllowDock = [dtNone, dtClient, dtLeft, dtTop, dtRight, dtBottom]
        AutoHide = False
        Caption = 'Agenda'
        CaptionButtons = [cbHide]
        TabPosition = tctpTop
        DockType = 4
        OriginalWidth = 322
        OriginalHeight = 140
        object pnlAgenda: TPanel
          Left = 0
          Top = 0
          Width = 318
          Height = 338
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object cxGrid1: TcxGrid
            Left = 0
            Top = 0
            Width = 318
            Height = 338
            Align = alClient
            TabOrder = 0
            object cxGrid1DBTableView1: TcxGridDBTableView
              OnDblClick = cxGrid1DBTableView1DblClick
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = DataAgenda
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              OptionsView.CellAutoHeight = True
              OptionsView.GroupByBox = False
              OptionsView.Header = False
              object cxGrid1DBTableView1Column1: TcxGridDBColumn
                DataBinding.FieldName = 'DATACOMPROMISSO'
                Visible = False
                GroupIndex = 0
                Options.ShowCaption = False
                Options.SortByDisplayText = isbtOff
                IsCaptionAssigned = True
              end
              object cxGrid1DBTableView1Column2: TcxGridDBColumn
                DataBinding.FieldName = 'CAPTION'
                Width = 273
              end
            end
            object cxGrid1Level1: TcxGridLevel
              GridView = cxGrid1DBTableView1
            end
          end
        end
      end
    end
    object dxDockPanel1: TdxDockPanel
      Left = 0
      Top = 366
      Width = 842
      Height = 140
      AllowFloating = True
      AutoHide = False
      Caption = 'Estoque'
      DockType = 5
      OriginalWidth = 305
      OriginalHeight = 140
    end
  end
  inherited dxBarManager1: TdxBarManager
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    Left = 272
    Top = 128
    DockControlHeights = (
      0
      0
      0
      0)
  end
  inherited MainMenu: TMainMenu
    Left = 112
    Top = 128
    object Cadastro1: TMenuItem
      Action = actCadastro
      object actCFOP1: TMenuItem
        Action = actCFOP
      end
      object actNCM1: TMenuItem
        Action = actNCM
      end
      object actEmpresa1: TMenuItem
        Action = actEmpresa
      end
      object Cliente1: TMenuItem
        Action = actCadCliente
      end
      object GrupodeCliente1: TMenuItem
        Action = actGrupoCliente
      end
      object Cargo1: TMenuItem
        Action = actCargo
      end
      object actUsuario1: TMenuItem
        Action = actUsuario
      end
      object Departamento1: TMenuItem
        Action = actDepartamento
      end
      object Funcionario1: TMenuItem
        Action = actFuncionario
      end
      object Fornecedor1: TMenuItem
        Action = actFornecedor
      end
      object Linha1: TMenuItem
        Action = actLinha
      end
      object Localizao1: TMenuItem
        Action = actLocalizacao
      end
      object GrupodeCliente2: TMenuItem
        Action = actGrupoProduto
      end
      object Cadastrodeproduto1: TMenuItem
        Action = actCadProduto
      end
      object Unidade1: TMenuItem
        Action = actUnidade
      end
      object Fabricante1: TMenuItem
        Action = actFabricante
      end
      object ProcessosdeServio1: TMenuItem
        Action = actProcessoServico
      end
      object Periodicidade1: TMenuItem
        Action = actPeriodicidade
      end
      object Banco1: TMenuItem
        Action = actBanco
      end
      object actContaBancaria1: TMenuItem
        Action = actContaBancaria
      end
      object CondiodePagamento1: TMenuItem
        Action = actCondicaoPagamento
      end
      object ipodeContrato1: TMenuItem
        Action = actTipoContrato
      end
      object ipodeOS1: TMenuItem
        Action = actTipoOS
      end
      object StatusOS1: TMenuItem
        Action = actStatusOS
      end
      object OperaoEstoque1: TMenuItem
        Action = actOperacaoEstoque
      end
    end
    object Venda1: TMenuItem
      Action = actVenda
      object Proposta1: TMenuItem
        Action = actProposta
      end
      object Centrodecontrato1: TMenuItem
        Action = actContrato
      end
      object Ordensdeservio1: TMenuItem
        Action = actOS
        object InclusaoOS1: TMenuItem
          Action = actInclusaoOS
        end
        object CentralOS1: TMenuItem
          Action = actCentralOS
        end
      end
      object Entradadeprodutos1: TMenuItem
        Action = actEntrada
      end
    end
    object Agenda1: TMenuItem
      Action = actAgenda
    end
  end
  inherited ActionList1: TActionList
    Left = 184
    Top = 128
    object actCadastro: TAction
      Category = 'Cadastro'
      Caption = 'Cadastro'
      OnExecute = actCadastroExecute
    end
    object actCFOP: TAction
      Category = 'Cadastro'
      Caption = 'CFOP'
      OnExecute = actCFOPExecute
    end
    object actNCM: TAction
      Category = 'Cadastro'
      Caption = 'NCM'
      OnExecute = actNCMExecute
    end
    object actEmpresa: TAction
      Category = 'Cadastro'
      Caption = 'Empresa'
      OnExecute = actEmpresaExecute
    end
    object actCadCliente: TAction
      Category = 'Cadastro'
      Caption = 'Cliente'
      OnExecute = actCadClienteExecute
    end
    object actGrupoCliente: TAction
      Category = 'Cadastro'
      Caption = 'Grupo de Cliente'
      OnExecute = actGrupoClienteExecute
    end
    object actCargo: TAction
      Category = 'Cadastro'
      Caption = 'Cargo'
      OnExecute = actCargoExecute
    end
    object actUsuario: TAction
      Category = 'Cadastro'
      Caption = 'Usuario'
      OnExecute = actUsuarioExecute
    end
    object actDepartamento: TAction
      Category = 'Cadastro'
      Caption = 'Departamento'
      OnExecute = actDepartamentoExecute
    end
    object actFuncionario: TAction
      Category = 'Cadastro'
      Caption = 'Funcionario'
      OnExecute = actFuncionarioExecute
    end
    object actFornecedor: TAction
      Category = 'Cadastro'
      Caption = 'Fornecedor'
      OnExecute = actFornecedorExecute
    end
    object actGrupoProduto: TAction
      Category = 'Cadastro'
      Caption = 'Grupo de Produto'
      OnExecute = actGrupoProdutoExecute
    end
    object actLinha: TAction
      Category = 'Cadastro'
      Caption = 'Linha'
      OnExecute = actLinhaExecute
    end
    object actLocalizacao: TAction
      Category = 'Cadastro'
      Caption = 'Localiza'#231#227'o'
      OnExecute = actLocalizacaoExecute
    end
    object actCadProduto: TAction
      Category = 'Cadastro'
      Caption = 'Cadastro de produto'
      OnExecute = actCadProdutoExecute
    end
    object actUnidade: TAction
      Category = 'Cadastro'
      Caption = 'Unidade'
      OnExecute = actUnidadeExecute
    end
    object actFabricante: TAction
      Category = 'Cadastro'
      Caption = 'Fabricante'
      OnExecute = actFabricanteExecute
    end
    object actCodigoMunServico: TAction
      Category = 'Cadastro'
      Caption = 'C'#243'digo Municipal de Servi'#231'o'
    end
    object actProcessoServico: TAction
      Category = 'Cadastro'
      Caption = 'Processos de Servi'#231'o'
      OnExecute = actProcessoServicoExecute
    end
    object actPeriodicidade: TAction
      Category = 'Cadastro'
      Caption = 'Periodicidade'
      OnExecute = actPeriodicidadeExecute
    end
    object actBanco: TAction
      Category = 'Cadastro'
      Caption = 'Banco'
      OnExecute = actBancoExecute
    end
    object actContaBancaria: TAction
      Category = 'Cadastro'
      Caption = 'Conta Banc'#225'ria'
      OnExecute = actContaBancariaExecute
    end
    object actCondicaoPagamento: TAction
      Category = 'Cadastro'
      Caption = 'Condi'#231#227'o de Pagamento'
      OnExecute = actCondicaoPagamentoExecute
    end
    object actProposta: TAction
      Category = 'Venda'
      Caption = 'Proposta'
      OnExecute = actPropostaExecute
    end
    object actVenda: TAction
      Category = 'Venda'
      Caption = 'Venda'
      OnExecute = actVendaExecute
    end
    object actTipoContrato: TAction
      Category = 'Cadastro'
      Caption = 'Tipo de Contrato'
      OnExecute = actTipoContratoExecute
    end
    object actContrato: TAction
      Category = 'Venda'
      Caption = 'Centro de contrato'
      OnExecute = actContratoExecute
    end
    object actTipoOS: TAction
      Category = 'Cadastro'
      Caption = 'Tipo de O.S.'
      OnExecute = actTipoOSExecute
    end
    object actStatusOS: TAction
      Category = 'Cadastro'
      Caption = 'Status O.S.'
      OnExecute = actStatusOSExecute
    end
    object actInclusaoOS: TAction
      Category = 'Venda'
      Caption = 'Inclusao O.S.'
      OnExecute = actInclusaoOSExecute
    end
    object actCentralOS: TAction
      Category = 'Venda'
      Caption = 'Central O.S.'
      OnExecute = actCentralOSExecute
    end
    object actOS: TAction
      Category = 'Venda'
      Caption = 'Ordens de servi'#231'o'
      OnExecute = actOSExecute
    end
    object actAgenda: TAction
      Category = 'Venda'
      Caption = 'Agenda'
      OnExecute = actAgendaExecute
    end
    object actEntrada: TAction
      Category = 'Venda'
      Caption = 'Entrada de produtos'
      OnExecute = actEntradaExecute
    end
    object actOperacaoEstoque: TAction
      Category = 'Cadastro'
      Caption = 'Opera'#231#227'o Estoque'
      OnExecute = actOperacaoEstoqueExecute
    end
  end
  object dxDockingManager1: TdxDockingManager
    Color = clBtnFace
    DefaultHorizContainerSiteProperties.Dockable = True
    DefaultHorizContainerSiteProperties.ImageIndex = -1
    DefaultVertContainerSiteProperties.Dockable = True
    DefaultVertContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.Dockable = True
    DefaultTabContainerSiteProperties.ImageIndex = -1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ViewStyle = vsUseLookAndFeel
    Left = 232
    Top = 192
  end
  object DataAgenda: TDataSource
    DataSet = CdsAgenda
    Left = 112
    Top = 240
  end
  object CdsAgenda: TpFIBClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 248
  end
end
