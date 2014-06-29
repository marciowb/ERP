unit uCad_OS;

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
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxMemo;

type
  TfrmCad_OS = class(TfrmCad_CadastroPaiERP)
    Panel2: TPanel;
    Label1: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    edtEmpresa: TEditPesquisa;
    LabelDBEdit1: TLabelDBEdit;
    edtTipoOS: TEditPesquisa;
    edtStatusOS: TEditPesquisa;
    edtCliente: TEditPesquisa;
    LabelDBEdit2: TLabelDBEdit;
    PageControlOpcoes: TcxPageControl;
    tsEquipamento: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    CdsEquipamento: TpFIBClientDataSet;
    CdsServicoEquipamento: TpFIBClientDataSet;
    CdsProdutoServicoEquipamento: TpFIBClientDataSet;
    DataEquipamento: TDataSource;
    DataServicoEquipamento: TDataSource;
    DataProdutoServicoEquipamento: TDataSource;
    cxGrid1: TcxGrid;
    tvItens: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    tvItensColumn1: TcxGridDBColumn;
    tvItensColumn2: TcxGridDBColumn;
    cxDBMemo1: TcxDBMemo;
    actIncluirEquipamento: TAction;
    actAlterarEquipamento: TAction;
    actExcluirEquipamento: TAction;
    DataSerialOS: TDataSource;
    CdsSerialOS: TpFIBClientDataSet;
    procedure actIncluirEquipamentoExecute(Sender: TObject);
    procedure actAlterarEquipamentoExecute(Sender: TObject);
    procedure actExcluirEquipamentoExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CdsCadastroAfterScroll(DataSet: TDataSet);
    procedure CdsCadastroAfterPost(DataSet: TDataSet);
    procedure CdsEquipamentoNewRecord(DataSet: TDataSet);
    procedure CdsServicoEquipamentoAfterScroll(DataSet: TDataSet);
    procedure CdsServicoEquipamentoNewRecord(DataSet: TDataSet);
    procedure CdsProdutoServicoEquipamentoNewRecord(DataSet: TDataSet);
    procedure CdsProdutoServicoEquipamentoBeforePost(DataSet: TDataSet);
    procedure CdsProdutoServicoEquipamentoBeforeDelete(DataSet: TDataSet);
    procedure CdsEquipamentoAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure CdsServicoEquipamentoBeforePost(DataSet: TDataSet);
    procedure CdsEquipamentoBeforePost(DataSet: TDataSet);
    procedure actGravarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCad_OS: TfrmCad_OS;

implementation

uses UDmConexao, MinhasClasses, Comandos, uDlg_EquipamentoOS,
  uDlg_ExecucaoOSEquipamento, uPesquisa_kimera, uRegras, udlg_SaidaSerial;

{$R *.dfm}

procedure TfrmCad_OS.actAlterarEquipamentoExecute(Sender: TObject);
var
  NaoIniciou: Boolean;
begin
  inherited;
  if NovoReg then
  begin
    Try
      frmDlg_EquipamentoOS := TfrmDlg_EquipamentoOS.Create(nil);
      frmDlg_EquipamentoOS.pDataSet := Self.CdsEquipamento;
      frmDlg_EquipamentoOS.FechaEGrava := True;
      frmDlg_EquipamentoOS.pDataSet.Edit;
      frmDlg_EquipamentoOS.IdCliente := CdsCadastro.FieldByName('IDCLIENTE').AsInteger;
      frmDlg_EquipamentoOS.ShowModal;
    Finally
      FreeAndNil(frmDlg_EquipamentoOS);
    End;
  end else
  begin
     Try
      frmDlg_ExecucaoOSEquipamento := TfrmDlg_ExecucaoOSEquipamento.Create(nil);
      frmDlg_ExecucaoOSEquipamento.pDataSet := Self.CdsEquipamento;
      frmDlg_ExecucaoOSEquipamento.FechaEGrava := True;
      frmDlg_ExecucaoOSEquipamento.IdCliente := CdsCadastro.FieldByName('IDCLIENTE').AsInteger;
      frmDlg_ExecucaoOSEquipamento.IdEmpresa := CdsCadastro.FieldByName('IdEmpresa').AsInteger;
      frmDlg_ExecucaoOSEquipamento.Data := CdsCadastro.FieldByName('Data').AsDateTime;
      frmDlg_ExecucaoOSEquipamento.pDataSetServico := Self.CdsServicoEquipamento;
      frmDlg_ExecucaoOSEquipamento.pDataSet.Edit;
      NaoIniciou := Self.CdsServicoEquipamento.RecordCount = 0;
      if frmDlg_ExecucaoOSEquipamento.ShowModal = mrOK Then
      begin
         Self.CdsCadastro.FieldByName('VALORTOTAL').Value := frmDlg_ExecucaoOSEquipamento.tvItens.DataController.Summary.FooterSummaryValues[0];
         if NaoIniciou then
         begin
           Self.CdsCadastro.FieldByName('DATAINICIO').Value := GetDataServidor;
           Self.CdsCadastro.FieldByName('HORAINICIO').Value := GetHoraServidor;
         end;
      end;

    Finally
      FreeAndNil(frmDlg_ExecucaoOSEquipamento);
    End;
  end;

