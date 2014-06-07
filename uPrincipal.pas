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
  dxRibbonStatusBar,Generics.Collections;

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
    actVenda: TAction;
    Venda1: TMenuItem;
    Proposta1: TMenuItem;
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
    procedure actVendaExecute(Sender: TObject);
    procedure actTipoContratoExecute(Sender: TObject);
    procedure actContratoExecute(Sender: TObject);
    procedure actTipoOSExecute(Sender: TObject);
    procedure actStatusOSExecute(Sender: TObject);
    procedure actInclusaoOSExecute(Sender: TObject);
    procedure actCentralOSExecute(Sender: TObject);
    procedure actOSExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uForms, MinhasClasses, uCadNCM;

{$R *.dfm}

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

procedure TfrmPrincipal.actProcessoServicoExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroProcessoServico;
end;

procedure TfrmPrincipal.actPropostaExecute(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreProposta;
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

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  Menu := MainMenu;
end;

end.
