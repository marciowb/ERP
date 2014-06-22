unit Cad_Agenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Dlg_Cadastro, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, DB, StdCtrls, DBCtrls, Mask,
  EditPesquisa, cxSpinEdit, cxTimeEdit, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Buttons, ExtCtrls, LabelDBEdit, DBClient,
  pFIBClientDataSet, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue;

type
  TfrmCad_Agenda = class(TfrmDlg_Cadastro)
    DataCadAgenda: TDataSource;
    Panel3: TPanel;
    cxDBDateEdit1: TcxDBDateEdit;
    Label1: TLabel;
    edtHoraIni: TcxDBTimeEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    edtCliente: TEditPesquisa;
    mmObs: TDBMemo;
    LabelDBEdit1: TLabelDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label3: TLabel;
    edtRepetir: TcxDBSpinEdit;
    DBCheckBox2: TDBCheckBox;
    edtFuncionario: TEditPesquisa;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edtAnimalBtnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCad_Agenda: TfrmCad_Agenda;

implementation

uses Comandos, MinhasClasses, uForms;

{$R *.dfm}

procedure TfrmCad_Agenda.btnOkClick(Sender: TObject);
var
  CdsClone: TpFIBClientDataSet;
  I,Id: Integer;
  Procedure PreencheDataSet;
  var
    x: Integer;
  Begin
    for x := 0 to CdsClone.FieldCount -1 do
    Begin
      if pDataSet.Fields[x].FieldName <> 'IDAGENDA' then
        pDataSet.Fields[x].Value := CdsClone.Fields[x].Value;
    End;

  End;
  Function AjustaData(Data: TDate) : TDate;
  var
    T : Integer;
  Begin
    Result := Data;
    T := DayOfWeek(Result);
    if T = 1 then// Domingo
      Result := Result +1;
  End;
begin
  if pDataSet.FieldByName('HORA').AsString = '' then
  Begin
    Avisa('Informe a hora inicial');
    edtHoraIni.SetFocus;
    Abort;
  End;

  Try
    Id := pDataSet.FieldByName('IDAGENDA').Value;
    CdsClone := TpFIBClientDataSet.Create(nil);
    pDataSet.DisableControls;
    CdsClone.CloneCursor(pDataSet,True);
    inherited;
    if edtRepetir.Value > 0  then
    begin
      if pDataSet.State = dsBrowse then
        Exit;
      Try
        LockWindowUpdate(Self.Handle);
        for I := 1 to edtRepetir.Value do
        begin
          CdsClone.Locate('IDAGENDA', Id,[]);
          PreencheDataSet;
          pDataSet.FieldByName('IDAGENDAREF').Value := Id;
          pDataSet.FieldByName('DATACOMPROMISSO').AsDateTime := IncMonth(CdsClone.FieldByName('DATACOMPROMISSO').AsDateTime, I);
          pDataSet.FieldByName('DATACOMPROMISSO').AsDateTime := AjustaData(pDataSet.FieldByName('DATACOMPROMISSO').AsDateTime);
          inherited;
        end;
      Finally
        LockWindowUpdate(0);
      End;

    end;
  Finally
    pDataSet.EnableControls;
    FreeAndNil(CdsClone);

  End;

end;

procedure TfrmCad_Agenda.edtAnimalBtnNovoClick(Sender: TObject);
begin
  inherited;
  TrotinasForms.AbreCadastroCliente(toIncluir);
end;

procedure TfrmCad_Agenda.FormShow(Sender: TObject);
begin
  inherited;
  ConfiguraEditPesquisa(edtCliente,pDataSet,tpERPCliente,False);
  ConfiguraEditPesquisa(edtFuncionario,pDataSet,tpERPFuncionario,False);
  DataCadAgenda.DataSet := pDataSet;
  //edtCliente.BtnNovo.Visible := GetPermissao(IdCadastroClienteNovo);

end;

end.
