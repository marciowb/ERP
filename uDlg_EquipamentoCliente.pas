unit uDlg_EquipamentoCliente;

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
  cxMemo, cxDBEdit, DB, DBClient, pFIBClientDataSet;

type
  TfrmDlg_EquipamentoCliente = class(TfrmDlg_CadastroERP)
    edtEquipamento: TLabelDBEdit;
    edtProduto: TEditPesquisa;
    edtIdentificador: TLabelDBEdit;
    GroupBox1: TGroupBox;
    cxDBMemo1: TcxDBMemo;
    DataEquipamento: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtProdutoRegAchado(ADataSet: TDataSet);
    procedure edtProdutoRegNaoAchado(ADataSet: TDataSet; Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    FUsaDataSetInterno: Boolean;
    FIdCliente: String;
    FEditReg: Boolean;
    FNovoReg: Boolean;
    procedure SetUsaDataSetInterno(const Value: Boolean);
    procedure SetIdCliente(const Value: String);
    procedure AfterPost(DataSet: TDataSet);
    { Private declarations }
  public
    { Public declarations }
    property UsaDataSetInterno: Boolean read FUsaDataSetInterno write SetUsaDataSetInterno;
    property IdCliente: String read FIdCliente write SetIdCliente;
    property NovoReg : Boolean read FNovoReg write FNovoReg;
    property EditReg : Boolean read FEditReg write FEditReg;
  end;

var
  frmDlg_EquipamentoCliente: TfrmDlg_EquipamentoCliente;

implementation

uses Comandos, MinhasClasses;

{$R *.dfm}

procedure TfrmDlg_EquipamentoCliente.AfterPost(DataSet: TDataSet);
begin
  if UsaDataSetInterno then
    Try
      StartTrans;
      AlteraBanco(taInsertOrUpdate,pDataSet,tpERPClienteEquipamento);
      Commit;
    Except
      on e:Exception do
      begin
        RollBack;
        raise;
      end;
    End;

end;

procedure TfrmDlg_EquipamentoCliente.btnOkClick(Sender: TObject);
begin
  VerificaEdit(pDataSet,edtEquipamento,'','Informe uma descrição');
  VerificaEdit(pDataSet,edtIdentificador,'O identificador não pode se repetir','Informe uma identificação');
  if pDataSet.FieldByName('IDCLIENTEEQUIPAMENTOS').IsNull then
  begin
    pDataSet.FieldByName('IDCLIENTEEQUIPAMENTOS').Value := GetCodigo(tpERPClienteEquipamento);
    pDataSet.FieldByName('IDCLIENTE').Value := IdCliente;
  end;
  inherited;
end;

procedure TfrmDlg_EquipamentoCliente.edtProdutoRegAchado(ADataSet: TDataSet);
begin
  inherited;
  edtEquipamento.Text := edtProduto.Display.Text;
  edtIdentificador.SetFocus;
end;

procedure TfrmDlg_EquipamentoCliente.edtProdutoRegNaoAchado(ADataSet: TDataSet;
  Sender: TObject);
begin
  inherited;
  edtEquipamento.Clear;
//  edtEquipamento.SetFocus;
end;

procedure TfrmDlg_EquipamentoCliente.FormCreate(Sender: TObject);
begin
  inherited;
  UsaDataSetInterno := True;
end;

procedure TfrmDlg_EquipamentoCliente.FormShow(Sender: TObject);
begin
  inherited;
  if UsaDataSetInterno then
  BEGIN
    pDataSet := TpFIBClientDataSet.Create(nil);
    SetCds(pDataSet,tpERPClienteEquipamento,'idcliente = '+IdCliente);
    pDataSet.AfterPost := AfterPost;
  END;
  if NovoReg then
    pDataSet.Append;
  if EditReg then
    pDataSet.Edit;

  DataEquipamento.DataSet := pDataSet;
  ConfiguraEditPesquisa(edtProduto,pDataSet,tpERPProduto);
end;

procedure TfrmDlg_EquipamentoCliente.SetIdCliente(const Value: String);
begin
  FIdCliente := Value;
end;

procedure TfrmDlg_EquipamentoCliente.SetUsaDataSetInterno(const Value: Boolean);
begin
  FUsaDataSetInterno := Value;
end;

end.
