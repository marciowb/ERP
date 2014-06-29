unit uEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormPadrao, StdCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit,
  Mask, DBCtrls, LabelDBEdit, EditPesquisa, DBClient, pFIBClientDataSet, Buttons,
  cxPC, Comandos, MinhasClasses, Inc_ProdutoEntrada, StrUtils,Math, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter;

type
  TTipoNota =(tnEntradaDeFornecedor, tnEntradaDeCliente,tnDI);

  TfrmEntradaEstoque = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    TvEntarada: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel3: TPanel;
    Label1: TLabel;
    edtData: TcxDBDateEdit;
    edtNumNota: TLabelDBEdit;
    LabelDBEdit2: TLabelDBEdit;
    edtCodigoModelo: TEditPesquisa;
    edtCodigoOperacao: TEditPesquisa;
    edtCodigoFornecedor: TEditPesquisa;
    DataEntrada: TDataSource;
    DataProdutos: TDataSource;
    CdsEntrada: TpFIBClientDataSet;
    CdsProdutos: TpFIBClientDataSet;
    Panel2: TPanel;
    btnIncProduto: TBitBtn;
    btnEditProduto: TBitBtn;
    btnDelProduto: TBitBtn;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    DBMemo1: TDBMemo;
    LabelDBEdit3: TLabelDBEdit;
    LabelDBEdit4: TLabelDBEdit;
    LabelDBEdit5: TLabelDBEdit;
    LabelDBEdit6: TLabelDBEdit;
    LabelDBEdit7: TLabelDBEdit;
    LabelDBEdit8: TLabelDBEdit;
    edtFrete: TLabelDBEdit;
    LabelDBEdit10: TLabelDBEdit;
    LabelDBEdit11: TLabelDBEdit;
    LabelDBEdit12: TLabelDBEdit;
    edtTotalnota: TLabelDBEdit;
    vEntaradaColumn1: TcxGridDBColumn;
    vEntaradaColumn2: TcxGridDBColumn;
    vEntaradaColumn3: TcxGridDBColumn;
    vEntaradaColumn4: TcxGridDBColumn;
    vEntaradaColumn5: TcxGridDBColumn;
    vEntaradaColumn6: TcxGridDBColumn;
    vEntaradaColumn7: TcxGridDBColumn;
    vEntaradaColumn8: TcxGridDBColumn;
    vEntaradaColumn9: TcxGridDBColumn;
    vEntaradaColumn11: TcxGridDBColumn;
    vEntaradaColumn12: TcxGridDBColumn;
    vEntaradaColumn13: TcxGridDBColumn;
    vEntaradaColumn14: TcxGridDBColumn;
    vEntaradaColumn15: TcxGridDBColumn;
    grpFretePorConta: TDBRadioGroup;
    EdtEmpresa: TEditPesquisa;
    DataSerialProduto: TDataSource;
    CdsSerial: TpFIBClientDataSet;
    edtCFOP: TEditPesquisa;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    vEntaradaColumn16: TcxGridDBColumn;
    procedure btnCancelarClick(Sender: TObject);
    procedure CdsEntradaNewRecord(DataSet: TDataSet);
    procedure btnIncProdutoClick(Sender: TObject);
    procedure btnEditProdutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CdsProdutosNewRecord(DataSet: TDataSet);
    procedure CdsProdutosValorValidate(Sender: TField);
    procedure CdsProdutosAfterOpen(DataSet: TDataSet);
    procedure btnGravarClick(Sender: TObject);
    procedure CdsProdutosAfterPost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnDelProdutoClick(Sender: TObject);
    procedure CdsEntradaAfterOpen(DataSet: TDataSet);
    procedure CdsEntradaValorValidate(Sender: TField);
    procedure EdtEmpresaRegAchado(const ValoresCamposEstra: array of Variant);
    procedure edtCodigoOperacaoRegAchado(
      const ValoresCamposEstra: array of Variant);
    procedure CdsSerialNewRecord(DataSet: TDataSet);
    procedure CdsProdutosAfterScroll(DataSet: TDataSet);
    procedure edtCodigoFornecedorBtnNovoClick(Sender: TObject);
    procedure CdsSerialBeforePost(DataSet: TDataSet);
    procedure grpFretePorContaChange(Sender: TObject);
  private
    { Private declarations }
    Alterando: Boolean;
    UfEmpresa, UfFornecedor: String;
    AliqICMSInterno : Currency;
    FTipoNota: TTipoNota;
    procedure SetTipoNota(const Value: TTipoNota);
  public
    { Public declarations }
    Procedure CalculaTotalNota;
    Procedure RestartaEntrada;
    property TipoNota: TTipoNota read FTipoNota write SetTipoNota;
  end;

