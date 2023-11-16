unit Report.Abastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  TReportAbastecimento = class(TForm)
    RelatorioAbastecimento: TRLReport;
    RLBand1: TRLBand;
    lblPeriodoPesquisa: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLBand2: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLPanel1: TRLPanel;
    RLLabel1: TRLLabel;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText8: TRLDBText;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
  private
    { Private declarations }
  public
    class function New: TReportAbastecimento;
    function SetParametrosData(ADataInicial, ADataFinal: TDate): TReportAbastecimento;
  end;

implementation

uses
  DataModule.Abastecimento;

{$R *.dfm}

{ TReportAbastecimento }

class function TReportAbastecimento.New: TReportAbastecimento;
begin
  Result := Self.Create(nil);
end;

function TReportAbastecimento.SetParametrosData(ADataInicial,
  ADataFinal: TDate): TReportAbastecimento;
const MSG_PERIODO = 'Período de: %s a %s';
begin
  Result := Self;
  lblPeriodoPesquisa.Caption := Format(MSG_PERIODO,[DateToStr(ADataInicial),DateToStr(ADataFinal)]);
end;

end.
