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
    edtLogradouro: TLabelDBEdit;
    edtPesqCEP: TSpeedButton;
    edtCEP: TLabelDBEdit;
    actIntegracao: TAction;
    actIntServicos: TAction;
    GroupBox2: TGroupBox;
    DBMemo1: TDBMemo;
    LabelDBEdit11: TLabelDBEdit;
    cxTabSheet1: TcxTabSheet;
    Panel2: TPanel;
    edtGrupoCliente: TEditPesquisa;
    cxTabSheet2: TcxTabSheet;
    GroupBox3: TGroupBox;
    Panel4: TPanel;
    LabelDBEdit1: TLabelDBEdit;
    edtNome: TLabelDBEdit;
    LabelDBEdit16: TLabelDBEdit;
    LabelDBEdit7: TLabelDBEdit;
    TvEquipamentos: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DataEquipamentos: TDataSource;
    CdsEquipamentos: TpFIBClientDataSet;
    vEquipamentosColumn1: TcxGridDBColumn;
    vEquipamentosColumn2: TcxGridDBColumn;
    Panel5: TPanel;
    actNovoEquipamento: TAction;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    actAlterar: TAction;
    actExcluir: TAction;
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
    procedure CdsCadastroAfterScroll(DataSet: TDataSet);
    procedure actNovoEquipamentoExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure CdsEquipamentosNewRecord(DataSet: TDataSet);
    procedure CdsEquipamentosBeforePost(DataSet: TDataSet);
    procedure CdsCadastroAfterPost(DataSet: TDataSet);
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

uses  Comandos, UDmConexao, uPesquisa_kimera , uForms, uDlg_EquipamentoCliente;

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

procedure TfrmCad_Cliente.actAlterarExecute(Sender: TObject);
begin
  inherited;
  Try
    MudaEstado;
    frmDlg_EquipamentoCliente := TfrmDlg_EquipamentoCliente.Create(nil);
    frmDlg_EquipamentoCliente.UsaDataSetInterno := False;
    frmDlg_EquipamentoCliente.pDataSet := CdsEquipamentos;
    frmDlg_EquipamentoCliente.FechaEGrava := True;
    frmDlg_EquipamentoCliente.pDataSet.Edit;
    frmDlg_EquipamentoCliente.ShowModal;
  Finally
    FreeAndNil(frmDlg_EquipamentoCliente);
  End;
end;

procedure TfrmCad_Cliente.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaDel then
  begin
     CdsEquipamentos.Edit;
     CdsEquipamentos.FieldByName('flagedicao').Value := 'D';
     CdsEquipamentos.Post;
  end;
end;

procedure TfrmCad_Cliente.actIntegracaoExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmCad_Cliente.actNovoEquipamentoExecute(Sender: TObject);
begin
  inherited;
  Try
    MudaEstado;
    frmDlg_EquipamentoCliente := TfrmDlg_EquipamentoCliente.Create(nil);
    frmDlg_EquipamentoCliente.UsaDataSetInterno := False;
    frmDlg_EquipamentoCliente.pDataSet := CdsEquipamentos;
    frmDlg_EquipamentoCliente.FechaEGrava := True;
    frmDlg_EquipamentoCliente.pDataSet.Append;
    frmDlg_EquipamentoCliente.ShowModal;

  Finally
    FreeAndNil(frmDlg_EquipamentoCliente);
  End;
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

procedure TfrmCad_Cliente.CdsCadastroAfterPost(DataSet: TDataSet);
begin
  inherited;
  SetRegistros(CdsEquipamentos, tpERPClienteEquipamento);
end;

procedure TfrmCad_Cliente.CdsCadastroAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SetCds(CdsEquipamentos,tpERPClienteEquipamento,'idcliente = '+ValorChave);
end;

procedure TfrmCad_Cliente.CdsCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsCadastro.FieldByName('FLAGTIPOPESSOA').AsString := 'J';
  CdsCadastro.FieldByName('DATACADASTRO').AsString := GetDataServidor;
end;

procedure TfrmCad_Cliente.CdsEquipamentosBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CdsEquipamentos.FieldByName('flagedicao').Value = 'N' then
    CdsEquipamentos.FieldByName('flagedicao').Value := 'E';
end;

procedure TfrmCad_Cliente.CdsEquipamentosNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsEquipamentos.FieldByName('IDCLIENTEEQUIPAMENTOS').Value := GetCodigo(tpERPClienteEquipamento);
  CdsEquipamentos.FieldByName('IDCLIENTE').Value := ValorChave;
  CdsEquipamentos.FieldByName('flagedicao').Value := 'I';
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
