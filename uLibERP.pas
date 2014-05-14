unit uLibERP;

interface
  uses
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs,Lst_CadastroERP, MinhasClasses,uCad_CadastroPaiERP,Generics.Collections;


  type
    TClasseCadastroSimples = class of TfrmLstCadastroSimplesERP;
    TClasseCadastroPai = class of TfrmCad_CadastroPaiERP;
    CampoChave = Int64;

    TTelas = class
      class Procedure AbreFormCadastroPai<MyForm: TfrmCad_CadastroPaiERP  >;
      class procedure AbreFormSimples(aForm: TfrmLstCadastroSimplesERP; aClasse: TClasseCadastroSimples);
      class procedure AbreFormSimplesPeloTipoPesquisa(aTipoPesquisa: TTipoPesquisa);
      class Function AbreFormNCM: CampoChave;

    end;



implementation

uses uCadNCM;

class function TTelas.AbreFormNCM: CampoChave;
begin
  AbreFormCadastroPai<TfrmCad_NCM>;
end;

class procedure TTelas. AbreFormSimples(aForm: TfrmLstCadastroSimplesERP; aClasse: TClasseCadastroSimples);
  begin
    Try
      Application.CreateForm(aClasse, aform);
      aForm.ShowModal;
    Finally
      FreeAndNil(aForm);
    End;
  end;

class procedure TTelas.AbreFormSimplesPeloTipoPesquisa(aTipoPesquisa: TTipoPesquisa);
  var
    aForm : TfrmLstCadastroSimplesERP;
  begin
    Try
      Application.CreateForm(TfrmLstCadastroSimplesERP, aform);
      aForm.TipoPesquisa := aTipoPesquisa;
      aForm.ShowModal;
    Finally
      FreeAndNil(aForm);
    End;
  end;


{ TTelas }

class procedure TTelas.AbreFormCadastroPai<MyForm>;
var
  aForm: MyForm;
begin
  Try
    Application.CreateForm(MyForm, aform);
    aForm.ShowModal;
  Finally
    FreeAndNil(aForm);
  End;

end;

end.
