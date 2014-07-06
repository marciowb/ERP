unit uLibSaida;

interface
  uses
    Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
    Dialogs;
   type
      TTipoPessoa = (tfCliente, tfFornecedor);
      TTipoFrete = (tfEmitente,tfDestinatario);
      TTipoDocumentos = (TdNada,tdNFe,TdNFSe, tdNFE_NFSE,tdComprovante);

      iImpostos = interface
        function GetAliqICMS: Currency;
        procedure SetAliqICMS(const Value: Currency);
        function GetBaseICMS: Currency;
        procedure SetBaseICMS(const Value: Currency);
        function GetValorICMS: Currency;
        procedure SetValorICMS(const Value: Currency);
        function GetAliqIPI: Currency;
        function GetBaseIPI: Currency;
        function GetValorIPI: Currency;
        procedure SetAliqIPI(const Value: Currency);
        procedure SetBaseIPI(const Value: Currency);
        procedure SetValorIPI(const Value: Currency);
        function GetAliqICMSST: Currency;
        function GetBaseICMSST: Currency;
        function GetValorICMSST: Currency;
        procedure SetAliqICMSST(const Value: Currency);
        procedure SetBaseICMSST(const Value: Currency);
        procedure SetValorICMSST(const Value: Currency);
        function GetMVA: Currency;
        procedure SetMVA(const Value: Currency);
        function GetAliqCOFINS: Currency;
        function GetAliqPIS: Currency;
        function GetBasePISCOFINS: Currency;
        function GetValorCOFINS: Currency;
        function GetValorPIS: Currency;
        procedure SetAliqCOFINS(const Value: Currency);
        procedure SetAliqPIS(const Value: Currency);
        procedure SetBasePISCOFINS(const Value: Currency);
        procedure SetValorCOFINS(const Value: Currency);
        procedure SetValorPIS(const Value: Currency);
        function GetAliqISS: Currency;
        function GetBaseISS: Currency;
        function GetValorISS: Currency;
        procedure SetAliqISS(const Value: Currency);
        procedure SetBaseISS(const Value: Currency);
        procedure SetValorISS(const Value: Currency);
        function GetAliqCSLL: Currency;
        function GetBaseCSLL: Currency;
        function GetValorCSLL: Currency;
        procedure SetAliqCSLL(const Value: Currency);
        procedure SetBaseCSLL(const Value: Currency);
        procedure SetValorCSLL(const Value: Currency);

        property AliqICMS : Currency read GetAliqICMS write SetAliqICMS;
        property BaseICMS : Currency read GetBaseICMS write SetBaseICMS;
        property ValorICMS : Currency read GetValorICMS write SetValorICMS;

        property AliqIPI : Currency read GetAliqIPI write SetAliqIPI;
        property BaseIPI : Currency read GetBaseIPI write SetBaseIPI;
        property ValorIPI : Currency read GetValorIPI write SetValorIPI;

        property AliqICMSST : Currency read GetAliqICMSST write SetAliqICMSST;
        property MVA: Currency read GetMVA write SetMVA;
        property BaseICMSST : Currency read GetBaseICMSST write SetBaseICMSST;
        property ValorICMSST : Currency read GetValorICMSST write SetValorICMSST;

        property AliqPIS : Currency read GetAliqPIS write SetAliqPIS;
        property AliqCOFINS : Currency read GetAliqCOFINS write SetAliqCOFINS;
        property BasePISCOFINS : Currency read GetBasePISCOFINS write SetBasePISCOFINS;
        property ValorPIS : Currency read GetValorPIS write SetValorPIS;
        property ValorCOFINS : Currency read GetValorCOFINS write SetValorCOFINS;

        property AliqISS : Currency read GetAliqISS write SetAliqISS;
        property BaseISS : Currency read GetBaseISS write SetBaseISS;
        property ValorISS : Currency read GetValorISS write SetValorISS;

        property AliqCSLL : Currency read GetAliqCSLL write SetAliqCSLL;
        property BaseCSLL : Currency read GetBaseCSLL write SetBaseCSLL;
        property ValorCSLL : Currency read GetValorCSLL write SetValorCSLL;


      end;

      iParametrosSaida= interface
        function GetTipoDocumentos: TTipoDocumentos;
        procedure SetTipoDocumentos(const Value: TTipoDocumentos);
        function GetTipoPessoa: TTipoPessoa;
        procedure SetTipoPessoa(const Value: TTipoPessoa);
        function GetGeraFinanceiro: Boolean;
        procedure SetGeraFinanceiro(const Value: Boolean);
        function GetEhVenda: Boolean;
        procedure SetEhVenda(const Value: Boolean);
        function GetMovimentaEstoque: Boolean;
        procedure SetMovimentaEstoque(const Value: Boolean);
        procedure SetUFPessoa(const Value: String);
        function GetUFPessoa: String;
        property TipoDocumentos :TTipoDocumentos read GetTipoDocumentos write SetTipoDocumentos;
        property GeraFinanceiro: Boolean read GetGeraFinanceiro write SetGeraFinanceiro;
        property EhVenda : Boolean read GetEhVenda write SetEhVenda;
        property MovimentaEstoque: Boolean read GetMovimentaEstoque write SetMovimentaEstoque;
        property TipoPessoa: TTipoPessoa read GetTipoPessoa write SetTipoPessoa;
        property UFPessoa: String read GetUFPessoa write SetUFPessoa;

      end;

      iSaida = Class
      private
        function GetIdEmpresa: Integer;
        procedure SetIdEmpresa(const Value: Integer);
        function GetData: TDateTime;
        procedure SetData(const Value: TDateTime);
        function GetIdPessoa: Integer;
        procedure SetIdPessoa(const Value: Integer);
        function GetTipoPessoa: TTipoPessoa;
        procedure SetTipoPessoa(const Value: TTipoPessoa);
        function GetIdOperacaoEstoque: Integer;
        procedure SetIdOperacaoEstoque(const Value: Integer);
        function GetIdOS: Integer;
        procedure SetOS(const Value: Integer);
        function GetModeloNota: String;
        procedure SetModeloNota(const Value: String);
        function GetDataSaida: TDateTime;
        procedure SetDataSaida(const Value: TDateTime);
        function GetHoraSaida: TTime;
        procedure SetHoraSaida(const Value: TTime);
        function GetIdTransportadora: Integer;
        procedure SetIdTransportadora(const Value: Integer);
        function GetPlacaVeiculo: String;
        procedure SetPlacaVeiculo(const Value: String);
        function GetUFPlacaVeiculo: String;
        procedure SetUFPlacaVeiculo(const Value: String);
        function GetFinalidade: String;
        procedure SetFinalidade(const Value: String);
        function GetObs: WideString;
        procedure SetOBS(const Value: WideString);
        function GetPesoBruto: Double;
        procedure SetPesoBruto(const Value: Double);
        function GetPesoLiquido: Double;
        procedure SetPesoLiquido(const Value: Double);
        function GetVolume: SmallInt;
        procedure SetVolume(const Value: SmallInt);
        function GetEspecie: String;
        procedure SetEspecie(const Value: String);
        function GetTipoFrete: TTipoFrete;
        procedure SetTipoFrete(const Value: TTipoFrete);
      published
        property IdEmpresa: Integer read GetIdEmpresa write SetIdEmpresa;
        property Data: TDateTime read GetData write SetData;
        property IdPessoa: Integer read GetIdPessoa write SetIdPessoa;
        property TipoPessoa : TTipoPessoa read GetTipoPessoa write SetTipoPessoa;
        property IdOperacaoEstoque: Integer read GetIdOperacaoEstoque write SetIdOperacaoEstoque;
        property IdOS: Integer read GetIdOS write SetOS;
        property ModeloNota: String read GetModeloNota write SetModeloNota;
        property DataSaida: TDateTime read GetDataSaida write SetDataSaida;
        property HoraSaida: TTime read GetHoraSaida write SetHoraSaida;
        property IdTransportadora: Integer read GetIdTransportadora write SetIdTransportadora;
        property PlacaVeiculo: String read GetPlacaVeiculo write SetPlacaVeiculo;
        property UFPlacaVeiculo: String read GetUFPlacaVeiculo write SetUFPlacaVeiculo;
        property Finalidade: String read GetFinalidade write SetFinalidade;
        property Obs: WideString read GetObs write SetOBS;
        property PesoBruto: Double read GetPesoBruto write SetPesoBruto;
        property PesoLiquido: Double read GetPesoLiquido write SetPesoLiquido;
        property Volume: SmallInt read GetVolume write SetVolume;
        property Especie : String read GetEspecie write SetEspecie;
        property TipoFrete: TTipoFrete read GetTipoFrete write SetTipoFrete;

      End;