end;

procedure TfrmCad_OS.actExcluirEquipamentoExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaDel then
  begin
    CdsEquipamento.Edit ;
    CdsEquipamento.FieldByName('FLAGEDICAO').AsString := 'D';
    CdsEquipamento.Post ;
  end;

end;

procedure TfrmCad_OS.actGravarExecute(Sender: TObject);
begin
  if CdsCadastro.FieldByName('FLAGBAIXADA').AsString = 'Y' then
  Begin
    Avisa('Essa O.S.Já foi baixada, por isso não pode ser alterada.');
    Exit;
  End;
  inherited;

end;

procedure TfrmCad_OS.actIncluirEquipamentoExecute(Sender: TObject);
var
  NaoIniciou: Boolean;
begin
  inherited;
  if NovoReg then
  begin
    Try
      frmDlg_EquipamentoOS := TfrmDlg_EquipamentoOS.Create(nil);
      frmDlg_EquipamentoOS.pDataSet := Self.CdsEquipamento;
      frmDlg_EquipamentoOS.FechaEGrava := False;
      frmDlg_EquipamentoOS.IdCliente := CdsCadastro.FieldByName('IDCLIENTE').AsInteger;
      frmDlg_EquipamentoOS.pDataSet.Append;
      frmDlg_EquipamentoOS.ShowModal;
    Finally
      FreeAndNil(frmDlg_EquipamentoOS);
    End;

  end else
  begin
    Try
      frmDlg_ExecucaoOSEquipamento := TfrmDlg_ExecucaoOSEquipamento.Create(nil);
      frmDlg_ExecucaoOSEquipamento.pDataSet := Self.CdsEquipamento;
      frmDlg_ExecucaoOSEquipamento.FechaEGrava := True;
      frmDlg_ExecucaoOSEquipamento.IdCliente := CdsCadastro.FieldByName('IDCLIENTE').AsInteger;
      frmDlg_ExecucaoOSEquipamento.IdEmpresa := CdsCadastro.FieldByName('IdEmpresa').AsInteger;
      frmDlg_ExecucaoOSEquipamento.Data := CdsCadastro.FieldByName('Data').AsDateTime;
      frmDlg_ExecucaoOSEquipamento.pDataSetServico := CdsServicoEquipamento;
      frmDlg_ExecucaoOSEquipamento.pDataSet.Append;
      NaoIniciou := Self.CdsServicoEquipamento.RecordCount = 0;
      if frmDlg_ExecucaoOSEquipamento.ShowModal = mrOK Then
      begin
         Self.CdsCadastro.FieldByName('VALORTOTAL').Value := frmDlg_ExecucaoOSEquipamento.tvItens.DataController.Summary.FooterSummaryValues[0];
         if NaoIniciou then
         begin
           Self.CdsCadastro.FieldByName('DATAINICIO').Value := GetDataServidor;
           Self.CdsCadastro.FieldByName('HORAINICIO').Value := GetHoraServidor;
         end;
      end;
    Finally
      FreeAndNil(frmDlg_ExecucaoOSEquipamento);
    End;

  end;

end;

procedure TfrmCad_OS.CdsCadastroAfterPost(DataSet: TDataSet);
begin
  inherited;
  SetRegistros(CdsEquipamento,tpERPEquipamentoOS);
  if not NovoReg then
  begin
    SetRegistros(CdsServicoEquipamento,tpERPServicoEquipamentoOS);
    SetRegistros(CdsProdutoServicoEquipamento,tpERPProdutoServicoOS);
  end;

