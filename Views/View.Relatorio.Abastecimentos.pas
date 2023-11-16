unit View.Relatorio.Abastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Padrao, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TViewRelatorioAbastecimentos = class(TViewPadrao)
    btnImprimir: TButton;
    Label2: TLabel;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    Label1: TLabel;
    procedure Panel3Resize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewRelatorioAbastecimentos: TViewRelatorioAbastecimentos;

implementation

uses
  Utils.Form,
  Utils.Constants;

{$R *.dfm}

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
