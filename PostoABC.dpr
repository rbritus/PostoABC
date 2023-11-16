program PostoABC;

uses
  Vcl.Forms,
  View.Principal in 'Views\View.Principal.pas' {ViewPrincipal},
  Attributes.Entidades in 'Attributes\Attributes.Entidades.pas',
  Conexao.unConection in 'Connection\Conexao.unConection.pas',
  Conexao.MySql in 'Connection\Conexao.MySql.pas',
  Conexao.SqLite in 'Connection\Conexao.SqLite.pas',
  Excecao.AccessViolation in 'Exceptions\Excecao.AccessViolation.pas',
  Excecao.ConvercaoDeTipos in 'Exceptions\Excecao.ConvercaoDeTipos.pas',
  Excecao.DataBase in 'Exceptions\Excecao.DataBase.pas',
  Excecao.DBX in 'Exceptions\Excecao.DBX.pas',
  Excecao.Generic in 'Exceptions\Excecao.Generic.pas',
  Excecao.InterfaceParse in 'Exceptions\Excecao.InterfaceParse.pas',
  Excecao.MensagemPadrao in 'Exceptions\Excecao.MensagemPadrao.pas',
  Utils.Entidade in 'Utils\Utils.Entidade.pas',
  Utils.Enumerators in 'Utils\Utils.Enumerators.pas',
  Utils.Messages in 'Utils\Utils.Messages.pas',
  Utils.Serialize in 'Utils\Utils.Serialize.pas',
  Wrapper.Exception in 'Wrappers\Wrapper.Exception.pas',
  Entidade.Padrao in 'Entidades\Entidade.Padrao.pas',
  Components.ToastMessage in 'Components\Components.ToastMessage.pas',
  Entidade.Tanque in 'Entidades\Entidade.Tanque.pas',
  Attributes.Enumerators in 'Attributes\Attributes.Enumerators.pas',
  Entidade.Bomba in 'Entidades\Entidade.Bomba.pas',
  Entidade.Imposto in 'Entidades\Entidade.Imposto.pas',
  Entidade.Abastecimento in 'Entidades\Entidade.Abastecimento.pas',
  DAO.Generico in 'DAO\DAO.Generico.pas',
  Helper.Attributes in 'Helpers\Helper.Attributes.pas',
  Conexao.Firebird in 'Connection\Conexao.Firebird.pas',
  Builder.Imposto in 'Builders\Builder.Imposto.pas',
  Builder.Tanque in 'Builders\Builder.Tanque.pas',
  Builder.Bomba in 'Builders\Builder.Bomba.pas',
  Builder.Abastecimento in 'Builders\Builder.Abastecimento.pas',
  View.Padrao in 'Views\View.Padrao.pas' {ViewPadrao},
  Controller.Views in 'Controllers\Controller.Views.pas',
  View.Cadastro.Aliquota in 'Views\View.Cadastro.Aliquota.pas' {ViewCadastroAliquota},
  Controller.Entidades in 'Controllers\Controller.Entidades.pas',
  Utils.Form in 'Utils\Utils.Form.pas',
  View.Padrao.Cadastro in 'Views\View.Padrao.Cadastro.pas' {ViewPadraoCadastro},
  View.Cadastro.Tanque in 'Views\View.Cadastro.Tanque.pas' {ViewCadastroTanque},
  View.Consulta.Generica in 'Views\View.Consulta.Generica.pas' {ViewConsultaGenerica},
  Frame.Padrao in 'Frames\Frame.Padrao.pas' {FramePadrao: TFrame},
  Frame.Filtro.Pesquisa in 'Frames\Frame.Filtro.Pesquisa.pas' {FrameFiltroPesquisa: TFrame},
  Controller.Frame.FiltroGride in 'Controllers\Controller.Frame.FiltroGride.pas',
  Utils.Constants in 'Utils\Utils.Constants.pas',
  Utils.Validacoes in 'Utils\Utils.Validacoes.pas',
  Interfaces.Controller.Frame.FiltroGride in 'Interfaces\Interfaces.Controller.Frame.FiltroGride.pas',
  View.Cadastro.Bomba in 'Views\View.Cadastro.Bomba.pas' {ViewCadastroBomba},
  View.Cadastro.Abastecimento in 'Views\View.Cadastro.Abastecimento.pas' {ViewCadastroAbastecimento},
  Repository.Abastecimento in 'Repository\Repository.Abastecimento.pas',
  Core.Tanque in 'Cores\Core.Tanque.pas',
  Interfaces.Core in 'Interfaces\Interfaces.Core.pas',
  Core.Bomba in 'Cores\Core.Bomba.pas',
  Core.Abastecimento in 'Cores\Core.Abastecimento.pas',
  View.Relatorio.Abastecimentos in 'Views\View.Relatorio.Abastecimentos.pas' {ViewRelatorioAbastecimentos},
  Report.Abastecimento in 'Reports\Report.Abastecimento.pas' {ReportAbastecimento},
  DataModule.Abastecimento in 'Reports\DataModule.Abastecimento.pas' {DMAbastecimento: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TViewPrincipal, ViewPrincipal);
  Application.Run;
end.
