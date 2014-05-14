unit uCad_proposta;

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
  ExtCtrls, StdCtrls, Mask, DBCtrls, LabelDBEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, EditPesquisa, cxGroupBox, cxRadioGroup,
  cxMemo, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid,Math;

type
  TfrmCad_Proposta = class(TfrmCad_CadastroPaiERP)
    Panel2: TPanel;
    cxDBDateEdit1: TcxDBDateEdit;
    Label1: TLabel;
    edtEmpresa: TEditPesquisa;
    LabelDBEdit1: TLabelDBEdit;
    edtCliente: TEditPesquisa;
    grpFinalidadeProposta: TcxDBRadioGroup;
    edtPeriodoVigenciaContrato: TEditPesquisa;
    edtPeriodoVisitaContrato: TEditPesquisa;
    cxDBDateEdit2: TcxDBDateEdit;
    Label2: TLabel;
    pageOpcoes: TcxPageControl;
    tsProduto: TcxTabSheet;
    tsPagamento: TcxTabSheet;
    tsObs: TcxTabSheet;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    actIncluir: TAction;
    actExcluir: TAction;
    actAlterar: TAction;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    tvItens: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DataItens: TDataSource;
    CdsItens: TpFIBClientDataSet;
    tvItensColumn1: TcxGridDBColumn;
    tvItensColumn2: TcxGridDBColumn;
    tvItensColumn3: TcxGridDBColumn;
    tvItensColumn4: TcxGridDBColumn;
    tvItensColumn5: TcxGridDBColumn;
    tvItensColumn6: TcxGridDBColumn;
    Panel5: TPanel;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    CdsPagamento: TpFIBClientDataSet;
    DataPagamento: TDataSource;
    cxGrid2DBTableView1Column1: TcxGridDBColumn;
    cxGrid2DBTableView1Column2: TcxGridDBColumn;
    cxDBMemo1: TcxDBMemo;
    BitBtn4: TBitBtn;
    actIncluirPagamento: TAction;
    BitBtn5: TBitBtn;
    actAlterarPagamento: TAction;
    actApagarPagamento: TAction;
    BitBtn6: TBitBtn;
    CdsParcelasPagamento: TpFIBClientDataSet;
    DataParcelasPagamento: TDataSource;
    GroupBox1: TGroupBox;
    LabelDBEdit2: TLabelDBEdit;
    LabelDBEdit3: TLabelDBEdit;
    LabelDBEdit4: TLabelDBEdit;
    LabelDBEdit5: TLabelDBEdit;
    LabelDBEdit6: TLabelDBEdit;
    LabelDBEdit7: TLabelDBEdit;
    procedure grpFinalidadePropostaPropertiesChange(Sender: TObject);
    procedure CdsCadastroAfterScroll(DataSet: TDataSet);
    procedure actIncluirExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actIncluirPagamentoExecute(Sender: TObject);
    procedure actAlterarPagamentoExecute(Sender: TObject);
    procedure actApagarPagamentoExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CdsCadastroNewRecord(DataSet: TDataSet);
    procedure CdsCadastroAfterPost(DataSet: TDataSet);
    procedure CdsItensNewRecord(DataSet: TDataSet);
    procedure CdsItensBeforePost(DataSet: TDataSet);
    procedure actGravarExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CdsParcelasPagamentoNewRecord(DataSet: TDataSet);
    procedure CdsParcelasPagamentoBeforePost(DataSet: TDataSet);
    procedure CdsPagamentoBeforePost(DataSet: TDataSet);
    procedure CdsPagamentoNewRecord(DataSet: TDataSet);
    procedure CdsItensAfterOpen(DataSet: TDataSet);
    procedure CdsPagamentoAfterOpen(DataSet: TDataSet);
    procedure CdsParcelasPagamentoAfterOpen(DataSet: TDataSet);
    procedure CdsPagamentoAfterScroll(DataSet: TDataSet);
    procedure CdsCadastroAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    TotalPagamentos,TotalProposta: Currency;
  public
    { Public declarations }
    Procedure HabilitaObjetos;
    procedure CalculaTotal;
    procedure CalculaTotalPagamentos;
  end;

