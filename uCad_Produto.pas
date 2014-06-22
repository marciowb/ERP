unit uCad_Produto;

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
  ExtCtrls, StdCtrls, Mask, DBCtrls, LabelDBEdit, EditPesquisa, cxCheckBox,
  cxDBEdit, cxTextEdit, cxMemo, cxRichEdit, cxDBRichEdit, cxImage, cxMaskEdit,
  cxDropDownEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmCad_Produto = class(TfrmCad_CadastroPaiERP)
    LabelDBEdit1: TLabelDBEdit;
    LabelDBEdit2: TLabelDBEdit;
    LabelDBEdit3: TLabelDBEdit;
    grpTipoProduto: TDBRadioGroup;
    edtLinha: TEditPesquisa;
    edtGrupo: TEditPesquisa;
    edtLocalizacao: TEditPesquisa;
    cxDBCheckBox1: TcxDBCheckBox;
    chkSerial: TcxDBCheckBox;
    chkLote: TcxDBCheckBox;
    cxTabSheet1: TcxTabSheet;
    edtFabricante: TEditPesquisa;
    edtFornecedor: TEditPesquisa;
    edtUnidade: TEditPesquisa;
    edtEstoqueMinimo: TLabelDBEdit;
    LabelDBEdit6: TLabelDBEdit;
    btnAjustaEstoque: TSpeedButton;
    GroupBox1: TGroupBox;
    cxDBRichEdit1: TcxDBRichEdit;
    LabelDBEdit4: TLabelDBEdit;
    GroupBox4: TGroupBox;
    LabelDBEdit7: TLabelDBEdit;
    LabelDBEdit8: TLabelDBEdit;
    LabelDBEdit9: TLabelDBEdit;
    LabelDBEdit10: TLabelDBEdit;
    LabelDBEdit11: TLabelDBEdit;
    cxTabSheet4: TcxTabSheet;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCodMunServico: TEditPesquisa;
    edtNCM: TEditPesquisa;
    cmbCST: TcxDBComboBox;
    cmbOrigem: TcxDBComboBox;
    cmbCSOSN: TcxDBComboBox;
    GroupBox7: TGroupBox;
    cxTabSheet8: TcxTabSheet;
    cxTabSheet7: TcxTabSheet;
    GroupBox2: TGroupBox;
    cxDBRichEdit2: TcxDBRichEdit;
    GroupBox3: TGroupBox;
    cxDBImage1: TcxDBImage;
    cxTabSheet2: TcxTabSheet;
    grpProcesso: TGroupBox;
    CdsProcessos: TpFIBClientDataSet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DataProcessos: TDataSource;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    DataSeriais: TDataSource;
    CdsSeriais: TpFIBClientDataSet;
    cxGrid2DBTableView1Column1: TcxGridDBColumn;
    cxGrid2DBTableView1Column2: TcxGridDBColumn;
    cxGrid2DBTableView1Column3: TcxGridDBColumn;
    procedure CdsCadastroAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure LabelDBEdit10Exit(Sender: TObject);
    procedure LabelDBEdit11Exit(Sender: TObject);
    procedure CdsCadastroAfterOpen(DataSet: TDataSet);
    procedure grpTipoProdutoClick(Sender: TObject);
    procedure CdsProcessosNewRecord(DataSet: TDataSet);
    procedure CdsProcessosBeforePost(DataSet: TDataSet);
    procedure CdsProcessosBeforeDelete(DataSet: TDataSet);
    procedure cxGrid1DBTableView1NavigatorButtonsButtonClick(Sender: TObject;
      AButtonIndex: Integer; var ADone: Boolean);
    procedure CdsCadastroAfterPost(DataSet: TDataSet);
    procedure edtLinhaBtnNovoClick(Sender: TObject);
    procedure edtGrupoBtnNovoClick(Sender: TObject);
    procedure edtLocalizacaoBtnNovoClick(Sender: TObject);
    procedure edtFabricanteBtnNovoClick(Sender: TObject);
    procedure edtFornecedorBtnNovoClick(Sender: TObject);
    procedure edtNCMBtnNovoClick(Sender: TObject);
  private
    { Private declarations }
    Procedure SetControlesServico;
  public
    { Public declarations }
  end;

