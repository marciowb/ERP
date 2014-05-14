unit uForms;

interface
  uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs,Lst_CadastroERP, MinhasClasses,uCad_CadastroPaiERP,uListagemPadraoERP,
     Generics.Collections;


  type
    TClasseCadastroSimples = class of TfrmLstCadastroSimplesERP;
    TClasseCadastroPai = class of TfrmCad_CadastroPaiERP;
    CampoChave = Variant;

    TrotinasForms = class
      class Procedure AbreFormCadastroPai<MyForm: TfrmCad_CadastroPaiERP  >;
      class Procedure AbreFormListagemPadrao<MyForm: TfrmListagemPadraoERP >;
      class procedure AbreFormSimples(aForm: TfrmLstCadastroSimplesERP; aClasse: TClasseCadastroSimples);
      class procedure AbreFormSimplesPeloTipoPesquisa(aTipoPesquisa: TTipoPesquisa);
      class Function AbreCadastroNCM: CampoChave;
      class Function AbreCadastroEmpresa: CampoChave;
      class Function AbreCadastroCliente: CampoChave;
      class Function AbreCadastroGrupoCliente: CampoChave;
      class Function AbreCadastroCargos: CampoChave;
      class Function AbreCadastroUsuario: CampoChave;
      class function AbreCadastroDepartamento: CampoChave;
      class function AbreCadastroFuncionarios: CampoChave;
      class function AbreCadastroFornecedor: CampoChave;
      class function AbreCadastroLinha: CampoChave;
      class function AbreCadastroGrupo: CampoChave;
      class function AbreCadastroLocalizacao: CampoChave;
      class function AbreCadastroProduto: CampoChave;
      class function AbreCadastroFabricante: CampoChave;
      class function AbreCadastroUnidade: CampoChave;
      class function AbreCadastroCodigoMunicipalServico: CampoChave;
      class function AbreCadastroProcessoServico: CampoChave;
      class function AbreCadastroPeridicidade: CampoChave;
      class function AbreCadastroBanco: CampoChave;
      class function AbreCadastroContaBancaria: CampoChave;
      class function AbreCadastroCondicaoPagamento: CampoChave;
      class function AbreProposta: CampoChave;
      class function AbreCadastroTipoContrato: CampoChave;
    end;



implementation

uses uCadNCM, Lst_Empresa, Cad_Cliente, Cad_usuario, uCad_Funcionario,
  uCad_Fornecedor, uCad_Produto, uLst_Periodicidade, uLst_ContaBancaria,
  uLst_CondicaoPagamento, uLst_Proposta, uLst_TipoContrato;

class function TrotinasForms.AbreCadastroBanco: CampoChave;
begin
  AbreFormSimplesPeloTipoPesquisa(tpERPBanco);
end;

class function TrotinasForms.AbreCadastroCargos: CampoChave;
begin
  AbreFormSimplesPeloTipoPesquisa(tpERPCargo);
end;

class function TrotinasForms.AbreCadastroCliente: CampoChave;
begin
  AbreFormCadastroPai<TfrmCad_Cliente>;
end;

class function TrotinasForms.AbreCadastroCodigoMunicipalServico: CampoChave;
begin
  AbreFormSimplesPeloTipoPesquisa(tpERPCodigoMunicipalServico);
end;

class function TrotinasForms.AbreCadastroCondicaoPagamento: CampoChave;
begin
  AbreFormSimples(frmLst_CondicaoPagamento, TfrmLst_CondicaoPagamento);
end;

class function TrotinasForms.AbreCadastroContaBancaria: CampoChave;
begin
  AbreFormSimples(frmLst_ContaBancaria, TfrmLst_ContaBancaria);
end;

class function TrotinasForms.AbreCadastroDepartamento: CampoChave;
begin
  AbreFormSimplesPeloTipoPesquisa(tpERPDepartamento);
end;

class function TrotinasForms.AbreCadastroEmpresa: CampoChave;
begin
  AbreFormSimples(frmLst_Empresa, TfrmLst_Empresa);
end;

class function TrotinasForms.AbreCadastroFabricante: CampoChave;
begin
  AbreFormSimplesPeloTipoPesquisa(tpERPFabricante);
end;

class function TrotinasForms.AbreCadastroFornecedor: CampoChave;
begin
  AbreFormCadastroPai<TfrmCad_Fornecedor>;
end;

class function TrotinasForms.AbreCadastroFuncionarios: CampoChave;
begin
  AbreFormCadastroPai<TfrmCadFuncionario>;
end;

class function TrotinasForms.AbreCadastroGrupo: CampoChave;
begin
  AbreFormSimplesPeloTipoPesquisa(tpERPGrupo);
end;

class function TrotinasForms.AbreCadastroGrupoCliente: CampoChave;
begin
   AbreFormSimplesPeloTipoPesquisa(tpERPGrupoCliente);
end;

class function TrotinasForms.AbreCadastroLinha: CampoChave;
begin
  AbreFormSimplesPeloTipoPesquisa(tpERPLinha);
end;

class function TrotinasForms.AbreCadastroLocalizacao: CampoChave;
begin
  AbreFormSimplesPeloTipoPesquisa(tpERPLocalizacao);
end;

class function TrotinasForms.AbreCadastroNCM: CampoChave;
begin
  AbreFormCadastroPai<TfrmCad_NCM>;
end;

class function TrotinasForms.AbreCadastroPeridicidade: CampoChave;
begin
  AbreFormSimples(frmLst_Periodicidade,TfrmLst_Periodicidade);
end;

class function TrotinasForms.AbreCadastroProcessoServico: CampoChave;
begin
  AbreFormSimplesPeloTipoPesquisa(tpERPProcessosservico);
end;

class function TrotinasForms.AbreCadastroProduto: CampoChave;
begin
   AbreFormCadastroPai<TfrmCad_Produto>;
end;

class function TrotinasForms.AbreCadastroTipoContrato: CampoChave;
begin
  AbreFormSimples(frmLst_TipoContrato, TfrmLst_TipoContrato);
end;

class function TrotinasForms.AbreCadastroUnidade: CampoChave;
begin
   AbreFormSimplesPeloTipoPesquisa(tpERPUnidade);
end;

class function TrotinasForms.AbreCadastroUsuario: CampoChave;
begin
  AbreFormCadastroPai<TfrmCad_usuario>;
end;

class procedure TrotinasForms. AbreFormSimples(aForm: TfrmLstCadastroSimplesERP; aClasse: TClasseCadastroSimples);
  begin
    Try
      Application.CreateForm(aClasse, aform);
      aForm.ShowModal;
    Finally
      FreeAndNil(aForm);
    End;
  end;

class procedure TrotinasForms.AbreFormSimplesPeloTipoPesquisa(aTipoPesquisa: TTipoPesquisa);
  var
    aForm : TfrmLstCadastroSimplesERP;
  begin
    Try
      Application.CreateForm(TfrmLstCadastroSimplesERP, aform);
      aForm.TipoPesquisa := aTipoPesquisa;
      aForm.ShowModal;
    Finally
      FreeAndNil(aForm);
    End;
  end;


class function TrotinasForms.AbreProposta: CampoChave;
begin
  AbreFormListagemPadrao<TfrmLst_Proposta>;
end;

{ TTelas }

class procedure TrotinasForms.AbreFormCadastroPai<MyForm>;
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
