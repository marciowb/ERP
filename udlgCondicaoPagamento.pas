unit udlgCondicaoPagamento;

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
  TfrmdlgCondicaoPagamento = class(TfrmDlg_CadastroERP)
    edtCondicaoPagamento: TEditPesquisa;
    edtTotalParcela: TLabelDBEdit;
    edtValor: TLabelDBEdit;
    GroupBox1: TGroupBox;
    TvParcelas: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    lblTotalRestante: TLabel;
    DataParcelas: TDataSource;
    vParcelasColumn1: TcxGridDBColumn;
    vParcelasColumn2: TcxGridDBColumn;
    DataPagamento: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure edtValorExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtCondicaoPagamentoRegAchado(
      const ValoresCamposEstra: array of Variant);
    procedure TvParcelasTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems0GetText(
      Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
      var AText: string);
  private
    FDataSetParcelas: TpFIBClientDataSet;
    FValorTotal: Currency;
    FValorTotalPagamentos: Currency;
    TotalPagamentoAtual: Currency;
    procedure SetDataSetParcelas(const Value: TpFIBClientDataSet);
    procedure SetValorTotal(const Value: Currency);
    procedure SetValorTotalPagamentos(const Value: Currency);
    function GetValorRestante: Currency;
    procedure AtulizaDados;
    Procedure AtualizaLblFata;
    { Private declarations }

  public
    { Public declarations }
    property DataSetParcelas: TpFIBClientDataSet read FDataSetParcelas write SetDataSetParcelas;
    property ValorTotal: Currency read FValorTotal write SetValorTotal;
    property ValorTotalPagamentos: Currency read FValorTotalPagamentos write SetValorTotalPagamentos;
  end;

var
  frmdlgCondicaoPagamento: TfrmdlgCondicaoPagamento;

implementation

uses Comandos, MinhasClasses, uRegras;

{$R *.dfm}

procedure TfrmdlgCondicaoPagamento.AtualizaLblFata;
var
  Rest: Currency;
begin
  Rest := GetValorRestante;
  lblTotalRestante.Caption := 'Falta: '+FormatFloat(MascaraMoeda,Rest);
  if (pDataSet.State = dsEdit) and (Rest <> 0) then
    lblTotalRestante.Caption := lblTotalRestante.Caption +' Total: '+ FormatFloat(MascaraMoeda,edtValor.AsCurrency+Rest )+' ('+edtValor.Text+' + '+FormatFloat(MascaraMoeda,Rest)+' )';
end;

procedure TfrmdlgCondicaoPagamento.AtulizaDados;
var
  Parcelas: TParcelas;
  I: Integer;
begin
  inherited;
  if FValorTotal < edtValor.AsCurrency then
    AvisaErro('O valor do pagamento é maior que o valor da operação');
   if (FValorTotalPagamentos > (FValorTotalPagamentos+edtValor.AsCurrency)) and (FValorTotalPagamentos > 0) then
     AvisaErro('O valor da soma dos pagamentos é maior que o valor total da operação');

  if DataParcelas.State = dsEdit then
    if not Pergunta('Os valoresserão reajustados. Deseja continuar?') then
       Exit;
  TotalPagamentoAtual := FValorTotalPagamentos+ edtValor.AsCurrency;

  Parcelas := TRegrasCondicaoPagamento.GeraParcela(edtCondicaoPagamento.ValorChaveInteger,edtValor.AsCurrency, edtTotalParcela.AsInteger);
  DataSetParcelas.First;
  Try
    DataSetParcelas.DisableControls;
    DataSetParcelas.Filtered :=False;

    while not DataSetParcelas.Eof do
    begin
      DataSetParcelas.Edit;
      DataSetParcelas.FieldByName('flagedicao').AsString:= 'D';
      DataSetParcelas.Post;
      DataSetParcelas.Next;
    end;



    if High(Parcelas)>= 1   then
    begin
      for I := 0 to High(Parcelas) do
      begin
        DataSetParcelas.Append;
        DataSetParcelas.FieldByName('NUMPARCELA').AsInteger := Parcelas[i].NumParcela;
        DataSetParcelas.FieldByName('VALORPARCELA').AsCurrency := Parcelas[i].Valor;
        DataSetParcelas.Post;
      end;
    end;
  Finally
    DataSetParcelas.Filtered :=True;
    DataSetParcelas.EnableControls;
  End;

end;

procedure TfrmdlgCondicaoPagamento.btnOkClick(Sender: TObject);
begin
  if DataParcelas.State in [dsInsert, dsEdit] then
    DataSetParcelas.Post;

  if (not VarIsNull(TvParcelas.DataController.Summary.FooterSummaryValues[0])) and
     (currency(TvParcelas.DataController.Summary.FooterSummaryValues[0]) <> edtValor.AsCurrency) Then
  begin
    Avisa('O somatório das parcelas não bate com o valor total');
    Exit;
  end;

  ActiveControl := nil;
  inherited;
  if (FValorTotalPagamentos+ TotalPagamentoAtual) >= FValorTotal then
    Self.Close
  else
    edtCondicaoPagamento.SetFocus;
  ValorTotalPagamentos :=  TotalPagamentoAtual;
end;

procedure TfrmdlgCondicaoPagamento.edtCondicaoPagamentoRegAchado(
  const ValoresCamposEstra: array of Variant);
begin
  inherited;
  edtTotalParcela.Enabled := TRegrasCondicaoPagamento.PodeParcelar(edtCondicaoPagamento.ValorChaveInteger);
  if pDataSet.State = dsInsert then
    edtValor.AsCurrency := GetValorRestante;

end;

procedure TfrmdlgCondicaoPagamento.edtValorExit(Sender: TObject);
begin
   AtulizaDados;
end;

procedure TfrmdlgCondicaoPagamento.FormShow(Sender: TObject);
begin
  inherited;
  DataParcelas.DataSet := DataSetParcelas;
  DataPagamento.DataSet := pDataSet;
  ConfiguraEditPesquisa(edtCondicaoPagamento,pDataSet,tpERPCondicaoPagamento,True);
end;

function TfrmdlgCondicaoPagamento.GetValorRestante: Currency;
begin
  if FValorTotal = 0 then
    Result := 0
  else
    Result := FValorTotal - FValorTotalPagamentos
end;

procedure TfrmdlgCondicaoPagamento.SetDataSetParcelas(
  const Value: TpFIBClientDataSet);
begin
  FDataSetParcelas := Value;
end;

procedure TfrmdlgCondicaoPagamento.SetValorTotalPagamentos(
  const Value: Currency);
begin
  FValorTotalPagamentos := Value;
  AtualizaLblFata;
end;

procedure TfrmdlgCondicaoPagamento.TvParcelasTcxGridDBDataControllerTcxDataSummaryFooterSummaryItems0GetText(
  Sender: TcxDataSummaryItem; const AValue: Variant; AIsFooter: Boolean;
  var AText: string);
begin
  inherited;
  if not VarIsNull(AValue)  then
     AText := 'Total: '+FormatFloat(MascaraFloat,Currency(AValue))+' | Restante: '+FormatFloat(MascaraFloat,edtValor.AsCurrency- Currency(AValue));
end;

procedure TfrmdlgCondicaoPagamento.SetValorTotal(
  const Value: Currency);
begin
  FValorTotal := Value;
  AtualizaLblFata;
end;

end.
