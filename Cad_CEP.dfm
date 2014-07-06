inherited frmCad_CEP: TfrmCad_CEP
  Caption = 'Cadastro de CEP'
  ClientHeight = 216
  ClientWidth = 620
  ExplicitWidth = 636
  ExplicitHeight = 255
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 620
    ExplicitWidth = 620
  end
  inherited pnlTree: TPanel
    Height = 186
    ExplicitHeight = 186
    inherited TreeItens: TcxTreeView
      Height = 180
      ExplicitHeight = 180
    end
  end
  inherited Panel3: TPanel
    Width = 435
    Height = 186
    ExplicitWidth = 435
    ExplicitHeight = 186
    inherited PageControl: TcxPageControl
      Width = 435
      Height = 186
      ExplicitWidth = 435
      ExplicitHeight = 186
      ClientRectBottom = 185
      ClientRectRight = 434
      inherited TsPrincipal: TcxTabSheet
        ExplicitLeft = 1
        ExplicitTop = 21
        ExplicitWidth = 433
        ExplicitHeight = 164
        inherited pnlGeral: TPanel
          Width = 433
          Height = 164
          ExplicitWidth = 433
          ExplicitHeight = 164
          object Label1: TLabel
            Left = 384
            Top = 50
            Width = 13
            Height = 13
            Caption = 'UF'
          end
          object edtCEP: TLabelDBEdit
            Left = 6
            Top = 24
            Width = 83
            Height = 21
            DataField = 'cep'
            DataSource = DataCadastro
            TabOrder = 0
            Titulo.Left = 6
            Titulo.Top = 9
            Titulo.Width = 19
            Titulo.Height = 13
            Titulo.Caption = 'CEP'
            IsNull = False
            PodeRepetir = True
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
            AsInteger = 0
          end
          object LabelDBEdit2: TLabelDBEdit
            Left = 95
            Top = 24
            Width = 330
            Height = 21
            DataField = 'logradouro'
            DataSource = DataCadastro
            TabOrder = 1
            Titulo.Left = 95
            Titulo.Top = 9
            Titulo.Width = 55
            Titulo.Height = 13
            Titulo.Caption = 'Logradouro'
            IsNull = False
            PodeRepetir = True
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
            AsInteger = 0
          end
          object LabelDBEdit3: TLabelDBEdit
            Left = 6
            Top = 64
            Width = 155
            Height = 21
            DataField = 'bairro'
            DataSource = DataCadastro
            TabOrder = 2
            Titulo.Left = 6
            Titulo.Top = 49
            Titulo.Width = 28
            Titulo.Height = 13
            Titulo.Caption = 'Bairro'
            IsNull = False
            PodeRepetir = True
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
            AsInteger = 0
          end
          object LabelDBEdit4: TLabelDBEdit
            Left = 164
            Top = 64
            Width = 216
            Height = 21
            DataField = 'cidade'
            DataSource = DataCadastro
            TabOrder = 3
            Titulo.Left = 164
            Titulo.Top = 49
            Titulo.Width = 33
            Titulo.Height = 13
            Titulo.Caption = 'Cidade'
            IsNull = False
            PodeRepetir = True
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
            AsInteger = 0
          end
          object cmbUF: TDBComboBox
            Left = 384
            Top = 64
            Width = 41
            Height = 21
            Style = csDropDownList
            DataField = 'uf'
            DataSource = DataCadastro
            Items.Strings = (
              'AC'
              'AL'
              'AP'
              'AM'
              'BA'
              'CE'
              'DF'
              'ES'
              'GO'
              'MA'
              'MT'
              'MS'
              'MG'
              'PA'
              'PB'
              'PR'
              'PE'
              'PI'
              'RJ'
              'RN'
              'RS'
              'RO'
              'RR'
              'SC'
              'SP'
              'SE'
              'TO')
            TabOrder = 4
          end
        end
      end
    end
  end
  inherited ActionList1: TActionList
    inherited actImprimir: TAction
      Enabled = False
    end
  end
end
