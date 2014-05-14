unit udlg_ItensProposta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDlg_CadastroERP, StdCtrls, Buttons, ExtCtrls, Mask, EditPesquisa,
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
  cxMemo, cxDBEdit,DB;

type
  TfrmDlg_ItensProposta = class(TfrmDlg_CadastroERP)
    edtProduto: TEditPesquisa;
    edtQuantidade: TLabelDBEdit;
    edtValUni: TLabelDBEdit;
    edtPercDesc: TLabelDBEdit;
    edtPercAcrescimo: TLabelDBEdit;
    LabelDBEdit6: TLabelDBEdit;
    edtValorAcrescimo: TLabelDBEdit;
    edtValorDesc: TLabelDBEdit;
    LabelDBEdit9: TLabelDBEdit;
    GroupBox1: TGroupBox;
    cxDBMemo1: TcxDBMemo;
    procedure FormShow(Sender: TObject);
    procedure edtValUniExit(Sender: TObject);
    procedure edtPercDescExit(Sender: TObject);
    procedure edtPercAcrescimoExit(Sender: TObject);
    procedure edtValorDescExit(Sender: TObject);
    procedure edtValorAcrescimoExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtProdutoRegAchado(ADataSet: TDataSet);
  private
    FIdEmpresa: Integer;
    FIdCliente: Integer;
    FCdsProposta: TDataSet;
    { Private declarations }
    Procedure CalculaTotal;
    procedure SetCdsProposta(const Value: TDataSet);

  public
    { Public declarations }
    property CdsProposta: TDataSet read FCdsProposta write SetCdsProposta;

  end;

var
  frmDlg_ItensProposta: TfrmDlg_ItensProposta;

implementation

uses uCad_proposta, Comandos, MinhasClasses, uRegras;

{$R *.dfm}

procedure TfrmDlg_ItensProposta.FormShow(Sender: TObject);
begin
  inherited;
  ConfiguraEditPesquisa(edtProduto,pDataSet, tperpProduto,True);
end;


procedure TfrmDlg_ItensProposta.SetCdsProposta(const Value: TDataSet);
begin
  FCdsProposta := Value;
end;

procedure TfrmDlg_ItensProposta.btnOkClick(Sender: TObject);
begin
  VerificaEdit(edtProduto,'O produto/serviço deve ser informado');
  VerificaEdit(pDataSet,edtQuantidade,'','A quantidade deve ser informada');
  VerificaEdit(pDataSet,edtValUni,'','O valor deve ser informado');
  inherited;
  edtProduto.SetFocus;
end;

procedure TfrmDlg_ItensProposta.CalculaTotal;
begin
  pDataSet.FieldByName('VALORTOTAL').AsCurrency :=
          (pDataSet.FieldByName('SUBTOTAL').AsCurrency - pDataSet.FieldByName('VALORDESCONTO').AsCurrency)+
             pDataSet.FieldByName('VALORACRESCIMO').AsCurrency;
end;

procedure TfrmDlg_ItensProposta.edtPercAcrescimoExit(Sender: TObject);
begin
  inherited;
  pDataSet.FieldByName('VALORACRESCIMO').AsCurrency := pDataSet.FieldByName('SUBTOTAL').AsCurrency * pDataSet.FieldByName('ALIQACRESCIMO').AsCurrency/100;
  CalculaTotal;
end;

procedure TfrmDlg_ItensProposta.edtPercDescExit(Sender: TObject);
begin
  inherited;
  pDataSet.FieldByName('VALORDESCONTO').AsCurrency := pDataSet.FieldByName('SUBTOTAL').AsCurrency * pDataSet.FieldByName('ALIQDESCONTO').AsCurrency/100;
  CalculaTotal;
end;

procedure TfrmDlg_ItensProposta.edtProdutoRegAchado(ADataSet: TDataSet);
begin
  inherited;
  if (pDataSet.State in [dsInsert,dsEdit]) and (pDataSet.FieldByName('VALORUNITARIO').IsNull) then
     pDataSet.FieldByName('VALORUNITARIO').AsCurrency := TRegrasVendaProduto.PrecoVendaProduto(edtProduto.ValorChaveInteger,
                                                                   CdsProposta.FieldByName('IDCLIENTE').AsInteger,
                                                                   CdsProposta.FieldByName('IDEMPRESA').AsInteger,
                                                                   CdsProposta.FieldByName('DATA').AsDateTime );
end;

procedure TfrmDlg_ItensProposta.edtValorAcrescimoExit(Sender: TObject);
begin
  inherited;
  if pDataSet.FieldByName('VALORACRESCIMO').AsCurrency > 0  then
  begin
    pDataSet.FieldByName('ALIQACRESCIMO').AsCurrency := (pDataSet.FieldByName('VALORACRESCIMO').AsCurrency/pDataSet.FieldByName('SUBTOTAL').AsCurrency) * 100;

  end;
  CalculaTotal;
end;

procedure TfrmDlg_ItensProposta.edtValorDescExit(Sender: TObject);
begin
  inherited;
  if pDataSet.FieldByName('VALORDESCONTO').AsCurrency > 0  then
  begin
    pDataSet.FieldByName('ALIQDESCONTO').AsCurrency := (pDataSet.FieldByName('VALORDESCONTO').AsCurrency/pDataSet.FieldByName('SUBTOTAL').AsCurrency) * 100;

  end;
  CalculaTotal;
end;

procedure TfrmDlg_ItensProposta.edtValUniExit(Sender: TObject);
begin
  inherited;
  pDataSet.FieldByName('SUBTOTAL').AsCurrency := pDataSet.FieldByName('QUANTIDADE').AsCurrency *
                                                 pDataSet.FieldByName('VALORUNITARIO').AsCurrency;

  CalculaTotal;
end;

end.