var
  frmEntradaEstoque: TfrmEntradaEstoque;

implementation

uses uForms, uRegras;

{$R *.dfm}

procedure TfrmEntradaEstoque.btnIncProdutoClick(Sender: TObject);
begin
  inherited;
  VerificaEdit(edtCodigoFornecedor,'Informe o fornecedor');
  frmInc_ProdutoEntrada := TfrmInc_ProdutoEntrada.Create(nil);
  Try
    with frmInc_ProdutoEntrada do
    Begin
      pDataSet := Self.CdsProdutos;
      pDataSet.Append;
      FechaEGrava := False;
      IdFornecedor := Self.edtCodigoFornecedor.ValorChaveString;
      DataSetSerial := Self.CdsSerial;
      ShowModal;
    End;
  Finally
    FreeAndNil(frmInc_ProdutoEntrada);
  End;
end;

procedure TfrmEntradaEstoque.btnDelProdutoClick(Sender: TObject);
begin
  inherited;
  if ConfirmaDel then
    CdsProdutos.Delete;
end;

procedure TfrmEntradaEstoque.btnEditProdutoClick(Sender: TObject);
begin
  inherited;
  VerificaEdit(edtCodigoFornecedor,'Informe o fornecedor');
  frmInc_ProdutoEntrada := TfrmInc_ProdutoEntrada.Create(nil);
  Try
    with frmInc_ProdutoEntrada do
    Begin
      pDataSet := Self.CdsProdutos;
      pDataSet.Edit;
      IdFornecedor := Self.edtCodigoFornecedor.ValorChaveString;
      DataSetSerial := Self.CdsSerial;
      ShowModal;
    End;
  Finally
    FreeAndNil(frmInc_ProdutoEntrada);
  End;
end;

procedure TfrmEntradaEstoque.btnCancelarClick(Sender: TObject);
begin
  inherited;
  if Pergunta('Deseja realmente cancelar essa entrada?') then
  Begin
    CdsEntrada.Cancel;
    CdsProdutos.Cancel;
    RestartaEntrada;
    edtData.SetFocus;
  End;
end;

procedure TfrmEntradaEstoque.btnGravarClick(Sender: TObject);
var
  StrSQL,IDProdutoEntrada,IdSerialProduto : String;
  ValorSeguroRatiado,
  ValorFreteRatiado, ValorOutrosRatiado: Currency;
