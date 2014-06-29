unit Lst_OperacaoEstoque;

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
  Buttons, Mask, DBCtrls, LabelDBEdit, cxSplitter, ExtCtrls, cxContainer,
  cxCheckBox, cxDBEdit;

type
  TfrmLst_OperacaoEstoque = class(TfrmLstCadastroSimplesERP)
    LabelDBEdit1: TLabelDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    cxDBCheckBox1: TcxDBCheckBox;
    DBRadioGroup2: TDBRadioGroup;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBCheckBox3: TcxDBCheckBox;
    procedure actGravarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLst_OperacaoEstoque: TfrmLst_OperacaoEstoque;

implementation

uses Comandos, MinhasClasses;

{$R *.dfm}

procedure TfrmLst_OperacaoEstoque.actGravarExecute(Sender: TObject);
begin
  if CdsCadastro.FieldByName('FLAGTIPOOPERACAO').AsString = '' then
    AvisaErro('Informe o tipo de operação');
  if CdsCadastro.FieldByName('FLAGTIPOPESSOA').AsString = '' then
    AvisaErro('Informe o tipo de pessoa');

  inherited;

end;

procedure TfrmLst_OperacaoEstoque.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPesquisa := tpERPOperacao;
  CriaColuna('CODIGO','Código');
  CriaColuna('NOMEOPERACAOESTOQUE','Operação',200);
end;

end.
