unit uCad_Contratos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCad_CadastroPaiERP, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, ComCtrls, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, DB, DBClient,
  pFIBClientDataSet, ActnList, cxPC, cxContainer, cxEdit, cxTreeView, Buttons,
  ExtCtrls, DBCtrls, LabelDBEdit, StdCtrls, Mask, EditPesquisa, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxDBData, cxMemo, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid;

type
  TfrmCad_Contrato = class(TfrmCad_CadastroPaiERP)
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    edtEmpresa: TEditPesquisa;
    LabelDBEdit1: TLabelDBEdit;
    edtCliente: TEditPesquisa;
    edtPeriodoVigenciaContrato: TEditPesquisa;
    edtPeriodoVisitaContrato: TEditPesquisa;
    cxDBDateEdit2: TcxDBDateEdit;
    DBCheckBox1: TDBCheckBox;
    edtTipoContrato: TEditPesquisa;
    edtCondPagamento: TEditPesquisa;
    pageOpcoes: TcxPageControl;
    tsProduto: TcxTabSheet;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    cxGrid1: TcxGrid;
    tvItens: TcxGridDBTableView;
    tvItensColumn1: TcxGridDBColumn;
    tvItensColumn2: TcxGridDBColumn;
    tvItensColumn3: TcxGridDBColumn;
    tvItensColumn4: TcxGridDBColumn;
    tvItensColumn5: TcxGridDBColumn;
    tvItensColumn6: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    tsObs: TcxTabSheet;
    cxDBMemo1: TcxDBMemo;
    cxTabSheet1: TcxTabSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCad_Contrato: TfrmCad_Contrato;

implementation

{$R *.dfm}

end.
