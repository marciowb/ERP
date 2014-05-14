unit Cad_usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCad_CadastroPaiERP, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, ComCtrls, DB, DBClient, pFIBClientDataSet, ActnList,
  cxPC, cxContainer, cxEdit, cxTreeView, Buttons, ExtCtrls, StdCtrls, Mask,
  DBCtrls, LabelDBEdit, cxCustomData, cxStyles, cxTL, cxTLdxBarBuiltInMenu,
  cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit, cxImageComboBox,
  cxEditRepositoryItems, Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, EditPesquisa;

type
  TfrmCad_usuario = class(TfrmCad_CadastroPaiERP)
    Panel2: TPanel;
    LabelDBEdit3: TLabelDBEdit;
    LabelDBEdit1: TLabelDBEdit;
    LabelDBEdit2: TLabelDBEdit;
    DBCheckBox1: TDBCheckBox;
    actMudaAcesso: TAction;
    edtPerfil: TEditPesquisa;
    procedure FormCreate(Sender: TObject);
    procedure CdsCadastroNewRecord(DataSet: TDataSet);
    procedure cxDBTreeList1DblClick(Sender: TObject);
  private
    { Private declarations }
    Procedure MudaAcesso;
  public
    { Public declarations }
  end;

var
  frmCad_usuario: TfrmCad_usuario;

implementation

uses Comandos, MinhasClasses, UDmConexao;

{$R *.dfm}

procedure TfrmCad_usuario.CdsCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CdsCadastro.FieldByName('FLAGADMINISTRADOR').AsString := 'N';
end;

procedure TfrmCad_usuario.cxDBTreeList1DblClick(Sender: TObject);
begin
  inherited;
  MudaAcesso;
end;

procedure TfrmCad_usuario.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPesquisa :=tpERPUsuario;
end;


procedure TfrmCad_usuario.MudaAcesso;
begin
  MudaEstado;

end;

end.

