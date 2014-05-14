unit uCad_Fornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCad_CadastroPaiERP, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, ComCtrls, Menus, DB, DBClient, pFIBClientDataSet,
  ActnList, cxPC, cxContainer, cxEdit, cxTreeView, Buttons, ExtCtrls, StdCtrls,
  Mask, DBCtrls, LabelDBEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  TfrmCad_Fornecedor = class(TfrmCad_CadastroPaiERP)
    LabelDBEdit1: TLabelDBEdit;
    LabelDBEdit2: TLabelDBEdit;
    LabelDBEdit3: TLabelDBEdit;
    LabelDBEdit4: TLabelDBEdit;
    LabelDBEdit5: TLabelDBEdit;
    LabelDBEdit6: TLabelDBEdit;
    LabelDBEdit7: TLabelDBEdit;
    LabelDBEdit8: TLabelDBEdit;
    LabelDBEdit9: TLabelDBEdit;
    LabelDBEdit10: TLabelDBEdit;
    LabelDBEdit11: TLabelDBEdit;
    LabelDBEdit12: TLabelDBEdit;
    LabelDBEdit13: TLabelDBEdit;
    LabelDBEdit14: TLabelDBEdit;
    GroupBox1: TGroupBox;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    DBComboBox1: TDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure CdsCadastroNewRecord(DataSet: TDataSet);
    procedure CdsCadastroAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure AtualizaPermissoes;
  end;

var
  frmCad_Fornecedor: TfrmCad_Fornecedor;

implementation

uses MinhasClasses, Comandos;

{$R *.dfm}

procedure TfrmCad_Fornecedor.AtualizaPermissoes;
begin
  inherited;
//  actNovo.Visible := GetPermissao(IdCadastroFornecedorNovo);
//  actEditar.Visible := GetPermissao(IdCadastroFornecedorEditar);
//  actDeletar.Visible := GetPermissao(IdCadastroFornecedorExcluir);
end;

procedure TfrmCad_Fornecedor.CdsCadastroAfterOpen(DataSet: TDataSet);
begin
  inherited;
  FormataMascara(cdsCadastro.FieldByName('CNPJ'), tcCNPJ);
end;

procedure TfrmCad_Fornecedor.CdsCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  cdsCadastro.FieldByName('DATACADASTRO').AsString := GetDataServidor;
end;

procedure TfrmCad_Fornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPesquisa := tpERPFornecedor;

end;

end.
