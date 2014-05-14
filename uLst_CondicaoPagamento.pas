unit uLst_CondicaoPagamento;

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
  TfrmLst_CondicaoPagamento = class(TfrmLstCadastroSimplesERP)
    edtMaxParcela: TLabelDBEdit;
    grpTipoPagamento: TDBRadioGroup;
    edtContaBancaria: TEditPesquisa;
    LabelDBEdit1: TLabelDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure CdsCadastroAfterScroll(DataSet: TDataSet);
    procedure grpTipoPagamentoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure AtualizaObj;
  end;

var
  frmLst_CondicaoPagamento: TfrmLst_CondicaoPagamento;

implementation

uses MinhasClasses, Comandos, uConstantes;

{$R *.dfm}

procedure TfrmLst_CondicaoPagamento.AtualizaObj;
begin
  if grpTipoPagamento.ItemIndex >= 0 then
  Begin
    edtMaxParcela.Enabled := not (grpTipoPagamento.ItemIndex   in [FormaPagamentoDinheiro,FormaPagamentoDeposito,FormaPagamentoNaoGeraFinanceiro]);
    edtContaBancaria.Enabled := grpTipoPagamento.ItemIndex  in [FormaPagamentoBoleto,FormaPagamentoDeposito];
  End;
end;

procedure TfrmLst_CondicaoPagamento.CdsCadastroAfterScroll(DataSet: TDataSet);
begin
  inherited;
  AtualizaObj;
end;

procedure TfrmLst_CondicaoPagamento.grpTipoPagamentoChange(Sender: TObject);
begin
  inherited;
  AtualizaObj;
end;

procedure TfrmLst_CondicaoPagamento.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPesquisa := tpERPCondicaoPagamento;

end;

procedure TfrmLst_CondicaoPagamento.FormShow(Sender: TObject);
begin
  inherited;
  ConfiguraEditPesquisa(edtContaBancaria,CdsCadastro,tpERPContaBancaria);
  edtContaBancaria.AutoCompletar := False;
  AtualizaObj;
end;

end.
