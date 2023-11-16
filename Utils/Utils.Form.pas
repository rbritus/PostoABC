unit Utils.Form;

interface

uses
  System.Classes, Vcl.Mask, System.SysUtils, Vcl.DBGrids, Vcl.Graphics,
  Vcl.Controls;

type
  TUtilsForm = class
    class procedure AjustarColunasDBGrid(ADBGrid: TDBGrid); static;
    class procedure CentralizarComponenteVertical(AComponente: TWinControl); static;
    class procedure CentralizarComponenteHorinzontal(AComponente: TWinControl); static;
  end;

implementation

uses
  Data.DB, Winapi.Windows, Vcl.Forms;

{ TUtilsForm }

class procedure TUtilsForm.AjustarColunasDBGrid(ADBGrid: TDBGrid);
var
  TotalColumnWidth, ColumnCount, GridClientWidth, Filler, i: Integer;
begin
  ColumnCount := ADBGrid.Columns.Count;
  if ColumnCount = 0 then
    Exit;

  TotalColumnWidth := 0;
  for i := 0 to ColumnCount - 1 do
    TotalColumnWidth := TotalColumnWidth + ADBGrid.Columns[i].Width;
  if dgColLines in ADBGrid.Options then
    TotalColumnWidth := TotalColumnWidth + ColumnCount;

  GridClientWidth := ADBGrid.Width - GetSystemMetrics(SM_CXVSCROLL);
  if dgIndicator in ADBGrid.Options then
  begin
    GridClientWidth := GridClientWidth - IndicatorWidth;
    if dgColLines in ADBGrid.Options then
      Dec(GridClientWidth);
  end;
  if ADBGrid.BorderStyle = bsSingle then
  begin
    if ADBGrid.Ctl3D then
      GridClientWidth := GridClientWidth - 4
    else
      GridClientWidth := GridClientWidth - 2;
  end;

  if TotalColumnWidth < GridClientWidth then
  begin
    Filler := (GridClientWidth - TotalColumnWidth) div ColumnCount;
    for i := 0 to ColumnCount - 1 do
      ADBGrid.Columns[i].Width := ADBGrid.Columns[i].Width + Filler;
  end
  else if TotalColumnWidth > GridClientWidth then
  begin
    Filler := (TotalColumnWidth - GridClientWidth) div ColumnCount;
    if (TotalColumnWidth - GridClientWidth) mod ColumnCount <> 0 then
      Inc(Filler);
    for i := 0 to ColumnCount - 1 do
      ADBGrid.Columns[i].Width := ADBGrid.Columns[i].Width - Filler;
  end;
end;

class procedure TUtilsForm.CentralizarComponenteHorinzontal(AComponente: TWinControl);
begin
  AComponente.Left:= (AComponente.Parent.ClientWidth - AComponente.Width) div 2;
end;

class procedure TUtilsForm.CentralizarComponenteVertical(AComponente: TWinControl);
begin
  AComponente.Top:= (AComponente.Parent.ClientHeight - AComponente.Height ) div 2;
end;

end.
