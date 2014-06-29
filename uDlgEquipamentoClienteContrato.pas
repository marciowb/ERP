unit uDlgEquipamentoClienteContrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDlg_CadastroERP, StdCtrls, Buttons, ExtCtrls, Mask, EditPesquisa;

type
  TfrmDlg_EquipamentoClienteContrato = class(TfrmDlg_CadastroERP)
    edtEquipamentoCliente: TEditPesquisa;
    edtPeriodoVisita: TEditPesquisa;
    procedure FormShow(Sender: TObject);
    procedure edtEquipamentoClienteBtnNovoClick(Sender: TObject);
    procedure edtEquipamentoClienteBtnEditarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    FIdCliente: Integer;
    procedure SetIdCliente(const Value: Integer);
    { Private declarations }
  public
    { Public declarations }
    property IdCliente: Integer read FIdCliente write SetIdCliente;
  end;

var
  frmDlg_EquipamentoClienteContrato: TfrmDlg_EquipamentoClienteContrato;

implementation

uses MinhasClasses, Comandos, uForms;

{$R *.dfm}

procedure TfrmDlg_EquipamentoClienteContrato.btnOkClick(Sender: TObject);
begin
  VerificaEdit(edtEquipamentoCliente,'Infome o equipamento do ciente');
  if ExisteRegistro(pDataSet,'IDCLIENTEEQUIPAMENTOS',True,True) Then
    Avisa('Esse equipamento já foi usado nesse contrato')
  else
    inherited;

end;

procedure TfrmDlg_EquipamentoClienteContrato.edtEquipamentoClienteBtnEditarClick(
  Sender: TObject);
begin
  inherited;
  edtEquipamentoCliente.ValorChave := TrotinasForms.AbreManutencaoEquipamentoCliente(IdCliente,toEditar);
  edtEquipamentoCliente.Localiza;
end;

procedure TfrmDlg_EquipamentoClienteContrato.edtEquipamentoClienteBtnNovoClick(
  Sender: TObject);
begin
  inherited;
  edtEquipamentoCliente.ValorChave := TrotinasForms.AbreManutencaoEquipamentoCliente(IdCliente,toIncluir);
  edtEquipamentoCliente.Localiza;
end;

procedure TfrmDlg_EquipamentoClienteContrato.FormShow(Sender: TObject);
begin
  inherited;
  ConfiguraEditPesquisa(edtEquipamentoCliente,pDataSet,tpERPClienteEquipamento,True);
  ConfiguraEditPesquisa(edtPeriodoVisita,pDataSet,tpERPPeridicidade,False,'','','CODIGO','IDPERIODICIADEVISITA');
  edtEquipamentoCliente.SQLComp := 'idcliente = '+IntToStr(IdCliente);
end;

procedure TfrmDlg_EquipamentoClienteContrato.SetIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
end;

end.
