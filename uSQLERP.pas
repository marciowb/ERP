unit uSQLERP;

interface
  uses SysUtils,MinhasClasses,StrUtils;
   Type
     TSQLERP = class(TSQLs)
       Function GetMySQL(TipoPesquisa : TTipoPesquisa ; Complemento : String; Join: String = '') :TSQL;override;
     end;
implementation

{ TSQLERP }

function TSQLERP.GetMySQL(TipoPesquisa: TTipoPesquisa; Complemento,
  Join: String): TSQL;
begin
  Result.CampoCodigo := 'CODIGO' ;
  Result := inherited;
  Result.Versao20 := True;
  Result.UsaMaxParaCodigo := False;
  Result.TipoForm := TfGrid;
  with Result do
  Begin
    case TipoPesquisa of
     tpERPEmpresa:
     Begin
         CampoChave := 'IDEMPRESA';
         CampoDisplay := 'RAZAOSOCIAL';
         NomeTabela := 'EMPRESA';
         DescricaoCampoDisplay := 'Razão social';
         DescricaoTabela := 'Empresa';
         Versao20 := False;
         Select :=
           'SELECT E.IDEMPRESA, E.CODIGO, E.RAZAOSOCIAL, E.FANTASIA, E.CNPJ, '+
           '       E.IDCEP, E.COMPLEMENTO, E.NUMERO, E.LOGOMARCA, E.IE,E.IM,E.NUMEROPROPOSTA, E.NUMEROCONTRATO, '+
           '       E.TELEFONE, E.FAX, E.OBS,E.NUMEROOS, CEP.CEP, CEP.LOGRADOURO, CEP.BAIRRO, '+
           '       CEP.CIDADE,COALESCE(E.UF, CEP.UF) UF  '+
           '  FROM EMPRESA E '+
           ' INNER JOIN CEP  '+
           '    ON (CEP.IDCEP = E.IDCEP) '+
           ' WHERE 1=1 '+Complemento;
       End;
     tpERPCFOP:
       Begin
         CampoChave := 'IDCFOP';
         CampoDisplay := 'NATUREZA';
         NomeTabela := 'CFOP';
         DescricaoCampoDisplay := 'Natureza';
         DescricaoTabela := 'CFOP';
         CampoCodigo := 'CFOP';
         Versao20 := True;
         Select :=
            'SELECT IDCFOP, CFOP, NATUREZA '+
            '  FROM CFOP '+
            '  WHERE 1=1 '+Complemento;
       End;

     tpERPUnidade:
       Begin
         CampoChave := 'IDUNIDADE';
         CampoDisplay := 'NOMEUNIDADE';
         NomeTabela := 'UNIDADE';
         DescricaoCampoDisplay := 'Unidade';
         DescricaoTabela := 'Unidade';
         Versao20 := True;
         Select :=
            'SELECT IDUNIDADE, CODIGO, NOMEUNIDADE,FLAGFRACIONADO '+
            '  FROM UNIDADE '+
            '  WHERE 1=1 '+Complemento;
       End;

       tpERPAgenda:
       Begin
         CampoChave := 'IDAGENDA';
         CampoDisplay := '';
         NomeTabela := 'AGENDA';
         DescricaoCampoDisplay := '';
         DescricaoTabela := 'Agenda';
         CampoCodigo := '';
         Versao20 := False;
         Select :=
              'SELECT A.IDAGENDA, A.DATACOMPROMISSO, A.HORA, A.ASSUNTO,A.DATACRIACAO,A.FLAGPARTICULAR,A.IDFUNCIONARIO,'+
              '       A.TEXTO, A.FLAGBAIXADO,C.NOMECLIENTE,C.IDCLIENTE , A.NUMREPETICAO,A.IDAGENDAREF,'+
              '       ''0'' TYPE,''3'' OPTIONS,'+
              '       CAST(A.DATACOMPROMISSO+ A.HORA AS TIMESTAMP)DATA_HORAINI,'+
              '       CAST(A.DATACOMPROMISSO+ A.HORA AS TIMESTAMP)DATA_HORAFIM, '+
              '       ''Assunto: ''||A.ASSUNTO||'' Cliente: ''||COALESCE(C.NOMECLIENTE,'''')||'' Funcionário: ''||COALESCE(F.NOMEFUNCIONARIO,'''') CAPTION'+
              '  FROM AGENDA A'+
              '  LEFT JOIN CLIENTE C'+
              '    ON (C.IDCLIENTE = A.IDCLIENTE)'+
              '  LEFT JOIN FUNCIONARIO F '+
              '    ON (F.IDFUNCIONARIO = A.IDFUNCIONARIO)'+
              ' WHERE ((COALESCE(FLAGPARTICULAR,''N'') = ''N'') OR '+
              '        ((COALESCE(FLAGPARTICULAR,''N'') = ''Y'') AND '+
              '         (A.IDUSUARIO= '+IntToStr(USuarioLogado.Id)+' ) ) ) '+Complemento;
       End;
      tpERPNCM:
      Begin
        CampoChave := 'IDNCM';
        CampoDisplay := 'DESCRICAO';
        NomeTabela := 'NCM';
        DescricaoCampoDisplay := 'Descrição';
        DescricaoTabela := 'NCM';
        Versao20 := True;
        Select :=
          'SELECT IDNCM, DESCRICAO, CODIGO'+
          '  FROM NCM '+
          ' WHERE 1=1 '+Complemento;
      End;
     tpERPNCMTributacao:
      Begin
        CampoChave := 'IDNCMESTADO';
        CampoDisplay := '';
        NomeTabela := 'NCMESTADO';
        DescricaoCampoDisplay := '';
        DescricaoTabela := 'NCM Impostos';
        Versao20 := True;
        Select :=
          'SELECT IDNCMESTADO, IDNCM,UF,  '+
          '       ALIQPIS, ALIQCOFINS, ALIQII, ALIQIPI ,VALOR_LI,''N'' FLAGEDICAO '+
          '  FROM NCMESTADO '+
          ' WHERE 1=1 '+Complemento;
      End;
    tpERPCliente:
      Begin
       CampoChave := 'IDCLIENTE';
       CampoDisplay := 'NOMECLIENTE';
       NomeTabela := 'CLIENTE';
       DescricaoCampoDisplay := 'Nome';
       DescricaoTabela := 'Clientes';
       Versao20 := False;
       UsaMaxParaCodigo := True;
       DesconsiderarCampos := 'GRUPOCLIENTE';
       Select :=
          ' SELECT C.IDCLIENTE, C.CODIGO, C.NOMECLIENTE, C.NUMERO, C.COMPLEMENTO, C.CPF,C.CNPJ, C.ORGAOEMISSOR,'+
          '        C.DATAEMISSAO, C.DATANASCIMENTO, C.DATACADASTRO, C.TELEFONE, C.OBS, C.RG, C.IDCEP, C.CELULAR,C.FANTASIA, '+
          '        C.CONTATO, C.IE, C.IM, C.FLAGTIPOPESSOA,C.CEP, C.LOGRADOURO, C.BAIRRO, C.CIDADE, C.UF,C.EMAIL,C.IDGRUPOCLIENTE, G.NOME GRUPOCLIENTE'+
          '   FROM CLIENTE C'+
          '   LEFT JOIN GRUPOCLIENTE G '+
          '     ON (G.IDGRUPOCLIENTE = C.IDGRUPOCLIENTE)'+
          '  WHERE 1=1 '+Complemento;
      End;
     tpERPGrupoCliente:
      Begin
        CampoChave := 'IDGRUPOCLIENTE';
        CampoDisplay := 'NOME';
        NomeTabela := 'GRUPOCLIENTE';
        DescricaoCampoDisplay := 'Descrição';
        DescricaoTabela := 'Grupo de clientes';
        Versao20 := True;
        Select :=
          'SELECT IDGRUPOCLIENTE, NOME, CODIGO'+
          '  FROM GRUPOCLIENTE '+
          ' WHERE 1=1 '+Complemento;
      End;
      tpERPCargo:
      Begin
        CampoChave := 'IDCARGO';
        CampoDisplay := 'NOME';
        NomeTabela := 'CARGO';
        DescricaoCampoDisplay := 'Descrição';
        DescricaoTabela := 'Cargos';
        Versao20 := True;
        Select :=
          'SELECT IDCARGO, NOME, CODIGO'+
          '  FROM CARGO '+
          ' WHERE 1=1 '+Complemento;
      End;
      tpERPUsuario:
       Begin
         CampoChave := 'IDUSUARIO';
         CampoDisplay := 'NOMECOMPLETO';
         NomeTabela := 'USUARIO';
         DescricaoCampoDisplay := 'Nome';
         DescricaoTabela := 'Usuário';
         CampoCodigo := 'LOGIN';
         Versao20 := True;
         Select :=
           'SELECT IDUSUARIO, LOGIN, SENHA, NOMECOMPLETO, COALESCE(FLAGADMINISTRADOR,''Y'')FLAGADMINISTRADOR '+
           '  FROM USUARIO '+
           ' WHERE 1=1 '+Complemento;
       End;
      tpERPFuncionario:
       Begin
         CampoChave := 'IDFUNCIONARIO';
         CampoDisplay := 'NOMEFUNCIONARIO';
         NomeTabela := 'FUNCIONARIO';
         DescricaoCampoDisplay := 'Nome completo';
         DescricaoTabela := 'Funcionários';
         Versao20 := False;
         DesconsiderarCampos := 'CARGO;USUARIO;NOMEDEPARTAMENTO';
         Select :=
            'SELECT F.IDFUNCIONARIO, F.CODIGO, F.NOMEFUNCIONARIO, F.IDCARGO,'+
            '       F.TELEFONE, F.CELULAR, F.OBS, F.FOTO, F.IDUSUARIO, F.SALARIO,'+
            '       C.NOME CARGO , U.LOGIN USUARIO, F.IDDEPARTAMENTO, D.NOMEDEPARTAMENTO, F.EMAIL'+
            '  FROM FUNCIONARIO F'+
            '  LEFT JOIN CARGO C'+
            '    ON (C.IDCARGO = F.IDCARGO)'+
            '  LEFT JOIN USUARIO U'+
            '    ON (U.IDUSUARIO = F.IDUSUARIO)'+
            '  LEFT JOIN DEPARTAMENTO D  '+
            '    ON (D.IDDEPARTAMENTO = F.IDDEPARTAMENTO)'+
            ' WHERE 1=1 '+Complemento;
       End;
       tpERPDepartamento:
        Begin
        CampoChave := 'IDDEPARTAMENTO';
        CampoDisplay := 'NOMEDEPARTAMENTO';
        NomeTabela := 'DEPARTAMENTO';
        DescricaoCampoDisplay := 'Descrição';
        DescricaoTabela := 'Departamento';
        Versao20 := True;
        Select :=
          'SELECT IDDEPARTAMENTO, NOMEDEPARTAMENTO, CODIGO'+
          '  FROM DEPARTAMENTO '+
          ' WHERE 1=1 '+Complemento;
        End;
       tpERPFornecedor:
       Begin
         CampoChave := 'IDFORNECEDOR';
         CampoDisplay := 'RAZAOSOCIAL';
         NomeTabela := 'FORNECEDOR';
         DescricaoCampoDisplay := 'Razão social';
         DescricaoTabela := 'Fornecedor';
         Select :=
            'SELECT IDFORNECEDOR, CODIGO, RAZAOSOCIAL,NOMEFANTASIA, CNPJ, CONTATO, '+
            '       TELEFONE, EMAIL, ENDERECO, NUMERO, CEP, BAIRRO, CIDADE, UF,'+
            '       DATACADASTRO,COMPLEMENTO,OBS '+
            '  FROM FORNECEDOR '+
            ' WHERE 1=1 '+Complemento;
       End;
       tpERPLocalizacao:
       Begin
        CampoChave := 'IDLOCALIZACAO';
        CampoDisplay := 'NOMELOCALIZACAO';
        NomeTabela := 'LOCALIZACAO';
        DescricaoCampoDisplay := 'Descrição';
        DescricaoTabela := 'Localização';
        Versao20 := True;
        Select :=
          'SELECT IDLOCALIZACAO, NOMELOCALIZACAO, CODIGO'+
          '  FROM LOCALIZACAO '+
          ' WHERE 1=1 '+Complemento;
        End;
       tpERPGrupo:
       Begin
        CampoChave := 'IDGRUPO';
        CampoDisplay := 'NOMEGRUPO';
        NomeTabela := 'GRUPO';
        DescricaoCampoDisplay := 'Descrição';
        DescricaoTabela := 'Grupo';
        Versao20 := True;
        Select :=
          'SELECT IDGRUPO, NOMEGRUPO, CODIGO'+
          '  FROM GRUPO '+
          ' WHERE 1=1 '+Complemento;
        End;
       tpERPLinha:
       Begin
        CampoChave := 'IDLINHA';
        CampoDisplay := 'NOMELINHA';
        NomeTabela := 'LINHA';
        DescricaoCampoDisplay := 'Descrição';
        DescricaoTabela := 'Linha';
        Versao20 := True;
        Select :=
          'SELECT IDLINHA, NOMELINHA, CODIGO'+
          '  FROM LINHA '+
          ' WHERE 1=1 '+Complemento;
        End;
      tpERPProduto:
       Begin
        CampoChave := 'IDPRODUTO';
        CampoDisplay := 'NOMEPRODUTO';
        NomeTabela := 'PRODUTO';
        DescricaoCampoDisplay := 'Descrição';
        DescricaoTabela := 'Produto';
        DesconsiderarCampos := 'NOMELINHA;NOMEGRUPO;RAZAOSOCIAL;NOMELOCALIZACAO;NOMEFABRICANTE;CODIGOMUNICIPALSERVICO';
        Versao20 := False;
        Select :=
          'SELECT P.IDPRODUTO, P.CODIGO, P.NOMEPRODUTO, P.DESCRICAODETALHADA, P.TIPOPRODUTO, P.IDGRUPO, P.IDLINHA, P.IDLOCALIZACAO,'+
          '       P.IMAGEMPRINCIPAL, P.OBS, P.IDNCM, P.IDCODIGOMUNICIPALSERVICO, P.CODIGOSERVFEDERAL, P.CUSTOATUAL, P.CUSTOMEDIO,'+
          '       P.CUSTOCONTABIL, P.ESTOQUEMINIMO, P.DATACADASTRO, P.FLAGSERIAL, P.FLAGLOTE, P.FLAGINATIVO, P.CODIGOBARRAS,'+
          '       P.IDFABRICANTE, P.IDFORNECEDOR, P.CST, P.CSOSN, P.IDUNIDADE, P.ORIGEM, P.PRECO, P.MARKUP,P.ESTOQUEATUAL,'+
          '       P.FATORMULTIPLICADOR,L.NOMELINHA,'+
          '       G.NOMEGRUPO, F.RAZAOSOCIAL, LO.NOMELOCALIZACAO, FA.NOMEFABRICANTE, C.CODIGO CODIGOMUNICIPALSERVICO'+
          '  FROM PRODUTO P'+
          '  LEFT JOIN LINHA L'+
          '    ON (L.IDLINHA = P.IDLINHA)'+
          '  LEFT JOIN GRUPO G'+
          '    ON (G.IDGRUPO = P.IDGRUPO)'+
          '  LEFT JOIN FORNECEDOR F'+
          '    ON (F.IDFORNECEDOR = P.IDFORNECEDOR)'+
          '  LEFT JOIN LOCALIZACAO LO'+
          '    ON (LO.IDLOCALIZACAO = P.IDLOCALIZACAO )'+
          '  LEFT JOIN FABRICANTE FA'+
          '    ON (FA.IDFABRICANTE = P.IDFABRICANTE)'+
          '  LEFT JOIN UNIDADE U'+
          '    ON (U.IDUNIDADE = P.IDUNIDADE)'+
          '  LEFT JOIN CODIGOMUNICIPALSERVICO C '+
          '    ON (c.IDCODIGOMUNICIPALSERVICO  = P.IDCODIGOMUNICIPALSERVICO)  '+
          ' WHERE 1=1 '+Complemento;
        End;
      tpERPFabricante:
       Begin
        CampoChave := 'IDFABRICANTE';
        CampoDisplay := 'NOMEFABRICANTE';
        NomeTabela := 'FABRICANTE';
        DescricaoCampoDisplay := 'Descrição';
        DescricaoTabela := 'Fabricante';
        Versao20 := True;
        Select :=
          'SELECT F.IDFABRICANTE, F.CODIGO, F.NOMEFABRICANTE '+
          '  FROM FABRICANTE F '+
          ' WHERE 1=1 '+Complemento;
        End;
       tpERPCodigoMunicipalServico:
       Begin
        CampoChave := 'IDCODIGOMUNICIPALSERVICO';
        CampoDisplay := 'DESCRICAOCODIGOSERVICO';
        NomeTabela := 'CODIGOMUNICIPALSERVICO';
        DescricaoCampoDisplay := 'Descrição';
        DescricaoTabela := 'Código municipal de serviço';
        Result.TipoForm := tfTree;
        Versao20 := True;
        Select :=
          'SELECT IDCODIGOMUNICIPALSERVICO, CODIGO, '+
          '       CAST(DESCRICAOCODIGOSERVICO AS VARCHAR(3000))DESCRICAOCODIGOSERVICO , CODPAI,'+
          '       CLASSIFICACAO, FLAGTIPO '+
          '  FROM CODIGOMUNICIPALSERVICO '+
          ' WHERE 1=1 '+Complemento;
        End;
       tpERPProcessosservico:
        Begin
          CampoChave := 'IDPROCESSODESERVICO';
          CampoDisplay := 'DESCRICAOPROCESSO';
          NomeTabela := 'PROCESSODESERVICO';
          DescricaoCampoDisplay := 'Descrição';
          DescricaoTabela := 'Processos de serviço';
          Versao20 := True;
          Select :=
            'SELECT IDPROCESSODESERVICO, CODIGO,DESCRICAOPROCESSO '+
            '  FROM PROCESSODESERVICO '+
            ' WHERE 1=1 '+Complemento;

        End;
        tpERPProdutoProcessosservico :
        Begin
          CampoChave := 'IDPRODUTOPROCESSODESERVICO';
          CampoDisplay := 'DESCRICAOPROCESSO';
          NomeTabela := 'PRODUTOPROCESSODESERVICO';
          DescricaoCampoDisplay := 'Processos do serviço';
          DescricaoTabela := 'Processos do serviço';
          DesconsiderarCampos :='DESCRICAOPROCESSO;CODIGO;FLAGEDICAO';
          Select :=
            'SELECT PS.IDPRODUTOPROCESSODESERVICO, PS.IDPRODUTO, '+
            '       PS.IDPROCESSODESERVICO,  P.DESCRICAOPROCESSO, P.CODIGO ,''N'' FLAGEDICAO'+
            '  FROM PRODUTOPROCESSODESERVICO PS '+
            ' INNER JOIN PROCESSODESERVICO P '+
            '    ON (P.IDPROCESSODESERVICO = PS.IDPROCESSODESERVICO) '+
            ' WHERE 1=1 '+Complemento;

        End;
        tpERPPeridicidade:
        begin
          CampoChave := 'IDPERIODICIDADE';
          CampoDisplay := 'DESCRICAOPERIODICIDADE';
          NomeTabela := 'PERIODICIDADE';
          DescricaoCampoDisplay := 'Nº de dias';
          DescricaoTabela := 'Periodicidade';
          CampoCodigo := 'NUMDIAS';
          Versao20 := True;
          Select :=
            'SELECT IDPERIODICIDADE, DESCRICAOPERIODICIDADE,NUMDIAS '+
            '  FROM PERIODICIDADE '+
            ' WHERE 1=1 '+Complemento;
        end;
        tpERPBanco:
        Begin
          CampoChave := 'IDBANCO';
          CampoDisplay := 'NOMEBANCO';
          NomeTabela := 'BANCO';
          DescricaoCampoDisplay := 'Nome';
          DescricaoTabela := 'Banco';
          Versao20 := True;
          Select :=
            'SELECT IDBANCO, CODIGO,NOMEBANCO '+
            '  FROM BANCO '+
            ' WHERE 1=1 '+Complemento;

        End;
        tpERPContaBancaria:
         Begin
          CampoChave := 'IDCONTABANCARIA';
          CampoDisplay := 'CONTA';
          NomeTabela := 'CONTABANCARIA';
          DescricaoCampoDisplay := 'Conta';
          DescricaoTabela := 'Conta bancária';
          Versao20 := False;
          CampoCodigo := 'AGENCIA' ;
          DesconsiderarCampos :='Banco';
          Select :=
            'SELECT IDCONTABANCARIA, C.IDBANCO,AGENCIA,CONTA,'+
            '       DVCONTA,DVAGENCIA,CARTEIRA,TIPOCONTA, B.CODIGO '+
            '  FROM CONTABANCARIA C'+
            ' INNER JOIN BANCO B '+
            '    ON (B.IDBANCO = C.IDBANCO) '+
            ' WHERE 1=1 '+Complemento;

        End;
      tpERPCondicaoPagamento:
         Begin
          CampoChave := 'IDCONDICAOPAGAMENTO';
          CampoDisplay := 'NOMECONDICAOPAGAMENTO';
          NomeTabela := 'CONDICAOPAGAMENTO';
          DescricaoCampoDisplay := 'Descerição';
          DescricaoTabela := 'Condição de pagamento';
          Versao20 := True;
          Select :=
            'SELECT CP.IDCONDICAOPAGAMENTO, CP.CODIGO, CP.NOMECONDICAOPAGAMENTO,   '+
            '       CP.FLAGTIPOPAGAMENTO, CP.MAXPARCELAS, CP.IDCONTABANCARIA,CP.VALORMINIMO '+
            '  FROM CONDICAOPAGAMENTO CP '+
            ' WHERE 1=1 '+Complemento;

        End;
      tpERPProposta:
        Begin
          CampoChave := 'IDPROPOSTA';
          CampoDisplay := '';
          NomeTabela := 'PROPOSTA';
          DescricaoCampoDisplay := '';
          DescricaoTabela := 'Propósta';
          Versao20 := False;
          CampoCodigo := '';
          DesconsiderarCampos := 'CODIGOCLIENTE;NOMECLIENTE;DESCPERIDOVIGENCIACONTRATO;'+
                                 'DESCPERIDOVISITACONTRATO;LOGIN;CODIGOEMPRESA;STATUSPROPOSTA_LEGENDA';
          Select :=
            'SELECT P.IDPROPOSTA, P.IDEMPRESA, P.NUMEROPROPOSTA, P.DATACRIACAO, P.DATA,'+
            '       P.IDCLIENTE, P.FINALIDADEPROPOSTA,P.VALORTOTALPROPOSTA,'+
            '       P.VALORDESCONTOTOTAL, P.VALORACRESCIMOTOTAL,P.ALIQDESCONTO,P.ALIQACRESCIMO,P.SUBTOTALPROPOSTA, '+
            '       P.IDPERIDOVIGENCIACONTRATO, P.IDPERIODICIDADEVISITACONTRATO,'+
            '       P.STATUSPROPOSTA, P.IDUSUARIO, P.OBS, P.DATAEXPIRA,P.HORACRIACAO,'+
            '       C.CODIGO CODIGOCLIENTE, C.NOMECLIENTE,'+
            '       PVC.DESCRICAOPERIODICIDADE DESCPERIDOVIGENCIACONTRATO,'+
            '       PC.DESCRICAOPERIODICIDADE  DESCPERIDOVISITACONTRATO,'+
            '       U.LOGIN,E.CODIGO CODIGOEMPRESA,'+
            '       CASE WHEN P.STATUSPROPOSTA  = ''A'' THEN ''Aberta'' '+
            '            WHEN P.STATUSPROPOSTA  = ''F'' THEN ''Fechada'' '+
            '            WHEN P.STATUSPROPOSTA  = ''C'' THEN ''Com contrato'' end STATUSPROPOSTA_LEGENDA '+
            '  FROM PROPOSTA P'+
            ' INNER JOIN EMPRESA E'+
            '    ON (E.IDEMPRESA = P.IDEMPRESA)'+
            ' INNER JOIN CLIENTE C'+
            '    ON (C.IDCLIENTE = P.IDCLIENTE)'+
            '  LEFT JOIN PERIODICIDADE PVC'+
            '    ON (PVC.IDPERIODICIDADE = P.IDPERIDOVIGENCIACONTRATO)'+
            '  LEFT JOIN PERIODICIDADE PC'+
            '    ON (PVC.IDPERIODICIDADE = P.IDPERIODICIDADEVISITACONTRATO)'+
            ' LEFT JOIN USUARIO U'+
            '   ON (U.IDUSUARIO = P.IDUSUARIO)'+
            ' WHERE 1=1 '+Complemento;
        End;
      tpERPItemProposta:
        Begin
          CampoChave := 'IDITEMPROPOSTA';
          CampoDisplay := '';
          NomeTabela := 'ITEMPROPOSTA';
          DescricaoCampoDisplay := '';
          DescricaoTabela := 'Propósta(Itens)';
          Versao20 := False;
          CampoCodigo := '';
          DesconsiderarCampos := 'UNIDADE;FLAGEDICAO;DESCRICAO;CODIGO';
          Select :=
            'SELECT IP.IDITEMPROPOSTA, IP.IDPROPOSTA, IP.IDPRODUTO,'+
            '       IP.QUANTIDADE, IP.VALORUNITARIO, IP.SUBTOTAL, IP.VALORDESCONTO,'+
            '       IP.VALORACRESCIMO,IP.ALIQDESCONTO,IP.OBS,'+
            '       IP.ALIQACRESCIMO, IP.VALORTOTAL, U.CODIGO UNIDADE,''N'' FLAGEDICAO, '+
            '       P.NOMEPRODUTO DESCRICAO, P.CODIGO'+
            '  FROM ITEMPROPOSTA IP'+
            '  INNER JOIN PRODUTO P'+
            '     ON (P.IDPRODUTO = IP.IDPRODUTO)'+
            '   LEFT JOIN UNIDADE U'+
            '     ON (U.IDUNIDADE = P.IDUNIDADE)'+
            ' WHERE 1=1 '+Complemento;
        End;
       tpERPCondicaoPagamentoProposta:
        Begin
          CampoChave := 'IDCONDICAOPAGAMENTOPROPOSTA';
          CampoDisplay := '';
          NomeTabela := 'CONDICAOPAGAMENTOPROPOSTA';
          DescricaoCampoDisplay := '';
          DescricaoTabela := 'Propósta(Pagamentos)';
          Versao20 := False;
          CampoCodigo := '';
          DesconsiderarCampos := 'CODIGO;FLAGEDICAO;NOMECONDICAOPAGAMENTO';
          Select :=
            '  SELECT CPP.IDCONDICAOPAGAMENTOPROPOSTA, CPP.IDCONDICAOPAGAMENTO,'+
            '         CPP.IDPROPOSTA, CPP.VALOR, CPP.NUMTOTALPARCELAS,'+
            '         C.CODIGO, C.NOMECONDICAOPAGAMENTO,''N'' FLAGEDICAO '+
            '    FROM CONDICAOPAGAMENTOPROPOSTA CPP'+
            '   INNER JOIN CONDICAOPAGAMENTO C'+
            '      ON (C.IDCONDICAOPAGAMENTO = CPP.IDCONDICAOPAGAMENTO)'+
            ' WHERE 1=1 '+Complemento;
        End;
       tpERPParcelaCondicaoPagamentoProposta:
       begin
          CampoChave := 'IDPARCONDPAGAMENTOPROPOSTA';
          CampoDisplay := '';
          NomeTabela := 'PARCCONDPAGAMENTOPROPOSTA';
          DescricaoCampoDisplay := '';
          DescricaoTabela := 'Parcela das condições de pagamento da proposta';
          Versao20 := False;
          CampoCodigo := '';
           DesconsiderarCampos := 'FLAGEDICAO';
          Select :=
            'SELECT IDPARCONDPAGAMENTOPROPOSTA, IDCONDICAOPAGAMENTOPROPOSTA, NUMPARCELA,'+
            '       VALORPARCELA,''N'' FLAGEDICAO '+
            '  FROM PARCCONDPAGAMENTOPROPOSTA '+
            ' WHERE 1=1 '+Complemento;
        End;
       tpERPTipoContrato:
       begin
          CampoChave := 'IDTIPOCONTRATO';
          CampoDisplay := 'NOMETIPOCONTRATO';
          NomeTabela := 'TIPOCONTRATO';
          DescricaoCampoDisplay := 'Descrição';
          DescricaoTabela := 'Tipo de contrato';
          Versao20 := False;
          UsaMaxParaCodigo := True;
          Select :=
            'SELECT IDTIPOCONTRATO, CODIGO, NOMETIPOCONTRATO, '+
            '       IDLAYOUT, ALIQMULTAQUEBRA, FLAGREGRAQUEBRA,FLAGRENOVARAUTOMATICO '+
            '  FROM TIPOCONTRATO'+
            ' WHERE 1=1 '+Complemento;
       end;
       tpERPContrato:
       begin
          CampoChave := 'IDCONTRATO';
          CampoDisplay := '';
          NomeTabela := 'CONTRATO';
          DescricaoCampoDisplay := '';
          DescricaoTabela := 'Contrato';
          CampoCodigo := '';
          Versao20 := False;
          UsaMaxParaCodigo := True;
          DesconsiderarCampos := 'NOMECLIENTE;CODIGO_EMPRESA;LOGIN;NOMECONDICAOPAGAMENTO;FLAGSTATUS_LEGENDA';
          Select :=
            ' SELECT C.IDCONTRATO, C.NUMEROCONTRATO, C.IDEMPRESA, C.DATAGERACAO,'+
            '        C.DATA, C.DATATERMINO,C.IDPROPOSTA,'+
            '        C.FLAGINDETERMINADO, C.IDCLIENTE, C.IDPERIODICIDADEVISITA, C.IDCONDICAOPAGAMENTO,'+
            '        C.IDTIPOCONTRATO, C.DATACANCELADO, C.FLAGSTATUS,C.OBS,'+
            '        C.VALORTOTAL, C.IDUSUARIO,C.IDPERIODICIDADEVIGENCIA,CL.NOMECLIENTE,'+
            '        E.CODIGO CODIGO_EMPRESA,  U.LOGIN,CP.NOMECONDICAOPAGAMENTO,'+
            '        CASE WHEN C.FLAGSTATUS = ''A'' THEN ''Ativo''  '+
            '             WHEN C.FLAGSTATUS = ''I'' THEN ''Inativo''  '+
            '             WHEN C.FLAGSTATUS = ''C'' THEN ''Cancelado''  END FLAGSTATUS_LEGENDA'+
            '   FROM CONTRATO C'+
            '  INNER JOIN CLIENTE CL'+
            '     ON (CL.IDCLIENTE = C.IDCLIENTE)'+
            '  INNER JOIN EMPRESA E'+
            '     ON (E.IDEMPRESA = C.IDEMPRESA)'+
            '  INNER JOIN CONDICAOPAGAMENTO CP'+
            '     ON (CP.IDCONDICAOPAGAMENTO=C.IDCONDICAOPAGAMENTO)'+
            '   LEFT JOIN USUARIO U'+
            '     ON (U.IDUSUARIO = C.IDUSUARIO)'+
            ' WHERE 1=1 '+Complemento;
       end;
       tpERPServicoContrato:
       begin
          CampoChave := 'IDCONTRATOPRODUTOS';
          CampoDisplay := '';
          NomeTabela := 'CONTRATOPRODUTOS';
          DescricaoCampoDisplay := '';
          DescricaoTabela := 'Serviços do Contrato';
          CampoCodigo := '';
          Versao20 := False;
          UsaMaxParaCodigo := True;
          DesconsiderarCampos := 'CODIGO;DESCRICAO;FLAGEDICAO;QUANTIDADE';
          Select :=
            'SELECT CP.IDCONTRATOPRODUTOS, CP.IDCONTRATO, CP.IDPRODUTO, '+
            '       CP.VALORUNITARIO, CP.VALORDESCONTO, CP.VALORACRESCIMO, '+
            '       CP.VALORTOTAL, CP.OBS, CP.ALIQDESCONTO, CP.ALIQACRESCIMO, '+
            '       CP.SUBTOTAL,P.CODIGO, P.NOMEPRODUTO DESCRICAO,''N'' FLAGEDICAO, CAST(1 AS VALOR) QUANTIDADE '+
            '  FROM CONTRATOPRODUTOS CP '+
            ' INNER JOIN PRODUTO P '+
            '    ON (P.IDPRODUTO = CP.IDPRODUTO) '+
            ' WHERE 1=1 '+Complemento;
       end;
      tpERPClienteEquipamento:
       Begin
          CampoChave := 'IDCLIENTEEQUIPAMENTOS';
          CampoDisplay := 'DESCRICAOEQUIPAMENTO';
          NomeTabela := 'CLIENTEEQUIPAMENTOS';
          DescricaoCampoDisplay := 'Descrição';
          DescricaoTabela := 'Equipamentos do cliente';
          CampoCodigo := 'IDENTIFICADOR';
          Versao20 := True;
          UsaMaxParaCodigo := True;
          DesconsiderarCampos := 'FLAGEDICAO';
          Select :=
           ' SELECT CE.IDCLIENTEEQUIPAMENTOS, CE.IDCLIENTE, '+
           '        CE.DESCRICAOEQUIPAMENTO, CE.DESCRICAOCOMPLETA, '+
           '        CE.IDENTIFICADOR, CE.IDPRODUTO,''N'' FLAGEDICAO'+
           '   FROM CLIENTEEQUIPAMENTOS CE    '+
            ' WHERE 1=1 '+Complemento;
       End;
       tpERPClienteEquipamentoContrato:
       Begin
          CampoChave := 'IDCONTRATOEQUIPAMENTOCLIENTE';
          CampoDisplay := '';
          NomeTabela := 'CONTRATOEQUIPAMENTOCLIENTE';
          DescricaoCampoDisplay := '';
          DescricaoTabela := 'Equipamentos do cliente no contrato';
          CampoCodigo := '';
          Versao20 := False;
          UsaMaxParaCodigo := True;
          DesconsiderarCampos := 'DESCRICAOEQUIPAMENTO;IDENTIFICADOR;DESCRICAOPERIODICIDADE;FLAGEDICAO;IDPRODUTO';
          Select :=
            '  SELECT CEC.IDCONTRATOEQUIPAMENTOCLIENTE,'+
            '         CEC.IDCLIENTEEQUIPAMENTOS, CEC.IDPERIODICIADEVISITA,'+
            '         CEC.IDCONTRATO, CE.DESCRICAOEQUIPAMENTO, CE.IDENTIFICADOR,'+
            '         P.DESCRICAOPERIODICIDADE,''N'' FLAGEDICAO,CE.IDPRODUTO'+
            '    FROM CONTRATOEQUIPAMENTOCLIENTE CEC'+
            '   INNER JOIN CLIENTEEQUIPAMENTOS CE'+
            '      ON (CE.IDCLIENTEEQUIPAMENTOS = CEC.IDCLIENTEEQUIPAMENTOS)'+
            '    LEFT JOIN PERIODICIDADE P'+
            '      ON (P.IDPERIODICIDADE = CEC.IDPERIODICIADEVISITA)'+
            '   WHERE 1=1 '+Complemento;
       End;
       tpERPTipoOS:
       begin
          CampoChave := 'IDTIPOOS';
          CampoDisplay := 'NOMETIPOOS';
          NomeTabela := 'TIPOOS';
          DescricaoCampoDisplay := 'Descrição';
          DescricaoTabela := 'Tipo de O.S.';
          Versao20 := True;
          UsaMaxParaCodigo := True;
          Select :=
            'SELECT IDTIPOOS, CODIGO, NOMETIPOOS,IDLAYOUT '+
            '  FROM TIPOOS'+
            ' WHERE 1=1 '+Complemento;
       end;
       tpERPStatusOS:
       begin
          CampoChave := 'IDSTATUSOS';
          CampoDisplay := 'NOMESTATUSOS';
          NomeTabela := 'STATUSOS';
          DescricaoCampoDisplay := 'Descrição';
          DescricaoTabela := 'Status de O.S.';
          Versao20 := True;
          UsaMaxParaCodigo := True;
          Select :=
            'SELECT IDSTATUSOS, CODIGO, NOMESTATUSOS,COR '+
            '  FROM STATUSOS'+
            ' WHERE 1=1 '+Complemento;
       end;
       tpERPOS:
       begin
          CampoChave := 'IDOS';
          CampoDisplay := '';
          NomeTabela := 'OS';
          DescricaoCampoDisplay := '';
          DescricaoTabela := 'O.S.';
          Versao20 := False;
          CampoCodigo := '';
          DesconsiderarCampos := 'CODIGOCLIENTE;NOMECLIENTE;NOMETIPOOS;NOMESTATUSOS;NUMEROCONTRATO;COR';
          Select :=
            ' SELECT O.IDOS, O.NUMEROOS, O.DATAGERACAO,'+
            '        O.IDUSUARIO, O.IDEMPRESA, O.DATA, O.HORA, O.IDCLIENTE,'+
            '        O.IDTIPOOS,O.IDSTATUSOS, O.VALORTOTAL, O.OBS,O.FLAGBAIXADA,'+
            '        O.DATAINICIO,O.HORAINICIO, O.DATATERMINO, O.HORATERMINO , '+
            '        O.IDCONTRATO , C.CODIGO CODIGOCLIENTE,'+
            '        C.NOMECLIENTE, T.NOMETIPOOS,S.NOMESTATUSOS,S.COR,'+
            '        CO.NUMEROCONTRATO'+
            '   FROM OS O'+
            '  INNER JOIN CLIENTE C'+
            '     ON (C.IDCLIENTE = O.IDCLIENTE)'+
            '  INNER JOIN TIPOOS T'+
            '     ON (T.IDTIPOOS = O.IDTIPOOS)'+
            '   LEFT JOIN STATUSOS S'+
            '     ON (S.IDSTATUSOS = O.IDSTATUSOS)'+
            '   LEFT JOIN CONTRATO CO'+
            '     ON (CO.IDCONTRATO = O.IDCONTRATO)'+
            '  WHERE 1=1 '+Complemento;
       end;
       tpERPEquipamentoOS:
       begin
          CampoChave := 'IDEQUIPAMENTOSOS';
          CampoDisplay := '';
          NomeTabela := 'EQUIPAMENTOSOS';
          DescricaoCampoDisplay := '';
          DescricaoTabela := 'Equipamentos da O.S.';
          Versao20 := False;
          CampoCodigo := '';
          DesconsiderarCampos := 'DESCRICAOEQUIPAMENTO;IDENTIFICADOR;FLAGEDICAO';
          Select :=
            '  SELECT E.IDEQUIPAMENTOSOS, E.IDEQUIPAMENTOCLIENTE,'+
            '         E.IDOS, E.DETALHEDEFEITO,'+
            '         E.VALORTOTALEQUIPAMENTO,E.SOLUCAO,E.IDFUNCIONARIOSOLUCAO,'+
            '         C.DESCRICAOEQUIPAMENTO,C.IDENTIFICADOR,''N'' FLAGEDICAO '+
            '    FROM EQUIPAMENTOSOS E'+
            '   INNER JOIN CLIENTEEQUIPAMENTOS C'+
            '      ON (C.IDCLIENTEEQUIPAMENTOS = E.IDEQUIPAMENTOCLIENTE)'+
            '   WHERE 1=1 '+Complemento;

       end;
       tpERPServicoEquipamentoOS :
       begin
          CampoChave := 'IDSERVICOOS';
          CampoDisplay := '';
          NomeTabela := 'SERVICOOS';
          DescricaoCampoDisplay := '';
          DescricaoTabela := 'Serviços do Equipamentos da O.S.';
          Versao20 := False;
          CampoCodigo := '';
          DesconsiderarCampos := 'CODIGOSERVICO;DESCRICAOSERVICO;NOMEFUNCIONARIO;FLAGEDICAO';
          Select :=
            'SELECT S.IDSERVICOOS, S.IDEQUIPAMENTOSOS, S.IDPRODUTO, S.VALORSERVICO,'+
            '       S.VALORTOTALPRODUTOS, S.VALORTOTAL,S.OBS,S.DATAINICIO,S.HORAINICIO, S.DATATERMINO, S.HORATERMINO , '+
            '       S.IDFUNCIONARIO,P.CODIGO CODIGOSERVICO, P.NOMEPRODUTO DESCRICAOSERVICO,'+
            '       F.NOMEFUNCIONARIO,''N'' FLAGEDICAO '+
            '  FROM SERVICOOS S'+
            ' INNER JOIN PRODUTO P'+
            '    ON (P.IDPRODUTO = S.IDPRODUTO)'+
            '  LEFT JOIN FUNCIONARIO F'+
            '    ON (F.IDFUNCIONARIO = S.IDFUNCIONARIO)'+
            '   WHERE 1=1 '+Complemento;

       end;
      tpERPProdutoServicoOS:
        begin
          CampoChave := 'IDPRODUTOSSERVICOOS';
          CampoDisplay := '';
          NomeTabela := 'PRODUTOSSERVICOOS';
          DescricaoCampoDisplay := '';
          DescricaoTabela := 'Produto dos Serviços da O.S.';
          Versao20 := False;
          CampoCodigo := '';
          DesconsiderarCampos := 'CODIGO;DESCRICAO;FLAGEDICAO';
          Select :=
            'SELECT PS.IDPRODUTOSSERVICOOS, PS.IDSERVICOOS,'+
            '       PS.IDPRODUTO, PS.QUANTIDADE, PS.VALORUNITARIO, PS.TOTAL,'+
            '       P.CODIGO, P.NOMEPRODUTO DESCRICAO,''N'' FLAGEDICAO '+
            '  FROM PRODUTOSSERVICOOS PS'+
            ' INNER JOIN PRODUTO P'+
            '    ON (P.IDPRODUTO = PS.IDPRODUTO)'+
            '   WHERE 1=1 '+Complemento;

       end;
      tpERPEntrada:
        begin
          CampoChave := 'IDENTRADA';
          CampoDisplay := '';
          NomeTabela := 'ENTRADA';
          DescricaoCampoDisplay := '';
          DescricaoTabela := 'Entrada de Produtos ';
          Versao20 := False;
          CampoCodigo := '';
          DesconsiderarCampos := 'NOMEOPERACAOESTOQUE;PESSOA;TIPOPESSOA;LOGIN;IDCFOP;CODIGOEMPRESA;ESTACANCELADA';
          Select :=
            'SELECT IDENTRADA,DATA,IDOPERACAOESTOQUE,IDFORNECEDOR,NUMERONOTA,SERIE,MODELO,'+
            '       VALORTOTALPRODUTOS,BASEICMS,VALORICMS,BASEIPI,VALORIPI,BASEST,'+
            '       VALORST,VALORSEGURO,VALORFRETE,VALOROUTRAS,VALORTOTALNOTA,'+
            '       FLAGCANCELADA,OBS,VALORDESCONTO,IDEMPRESA,'+
            '       FRETEPORCONTA,IDUSUARIO,DATACRIACAO,IDCLIENTE,'+
            '       NOMEOPERACAOESTOQUE,PESSOA,TIPOPESSOA,LOGIN,'+
            '       IDCFOP,CODIGOEMPRESA,ESTACANCELADA'+
            ' FROM ('+
            '        SELECT E.IDENTRADA, E.DATA, E.IDOPERACAOESTOQUE, E.IDFORNECEDOR,'+
            '               E.NUMERONOTA, E.SERIE, E.MODELO, E.VALORTOTALPRODUTOS,'+
            '               E.BASEICMS, E.VALORICMS, E.BASEIPI, E.VALORIPI, E.BASEST,'+
            '               E.VALORST, E.VALORSEGURO, E.VALORFRETE, E.VALOROUTRAS,'+
            '               E.VALORTOTALNOTA, E.FLAGCANCELADA, E.OBS, E.VALORDESCONTO,'+
            '               E.IDEMPRESA, E.FRETEPORCONTA, E.IDUSUARIO,'+
            '               E.DATACRIACAO, E.IDCLIENTE,'+
            '               O.NOMEOPERACAOESTOQUE,'+
            '               COALESCE(F.RAZAOSOCIAL,C.NOMECLIENTE) PESSOA,'+
            '               CASE WHEN E.IDFORNECEDOR IS NULL THEN ''C'' ELSE ''F'' END TIPOPESSOA,'+
            '               U.LOGIN,CAST(NULL AS CHAVE) IDCFOP,EP.CODIGO CODIGOEMPRESA,'+
            '               CASE WHEN COALESCE(E.FLAGCANCELADA,''N'') = ''Y'' THEN ''SIM'' ELSE ''NÃO'' END ESTACANCELADA '+
            '          FROM ENTRADA E'+
            '         INNER JOIN EMPRESA EP'+
            '            ON (E.IDEMPRESA = EP.IDEMPRESA)'+
            '         INNER JOIN OPERACAOESTOQUE O'+
            '            ON (O.IDOPERACAOESTOQUE = E.IDOPERACAOESTOQUE)'+
            '          LEFT JOIN FORNECEDOR F'+
            '            ON (F.IDFORNECEDOR = E.IDFORNECEDOR)'+
            '          LEFT JOIN CLIENTE C'+
            '            ON (C.IDCLIENTE = E.IDCLIENTE)'+
            '          LEFT JOIN USUARIO U'+
            '            ON (U.IDUSUARIO = E.IDUSUARIO))X'+
            ' WHERE 1=1 '+Complemento;

       end;
      tpERPEntradaProduto:
        begin
          CampoChave := 'IDENTRADAPRODUTO';
          CampoDisplay := '';
          NomeTabela := 'ENTRADAPRODUTO';
          DescricaoCampoDisplay := '';
          DescricaoTabela := 'Entrada de Produtos(Itens) ';
          Versao20 := False;
          CampoCodigo := '';
          DesconsiderarCampos := 'CODIGO_PRODUTO;NOME_PRODUTO;CFOP;UNIDADE;UNIDADE_COMPRA;CODIGOPRODUTOFORNECEDOR;FLAGEDICAO';
          Select :=
            'SELECT EP.IDENTRADAPRODUTO, EP.IDENTRADA, EP.IDCFOP, EP.IDPRODUTO,'+
            '       EP.QUANTIDADE, EP.VALORUNITARIO, EP.VALORACRESCIMO,'+
            '       EP.VALORDESCONTO, EP.BASEICMS, EP.ALIQICMS, EP.VALORICMS,'+
            '       EP.ALIQIPI, EP.VALORIPI, EP.VALORTOTAL,'+
            '       EP.VALORTOTALBRUTO, EP.STITUACAOTRIBUTARIA, EP.VALORFRETERATEADO,'+
            '       EP.VALORSEGURORATEADO, EP.VALOROUTROSRATEADO,'+
            '       EP.IDUNIDADE, EP.NUMITEM, EP.VALORST, EP.BASEST, EP.MVA,'+
            '       EP.REDUCAOBASE, EP.IDUNIDADECOMPRA,EP.CST,'+
            '       EP.FATORMULTIPLICADOR, EP.QUANTIDADERECEBIDA, P.CODIGO CODIGO_PRODUTO,'+
            '       P.NOMEPRODUTO NOME_PRODUTO,C.CFOP,U.CODIGO UNIDADE,UC.CODIGO UNIDADE_COMPRA,'+
            '       PF.CODIGOPRODUTO CODIGOPRODUTOFORNECEDOR,''N'' FLAGEDICAO'+
            '  FROM ENTRADA E '+
            ' INNER JOIN ENTRADAPRODUTO EP '+
            '    ON (EP.IDENTRADA = E.IDENTRADA)'+
            ' INNER JOIN PRODUTO P'+
            '    ON (P.IDPRODUTO = EP.IDPRODUTO)'+
            ' INNER JOIN CFOP C'+
            '    ON (C.IDCFOP = EP.IDCFOP)'+
            '  LEFT JOIN UNIDADE U'+
            '    ON (U.IDUNIDADE = EP.IDUNIDADE)'+
            '  LEFT JOIN UNIDADE UC'+
            '    ON (UC.IDUNIDADE = EP.IDUNIDADECOMPRA)'+
            '  LEFT JOIN PRODUTOFORNECEDOR PF '+
            '    ON (PF.IDPRODUTO = P.IDPRODUTO AND PF.IDFORNECEDOR = E.IDFORNECEDOR) '+
            ' WHERE 1=1 '+Complemento;

       end;
     tpERPModeloNota:
        begin
          CampoChave := 'MODELO';
          CampoDisplay := 'DESCRICAO';
          NomeTabela := 'VW_MODELONOTA';
          DescricaoCampoDisplay := 'Descrição';
          DescricaoTabela := 'Modelo de notas ';
          Versao20 := True;
          CampoCodigo := 'MODELO';
          DesconsiderarCampos := '';
          Select :=
            ' SELECT MODELO, DESCRICAO '+
            '   FROM VW_MODELONOTA'+
            '  WHERE 1=1 '+Complemento;

       end;
      tpERPOperacao,tpERPOperacaoEntrada,tpERPOperacaoSaida:
        begin
          CampoChave := 'IDOPERACAOESTOQUE';
          CampoDisplay := 'NOMEOPERACAOESTOQUE';
          NomeTabela := 'OPERACAOESTOQUE';
          DescricaoCampoDisplay := 'Operação';
          DescricaoTabela := 'Operação de estoque ';
          Versao20 := False;
