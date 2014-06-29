inherited frmDlg_ServicoContrato: TfrmDlg_ServicoContrato
  Caption = 'Servi'#231'os do contrato'
  ClientHeight = 403
  ClientWidth = 363
  ExplicitWidth = 379
  ExplicitHeight = 442
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 362
    Width = 363
    ExplicitTop = 362
    ExplicitWidth = 363
    inherited btnOk: TBitBtn
      Left = 85
      ExplicitLeft = 85
    end
    inherited btnCancelar: TBitBtn
      Left = 176
      ExplicitLeft = 176
    end
  end
  inherited Panel2: TPanel
    Width = 363
    Height = 362
    ExplicitWidth = 363
    ExplicitHeight = 362
    inherited Panel3: TPanel
      Width = 363
      Height = 362
      ExplicitWidth = 363
      ExplicitHeight = 362
      inherited edtProduto: TEditPesquisa
        LblTitulo.Width = 40
        LblTitulo.Caption = 'Servi'#231'os'
        LblTitulo.ExplicitWidth = 40
        BtnNovo.Visible = True
        BtnEditar.Visible = True
        Display.Left = 158
        Display.ExplicitLeft = 158
      end
      inherited edtQuantidade: TLabelDBEdit
        Enabled = False
        Visible = False
        Titulo.Enabled = False
        Titulo.Visible = False
      end
      inherited edtValUni: TLabelDBEdit
        Left = 15
        Titulo.Left = 15
        Titulo.ExplicitLeft = 15
        ExplicitLeft = 15
      end
      inherited edtPercDesc: TLabelDBEdit
        Left = 87
        Titulo.Left = 87
        Titulo.ExplicitLeft = 87
        ExplicitLeft = 87
      end
      inherited edtPercAcrescimo: TLabelDBEdit
        Left = 156
        Titulo.Left = 156
        Titulo.ExplicitLeft = 156
        ExplicitLeft = 156
      end
      inherited LabelDBEdit6: TLabelDBEdit
        Left = 183
        Titulo.Left = 183
        Titulo.ExplicitLeft = 183
        ExplicitLeft = 183
      end
      inherited edtValorAcrescimo: TLabelDBEdit
        Left = 16
        Titulo.Left = 16
        Titulo.ExplicitLeft = 16
        ExplicitLeft = 16
      end
      inherited edtValorDesc: TLabelDBEdit
        Left = 228
        Top = 66
        Titulo.Left = 228
        Titulo.Top = 51
        Titulo.ExplicitLeft = 228
        Titulo.ExplicitTop = 51
        ExplicitLeft = 228
        ExplicitTop = 66
      end
      inherited LabelDBEdit9: TLabelDBEdit
        Left = 88
        Titulo.Left = 88
        Titulo.ExplicitLeft = 88
        ExplicitLeft = 88
      end
      inherited GroupBox1: TGroupBox
        Top = 144
        Width = 363
        Height = 218
        ExplicitTop = 144
        ExplicitWidth = 363
        ExplicitHeight = 218
        inherited cxDBMemo1: TcxDBMemo
          ExplicitWidth = 359
          ExplicitHeight = 201
          Height = 201
          Width = 359
        end
      end
    end
  end
end