implementation

{ iSaida }

function iSaida.GetData: TDateTime;
begin

end;

function iSaida.GetDataSaida: TDateTime;
begin

end;

function iSaida.GetEspecie: String;
begin

end;

function iSaida.GetFinalidade: String;
begin

end;

function iSaida.GetHoraSaida: TTime;
begin

end;

function iSaida.GetIdEmpresa: Integer;
begin

end;

function iSaida.GetIdOperacaoEstoque: Integer;
begin

end;

function iSaida.GetIdOS: Integer;
begin

end;

function iSaida.GetIdPessoa: Integer;
begin

end;

function iSaida.GetIdTransportadora: Integer;
begin

end;

function iSaida.GetModeloNota: String;
begin

end;

function iSaida.GetObs: WideString;
begin

end;

function iSaida.GetPesoBruto: Double;
begin

end;

function iSaida.GetPesoLiquido: Double;
begin

end;

function iSaida.GetPlacaVeiculo: String;
begin

end;

function iSaida.GetTipoFrete: TTipoFrete;
begin

end;

function iSaida.GetTipoPessoa: TTipoPessoa;
begin

end;

function iSaida.GetUFPlacaVeiculo: String;
begin

end;

function iSaida.GetVolume: SmallInt;
begin

end;

procedure iSaida.SetData(const Value: TDateTime);
begin

