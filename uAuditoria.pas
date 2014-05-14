unit uAuditoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormPadrao, StdCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxSplitter, Grids, DBGrids, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxContainer, DBCtrls, cxImage,
  cxDBEdit, DBClient, pFIBClientDataSet, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, Buttons, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TfrmAuditoria = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Panel2: TPanel;
    cxSplitter1: TcxSplitter;
    DBGrid1: TDBGrid;
    TvOcorrencias: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    GroupBox4: TGroupBox;
    cxSplitter2: TcxSplitter;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    cxSplitter3: TcxSplitter;
    cxDBImage1: TcxDBImage;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DataUsuario: TDataSource;
    DataOcorrencias: TDataSource;
    CdsUsuario: TpFIBClientDataSet;
    CdsOcorrencias: TpFIBClientDataSet;
    vOcorrenciasColumn1: TcxGridDBColumn;
    vOcorrenciasColumn2: TcxGridDBColumn;
    vOcorrenciasColumn3: TcxGridDBColumn;
    vOcorrenciasColumn4: TcxGridDBColumn;
    vOcorrenciasColumn5: TcxGridDBColumn;
    vOcorrenciasColumn6: TcxGridDBColumn;
    vOcorrenciasColumn7: TcxGridDBColumn;
    GroupBox7: TGroupBox;
    edtDataIni: TcxDateEdit;
    edtDataFin: TcxDateEdit;
    Label1: TLabel;
    Atualizar: TBitBtn;
    procedure CdsUsuarioAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure AtualizarClick(Sender: TObject);
  private
    FFiltro: String;
    { Private declarations }
    Procedure Atualiza;
  public
    { Public declarations }
    Property Filtro: String read FFiltro write FFiltro;
  end;

var
  frmAuditoria: TfrmAuditoria;

implementation

uses Comandos, MinhasClasses;

{$R *.dfm}

procedure TfrmAuditoria.Atualiza;
var
  Wr,StrSQL,Data: String;
begin
  inherited;


  GetPeriodo(edtDataIni.Text, edtDataFin.Text, Data,'Data',False);
  if not USuarioLogado.Administrador then
    Wr := ' IDUSUARIO = '+GetInteger(USuarioLogado.Id)
  else
    Wr := ' 1= 1 ';
  SetCds(CdsUsuario,tpCSUsuario, Wr) ;

  StrSQL :=
      'SELECT IDAUDITORIA, DATA, HORA, IDUSUARIO,'+
      '       case when OPERACAO = ''I'' then ''Incluiu'''+
      '            when OPERACAO = ''E'' then ''Editou'''+
      '            when OPERACAO = ''D'' then ''Deletou'''+
      '            when OPERACAO = ''P'' then ''Imprimiu'''+
      '            when OPERACAO = ''L'' then ''Login'''+
      '            when OPERACAO = ''O'' then ''Logoff'''+
      '            when OPERACAO = ''A'' then ''Acessou'' end operacao,'+
      '       TEXTO, NOMEPC, case when FLAGERRO = ''Y'' then ''Sim'' else ''Não'' end FLAGERRO,'+
      '       IMGERRO, TABELA, IDTABELA, NOMEFORM,'+
      '       CAPTION, TEXTOANTERIOR, RESUMO'+
      '  FROM AUDITORIA '+
      ' WHERE '+Wr+FFiltro+Data+
      ' ORDER BY IDAUDITORIA DESC ';
  SetCds(CdsOcorrencias, StrSQL);

end;

procedure TfrmAuditoria.AtualizarClick(Sender: TObject);
begin
  inherited;
  Atualiza;
end;

procedure TfrmAuditoria.CdsUsuarioAfterScroll(DataSet: TDataSet);
begin
  inherited;
  CdsOcorrencias.Filter := 'IDUSUARIO = '+ CdsUsuario.FieldByName('IDUSUARIO').AsString;
  CdsOcorrencias.Filtered := True;
end;

procedure TfrmAuditoria.FormShow(Sender: TObject);
begin
  edtDataIni.Date := StrToDate(GetDataServidor)-30;
  edtDataFin.Date := StrToDate(GetDataServidor);
  Atualiza;
  TvOcorrencias.OptionsView.GroupByBox := True;
end;

end.
