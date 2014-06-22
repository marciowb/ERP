unit uAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormPadrao, DB, DBClient, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, cxStyles, cxEdit, cxScheduler,
  cxSchedulerStorage, cxSchedulerCustomControls, cxSchedulerCustomResourceView,
  cxSchedulerDayView, cxSchedulerDateNavigator, cxSchedulerHolidays,
  cxSchedulerTimeGridView, cxSchedulerUtils, cxSchedulerWeekView,
  cxSchedulerYearView, cxSchedulerGanttView, ActnList, cxSchedulerDBStorage,
  pFIBClientDataSet, ExtCtrls, StdCtrls, Mask, EditPesquisa, Buttons, MinhasClasses,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxScheduler3Painter;

type
  TfrmAgenda = class(TfrmPadrao)
    DataAgenda: TDataSource;
    CdsAgenda: TpFIBClientDataSet;
    SchedulerDBStorage: TcxSchedulerDBStorage;
    Agenda: TcxScheduler;
    Feriados: TcxSchedulerHolidays;
    GroupBox1: TGroupBox;
    grpTipoView: TRadioGroup;
    ActionList1: TActionList;
    actNovo: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    BitBtn4: TBitBtn;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    grpFiltro: TRadioGroup;
    edtCliente: TEditPesquisa;
    edtFuncionario: TEditPesquisa;
    procedure FormShow(Sender: TObject);
    procedure grpTipoViewClick(Sender: TObject);
    procedure CdsAgendaAfterOpen(DataSet: TDataSet);
    procedure CdsAgendaNewRecord(DataSet: TDataSet);
    procedure CdsAgendaBeforePost(DataSet: TDataSet);
    procedure actNovoExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CdsAgendaAfterPost(DataSet: TDataSet);
    procedure AgendaDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Ta: TTipoAlteracao;
    FIdAgenda: Integer;
    procedure SetIdAgenda(const Value: Integer);
  public
    { Public declarations }
    Procedure AtuDados;
    Property IdAgenda: Integer read FIdAgenda write SetIdAgenda;
  end;

var
  frmAgenda: TfrmAgenda;

implementation

uses UDmConexao, Comandos, Cad_Agenda ;

{$R *.dfm}

procedure TfrmAgenda.actEditarExecute(Sender: TObject);
begin
  inherited;
  if Agenda.SelectedEventCount = 0 then
  Begin
    Avisa('Selecione algum evento válido');
    Exit;
  end;
  frmCad_Agenda := TfrmCad_Agenda.Create(nil);
  Try
    with frmCad_Agenda do
    Begin
      CdsAgenda.Locate('IDAGENDA', Agenda.SelectedEvents[0].ID,[]);
      pDataSet := CdsAgenda;
      FechaEGrava := True;
      pDataSet.Edit;
      ShowModal;
      AtuDados;
    End;
  Finally
    FreeAndNil(frmCad_Agenda);
  End;
end;

procedure TfrmAgenda.actExcluirExecute(Sender: TObject);
begin
  inherited;
  if ConfirmaDel then
  Begin
    if Agenda.SelectedEventCount = 0 then
    Begin
      Avisa('Selecione algum evento válido');
      Exit;
    end;
    CdsAgenda.Locate('IDAGENDA', Agenda.SelectedEvents[0].ID,[]);
    Try
      StartTrans;
      AlteraBanco(taDeleta,CdsAgenda,'AGENDA','IDAGENDA');
//      RegistraAuditoria('Apagou um  registro em '+Self.Caption,'O Usuário '+USuarioLogado.Login+' apagou um registro ',
//                         'AGENDA',Self.Name,Self.Caption,CdsAgenda.FieldByName('IDAGENDA').AsString,toDeletar,CdsAgenda, False, False);
      Commit;
      AtuDados;
    Except
      on e: Exception do
      Begin
        Rollback;
        Raise;
      End;
    End;
  End;
end;

procedure TfrmAgenda.actNovoExecute(Sender: TObject);
begin
  inherited;
  frmCad_Agenda := TfrmCad_Agenda.Create(nil);
  Try
    with frmCad_Agenda do
    Begin
      pDataSet := Self.CdsAgenda;
      FechaEGrava := False;
      pDataSet.Append;
      ShowModal;
      AtuDados;
    End;
  Finally
    FreeAndNil(frmCad_Agenda);
  End;
end;

procedure TfrmAgenda.AgendaDblClick(Sender: TObject);
begin
  inherited;
  actEditarExecute(nil);
end;

procedure TfrmAgenda.AtuDados;
var
  StrSQL,Filtro: String;
