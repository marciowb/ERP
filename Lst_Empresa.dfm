inherited frmLst_Empresa: TfrmLst_Empresa
  Caption = 'Cadastro de empresa'
  ClientHeight = 535
  ExplicitTop = -18
  ExplicitWidth = 658
  ExplicitHeight = 574
  PixelsPerInch = 96
  TextHeight = 13
  inherited Status: TStatusBar
    Top = 516
    ExplicitTop = 516
  end
  inherited Panel1: TPanel
    Height = 516
    ExplicitHeight = 516
    inherited cxSplitter1: TcxSplitter
      Height = 486
      ExplicitHeight = 486
    end
    inherited Panel3: TPanel
      Height = 486
      ExplicitHeight = 486
      inherited Panel4: TPanel
        Top = 445
        TabOrder = 8
        ExplicitTop = 445
        inherited BitBtn1: TBitBtn
          Width = 105
          ExplicitWidth = 105
        end
      end
      object LabelDBEdit1: TLabelDBEdit
        Left = 16
        Top = 70
        Width = 273
        Height = 21
        DataField = 'razaosocial'
        DataSource = DataCadastro
        TabOrder = 1
        Titulo.Left = 16
        Titulo.Top = 55
        Titulo.Width = 59
        Titulo.Height = 13
        Titulo.Caption = 'Raz'#227'o social'
        IsNull = False
        PodeRepetir = False
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
      end
      object LabelDBEdit2: TLabelDBEdit
        Left = 16
        Top = 108
        Width = 273
        Height = 21
        DataField = 'FANTASIA'
        DataSource = DataCadastro
        TabOrder = 2
        Titulo.Left = 16
        Titulo.Top = 93
        Titulo.Width = 41
        Titulo.Height = 13
        Titulo.Caption = 'Fantasia'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
      end
      object LabelDBEdit3: TLabelDBEdit
        Left = 16
        Top = 146
        Width = 142
        Height = 21
        DataField = 'CNPJ'
        DataSource = DataCadastro
        TabOrder = 3
        Titulo.Left = 16
        Titulo.Top = 131
        Titulo.Width = 25
        Titulo.Height = 13
        Titulo.Caption = 'CNPJ'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
      end
      object LabelDBEdit4: TLabelDBEdit
        Left = 168
        Top = 146
        Width = 121
        Height = 21
        DataField = 'IE'
        DataSource = DataCadastro
        TabOrder = 4
        Titulo.Left = 168
        Titulo.Top = 131
        Titulo.Width = 87
        Titulo.Height = 13
        Titulo.Caption = 'Inscri'#231#227'o estadual'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
      end
      object LabelDBEdit5: TLabelDBEdit
        Left = 16
        Top = 220
        Width = 142
        Height = 21
        DataField = 'Telefone'
        DataSource = DataCadastro
        TabOrder = 5
        Titulo.Left = 16
        Titulo.Top = 205
        Titulo.Width = 42
        Titulo.Height = 13
        Titulo.Caption = 'Telefone'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
      end
      object LabelDBEdit6: TLabelDBEdit
        Left = 168
        Top = 220
        Width = 121
        Height = 21
        DataField = 'FAX'
        DataSource = DataCadastro
        TabOrder = 6
        Titulo.Left = 168
        Titulo.Top = 205
        Titulo.Width = 18
        Titulo.Height = 13
        Titulo.Caption = 'Fax'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
      end
      object cxPageControl1: TcxPageControl
        Left = 0
        Top = 252
        Width = 323
        Height = 193
        ActivePage = cxTabSheet1
        Align = alBottom
        Style = 10
        TabOrder = 7
        TabPosition = tpBottom
        ClientRectBottom = 174
        ClientRectRight = 323
        ClientRectTop = 0
        object cxTabSheet1: TcxTabSheet
          Caption = 'Endere'#231'o'
          ImageIndex = 0
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 323
            Height = 174
            Align = alClient
            TabOrder = 0
            object edtCEP: TEditPesquisa
              Left = 12
              Top = 25
              Width = 57
              Height = 21
              TabOrder = 0
              TipoPesquisa = 0
              TamanhoCodigo = 0
              AutoPesquisa = True
              AutoCompletar = True
              OnRegAchado = edtCEPRegAchado
              OnRegNaoAchado = edtCEPRegNaoAchado
              UsaBtnNovo = False
              UsaBtnEditar = False
              UsaDisplay = True
              LblTitulo.Left = 12
              LblTitulo.Top = 10
              LblTitulo.Width = 19
              LblTitulo.Height = 13
              LblTitulo.Caption = 'CEP'
              BtnPesquisa.Left = 71
              BtnPesquisa.Top = 25
              BtnPesquisa.Width = 25
              BtnPesquisa.Height = 21
              BtnPesquisa.Hint = 'F2 para pesquisar'
              BtnPesquisa.Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                1800000000000006000000000000000000000000000000000000FF00FF4A667C
                BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF777777BDBDBDFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF6B9CC31E89E8
                4B7AA3C89693FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFABABAB9797978B8B8BC1C1C1FF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
                2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFB8B8B8BCBCBC9898988A8A8AC0C0C0FF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF51B7FE
                51B3FF1D87E64E7AA0CA9792FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFBBBBBBBCBCBC9595958B8B8BC2C2C2FF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFBBBBBBBABABA9696968C8C8CBABABAFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FF52B8FE4BB1FF2787D95F6A76FF00FFB0857FC09F94C09F96BC988EFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBCBCBCB9B9B99494947E7E7EFF
                00FF979797AAAAAAABABABA5A5A5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FF55BDFFB5D6EDBF9D92BB9B8CE7DAC2FFFFE3FFFFE5FDFADAD8C3
                B3B58D85FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBED1D1D1A8A8A8A3
                A3A3D4D4D4F1F1F1F2F2F2EBEBEBC5C5C59D9D9DFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFCEA795FDEEBEFFFFD8FFFFDAFFFFDBFFFFE6FFFF
                FBEADDDCAE837FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1B1B1DD
                DDDDEBEBEBECECECEDEDEDF2F2F2FDFDFDE3E3E3969696FF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFC1A091FBDCA8FEF7D0FFFFDBFFFFE3FFFFF8FFFF
                FDFFFFFDC6A99CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9D1
                D1D1E7E7E7EDEDEDF1F1F1FBFBFBFEFEFEFEFEFEB1B1B1FF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFC1A091FEE3ACF1C491FCF2CAFFFFDDFFFFE4FFFFF7FFFF
                F7FFFFE9EEE5CBB9948CFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9D5D5D5C1
                C1C1E3E3E3EEEEEEF1F1F1FBFBFBFBFBFBF4F4F4DCDCDCA2A2A2FF00FFFF00FF
                FF00FFFF00FFFF00FFC2A191FFE6AEEEB581F7DCAEFEFDD8FFFFDFFFFFE3FFFF
                E4FFFFE0F3ECD2BB968EFF00FFFF00FFFF00FFFF00FFFF00FFA9A9A9D6D6D6B7
                B7B7D2D2D2EBEBEBEFEFEFF1F1F1F1F1F1EFEFEFE2E2E2A4A4A4FF00FFFF00FF
                FF00FFFF00FFFF00FFBC978CFBE7B7F4C791F2C994F8E5B9FEFCD8FFFFDDFFFF
                DCFFFFE0E2D2BAB68E86FF00FFFF00FFFF00FFFF00FFFF00FFA4A4A4D9D9D9C2
                C2C2C3C3C3D8D8D8EBEBEBEEEEEEEDEDEDEFEFEFCECECE9E9E9EFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFD9C3A9FFFEE5F7DCB8F2C994F5D4A5FAE8BDFDF4
                C9FDFBD6B69089FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1C1C1F2
                F2F2D7D7D7C3C3C3CDCDCDDBDBDBE3E3E3E9E9E99F9F9FFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFB58D85E8DEDDFFFEF2F9D8A3F4C48CF9D49FFDEA
                B8D0B49FB89086FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9D9D9DE2
                E2E2F8F8F8CECECEC0C0C0CCCCCCDADADAB7B7B79F9F9FFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFAD827FC9AA9EEFE0B7EFDFB2E7CEACB890
                86B89086FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF96
                9696B3B3B3D3D3D3D0D0D0C9C9C99F9F9F9F9F9FFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBA968ABB988CB79188FF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFA2A2A2A3A3A39F9F9FFF00FFFF00FFFF00FFFF00FF}
              BtnPesquisa.NumGlyphs = 2
              BtnPesquisa.ParentShowHint = False
              BtnPesquisa.ShowHint = True
              BtnNovo.Left = 96
              BtnNovo.Top = 25
              BtnNovo.Width = 25
              BtnNovo.Height = 21
              BtnNovo.Hint = 'F3 para criar novo registro'
              BtnNovo.Glyph.Data = {
                36060000424D3606000000000000360000002800000020000000100000000100
                18000000000000060000120B0000120B00000000000000000000FF00FFFF00FF
                B78183B78183B78183B78183B78183B78183B78183B78183B78183B78183B781
                83B78183B78183FF00FFFF00FFFF00FF9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C
                9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9CFF00FFFF00FFFF00FF
                C7A79CFEEED4F7E3C5F6DFBCF5DBB4F3D7ABF3D3A2F1CF9AF0CF97F0CF98F0CF
                98F5D49AB78183FF00FFFF00FFFF00FF9C9C9CE9E9E9DEDEDED9D9D9D4D4D4CF
                CFCFCACACAC5C5C5C3C3C3C4C4C4C4C4C4C7C7C79C9C9CFF00FFFF00FFFF00FF
                C7A79EFDEFD9F6E3CBF5DFC2F4DBBAF2D7B2F1D4A9F1D0A2EECC99EECC97EECC
                97F3D199B78183FF00FFFF00FFFF00FF9C9C9CEBEBEBE0E0E0DBDBDBD7D7D7D2
                D2D2CDCDCDC9C9C9C3C3C3C2C2C2C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                C7A9A1FEF3E3F8E7D3F5E3CBF5DFC3F3DBBBF2D7B2F1D4ABF0D0A3EECC9AEECC
                97F3D199B78183FF00FFFF00FFFF00FF959595F0F0F0E5E5E5E0E0E0DCDCDCD7
                D7D7D2D2D2CECECEC9C9C9C4C4C4C2C2C2C6C6C69C9C9CFF00FFFF00FFFF00FF
                C9ACA5FFF7EBF9EBDAF7E7D2F6E3CAF5DFC2F4DBB9F2D7B2F1D4AAF0D0A1EFCD
                99F3D198B78183FF00FFFF00FFFF00FF959595F5F5F5E9E9E9E4E4E4E0E0E0DB
                DBDBD6D6D6D2D2D2CDCDCDC8C8C8C4C4C4C5C5C59C9C9CFF00FFFF00FFFF00FF
                CEB2AAFFFCF4FAEFE4F8EADAF7E7D3F5E2CBF5DFC2F4DBBBF1D7B2F1D3AAF0D0
                A1F3D29BB78183FF00FFFF00FFFF00FF9F9F9FF9F9F9EFEFEFE9E9E9E5E5E5E0
                E0E0DBDBDBD7D7D7D1D1D1CDCDCDC8C8C8C7C7C79C9C9CFF00FFFF00FFFF00FF
                D3B7AFFFFFFDFBF4ECFAEFE3F9EBDAF7E7D2F5E3C9F5DFC2F4DBBAF2D7B1F0D4
                A9F5D5A3B78183FF00FFFF00FFFF00FF9F9F9FFEFEFEF3F3F3EEEEEEE9E9E9E4
                E4E4DFDFDFDBDBDBD7D7D7D1D1D1CCCCCCCCCCCC9C9C9CFF00FFFF00FFFF00FF
                D7BBB2FFFFFFFEF9F5FBF3ECFAEFE2F9EADAF8E7D2F5E3CAF5DEC2F4DBBAF2D8
                B2F6D9ACB78183FF00FFFF00FFFF00FFA6A6A6FFFFFFF9F9F9F3F3F3EEEEEEE9
                E9E9E5E5E5DFDFDFDBDBDBD7D7D7D2D2D2D1D1D19C9C9CFF00FFFF00FFFF00FF
                DABEB3FFFFFFFFFEFDFDF8F4FBF3ECF9EFE3F8EADAF7E7D2F6E2CAF6DEC1F4DB
                B9F8DDB4B78183FF00FFFF00FFFF00FFA6A6A6FFFFFFFEFEFEF8F8F8F3F3F3EE
                EEEEE9E9E9E4E4E4E0E0E0DBDBDBD6D6D6D6D6D69C9C9CFF00FFFF00FFFF00FF
                DEC1B5FFFFFFFFFFFFFFFEFDFEF9F4FBF3EBFAEFE2F9EBD9F8E6D1F6E2C8F7E1
                C2F0DAB7B78183FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFEFEFEF9F9F9F3
                F3F3EEEEEEE9E9E9E4E4E4DFDFDFDCDCDCD3D3D39C9C9CFF00FFFF00FFFF00FF
                E2C5B5FFFFFFFFFFFFFFFFFFFFFEFDFDF9F4FBF3EBFAEEE2FAEDDCFCEFD9E6D9
                C4C6BCA9B78183FF00FFFF00FFFF00FFB1B1B1FFFFFFFFFFFFFFFFFFFEFEFEF8
                F8F8F3F3F3EEEEEEEBEBEBEAEAEAD5D5D5B7B7B79C9C9CFF00FFFF00FFFF00FF
                E5C7B7FFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFDF8F3FDF6ECF1E1D5C6A194B594
                89B08F81B78183FF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFE
                FEFEF8F8F8F4F4F4E3E3E39999999999999999999C9C9CFF00FFFF00FFFF00FF
                E9CBB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFFFEF9E3CFC9BF8C76E8B2
                70ECA54AC58768FF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFDFDFDFCFCFCD6D6D6999999ACACAC9B9B9B969696FF00FFFF00FFFF00FF
                ECCDBAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4D4D2C89A7FFAC5
                77CD9377FF00FFFF00FFFF00FFFF00FFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFDBDBDB999999B8B8B8A2A2A2FF00FFFF00FFFF00FFFF00FF
                EACAB6FCF7F4FCF7F3FBF6F3FBF6F3FAF5F3F9F5F3F9F5F3E1D0CEC7977CCF9B
                86FF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFF8F8F8F7F7F7F7F7F7F7F7F7F6
                F6F6F6F6F6F6F6F6D7D7D7999999AAAAAAFF00FFFF00FFFF00FFFF00FFFF00FF
                E9C6B1EBCCB8EBCCB8EBCCB8EBCBB8EACBB8EACBB8EACCB9DABBB0B8857AFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFBFBFBFB1B1B1B1B1B1B1B1B1B1B1B1B1
                B1B1B1B1B1B1B1B1B1B1B1999999FF00FFFF00FFFF00FFFF00FF}
              BtnNovo.NumGlyphs = 2
              BtnNovo.ParentShowHint = False
              BtnNovo.ShowHint = True
              BtnNovo.Visible = False
              BtnEditar.Left = 121
              BtnEditar.Top = 25
              BtnEditar.Width = 25
              BtnEditar.Height = 21
              BtnEditar.Hint = 'F5 para editar esse registro'
              BtnEditar.Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000610B0000610B00000000000000000000FF00FFFF00FF
                9596968184868184868184868184868184868184868184868184868184868184
                86818486818486FF00FFFF00FFFF00FF959696FEFEFCFCFCFBF8F8F7F3F3F2EF
                EFEEEBEBEAE6E6E5E2E2E1DCDCDCD0D0D0C5C5C5818486FF00FFFF00FFFF00FF
                959696FEFEFCB6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6B6
                B6D0D0D0818486FF00FFFF00FFFF00FF959696FEFEFC1919193E3935CAB6ABF8
                F8F7F3F3F2EFEFEEEBEBEAE6E6E5E2E2E1DCDCDC818486FF00FFFF00FFFF00FF
                959696FEFEFC3E39352D2C2A374546CAB6ABF8F8F7F3F3F2EFEFEEEBEBEAE6E6
                E5E2E2E1818486FF00FFFF00FFFF00FF959696FEFEFCB6B6B63A5C600C84B10B
                3B542A407BB6A1A1B6B6B6B6B6B6B6B6B6E6E6E5818486FF00FFFF00FFFF00FF
                959696FEFEFCFEFEFC3A5C60165E827B645A0C84B12A407BCAB6ABF3F3F2EFEF
                EEEBEBEA818486FF00FFFF00FFFF00FF959696FEFEFCFEFEFCFEFEFC80A6CB15
                C4FB01A5E60C84B12A407BCAB6ABF6F6F4EFEFEE818486FF00FFFF00FFFF00FF
                959696FEFEFCB6B6B6B6B6B680A6CB97E7FB15C4FB01A5E60C84B12A407BB6A1
                A1F6F6F4818486FF00FFFF00FFFF00FF959696FEFEFCFEFEFCFEFEFCFEFEFC80
                A6CB97E7FB15C4FB01A5E60C84B12A407BCAB6AB818486FF00FFFF00FFFF00FF
                959696FEFEFCFEFEFCFEFEFCFEFEFCFEFEFC80A6CB97E7FB15C4FB01A5E60C84
                B12A407B818486FF00FFFF00FFFF00FF959696FEFEFCB6B6B6B6B6B6B6B6B6B6
                B6B6B6B6B680A6CB97E7FB15C4FB1F92F2111B8307035AFF00FFFF00FFFF00FF
                959696FEFEFCFEFEFCFEFEFCFEFEFCFEFEFCFEFEFCFEFEFC80A6CB3187E72D44
                B42D44B4111B8307035AFF00FFFF00FF959696FEFEFCFEFEFCFEFEFCFEFEFCFE
                FEFCFEFEFCFEFEFCFEFEFC2D44B46E88D86F7FD52D44B4FF00FFFF00FFFF00FF
                959696FEFEFCFEFEFCFEFEFCFEFEFCFEFEFCFEFEFCFEFEFCFEFEFC8184862D44
                B42D44B4FF00FFFF00FFFF00FFFF00FF95969681848681848681848681848681
                8486818486818486818486818486FF00FFFF00FFFF00FFFF00FF}
              BtnEditar.ParentShowHint = False
              BtnEditar.ShowHint = True
              BtnEditar.Visible = False
              Display.Left = 96
              Display.Top = 25
              Display.Width = 210
              Display.Height = 21
              Display.TabStop = False
              Display.Color = clSkyBlue
              Display.ReadOnly = True
              Display.TabOrder = 1
              TamanhoDisplay = 210
            end
            object edtBairro: TLabeledEdit
              Left = 12
              Top = 63
              Width = 295
              Height = 21
              TabStop = False
              Color = clSkyBlue
              EditLabel.Width = 28
              EditLabel.Height = 13
              EditLabel.Caption = 'Bairro'
              ReadOnly = True
              TabOrder = 2
            end
            object edtCidade: TLabeledEdit
              Left = 12
              Top = 103
              Width = 258
              Height = 21
              TabStop = False
              Color = clSkyBlue
              EditLabel.Width = 33
              EditLabel.Height = 13
              EditLabel.Caption = 'Cidade'
              ReadOnly = True
              TabOrder = 3
            end
            object LabelDBEdit7: TLabelDBEdit
              Left = 12
              Top = 141
              Width = 57
              Height = 21
              DataField = 'NUMERO'
              DataSource = DataCadastro
              TabOrder = 4
              Titulo.Left = 12
              Titulo.Top = 126
              Titulo.Width = 37
              Titulo.Height = 13
              Titulo.Caption = 'N'#250'mero'
              IsNull = True
              PodeRepetir = True
              CorPrincipal = clWhite
              CorSecundaria = 11592447
              GravaEsteCampo = True
            end
            object LabelDBEdit8: TLabelDBEdit
              Left = 76
              Top = 141
              Width = 231
              Height = 21
              DataField = 'COMPLEMENTO'
              DataSource = DataCadastro
              TabOrder = 5
              Titulo.Left = 76
              Titulo.Top = 126
              Titulo.Width = 65
              Titulo.Height = 13
              Titulo.Caption = 'Complemento'
              IsNull = True
              PodeRepetir = True
              CorPrincipal = clWhite
              CorSecundaria = 11592447
              GravaEsteCampo = True
            end
            object edtUf: TLabeledEdit
              Left = 275
              Top = 103
              Width = 32
              Height = 21
              TabStop = False
              Color = clSkyBlue
              EditLabel.Width = 13
              EditLabel.Height = 13
              EditLabel.Caption = 'UF'
              ReadOnly = True
              TabOrder = 6
            end
          end
        end
        object cxTabSheet2: TcxTabSheet
          Caption = 'Logomarca '
          ImageIndex = 1
          object Panel5: TPanel
            Left = 288
            Top = 0
            Width = 35
            Height = 174
            Align = alRight
            BevelKind = bkSoft
            BevelOuter = bvNone
            TabOrder = 0
            object SpeedButton1: TSpeedButton
              Left = 0
              Top = 22
              Width = 31
              Height = 22
              Hint = 'Limpar'
              Align = alTop
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF1877EA1574E0FF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1776E615
                73E7136FDC126ED30F6AC9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FF1676CA268BE5278CEB2184E3116CCF0C67C40B64BB0962
                B4075CA9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF258BD83EABEE45
                B4F72687DD3DAAF41E80D50F69BF065BAA0458A004579A035495FF00FFFF00FF
                FF00FFFF00FF01500A319CF739A4F41B6DC448B7FA2687DD41ADFA3BA7F81F81
                D4197ACC065B9F025291FF00FFFF00FFFF00FF0B6344185F6901500A166AD425
                81CE1160C02889E340ACFE359EF23CA6FF3CA6FF2D95EFFF00FFFF00FFFF00FF
                06630925AC461CB62F1CB62F1CB62F01500A01500A196DA32380E12C8FEB38A3
                FF38A1FFFF00FFFF00FFFF00FF096D111C9A3147F77936E5541CB62F0E912D12
                805B1CB62F1CB62F01500A01500AFF00FFFF00FFFF00FFFF00FFFF00FF1C982F
                18902935E05D21C2390CA015008600008300068E0F1DA6572D9197FF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FF035A0617992811AA1D018202007B0004
                8A0B005D01005D01FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                1387232AD149048807005C00005D01046D0AFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FF0E78182CD44D068C09005400FF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF08690E2BCE49
                07960D005800FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FF0D82170C9D15005E00FF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0B8913006501
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton1Click
              ExplicitLeft = 4
              ExplicitTop = 8
              ExplicitWidth = 23
            end
            object SpeedButton2: TSpeedButton
              Left = 0
              Top = 0
              Width = 31
              Height = 22
              Hint = 'Importar imagem'
              Align = alTop
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6696BA6696BA6696BA669
                6BA6696BA6696BA6696BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFA6696BF3D3A4F0CB97EFC68AEDC180EBBB76A6696BFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA7756BF6DDBA707BCE0F2E
                F36E75BFEEC484A6696BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFBC8268F8E7CE0F30F7001EFF0F2FF3F0CC96A6696BFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD1926DFBF2E27486E70F30
                F8727FD7F3D7ABA6696BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFDA9D75FEFAF3FBF4E7FAEEDCF8E7CFF6E1C0A6696BFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFE7AB79FFFFFFFEFBF8FCF7
                EEA6696AA6696AAC6C5AA46769A46769A46769A46769A46769A46769A46769A4
                6769FF00FFE7AB79FFFFFFFFFFFFFEFCFBA6696AC67F4EFF00FFA46769E9C49D
                D8A57BD8A373D59D66D1965AEAB66CA46769FF00FFE7AB79D1926DD1926DD192
                6DA6696AFF00FF005901A46769BB76507D1800821F00811F00811E00DCA162A4
                6769FF00FFFF00FF2D6718FF00FFFF00FFFF00FFFF00FF016405A7756BF6E9DD
                8A2A087F1A007B1600AB5B30FCDD9FA46769FF00FF005D03067F14FF00FFFF00
                FFFF00FF017707036506BC8268FFFFFFC99379791400892907E6BD99FFEAB5A4
                6769015A0630BD571A922F01550303600704780A05840C015804D1926DFFFFFF
                FBF4F299411EBF7D59FAEDD4D4BCA02A70272CC55841E07527BB4515A5280996
                13058C0D026606FF00FFDA9D75FFFFFFFFFFFFE7D0C4F7EEE3A46769A46769A4
                6A5A1C963122B63E149A2605700B036C07026005FF00FFFF00FFE7AB79FFFFFF
                FFFFFFFFFFFFFCFFFFA46769D18649FF00FFFF00FF0875110C8816FF00FFFF00
                FFFF00FFFF00FFFF00FFE7AB79D1926DD1926DD1926DD1926DA46769FF00FFFF
                00FFFF00FFFF00FF036307FF00FFFF00FFFF00FFFF00FFFF00FF}
              ParentShowHint = False
              ShowHint = True
              OnClick = SpeedButton2Click
              ExplicitLeft = 4
              ExplicitTop = 36
              ExplicitWidth = 23
            end
          end
          object Logo: TJvDBImage
            Left = 0
            Top = 0
            Width = 288
            Height = 174
            Align = alClient
            DataField = 'LOGOMARCA'
            DataSource = DataCadastro
            Proportional = True
            Stretch = True
            TabOrder = 1
          end
        end
        object cxTabSheet3: TcxTabSheet
          Caption = 'Obs'
          ImageIndex = 2
          object GroupBox2: TGroupBox
            Left = 0
            Top = 0
            Width = 323
            Height = 174
            Align = alClient
            TabOrder = 0
            object DBMemo1: TDBMemo
              Left = 2
              Top = 15
              Width = 319
              Height = 157
              Align = alClient
              DataField = 'OBS'
              DataSource = DataCadastro
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
        object cxTabSheet4: TcxTabSheet
          Caption = 'Sequenciais'
          ImageIndex = 3
          object LabelDBEdit9: TLabelDBEdit
            Left = 16
            Top = 16
            Width = 89
            Height = 21
            DataField = 'NUMEROPROPOSTA'
            DataSource = DataCadastro
            TabOrder = 0
            Titulo.Left = 16
            Titulo.Top = 1
            Titulo.Width = 89
            Titulo.Height = 13
            Titulo.Caption = 'N'#186' '#250'ltima proposta'
            IsNull = True
            PodeRepetir = True
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
          end
          object LabelDBEdit11: TLabelDBEdit
            Left = 111
            Top = 16
            Width = 89
            Height = 21
            DataField = 'NUMEROCONTRATO'
            DataSource = DataCadastro
            TabOrder = 1
            Titulo.Left = 111
            Titulo.Top = 1
            Titulo.Width = 87
            Titulo.Height = 13
            Titulo.Caption = 'N'#186' '#250'ltimo contrato'
            IsNull = True
            PodeRepetir = True
            CorPrincipal = clWhite
            CorSecundaria = 11592447
            GravaEsteCampo = True
          end
        end
      end
      object LabelDBEdit10: TLabelDBEdit
        Left = 16
        Top = 182
        Width = 121
        Height = 21
        DataField = 'IM'
        DataSource = DataCadastro
        TabOrder = 9
        Titulo.Left = 16
        Titulo.Top = 167
        Titulo.Width = 92
        Titulo.Height = 13
        Titulo.Caption = 'Inscri'#231#227'o  Municipal'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
      end
    end
    inherited Panel2: TPanel
      Height = 486
      ExplicitHeight = 486
      inherited PageControl: TcxPageControl
        Height = 484
        ExplicitHeight = 484
        ClientRectBottom = 480
        inherited tsGrid: TcxTabSheet
          ExplicitHeight = 456
          inherited pnlGrid: TPanel
            Height = 456
            ExplicitHeight = 456
            inherited TvCadastro: TcxGrid
              Height = 456
              ExplicitHeight = 456
            end
          end
        end
        inherited tsTree: TcxTabSheet
          ExplicitLeft = 4
          ExplicitTop = 24
          ExplicitWidth = 293
          ExplicitHeight = 456
          inherited pnlTree: TPanel
            Width = 293
            Height = 456
            ExplicitWidth = 293
            ExplicitHeight = 456
            inherited TvTree: TcxDBTreeList
              Width = 293
              Height = 456
              ExplicitWidth = 293
              ExplicitHeight = 456
            end
          end
        end
      end
    end
  end
  object Open: TOpenPictureDialog
    Filter = 
      'All (*.cur;*.pcx;*.ani;*.png;*.png;*.jpg;*.jpeg;*.bmp;*.tif;*.ti' +
      'ff;*.ico;*.emf;*.wmf)|*.cur;*.pcx;*.ani;*.png;*.png;*.jpg;*.jpeg' +
      ';*.bmp;*.tif;*.tiff;*.ico;*.emf;*.wmf|Cursor files (*.cur)|*.cur' +
      '|PCX Image (*.pcx)|*.pcx|ANI Image (*.ani)|*.ani|PNG graphics fr' +
      'om DevExpress (*.png)|*.png|Portable Network Graphics (*.png)|*.' +
      'png|JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpe' +
      'g|Bitmaps (*.bmp)|*.bmp|TIFF Images (*.tif)|*.tif|TIFF Images (*' +
      '.tiff)|*.tiff|Icons (*.ico)|*.ico|Enhanced Metafiles (*.emf)|*.e' +
      'mf|Metafiles (*.wmf)|*.wmf'
    Left = 32
    Top = 128
  end
end