end;

procedure iSaida.SetDataSaida(const Value: TDateTime);
begin

end;

procedure iSaida.SetEspecie(const Value: String);
begin

end;

procedure iSaida.SetFinalidade(const Value: String);
begin

end;

procedure iSaida.SetHoraSaida(const Value: TTime);
begin

end;

procedure iSaida.SetIdEmpresa(const Value: Integer);
begin

end;

procedure iSaida.SetIdOperacaoEstoque(const Value: Integer);
begin

end;

procedure iSaida.SetIdPessoa(const Value: Integer);
begin

end;

procedure iSaida.SetIdTransportadora(const Value: Integer);
begin

end;

procedure iSaida.SetModeloNota(const Value: String);
begin

end;

procedure iSaida.SetOBS(const Value: WideString);
begin

end;

procedure iSaida.SetOS(const Value: Integer);
begin

end;

procedure iSaida.SetPesoBruto(const Value: Double);
begin

end;

procedure iSaida.SetPesoLiquido(const Value: Double);
begin

end;

procedure iSaida.SetPlacaVeiculo(const Value: String);
begin

end;

procedure iSaida.SetTipoFrete(const Value: TTipoFrete);
begin

end;

procedure iSaida.SetTipoPessoa(const Value: TTipoPessoa);
begin

end;

procedure iSaida.SetUFPlacaVeiculo(const Value: String);
begin

end;

procedure iSaida.SetVolume(const Value: SmallInt);
begin

end;

end.
