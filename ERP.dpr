program ERP;

uses
  Forms,
  SysUtils,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uFormPadrao in '..\Global\uFormPadrao.pas' {frmPadrao},
  Cad_CadastroPai in '..\Global\Cad_CadastroPai.pas' {frmCad_CadastroPai},
  Comandos in '..\Global\Comandos.pas',
  Dlg_Cadastro in '..\Global\Dlg_Cadastro.pas' {frmDlg_Cadastro},
  Lst_CadastroSimples in '..\Global\Lst_CadastroSimples.pas' {frmLstCadastroSimples},
  MinhasClasses in '..\Global\MinhasClasses.pas',
  uAcessoUsuario in '..\Global\uAcessoUsuario.pas',
  uAguarde in '..\Global\uAguarde.pas' {frmAguarde},
  uCad_Licenca in '..\Global\uCad_Licenca.pas' {frmCad_Licenca},
  UCfgPadrao in '..\Global\UCfgPadrao.pas',
  uConfiguracoes in '..\Global\uConfiguracoes.pas',
  UdlgRelatorioPadrao in '..\Global\UdlgRelatorioPadrao.pas' {frmdlgRelatorioPadrao},
  UDmConexao in '..\Global\UDmConexao.pas' {DMConexao: TDataModule},
  uDmRelatorio in '..\Global\uDmRelatorio.pas' {DmRelatorio: TDataModule},
  uLibEmail in '..\Global\uLibEmail.pas',
  uLibLicenca in '..\Global\uLibLicenca.pas',
  uLista_Layouts in '..\Global\uLista_Layouts.pas' {frmLista_Layouts},
  uListagemPadrao in '..\Global\uListagemPadrao.pas' {frmListagemPadrao},
  uMetodosRB in '..\Global\uMetodosRB.pas',
  uObs in '..\Global\uObs.pas' {frmOBS},
  uPesquisa_kimera in '..\Global\uPesquisa_kimera.pas' {frmPesquisa},
  uPrincipalPadrao in '..\Global\uPrincipalPadrao.pas' {frmPrincipalPadrao},
  uSQL in '..\Global\uSQL.pas',
  Lst_CadastroERP in 'Lst_CadastroERP.pas' {frmLstCadastroSimplesERP},
  uCad_CadastroPaiERP in 'uCad_CadastroPaiERP.pas' {frmCad_CadastroPaiERP},
  Lst_Empresa in 'Lst_Empresa.pas' {frmLst_Empresa},
  uAuditoria in 'uAuditoria.pas' {frmAuditoria},
  Cad_CEP in 'Cad_CEP.pas' {frmCad_CEP},
  Cad_usuario in 'Cad_usuario.pas' {frmCad_usuario},
  uLst_Unidade in 'uLst_Unidade.pas' {frmLst_Unidade},
  Cad_Agenda in 'Cad_Agenda.pas' {frmCad_Agenda},
  uAgenda in 'uAgenda.pas' {frmAgenda},
  uLogin in 'uLogin.pas' {frmLogin},
  uCadNCM in 'uCadNCM.pas' {frmCad_NCM},
  uSQLERP in 'uSQLERP.pas',
  uForms in 'uForms.pas',
  Cad_Cliente in 'Cad_Cliente.pas' {frmCad_Cliente},
  uCad_Funcionario in 'uCad_Funcionario.pas' {frmCadFuncionario},
  uCad_Fornecedor in 'uCad_Fornecedor.pas' {frmCad_Fornecedor},
  uCad_Produto in 'uCad_Produto.pas' {frmCad_Produto},
  uLst_Periodicidade in 'uLst_Periodicidade.pas' {frmLst_Periodicidade},
  uLst_ContaBancaria in 'uLst_ContaBancaria.pas' {frmLst_ContaBancaria},
  uLst_CondicaoPagamento in 'uLst_CondicaoPagamento.pas' {frmLst_CondicaoPagamento},
  uConstantes in 'uConstantes.pas',
  uListagemPadraoERP in 'uListagemPadraoERP.pas' {frmListagemPadraoERP},
  uLst_Proposta in 'uLst_Proposta.pas' {frmLst_Proposta},
  uCad_proposta in 'uCad_proposta.pas' {frmCad_Proposta},
  uDlg_CadastroERP in 'uDlg_CadastroERP.pas' {frmDlg_CadastroERP},
  udlg_ItensProposta in 'udlg_ItensProposta.pas' {frmDlg_ItensProposta},
  udlgCondicaoPagamentoProposta in 'udlgCondicaoPagamentoProposta.pas' {frmdlgCondicaoPagamentoProposta},
  uRegras in 'uRegras.pas',
  uLst_TipoContrato in 'uLst_TipoContrato.pas' {frmLst_TipoContrato},
  uLst_Contratos in 'uLst_Contratos.pas' {frmLst_Contratos},
  uCad_Contratos in 'uCad_Contratos.pas' {frmCad_Contrato};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  InfoSistema.LocalBancoDados := 'D:\Meus Projetos\Bancos\Erp.fdb';
  if not FileExists(InfoSistema.LocalBancoDados) then
    InfoSistema.LocalBancoDados := ExtractFilePath(Application.ExeName)+'Erp.fdb';
  InfoSistema.NomeBanco :='Erp.fdb';
  InfoSistema.Host := '127.0.0.1';
  InfoSistema.UsaBancoDados := True;
  InfoSistema.Sistema := sERP;
  InfoSistema.VerificaLicenca := False;
  InfoSistema.SQLs := TSQLERP.Create;

  Application.Title := 'ERP';


  Application.CreateForm(TDMConexao, DMConexao);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