begin
  inherited;
  if CdsProdutos.RecordCount = 0 then
    AvisaErro('Não existem produtos para serem gravados!');
  VerificaEdit(CdsEntrada, edtNumNota, '', 'Informe a nota');
  VerificaEdit(CdsEntrada, edtTotalnota, '', 'Informe o total da nota');
  VerificaEdit(edtCodigoOperacao, 'Informe a operação');
  VerificaEdit(edtCodigoFornecedor, 'Informe o fornecedor');
  if grpFretePorConta.ItemIndex = -1 then
    AvisaErro('Informe o tipo de frete');
  if (grpFretePorConta.ItemIndex = 1) and (CdsEntrada.FieldByName('VALORFRETE').AsCurrency =0) then //Destinatário
  begin
    AvisaErro('Informe o valor do frete');
    edtFrete.SetFocus;
    Exit;
  end;
  CalculaTotalNota;
  try
    StartTrans;
    if CdsEntrada.State = dsBrowse then
      CdsEntrada.Edit;

    CdsEntrada.FieldByName('IDENTRADA').AsInteger := GetValSeq('SEQ_IDENTRADA',1);
    AlteraBanco(taInsere, CdsEntrada,tpERPEntrada);
    CdsProdutos.First;
    while not CdsProdutos.Eof do
    Begin
      ValorSeguroRatiado :=
         (CdsEntrada.FieldByName('VALORSEGURO').AsCurrency/CdsEntrada.FieldByName('VALORTOTALPRODUTOS').AsCurrency)*
          CdsProdutos.FieldByName('VALORTOTAL').AsCurrency;

      ValorFreteRatiado := (CdsEntrada.FieldByName('VALORFRETE').AsCurrency/CdsEntrada.FieldByName('VALORTOTALPRODUTOS').AsCurrency)*
          CdsProdutos.FieldByName('VALORTOTAL').AsCurrency;

      ValorOutrosRatiado := (CdsEntrada.FieldByName('VALOROUTRAS').AsCurrency/CdsEntrada.FieldByName('VALORTOTALPRODUTOS').AsCurrency)*
          CdsProdutos.FieldByName('VALORTOTAL').AsCurrency;

      IDProdutoEntrada := GetCodigo(tpERPEntradaProduto);
      StrSQL :=
        'INSERT INTO ENTRADAPRODUTO (IDENTRADAPRODUTO, IDENTRADA, IDCFOP, IDPRODUTO, '+
        '                            QUANTIDADE, VALORUNITARIO, VALORACRESCIMO, VALORDESCONTO, '+
        '                            BASEICMS, ALIQICMS, VALORICMS, ALIQIPI, VALORIPI, VALORTOTAL,'+
        '                            VALORTOTALBRUTO, STITUACAOTRIBUTARIA, VALORFRETERATEADO, VALORSEGURORATEADO, '+
        '                            VALOROUTROSRATEADO, IDUNIDADE, NUMITEM,QUANTIDADERECEBIDA,FATORMULTIPLICADOR) VALUES '+
        '                           ('+IDProdutoEntrada+','+
                                    CdsEntrada.FieldByName('IDENTRADA').AsString+','+
                                    CdsProdutos.FieldByName('IDCFOP').AsString+','+
                                    CdsProdutos.FieldByName('IDPRODUTO').AsString+','+
                                    GetNumber(CdsProdutos.FieldByName('QUANTIDADE').AsCurrency)+','+
                                    GetNumber(CdsProdutos.FieldByName('VALORUNITARIO').AsCurrency)+','+
                                    GetNumber(CdsProdutos.FieldByName('VALORACRESCIMO').AsCurrency)+','+
                                    GetNumber(CdsProdutos.FieldByName('VALORDESCONTO').AsCurrency)+','+
                                    GetNumber(CdsProdutos.FieldByName('BASEICMS').AsCurrency)+','+
                                    GetNumber(CdsProdutos.FieldByName('ALIQICMS').AsCurrency)+','+
                                    GetNumber(CdsProdutos.FieldByName('VALORICMS').AsCurrency)+','+
                                    GetNumber(CdsProdutos.FieldByName('ALIQIPI').AsCurrency)+','+
                                    GetNumber(CdsProdutos.FieldByName('VALORIPI').AsCurrency)+','+
                                    GetNumber(CdsProdutos.FieldByName('VALORTOTAL').AsCurrency)+','+
                                    GetNumber(CdsProdutos.FieldByName('VALORTOTALBRUTO').AsCurrency)+','+
                                    GetStr(Copy(CdsProdutos.FieldByName('CST').AsString,2,2))+','+
                                    GetNumber(ValorFreteRatiado)+','+
                                    GetNumber(ValorSeguroRatiado)+','+
                                    GetNumber(ValorOutrosRatiado)+','+
                                    CdsProdutos.FieldByName('IDUNIDADE').AsString+','+
                                    IntToStr(CdsProdutos.RecNo)+','+
                                    GetNumber(CdsProdutos.FieldByName('QUANTIDADERECEBIDA').AsCurrency)+','+
                                    GetNumber(CdsProdutos.FieldByName('FATORMULTIPLICADOR').AsCurrency)+')';
      Exec_SQL(StrSQL);

      CdsSerial.First;
      while not CdsSerial.Eof do
      begin
        IdSerialProduto := GetCodigo(tpERPSerialProduto);
        StrSQL :=
           'INSERT INTO SERIALPRODUTO (IDSERIALPRODUTO, IDPRODUTO, IDEMPRESA, SERIAL, DATAENTRADA,  FLAGATIVO) '+
           ' VALUES ('+IdSerialProduto+', '+CdsProdutos.FieldByName('IDPRODUTO').AsString+', '+EdtEmpresa.ValorChaveString+', '+
           GetStr(CdsSerial.FieldByName('SERIAL').AsString)+','+
           GetData(edtData.Date)+',''Y'')';
        Exec_SQL(StrSQL);

        StrSQL:=
          ' INSERT INTO ENTRADAPRODUTOSERIAL (IDENTRADAPRODUTOSERIAL, IDENTRADAPRODUTO, IDSERIALPRODUTO) '+
          '   VALUES (GEN_ID(SEQ_IDENTRADAPRODUTOSERIAL,1), '+IDProdutoEntrada+', '+IdSerialProduto+') ';
        Exec_SQL(StrSQL);

        CdsSerial.Next;
      end;

      StrSQL :=
        'EXECUTE BLOCK AS'+
        '    DECLARE VARIABLE CODIGOPRODFORN VARCHAR(20);'+
        '    DECLARE VARIABLE  IDFORNECEDOR INTEGER ;'+
        '    DECLARE VARIABLE IDENTRADA INTEGER;'+
        '    DECLARE VARIABLE IDPRODUTO INTEGER;'+
        '    DECLARE VARIABLE VALORUNITARIO VALOR;'+
        '    DECLARE VARIABLE IDPRODUTOFORNECEDOR INTEGER; '+
        '    DECLARE VARIABLE DESCRICAOPRODUTO NOME ;'+
        ' BEGIN'+
        '   IDFORNECEDOR = '+edtCodigoFornecedor.ValorChaveString+';'+
        '   IDPRODUTO = '+CdsProdutos.FieldByName('IDPRODUTO').AsString+';'+
        '   CODIGOPRODFORN = '+GetStr(CdsProdutos.FieldByName('CODIGOPRODUTOFORNECEDOR').AsString)+';'+
        '   DESCRICAOPRODUTO ='+ GetStr(CdsProdutos.FieldByName('NOME_PRODUTO').AsString)+';'+
        '   SELECT PF.IDPRODUTOFORNECEDOR'+
        '     FROM PRODUTOFORNECEDOR PF'+
        '    WHERE PF.IDPRODUTO = :IDPRODUTO'+
        '      AND PF.IDFORNECEDOR = :IDFORNECEDOR'+
        '     INTO :IDPRODUTOFORNECEDOR;'+
        '   IF (:IDPRODUTOFORNECEDOR IS NULL) THEN'+
        '    IDPRODUTOFORNECEDOR = GEN_ID(SEQ_IDPRODUTOFORNECEDOR,1);'+
        '   UPDATE OR INSERT INTO PRODUTOFORNECEDOR'+
        '             (IDPRODUTOFORNECEDOR, IDPRODUTO, IDFORNECEDOR,'+
        '             CODIGOPRODUTO, DATAULTIMACOMPRA, VALORUNITARIO,DESCRICAOPRODUTO)'+
        '      VALUES (:IDPRODUTOFORNECEDOR, :IDPRODUTO, :IDFORNECEDOR,'+
        '              :CODIGOPRODFORN, '+GetData(edtData.Date)+', :VALORUNITARIO,:DESCRICAOPRODUTO)MATCHING(IDPRODUTO, IDFORNECEDOR);'+
        ' END';
      Exec_SQL(StrSQL);
      CdsProdutos.Next;
    End;
    Commit;
    Avisa('Entrada grava com sucesso!');
    RestartaEntrada;
  except
    on E: Exception do
    Begin
      RollBack;
      raise;
    End;
  end;
