inherited frmCad_NCM: TfrmCad_NCM
  Caption = 'Cadastro de NCM'
  ClientWidth = 629
  ExplicitWidth = 645
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 629
    ExplicitWidth = 629
  end
  inherited Panel3: TPanel
    Width = 444
    ExplicitWidth = 444
    inherited PageControl: TcxPageControl
      Width = 444
      ExplicitWidth = 444
      ClientRectRight = 443
      inherited TsPrincipal: TcxTabSheet
        ExplicitWidth = 442
        inherited pnlGeral: TPanel
          Width = 442
          ExplicitWidth = 442
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 442
            Height = 103
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label1: TLabel
              Left = 135
              Top = 0
              Width = 46
              Height = 13
              Caption = 'Descri'#231#227'o'
            end
            object LabelDBEdit1: TLabelDBEdit
              Left = 10
              Top = 16
              Width = 119
              Height = 21
              DataField = 'CODIGO'
              DataSource = DataCadastro
              TabOrder = 0
              Titulo.Left = 10
              Titulo.Top = 1
              Titulo.Width = 33
              Titulo.Height = 13
              Titulo.Caption = 'C'#243'digo'
              IsNull = False
              PodeRepetir = False
              CorPrincipal = clWhite
              CorSecundaria = 11592447
              GravaEsteCampo = True
            end
            object DBMemo1: TDBMemo
              Left = 135
              Top = 16
              Width = 298
              Height = 80
              DataField = 'DESCRICAO'
              DataSource = DataCadastro
              ScrollBars = ssVertical
              TabOrder = 1
            end
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 103
            Width = 442
            Height = 218
            Align = alClient
            Caption = ' Tributa'#231#245'es '
            TabOrder = 1
            object Panel4: TPanel
              Left = 361
              Top = 15
              Width = 79
              Height = 201
              Align = alRight
              TabOrder = 0
              object SpeedButton1: TSpeedButton
                Left = 6
                Top = 28
                Width = 69
                Height = 25
                Caption = 'Incluir'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000E30E0000E30E0000000100000001000031319C003131
                  A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
                  E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
                  FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
                  FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
                  1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
                  0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
                  0E1B180E0E0E0B08031B1B0A0E0E0E0E0E1B180E0E0E0E09041B1B0E0E0E0E0E
                  0E1B180E0E0E0E0A051B1B0E0E181818181B181818180B0A061B1B0E0E1B1B1B
                  1B1B1B1B1B1B0A0A061B1B0E10100E0E0E1B180E0E0B0A0A061B1B0E1313100E
                  0E1B180E0E0B0A0A061B1B1015141110101B180E0E0E0B0B061B1B1318151312
                  111B180E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
                  0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
                ParentFont = False
                OnClick = SpeedButton1Click
              end
              object SpeedButton2: TSpeedButton
                Left = 6
                Top = 59
                Width = 69
                Height = 25
                Caption = 'Editar'
                Glyph.Data = {
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
                OnClick = SpeedButton2Click
              end
              object SpeedButton3: TSpeedButton
                Left = 6
                Top = 90
                Width = 69
                Height = 25
                Caption = 'Excluir'
                Glyph.Data = {
                  36050000424D3605000000000000360400002800000010000000100000000100
                  08000000000000010000E30E0000E30E0000000100000001000031319C003131
                  A5003131AD003131B5003131BD003131C6003131CE003131D6003131DE003131
                  E7003131EF003131F700FF00FF003131FF003139FF003939FF003942FF00424A
                  FF004A4AFF005252FF006363FF006B6BFF006B73FF007B84FF00848CFF009C9C
                  FF00C6CEFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000C1B1B1B1B1B
                  1B1B1B1B1B1B1B1B1B0C1B16030404040505040403030201141B1B05080A0B0B
                  0A0B0A0A0A090805001B1B070A0E0E0E0E0E0E0E0E0E0906021B1B090E0E0E0E
                  0E0E0E0E0E0E0B08031B1B0A0E0E0E0E0E0E0E0E0E0E0E09041B1B0E0E0E0E0E
                  0E0E0E0E0E0E0E0A051B1B0E0E1818181818181818180B0A061B1B0E0E1B1B1B
                  1B1B1B1B1B1B0A0A061B1B0E10100E0E0E0E0E0E0E0B0A0A061B1B0E1313100E
                  0E0E0E0E0E0B0A0A061B1B1015141110100E0E0E0E0E0B0B061B1B1318151312
                  11110E0E0E0E0E0B061B1B1419181514131211100E0E0E0B041B1B1A1412100E
                  0E0E0E0E0E0E0B08171B0C1B1B1B1B1B1B1B1B1B1B1B1B1B1B0C}
                OnClick = SpeedButton3Click
              end
            end
            object cxGrid1: TcxGrid
              Left = 2
              Top = 15
              Width = 359
              Height = 201
              Align = alClient
              TabOrder = 1
              object cxGrid1DBTableView1: TcxGridDBTableView
                Tag = 99
                NavigatorButtons.ConfirmDelete = False
                DataController.DataSource = DataTributacoes
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsBehavior.FocusFirstCellOnNewRecord = True
                OptionsBehavior.GoToNextCellOnEnter = True
                OptionsView.GroupByBox = False
                object cxGrid1DBTableView1Column1: TcxGridDBColumn
                  DataBinding.FieldName = 'UF'
                  PropertiesClassName = 'TcxComboBoxProperties'
                  Properties.Items.Strings = (
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
                  Width = 40
                end
                object cxGrid1DBTableView1Column2: TcxGridDBColumn
                  Caption = 'II'
                  DataBinding.FieldName = 'ALIQII'
                  Visible = False
                  Width = 50
                end
                object cxGrid1DBTableView1Column3: TcxGridDBColumn
                  Caption = 'PIS'
                  DataBinding.FieldName = 'ALIQPIS'
                  Width = 50
                end
                object cxGrid1DBTableView1Column4: TcxGridDBColumn
                  Caption = 'COFINS'
                  DataBinding.FieldName = 'ALIQCOFINS'
                  Width = 60
                end
                object cxGrid1DBTableView1Column5: TcxGridDBColumn
                  Caption = 'IPI'
                  DataBinding.FieldName = 'ALIQIPI'
                  Width = 50
                end
                object cxGrid1DBTableView1Column6: TcxGridDBColumn
                  Caption = 'Valor LI'
                  DataBinding.FieldName = 'VALOR_LI'
                  Visible = False
                  Width = 70
                end
              end
              object cxGrid1Level1: TcxGridLevel
                GridView = cxGrid1DBTableView1
              end
            end
          end
        end
      end
    end
  end
  inherited ActionList1: TActionList
    inherited actImprimir: TAction
      Enabled = False
      Visible = False
    end
  end
  inherited CdsCadastro: TpFIBClientDataSet
    AfterScroll = CdsCadastroAfterScroll
  end
  object CdsTributacoes: TpFIBClientDataSet
    Aggregates = <>
    Filter = 'FLAGEDICAO <> '#39'D'#39
    Filtered = True
    Params = <>
    AfterOpen = CdsTributacoesAfterOpen
    BeforeEdit = CdsTributacoesBeforeEdit
    BeforePost = CdsTributacoesBeforePost
    OnNewRecord = CdsTributacoesNewRecord
    Left = 32
    Top = 184
  end
  object DataTributacoes: TDataSource
    DataSet = CdsTributacoes
    Left = 120
    Top = 192
  end
end
