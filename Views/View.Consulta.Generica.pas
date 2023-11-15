unit View.Consulta.Generica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Padrao, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.ExtCtrls, Frame.Padrao, Frame.Filtro.Pesquisa, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TViewConsultaGenerica = class(TViewPadrao)
    btnSelecionar: TButton;
    FrameFiltroPesquisa1: TFrameFiltroPesquisa;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure btnSelecionarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    FDataSet: TDataSet;
    FSelecionado: Boolean;
  public
    class function New: TViewConsultaGenerica;
    function InformarCaption(ACaption: string): TViewConsultaGenerica;
    function SetDataSetPesquisa(ADataSet: TDataSet): TViewConsultaGenerica;
    function ShowConsulta: Boolean;
  end;

var
  ViewConsultaGenerica: TViewConsultaGenerica;

implementation

uses
  Utils.Form;

{$R *.dfm}

{ TViewConsultaGenerica }

procedure TViewConsultaGenerica.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  if DataSource1.DataSet.IsEmpty then
    Exit;

  FSelecionado := True;
  Close;
end;

procedure TViewConsultaGenerica.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if DataSource1.DataSet.IsEmpty then
    Exit;

  FSelecionado := True;
  Close;
end;

procedure TViewConsultaGenerica.FormCreate(Sender: TObject);
begin
  inherited;
  FSelecionado := False;
  FrameFiltroPesquisa1.SetDbGrid(DBGrid1);
end;

function TViewConsultaGenerica.InformarCaption(ACaption: string): TViewConsultaGenerica;
begin
  Result := Self;
  Self.Caption := ACaption;
end;

class function TViewConsultaGenerica.New: TViewConsultaGenerica;
begin
  Result := TViewConsultaGenerica.Create(Application.MainForm)
end;

function TViewConsultaGenerica.SetDataSetPesquisa(ADataSet: TDataSet): TViewConsultaGenerica;
begin
  Result := Self;
  FDataSet := ADataSet;
  DataSource1.DataSet := FDataSet;
  TUtilsForm.AjustarColunasDBGrid(DBGrid1);
end;

function TViewConsultaGenerica.ShowConsulta: Boolean;
begin
  Self.ShowModal;
  Result := FSelecionado;
end;

end.