end;

procedure TfrmCad_OS.CdsCadastroAfterScroll(DataSet: TDataSet);
var
  StrSQL: String;
begin
  inherited;
  Try
    Self.CdsEquipamento.AfterScroll := nil;
    SetCds(Self.CdsEquipamento,tpERPEquipamentoOS,' IDOS = '+ValorChave);
    if not NovoReg then
    begin
      StrSQL:=
         '  EXISTS(SELECT 1  '+
         '           FROM EQUIPAMENTOSOS E  '+
         '          WHERE E.IDOS =   '+ValorChave+
         '            AND E.IDEQUIPAMENTOSOS = S.IDEQUIPAMENTOSOS) ';

      SetCds(Self.CdsServicoEquipamento,tpERPServicoEquipamentoOS,StrSQL);

      StrSQL:=
         ' EXISTS(SELECT 1   '+
         '         FROM SERVICOOS S  '+
         '        WHERE S.IDSERVICOOS =PS.IDSERVICOOS  '+
         '          AND EXISTS(SELECT 1  '+
         '                       FROM EQUIPAMENTOSOS E  '+
         '                      WHERE E.IDOS =   '+ValorChave+
         '                        AND E.IDEQUIPAMENTOSOS = S.IDEQUIPAMENTOSOS) '+
         '                         ) ';
      SetCds(Self.CdsProdutoServicoEquipamento,tpERPProdutoServicoOS,StrSQL);

    end;
  Finally
    Self.CdsEquipamento.AfterScroll := CdsEquipamentoAfterScroll;
    CdsEquipamentoAfterScroll(Self.CdsEquipamento);
  End;

end;

procedure TfrmCad_OS.CdsEquipamentoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if CdsEquipamento.FieldByName('IDEQUIPAMENTOSOS').AsString <> '' then
  begin
    CdsServicoEquipamento.Filter := '(FLAGEDICAO <>''D'') and IDEQUIPAMENTOSOS = '+CdsEquipamento.FieldByName('IDEQUIPAMENTOSOS').AsString;
    CdsServicoEquipamento.Filtered := True;

  end;

end;

procedure TfrmCad_OS.CdsEquipamentoBeforePost(DataSet: TDataSet);
begin
  inherited;
 if CdsEquipamento.FieldByName('FLAGEDICAO').AsString = 'N' then
    CdsEquipamento.FieldByName('FLAGEDICAO').AsString := 'E';
end;

procedure TfrmCad_OS.CdsEquipamentoNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsEquipamento.FieldByName('IDEQUIPAMENTOSOS').AsString:= GetCodigo(tpERPEquipamentoOS);
  CdsEquipamento.FieldByName('IDOS').AsString:= ValorChave;
  CdsEquipamento.FieldByName('FLAGEDICAO').AsString:= 'I';
end;

procedure TfrmCad_OS.CdsProdutoServicoEquipamentoBeforeDelete(
  DataSet: TDataSet);
begin
  inherited;
  CdsProdutoServicoEquipamento.Edit;
  CdsProdutoServicoEquipamento.FieldByName('FLAGEDICAO').AsString := 'D';
  CdsProdutoServicoEquipamento.Post;
  Abort;
end;

procedure TfrmCad_OS.CdsProdutoServicoEquipamentoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CdsProdutoServicoEquipamento.FieldByName('quantidade').IsNull then
    AvisaErro('Informe a quantidade ');
  if CdsProdutoServicoEquipamento.FieldByName('VALORUNITARIO').IsNull then
    AvisaErro('Informe o valor unitario ');

  CdsProdutoServicoEquipamento.FieldByName('TOTAL').AsCurrency :=
      CdsProdutoServicoEquipamento.FieldByName('VALORUNITARIO').AsCurrency *
      CdsProdutoServicoEquipamento.FieldByName('quantidade').AsCurrency;
  if CdsProdutoServicoEquipamento.FieldByName('FLAGEDICAO').AsString = 'N' Then
    CdsProdutoServicoEquipamento.FieldByName('FLAGEDICAO').AsString := 'E';
end;