var
  frmCad_Proposta: TfrmCad_Proposta;

implementation

uses UDmConexao, Comandos, MinhasClasses, udlg_ItensProposta,
  udlgCondicaoPagamentoProposta, uForms;

{$R *.dfm}

{ TfrmCad_Proposta }

procedure TfrmCad_Proposta.actAlterarExecute(Sender: TObject);
begin
  inherited;
  Try
    frmDlg_ItensProposta := TfrmDlg_ItensProposta.Create(nil);
    frmDlg_ItensProposta.pDataSet := Self.CdsItens;
    frmDlg_ItensProposta.CdsProposta := Self.CdsCadastro;
    frmDlg_ItensProposta.FechaEGrava := True;
    frmDlg_ItensProposta.pDataSet.Edit;
    frmDlg_ItensProposta.ShowModal;
    CalculaTotal;
  Finally
    FreeAndNil(frmDlg_ItensProposta);
  End;
end;

procedure TfrmCad_Proposta.actAlterarPagamentoExecute(Sender: TObject);
begin
  inherited;
 Try
    frmdlgCondicaoPagamentoProposta := TfrmdlgCondicaoPagamentoProposta.Create(nil);
    frmdlgCondicaoPagamentoProposta.pDataSet := Self.CdsPagamento;
    frmdlgCondicaoPagamentoProposta.DataSetParcelas := Self.CdsParcelasPagamento;
    frmdlgCondicaoPagamentoProposta.FechaEGrava := True;
    frmdlgCondicaoPagamentoProposta.pDataSet.Edit;
    frmdlgCondicaoPagamentoProposta.ValorTotalPagamentos := Self.TotalPagamentos;
    frmdlgCondicaoPagamentoProposta.ValorTotalProposta := Self.TotalProposta;
    frmdlgCondicaoPagamentoProposta.ShowModal;
    CalculaTotalPagamentos;
  Finally
    FreeAndNil(frmdlgCondicaoPagamentoProposta);
  End;
end;

procedure TfrmCad_Proposta.actApagarPagamentoExecute(Sender: TObject);
begin
  inherited;
   if ConfirmaDel then
    begin
      Self.CdsPagamento.Edit;
      Self.CdsPagamento.FieldByName('FLAGEDICAO').AsString := 'D';
      Self.CdsPagamento.Post;
      CalculaTotalPagamentos;
    end;
end;

procedure TfrmCad_Proposta.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaDel then
  begin
    Self.CdsItens.Edit;
    Self.CdsItens.FieldByName('FLAGEDICAO').AsString := 'D';
    Self.CdsItens.Post;
    CalculaTotal;
  end;

end;

procedure TfrmCad_Proposta.actGravarExecute(Sender: TObject);
begin
  if CdsItens.IsEmpty then
  begin
    Avisa('A proposta deve ter pelo menos um item');
    Exit;
  end;
  if CdsPagamento.IsEmpty then
  begin
    Avisa('A proposta deve ter pelo menos uma forma de pagamento');
    Exit;
  end;

  if  RoundTo(TotalPagamentos,-2) <> RoundTo(TotalProposta,-2) then
    AvisaErro('O valor da proposta está diferente das formas de pagamentos');
  inherited;


end;

procedure TfrmCad_Proposta.actIncluirExecute(Sender: TObject);
begin
  inherited;
 
  Try
    frmDlg_ItensProposta := TfrmDlg_ItensProposta.Create(nil);
    frmDlg_ItensProposta.pDataSet := Self.CdsItens;
    frmDlg_ItensProposta.CdsProposta := Self.CdsCadastro;
    frmDlg_ItensProposta.FechaEGrava := False;
    frmDlg_ItensProposta.pDataSet.Append;
    frmDlg_ItensProposta.ShowModal;
    CalculaTotal;
  Finally
    FreeAndNil(frmDlg_ItensProposta);
  End;
end;