end;

procedure TfrmEntradaEstoque.CalculaTotalNota;
begin
  if CdsEntrada.State in [dsInsert,dsEdit] then
    TRegrasEntradaMercadoria.CalculaTotalNotaEntrada(CdsEntrada,CdsProdutos);
end;

procedure TfrmEntradaEstoque.CdsEntradaAfterOpen(DataSet: TDataSet);
var
  I: Integer;
begin
  inherited;
  for I := 0 to CdsEntrada.FieldCount - 1 do
  Begin
    if CdsEntrada.Fields[i].DataType in [ftFloat, ftCurrency, ftBCD] then
      FormataMascara(CdsEntrada.Fields[i],tcMoeda);
  End;
  CdsEntrada.FieldByName('VALORFRETE').OnValidate := CdsEntradaValorValidate;
  CdsEntrada.FieldByName('VALORSEGURO').OnValidate := CdsEntradaValorValidate;
  CdsEntrada.FieldByName('VALOROUTRAS').OnValidate := CdsEntradaValorValidate;
  CdsEntrada.FieldByName('VALORDESCONTO').OnValidate := CdsEntradaValorValidate;
  CdsEntrada.FieldByName('FRETEPORCONTA').OnValidate := CdsEntradaValorValidate;
end;

procedure TfrmEntradaEstoque.CdsEntradaNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsEntrada.FieldByName('DATA').AsString := GetDataServidor;
  CdsEntrada.FieldByName('DATACRIACAO').AsString := GetDataServidor;
  CdsEntrada.FieldByName('IDEMPRESA').AsInteger := EdtEmpresa.ValorChaveInteger;
