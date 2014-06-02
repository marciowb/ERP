unit uCad_Funcionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCad_CadastroPaiERP, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, ComCtrls, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, DB, DBClient,
  pFIBClientDataSet, ActnList, cxPC, cxContainer, cxEdit, cxTreeView, Buttons,
  ExtCtrls, StdCtrls, Mask, DBCtrls, LabelDBEdit, cxImage, cxDBEdit,
  EditPesquisa, cxTextEdit, cxMemo;

type
  TfrmCadFuncionario = class(TfrmCad_CadastroPaiERP)
    LabelDBEdit1: TLabelDBEdit;
    LabelDBEdit2: TLabelDBEdit;
    LabelDBEdit3: TLabelDBEdit;
    LabelDBEdit4: TLabelDBEdit;
    pnlFoto: TPanel;
    cxDBImage1: TcxDBImage;
    LabelDBEdit5: TLabelDBEdit;
    edtUsuario: TEditPesquisa;
    edtDeparetamento: TEditPesquisa;
    GroupBox1: TGroupBox;
    cxDBMemo1: TcxDBMemo;
    edtCargo: TEditPesquisa;
    LabelDBEdit6: TLabelDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure edtDeparetamentoBtnNovoClick(Sender: TObject);
    procedure edtDeparetamentoBtnPesquisaClick(Sender: TObject);
    procedure edtCargoBtnNovoClick(Sender: TObject);
    procedure edtCargoBtnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFuncionario: TfrmCadFuncionario;

implementation

uses MinhasClasses, Comandos, uForms;

{$R *.dfm}

procedure TfrmCadFuncionario.edtCargoBtnNovoClick(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroCargos(toIncluir)
end;

procedure TfrmCadFuncionario.edtCargoBtnPesquisaClick(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroCargos(toEditar)
end;

procedure TfrmCadFuncionario.edtDeparetamentoBtnNovoClick(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroDepartamento(toIncluir)
end;

procedure TfrmCadFuncionario.edtDeparetamentoBtnPesquisaClick(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroDepartamento(toEditar)
end;

procedure TfrmCadFuncionario.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPesquisa := tpERPFuncionario;
  ConfiguraEditPesquisa(edtUsuario,CdsCadastro,tpERPUsuario);
  ConfiguraEditPesquisa(edtDeparetamento,CdsCadastro,tpERPDepartamento,False,'','','CODIGO','',6,nil);

  ConfiguraEditPesquisa(edtCargo,CdsCadastro,tpERPCargo,False,'','','CODIGO','',6,nil);
end;

end.
