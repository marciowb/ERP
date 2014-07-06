unit udlgCondicaoPagamentoProposta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDlg_CadastroERP, StdCtrls, Buttons, ExtCtrls, Mask, EditPesquisa,
  DB, DBCtrls, LabelDBEdit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, DBClient, pFIBClientDataSet;

type
  TfrmdlgCondicaoPagamentoProposta = class(TfrmDlg_CadastroERP)
    edtCondicaoPagamento: TEditPesquisa;
    edtTotalParcela: TLabelDBEdit;
    edtValor: TLabelDBEdit;
    GroupBox1: TGroupBox;
    TvParcelas: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    vParcelasColumn1: TcxGridDBColumn;
    vParcelasColumn2: TcxGridDBColumn;
    pFIBClientDataSet1: TpFIBClientDataSet;
    lblTotalRestante: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtCondicaoPagamentoRegAchado(
      const ValoresCamposEstra: array of Variant);
  private
    FDataSetParcelas: TpFIBClientDataSet;
    FValorTotalProposta: Currency;
    FValorTotalPagamentos: Currency;
    TotalPagamentoAtual: Currency;
    procedure SetDataSetParcelas(const Value: TpFIBClientDataSet);
    procedure SetValorTotalProposta(const Value: Currency);
    procedure SetValorTotalPagamentos(const Value: Currency);
    function GetValorRestante: Currency;
    procedure AtulizaDados;
    Procedure AtualizaLblFata;
    { Private declarations }

  public
    { Public declarations }
    property DataSetParcelas: TpFIBClientDataSet read FDataSetParcelas write SetDataSetParcelas;
    property ValorTotalProposta: Currency read FValorTotalProposta write SetValorTotalProposta;
    property ValorTotalPagamentos: Currency read FValorTotalPagamentos write SetValorTotalPagamentos;
  end;

var
  frmdlgCondicaoPagamentoProposta: TfrmdlgCondicaoPagamentoProposta;

implementation

uses uCad_proposta, Comandos, MinhasClasses, uRegras, uLst_Proposta;

{$R *.dfm}

procedure TfrmdlgCondicaoPagamentoProposta.AtualizaLblFata;
var
  Rest: Currency;
begin
  Rest := GetValorRestante;
  lblTotalRestante.Caption := 'Falta: '+FormatFloat(MascaraMoeda,Rest);
  if (pDataSet.State = dsEdit) and (Rest <> 0) then
    lblTotalRestante.Caption := lblTotalRestante.Caption +' Total: '+ FormatFloat(MascaraMoeda,edtValor.AsCurrency+Rest )+' ('+edtValor.Text+' + '+FormatFloat(MascaraMoeda,Rest)+' )';
end;

procedure TfrmdlgCondicaoPagamentoProposta.AtulizaDados;
var
  Parcelas: TParcelas;
  I: Integer;
begin
  inherited;
  if FValorTotalProposta < edtValor.AsCurrency then
    AvisaErro('O valor do pagamento é maior que o valor da proposta');
   if (FValorTotalPagamentos > (FValorTotalPagamentos+edtValor.AsCurrency)) and (FValorTotalPagamentos > 0) then
     AvisaErro('O valor da soma dos pagamentos é maior que o valor total da proposta');

  TotalPagamentoAtual := FValorTotalPagamentos+ edtValor.AsCurrency;

  Parcelas := TRegrasCondicaoPagamento.GeraParcela(edtCondicaoPagamento.ValorChaveInteger,edtValor.AsCurrency, edtTotalParcela.AsInteger);
  Self.FDataSetParcelas.First;

  while not Self.FDataSetParcelas.Eof do
  begin
    Self.FDataSetParcelas.Edit;
    Self.FDataSetParcelas.FieldByName('flagedicao').AsString:= 'D';
    Self.FDataSetParcelas.Post;
    Self.FDataSetParcelas.Next;
  end;



  if High(Parcelas)>= 1   then
  begin
    for I := 0 to High(Parcelas) do
    begin
      Self.FDataSetParcelas.Append;
      Self.FDataSetParcelas.FieldByName('NUMPARCELA').AsInteger := Parcelas[i].NumParcela;
      Self.FDataSetParcelas.FieldByName('VALORPARCELA').AsCurrency := Parcelas[i].Valor;
      Self.FDataSetParcelas.Post;
    end;
  end;

end;

procedure TfrmdlgCondicaoPagamentoProposta.btnOkClick(Sender: TObject);
begin
  ActiveControl := nil;
  inherited;
  if TotalPagamentoAtual >= FValorTotalPagamentos then
    Self.Close
  else
    edtCondicaoPagamento.SetFocus;
  ValorTotalPagamentos :=  TotalPagamentoAtual;
end;

procedure TfrmdlgCondicaoPagamentoProposta.edtCondicaoPagamentoRegAchado(
  const ValoresCamposEstra: array of Variant);
begin
  inherited;
  edtTotalParcela.Enabled := TRegrasCondicaoPagamento.PodeParcelar(edtCondicaoPagamento.ValorChaveInteger);
  if pDataSet.State = dsInsert then
    edtValor.AsCurrency := GetValorRestante;

end;

procedure TfrmdlgCondicaoPagamentoProposta.edtValorExit(Sender: TObject);
begin
   AtulizaDados;
end;

procedure TfrmdlgCondicaoPagamentoProposta.FormShow(Sender: TObject);
begin
  inherited;
  ConfiguraEditPesquisa(edtCondicaoPagamento,pDataSet,tpERPCondicaoPagamento,True);
end;

function TfrmdlgCondicaoPagamentoProposta.GetValorRestante: Currency;
begin
  if FValorTotalProposta = 0 then
    Result := 0
  else
    Result := FValorTotalProposta - FValorTotalPagamentos
end;

procedure TfrmdlgCondicaoPagamentoProposta.SetDataSetParcelas(
  const Value: TpFIBClientDataSet);
begin
  FDataSetParcelas := Value;
end;

procedure TfrmdlgCondicaoPagamentoProposta.SetValorTotalPagamentos(
  const Value: Currency);
begin
  FValorTotalPagamentos := Value;
  AtualizaLblFata;
end;

procedure TfrmdlgCondicaoPagamentoProposta.SetValorTotalProposta(
  const Value: Currency);
begin
  FValorTotalProposta := Value;
  AtualizaLblFata;
end;

end.
