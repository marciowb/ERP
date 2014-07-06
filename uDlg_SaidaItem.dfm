inherited frmDlg_SaidaItem: TfrmDlg_SaidaItem
  Caption = 'Saida de produtos'
  ClientHeight = 480
  ClientWidth = 328
  ExplicitWidth = 344
  ExplicitHeight = 519
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 439
    Width = 328
    inherited btnOk: TBitBtn
      Left = 68
    end
    inherited btnCancelar: TBitBtn
      Left = 165
    end
  end
  inherited Panel2: TPanel
    Width = 328
    Height = 439
    inherited Panel3: TPanel
      Width = 328
      Height = 439
      inherited edtProduto: TEditPesquisa
        Display.Width = 205
        Display.ExplicitWidth = 205
        TamanhoDisplay = 205
      end
      inherited edtPercAcrescimo: TLabelDBEdit
        Left = 245
        Titulo.Left = 245
        Titulo.ExplicitLeft = 245
        ExplicitLeft = 245
      end
      inherited LabelDBEdit6: TLabelDBEdit
        Left = 232
        Top = 307
        Titulo.Left = 232
        Titulo.Top = 292
        Titulo.ExplicitLeft = 232
        Titulo.ExplicitTop = 292
        ExplicitLeft = 232
        ExplicitTop = 307
      end
      inherited edtValorAcrescimo: TLabelDBEdit
        Left = 84
        Titulo.Left = 84
        Titulo.ExplicitLeft = 84
        ExplicitLeft = 84
      end
      inherited GroupBox1: TGroupBox
        Top = 327
        Width = 328
        Height = 112
        ExplicitTop = 334
        ExplicitWidth = 328
        ExplicitHeight = 112
        inherited cxDBMemo1: TcxDBMemo
          ExplicitTop = 16
          ExplicitWidth = 324
          ExplicitHeight = 136
          Height = 95
          Width = 324
        end
      end
      object LabelDBEdit2: TLabelDBEdit
        Left = 245
        Top = 105
        Width = 66
        Height = 21
        DataField = 'BASEICMS'
        DataSource = DataItens
        TabOrder = 11
        Titulo.Left = 245
        Titulo.Top = 90
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
        Top = 144
        Width = 60
        Height = 21
        DataField = 'ALIQICMS'
        DataSource = DataItens
        TabOrder = 12
        Titulo.Left = 16
        Titulo.Top = 129
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
        Top = 144
        Width = 62
        Height = 21
        TabStop = False
        Color = clSkyBlue
        DataField = 'VALORICMS'
        DataSource = DataItens
        ReadOnly = True
        TabOrder = 13
        Titulo.Left = 84
        Titulo.Top = 129
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
        Top = 144
        Width = 43
        Height = 21
        DataField = 'BASEISS'
        DataSource = DataItens
        TabOrder = 14
        Titulo.Left = 152
        Titulo.Top = 129
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
        Top = 144
        Width = 39
        Height = 21
        DataField = 'ALIQISS'
        DataSource = DataItens
        TabOrder = 15
        Titulo.Left = 200
        Titulo.Top = 129
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
        Top = 144
        Width = 66
        Height = 21
        TabStop = False
        Color = clSkyBlue
        DataField = 'VALORISS'
        DataSource = DataItens
        ReadOnly = True
        TabOrder = 16
        Titulo.Left = 245
        Titulo.Top = 129
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
        Top = 186
        Width = 60
        Height = 21
        DataField = 'BASEIPI'
        DataSource = DataItens
        TabOrder = 17
        Titulo.Left = 16
        Titulo.Top = 171
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
        Top = 186
        Width = 39
        Height = 21
        DataField = 'ALIQIPI'
        DataSource = DataItens
        TabOrder = 18
        Titulo.Left = 84
        Titulo.Top = 171
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
        Top = 186
        Width = 66
        Height = 21
        TabStop = False
        Color = clSkyBlue
        DataField = 'VALORIPI'
        DataSource = DataItens
        ReadOnly = True
        TabOrder = 19
        Titulo.Left = 129
        Titulo.Top = 171
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
        Top = 186
        Width = 111
        Height = 21
        DataField = 'BASEICMSST'
        DataSource = DataItens
        TabOrder = 20
        Titulo.Left = 200
        Titulo.Top = 171
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
        Top = 226
        Width = 60
        Height = 21
        DataField = 'ALIQST'
        DataSource = DataItens
        TabOrder = 21
        Titulo.Left = 16
        Titulo.Top = 211
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
        Top = 226
        Width = 39
        Height = 21
        DataField = 'MVA'
        DataSource = DataItens
        TabOrder = 22
        Titulo.Left = 84
        Titulo.Top = 211
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
        Top = 226
        Width = 66
        Height = 21
        TabStop = False
        Color = clSkyBlue
        DataField = 'VALORST'
        DataSource = DataItens
        ReadOnly = True
        TabOrder = 23
        Titulo.Left = 129
        Titulo.Top = 211
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
        Top = 226
        Width = 111
        Height = 21
        DataField = 'BASEPISCOFINS'
        DataSource = DataItens
        TabOrder = 24
        Titulo.Left = 201
        Titulo.Top = 211
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
        Top = 266
        Width = 60
        Height = 21
        DataField = 'ALIQPIS'
        DataSource = DataItens
        TabOrder = 25
        Titulo.Left = 16
        Titulo.Top = 251
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
        Top = 266
        Width = 61
        Height = 21
        DataField = 'ALIQCOFINS'
        DataSource = DataItens
        TabOrder = 26
        Titulo.Left = 84
        Titulo.Top = 251
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
        Top = 266
        Width = 66
        Height = 21
        TabStop = False
        Color = clSkyBlue
        DataField = 'VALORPIS'
        DataSource = DataItens
        ReadOnly = True
        TabOrder = 27
        Titulo.Left = 156
        Titulo.Top = 251
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
        Top = 266
        Width = 79
        Height = 21
        TabStop = False
        Color = clSkyBlue
        DataField = 'VALORCOFINS'
        DataSource = DataItens
        ReadOnly = True
        TabOrder = 28
        Titulo.Left = 232
        Titulo.Top = 251
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
    end
  end
  inherited DataItens: TDataSource
    Left = 96
    Top = 368
  end
end