var
  frmCad_Produto: TfrmCad_Produto;

implementation

uses MinhasClasses, Comandos, uRegras, uForms;

{$R *.dfm}

{ TfrmCad_Produto }

procedure TfrmCad_Produto.actGravarExecute(Sender: TObject);
begin
  {$Region 'Validações'}
   if CdsCadastro.FieldByName('TIPOPRODUTO').AsString = 'S' then
   begin
      VerificaEdit(edtCodMunServico,'O codigo municipal de serviço deve ser preenchido');
      edtNCM.Clear;
      CdsCadastro.FieldByName('ORIGEM').Clear;
      CdsCadastro.FieldByName('CST').Clear;
      CdsCadastro.FieldByName('CSOSN').Clear;
   end ELSE
   Begin
      VerificaEdit(edtNCM,'O NCM deve ser preenchido');
      CdsCadastro.FieldByName('IDCODIGOMUNICIPALSERVICO').Clear;
      if CdsCadastro.FieldByName('ORIGEM').AsString = '' then
      begin
        cmbOrigem.SetFocus;
        AvisaErro('O campo origem deve ser preenchido');
      end;
   End;

  {$EndRegion}

  inherited;

end;

procedure TfrmCad_Produto.CdsCadastroAfterOpen(DataSet: TDataSet);
begin
  inherited;
  FormataMascara(CdsCadastro.FieldByName('MARKUP'),tcPercent);
  FormataMascara(CdsCadastro.FieldByName('PRECO'),tcReal);
  FormataMascara(CdsCadastro.FieldByName('CUSTOATUAL'),tcReal);
  FormataMascara(CdsCadastro.FieldByName('CUSTOMEDIO'),tcMoeda);
  FormataMascara(CdsCadastro.FieldByName('CUSTOCONTABIL'),tcMoeda);

end;

procedure TfrmCad_Produto.CdsCadastroAfterPost(DataSet: TDataSet);
begin
  inherited;
  SetRegistros(CdsProcessos,tpERPProdutoProcessosservico);
end;

procedure TfrmCad_Produto.CdsCadastroAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SetControlesServico;
  SetCds(CdsProcessos,tpERPProdutoProcessosservico,'PS.IDPRODUTO = '+ValorChave);
  SetCds(CdsSeriais,tpERPSerialProduto,'IDPRODUTO = '+ValorChave);
end;


Procedure TfrmCad_Produto.grpTipoProdutoClick(Sender: TObject);
begin
  inherited;
  SetControlesServico;
end;

procedure TfrmCad_Produto.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPesquisa := tpERPProduto;

end;

procedure TfrmCad_Produto.FormShow(Sender: TObject);
begin
  inherited;
  ConfiguraEditPesquisa(edtLinha,CdsCadastro,tpERPLinha);
  ConfiguraEditPesquisa(edtFornecedor,CdsCadastro,tpERPFornecedor);
  ConfiguraEditPesquisa(edtFabricante,CdsCadastro,tpERPFabricante);
  ConfiguraEditPesquisa(edtUnidade,CdsCadastro,tpERPUnidade);
  ConfiguraEditPesquisa(edtNCM,CdsCadastro,tpERPNCM);
  ConfiguraEditPesquisa(edtGrupo,CdsCadastro,tpERPGrupo);
  ConfiguraEditPesquisa(edtLocalizacao,CdsCadastro,tpERPLocalizacao);
  ConfiguraEditPesquisa(edtCodMunServico,CdsCadastro,tpERPCodigoMunicipalServico);
  edtNCM.AutoCompletar := False;
  edtCodMunServico.SQLComp := 'flagtipo = ''S''';
  SetControlesServico;

end;

