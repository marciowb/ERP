unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormPadrao, ExtCtrls, StdCtrls, Buttons, dxGDIPlusClasses, Comandos,
  DB, DBClient, pFIBClientDataSet, MinhasClasses;

type
  TfrmLogin = class(TfrmPadrao)
    Panel1: TPanel;
    Label1: TLabel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    Label2: TLabel;
    btnOK: TBitBtn;
    btnCancelar: TBitBtn;
    Image1: TImage;
    lblNomeAplicativo: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function AutoLogin: Boolean;
  end;

var
  frmLogin: TfrmLogin;

implementation



{$R *.dfm}

Function TfrmLogin.AutoLogin: Boolean;
begin
  Result := False;
  with GetCds(tpCSUsuario,'') do
  Begin
    if RecordCount <= 1 then
    Begin
      edtLogin.Text := FieldByName('LOGIN').AsString;
      edtSenha.Text := FieldByName('SENHA').AsString;
      USuarioLogado.Id := FieldByName('IDUSUARIO').AsInteger;
      USuarioLogado.IdLoja := StrToInt(GetValorCds('select first 1 idempresa from empresa'));
      USuarioLogado.Administrador := True;
      Result := True;
    End;
    Free;
  End;
end;

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmLogin.btnOKClick(Sender: TObject);
Var
  CdsUsuario: TpFIBClientDataSet;
  Wr: AnsiString;
begin
  inherited;
  Try
    CdsUsuario := TpFIBClientDataSet.Create(nil);
    VerificaEdit(edtLogin,'Informe o login!');
    VerificaEdit(edtSenha,'Informe a senha!');
    Wr := 'LOGIN = '+GetStr(edtLogin.Text)+ ' AND SENHA = '+GetStr(edtSenha.Text);
    SetCds(CdsUsuario,tpCSUsuario, Wr);
    if CdsUsuario.RecordCount = 0 then
      AvisaErro('Usuário não encontrado!');
    USuarioLogado.Login := CdsUsuario.FieldByName('LOGIN').AsString;
    USuarioLogado.Senha := CdsUsuario.FieldByName('SENHA').AsString;
    USuarioLogado.Id := CdsUsuario.FieldByName('IDUSUARIO').AsInteger;
    USuarioLogado.IdLoja := StrToIntDef(GetValorCds('select first 1 idempresa from empresa'),-1);
    USuarioLogado.Administrador := CdsUsuario.FieldByName('FLAGADMINISTRADOR').AsString = 'Y';
    //AtualizaAcessos;
    //RegistraAuditoria('Entrou no sistema','','',Self.Name,'Login','',toLogin,nil, False, True );
    ModalResult := mrOk;
  Finally
    FreeAndNil(CdsUsuario);
  End;
end;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  inherited;
  AutoLogin;
  SetWindowPos(Self.handle, HWND_TOP, Self.Left, Self.Top,Self.Width, Self.Height, 0);
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  inherited;
  lblNomeAplicativo.Caption  := '  '+Application.Title;
end;

end.
