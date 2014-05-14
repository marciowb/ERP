unit uCadNCM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, ComCtrls, DB, DBClient, pFIBClientDataSet, ActnList,
  cxPC, cxContainer, cxEdit, cxTreeView, Buttons, ExtCtrls, StdCtrls, DBCtrls,
  Mask, LabelDBEdit, Grids, DBGrids, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  Cad_CadastroPai,uCad_CadastroPaiERP, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxDropDownEdit;

type
  TfrmCad_NCM = class(TfrmCad_CadastroPaiERP)
    Panel2: TPanel;
    LabelDBEdit1: TLabelDBEdit;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    CdsTributacoes: TpFIBClientDataSet;
    DataTributacoes: TDataSource;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1Column2: TcxGridDBColumn;
    cxGrid1DBTableView1Column3: TcxGridDBColumn;
    cxGrid1DBTableView1Column4: TcxGridDBColumn;
    cxGrid1DBTableView1Column5: TcxGridDBColumn;
    cxGrid1DBTableView1Column6: TcxGridDBColumn;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure CdsTributacoesBeforePost(DataSet: TDataSet);
    procedure CdsCadastroAfterPost(DataSet: TDataSet);
    procedure CdsCadastroAfterScroll(DataSet: TDataSet);
    procedure CdsTributacoesAfterOpen(DataSet: TDataSet);
    procedure CdsTributacoesBeforeEdit(DataSet: TDataSet);
    procedure CdsTributacoesNewRecord(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCad_NCM: TfrmCad_NCM;

implementation

uses MinhasClasses, Comandos;

{$R *.dfm}

procedure TfrmCad_NCM.CdsCadastroAfterPost(DataSet: TDataSet);
begin
  inherited;
  SetRegistros(CdsTributacoes, tpERPNCMTributacao);
end;

procedure TfrmCad_NCM.CdsCadastroAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SetCds(CdsTributacoes, tpERPNCMTributacao, 'IDNCM = '+ValorChave);
end;

procedure TfrmCad_NCM.CdsTributacoesAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CdsTributacoes.FieldByName('FLAGEDICAO').ProviderFlags := [];
  FormataMascara(CdsTributacoes.FieldByName('ALIQPIS'), tcPercent);
  FormataMascara(CdsTributacoes.FieldByName('ALIQCOFINS'), tcPercent);
  FormataMascara(CdsTributacoes.FieldByName('ALIQII'), tcPercent);
  FormataMascara(CdsTributacoes.FieldByName('ALIQIPI'), tcPercent);
  FormataMascara(CdsTributacoes.FieldByName('VALOR_LI'), tcReal);
//  FormataMascara(CdsTributacoes.FieldByName('DATA'), tcCampoData);
end;

procedure TfrmCad_NCM.CdsTributacoesBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  MudaEstado;
end;

procedure TfrmCad_NCM.CdsTributacoesBeforePost(DataSet: TDataSet);
Var
  Achou: Boolean;
begin
  inherited;
  if (CdsTributacoes.State = dsEdit) and (CdsTributacoes.FieldByName('FLAGEDICAO').AsString = 'N') then
    CdsTributacoes.FieldByName('FLAGEDICAO').AsString := 'E';

//  with TpFIBClientDataSet.Create(nil) do
//  begin
//    CloneCursor(CdsTributacoes,True);
//    Achou := Locate('Data',CdsTributacoes.FieldByName('DATA').Value,[]);
//    Free;
//  end;
//  if (Achou) and (CdsTributacoes.FieldByName('FLAGEDICAO').AsString <> 'D') then
//    AvisaErro('Já existe a data '+CdsTributacoes.FieldByName('DATA').AsString+' cadastrada!' );
end;

procedure TfrmCad_NCM.CdsTributacoesNewRecord(DataSet: TDataSet);
var
  StrSQL: String;
begin
  inherited;
  MudaEstado;
  CdsTributacoes.FieldByName('IDNCMESTADO').AsString := GetCodigo(tpERPNCMTributacao);
  CdsTributacoes.FieldByName('IDNCM').AsString := ValorChave;
//  StrSQL :=
//    'SELECT FIRST 1 COALESCE(DATEADD(1 DAY TO MAX(DATA)),CURRENT_DATE) DATA,'+
//    '       N.ALIQPIS, ALIQCOFINS, ALIQII, ALIQIPI, VALOR_LI'+
//    '  FROM NCMIMPOSTOS N'+
//    ' WHERE IDNCM  = '+ValorChave+
//    ' GROUP BY N.ALIQPIS, ALIQCOFINS, ALIQII, ALIQIPI, VALOR_LI'+
//    ' ORDER BY 1 DESC';
//  with GetCds(StrSQL)do
//  begin
//    CdsTributacoes.FieldByName('DATA').Value := GetDataServidor; //FieldByName('DATA').Value;
//    CdsTributacoes.FieldByName('ALIQPIS').Value := FieldByName('ALIQPIS').Value;
//    CdsTributacoes.FieldByName('ALIQCOFINS').Value := FieldByName('ALIQCOFINS').Value;
//    CdsTributacoes.FieldByName('ALIQII').Value := FieldByName('ALIQII').Value;
//    CdsTributacoes.FieldByName('ALIQIPI').Value := FieldByName('ALIQIPI').Value;
//    CdsTributacoes.FieldByName('VALOR_LI').Value := FieldByName('VALOR_LI').Value;
//    Free;
//  end;
  CdsTributacoes.FieldByName('FLAGEDICAO').AsString := 'I';
end;

procedure TfrmCad_NCM.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPesquisa := tpERPNCM;
end;

procedure TfrmCad_NCM.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  CdsTributacoes.Append;
  //GridImpostos.SetFocus;
end;

procedure TfrmCad_NCM.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  CdsTributacoes.Edit;
 // GridImpostos.SetFocus;
end;

procedure TfrmCad_NCM.SpeedButton3Click(Sender: TObject);
begin
  inherited;
   if ConfirmaDel then
  begin
    CdsTributacoes.Edit;
    CdsTributacoes.FieldByName('FLAGEDICAO').AsString :='D';
    CdsTributacoes.Post;
  end;
end;

end.
