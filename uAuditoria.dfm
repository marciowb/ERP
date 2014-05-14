inherited frmAuditoria: TfrmAuditoria
  Caption = 'Auditoria do Sistema'
  ClientHeight = 547
  ClientWidth = 919
  Position = poDesigned
  WindowState = wsMaximized
  ExplicitWidth = 935
  ExplicitHeight = 585
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 62
    Width = 281
    Height = 485
    Align = alLeft
    Caption = ' Usu'#225'rios '
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 277
      Height = 468
      Align = alClient
      DataSource = DataUsuario
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'LOGIN'
          Title.Caption = 'Login'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMECOMPLETO'
          Title.Caption = 'Nome'
          Width = 167
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 281
    Top = 62
    Width = 638
    Height = 485
    Align = alClient
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 1
      Top = 1
      Width = 636
      Height = 298
      Align = alClient
      Caption = ' Ocorrencias '
      TabOrder = 0
      object cxGrid1: TcxGrid
        Left = 2
        Top = 15
        Width = 632
        Height = 281
        Align = alClient
        TabOrder = 0
        object TvOcorrencias: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = DataOcorrencias
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          object vOcorrenciasColumn1: TcxGridDBColumn
            Caption = 'Data'
            DataBinding.FieldName = 'DATA'
          end
          object vOcorrenciasColumn2: TcxGridDBColumn
            Caption = 'Hora'
            DataBinding.FieldName = 'HORA'
          end
          object vOcorrenciasColumn7: TcxGridDBColumn
            Caption = 'Resumo'
            DataBinding.FieldName = 'RESUMO'
            Width = 148
          end
          object vOcorrenciasColumn6: TcxGridDBColumn
            Caption = 'Local'
            DataBinding.FieldName = 'CAPTION'
            Width = 141
          end
          object vOcorrenciasColumn3: TcxGridDBColumn
            Caption = 'Operacao'
            DataBinding.FieldName = 'operacao'
          end
          object vOcorrenciasColumn4: TcxGridDBColumn
            Caption = 'Terminal'
            DataBinding.FieldName = 'NOMEPC'
            Width = 89
          end
          object vOcorrenciasColumn5: TcxGridDBColumn
            Caption = 'Erro?'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = TvOcorrencias
        end
      end
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 307
      Width = 636
      Height = 177
      Align = alBottom
      Caption = ' Detalhes '
      TabOrder = 1
      object GroupBox4: TGroupBox
        Left = 347
        Top = 15
        Width = 287
        Height = 160
        Align = alRight
        Caption = ' Imagem '
        TabOrder = 0
        object cxDBImage1: TcxDBImage
          Left = 2
          Top = 15
          Align = alClient
          DataBinding.DataField = 'IMGERRO'
          DataBinding.DataSource = DataOcorrencias
          Properties.ReadOnly = True
          Properties.Stretch = True
          TabOrder = 0
          Height = 143
          Width = 283
        end
      end
      object cxSplitter2: TcxSplitter
        Left = 289
        Top = 15
        Width = 8
        Height = 160
        HotZoneClassName = 'TcxMediaPlayer9Style'
        Control = GroupBox5
      end
      object GroupBox5: TGroupBox
        Left = 2
        Top = 15
        Width = 287
        Height = 160
        Align = alLeft
        Caption = ' Texto '
        TabOrder = 2
        object DBMemo2: TDBMemo
          Left = 2
          Top = 15
          Width = 283
          Height = 143
          TabStop = False
          Align = alClient
          DataField = 'TEXTO'
          DataSource = DataOcorrencias
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object GroupBox6: TGroupBox
        Left = 297
        Top = 15
        Width = 42
        Height = 160
        Align = alClient
        Caption = ' Log  '
        TabOrder = 3
        object DBMemo1: TDBMemo
          Left = 2
          Top = 15
          Width = 38
          Height = 143
          TabStop = False
          Align = alClient
          DataField = 'TEXTOANTERIOR'
          DataSource = DataOcorrencias
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object cxSplitter3: TcxSplitter
        Left = 339
        Top = 15
        Width = 8
        Height = 160
        HotZoneClassName = 'TcxMediaPlayer9Style'
        AlignSplitter = salRight
        Control = GroupBox4
      end
    end
    object cxSplitter1: TcxSplitter
      Left = 1
      Top = 299
      Width = 636
      Height = 8
      HotZoneClassName = 'TcxMediaPlayer9Style'
      AlignSplitter = salBottom
      Control = GroupBox3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 919
    Height = 62
    Align = alTop
    TabOrder = 2
    object GroupBox7: TGroupBox
      Left = 1
      Top = 1
      Width = 288
      Height = 60
      Align = alLeft
      Caption = ' Per'#237'odo '
      TabOrder = 0
      object Label1: TLabel
        Left = 131
        Top = 25
        Width = 16
        Height = 13
        Caption = 'at'#233
      end
      object edtDataIni: TcxDateEdit
        Left = 3
        Top = 21
        TabOrder = 0
        Width = 121
      end
      object edtDataFin: TcxDateEdit
        Left = 154
        Top = 21
        TabOrder = 1
        Width = 121
      end
    end
    object Atualizar: TBitBtn
      Left = 295
      Top = 18
      Width = 95
      Height = 32
      Caption = 'Atualizar'
      DoubleBuffered = True
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000220B0000220B00000001000000010000009C0000089C
        0800109C0800109C100031A5210039A5210039A5290031AD290039AD290039AD
        3100EFA5390039AD390039B539006BB542006BB54A00EFA55200FFB552008484
        5A0094BD5A0073C66300E7AD6B00F7BD6B0073C66B00AD7B7300AD847300B584
        7300A5C67300AD7B7B009C847B00A5847B00AD847B00B58C7B00C6C67B007BCE
        7B00B5848400BD848400B58C8400BD8C8400BD948400C6948400C69C8400DEA5
        8400E7B58400CE9C8C00CEA58C00D6A58C00DEAD8C00EFC68C00F7C68C00BDCE
        8C00C6CE8C00B5AD9400E7CE9400EFCE9400B5AD9C00EFCE9C00F7CE9C00CED6
        9C00F7D69C009CDE9C00BDB5A500DEC6A500EFCEA500ADD6A500E7D6A500F7D6
        A500CEBDAD00D6C6AD00C6D6AD00E7D6AD00EFD6AD00F7D6AD00F7D6B500CEDE
        B500EFDEB500F7DEB500CEDEBD00EFDEBD00F7DEBD00E7CEC600E7DEC600EFDE
        C600F7DEC600EFE7C600F7E7C600FFE7C600E7D6CE00F7DECE00EFE7CE00F7E7
        CE00FFE7CE00CEEFCE00D6EFCE00E7D6D600F7E7D600FFE7D600EFEFD600FFEF
        D600EFDEDE00F7E7DE00EFEFDE00F7EFDE00FFEFDE00F7EFE700FFEFE700FFF7
        E700F7EFEF00FFF7EF00FFF7F700F7FFF700FFFFF700FF00FF00FFFFFF00FFFF
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
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006F6F6F1B2222
        222222222222222222222222222222226F6F6F6F6F1B51544E4B484641373735
        353535353535351F6F6F6F6F6F1B5154524E3140403E3737353535353535351F
        6F6F6F6F6F1B575952523900400E06060E2034353535351F6F6F6F6F6F1B585E
        59524A0003000000000012343535351F6F6F6F6F6F1B5E655E594D0000000000
        000000203535351F6F6F6F6F6F1E63655E59500000000932320E00063535351F
        6F6F6F6F6F1E6767655E53000000044540401A023735351F6F6F6F6F6F1F676B
        67655800000000004546463E2137351F6F6F6F6F6F246A6B6767585850504D4A
        454846462137351F6F6F6F6F6F256C6E6B2167655E53504D4A454540463E371F
        6F6F6F6F6F266C706C216767655800000000004546463E1F6F6F6F6F6F276C70
        706C033F605858070000004548463E1F6F6F6F6F6F286C7070700B001649490B
        0000004A4E48461F6F6F6F6F6F286C7070705B00000000000000004D4E4D3D1C
        6F6F6F6F6F2B6C7070706D3B00000000000300504D42331C6F6F6F6F6F2C6C70
        7070706D5B160B0B13580044423C361C6F6F6F6F6F2D6C707070707070706C6B
        69501811171717186F6F6F6F6F2E6C707070707070706E6C6B4F192A140F0A22
        6F6F6F6F6F2E6C7070707070707070706E4F192F1510226F6F6F6F6F6F2E6C70
        70707070707070707056192F15226F6F6F6F6F6F6F2E70707070707070707070
        705D192F226F6F6F6F6F6F6F6F2929292929292929292929292919226F6F6F6F
        6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F6F}
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = AtualizarClick
    end
  end
  object DataUsuario: TDataSource
    DataSet = CdsUsuario
    Left = 48
    Top = 136
  end
  object DataOcorrencias: TDataSource
    DataSet = CdsOcorrencias
    Left = 288
    Top = 152
  end
  object CdsUsuario: TpFIBClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsUsuarioAfterScroll
    Left = 48
    Top = 208
  end
  object CdsOcorrencias: TpFIBClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 152
  end
end
