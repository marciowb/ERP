unit uDlg_ServicoEquipamentoOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDlg_CadastroERP, StdCtrls, Buttons, ExtCtrls, Mask, EditPesquisa,
  Grids, DBGrids, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxTextEdit, cxMemo, cxDBEdit, cxNavigator, cxDBNavigator,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxSpinEdit, cxTimeEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TfrmDlg_ServicoEquipamentoOS = class(TfrmDlg_CadastroERP)
    Panel3: TPanel;
    edtServico: TEditPesquisa;
    Panel4: TPanel;
    GroupBox2: TGroupBox;
    tvProduto: TcxGridDBTableView;
    GridProdutoLevel1: TcxGridLevel;
    GridProduto: TcxGrid;
    tvProdutoColumn1: TcxGridDBColumn;
    tvProdutoColumn2: TcxGridDBColumn;
    tvProdutoColumn3: TcxGridDBColumn;
    tvProdutoColumn4: TcxGridDBColumn;
    tvProdutoColumn5: TcxGridDBColumn;
    GroupBox1: TGroupBox;
    mmDefeito: TcxDBMemo;
    edtFuncionario: TEditPesquisa;
    Panel5: TPanel;
    Label1: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    Label2: TLabel;
    cxDBTimeEdit1: TcxDBTimeEdit;
    GridProdutoLevel2: TcxGridLevel;
    GridProdutoDBTableView1: TcxGridDBTableView;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtServicoRegAchado(const ValoresCamposEstra: array of Variant);
    procedure btnOkClick(Sender: TObject);
  private
    FIdCliente: integer;
    FIdEmpresa: Integer;
    FData: TDate;
    procedure SetIdCliente(const Value: integer);
    procedure SetData(const Value: TDate);
    procedure SetIdEmpresa(const Value: Integer);
    Function TotalProdutos: Currency;
    { Private declarations }
  public
    { Public declarations }
    property IdCliente: integer read FIdCliente write SetIdCliente;
    property IdEmpresa: Integer read FIdEmpresa write SetIdEmpresa;
    property Data: TDate read FData write SetData;
  end;

var
  frmDlg_ServicoEquipamentoOS: TfrmDlg_ServicoEquipamentoOS;

implementation

uses uCad_OS, Comandos, MinhasClasses, UDmConexao, uRegras, uLibERP;

{$R *.dfm}


procedure TfrmDlg_ServicoEquipamentoOS.btnOkClick(Sender: TObject);
begin
  pDataSet.FieldByName('VALORTOTALPRODUTOS').AsCurrency := TotalProdutos;
  pDataSet.FieldByName('VALORTOTAL').AsCurrency :=
      pDataSet.FieldByName('VALORTOTALPRODUTOS').AsCurrency +
      edtServico.DataSet.FieldByName('VALORSERVICO').AsCurrency;
  inherited;

end;

procedure TfrmDlg_ServicoEquipamentoOS.edtServicoRegAchado(
  const ValoresCamposEstra: array of Variant);
begin
  inherited;
  if GridProduto.CanFocus then
    GridProduto.SetFocus;
  if edtServico.DataSet.State in [dsInsert,dsEdit]  then
  begin
    edtServico.DataSet.FieldByName('CODIGOSERVICO').AsString := edtServico.Text;
    edtServico.DataSet.FieldByName('DESCRICAOSERVICO').AsString := edtServico.Display.Text;
    edtServico.DataSet.FieldByName('VALORSERVICO').Value :=
         TRegrasVendaProduto.PrecoVendaProduto(edtServico.DataSet.FieldByName('IDPRODUTO').Value,
                                                 IdCliente,
                                                 IdEmpresa,
                                                 Data);
  end;
end;

procedure TfrmDlg_ServicoEquipamentoOS.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (ActiveControl.ClassName = 'TcxGridSite') then
  begin
    if (key= VK_RETURN) or (key= VK_ESCAPE)  then
      Key := 0;
  end;

  inherited;

end;

procedure TfrmDlg_ServicoEquipamentoOS.FormShow(Sender: TObject);
begin
  inherited;
  ConfiguraEditPesquisa(edtServico,pDataSet,tpERPProduto,True);
  TRotinasPesquisa.ConfiguraPesquisaFuncionario(edtFuncionario,pDataSet);
  edtServico.SQLComp :='TIPOPRODUTO= ''S'' ';
end;

procedure TfrmDlg_ServicoEquipamentoOS.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TfrmDlg_ServicoEquipamentoOS.SetIdCliente(const Value: integer);
begin
  FIdCliente := Value;
end;

procedure TfrmDlg_ServicoEquipamentoOS.SetIdEmpresa(const Value: Integer);
begin
  FIdEmpresa := Value;
end;

function TfrmDlg_ServicoEquipamentoOS.TotalProdutos: Currency;
var
  Temp: String;
begin
   Result := 0;
   Temp := tvProduto.DataController.Summary.FooterSummaryValues[0];
   Result := StrToCurr(Temp);
end;

end.