//  CdsEntrada.FieldByName('IDENTRADA').AsInteger := GetValSeq('SEQ_IDENTRADA',1);
end;

procedure TfrmEntradaEstoque.CdsEntradaValorValidate(Sender: TField);
begin
  inherited;
  CalculaTotalNota;
end;

procedure TfrmEntradaEstoque.CdsProdutosAfterOpen(DataSet: TDataSet);
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

procedure TfrmEntradaEstoque.CdsProdutosAfterPost(DataSet: TDataSet);
begin
  CalculaTotalNota;
end;

procedure TfrmEntradaEstoque.CdsProdutosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if CdsProdutos.FieldByName('NUMITEM').AsString <> '' then
    CdsSerial.Filter := 'IDENTRADAPRODUTO = '+CdsProdutos.FieldByName('NUMITEM').AsString;
  CdsSerial.Filtered := True;

end;

procedure TfrmEntradaEstoque.CdsProdutosNewRecord(DataSet: TDataSet);
begin
  inherited;
//  CdsProdutos.FieldByName('IDENTRADA').AsInteger := CdsEntrada.FieldByName('IDENTRADA').AsInteger;
//  CdsProdutos.FieldByName('IDENTRADAPRODUTO').AsInteger := GetValSeq('SEQ_IDENTRADAPRODUTO',0);
  CdsProdutos.FieldByName('IDCFOP').AsInteger := CdsEntrada.FieldByName('IDCFOP').AsInteger;
  CdsProdutos.FieldByName('NUMITEM').AsInteger := CdsProdutos.RecordCount+1;
end;

procedure TfrmEntradaEstoque.CdsProdutosValorValidate(Sender: TField);
begin
   TRegrasEntradaMercadoria.CalculaValoresItens(Sender);
end;

procedure TfrmEntradaEstoque.CdsSerialBeforePost(DataSet: TDataSet);
begin
  inherited;
  if ExisteRegistro(CdsSerial,'Serial',True,True) Then
  begin
    Avisa('O srial '+CdsSerial.FieldByName('serial').AsString+' já existe nessa nota');
    Abort ;
  end;
  IF GetTableCount('SERIALPRODUTO','*','IDPRODUTO = '+CdsProdutos.FieldByName('IDPRODUTO').AsString+
                   ' AND SERIAL = '+GetStr(CdsSerial.FieldByName('serial').AsString)+' and FLAGATIVO = ''Y''') > 0 Then
  begin
    Avisa('O srial '+CdsSerial.FieldByName('serial').AsString+' já existe no banco de dados');
    Abort ;
  end;

end;

procedure TfrmEntradaEstoque.CdsSerialNewRecord(DataSet: TDataSet);
begin
  inherited;
  if CdsSerial.RecordCount+1 > CdsProdutos.FieldByName('quantidade').AsInteger then
    Abort;

  CdsSerial.FieldByName('IDEMPRESA').Value := EdtEmpresa.ValorChave;
  CdsSerial.FieldByName('IDENTRADAPRODUTO').Value := CdsProdutos.FieldByName('NUMITEM').AsInteger;

end;

