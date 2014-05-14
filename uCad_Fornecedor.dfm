inherited frmCad_Fornecedor: TfrmCad_Fornecedor
  Caption = 'Cadastro de fornecedor'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    TabOrder = 1
  end
  inherited pnlTree: TPanel
    TabOrder = 2
  end
  inherited Panel3: TPanel
    TabOrder = 0
    inherited PageControl: TcxPageControl
      inherited TsPrincipal: TcxTabSheet
        inherited pnlGeral: TPanel
          object Label1: TLabel
            Left = 468
            Top = 176
            Width = 13
            Height = 13
            Caption = 'UF'
          end
          object LabelDBEdit1: TLabelDBEdit
            Left = 16
            Top = 24
            Width = 121
            Height = 21
            DataField = 'CODIGO'
            DataSource = DataCadastro
            TabOrder = 0
            Titulo.Left = 16
            Titulo.Top = 9
            Titulo.Width = 33
            Titulo.Height = 13
            Titulo.Caption = 'C'#243'digo'
            IsNull = False
            PodeRepetir = False
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
          end
          object LabelDBEdit2: TLabelDBEdit
            Left = 143
            Top = 24
            Width = 266
            Height = 21
            DataField = 'RAZAOSOCIAL'
            DataSource = DataCadastro
            TabOrder = 1
            Titulo.Left = 143
            Titulo.Top = 9
            Titulo.Width = 59
            Titulo.Height = 13
            Titulo.Caption = 'Raz'#227'o social'
            IsNull = False
            PodeRepetir = False
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
          end
          object LabelDBEdit3: TLabelDBEdit
            Left = 415
            Top = 24
            Width = 90
            Height = 21
            TabStop = False
            Color = clSkyBlue
            DataField = 'DATACADASTRO'
            DataSource = DataCadastro
            ReadOnly = True
            TabOrder = 2
            Titulo.Left = 415
            Titulo.Top = 9
            Titulo.Width = 44
            Titulo.Height = 13
            Titulo.Caption = 'Cadastro'
            IsNull = False
            PodeRepetir = True
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
          end
          object LabelDBEdit4: TLabelDBEdit
            Left = 16
            Top = 66
            Width = 217
            Height = 21
            DataField = 'NOMEFANTASIA'
            DataSource = DataCadastro
            TabOrder = 3
            Titulo.Left = 16
            Titulo.Top = 51
            Titulo.Width = 69
            Titulo.Height = 13
            Titulo.Caption = 'Nome fantasia'
            IsNull = True
            PodeRepetir = True
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
          end
          object LabelDBEdit5: TLabelDBEdit
            Left = 239
            Top = 66
            Width = 118
            Height = 21
            DataField = 'CNPJ'
            DataSource = DataCadastro
            TabOrder = 4
            Titulo.Left = 239
            Titulo.Top = 51
            Titulo.Width = 25
            Titulo.Height = 13
            Titulo.Caption = 'CNPJ'
            IsNull = True
            PodeRepetir = True
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
          end
          object LabelDBEdit6: TLabelDBEdit
            Left = 363
            Top = 66
            Width = 142
            Height = 21
            DataField = 'CONTATO'
            DataSource = DataCadastro
            TabOrder = 5
            Titulo.Left = 363
            Titulo.Top = 51
            Titulo.Width = 39
            Titulo.Height = 13
            Titulo.Caption = 'Contato'
            IsNull = True
            PodeRepetir = True
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
          end
          object LabelDBEdit7: TLabelDBEdit
            Left = 16
            Top = 110
            Width = 217
            Height = 21
            DataField = 'TELEFONE'
            DataSource = DataCadastro
            TabOrder = 6
            Titulo.Left = 16
            Titulo.Top = 95
            Titulo.Width = 42
            Titulo.Height = 13
            Titulo.Caption = 'Telefone'
            IsNull = True
            PodeRepetir = True
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
          end
          object LabelDBEdit8: TLabelDBEdit
            Left = 239
            Top = 110
            Width = 266
            Height = 21
            DataField = 'EMAIL'
            DataSource = DataCadastro
            TabOrder = 7
            Titulo.Left = 239
            Titulo.Top = 95
            Titulo.Width = 28
            Titulo.Height = 13
            Titulo.Caption = 'E-mail'
            IsNull = True
            PodeRepetir = True
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
          end
          object LabelDBEdit9: TLabelDBEdit
            Left = 16
            Top = 152
            Width = 265
            Height = 21
            DataField = 'ENDERECO'
            DataSource = DataCadastro
            TabOrder = 8
            Titulo.Left = 16
            Titulo.Top = 137
            Titulo.Width = 45
            Titulo.Height = 13
            Titulo.Caption = 'Endere'#231'o'
            IsNull = True
            PodeRepetir = True
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
          end
          object LabelDBEdit10: TLabelDBEdit
            Left = 287
            Top = 151
            Width = 50
            Height = 21
            DataField = 'NUMERO'
            DataSource = DataCadastro
            TabOrder = 9
            Titulo.Left = 287
            Titulo.Top = 136
            Titulo.Width = 37
            Titulo.Height = 13
            Titulo.Caption = 'N'#250'mero'
            IsNull = True
            PodeRepetir = True
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
          end
          object LabelDBEdit11: TLabelDBEdit
            Left = 343
            Top = 151
            Width = 162
            Height = 21
            DataField = 'COMPLEMENTO'
            DataSource = DataCadastro
            TabOrder = 10
            Titulo.Left = 343
            Titulo.Top = 136
            Titulo.Width = 65
            Titulo.Height = 13
            Titulo.Caption = 'Complemento'
            IsNull = True
            PodeRepetir = True
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
          end
          object LabelDBEdit12: TLabelDBEdit
            Left = 16
            Top = 192
            Width = 207
            Height = 21
            DataField = 'BAIRRO'
            DataSource = DataCadastro
            TabOrder = 11
            Titulo.Left = 16
            Titulo.Top = 177
            Titulo.Width = 28
            Titulo.Height = 13
            Titulo.Caption = 'Bairro'
            IsNull = True
            PodeRepetir = True
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
          end
          object LabelDBEdit13: TLabelDBEdit
            Left = 230
            Top = 192
            Width = 152
            Height = 21
            DataField = 'CIDADE'
            DataSource = DataCadastro
            TabOrder = 12
            Titulo.Left = 230
            Titulo.Top = 177
            Titulo.Width = 33
            Titulo.Height = 13
            Titulo.Caption = 'Cidade'
            IsNull = True
            PodeRepetir = True
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
          end
          object LabelDBEdit14: TLabelDBEdit
            Left = 384
            Top = 192
            Width = 74
            Height = 21
            DataField = 'CEP'
            DataSource = DataCadastro
            TabOrder = 13
            Titulo.Left = 384
            Titulo.Top = 177
            Titulo.Width = 19
            Titulo.Height = 13
            Titulo.Caption = 'CEP'
            IsNull = True
            PodeRepetir = True
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 216
            Width = 517
            Height = 105
            Align = alBottom
            Caption = ' OBS '
            TabOrder = 14
            object DBMemo1: TDBMemo
              Left = 2
              Top = 15
              Width = 513
              Height = 88
              Align = alClient
              DataField = 'OBS'
              DataSource = DataCadastro
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
          object DBComboBox1: TDBComboBox
            Left = 468
            Top = 192
            Width = 37
            Height = 21
            Style = csDropDownList
            DataField = 'UF'
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
              'TO'
              'EX')
            TabOrder = 15
          end
        end
      end
    end
  end
end
