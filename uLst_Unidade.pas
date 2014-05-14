unit uLst_Unidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTL, cxTLdxBarBuiltInMenu, StdCtrls,
  DBCtrls, DBClient, pFIBClientDataSet, Menus, ActnList, cxInplaceContainer,
  cxTLData, cxDBTL, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  ComCtrls, ToolWin, Buttons, Mask, LabelDBEdit, cxSplitter, ExtCtrls,
  Lst_CadastroERP, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TfrmLst_Unidade = class(TfrmLstCadastroSimplesERP)
    DBCheckBox1: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CdsCadastroNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLst_Unidade: TfrmLst_Unidade;

implementation

uses MinhasClasses;

{$R *.dfm}

procedure TfrmLst_Unidade.CdsCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsCadastro.FieldByName('FLAGFRACIONADO').AsString := 'N';
end;

procedure TfrmLst_Unidade.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPesquisa := tpERPUnidade;
end;

end.