begin
  inherited;
  case grpFiltro.ItemIndex of
    0:
      Filtro := ' COALESCE(A.FLAGBAIXADO,''N'') = ''N''' ;
    1:
      Filtro := '  COALESCE(A.FLAGBAIXADO,''N'') = ''Y''' ;
    2:
      Filtro := '  1=1 ';
  end;
  if not edtCliente.IsNull then
    Filtro := Filtro+ ' AND A.IDCLIENTE = '+edtCliente.ValorChaveString;
  if not edtFuncionario.IsNull then
    Filtro := Filtro+ ' AND A.IDFUNCIONARIO = '+edtFuncionario.ValorChaveString;

  SetCds(CdsAgenda,tpERPAGenda,Filtro);


end;

procedure TfrmAgenda.BitBtn4Click(Sender: TObject);
begin
  inherited;
  AtuDados;
end;

procedure TfrmAgenda.CdsAgendaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CdsAgenda.FieldByName('DATA_HORAINI').ProviderFlags := [];
  CdsAgenda.FieldByName('DATA_HORAFIM').ProviderFlags := [];
  CdsAgenda.FieldByName('TYPE').ProviderFlags := [];
  CdsAgenda.FieldByName('OPTIONS').ProviderFlags := [];
  CdsAgenda.FieldByName('CAPTION').ProviderFlags := [];
  CdsAgenda.FieldByName('NOMECLIENTE').ProviderFlags := [];
  
end;

procedure TfrmAgenda.CdsAgendaAfterPost(DataSet: TDataSet);
begin
  inherited;
  Try
    StartTrans;
    AlteraBanco(Ta,CdsAgenda,'AGENDA','IDAGENDA');
//    if Ta = taInsere then
//      RegistraAuditoria('Criou um novo registro em '+Self.Caption,'O Usuário '+USuarioLogado.Login+' criou um novo registro ',
//                        'AGENDA',Self.Name,Self.Caption,CdsAgenda.FieldByName('IDAGENDA').AsString, toIncluir,CdsAgenda,  False, False );
//    if Ta = taModifica then
//      RegistraAuditoria('Editou um  registro em '+Self.Caption,'O Usuário '+USuarioLogado.Login+' editou um registro ',
//                        'AGENDA',Self.Name,Self.Caption,CdsAgenda.FieldByName('IDAGENDA').AsString, toEditar,CdsAgenda,
//                         False, False );
    Commit;
  Except
    on e: Exception do
    Begin
      Rollback;
      Raise;
    End;
  End;
end;

procedure TfrmAgenda.CdsAgendaBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CdsAgenda.State = dsInsert then
    ta := taInsere
  else
    ta := taModifica;

end;

procedure TfrmAgenda.CdsAgendaNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsAgenda.FieldByName('IDAGENDA').AsInteger := GetValSeq('SEQ_IDAGENDA');
  CdsAgenda.FieldByName('DATACOMPROMISSO').AsString := GetDataServidor;
  CdsAgenda.FieldByName('DATACRIACAO').AsString := GetDataServidor;
  CdsAgenda.FieldByName('HORA').AsString := GetHoraServidor;
  CdsAgenda.FieldByName('FLAGBAIXADO').AsString := 'N';
end;

procedure TfrmAgenda.FormCreate(Sender: TObject);
begin
  inherited;
  ConfiguraEditPesquisa(edtCliente,nil,tpERPCliente);
  ConfiguraEditPesquisa(edtFuncionario,nil,tpERPFuncionario);
end;

procedure TfrmAgenda.FormShow(Sender: TObject);
begin
  AtuDados;
//  actNovo.Visible := GetPermissao(IdAgendaNovo);
//  actEditar.Visible := GetPermissao(IdAgendaEditar);
//  actExcluir.Visible := GetPermissao(IdAgendaExcluir);

  if IdAgenda > 0 then
  Begin
    CdsAgenda.Locate('IDAGENDA', IdAgenda,[]);
    Agenda.GoToDate(CdsAgenda.FieldByName('DATA_HORAINI').AsDateTime);
  End;

end;

procedure TfrmAgenda.grpTipoViewClick(Sender: TObject);
begin
  inherited;
  Agenda.SelectDays([Now],True);
  case grpTipoView.ItemIndex of
    0:
     Agenda.ViewDay.Active := True;
    1:
     Agenda.ViewWeeks.Active := True;
    2:
     Begin
       Agenda.SelectDays(FirstDay(Now),LastDay(Now),True);
       Agenda.ViewWeeks.Active := True;
     End;
    3:
     Agenda.ViewYear.Active := True;
  end;
end;


procedure TfrmAgenda.SetIdAgenda(const Value: Integer);
begin
  FIdAgenda := Value;

end;

end.
