unit uLst_ContaBancaria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Lst_CadastroERP, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTL, cxTLdxBarBuiltInMenu,
  DBClient, pFIBClientDataSet, Menus, ActnList, cxInplaceContainer, cxTLData,
  cxDBTL, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxPC, ComCtrls, ToolWin, StdCtrls,
  Buttons, Mask, DBCtrls, LabelDBEdit, cxSplitter, ExtCtrls, EditPesquisa;

type
  TfrmLst_ContaBancaria = class(TfrmLstCadastroSimplesERP)
    edtBanco: TEditPesquisa;
    LabelDBEdit1: TLabelDBEdit;
    LabelDBEdit2: TLabelDBEdit;
    LabelDBEdit3: TLabelDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    LabelDBEdit4: TLabelDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure CdsCadastroAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLst_ContaBancaria: TfrmLst_ContaBancaria;

implementation

uses MinhasClasses, Comandos;

{$R *.dfm}

procedure TfrmLst_ContaBancaria.CdsCadastroAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CdsCadastro.FieldByName('CODIGO').ProviderFlags := [];
end;

procedure TfrmLst_ContaBancaria.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPesquisa := tpERPContaBancaria;
  ConfiguraEditPesquisa(edtBanco,CdsCadastro,tpERPBanco);
  edtBanco.AutoCompletar := false;
  CriaColuna('Agencia','Agência');
  CriaColuna('Codigo','Banco');
  CriaColuna('Conta','Conta');
end;

end.
