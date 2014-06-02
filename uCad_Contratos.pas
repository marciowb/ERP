unit uCad_Contratos;

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
  ExtCtrls, DBCtrls, LabelDBEdit, StdCtrls, Mask, EditPesquisa, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxMemo, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid;

type
  TfrmCad_Contrato = class(TfrmCad_CadastroPaiERP)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtData: TcxDBDateEdit;
    edtEmpresa: TEditPesquisa;
    LabelDBEdit1: TLabelDBEdit;
    edtCliente: TEditPesquisa;
    edtPeriodoVigenciaContrato: TEditPesquisa;
    edtPeriodoVisitaContrato: TEditPesquisa;
    edtValidadeContrato: TcxDBDateEdit;
    DBCheckBox1: TDBCheckBox;
    edtTipoContrato: TEditPesquisa;
    edtCondPagamento: TEditPesquisa;
    pageOpcoes: TcxPageControl;
    tsProduto: TcxTabSheet;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    cxGrid1: TcxGrid;
    tvItens: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    tsObs: TcxTabSheet;
    cxDBMemo1: TcxDBMemo;
    tsEquipamentos: TcxTabSheet;
    actIncluirServico: TAction;
    actAlterarServico: TAction;
    actExcluirServico: TAction;
    DataServicos: TDataSource;
    CdsServicos: TpFIBClientDataSet;
    tvItensColumn1: TcxGridDBColumn;
    tvItensColumn2: TcxGridDBColumn;
    tvItensColumn3: TcxGridDBColumn;
    Panel5: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    CdsEquipamentos: TpFIBClientDataSet;
    DataEquipamento: TDataSource;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    actIncluirEquipamento: TAction;
    actEditarEquipamento: TAction;
    acExcluirEquipamento: TAction;
    procedure actIncluirServicoExecute(Sender: TObject);
    procedure actAlterarServicoExecute(Sender: TObject);
    procedure actExcluirServicoExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPeriodoVigenciaContratoRegAchado(ADataSet: TDataSet);
    procedure CdsCadastroAfterScroll(DataSet: TDataSet);
    procedure CdsCadastroAfterPost(DataSet: TDataSet);
    procedure CdsServicosNewRecord(DataSet: TDataSet);
    procedure CdsServicosBeforePost(DataSet: TDataSet);
    procedure CdsEquipamentosBeforePost(DataSet: TDataSet);
    procedure CdsEquipamentosNewRecord(DataSet: TDataSet);
    procedure actIncluirEquipamentoExecute(Sender: TObject);
    procedure actEditarEquipamentoExecute(Sender: TObject);
    procedure acExcluirEquipamentoExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtClienteBtnNovoClick(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FidProposta: Integer;
    procedure SetidProposta(const Value: Integer);
    { Private declarations }
    procedure ConverteProposta;
  public
    { Public declarations }
    property idProposta: Integer read FidProposta write SetidProposta;
  end;

var
  frmCad_Contrato: TfrmCad_Contrato;

implementation

uses UDmConexao, Comandos, uForms, MinhasClasses, uRegras, uDlg_ServicoContrato,
  uDlgEquipamentoClienteContrato;
{$R *.dfm}

procedure TfrmCad_Contrato.acExcluirEquipamentoExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaDel then
  begin
    MudaEstado;
    CdsEquipamentos.Edit;
    CdsEquipamentos.FieldByName('FLAGEDICAO').AsString := 'D';
    CdsEquipamentos.Post;
  end;
end;

procedure TfrmCad_Contrato.actAlterarServicoExecute(Sender: TObject);
begin
  inherited;
  MudaEstado;
  frmDlg_ServicoContrato := tfrmDlg_ServicoContrato.Create(NIL);
  try
    frmDlg_ServicoContrato.IdCliente := edtCliente.ValorChaveInteger;
    frmDlg_ServicoContrato.IdEmpresa := edtEmpresa.ValorChaveInteger;
    frmDlg_ServicoContrato.Data := edtData.Date;
    frmDlg_ServicoContrato.pDataSet := CdsServicos;
    frmDlg_ServicoContrato.FechaEGrava := True;
    frmDlg_ServicoContrato.pDataSet.Edit;
    frmDlg_ServicoContrato.ShowModal;
  finally
    FreeAndNil(frmDlg_ServicoContrato);
  end;
end;

procedure TfrmCad_Contrato.actEditarEquipamentoExecute(Sender: TObject);
begin
  inherited;
  MudaEstado;
  frmDlg_EquipamentoClienteContrato := TfrmDlg_EquipamentoClienteContrato.Create(NIL);
  try
    frmDlg_EquipamentoClienteContrato.IdCliente := edtCliente.ValorChaveInteger;
    frmDlg_EquipamentoClienteContrato.pDataSet := CdsEquipamentos;
    frmDlg_EquipamentoClienteContrato.FechaEGrava := False;
    frmDlg_EquipamentoClienteContrato.pDataSet.Edit;
    frmDlg_EquipamentoClienteContrato.ShowModal;
  finally
    FreeAndNil(frmDlg_EquipamentoClienteContrato);
  end;

end;

procedure TfrmCad_Contrato.actExcluirServicoExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaDel then
  begin
    MudaEstado;
    CdsServicos.Edit;
    CdsServicos.FieldByName('FLAGEDICAO').AsString := 'D';
    CdsServicos.Post;
  end;
end;

procedure TfrmCad_Contrato.actGravarExecute(Sender: TObject);
var
 Tot: Currency;
begin
  VerificaEdit(edtCliente,'Infome o cliente');
  VerificaEdit(edtEmpresa,'Infome a empresa');
  VerificaEdit(edtTipoContrato,'Infome o tipo de contrato');
  VerificaEdit(edtCondPagamento,'Infome a condição de pagamento');

  if CdsServicos.IsEmpty then
  begin
    Avisa('Deve ser informado palo menos um serviço.');
    Exit;
  end;
  if CdsEquipamentos.IsEmpty then
  begin
    if Pergunta('Não foi informado um produto do cliente. Deseja continuar? ') Then
      Exit;
  end;
  Tot := 0;
  CdsServicos.First;
  while not CdsServicos.Eof do
  begin
    Tot := ToT+CdsServicos.FieldByName('VALORTOTAL').AsCurrency;
    CdsServicos.Next;
  end;
  CdsCadastro.FieldByName('VALORTOTAL').AsCurrency := Tot;
  inherited;

end;

procedure TfrmCad_Contrato.actIncluirEquipamentoExecute(Sender: TObject);
begin
  inherited;
  MudaEstado;
  frmDlg_EquipamentoClienteContrato := TfrmDlg_EquipamentoClienteContrato.Create(NIL);
  try
    frmDlg_EquipamentoClienteContrato.IdCliente := edtCliente.ValorChaveInteger;
    frmDlg_EquipamentoClienteContrato.pDataSet := CdsEquipamentos;
    frmDlg_EquipamentoClienteContrato.FechaEGrava := False;
    frmDlg_EquipamentoClienteContrato.pDataSet.Append;
    frmDlg_EquipamentoClienteContrato.ShowModal;
  finally
    FreeAndNil(frmDlg_EquipamentoClienteContrato);
  end;

end;

procedure TfrmCad_Contrato.actIncluirServicoExecute(Sender: TObject);
begin
  inherited;
  MudaEstado;
  frmDlg_ServicoContrato := tfrmDlg_ServicoContrato.Create(NIL);
  try
    frmDlg_ServicoContrato.IdCliente := edtCliente.ValorChaveInteger;
    frmDlg_ServicoContrato.IdEmpresa := edtEmpresa.ValorChaveInteger;
    frmDlg_ServicoContrato.Data := edtData.Date;
    frmDlg_ServicoContrato.pDataSet := CdsServicos;
    frmDlg_ServicoContrato.FechaEGrava := True;
    frmDlg_ServicoContrato.pDataSet.Append;
    frmDlg_ServicoContrato.ShowModal;
  finally
    FreeAndNil(frmDlg_ServicoContrato);
  end;
end;

procedure TfrmCad_Contrato.CdsCadastroAfterPost(DataSet: TDataSet);
begin
  inherited;
  SetRegistros(CdsServicos, tpERPServicoContrato);
  SetRegistros(CdsEquipamentos, tpERPClienteEquipamentoContrato);
end;

procedure TfrmCad_Contrato.CdsCadastroAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SetCds(CdsServicos, tpERPServicoContrato, 'IDCONTRATO = ' + ValorChave);
  SetCds(CdsEquipamentos, tpERPClienteEquipamentoContrato, 'IDCONTRATO = ' + ValorChave);

end;

procedure TfrmCad_Contrato.CdsEquipamentosBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CdsEquipamentos.FieldByName('FLAGEDICAO').AsString= 'N' then
    CdsEquipamentos.FieldByName('FLAGEDICAO').AsString := 'E';

end;

procedure TfrmCad_Contrato.CdsEquipamentosNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsEquipamentos.FieldByName('idcontrato').Value := ValorChave;
  CdsEquipamentos.FieldByName('IDCONTRATOEQUIPAMENTOCLIENTE').AsString := GetCodigo(tpERPClienteEquipamentoContrato);
  CdsEquipamentos.FieldByName('FLAGEDICAO').AsString := 'I';

end;

procedure TfrmCad_Contrato.CdsServicosBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CdsServicos.FieldByName('FLAGEDICAO').AsString= 'N' then
    CdsServicos.FieldByName('FLAGEDICAO').AsString := 'E';
end;

procedure TfrmCad_Contrato.CdsServicosNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsServicos.FieldByName('idcontrato').Value := ValorChave;
  CdsServicos.FieldByName('IDCONTRATOPRODUTOS').AsString := GetCodigo(tpERPServicoContrato);
  CdsServicos.FieldByName('FLAGEDICAO').AsString := 'I';
  CdsServicos.FieldByName('QUANTIDADE').AsCurrency := 1;
end;

procedure TfrmCad_Contrato.ConverteProposta;
var
  CdsTemp: TpFIBClientDataSet;
begin
  Try
    CdsTemp := TpFIBClientDataSet.Create(nil);
    SetCds(CdsTemp,tpERPProposta,'IDPROPOSTA = '+IntToStr(idProposta));
    CdsCadastro.FieldByName('IDEMPRESA').Value := CdsTemp.FieldByName('IDEMPRESA').Value;
    CdsCadastro.FieldByName('IDCLIENTE').Value := CdsTemp.FieldByName('IDCLIENTE').Value;
    CdsCadastro.FieldByName('DATA').Value := CdsTemp.FieldByName('DATA').Value;
    CdsCadastro.FieldByName('IDPERIODICIDADEVIGENCIA').Value := CdsTemp.FieldByName('IDPERIDOVIGENCIACONTRATO').Value;
    CdsCadastro.FieldByName('IDPERIODICIDADEVISITA').Value := CdsTemp.FieldByName('IDPERIODICIDADEVISITACONTRATO').Value;
    CdsCadastro.FieldByName('OBS').Value := CdsTemp.FieldByName('OBS').Value;
    CdsCadastro.FieldByName('IDPROPOSTA').Value := CdsTemp.FieldByName('IDPROPOSTA').Value;
    SetCds(CdsTemp,tpERPCondicaoPagamentoProposta,'IDPROPOSTA = '+IntToStr(idProposta));
    CdsCadastro.FieldByName('IDCONDICAOPAGAMENTO').Value := CdsTemp.FieldByName('IDCONDICAOPAGAMENTO').Value;
    SetCds(CdsTemp,tpERPItemProposta,'IDPROPOSTA = '+IntToStr(idProposta)+' and P.TIPOPRODUTO = ''S'' ');
    CdsTemp.First;
    while not CdsTemp.Eof do
    begin
      CdsServicos.Append;
      CdsServicos.FieldByName('IDPRODUTO').Value := CdsTemp.FieldByName('IDPRODUTO').Value;
      CdsServicos.FieldByName('CODIGO').Value := CdsTemp.FieldByName('CODIGO').Value;
      CdsServicos.FieldByName('DESCRICAO').Value := CdsTemp.FieldByName('DESCRICAO').Value;
      CdsServicos.FieldByName('VALORUNITARIO').Value := CdsTemp.FieldByName('VALORUNITARIO').Value;
      CdsServicos.FieldByName('VALORDESCONTO').Value := CdsTemp.FieldByName('VALORDESCONTO').Value;
      CdsServicos.FieldByName('VALORACRESCIMO').Value := CdsTemp.FieldByName('VALORACRESCIMO').Value;
      CdsServicos.FieldByName('VALORTOTAL').Value := CdsTemp.FieldByName('VALORTOTAL').Value;
      CdsServicos.FieldByName('OBS').Value := CdsTemp.FieldByName('OBS').Value;
      CdsServicos.FieldByName('ALIQDESCONTO').Value := CdsTemp.FieldByName('ALIQDESCONTO').Value;
      CdsServicos.FieldByName('ALIQACRESCIMO').Value := CdsTemp.FieldByName('ALIQACRESCIMO').Value;
      CdsServicos.FieldByName('SUBTOTAL').Value := CdsTemp.FieldByName('SUBTOTAL').Value;
      CdsServicos.Post;
      CdsTemp.Next;
    end;

  Finally
    FreeAndNil(CdsTemp);
  End;

end;

procedure TfrmCad_Contrato.edtClienteBtnNovoClick(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroCliente(toIncluir);
end;

procedure TfrmCad_Contrato.edtPeriodoVigenciaContratoRegAchado
  (ADataSet: TDataSet);
begin
  inherited;
  if CdsCadastro.State in [dsInsert, dsEdit] then
  begin
     CdsCadastro.FieldByName('DATATERMINO').AsDateTime := TRegrasPeriodo.GetDataFinal(CdsCadastro.FieldByName('DATA').AsDateTime,
                                                                                        edtPeriodoVigenciaContrato.ValorChaveInteger);
  end;

end;

procedure TfrmCad_Contrato.FormCreate(Sender: TObject);
begin
  inherited;
  idProposta := -1;
  TipoPesquisa := tpERPContrato;
end;

procedure TfrmCad_Contrato.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    vk_F10:
      pageOpcoes.ActivePage := tsProduto;
    vk_F12:
      pageOpcoes.ActivePage := tsEquipamentos;
    Ord('Q'),Ord('q'):
    begin
      if  ssCtrl in Shift then
        pageOpcoes.ActivePage := tsObs;
    end;

  end;
end;

procedure TfrmCad_Contrato.FormShow(Sender: TObject);
begin
  inherited;
  ConfiguraEditPesquisa(edtEmpresa, CdsCadastro, tpERPEmpresa, True);
  ConfiguraEditPesquisa(edtCliente, CdsCadastro, tpERPCliente, True);
  ConfiguraEditPesquisa(edtPeriodoVigenciaContrato, CdsCadastro,
    tpERPPeridicidade, False, '', '', 'CODIGO', 'IDPERIODICIDADEVIGENCIA');
  ConfiguraEditPesquisa(edtPeriodoVisitaContrato, CdsCadastro,
    tpERPPeridicidade, False, '', '', 'CODIGO', 'IDPERIODICIDADEVISITA');
  ConfiguraEditPesquisa(edtTipoContrato, CdsCadastro, tpERPTipoContrato);
  ConfiguraEditPesquisa(edtCondPagamento, CdsCadastro, tpERPCondicaoPagamento);
  if (NovoReg) and (idProposta >0 )  then
    ConverteProposta;
  edtEmpresa.SetFocus;
end;

procedure TfrmCad_Contrato.SetidProposta(const Value: Integer);
begin
  FidProposta := Value;
end;

end.
