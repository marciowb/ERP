unit uForms;

interface
  uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs,Lst_CadastroERP, MinhasClasses,uCad_CadastroPaiERP,uListagemPadraoERP,
     Generics.Collections,cxPC,TypInfo;


  type
    TClasseCadastroSimples = class of TfrmLstCadastroSimplesERP;
    TClasseCadastroPai = class of TfrmCad_CadastroPaiERP;
    CampoChave = Variant;


    TrotinasForms = class
      class Procedure AbreFormCadastroPai<MyForm: TfrmCad_CadastroPaiERP  >(TipoOperacaoForm: TTipoOperacaoForm);
      class Procedure AbreFormListagemPadrao<MyForm: TfrmListagemPadraoERP >;
      class procedure AbreFormSimples(aForm: TfrmLstCadastroSimplesERP; aClasse: TClasseCadastroSimples;TipoOperacao: TTipoOperacaoForm = toNada);
      class procedure AbreFormSimplesPeloTipoPesquisa(aTipoPesquisa: TTipoPesquisa;TipoOperacaoForm: TTipoOperacaoForm = toNada);
      class Function AbreCadastroNCM(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class Function AbreCadastroEmpresa(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class Function AbreCadastroCliente(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class Function AbreCadastroGrupoCliente(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class Function AbreCadastroCargos(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class Function AbreCadastroUsuario(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreCadastroDepartamento(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreCadastroFuncionarios(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreCadastroFornecedor(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreCadastroLinha(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreCadastroGrupo(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreCadastroLocalizacao(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreCadastroProduto(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreCadastroFabricante(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreCadastroUnidade(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreCadastroCodigoMunicipalServico(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreCadastroProcessoServico(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreCadastroPeridicidade(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreCadastroBanco(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreCadastroContaBancaria(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreCadastroCondicaoPagamento(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreProposta(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreCadastroTipoContrato(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreContratos(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreManutencaoEquipamentoCliente(pIdCliente: Integer;TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreCadastroTipoOS(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreCadastroStatusOS(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
      class function AbreInclusaoOS: CampoChave;
      class function AbreCentralOS: CampoChave;
      class procedure AbreEntradaProduto;
      class procedure AbreAgenda(IdAgenda: Integer = -1);
      class function AbreCadastroOperacaoEstoque(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
  private

    end;



implementation

uses uCadNCM, Lst_Empresa, Cad_Cliente, Cad_usuario, uCad_Funcionario,
  uCad_Fornecedor, uCad_Produto, uLst_Periodicidade, uLst_ContaBancaria,
  uLst_CondicaoPagamento, uLst_Proposta, uLst_TipoContrato, uLst_Contratos,
  uDlg_EquipamentoCliente, uLst_TipoOS, uLst_StatusOS, uLst_OS, uCad_OS,
  uAgenda, uPrincipal, uEntrada, Lst_OperacaoEstoque;

class procedure TrotinasForms.AbreAgenda(IdAgenda: Integer = -1);
begin
  Try
    frmAgenda := TfrmAgenda.Create(nil);
    frmAgenda.IdAgenda := IdAgenda;
    frmAgenda.ShowModal;
  Finally
    FreeAndNil(frmAgenda);
  End;
end;

class function TrotinasForms.AbreCadastroBanco(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormSimplesPeloTipoPesquisa(tpERPBanco,TipoOperacao);
end;

class function TrotinasForms.AbreCadastroCargos(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormSimplesPeloTipoPesquisa(tpERPCargo,TipoOperacao);
end;

class function TrotinasForms.AbreCadastroCliente(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormCadastroPai<TfrmCad_Cliente>(TipoOperacao);
end;

class function TrotinasForms.AbreCadastroCodigoMunicipalServico(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormSimplesPeloTipoPesquisa(tpERPCodigoMunicipalServico,TipoOperacao);
end;

class function TrotinasForms.AbreCadastroCondicaoPagamento(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormSimples(frmLst_CondicaoPagamento, TfrmLst_CondicaoPagamento,TipoOperacao);
end;

class function TrotinasForms.AbreCadastroContaBancaria(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormSimples(frmLst_ContaBancaria, TfrmLst_ContaBancaria,TipoOperacao);
end;

class function TrotinasForms.AbreCadastroDepartamento(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormSimplesPeloTipoPesquisa(tpERPDepartamento,TipoOperacao);
end;

class function TrotinasForms.AbreCadastroEmpresa(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormSimples(frmLst_Empresa, TfrmLst_Empresa,TipoOperacao);
end;

class function TrotinasForms.AbreCadastroFabricante(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormSimplesPeloTipoPesquisa(tpERPFabricante,TipoOperacao);
end;

class function TrotinasForms.AbreCadastroFornecedor(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormCadastroPai<TfrmCad_Fornecedor>(TipoOperacao);
end;

class function TrotinasForms.AbreCadastroFuncionarios(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormCadastroPai<TfrmCadFuncionario>(TipoOperacao);
end;

class function TrotinasForms.AbreCadastroGrupo(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormSimplesPeloTipoPesquisa(tpERPGrupo,TipoOperacao);
end;

class function TrotinasForms.AbreCadastroGrupoCliente(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
   AbreFormSimplesPeloTipoPesquisa(tpERPGrupoCliente,TipoOperacao);
end;

class function TrotinasForms.AbreCadastroLinha(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormSimplesPeloTipoPesquisa(tpERPLinha,TipoOperacao);
end;

class function TrotinasForms.AbreCadastroLocalizacao(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormSimplesPeloTipoPesquisa(tpERPLocalizacao,TipoOperacao);
end;

class function TrotinasForms.AbreCadastroNCM(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormCadastroPai<TfrmCad_NCM>(TipoOperacao);
end;

class function TrotinasForms.AbreCadastroOperacaoEstoque(
  TipoOperacao: TTipoOperacaoForm): CampoChave;
begin
  AbreFormSimples(frmLst_OperacaoEstoque,TfrmLst_OperacaoEstoque,TipoOperacao);
end;

class function TrotinasForms.AbreCadastroPeridicidade(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormSimples(frmLst_Periodicidade,TfrmLst_Periodicidade,TipoOperacao);
end;

class function TrotinasForms.AbreCadastroProcessoServico(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormSimplesPeloTipoPesquisa(tpERPProcessosservico,TipoOperacao);
end;

class function TrotinasForms.AbreCadastroProduto(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
   AbreFormCadastroPai<TfrmCad_Produto>(TipoOperacao);
end;

class function TrotinasForms.AbreCadastroStatusOS(
  TipoOperacao: TTipoOperacaoForm): CampoChave;
begin
  AbreFormSimples(frmLst_StatusOS,TfrmLst_StatusOS,TipoOperacao);
end;

class function TrotinasForms.AbreCadastroTipoContrato(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormSimples(frmLst_TipoContrato, TfrmLst_TipoContrato,TipoOperacao);
end;

class function TrotinasForms.AbreCadastroTipoOS(
  TipoOperacao: TTipoOperacaoForm): CampoChave;
begin
  AbreFormSimples(frmLst_TipoOS,TfrmLst_TipoOS,TipoOperacao);
end;

class function TrotinasForms.AbreCadastroUnidade(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
   AbreFormSimplesPeloTipoPesquisa(tpERPUnidade,TipoOperacao);
end;

class function TrotinasForms.AbreCadastroUsuario(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormCadastroPai<TfrmCad_usuario>(TipoOperacao);
end;

class function TrotinasForms.AbreCentralOS: CampoChave;
begin
  AbreFormListagemPadrao<TfrmLst_OS>
end;

class function TrotinasForms.AbreContratos(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
   AbreFormListagemPadrao<TfrmLst_Contratos>
end;

class procedure TrotinasForms.AbreEntradaProduto;
begin
  if not Assigned(frmEntradaEstoque) then
    frmEntradaEstoque := TfrmEntradaEstoque.Create(nil);
  if frmEntradaEstoque.Showing then
    frmEntradaEstoque.BringToFront
  else
    frmEntradaEstoque.Show;
end;

class procedure TrotinasForms. AbreFormSimples(aForm: TfrmLstCadastroSimplesERP; aClasse: TClasseCadastroSimples;TipoOperacao: TTipoOperacaoForm = toNada);
  begin
    Try
      Application.CreateForm(aClasse, aform);
      case TipoOperacao of
        toNada: ;
        toEditar:
          aForm.EditReg := True;
        toIncluir:
          aForm.NovoReg := True ;
      end;
      aForm.ShowModal;
    Finally
      FreeAndNil(aForm);
    End;
  end;

class procedure TrotinasForms.AbreFormSimplesPeloTipoPesquisa(aTipoPesquisa: TTipoPesquisa;TipoOperacaoForm: TTipoOperacaoForm);
  var
    aForm : TfrmLstCadastroSimplesERP;
  begin
    Try
      Application.CreateForm(TfrmLstCadastroSimplesERP, aform);
      aForm.TipoPesquisa := aTipoPesquisa;
        case TipoOperacaoForm of
        toNada: ;
        toEditar:
          aForm.EditReg := True;
        toIncluir:
          aForm.NovoReg := True ;
      end;
      aForm.ShowModal;
    Finally
      FreeAndNil(aForm);
    End;
  end;


class function TrotinasForms.AbreInclusaoOS: CampoChave;
begin
  AbreFormCadastroPai<TfrmCad_OS>(toIncluir);
end;

class function TrotinasForms.AbreManutencaoEquipamentoCliente(pIdCliente: Integer;TipoOperacao: TTipoOperacaoForm): CampoChave;
begin
  Try
    frmDlg_EquipamentoCliente := TfrmDlg_EquipamentoCliente.Create(nil);
    frmDlg_EquipamentoCliente.IdCliente := IntToSTr(pIdCliente);
    case TipoOperacao of
      toNada: ;
      toEditar:
        frmDlg_EquipamentoCliente.EditReg := True;
      toIncluir:
        frmDlg_EquipamentoCliente.NovoReg := True;
    end;
    if frmDlg_EquipamentoCliente.ShowModal= mrOk Then
      Result := frmDlg_EquipamentoCliente.pDataSet.FieldByName('IDCLIENTEEQUIPAMENTOS').Value;
  Finally
    FreeAndNil(frmDlg_EquipamentoCliente);
  End;
end;

class function TrotinasForms.AbreProposta(TipoOperacao: TTipoOperacaoForm = toNada): CampoChave;
begin
  AbreFormListagemPadrao<TfrmLst_Proposta>;
end;


{ TTelas }

class procedure TrotinasForms.AbreFormCadastroPai<MyForm>(TipoOperacaoForm: TTipoOperacaoForm);
var
  aForm: MyForm;
begin
  Try
    Application.CreateForm(MyForm, aform);
    case TipoOperacaoForm of
      toNada:;
      toEditar:
        aForm.EditReg := True;
      toIncluir:
        aForm.NovoReg := True;
    end;

    aForm.ShowModal;
  Finally
    FreeAndNil(aForm);
  End;

end;

class procedure TrotinasForms.AbreFormListagemPadrao<MyForm>;
var
  aForm: MyForm;
begin
  Try
    Application.CreateForm(MyForm, aform);
    aForm.ShowModal;
  Finally
    FreeAndNil(aForm);
  End;
end;

end.
