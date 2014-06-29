unit uPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,uPrincipalPadrao, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxBarPainter, ActnList, Menus, dxBar, dxStatusBar,
  dxRibbonStatusBar,Generics.Collections, dxSkinscxPCPainter, cxPC, StdCtrls,
  ExtCtrls, dxSkinsdxDockControlPainter, dxDockControl, dxDockPanel, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, DBClient,
  pFIBClientDataSet, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmPrincipal = class(TfrmPrincipalPadrao)
    actCadastro: TAction;
    actCFOP: TAction;
    actNCM: TAction;
    actEmpresa: TAction;
    Cadastro1: TMenuItem;
    actCFOP1: TMenuItem;
    actNCM1: TMenuItem;
    actEmpresa1: TMenuItem;
    actCadCliente: TAction;
    Cliente1: TMenuItem;
    actGrupoCliente: TAction;
    GrupodeCliente1: TMenuItem;
    actCargo: TAction;
    Cargo1: TMenuItem;
    actUsuario: TAction;
    actUsuario1: TMenuItem;
    actDepartamento: TAction;
    Departamento1: TMenuItem;
    actFuncionario: TAction;
    Funcionario1: TMenuItem;
    actFornecedor: TAction;
    Fornecedor1: TMenuItem;
    actGrupoProduto: TAction;
    actLinha: TAction;
    actLocalizacao: TAction;
    Linha1: TMenuItem;
    Localizao1: TMenuItem;
    GrupodeCliente2: TMenuItem;
    actCadProduto: TAction;
    Cadastrodeproduto1: TMenuItem;
    actUnidade: TAction;
    Unidade1: TMenuItem;
    actFabricante: TAction;
    Fabricante1: TMenuItem;
    actCodigoMunServico: TAction;
    actProcessoServico: TAction;
    ProcessosdeServio1: TMenuItem;
    actPeriodicidade: TAction;
    Periodicidade1: TMenuItem;
    actBanco: TAction;
    Banco1: TMenuItem;
    actContaBancaria: TAction;
    actContaBancaria1: TMenuItem;
    actCondicaoPagamento: TAction;
    CondiodePagamento1: TMenuItem;
    actProposta: TAction;
    actEstoque: TAction;
    Venda1: TMenuItem;
    actTipoContrato: TAction;
    ipodeContrato1: TMenuItem;
    actContrato: TAction;
    Centrodecontrato1: TMenuItem;
    actTipoOS: TAction;
    ipodeOS1: TMenuItem;
    actStatusOS: TAction;
    StatusOS1: TMenuItem;
    actInclusaoOS: TAction;
    InclusaoOS1: TMenuItem;
    actCentralOS: TAction;
    actOS: TAction;
    Ordensdeservio1: TMenuItem;
    CentralOS1: TMenuItem;
    actAgenda: TAction;
    Agenda1: TMenuItem;
    dxDockingManager1: TdxDockingManager;
    DockAgenda: TdxDockPanel;
    dxDockSite1: TdxDockSite;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dxDockPanel1: TdxDockPanel;
    dxLayoutDockSite2: TdxLayoutDockSite;
    pnlAgenda: TPanel;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DataAgenda: TDataSource;
    CdsAgenda: TpFIBClientDataSet;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    actNovaEntrada: TAction;
    Entradadeprodutos1: TMenuItem;
    actOperacaoEstoque: TAction;
    OperaoEstoque1: TMenuItem;
    actVenda: TAction;
    actListagemEntrada: TAction;
    Venda2: TMenuItem;
    Proposta2: TMenuItem;
    N1: TMenuItem;
    ListagemdeEntrada1: TMenuItem;
    actClientes: TAction;
    Pessoas1: TMenuItem;
    actProdutos: TAction;
    Produtos1: TMenuItem;
    actSobreEmpresa: TAction;
    Empresa1: TMenuItem;
    actCadOS: TAction;
    OS1: TMenuItem;
    actCadFin: TAction;
    Financeiro1: TMenuItem;
    actCadContrato: TAction;
    Contrato1: TMenuItem;
    actEntradas: TAction;
    Entrada1: TMenuItem;
    procedure actCadastroExecute(Sender: TObject);
    procedure actCFOPExecute(Sender: TObject);
    procedure actNCMExecute(Sender: TObject);
    procedure actEmpresaExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actCadClienteExecute(Sender: TObject);
    procedure actGrupoClienteExecute(Sender: TObject);
    procedure actCargoExecute(Sender: TObject);
    procedure actUsuarioExecute(Sender: TObject);
    procedure actDepartamentoExecute(Sender: TObject);
    procedure actFuncionarioExecute(Sender: TObject);
    procedure actFornecedorExecute(Sender: TObject);
    procedure actGrupoProdutoExecute(Sender: TObject);
    procedure actLinhaExecute(Sender: TObject);
    procedure actLocalizacaoExecute(Sender: TObject);
    procedure actCadProdutoExecute(Sender: TObject);
    procedure actUnidadeExecute(Sender: TObject);
    procedure actFabricanteExecute(Sender: TObject);
    procedure actProcessoServicoExecute(Sender: TObject);
    procedure actPeriodicidadeExecute(Sender: TObject);
    procedure actBancoExecute(Sender: TObject);
    procedure actContaBancariaExecute(Sender: TObject);
    procedure actCondicaoPagamentoExecute(Sender: TObject);
    procedure actPropostaExecute(Sender: TObject);
    procedure actEstoqueExecute(Sender: TObject);
    procedure actTipoContratoExecute(Sender: TObject);
    procedure actContratoExecute(Sender: TObject);
    procedure actTipoOSExecute(Sender: TObject);
    procedure actStatusOSExecute(Sender: TObject);
    procedure actInclusaoOSExecute(Sender: TObject);
    procedure actCentralOSExecute(Sender: TObject);
    procedure actOSExecute(Sender: TObject);
    procedure actAgendaExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure actNovaEntradaExecute(Sender: TObject);
    procedure actOperacaoEstoqueExecute(Sender: TObject);
    procedure actVendaExecute(Sender: TObject);
    procedure actListagemEntradaExecute(Sender: TObject);
    procedure actClientesExecute(Sender: TObject);
    procedure actProdutosExecute(Sender: TObject);
    procedure actSobreEmpresaExecute(Sender: TObject);
    procedure actCadOSExecute(Sender: TObject);
    procedure actCadFinExecute(Sender: TObject);
    procedure actCadContratoExecute(Sender: TObject);
    procedure actEntradasExecute(Sender: TObject);
  private
    { Private declarations }
    Procedure AtualizaAgenda;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uForms, MinhasClasses, uCadNCM, Comandos;