procedure TfrmCad_Proposta.actIncluirPagamentoExecute(Sender: TObject);
begin
  inherited;
  if (CdsCadastro.FieldByName('FINALIDADEPROPOSTA').AsString = 'C') and (CdsPagamento.RecordCount >= 1) then
  begin
    Avisa('Propósta para contrato só pode ter uma forma de pagamento.');
    Exit;
  end;
  Try
    frmdlgCondicaoPagamentoProposta := TfrmdlgCondicaoPagamentoProposta.Create(nil);
    frmdlgCondicaoPagamentoProposta.pDataSet := Self.CdsPagamento;
    frmdlgCondicaoPagamentoProposta.DataSetParcelas := Self.CdsParcelasPagamento;
    frmdlgCondicaoPagamentoProposta.FechaEGrava := False;
    frmdlgCondicaoPagamentoProposta.ValorTotalPagamentos := Self.TotalPagamentos;
    frmdlgCondicaoPagamentoProposta.ValorTotalProposta := Self.TotalProposta;

    frmdlgCondicaoPagamentoProposta.pDataSet.Append;
    frmdlgCondicaoPagamentoProposta.ShowModal;
    CalculaTotalPagamentos;
  Finally
    FreeAndNil(frmdlgCondicaoPagamentoProposta);
  End;
end;

procedure TfrmCad_Proposta.CalculaTotal;
var
  SubTotal, Desconto,
  Acrescimo, Aliq: Currency;
begin
  TotalProposta := 0;
  SubTotal := 0;
  Desconto := 0;
  Acrescimo := 0;
  CdsItens.First;
  while not CdsItens.Eof do
  begin
    TotalProposta := TotalProposta + CdsItens.FieldByName('VALORTOTAL').AsCurrency;
    SubTotal := SubTotal + CdsItens.FieldByName('SubTotal').AsCurrency;
    Desconto := Desconto + CdsItens.FieldByName('VALORDESCONTO').AsCurrency;
    Acrescimo := Acrescimo + CdsItens.FieldByName('VALORACRESCIMO').AsCurrency;

    CdsItens.Next;
  end;

  if CdsCadastro.State in [dsEdit,dsInsert] then
  begin
    CdsCadastro.FieldByName('VALORTOTALPROPOSTA').AsCurrency := TotalProposta;
    CdsCadastro.FieldByName('SUBTOTALPROPOSTA').AsCurrency := SubTotal;

    CdsCadastro.FieldByName('ALIQDESCONTO').AsCurrency := 0;
    CdsCadastro.FieldByName('ALIQACRESCIMO').AsCurrency := 0;
    CdsCadastro.FieldByName('VALORDESCONTOTOTAL').AsCurrency := 0;
    CdsCadastro.FieldByName('VALORACRESCIMOTOTAL').AsCurrency := 0;

    if CdsCadastro.FieldByName('SUBTOTALPROPOSTA').AsCurrency >0 then
    begin
      Aliq := ((CdsCadastro.FieldByName('VALORTOTALPROPOSTA').AsCurrency * 100) / CdsCadastro.FieldByName('SUBTOTALPROPOSTA').AsCurrency) - 100;
      if Aliq <= 0  then
      begin
        CdsCadastro.FieldByName('ALIQDESCONTO').AsCurrency := Abs(Aliq);
        CdsCadastro.FieldByName('VALORDESCONTOTOTAL').AsCurrency := SubTotal*Abs(Aliq)/100;
      end else
      begin
        CdsCadastro.FieldByName('ALIQACRESCIMO').AsCurrency := Abs(Aliq);
        CdsCadastro.FieldByName('VALORACRESCIMOTOTAL').AsCurrency := SubTotal*Abs(Aliq)/100;
      end;
    end;

  end;



end;

procedure TfrmCad_Proposta.CalculaTotalPagamentos;
begin
  TotalPagamentos := 0;
  Try
    CdsPagamento.AfterScroll := nil;
    CdsPagamento.First;
    while not CdsPagamento.Eof do
    begin
      TotalPagamentos :=  TotalPagamentos + CdsPagamento.FieldByName('VALOR').AsCurrency;
      CdsPagamento.Next;
    end;
  Finally
    CdsPagamento.AfterScroll := CdsPagamentoAfterScroll;
    CdsPagamentoAfterScroll(CdsPagamento);
  End;
