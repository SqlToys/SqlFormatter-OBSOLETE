program SqlFormatter;

uses
  Forms,
  Vcl.Themes,
  Vcl.Styles,
  SqlVersion in '..\SqlVersion.pas',
  GtContainers in '..\SqlParser\GtContainers.pas',
  GtExtUnit in '..\SqlParser\GtExtUnit.pas',
  GtStandard in '..\SqlParser\GtStandard.pas',
  SqlStructs in '..\SqlParser\SqlStructs.pas',
  SqlTokenizers in '..\SqlParser\SqlTokenizers.pas',
  SqlParser in '..\SqlParser\SqlParser.pas',
  SqlTest0 in '..\SqlParser\SqlTest0.pas',
  SqlXmlTree in '..\SqlXmlTree\SqlXmlTree.pas',
  SqlCommon in '..\SqlFormat\SqlCommon.pas',
  SqlConverters in 'SqlConverters.pas',
  SqlLister in '..\SqlFormat\SqlLister.pas',
  GtRegistry in '..\SqlFormat\GtRegistry.pas',
  GtVisual in 'GtVisual.pas',
  FrameScriptEdit in 'FrameScriptEdit.pas' {FrameScriptEdit: TFrame},
  FormAbout in 'FormAbout.pas' {FormAboutYetAnother},
  FormColors in 'FormColors.pas' {FormColors},
  FormFind in 'FormFind.pas' {FormFindReplace},
  FormSettings in 'FormSettings.pas' {FormSettings},
  FormFormatter in 'FormFormatter.pas' {MainForm};

{$R *.res}

begin
  VER_NAME := 'SQL Formatter';

  Application.Initialize;
  Application.Title := VER_NAME;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
