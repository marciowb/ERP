unit udlg_ItensProposta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uAddItemPadrao, StdCtrls, Buttons, ExtCtrls, Mask, EditPesquisa,
  DBCtrls, LabelDBEdit, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxTextEdit,
  cxMemo, cxDBEdit,DB, uDlg_CadastroERP;

type
  TfrmDlg_ItensProposta = class(TfrmAddItemPadrao)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FIdEmpresa: Integer;
    FIdCliente: Integer;
    FCdsProposta: TDataSet;
    FSomenteServicos: Boolean;
    procedure SetSomenteServicos(const Value: Boolean);
    { Private declarations }


  public
    { Public declarations }

     property SomenteServicos: Boolean read FSomenteServicos write SetSomenteServicos;
  end;

var
  frmDlg_ItensProposta: TfrmDlg_ItensProposta;

implementation

uses uCad_proposta, Comandos, MinhasClasses, uRegras;

{$R *.dfm}


{ TfrmDlg_ItensProposta }

procedure TfrmDlg_ItensProposta.FormCreate(Sender: TObject);
begin
  inherited;
  FSomenteServicos := False;
end;

procedure TfrmDlg_ItensProposta.FormShow(Sender: TObject);
begin
  inherited;
  if  FSomenteServicos then
    edtProduto.SQLComp := 'TIPOPRODUTO = ''S'' ';
end;

procedure TfrmDlg_ItensProposta.SetSomenteServicos(const Value: Boolean);
begin
  FSomenteServicos := Value;
end;

end.
