unit udlg_SaidaSerial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDlg_CadastroERP, StdCtrls, Buttons, ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, DBClient, pFIBClientDataSet, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxImageComboBox;

type
  TfrmDlg_SaidaSerial = class(TfrmDlg_CadastroERP)
    TvSeriais: TcxGridDBTableView;
    GridSerialLevel1: TcxGridLevel;
    GridSerial: TcxGrid;
    DataSeriais: TDataSource;
    CdsSeriais: TpFIBClientDataSet;
    vSeriaisColumn1: TcxGridDBColumn;
    vSeriaisColumn2: TcxGridDBColumn;
    edtPesquisa: TEdit;
    procedure TvSeriaisDblClick(Sender: TObject);
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
  private
    FIdProduto: String;
    procedure SetIdProduto(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property IdProduto: String read FIdProduto write SetIdProduto;
  end;

var
  frmDlg_SaidaSerial: TfrmDlg_SaidaSerial;

implementation

uses UDmConexao, Comandos, MinhasClasses;

{$R *.dfm}

procedure TfrmDlg_SaidaSerial.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  CdsSeriais.Locate('serial',edtPesquisa.Text+Key,[loPartialKey,loCaseInsensitive]);
  GridSerial.SetFocus;
end;

procedure TfrmDlg_SaidaSerial.SetIdProduto(const Value: String);
begin
  FIdProduto := Value;
  SetCds(CdsSeriais,tpERPSerialProdutoAtivo,' idproduto = '+Value);
end;

procedure TfrmDlg_SaidaSerial.TvSeriaisDblClick(Sender: TObject);
begin
  inherited;
  CdsSeriais.Edit;
  if ((CdsSeriais.FieldByName('flagedicao').AsString = 'N') or
      (CdsSeriais.FieldByName('flagedicao').AsString ='D' )) then
    CdsSeriais.FieldByName('flagedicao').AsString := 'U'
  else
  if CdsSeriais.FieldByName('flagedicao').AsString = 'U' then
    CdsSeriais.FieldByName('flagedicao').AsString := 'D';

  CdsSeriais.Post;
end;

end.
