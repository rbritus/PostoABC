unit View.Relatorio.Abastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Padrao, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask, Data.DB;

type
  TViewRelatorioAbastecimentos = class(TViewPadrao)
    btnImprimir: TButton;
    Label2: TLabel;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    Label1: TLabel;
    procedure Panel3Resize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
  private
    procedure Validacao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewRelatorioAbastecimentos: TViewRelatorioAbastecimentos;

implementation

uses
  Utils.Form,
  Utils.Constants,
  Utils.Messages,
  DataModule.Abastecimento,
  Report.Abastecimento;

{$R *.dfm}

procedure TViewRelatorioAbastecimentos.Validacao;
begin
  if (StrToDateDef(edtDataInicial.Text,0) = TConstantsDataHora.DATAHORA_VAZIA) or
     (StrToDateDef(edtDataFinal.Text,0) = TConstantsDataHora.DATAHORA_VAZIA) then
    TUtilsMessages.ShowMessageExcept('Datas não preenchidas.');

  if StrToDate(edtDataInicial.Text) > StrToDate(edtDataFinal.Text) then
    TUtilsMessages.ShowMessageExcept('Data inicial não pode ser menor que data final.');
end;

procedure TViewRelatorioAbastecimentos.btnImprimirClick(Sender: TObject);
begin
  inherited;
  Validacao;

  TDMAbastecimento.New.AbrirQryAbastecimentoEntreDatas(StrToDate(edtDataInicial.Text),
    StrToDate(edtDataFinal.Text));

  var lReport := TReportAbastecimento.New;
  try
    lReport.SetParametrosData(StrToDate(edtDataInicial.Text),StrToDate(edtDataFinal.Text))
      .RelatorioAbastecimento
        .Preview();
  finally
    lReport.DisposeOf;
  end;
end;

procedure TViewRelatorioAbastecimentos.FormShow(Sender: TObject);
begin
  inherited;
  edtDataInicial.EditMask := TConstantsMasks.DATA_COMPLETA;
  edtDataFinal.EditMask := TConstantsMasks.DATA_COMPLETA;
  edtDataInicial.SetFocus;
end;

procedure TViewRelatorioAbastecimentos.Panel3Resize(Sender: TObject);
begin
  inherited;
  TUtilsForm.CentralizarComponenteHorinzontal(btnImprimir);
end;

end.
