unit Cad_Cliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, ComCtrls, DB, DBClient, pFIBClientDataSet, ActnList,
  cxPC, cxContainer, cxTreeView, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls,
  LabelDBEdit, EditPesquisa, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,MinhasClasses,
  Cad_CadastroPai, Menus, uCad_CadastroPaiERP, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter;

type
  TfrmCad_Cliente = class(TfrmCad_CadastroPaiERP)
    LabelDBEdit1: TLabelDBEdit;
    edtNome: TLabelDBEdit;
    LabelDBEdit7: TLabelDBEdit;
    LabelDBEdit8: TLabelDBEdit;
    LabelDBEdit9: TLabelDBEdit;
    LabelDBEdit10: TLabelDBEdit;
    GroupBox1: TGroupBox;
    edtBairro: TLabelDBEdit;
    edtCidade: TLabelDBEdit;
    edtUf: TLabelDBEdit;
    edtNumero: TLabelDBEdit;
    LabelDBEdit12: TLabelDBEdit;
    grpTipoPessoa: TDBRadioGroup;
    pnlJuridica: TPanel;
    LabelDBEdit2: TLabelDBEdit;
    LabelDBEdit13: TLabelDBEdit;
    LabelDBEdit14: TLabelDBEdit;
    LabelDBEdit15: TLabelDBEdit;
    pnlFisica: TPanel;
    LabelDBEdit3: TLabelDBEdit;
    LabelDBEdit4: TLabelDBEdit;
    LabelDBEdit5: TLabelDBEdit;
    LabelDBEdit6: TLabelDBEdit;
    LabelDBEdit16: TLabelDBEdit;
    edtLogradouro: TLabelDBEdit;
    edtPesqCEP: TSpeedButton;
    edtCEP: TLabelDBEdit;
    actIntegracao: TAction;
    actIntServicos: TAction;
    GroupBox2: TGroupBox;
    DBMemo1: TDBMemo;
    LabelDBEdit11: TLabelDBEdit;
    cxTabSheet1: TcxTabSheet;
    edtGrupoCliente: TEditPesquisa;
    procedure FormCreate(Sender: TObject);
    procedure CdsCadastroAfterOpen(DataSet: TDataSet);
    procedure CdsCadastroNewRecord(DataSet: TDataSet);
    procedure actNovoExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grpTipoPessoaChange(Sender: TObject);
    procedure edtPesqCEPClick(Sender: TObject);
    procedure edtCEPExit(Sender: TObject);
    procedure actIntegracaoExecute(Sender: TObject);
    procedure edtGrupoClienteBtnNovoClick(Sender: TObject);
    procedure edtGrupoClienteBtnPesquisaClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    Procedure ABrePesquisaCep(pCep: String = '');
    Procedure AtualizaPermissoes;
  end;

var
  frmCad_Cliente: TfrmCad_Cliente;

implementation

uses  Comandos, UDmConexao, uPesquisa_kimera , uForms;

{$R *.dfm}

procedure TfrmCad_Cliente.ABrePesquisaCep(pCep: String);
begin
  MudaEstado;
  Try
    frmPesquisa:= TfrmPesquisa.Create(nil);
    frmPesquisa.TipoPesquisa := tpImoCEP;
    frmPesquisa.edtPesquisa.Text := pCep;
    if frmPesquisa.ShowModal = mrOk Then
    Begin
      CdsCadastro.FieldByName('CEP').AsString :=     frmPesquisa.cdsPesquisa.FieldByName('CEP').AsString;
      CdsCadastro.FieldByName('LOGRADOURO').AsString :=     frmPesquisa.cdsPesquisa.FieldByName('LOGRADOURO').AsString;
      CdsCadastro.FieldByName('BAIRRO').AsString := frmPesquisa.cdsPesquisa.FieldByName('BAIRRO').AsString;
      CdsCadastro.FieldByName('CIDADE').AsString := frmPesquisa.cdsPesquisa.FieldByName('CIDADE').AsString;
      CdsCadastro.FieldByName('UF').AsString :=     frmPesquisa.cdsPesquisa.FieldByName('UF').AsString;

    End;
  Finally
    FreeAndNil(frmPesquisa);
  End;

end;

procedure TfrmCad_Cliente.actIntegracaoExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmCad_Cliente.actNovoExecute(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmCad_Cliente.AtualizaPermissoes;
begin
  inherited;
//  actNovo.Visible := GetPermissao(IdCadastroClienteNovo);
//  actEditar.Visible := GetPermissao(IdCadastroClienteEditar);
//  actDeletar.Visible := GetPermissao(IdCadastroClienteExcluir);
//  actIntegracao.Visible := GetPermissao(IdListagemServico)
end;

procedure TfrmCad_Cliente.CdsCadastroAfterOpen(DataSet: TDataSet);
begin
  inherited;

  FormataMascara(CdsCadastro.FieldByName('CPF'),tcCPF);
  FormataMascara(CdsCadastro.FieldByName('CNPJ'),tcCNPJ);
  FormataMascara(CdsCadastro.FieldByName('DATANASCIMENTO'),tcCampoData);
  FormataMascara(CdsCadastro.FieldByName('DATAEMISSAO'),tcCampoData);
  FormataMascara(CdsCadastro.FieldByName('CEP'),tcCEP);

end;

procedure TfrmCad_Cliente.CdsCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsCadastro.FieldByName('FLAGTIPOPESSOA').AsString := 'J';
  CdsCadastro.FieldByName('DATACADASTRO').AsString := GetDataServidor;
end;

procedure TfrmCad_Cliente.grpTipoPessoaChange(Sender: TObject);
begin
  inherited;
  pnlJuridica.Visible := grpTipoPessoa.ItemIndex = 1; //CdsCadastro.FieldByName('FLAGTIPOPESSOA').AsString = 'J';
  pnlFisica.Visible := not pnlJuridica.Visible ;
end;

procedure TfrmCad_Cliente.edtCEPExit(Sender: TObject);
begin
  inherited;
  if Pergunta('Deseja pesquisar o CEP?') then
    AbrePesquisaCep(edtCEP.Text);
end;

procedure TfrmCad_Cliente.edtGrupoClienteBtnNovoClick(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroGrupoCliente(toIncluir)
end;

procedure TfrmCad_Cliente.edtGrupoClienteBtnPesquisaClick(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroGrupoCliente(toEditar)
end;

procedure TfrmCad_Cliente.edtPesqCEPClick(Sender: TObject);
begin
  inherited;
  edtGrupoCliente.ValorChave := TrotinasForms.AbreCadastroGrupoCliente;
  edtGrupoCliente.Localiza;
end;

procedure TfrmCad_Cliente.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPesquisa := tpERPCliente;
  VerificaEdits := True;

end;

procedure TfrmCad_Cliente.FormShow(Sender: TObject);
begin
  inherited;
  ConfiguraEditPesquisa(edtGrupoCliente,CdsCadastro, tpERPGrupoCliente,False,'','','CODIGO','',6,nil);
  if NovoReg or EditReg then
    edtNome.SetFocus;
end;

end.
