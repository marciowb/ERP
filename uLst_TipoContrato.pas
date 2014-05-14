unit uLst_TipoContrato;

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
  TfrmLst_TipoContrato = class(TfrmLstCadastroSimplesERP)
    LabelDBEdit1: TLabelDBEdit;
    edtLayoutTipoContrato: TEditPesquisa;
    grpRegra: TDBRadioGroup;
    edtMulta: TLabelDBEdit;
    DBCheckBox1: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CdsCadastroNewRecord(DataSet: TDataSet);
    procedure grpRegraChange(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure CdsCadastroAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLst_TipoContrato: TfrmLst_TipoContrato;

implementation

uses MinhasClasses, Comandos;

{$R *.dfm}

procedure TfrmLst_TipoContrato.actGravarExecute(Sender: TObject);
begin
  if (grpRegra.ItemIndex = 1) and (edtMulta.AsCurrency <= 0) then
  begin
    Avisa('Informe a alíquota de multa');
    edtMulta.SetFocus;
    Exit;
  end;
  inherited;

end;

procedure TfrmLst_TipoContrato.CdsCadastroAfterOpen(DataSet: TDataSet);
begin
  inherited;
  FormataMascara( CdsCadastro.FieldByName('ALIQMULTAQUEBRA'),tcPercent);
end;

procedure TfrmLst_TipoContrato.CdsCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsCadastro.FieldByName('FLAGREGRAQUEBRA').AsString := 'N';
end;

procedure TfrmLst_TipoContrato.grpRegraChange(Sender: TObject);
begin
  inherited;
  edtMulta.Enabled := grpRegra.ItemIndex = 1;

end;

procedure TfrmLst_TipoContrato.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPesquisa:= tpERPTipoContrato;
  CriaColuna('Codigo','Código');
  CriaColuna('NOMETIPOCONTRATO','Descrição',180);
end;

end.
