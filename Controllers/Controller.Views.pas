unit Controller.Views;

interface

uses
  System.Classes, Vcl.Forms, System.Generics.Collections, Vcl.Controls;


type
  TControllerView = class
  private
    FParent: TWinControl;
    ListaForm: TDictionary<TComponentClass, TForm>;
    procedure CentralizarForm(AForm: TForm);
    function CarregarForm(Value: TComponentClass): TForm;
    procedure AdicionarFormNalista(Value: TComponentClass; var AForm: TForm);
  public
    procedure SetParentForm(AParent: TWinControl);
    procedure ShowForm(Value: TComponentClass);
    constructor Create;
    destructor Destroy; override;
  end;

var
  ControllerView : TControllerView;

implementation

uses
  System.SysUtils;

{ TControllerView }

destructor TControllerView.Destroy;
begin
  FreeAndNil(ListaForm);
  inherited;
end;

constructor TControllerView.Create;
begin
  ListaForm := TDictionary<TComponentClass, TForm>.Create;
  FParent := nil;
end;

procedure TControllerView.AdicionarFormNalista(Value: TComponentClass; var AForm: TForm);
begin
  if not ListaForm.TryGetValue(Value, AForm) then
  begin
    Application.CreateForm(Value, AForm);
    if Assigned(FParent) then
    begin
      AForm.Parent := FParent;
      CentralizarForm(AForm);
    end;
    ListaForm.Add(Value, AForm);
  end;
end;

function TControllerView.CarregarForm(Value: TComponentClass): TForm;
var
  AForm: TForm;
begin
  AdicionarFormNalista(Value,AForm);
  Result := AForm;
end;

procedure TControllerView.CentralizarForm(AForm: TForm);
begin
  AForm.Top := AForm.Top + FParent.Top + Trunc((FParent.Height - AForm.Height) / 2);
  AForm.Left := AForm.Left + FParent.Left + Trunc((FParent.Width - AForm.Width) / 2);
end;

procedure TControllerView.SetParentForm(AParent: TWinControl);
begin
  FParent := AParent;
end;

procedure TControllerView.ShowForm(Value: TComponentClass);
begin
  var Form := CarregarForm(Value);
  Form.Show;
end;

initialization
  ControllerView := TControllerView.Create;

finalization
  ControllerView.Free;

end.
