unit uLst_Proposta;

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
  TfrmLst_Proposta = class(TfrmListagemPadraoERP)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLst_Proposta: TfrmLst_Proposta;

implementation

uses MinhasClasses, uCad_proposta, Comandos;

{$R *.dfm}

procedure TfrmLst_Proposta.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPesquisa := tpERPProposta;
  CriaColuna('CODIGOEMPRESA','Empresa',80, tcString);
  CriaColuna('NUMEROPROPOSTA','Nº da proposta',100, tcString);
  CriaColuna('DATA','Data',100, tcCampoData);
  CriaColuna('CODIGOCLIENTE','Código do cliente',100, tcString);
  CriaColuna('NOMECLIENTE','Nome do cliente',200, tcString);
  CriaRodapeTableView(CriaColuna('VALORTOTALPROPOSTA','Valor total',200, tcMoeda),skSum,skSum);
  CriaColuna('LOGIN','Usuário',100, tcString);
  CriaColuna('STATUSPROPOSTA','Status',100, tcString);



end;

procedure TfrmLst_Proposta.FormShow(Sender: TObject);
begin
  inherited;
  Self.FormCadastro :=  frmCad_Proposta;
  Self.ClasseCadPai := TfrmCad_Proposta;
  AtuDados;
end;

end.