//          CampoCodigo := '';
          DesconsiderarCampos := '';
          Select :=
            ' SELECT IDOPERACAOESTOQUE, CODIGO, NOMEOPERACAOESTOQUE, '+
            '        FLAGTIPOOPERACAO, FLAGVENDA, FLAGTIPOPESSOA, FLAGGERAFINANCEIRO, '+
            '        FLAGMOVIMENTAESTOQUE '+
            '   FROM OPERACAOESTOQUE'+
            '  WHERE  '+IfThen(TipoPesquisa = tpERPOperacaoEntrada,' FLAGTIPOOPERACAO =''E'' ',
                                 IfThen(TipoPesquisa = tpERPOperacaoSaida,' FLAGTIPOOPERACAO =''S'' ', ' 1=1 '))+   Complemento;

       end;
       tpERPSerialProduto,tpERPSerialProdutoAtivo:
       begin
          CampoChave := 'IDSERIALPRODUTO';
          CampoDisplay := '';
          NomeTabela := 'SERIALPRODUTO';
          DescricaoCampoDisplay := '';
          DescricaoTabela := 'Seriais do produto ';
          Versao20 := False;
          CampoCodigo := '';
          DesconsiderarCampos := 'FLAGEDICAO';
          Select :=
            'SELECT IDSERIALPRODUTO, IDPRODUTO, '+
            '       IDEMPRESA, SERIAL, DATAENTRADA, DATASAIDA, FLAGATIVO,''N'' FLAGEDICAO '+
            '  FROM SERIALPRODUTO '+
            '  WHERE '+IfThen(TipoPesquisa = tpERPSerialProdutoAtivo,' COALESCE(FLAGATIVO,''N'') = ''Y'' ',' 1=1 ')+Complemento;
       end;
       tpERPSerialProdutoEntrada:
       begin
          CampoChave := 'IDENTRADAPRODUTOSERIAL';
          CampoDisplay := '';
          NomeTabela := 'ENTRADAPRODUTOSERIAL';
          DescricaoCampoDisplay := '';
          DescricaoTabela := 'Seriais do produto(Entrada) ';
          Versao20 := False;
          CampoCodigo := '';
          DesconsiderarCampos := 'FLAGEDICAO';
          Select :=
            'SELECT ES.IDENTRADAPRODUTOSERIAL, ES.IDENTRADAPRODUTO, ES.IDSERIALPRODUTO, '+
            '       P.CODIGO, P.NOMEPRODUTO,SP.SERIAL, SP.IDEMPRESA, SP.DATAENTRADA,''N'' FLAGEDICAO'+
            '  FROM ENTRADAPRODUTOSERIAL ES '+
            ' INNER JOIN SERIALPRODUTO SP '+
            '    ON (SP.IDSERIALPRODUTO = ES.IDSERIALPRODUTO) '+
            ' INNER JOIN PRODUTO P '+
            '    ON (P.IDPRODUTO = SP.IDPRODUTO) '+
            '  WHERE 1=1 '+Complemento;
       end;


    end;

  End;


end;

end.