end;

procedure TfrmCad_Proposta.CdsCadastroAfterOpen(DataSet: TDataSet);
begin
  inherited;
  FormataMascara(CdsCadastro.FieldByName('ALIQDESCONTO'),tcPercent);
  FormataMascara(CdsCadastro.FieldByName('ALIQACRESCIMO'),tcPercent);

end;

procedure TfrmCad_Proposta.CdsCadastroAfterPost(DataSet: TDataSet);
begin
  inherited;
  SetRegistros(CdsItens,tpERPItemProposta);
  SetRegistros(CdsPagamento,tpERPCondicaoPagamentoProposta);
  SetRegistros(CdsParcelasPagamento,tpERPParcelaCondicaoPagamentoProposta);
end;

procedure TfrmCad_Proposta.CdsCadastroAfterScroll(DataSet: TDataSet);
begin
  inherited;
  HabilitaObjetos;
  SetCds(CdsItens,tpERPItemProposta,'IP.Idproposta = '+ValorChave);
  SetCds(CdsPagamento,tpERPCondicaoPagamentoProposta,'CPP.IDPROPOSTA = '+ValorChave);
end;

procedure TfrmCad_Proposta.CdsCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
   CdsCadastro.FieldByName('DATAEXPIRA').AsDateTime := AddDay(15,CdsCadastro.FieldByName('DATA').AsDateTime);
end;

procedure TfrmCad_Proposta.CdsItensAfterOpen(DataSet: TDataSet);
begin
  inherited;
  FormataMascara(CdsItens.FieldByName('QUANTIDADE'),tcReal);
  FormataMascara(CdsItens.FieldByName('VALORUNITARIO'),tcReal);
  FormataMascara(CdsItens.FieldByName('SUBTOTAL'),tcMoeda);
  FormataMascara(CdsItens.FieldByName('VALORDESCONTO'),tcReal);
  FormataMascara(CdsItens.FieldByName('VALORACRESCIMO'),tcReal);
  FormataMascara(CdsItens.FieldByName('VALORTOTAL'),tcReal);
  FormataMascara(CdsItens.FieldByName('ALIQDESCONTO'),tcPercent);
  FormataMascara(CdsItens.FieldByName('ALIQACRESCIMO'),tcPercent);
  CalculaTotal;
end;

procedure TfrmCad_Proposta.CdsItensBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CdsItens.FieldByName('FLAGEDICAO').AsString = 'N' then
    CdsItens.FieldByName('FLAGEDICAO').AsString := 'E';
end;

procedure TfrmCad_Proposta.CdsItensNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsItens.FieldByName('FLAGEDICAO').AsString := 'I';
  CdsItens.FieldByName('IDPROPOSTA').AsString := ValorChave;
  CdsItens.FieldByName('IDITEMPROPOSTA').AsString := GetCodigo(tpERPItemProposta);
end;

procedure TfrmCad_Proposta.CdsPagamentoAfterOpen(DataSet: TDataSet);
var
  IdPagamento: String;
begin
  inherited;
  if CdsPagamento.FieldByName('IDCONDICAOPAGAMENTOPROPOSTA').AsString = '' then
    IdPagamento:= '-1'
  else
    IdPagamento:= CdsPagamento.FieldByName('IDCONDICAOPAGAMENTOPROPOSTA').AsString;

  SetCds(CdsParcelasPagamento,tpERPParcelaCondicaoPagamentoProposta,'IDCONDICAOPAGAMENTOPROPOSTA = '+IdPagamento);


  CalculaTotalPagamentos;
  FormataMascara(CdsPagamento.FieldByName('VALOR'),tcMoeda);
end;

procedure TfrmCad_Proposta.CdsPagamentoAfterScroll(DataSet: TDataSet);
var
  IdPagamento: String;