procedure TfrmCad_OS.CdsProdutoServicoEquipamentoNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsProdutoServicoEquipamento.FieldByName('IDSERVICOOS').AsString := CdsServicoEquipamento.FieldByName('IDSERVICOOS').AsString;
  CdsProdutoServicoEquipamento.FieldByName('IDPRODUTOSSERVICOOS').AsString := GetCodigo(tpERPProdutoServicoOS);
  CdsProdutoServicoEquipamento.FieldByName('FLAGEDICAO').AsString := 'I';
  frmPesquisa := TfrmPesquisa.Create(nil);
  Try
    frmPesquisa.TipoPesquisa := tpERPProduto;
    frmPesquisa.Where := 'TIPOPRODUTO not in(''S'',''I'') ';
    if frmPesquisa.ShowModal = mrOK Then
    begin
      CdsProdutoServicoEquipamento.FieldByName('IDPRODUTO').Value := frmPesquisa.cdsPesquisa.FieldByName('IDPRODUTO').Value;
      CdsProdutoServicoEquipamento.FieldByName('CODIGO').Value := frmPesquisa.cdsPesquisa.FieldByName('CODIGO').Value;
      CdsProdutoServicoEquipamento.FieldByName('DESCRICAO').Value := frmPesquisa.cdsPesquisa.FieldByName('NOMEPRODUTO').Value;
      CdsProdutoServicoEquipamento.FieldByName('VALORUNITARIO').Value :=
           TRegrasVendaProduto.PrecoVendaProduto(CdsProdutoServicoEquipamento.FieldByName('IDPRODUTO').Value,
                                                 CdsCadastro.FieldByName('IDCLIENTE').AsInteger,
                                                 CdsCadastro.FieldByName('IDEMPRESA').AsInteger,
                                                 CdsCadastro.FieldByName('DATA').AsDateTime );
      Try
        frmDlg_SaidaSerial := TfrmDlg_SaidaSerial.Create(nil);
        frmDlg_SaidaSerial.IdProduto := CdsProdutoServicoEquipamento.FieldByName('IDPRODUTO').Value;
        if frmDlg_SaidaSerial.ShowModal = mrOK Then
        begin

        end;
      Finally
        FreeAndNil(frmDlg_SaidaSerial);
      End;

    end;
  Finally
    FreeAndNil(frmPesquisa);
  End;

end;

procedure TfrmCad_OS.CdsServicoEquipamentoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if CdsServicoEquipamento.FieldByName('IDSERVICOOS').AsString <> '' then
  begin
    CdsProdutoServicoEquipamento.Filter := '(FLAGEDICAO <>''D'') and IDSERVICOOS = '+CdsServicoEquipamento.FieldByName('IDSERVICOOS').AsString;
    CdsProdutoServicoEquipamento.Filtered := True;
  end;

end;

procedure TfrmCad_OS.CdsServicoEquipamentoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CdsServicoEquipamento.FieldByName('FLAGEDICAO').AsString = 'N' then
    CdsServicoEquipamento.FieldByName('FLAGEDICAO').AsString := 'E';
end;

procedure TfrmCad_OS.CdsServicoEquipamentoNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsServicoEquipamento.FieldByName('IDEQUIPAMENTOSOS').AsString := CdsEquipamento.FieldByName('IDEQUIPAMENTOSOS').AsString;
  CdsServicoEquipamento.FieldByName('IDSERVICOOS').AsString := GetCodigo(tpERPServicoEquipamentoOS) ;
  CdsServicoEquipamento.FieldByName('FLAGEDICAO').AsString := 'I';
  CdsServicoEquipamento.FieldByName('DATAINICIO').AsString := GetDataServidor;
  CdsServicoEquipamento.FieldByName('HORAINICIO').AsString := GetHoraServidor;
end;

procedure TfrmCad_OS.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPesquisa := tpERPOS;
end;

procedure TfrmCad_OS.FormShow(Sender: TObject);
begin
  inherited;
  ConfiguraEditPesquisa(edtEmpresa, CdsCadastro, tpERPEmpresa,True);
  ConfiguraEditPesquisa(edtTipoOS, CdsCadastro, tpERPTipoOS,True);
  ConfiguraEditPesquisa(edtStatusOS, CdsCadastro, tpERPStatusOS,True);
  ConfiguraEditPesquisa(edtCliente, CdsCadastro, tpERPCliente,True);

end;

end.
