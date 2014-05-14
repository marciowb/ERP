unit uLst_Contratos;

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
  TfrmLst_Contratos = class(TfrmListagemPadraoERP)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLst_Contratos: TfrmLst_Contratos;

implementation

uses MinhasClasses;

{$R *.dfm}

procedure TfrmLst_Contratos.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPesquisa := tpERPContrato;
  CriaColuna('CODIGO_EMPRESA','Empresa',50,tcString);
  CriaColuna('NUMEROCONTRATO','Nº contrato',90,tcString);
  CriaColuna('DATA','Data',90,tcCampoData);
  CriaColuna('NOMECLIENTE','Cliente',200,tcString);
  CriaColuna('VALORTOTAL','Valor',100,tcReal);
  CriaColuna('LOGIN','Usuario',100,tcString);
  CriaColuna('FLAGSTATUS','Status',100,tcString);

end;

procedure TfrmLst_Contratos.FormShow(Sender: TObject);
begin
  inherited;
  AtuDados;
end;

end.
