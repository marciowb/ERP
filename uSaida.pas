unit uSaida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormPadrao, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, DB, DBClient,
  pFIBClientDataSet, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit, Mask, EditPesquisa, DBCtrls, LabelDBEdit, dxSkinscxPCPainter,
  Buttons, cxPC, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ActnList;

type
  TfrmSaida = class(TfrmPadrao)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    CdsSaida: TpFIBClientDataSet;
    DataSaida: TDataSource;
    GroupBox2: TGroupBox;
    cxDBDateEdit1: TcxDBDateEdit;
    edtEmpresa: TEditPesquisa;
    edtOperacao: TEditPesquisa;
    Label1: TLabel;
    edtPessoa: TEditPesquisa;
    cxPageControl1: TcxPageControl;
    cxTabSheet2: TcxTabSheet;
    DBMemo1: TDBMemo;
    TvItens: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DataItens: TDataSource;
    CdsItens: TpFIBClientDataSet;
    TvItensNUMITEM: TcxGridDBColumn;
    TvItensQUANTIDADE: TcxGridDBColumn;
    TvItensVALORUNITARIO: TcxGridDBColumn;
    TvItensALIQDESCONTO: TcxGridDBColumn;
    TvItensALIQACRESCIMO: TcxGridDBColumn;
    TvItensVALORDESCONTO: TcxGridDBColumn;
    TvItensVALORACRESCIMO: TcxGridDBColumn;
    TvItensALIQICMS: TcxGridDBColumn;
    TvItensVALORICMS: TcxGridDBColumn;
    TvItensALIQIPI: TcxGridDBColumn;
    TvItensVALORIPI: TcxGridDBColumn;
    TvItensALIQST: TcxGridDBColumn;
    TvItensVALORST: TcxGridDBColumn;
    TvItensALIQPIS: TcxGridDBColumn;
    TvItensALIQCOFINS: TcxGridDBColumn;
    TvItensVALORPIS: TcxGridDBColumn;
    TvItensVALORCOFINS: TcxGridDBColumn;
    TvItensALIQISS: TcxGridDBColumn;
    TvItensVALORISS: TcxGridDBColumn;
    TvItensCST: TcxGridDBColumn;
    TvItensCSOSN: TcxGridDBColumn;
    TvItensVALORTOTALPRODUTOS: TcxGridDBColumn;
    TvItensVALORTOTAL: TcxGridDBColumn;
    TvItensCODIGO_PRODUTO: TcxGridDBColumn;
    TvItensNOMEPRODUTO: TcxGridDBColumn;
    TvItensUNIDADE: TcxGridDBColumn;
    TvItensCFOP: TcxGridDBColumn;
    cxTabSheet3: TcxTabSheet;
    GroupBox5: TGroupBox;
    TvPagamento: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    CdsCondicaoPagamento: TpFIBClientDataSet;
    DataCondicaoPagamento: TDataSource;
    TvPagamentoVALOR: TcxGridDBColumn;
    TvPagamentoNUMTOTALPARCELAS: TcxGridDBColumn;
    TvPagamentoNOMECONDICAOPAGAMENTO: TcxGridDBColumn;
    GroupBox4: TGroupBox;
    LabelDBEdit16: TLabelDBEdit;
    LabelDBEdit12: TLabelDBEdit;
    LabelDBEdit20: TLabelDBEdit;
    LabelDBEdit21: TLabelDBEdit;
    edtTotalnota: TLabelDBEdit;
    LabelDBEdit15: TLabelDBEdit;
    LabelDBEdit14: TLabelDBEdit;
    LabelDBEdit13: TLabelDBEdit;
    edtFrete: TLabelDBEdit;
    LabelDBEdit7: TLabelDBEdit;
    LabelDBEdit8: TLabelDBEdit;
    LabelDBEdit9: TLabelDBEdit;
    LabelDBEdit10: TLabelDBEdit;
    LabelDBEdit11: TLabelDBEdit;
    LabelDBEdit17: TLabelDBEdit;
    LabelDBEdit19: TLabelDBEdit;
    LabelDBEdit18: TLabelDBEdit;
    Panel5: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    ActionList1: TActionList;
    actNovoPagamento: TAction;
    actEditarPagamento: TAction;
    actExcluirPagamento: TAction;
    actNovoItem: TAction;
    actEditarItem: TAction;
    actExcluirItem: TAction;
    LabelDBEdit22: TLabelDBEdit;
    Panel6: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    LabelDBEdit24: TLabelDBEdit;
    DataParcelamentos: TDataSource;
    CdsParcelamentos: TpFIBClientDataSet;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    LabelDBEdit1: TLabelDBEdit;
    LabelDBEdit2: TLabelDBEdit;
    LabelDBEdit3: TLabelDBEdit;
    LabelDBEdit4: TLabelDBEdit;
    edtTransportadora: TEditPesquisa;
    LabelDBEdit5: TLabelDBEdit;
    cmbUF: TDBComboBox;
    cxDBDateEdit2: TcxDBDateEdit;
    LabelDBEdit6: TLabelDBEdit;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure actNovoPagamentoExecute(Sender: TObject);
    procedure actEditarPagamentoExecute(Sender: TObject);
    procedure actExcluirPagamentoExecute(Sender: TObject);
    procedure actNovoItemExecute(Sender: TObject);
    procedure actEditarItemExecute(Sender: TObject);
    procedure actExcluirItemExecute(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtOperacaoRegAchado(const ValoresCamposEstra: array of Variant);
    procedure edtEmpresaRegAchado(const ValoresCamposEstra: array of Variant);
    procedure CdsSaidaNewRecord(DataSet: TDataSet);
    procedure CdsItensNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    UfEmpresa: String;
    Procedure RestartaVenda;
  public
    { Public declarations }
    Procedure AbreVenda(IdVenda: String);
  end;

var
  frmSaida: TfrmSaida;

implementation

uses UDmConexao, Comandos, MinhasClasses, uDlg_SaidaItem;

{$R *.dfm}
procedure TfrmSaida.AbreVenda(IdVenda: String);
begin
  SetCds(CdsSaida,tpERPSaida,'IDSAIDA = '+IdVenda);
  SetCds(CdsItens,tpERPSaidaProduto,'Sp.IDSAIDA = '+IdVenda);
  SetCds(CdsCondicaoPagamento,tpERPSaidaCondicaoPagamento,'SC.IDSAIDA = '+IdVenda);
  SetCds(CdsParcelamentos,tpERPSaidaCondicaoPagamentoParcelas, ' EXISTS(SELECT 1 '+
                                                               '          FROM SAIDACONDICAOPAGAMENTO SC '+
                                                               '         WHERE SC.IDSAIDACONDICAOPAGAMENTO =PS.IDSAIDACONDICAOPAGAMENTO '+
                                                               '           AND SC.IDSAIDA = '+IdVenda+')');
end;

procedure TfrmSaida.actEditarItemExecute(Sender: TObject);
begin
  inherited;
  frmDlg_SaidaItem := TfrmDlg_SaidaItem.Create(nil);
  Try
    frmDlg_SaidaItem.pDataSet := CdsItens;
    frmDlg_SaidaItem.pDataSet.Edit;
    frmDlg_SaidaItem.FechaEGrava := False;
    frmDlg_SaidaItem.ShowModal;
  Finally
    FreeAndNil(frmDlg_SaidaItem);
  End;
end;

procedure TfrmSaida.actEditarPagamentoExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmSaida.actExcluirItemExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaDel then
  begin
    CdsItens.Edit;
    CdsItens.FieldByName('FLAGEDICAO').AsString := 'D';
    CdsItens.Post;
  end;

end;

procedure TfrmSaida.actExcluirPagamentoExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaDel then
  begin
    CdsItens.Edit;
    CdsItens.FieldByName('FLAGEDICAO').AsString := 'D';
    CdsItens.Post;
  end;

end;

procedure TfrmSaida.actNovoItemExecute(Sender: TObject);
begin
  inherited;
  frmDlg_SaidaItem := TfrmDlg_SaidaItem.Create(nil);
  Try
    frmDlg_SaidaItem.pDataSet := CdsItens;
    frmDlg_SaidaItem.pDataSet.Append;
    frmDlg_SaidaItem.FechaEGrava := False;
    frmDlg_SaidaItem.ShowModal;
  Finally
    FreeAndNil(frmDlg_SaidaItem);
  End;
end;

procedure TfrmSaida.actNovoPagamentoExecute(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmSaida.btnCancelarClick(Sender: TObject);
begin
  inherited;
  RestartaVenda;
end;

procedure TfrmSaida.CdsItensNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsItens.FieldByName('IDSAIDA').AsString := CdsSaida.FieldByName('IDSAIDA').AsString ;
  CdsItens.FieldByName('NUMITEM').AsInteger := CdsItens.RecordCount +1;
  CdsItens.FieldByName('IDSAIDAPRODUTO').AsInteger := StrToInt64(CdsItens.FieldByName('NUMITEM').AsString + CdsItens.FieldByName('IDSAIDA').AsString);
  CdsItens.FieldByName('flagedicao').AsString := 'I';
end;

procedure TfrmSaida.CdsSaidaNewRecord(DataSet: TDataSet);
begin
  inherited;
  PreencheCamposValorPadraoBD(CdsSaida,tpERPSaida);
  CdsSaida.FieldByName('IDSAIDA').AsString := FormatDateTime('ddmmyyyyhhnnsszzz',StrToDate(GetDataServidor));

end;

procedure TfrmSaida.edtEmpresaRegAchado(
  const ValoresCamposEstra: array of Variant);
begin
  inherited;
  UfEmpresa := VarToStr(ValoresCamposEstra[0]);
end;

procedure TfrmSaida.edtOperacaoRegAchado(
  const ValoresCamposEstra: array of Variant);
begin
  inherited;
  if ValoresCamposEstra[0] = 'F' then //FLAGTIPOPESSOA
  begin
    ConfiguraEditPesquisa(edtPessoa, CdsSaida, tpERPFornecedor);
    edtPessoa.LblTitulo.Caption :='Fornecedor';
  end else
  if ValoresCamposEstra[0] = 'C' then //FLAGTIPOPESSOA
  begin
    ConfiguraEditPesquisa(edtPessoa, CdsSaida, tpERPCliente);
    edtPessoa.LblTitulo.Caption :='Cliente';
  end;

end;

procedure TfrmSaida.FormCreate(Sender: TObject);
begin
  inherited;
  EdtEmpresa.CamposExtraPesquisa := 'UF';
  edtOperacao.CamposExtraPesquisa := 'FLAGTIPOPESSOA';
  ConfiguraEditPesquisa(edtEmpresa,CdsSaida,tpERPEmpresa);
  ConfiguraEditPesquisa(edtOperacao,CdsSaida,tpERPOperacaoSaida);
  ConfiguraEditPesquisa(edtTransportadora,CdsSaida,tpERPTransportadora);
  ConfiguraEditPesquisa(edtPessoa,CdsSaida,tpERPCliente);
  RestartaVenda;
end;

procedure TfrmSaida.RestartaVenda;
begin
  AbreVenda('-1');
  CdsSaida.Append;
end;

end.

