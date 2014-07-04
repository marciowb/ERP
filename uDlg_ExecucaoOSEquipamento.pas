unit uDlg_ExecucaoOSEquipamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDlg_CadastroERP, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMemo, cxDBEdit, StdCtrls, Mask, EditPesquisa, Buttons, ExtCtrls, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ActnList, cxSplitter, DBCtrls,
  LabelDBEdit, DBClient, pFIBClientDataSet;

type
  TfrmDlg_ExecucaoOSEquipamento = class(TfrmDlg_CadastroERP)
    Panel3: TPanel;
    edtEquipamentos: TEditPesquisa;
    GroupBox1: TGroupBox;
    mmDefeito: TcxDBMemo;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Panel4: TPanel;
    edtFuncionario: TEditPesquisa;
    mmLaudo: TcxDBMemo;
    Panel5: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    cxGrid1: TcxGrid;
    tvItens: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    tvItensColumn1: TcxGridDBColumn;
    tvItensColumn2: TcxGridDBColumn;
    tvItensColumn3: TcxGridDBColumn;
    tvItensColumn4: TcxGridDBColumn;
    tvItensColumn5: TcxGridDBColumn;
    ActionList1: TActionList;
    actInserir: TAction;
    actAlterar: TAction;
    actExcluir: TAction;
    cxSplitter2: TcxSplitter;
    LabelDBEdit1: TLabelDBEdit;
    LabelDBEdit2: TLabelDBEdit;
    LabelDBEdit3: TLabelDBEdit;
    cxSplitter1: TcxSplitter;
    procedure actInserirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    FIdCliente: Integer;
    FpDataSetServico: TpFIBClientDataSet;
    FIdEmpresa: Integer;
    FData: TDate;
    FDataSetMaster: TpFIBClientDataSet;
    procedure SetIdCliente(const Value: Integer);
    procedure SetpDataSetServico(const Value: TpFIBClientDataSet);
    procedure SetData(const Value: TDate);
    procedure SetIdEmpresa(const Value: Integer);
    procedure SetDataSetMaster(const Value: TpFIBClientDataSet);
    { Private declarations }
  public
    { Public declarations }
    property IdCliente: Integer read FIdCliente write SetIdCliente;
    property IdEmpresa: Integer read FIdEmpresa write SetIdEmpresa;
    property Data: TDate read FData write SetData;
    property pDataSetServico: TpFIBClientDataSet read FpDataSetServico write SetpDataSetServico;
    property DataSetMaster:  TpFIBClientDataSet read FDataSetMaster write SetDataSetMaster;
  end;

var
  frmDlg_ExecucaoOSEquipamento: TfrmDlg_ExecucaoOSEquipamento;

implementation

uses uCad_OS, UDmConexao, Comandos, MinhasClasses, uDlg_ServicoEquipamentoOS;

{$R *.dfm}

procedure TfrmDlg_ExecucaoOSEquipamento.actAlterarExecute(Sender: TObject);
begin
  inherited;
  Try
    frmDlg_ServicoEquipamentoOS := TfrmDlg_ServicoEquipamentoOS.Create(nil);
    frmDlg_ServicoEquipamentoOS.pDataSet := pDataSetServico;
    frmDlg_ServicoEquipamentoOS.FechaEGrava := True;
    frmDlg_ServicoEquipamentoOS.pDataSet.Edit;
    frmDlg_ServicoEquipamentoOS.IdCliente := Self.IdCliente;
    frmDlg_ServicoEquipamentoOS.IdEmpresa := Self.IdEmpresa;
    frmDlg_ServicoEquipamentoOS.Data := Self.Data;
    frmDlg_ServicoEquipamentoOS.ShowModal;
  Finally
    FreeAndNil(frmDlg_ServicoEquipamentoOS);
  End;
end;

procedure TfrmDlg_ExecucaoOSEquipamento.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaDel then
  begin
    pDataSetServico.Edit;
    pDataSetServico.FieldByName('FLAGEDICAO').AsString :='D';
    pDataSetServico.Post;
  end;

end;

procedure TfrmDlg_ExecucaoOSEquipamento.actInserirExecute(Sender: TObject);
begin
  inherited;
  Try
    frmDlg_ServicoEquipamentoOS := TfrmDlg_ServicoEquipamentoOS.Create(nil);
    frmDlg_ServicoEquipamentoOS.pDataSet := pDataSetServico;
    frmDlg_ServicoEquipamentoOS.FechaEGrava := False;
    frmDlg_ServicoEquipamentoOS.pDataSet.Append;
    frmDlg_ServicoEquipamentoOS.IdCliente := Self.IdCliente;
    frmDlg_ServicoEquipamentoOS.IdEmpresa := Self.IdEmpresa;
    frmDlg_ServicoEquipamentoOS.Data := Self.Data;
    frmDlg_ServicoEquipamentoOS.ShowModal;
  Finally
    FreeAndNil(frmDlg_ServicoEquipamentoOS);
  End;
end;

procedure TfrmDlg_ExecucaoOSEquipamento.btnOkClick(Sender: TObject);
begin
  if Trim(mmDefeito.Text) = '' then
  begin
    Avisa('Informe o detalhe da ocorrência');
    mmDefeito.SetFocus;
    Exit;
  end;
  VerificaEdit(edtEquipamentos,'Informe o equipamento');
  if ExisteRegistro(pDataSet,'IDEQUIPAMENTOCLIENTE') Then
  begin
    Avisa('Esse equipamento já foi dicionado');
    edtEquipamentos.SetFocus;
    exit;
  end;
  if (Trim(mmLaudo.Text) <> '') and (edtFuncionario.IsNull) then
  begin
    Avisa('Informe o funcionário responsável pelo laudo');
    edtFuncionario.SetFocus;
    exit;
  end;
  inherited;

end;

procedure TfrmDlg_ExecucaoOSEquipamento.FormShow(Sender: TObject);
begin
  inherited;
  ConfiguraEditPesquisa(edtEquipamentos,pDataSet,tpERPClienteEquipamento,True,'','','IDENTIFICADOR','IDEQUIPAMENTOCLIENTE');
  edtEquipamentos.SQLComp := 'idcliente = '+IntToStr(IdCliente);
  ConfiguraEditPesquisa(edtFuncionario,pDataSet,tpERPFuncionario,False,'','','CODIGO','IDFUNCIONARIOSOLUCAO');

end;

procedure TfrmDlg_ExecucaoOSEquipamento.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TfrmDlg_ExecucaoOSEquipamento.SetDataSetMaster(
  const Value: TpFIBClientDataSet);
begin
  FDataSetMaster := Value;
end;

procedure TfrmDlg_ExecucaoOSEquipamento.SetIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
end;

procedure TfrmDlg_ExecucaoOSEquipamento.SetIdEmpresa(const Value: Integer);
begin
  FIdEmpresa := Value;
end;

procedure TfrmDlg_ExecucaoOSEquipamento.SetpDataSetServico(
  const Value: TpFIBClientDataSet);
begin
  FpDataSetServico := Value;
end;

end.