begin
  inherited;
  if CdsPagamento.FieldByName('IDCONDICAOPAGAMENTOPROPOSTA').AsString = '' then
    IdPagamento:= '-1'
  else
    IdPagamento:= CdsPagamento.FieldByName('IDCONDICAOPAGAMENTOPROPOSTA').AsString;

  CdsParcelasPagamento.Filter := 'FLAGEDICAO <> ''D'' AND  IDCONDICAOPAGAMENTOPROPOSTA = '+IdPagamento;
  CdsParcelasPagamento.Filtered := True;

end;

procedure TfrmCad_Proposta.CdsPagamentoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CdsPagamento.FieldByName('FLAGEDICAO').AsString = 'N' then
     CdsPagamento.FieldByName('FLAGEDICAO').AsString := 'E';
end;

procedure TfrmCad_Proposta.CdsPagamentoNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsPagamento.FieldByName('FLAGEDICAO').AsString := 'I';
  CdsPagamento.FieldByName('IDPROPOSTA').AsString := ValorChave;
  CdsPagamento.FieldByName('IDCONDICAOPAGAMENTOPROPOSTA').AsString := GetCodigo(tpERPCondicaoPagamentoProposta);
end;

procedure TfrmCad_Proposta.CdsParcelasPagamentoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  FormataMascara(CdsPagamento.FieldByName('VALOR'),tcMoeda);
end;

procedure TfrmCad_Proposta.CdsParcelasPagamentoBeforePost(DataSet: TDataSet);
begin
  inherited;
   if CdsParcelasPagamento.FieldByName('FLAGEDICAO').AsString = 'N' then
     CdsParcelasPagamento.FieldByName('FLAGEDICAO').AsString := 'E';
end;

procedure TfrmCad_Proposta.CdsParcelasPagamentoNewRecord(DataSet: TDataSet);
begin
  inherited;
   CdsParcelasPagamento.FieldByName('FLAGEDICAO').AsString := 'I';
   CdsParcelasPagamento.FieldByName('IDCONDICAOPAGAMENTOPROPOSTA').AsString := CdsPagamento.FieldByName('IDCONDICAOPAGAMENTOPROPOSTA').AsString;
   CdsParcelasPagamento.FieldByName('IDPARCONDPAGAMENTOPROPOSTA').AsString := GetCodigo(tpERPParcelaCondicaoPagamentoProposta);
end;

procedure TfrmCad_Proposta.FormCreate(Sender: TObject);
begin
  inherited;
  Self.TipoPesquisa := tpERPProposta;
end;

procedure TfrmCad_Proposta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case key of
    vk_F10:
      pageOpcoes.ActivePage := tsProduto;
    vk_F12:
      pageOpcoes.ActivePage := tsPagamento;
    Ord('Q'),Ord('q'):
    begin
      if  ssCtrl in Shift then
        pageOpcoes.ActivePage := tsObs;
    end;

  end;
end;

procedure TfrmCad_Proposta.FormShow(Sender: TObject);
begin
  inherited;

  ConfiguraEditPesquisa(edtEmpresa,CdsCadastro,tpERPEmpresa,True);
  ConfiguraEditPesquisa(edtCliente,CdsCadastro,tpERPCliente,True,'','','CODIGO','',6, TrotinasForms.AbreCadastroCliente);
  ConfiguraEditPesquisa(edtPeriodoVigenciaContrato,CdsCadastro,tpERPPeridicidade,False,'','','CODIGO','IDPERIDOVIGENCIACONTRATO');
  ConfiguraEditPesquisa(edtPeriodoVisitaContrato,CdsCadastro,tpERPPeridicidade,False,'','','CODIGO','IDPERIODICIDADEVISITACONTRATO');
  edtEmpresa.SetFocus;
end;

procedure TfrmCad_Proposta.grpFinalidadePropostaPropertiesChange(
  Sender: TObject);
begin
  inherited;
  HabilitaObjetos;
end;

procedure TfrmCad_Proposta.HabilitaObjetos;
var
  Contrato: Boolean;
begin
  Contrato := grpFinalidadeProposta.ItemIndex = 0;
  edtPeriodoVisitaContrato.Enabled := Contrato;
  edtPeriodoVigenciaContrato.Enabled := Contrato;

end;

end.
