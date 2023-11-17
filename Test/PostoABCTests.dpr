program PostoABCTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  TestCoreTanque in 'UnitTestes\TestCoreTanque.pas',
  Core.Tanque in '..\Cores\Core.Tanque.pas',
  TestCoreBomba in 'UnitTestes\TestCoreBomba.pas',
  Core.Bomba in '..\Cores\Core.Bomba.pas',
  Script.CriacaoTabelas in 'Classes\Script.CriacaoTabelas.pas',
  Script.ExclusaoTabelas in 'Classes\Script.ExclusaoTabelas.pas',
  TestCoreAbastecimento in 'UnitTestes\TestCoreAbastecimento.pas',
  Core.Abastecimento in '..\Cores\Core.Abastecimento.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