procedure TfrmCad_Produto.LabelDBEdit10Exit(Sender: TObject);
begin
  inherited;
  CdsCadastro.FieldByName('PRECO').AsCurrency :=  TRegreasProdutos.CalculaPrecoVenda(CdsCadastro.FieldByName('CUSTOATUAL').AsCurrency, CdsCadastro.FieldByName('MARKUP').AsCurrency);
end;

procedure TfrmCad_Produto.LabelDBEdit11Exit(Sender: TObject);
begin
  inherited;
  CdsCadastro.FieldByName('MARKUP').AsCurrency :=  TRegreasProdutos.CalculaMarkupPeloPrecoVenda(CdsCadastro.FieldByName('CUSTOATUAL').AsCurrency, CdsCadastro.FieldByName('PRECO').AsCurrency);
end;

procedure TfrmCad_Produto.SetControlesServico;
var
  Produto: Boolean;
begin
  Produto:= grpTipoProduto.ItemIndex > 0;

  edtLinha.Enabled :=  Produto;
  edtFabricante.Enabled :=  Produto;
  edtFornecedor.Enabled :=  Produto;
  edtUnidade.Enabled :=  Produto;
  edtNCM.Enabled :=  Produto;
  edtCodMunServico.Enabled := not Produto;
  edtLinha.Enabled :=  Produto;
  edtGrupo.Enabled :=  Produto;
  edtLocalizacao.Enabled :=  Produto;

  chkSerial.Enabled :=  Produto;
  chkLote.Enabled :=  Produto;
  cmbCST.Enabled :=  Produto;
  cmbOrigem.Enabled :=  Produto;
  cmbCSOSN.Enabled :=  Produto;
  btnAjustaEstoque.Enabled :=  Produto;
  edtEstoqueMinimo.Enabled :=  Produto;
  grpProcesso.Enabled :=  not Produto;


end;

procedure TfrmCad_Produto.CdsProcessosBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  CdsProcessos.Edit;
  CdsProcessos.FieldByName('flagedicao').Value := 'D';
  CdsProcessos.Post;
  Abort;
end;

procedure TfrmCad_Produto.CdsProcessosBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CdsProcessos.FieldByName('flagedicao').Value = 'N' then
     CdsProcessos.FieldByName('flagedicao').Value := 'E';
  if CdsProcessos.FieldByName('IDPRODUTO').AsString = '' then
     CdsProcessos.Cancel;
end;

procedure TfrmCad_Produto.CdsProcessosNewRecord(DataSet: TDataSet);
begin
  inherited;
  MudaEstado;
  CdsProcessos.FieldByName('IDPRODUTOPROCESSODESERVICO').Value := GetCodigo(tpERPProdutoProcessosservico);
  CdsProcessos.FieldByName('IDPRODUTO').Value := ValorChave;
  CdsProcessos.FieldByName('flagedicao').Value := 'I';
end;

procedure TfrmCad_Produto.cxGrid1DBTableView1NavigatorButtonsButtonClick(
  Sender: TObject; AButtonIndex: Integer; var ADone: Boolean);
begin
  inherited;
  if (AButtonIndex = 6) or (AButtonIndex = 9) then// Novo ou editar
  begin
    AdicionaListaPesquisa(CdsProcessos,tpERPProcessosservico,'Esse processo já foi adicionado','');
    Abort;
  end;
end;

procedure TfrmCad_Produto.edtFabricanteBtnNovoClick(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroFabricante(toIncluir);
end;

procedure TfrmCad_Produto.edtFornecedorBtnNovoClick(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroFornecedor(toIncluir);
end;

procedure TfrmCad_Produto.edtGrupoBtnNovoClick(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroGrupo(toIncluir);
end;

procedure TfrmCad_Produto.edtLinhaBtnNovoClick(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroLinha(toIncluir);
end;

procedure TfrmCad_Produto.edtLocalizacaoBtnNovoClick(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroLocalizacao(toIncluir);
end;

procedure TfrmCad_Produto.edtNCMBtnNovoClick(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroNCM(toIncluir);
end;

end.
