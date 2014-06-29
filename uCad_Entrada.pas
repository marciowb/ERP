unit uCad_Entrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCad_CadastroPaiERP, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, ComCtrls, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, DB, DBClient,
  pFIBClientDataSet, ActnList, cxPC, cxContainer, cxEdit, cxTreeView, Buttons,
  ExtCtrls, Mask, EditPesquisa, StdCtrls, DBCtrls, LabelDBEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxMemo, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TfrmCad_Entrada = class(TfrmCad_CadastroPaiERP)
    Panel2: TPanel;
    edtData: TcxDBDateEdit;
    edtNumNota: TLabelDBEdit;
    Label1: TLabel;
    LabelDBEdit2: TLabelDBEdit;
    edtCodigoModelo: TEditPesquisa;
    edtCodigoFornecedor: TEditPesquisa;
    edtCodigoOperacao: TEditPesquisa;
    EdtEmpresa: TEditPesquisa;
    Panel4: TPanel;
    LabelDBEdit3: TLabelDBEdit;
    LabelDBEdit4: TLabelDBEdit;
    LabelDBEdit5: TLabelDBEdit;
    LabelDBEdit6: TLabelDBEdit;
    LabelDBEdit7: TLabelDBEdit;
    LabelDBEdit8: TLabelDBEdit;
    edtFrete: TLabelDBEdit;
    grpFretePorConta: TDBRadioGroup;
    LabelDBEdit10: TLabelDBEdit;
    LabelDBEdit11: TLabelDBEdit;
    LabelDBEdit12: TLabelDBEdit;
    edtTotalnota: TLabelDBEdit;
    cxPageControl1: TcxPageControl;
    cxTabSheet2: TcxTabSheet;
    Panel6: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    cxTabSheet3: TcxTabSheet;
    cxDBMemo1: TcxDBMemo;
    tvProdutos: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DataItens: TDataSource;
    CdsProdutos: TpFIBClientDataSet;
    tvProdutosColumn1: TcxGridDBColumn;
    tvProdutosColumn2: TcxGridDBColumn;
    tvProdutosColumn3: TcxGridDBColumn;
    tvProdutosColumn4: TcxGridDBColumn;
    tvProdutosColumn5: TcxGridDBColumn;
    tvProdutosColumn6: TcxGridDBColumn;
    tvProdutosColumn7: TcxGridDBColumn;
    tvProdutosColumn8: TcxGridDBColumn;
    tvProdutosColumn9: TcxGridDBColumn;
    tvProdutosColumn10: TcxGridDBColumn;
    tvProdutosColumn11: TcxGridDBColumn;
    tvProdutosColumn12: TcxGridDBColumn;
    tvProdutosColumn13: TcxGridDBColumn;
    tvProdutosColumn14: TcxGridDBColumn;
    CdsSeriais: TpFIBClientDataSet;
    procedure FormShow(Sender: TObject);
    procedure CdsCadastroAfterScroll(DataSet: TDataSet);
    procedure CdsProdutosAfterOpen(DataSet: TDataSet);
    procedure CdsProdutosValorValidate(Sender: TField);
    procedure CdsCadastroAfterOpen(DataSet: TDataSet);
    procedure CdsEntradaValorValidate(Sender: TField);
    procedure CdsProdutosNewRecord(DataSet: TDataSet);
    procedure CdsSeriaisNewRecord(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure CdsProdutosAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure CdsSeriaisBeforePost(DataSet: TDataSet);
    procedure CdsCadastroAfterPost(DataSet: TDataSet);
    procedure CdsSeriaisBeforeDelete(DataSet: TDataSet);
    procedure CdsProdutosBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCad_Entrada: TfrmCad_Entrada;

implementation

uses Comandos, MinhasClasses, uRegras, Inc_ProdutoEntrada;



{$R *.dfm}

procedure TfrmCad_Entrada.BitBtn1Click(Sender: TObject);
begin
  inherited;
  VerificaEdit(edtCodigoFornecedor,'Informe o fornecedor');
  MudaEstado;
  frmInc_ProdutoEntrada := TfrmInc_ProdutoEntrada.Create(nil);
  Try
    with frmInc_ProdutoEntrada do
    Begin
      pDataSet := Self.CdsProdutos;
      pDataSet.Append;
      FechaEGrava := False;
      IdFornecedor := Self.edtCodigoFornecedor.ValorChaveString;
      DataSetSerial := Self.CdsSeriais;
      ShowModal;
      TRegrasEntradaMercadoria.CalculaTotalNotaEntrada(CdsCadastro,CdsProdutos);
    End;
  Finally
    FreeAndNil(frmInc_ProdutoEntrada);
  End;
end;

procedure TfrmCad_Entrada.BitBtn2Click(Sender: TObject);
begin
  inherited;
  VerificaEdit(edtCodigoFornecedor,'Informe o fornecedor');
  MudaEstado;
  frmInc_ProdutoEntrada := TfrmInc_ProdutoEntrada.Create(nil);
  Try
    with frmInc_ProdutoEntrada do
    Begin
      pDataSet := Self.CdsProdutos;
      pDataSet.Edit;
      IdFornecedor := Self.edtCodigoFornecedor.ValorChaveString;
      DataSetSerial := Self.CdsSeriais;
      ShowModal;
      TRegrasEntradaMercadoria.CalculaTotalNotaEntrada(CdsCadastro,CdsProdutos);
    End;
  Finally
    FreeAndNil(frmInc_ProdutoEntrada);
  End;
end;

procedure TfrmCad_Entrada.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if ConfirmaDel then
  begin
    MudaEstado;
    CdsProdutos.Edit;
    CdsProdutos.FieldByName('FLAGEDICAO').AsString := 'D';
    CdsProdutos.Post;
  end;

end;

procedure TfrmCad_Entrada.CdsCadastroAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CdsCadastro.FieldByName('VALORFRETE').OnValidate := CdsEntradaValorValidate;
  CdsCadastro.FieldByName('VALORSEGURO').OnValidate := CdsEntradaValorValidate;
  CdsCadastro.FieldByName('VALOROUTRAS').OnValidate := CdsEntradaValorValidate;
  CdsCadastro.FieldByName('VALORDESCONTO').OnValidate := CdsEntradaValorValidate;
  CdsCadastro.FieldByName('FRETEPORCONTA').OnValidate := CdsEntradaValorValidate;
end;

procedure TfrmCad_Entrada.CdsCadastroAfterPost(DataSet: TDataSet);
begin
  inherited;
  SetRegistros(CdsProdutos, tpERPEntradaProduto);
  SetRegistros(CdsSeriais, tpERPSerialProdutoEntrada);

end;

procedure TfrmCad_Entrada.CdsCadastroAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SetCds(CdsProdutos, tpERPEntradaProduto,'e.identrada = '+ValorChave);
  SetCds(CdsSeriais, tpERPSerialProdutoEntrada,' exists(select 1 from ENTRADAPRODUTO p where p.IDENTRADAPRODUTO = ES.IDENTRADAPRODUTO and p.identrada = '+ValorChave+')');

end;

procedure TfrmCad_Entrada.CdsEntradaValorValidate(Sender: TField);
begin
  TRegrasEntradaMercadoria.CalculaTotalNotaEntrada(CdsCadastro,CdsProdutos);
end;

procedure TfrmCad_Entrada.CdsProdutosAfterOpen(DataSet: TDataSet);
  var
  I: Integer;
begin
  inherited;
  for I := 0 to CdsProdutos.FieldCount - 1 do
  Begin
    if CdsProdutos.Fields[i].DataType in [ftFloat, ftCurrency, ftBCD] then
      FormataMascara(CdsProdutos.Fields[i],tcMoeda);
  End;
  FormataMascara(CdsProdutos.FieldByName('ALIQIPI'),tcPercent);
  FormataMascara(CdsProdutos.FieldByName('ALIQICMS'),tcPercent);
  FormataMascara(CdsProdutos.FieldByName('FATORMULTIPLICADOR'),tcReal);
  FormataMascara(CdsProdutos.FieldByName('QUANTIDADERECEBIDA'),tcReal);
  FormataMascara(CdsProdutos.FieldByName('QUANTIDADE'),tcReal);

  CdsProdutos.FieldByName('FATORMULTIPLICADOR').OnValidate := CdsProdutosValorValidate;
  CdsProdutos.FieldByName('QUANTIDADERECEBIDA').OnValidate := CdsProdutosValorValidate;
  CdsProdutos.FieldByName('QUANTIDADE').OnValidate := CdsProdutosValorValidate;
  CdsProdutos.FieldByName('ALIQIPI').OnValidate := CdsProdutosValorValidate;
  CdsProdutos.FieldByName('ALIQICMS').OnValidate := CdsProdutosValorValidate;
  CdsProdutos.FieldByName('VALORUNITARIO').OnValidate := CdsProdutosValorValidate;

end;

procedure TfrmCad_Entrada.CdsProdutosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if CdsProdutos.FieldByName('IDENTRADAPRODUTO').AsString <> '' then
    CdsSeriais.Filter := 'FLAGEDICAO <> ''D'' AND IDENTRADAPRODUTO = '+CdsProdutos.FieldByName('IDENTRADAPRODUTO').AsString;
  CdsSeriais.Filtered := True;

end;

procedure TfrmCad_Entrada.CdsProdutosBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CdsProdutos.FieldByName('FLAGEDICAO').Value = 'N' then
    CdsProdutos.FieldByName('FLAGEDICAO').Value := 'E';

end;

procedure TfrmCad_Entrada.CdsProdutosNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsProdutos.FieldByName('IDENTRADA').AsInteger := CdsCadastro.FieldByName('IDENTRADA').AsInteger;
  CdsProdutos.FieldByName('IDENTRADAPRODUTO').AsString := GetCodigo(tpERPEntradaProduto);
  CdsProdutos.FieldByName('IDCFOP').AsInteger := CdsCadastro.FieldByName('IDCFOP').AsInteger;
  CdsProdutos.FieldByName('NUMITEM').AsInteger := CdsProdutos.RecordCount+1;
  CdsProdutos.FieldByName('FLAGEDICAO').Value := 'I';
end;

procedure TfrmCad_Entrada.CdsProdutosValorValidate(Sender: TField);
begin
  TRegrasEntradaMercadoria.CalculaValoresItens(Sender);
end;

procedure TfrmCad_Entrada.CdsSeriaisBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  CdsSeriais.BeforePost:= nil;
  CdsSeriais.Edit;
  CdsSeriais.FieldByName('FLAGEDICAO').Value := 'D';
  CdsSeriais.Post;
  CdsSeriais.BeforePost:= CdsSeriaisBeforePost;
  Abort;

end;

procedure TfrmCad_Entrada.CdsSeriaisBeforePost(DataSet: TDataSet);
begin
  inherited;
  if ExisteRegistro(CdsSeriais,'Serial',False,True) Then
  begin
    Avisa('O srial '+CdsSeriais.FieldByName('serial').AsString+' já existe nessa nota');
    Abort ;
  end;
  IF GetTableCount('SERIALPRODUTO','*','IDPRODUTO = '+CdsProdutos.FieldByName('IDPRODUTO').AsString+
                   ' AND SERIAL = '+GetStr(CdsSeriais.FieldByName('serial').AsString)+' and FLAGATIVO = ''Y''') > 0 Then
  begin
    Avisa('O srial '+CdsSeriais.FieldByName('serial').AsString+' já existe no banco de dados');
    Abort ;
  end;
  if CdsSeriais.FieldByName('FLAGEDICAO').Value = 'N' then
    CdsSeriais.FieldByName('FLAGEDICAO').Value := 'E';

end;

procedure TfrmCad_Entrada.CdsSeriaisNewRecord(DataSet: TDataSet);
begin
  inherited;
  If CdsSeriais.RecordCount+1 > CdsProdutos.FieldByName('quantidade').AsInteger then
    Abort;

  CdsSeriais.FieldByName('IDEMPRESA').Value := EdtEmpresa.ValorChave;
  CdsSeriais.FieldByName('IDENTRADAPRODUTO').Value := CdsProdutos.FieldByName('IDENTRADAPRODUTO').AsInteger;
  CdsSeriais.FieldByName('FLAGEDICAO').Value := 'I';
end;

procedure TfrmCad_Entrada.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPesquisa :=tpERPEntrada;
end;

procedure TfrmCad_Entrada.FormShow(Sender: TObject);
begin
  inherited;
  edtCodigoOperacao.CamposExtraPesquisa := 'FLAGTIPOPESSOA';
  EdtEmpresa.CamposExtraPesquisa := 'UF';
  ConfiguraEditPesquisa(edtCodigoOperacao, CdsCadastro, tpERPOperacaoEntrada);
  ConfiguraEditPesquisa(edtCodigoFornecedor, CdsCadastro, tpERPFornecedor);
  ConfiguraEditPesquisa(edtCodigoModelo, CdsCadastro, tpERPModeloNota);
  ConfiguraEditPesquisa(EdtEmpresa, CdsCadastro, tpERPEmpresa);
  edtCodigoModelo.TamanhoCodigo :=2;
  edtCodigoModelo.AutoPesquisa := True;

end;

end.
