unit uLst_Entrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uListagemPadraoERP, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, DBClient,
  pFIBClientDataSet, ActnList, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  StdCtrls, Buttons, dxStatusBar, ExtCtrls;

type
  TfrmLst_Entrada = class(TfrmListagemPadraoERP)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLst_Entrada: TfrmLst_Entrada;

implementation

uses MinhasClasses, uCad_Entrada, uForms;

{$R *.dfm}

procedure TfrmLst_Entrada.actNovoExecute(Sender: TObject);
begin
//  inherited;
   TrotinasForms.AbreEntradaProduto;
end;

procedure TfrmLst_Entrada.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPesquisa := tpERPEntrada;
  CriaColuna('CODIGOEMPRESA','Empresa',80,tcString);
  CriaColuna('DATA','Data',90,tcCampoData);
  CriaColuna('NUMERONOTA','Nº nota',100,tcString);
  CriaColuna('MODELO','Modelo',50,tcString);
  CriaColuna('PESSOA','Pessoa',300,tcString);
  CriaColuna('TIPOPESSOA','Tipo de Pessoa',100,tcString);
  CriaColuna('NOMEOPERACAOESTOQUE','Operação',150,tcString);
  CriaColuna('ESTACANCELADA','Cancelada',80,tcString);
  CriaColuna('VALORTOTALNOTA','Valor total',100,tcReal);
  CriaColuna('LOGIN','Usuário',80,tcString);
end;

procedure TfrmLst_Entrada.FormShow(Sender: TObject);
begin
  inherited;
  Self.FormCadastro :=  frmCad_Entrada;
  Self.ClasseCadPai := TfrmCad_Entrada;
  AtuDados;
end;

end.
