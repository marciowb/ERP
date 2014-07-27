inherited frmDlg_SaidaItem: TfrmDlg_SaidaItem
  Caption = 'Saida de produtos'
  ClientHeight = 527
  ClientWidth = 328
  ExplicitTop = -25
  ExplicitWidth = 344
  ExplicitHeight = 566
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 486
    Width = 328
    ExplicitTop = 447
    ExplicitWidth = 328
    inherited btnOk: TBitBtn
      Left = 56
      ExplicitLeft = 56
    end
    inherited btnCancelar: TBitBtn
      Left = 153
      ExplicitLeft = 153
    end
  end
  inherited Panel2: TPanel
    Width = 328
    Height = 486
    ExplicitWidth = 328
    ExplicitHeight = 447
    inherited Panel3: TPanel
      Width = 328
      Height = 486
      ExplicitWidth = 328
      ExplicitHeight = 447
      inherited edtProduto: TEditPesquisa
        BtnNovo.Visible = True
        BtnEditar.Visible = True
        Display.Left = 158
        Display.Width = 205
        Display.TabOrder = 3
        Display.ExplicitLeft = 158
        Display.ExplicitWidth = 205
        TamanhoDisplay = 205
      end
      inherited edtQuantidade: TLabelDBEdit
        Top = 106
        TabOrder = 4
        Titulo.Top = 91
        Titulo.ExplicitTop = 91
        ExplicitTop = 106
      end
      inherited edtValUni: TLabelDBEdit
        Top = 106
        TabOrder = 5
        Titulo.Top = 91
        Titulo.ExplicitTop = 91
        ExplicitTop = 106
      end
      inherited edtPercDesc: TLabelDBEdit
        Top = 106
        TabOrder = 6
        Titulo.Top = 91
        Titulo.ExplicitTop = 91
        ExplicitTop = 106
      end
      inherited edtPercAcrescimo: TLabelDBEdit
        Left = 245
        Top = 106
        TabOrder = 7
        Titulo.Left = 245
        Titulo.Top = 91
        Titulo.ExplicitLeft = 245
        Titulo.ExplicitTop = 91
        ExplicitLeft = 245
        ExplicitTop = 106
      end
      inherited LabelDBEdit6: TLabelDBEdit
        Left = 232
        Top = 347
        TabOrder = 10
        Titulo.Left = 232
        Titulo.Top = 332
        Titulo.ExplicitLeft = 232
        Titulo.ExplicitTop = 332
        ExplicitLeft = 232
        ExplicitTop = 347
      end
      inherited edtValorAcrescimo: TLabelDBEdit
        Left = 84
        Top = 145
        TabOrder = 9
        Titulo.Left = 84
        Titulo.Top = 130
        Titulo.ExplicitLeft = 84
        Titulo.ExplicitTop = 130
        ExplicitLeft = 84
        ExplicitTop = 145
      end
      inherited edtValorDesc: TLabelDBEdit
        Top = 145
        TabOrder = 8
        Titulo.Top = 130
        Titulo.ExplicitTop = 130
        ExplicitTop = 145
      end
      inherited LabelDBEdit9: TLabelDBEdit
        Top = 145
        TabOrder = 11
        Titulo.Top = 130
        Titulo.ExplicitTop = 130
        ExplicitTop = 145
      end
      inherited GroupBox1: TGroupBox
        Top = 374
        Width = 328
        Height = 112
        TabOrder = 30
        ExplicitTop = 335
        ExplicitWidth = 328
        ExplicitHeight = 112
        inherited cxDBMemo1: TcxDBMemo
          ExplicitWidth = 324
          ExplicitHeight = 95
          Height = 95
          Width = 324
        end
      end
      object LabelDBEdit2: TLabelDBEdit
        Left = 245
        Top = 145
        Width = 66
        Height = 21
        DataField = 'BASEICMS'
        DataSource = DataItens
        TabOrder = 12
        Titulo.Left = 245
        Titulo.Top = 130
        Titulo.Width = 51
        Titulo.Height = 13
        Titulo.Caption = 'Base ICMS'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
        AsInteger = 0
      end
      object LabelDBEdit17: TLabelDBEdit
        Left = 16
        Top = 184
        Width = 60
        Height = 21
        DataField = 'ALIQICMS'
        DataSource = DataItens
        TabOrder = 13
        Titulo.Left = 16
        Titulo.Top = 169
        Titulo.Width = 49
        Titulo.Height = 13
        Titulo.Caption = 'Aliq. ICMS'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
        AsInteger = 0
      end
      object LabelDBEdit19: TLabelDBEdit
        Left = 84
        Top = 184
        Width = 62
        Height = 21
        TabStop = False
        Color = clSkyBlue
        DataField = 'VALORICMS'
        DataSource = DataItens
        ReadOnly = True
        TabOrder = 14
        Titulo.Left = 84
        Titulo.Top = 169
        Titulo.Width = 52
        Titulo.Height = 13
        Titulo.Caption = 'Valor ICMS'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
        AsInteger = 0
      end
      object LabelDBEdit20: TLabelDBEdit
        Left = 152
        Top = 184
        Width = 43
        Height = 21
        DataField = 'BASEISS'
        DataSource = DataItens
        TabOrder = 15
        Titulo.Left = 152
        Titulo.Top = 169
        Titulo.Width = 42
        Titulo.Height = 13
        Titulo.Caption = 'Base ISS'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
        AsInteger = 0
      end
      object LabelDBEdit21: TLabelDBEdit
        Left = 200
        Top = 184
        Width = 39
        Height = 21
        DataField = 'ALIQISS'
        DataSource = DataItens
        TabOrder = 16
        Titulo.Left = 200
        Titulo.Top = 169
        Titulo.Width = 40
        Titulo.Height = 13
        Titulo.Caption = 'Aliq. ISS'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
        AsInteger = 0
      end
      object LabelDBEdit22: TLabelDBEdit
        Left = 245
        Top = 184
        Width = 66
        Height = 21
        TabStop = False
        Color = clSkyBlue
        DataField = 'VALORISS'
        DataSource = DataItens
        ReadOnly = True
        TabOrder = 17
        Titulo.Left = 245
        Titulo.Top = 169
        Titulo.Width = 43
        Titulo.Height = 13
        Titulo.Caption = 'Valor ISS'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
        AsInteger = 0
      end
      object LabelDBEdit25: TLabelDBEdit
        Left = 16
        Top = 226
        Width = 60
        Height = 21
        DataField = 'BASEIPI'
        DataSource = DataItens
        TabOrder = 18
        Titulo.Left = 16
        Titulo.Top = 211
        Titulo.Width = 40
        Titulo.Height = 13
        Titulo.Caption = 'Base IPI'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
        AsInteger = 0
      end
      object LabelDBEdit24: TLabelDBEdit
        Left = 84
        Top = 226
        Width = 39
        Height = 21
        DataField = 'ALIQIPI'
        DataSource = DataItens
        TabOrder = 19
        Titulo.Left = 84
        Titulo.Top = 211
        Titulo.Width = 38
        Titulo.Height = 13
        Titulo.Caption = 'Aliq. IPI'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
        AsInteger = 0
      end
      object LabelDBEdit23: TLabelDBEdit
        Left = 129
        Top = 226
        Width = 66
        Height = 21
        TabStop = False
        Color = clSkyBlue
        DataField = 'VALORIPI'
        DataSource = DataItens
        ReadOnly = True
        TabOrder = 20
        Titulo.Left = 129
        Titulo.Top = 211
        Titulo.Width = 41
        Titulo.Height = 13
        Titulo.Caption = 'Valor IPI'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
        AsInteger = 0
      end
      object LabelDBEdit28: TLabelDBEdit
        Left = 200
        Top = 226
        Width = 111
        Height = 21
        DataField = 'BASEICMSST'
        DataSource = DataItens
        TabOrder = 21
        Titulo.Left = 200
        Titulo.Top = 211
        Titulo.Width = 74
        Titulo.Height = 13
        Titulo.Caption = 'Base ICMS S.T.'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
        AsInteger = 0
      end
      object LabelDBEdit27: TLabelDBEdit
        Left = 16
        Top = 266
        Width = 60
        Height = 21
        DataField = 'ALIQST'
        DataSource = DataItens
        TabOrder = 22
        Titulo.Left = 16
        Titulo.Top = 251
        Titulo.Width = 44
        Titulo.Height = 13
        Titulo.Caption = 'Aliq. S.T.'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
        AsInteger = 0
      end
      object LabelDBEdit26: TLabelDBEdit
        Left = 84
        Top = 266
        Width = 39
        Height = 21
        DataField = 'MVA'
        DataSource = DataItens
        TabOrder = 23
        Titulo.Left = 84
        Titulo.Top = 251
        Titulo.Width = 21
        Titulo.Height = 13
        Titulo.Caption = 'MVA'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
        AsInteger = 0
      end
      object LabelDBEdit29: TLabelDBEdit
        Left = 129
        Top = 266
        Width = 66
        Height = 21
        TabStop = False
        Color = clSkyBlue
        DataField = 'VALORST'
        DataSource = DataItens
        ReadOnly = True
        TabOrder = 24
        Titulo.Left = 129
        Titulo.Top = 251
        Titulo.Width = 67
        Titulo.Height = 13
        Titulo.Caption = 'Valor ICMS ST'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
        AsInteger = 0
      end
      object LabelDBEdit30: TLabelDBEdit
        Left = 201
        Top = 266
        Width = 111
        Height = 21
        DataField = 'BASEPISCOFINS'
        DataSource = DataItens
        TabOrder = 25
        Titulo.Left = 201
        Titulo.Top = 251
        Titulo.Width = 91
        Titulo.Height = 13
        Titulo.Caption = 'Base PIS/CONFINS'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
        AsInteger = 0
      end
      object LabelDBEdit31: TLabelDBEdit
        Left = 16
        Top = 306
        Width = 60
        Height = 21
        DataField = 'ALIQPIS'
        DataSource = DataItens
        TabOrder = 26
        Titulo.Left = 16
        Titulo.Top = 291
        Titulo.Width = 40
        Titulo.Height = 13
        Titulo.Caption = 'Aliq. PIS'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
        AsInteger = 0
      end
      object LabelDBEdit32: TLabelDBEdit
        Left = 84
        Top = 306
        Width = 61
        Height = 21
        DataField = 'ALIQCOFINS'
        DataSource = DataItens
        TabOrder = 27
        Titulo.Left = 84
        Titulo.Top = 291
        Titulo.Width = 62
        Titulo.Height = 13
        Titulo.Caption = 'Aliq. COFINS'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
        AsInteger = 0
      end
      object LabelDBEdit33: TLabelDBEdit
        Left = 156
        Top = 306
        Width = 66
        Height = 21
        TabStop = False
        Color = clSkyBlue
        DataField = 'VALORPIS'
        DataSource = DataItens
        ReadOnly = True
        TabOrder = 28
        Titulo.Left = 156
        Titulo.Top = 291
        Titulo.Width = 43
        Titulo.Height = 13
        Titulo.Caption = 'Valor PIS'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
        AsInteger = 0
      end
      object LabelDBEdit34: TLabelDBEdit
        Left = 232
        Top = 306
        Width = 79
        Height = 21
        TabStop = False
        Color = clSkyBlue
        DataField = 'VALORCOFINS'
        DataSource = DataItens
        ReadOnly = True
        TabOrder = 29
        Titulo.Left = 232
        Titulo.Top = 291
        Titulo.Width = 65
        Titulo.Height = 13
        Titulo.Caption = 'Valor COFINS'
        IsNull = True
        PodeRepetir = True
        CorPrincipal = clWhite
        CorSecundaria = 11592447
        GravaEsteCampo = True
        AsInteger = 0
      end
      object edtAlmoxarifado: TEditPesquisa
        Left = 16
        Top = 66
        Width = 65
        Height = 21
        TabOrder = 1
        TipoPesquisa = 0
        TamanhoCodigo = 0
        AutoPesquisa = True
        AutoCompletar = True
        UsaBtnNovo = False
        UsaBtnEditar = False
        UsaDisplay = True
        LblTitulo.Left = 16
        LblTitulo.Top = 51
        LblTitulo.Width = 63
        LblTitulo.Height = 13
        LblTitulo.Caption = 'Almoxarifado'
        BtnPesquisa.Left = 83
        BtnPesquisa.Top = 66
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
        BtnNovo.Left = 108
        BtnNovo.Top = 66
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
        BtnEditar.Left = 133
        BtnEditar.Top = 66
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
        Display.Left = 108
        Display.Top = 66
        Display.Width = 205
        Display.Height = 21
        Display.TabStop = False
        Display.Color = clSkyBlue
        Display.ReadOnly = True
        Display.TabOrder = 2
        TamanhoDisplay = 205
      end
    end
  end
  inherited DataItens: TDataSource
    Left = 96
    Top = 368
  end
end