{$R *.dfm}

procedure TfrmPrincipal.actAgendaExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreAgenda;
end;

procedure TfrmPrincipal.actBancoExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroBanco;
end;

procedure TfrmPrincipal.actCadastroExecute(Sender: TObject);
begin
  inherited;
  //

end;

procedure TfrmPrincipal.actCadClienteExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroCliente;
end;

procedure TfrmPrincipal.actCadContratoExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmPrincipal.actCadFinExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmPrincipal.actCadOSExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmPrincipal.actCadProdutoExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroProduto;
end;

procedure TfrmPrincipal.actCargoExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms. AbreCadastroCargos
end;

procedure TfrmPrincipal.actCentralOSExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCentralOS;
end;

procedure TfrmPrincipal.actCFOPExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreFormSimplesPeloTipoPesquisa(tpERPCFOP);
end;

procedure TfrmPrincipal.actCondicaoPagamentoExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroCondicaoPagamento
end;

procedure TfrmPrincipal.actContaBancariaExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroContaBancaria;
end;

procedure TfrmPrincipal.actContratoExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreContratos;
end;

procedure TfrmPrincipal.actDepartamentoExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroDepartamento;
end;

procedure TfrmPrincipal.actEmpresaExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroEmpresa;
end;

procedure TfrmPrincipal.actEntradasExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmPrincipal.actNovaEntradaExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreEntradaProduto;
end;

procedure TfrmPrincipal.actFabricanteExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroFabricante;
end;

procedure TfrmPrincipal.actFornecedorExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroFornecedor;
end;

procedure TfrmPrincipal.actFuncionarioExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroFuncionarios;
end;

procedure TfrmPrincipal.actGrupoClienteExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroGrupoCliente;
end;

procedure TfrmPrincipal.actGrupoProdutoExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroGrupo;
end;

procedure TfrmPrincipal.actInclusaoOSExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreInclusaoOS;
end;

procedure TfrmPrincipal.actLinhaExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroLinha;
end;

procedure TfrmPrincipal.actListagemEntradaExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreListageEntrada;
end;

procedure TfrmPrincipal.actLocalizacaoExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroLocalizacao;
end;

procedure TfrmPrincipal.actNCMExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroNCM;
end;

procedure TfrmPrincipal.actOperacaoEstoqueExecute(Sender: TObject);
begin
  inherited;
  TRotinasForms.AbreCadastroOperacaoEstoque;
end;

procedure TfrmPrincipal.actOSExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmPrincipal.actPeriodicidadeExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroPeridicidade;
end;

procedure TfrmPrincipal.actClientesExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmPrincipal.actProcessoServicoExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroProcessoServico;
end;

procedure TfrmPrincipal.actProdutosExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmPrincipal.actPropostaExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreProposta;
end;

procedure TfrmPrincipal.actSobreEmpresaExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmPrincipal.actStatusOSExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroStatusOS;
end;

procedure TfrmPrincipal.actTipoContratoExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroTipoContrato;
end;

procedure TfrmPrincipal.actTipoOSExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroTipoOS;
end;

procedure TfrmPrincipal.actUnidadeExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroUnidade;
end;

procedure TfrmPrincipal.actUsuarioExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroUsuario;
end;

procedure TfrmPrincipal.actVendaExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmPrincipal.actEstoqueExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmPrincipal.AtualizaAgenda;
var
  Filtro: String;
begin
  Filtro := '  (DATACOMPROMISSO <= CURRENT_DATE +7 ) AND  COALESCE(A.FLAGBAIXADO,''N'') = ''N'' ';
  SetCds(CdsAgenda,tpERPAgenda,Filtro);
//  if CdsAgenda.RecordCount = 0 Then
//    DockAgenda.AutoHide := True;
end;

procedure TfrmPrincipal.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreAgenda( Self.CdsAgenda.FieldByName('IdAgenda').AsInteger);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  Menu := MainMenu;

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  inherited;
  AtualizaAgenda;
end;

end.
