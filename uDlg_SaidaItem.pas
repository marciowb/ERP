unit uDlg_SaidaItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uAddItemPadrao, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, DB, cxTextEdit,
  cxMemo, cxDBEdit, StdCtrls, DBCtrls, LabelDBEdit, Mask, EditPesquisa, Buttons,
  ExtCtrls;

type
  TfrmDlg_SaidaItem = class(TfrmAddItemPadrao)
    LabelDBEdit2: TLabelDBEdit;
    LabelDBEdit17: TLabelDBEdit;
    LabelDBEdit19: TLabelDBEdit;
    LabelDBEdit20: TLabelDBEdit;
    LabelDBEdit21: TLabelDBEdit;
    LabelDBEdit22: TLabelDBEdit;
    LabelDBEdit25: TLabelDBEdit;
    LabelDBEdit24: TLabelDBEdit;
    LabelDBEdit23: TLabelDBEdit;
    LabelDBEdit28: TLabelDBEdit;
    LabelDBEdit27: TLabelDBEdit;
    LabelDBEdit26: TLabelDBEdit;
    LabelDBEdit29: TLabelDBEdit;
    LabelDBEdit30: TLabelDBEdit;
    LabelDBEdit31: TLabelDBEdit;
    LabelDBEdit32: TLabelDBEdit;
    LabelDBEdit33: TLabelDBEdit;
    LabelDBEdit34: TLabelDBEdit;
    edtAlmoxarifado: TEditPesquisa;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmDlg_SaidaItem: TfrmDlg_SaidaItem;

implementation

uses Comandos, MinhasClasses;

{$R *.dfm}

procedure TfrmDlg_SaidaItem.FormShow(Sender: TObject);
begin
    edtProduto.CamposExtraPesquisa := 'IDUNIDADE,IDNCM,IDCODIGOMUNICIPALSERVICO,'+
                          'CST,CSOSN,CUSTOMEDIO,CUSTOATUAL,CUSTOCONTABIL,CODIGOBARRAS,MARKUP';
  inherited;
  edtProduto.UsaBtnNovo := false;
  edtProduto.UsaBtnEditar := false;
  ConfiguraEditPesquisa(EdtAlmoxarifado,pDataSet,tpERPAlmoxarifado);

end;

end.
