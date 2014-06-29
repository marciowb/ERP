unit uLst_OS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uListagemPadraoERP, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, DBClient,
  pFIBClientDataSet, ActnList, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxPC,
  StdCtrls, Buttons, dxStatusBar, ExtCtrls;

type
  TfrmLst_OS = class(TfrmListagemPadraoERP)
    btnBaixaOS: TBitBtn;
    actBaixaOS: TAction;
    BitBtn11: TBitBtn;
    actReabrirOS: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actBaixaOSExecute(Sender: TObject);
    procedure TvListagemStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      out AStyle: TcxStyle);
    procedure actReabrirOSExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLst_OS: TfrmLst_OS;

implementation

uses MinhasClasses, uCad_OS, Comandos;

{$R *.dfm}

procedure TfrmLst_OS.actBaixaOSExecute(Sender: TObject);
VAR
  StrSQL: String;
begin
  inherited;
  if Pergunta('Deseja realmente baixar essa O.S. ?') then
  begin
    StrSQL :=
      'SELECT LIST(C.DESCRICAOEQUIPAMENTO||''(''||C.IDENTIFICADOR||'')'','', '')'+
      '  FROM EQUIPAMENTOSOS E'+
      ' INNER JOIN CLIENTEEQUIPAMENTOS C'+
      '    ON (C.IDCLIENTEEQUIPAMENTOS = E.IDEQUIPAMENTOCLIENTE)'+
      ' WHERE E.IDOS = '+CdsListagem.FieldByName('IDOS').AsString +
      '   AND E.SOLUCAO IS NULL';

    StrSQL:= GetValorCds(StrSQL);

    if StrSQL <> '' then
    begin
      Avisa('Esta O.S. não possui laudo nos equipamento(s): '+StrSQL);
      Exit;
    end;
    Try
      StartTrans;
      Exec_SQL('UPDATE OS SET '+
               '       FLAGBAIXADA= ''Y'', '+
               '       DATATERMINO = CURRENT_DATE, '+
               '       HORATERMINO = CURRENT_TIME '+
               ' WHERE IDOS = '+CdsListagem.FieldByName('IDOS').AsString);

      Exec_SQL('UPDATE SERVICOOS S SET '+
               '       DATATERMINO = CURRENT_DATE, '+
               '       HORATERMINO = CURRENT_TIME '+
               ' WHERE EXISTS(SELECT 1  '+
               '                FROM EQUIPAMENTOSOS E  '+
               '               WHERE E.IDOS =   '+CdsListagem.FieldByName('IDOS').AsString+
               '                 AND E.IDEQUIPAMENTOSOS = S.IDEQUIPAMENTOSOS) '+
               '   AND ((DATATERMINO IS NULL) OR (HORATERMINO IS NULL)) ');
      Commit;
      Avisa('O.S. baixada com sucesso!');
      AtuDados;
    except
      on e:Exception do
      begin
        RollBack;
        raise;
      end;

    End;

  end;

end;

procedure TfrmLst_OS.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  actReabrirOS.Enabled :=  (CdsListagem.Active) and (CdsListagem.FieldByName('FLAGBAIXADA').AsString = 'Y');
  actBaixaOS.Enabled := not actReabrirOS.Enabled;
end;

procedure TfrmLst_OS.actReabrirOSExecute(Sender: TObject);
begin
  inherited;
  if Pergunta('Tem certeza que deseja reabrir essa O.S.') then
  begin
     Try
      StartTrans;
      Exec_SQL('UPDATE OS SET '+
               '       FLAGBAIXADA= ''N'', '+
               '       DATATERMINO = null, '+
               '       HORATERMINO = null '+
               ' WHERE IDOS = '+CdsListagem.FieldByName('IDOS').AsString);
      Commit;
      Avisa('O.S. reaberta com sucesso!');
      AtuDados;
    except
      on e:Exception do
      begin
        RollBack;
        raise;
      end;

    End;
  end;

end;

procedure TfrmLst_OS.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPesquisa := tpERPOS;
  CriaColuna('NUMEROOS','N° O.S.',100,tcString);
  CriaColuna('DATA','Data',100,tcCampoData);
  CriaColuna('CODIGOCLIENTE','Codigo cliente',80,tcString);
  CriaColuna('NOMECLIENTE','Cliente',300,tcString);
  CriaColuna('NOMETIPOOS','Tipo',100,tcString);
  CriaColuna('NOMESTATUSOS','Status',100,tcString);
  CriaColuna('VALORTOTAL','Valor',100,tcMoeda);
  with CriaColuna('COR','COR',100,tcString) do
  begin
   Visible := False;
   VisibleForCustomization := False;
  end;
  CampoOrdem := 'NUMEROOS desc';
  AtuDados;
end;

procedure TfrmLst_OS.FormShow(Sender: TObject);
begin
  inherited;
  Self.FormCadastro :=  frmCad_OS;
  Self.ClasseCadPai := TfrmCad_OS;
end;

procedure TfrmLst_OS.TvListagemStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var
  V: Variant;
  C: TcxGridDBColumn;
begin
  inherited;
  C := (Sender as TcxGridDBTableView).GetColumnByFieldName('COR');
  V := ARecord.Values[C.Index];
  if not VarIsNull(v) then
  begin
    AStyle := TcxStyle.Create(Sender);
    AStyle.Color :=TColor(V);
  end;

end;

end.