procedure TfrmEntradaEstoque.edtCodigoFornecedorBtnNovoClick(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroFornecedor(toIncluir);
end;

procedure TfrmEntradaEstoque.edtCodigoOperacaoRegAchado(
  const ValoresCamposEstra: array of Variant);
begin
  inherited;
  if ValoresCamposEstra[0] = 'F' then //FLAGTIPOPESSOA
  begin
    ConfiguraEditPesquisa(edtCodigoFornecedor, CdsEntrada, tpERPFornecedor);
    edtCodigoFornecedor.LblTitulo.Caption :='Fornecedor';
    TipoNota := tnEntradaDeFornecedor;
  end else
  if ValoresCamposEstra[0] = 'C' then //FLAGTIPOPESSOA
  begin
    ConfiguraEditPesquisa(edtCodigoFornecedor, CdsEntrada, tpERPCliente);
    edtCodigoFornecedor.LblTitulo.Caption :='Cliente';
    TipoNota := tnEntradaDeCliente;
  end;


end;

procedure TfrmEntradaEstoque.EdtEmpresaRegAchado(
  const ValoresCamposEstra: array of Variant);
begin
  inherited;
  UfEmpresa := VarToStr(ValoresCamposEstra[0]);
end;

procedure TfrmEntradaEstoque.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F4:
      btnIncProdutoClick(nil);
    vk_f5 :
      btnEditProdutoClick(nil);
    VK_DELETE :
    Begin
      if ssCtrl in Shift then
         btnDelProdutoClick(nil);
    End;
    VK_F9:
      btnGravarClick(nil);
    VK_F12:
      btnCancelarClick(nil);
    vk_Escape:
      Key := 0;
  end;
  inherited;

end;

procedure TfrmEntradaEstoque.FormShow(Sender: TObject);
begin
  inherited;
  if not(CdsEntrada.State in [dsEdit, dsInsert]) then
     RestartaEntrada;
end;

procedure TfrmEntradaEstoque.grpFretePorContaChange(Sender: TObject);
begin
  inherited;
  CalculaTotalNota;
end;

procedure TfrmEntradaEstoque.RestartaEntrada;
begin
  SetCds(CdsEntrada, tpERPEntrada,'1<>1');
  SetCds(CdsProdutos, tpERPEntradaProduto,'1<>1');
  SetCds(CdsSerial, tpERPSerialProdutoEntrada,'1<>1');

  CdsEntrada.Append;
  EdtEmpresa.CamposExtraPesquisa := 'UF';
  edtCodigoOperacao.CamposExtraPesquisa := 'FLAGTIPOPESSOA';

  ConfiguraEditPesquisa(edtCodigoOperacao, CdsEntrada, tpERPOperacaoEntrada);
  ConfiguraEditPesquisa(edtCodigoFornecedor, CdsEntrada, tpERPFornecedor);
  ConfiguraEditPesquisa(edtCodigoModelo, CdsEntrada, tpERPModeloNota);
  ConfiguraEditPesquisa(EdtEmpresa, CdsEntrada, tpERPEmpresa);

  ConfiguraEditPesquisa(edtCFOP, CdsEntrada, tpERPCFOP);
  edtCFOP.TamanhoCodigo := 4;
  edtCFOP.AutoPesquisa := True;
  edtCodigoModelo.TamanhoCodigo :=2;
  edtCodigoModelo.AutoPesquisa := True;
  edtCodigoOperacao.Localiza;
  edtCodigoModelo.Localiza;
  edtCodigoFornecedor.Localiza;
//  edtCodigoCFOP.Localiza;

//  StrSQL :=
//    'SELECT FIRST 1 ESTADO '+
//    '  FROM EMPRESA ';
//  UfEmpresa := GetValorCds(StrSQL);
//
//  StrSQL :=
//    'SELECT FIRST 1 UF.ALIQICMS '+
//    '  FROM EMPRESA E '+
//    ' INNER JOIN UF '+
//    '    ON (UF.CODUF = E.ESTADO )';
//  AliqICMSInterno := StrToCurrDef(GetValorCds(StrSQL),0);


end;

procedure TfrmEntradaEstoque.SetTipoNota(const Value: TTipoNota);
begin
  FTipoNota := Value;
end;

end.
