unit Cad_CEP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCad_CadastroPaiERP, ComCtrls, DB, DBClient, ActnList, cxPC, cxControls,
  cxContainer, cxTreeView, Buttons, ExtCtrls, StdCtrls, Mask, DBCtrls,
  LabelDBEdit,  pFIBClientDataSet, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxEdit, Cad_CadastroPai, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter;

type
  TfrmCad_CEP = class(TfrmCad_CadastroPaiERP)
    edtCEP: TLabelDBEdit;
    LabelDBEdit2: TLabelDBEdit;
    LabelDBEdit3: TLabelDBEdit;
    LabelDBEdit4: TLabelDBEdit;
    Label1: TLabel;
    cmbUF: TDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure actGravarExecute(Sender: TObject);
    procedure CdsCadastroAfterOpen(DataSet: TDataSet);
    procedure actNovoExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure AtualizaPermissoes;//Override;
  end;

var
  frmCad_CEP: TfrmCad_CEP;

implementation

uses Comandos, MinhasClasses;



{$R *.dfm}

procedure TfrmCad_CEP.actGravarExecute(Sender: TObject);
begin
  VerificaEdits := True;
  if cmbUF.Text = '' then
  Begin
    Avisa('Informe a UF');
    cmbUF.SetFocus;
    Exit;
  End;
  inherited;
end;

procedure TfrmCad_CEP.actNovoExecute(Sender: TObject);
begin
  inherited;
  edtCEP.SetFocus;
end;

procedure TfrmCad_CEP.AtualizaPermissoes;
begin
  inherited;
//  actNovo.Visible := GetPermissao(IdCadastroCEPNovo);
//  actEditar.Visible := GetPermissao(IdCadastroCEPEditar);
//  actDeletar.Visible := GetPermissao(IdCadastroCEPExcluir);

end;

procedure TfrmCad_CEP.CdsCadastroAfterOpen(DataSet: TDataSet);
begin
  inherited;
  FormataMascara(CdsCadastro.FieldByName('cep'), tcCEP);
end;

procedure TfrmCad_CEP.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPesquisa := tpImoCEP;

  
end;

end.
