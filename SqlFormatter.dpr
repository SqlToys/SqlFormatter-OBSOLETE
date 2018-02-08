program SqlFormatter;

uses
  Forms,
  Vcl.Themes,
  Vcl.Styles,
  GtStandard in '..\SqlFormat\GtStandard.pas',
  GtExternals in '..\SqlFormat\GtExternals.pas',
  GtContainers in '..\SqlFormat\GtContainers.pas',
  SqlStructs in '..\SqlFormat\SqlStructs.pas',
  SqlCommon in '..\SqlFormat\SqlCommon.pas',
  SqlTokenizers in '..\SqlFormat\SqlTokenizers.pas',
  SqlParser in '..\SqlFormat\SqlParser.pas',
  SqlLister in '..\SqlFormat\SqlLister.pas',
  SqlConverters in 'SqlConverters.pas',
  SqlTest0 in '..\SqlFormat\SqlTest0.pas',
  SqlXmlTree in '..\SqlFormat\SqlXmlTree.pas',
  GtRegistry in '..\SqlFormat\GtRegistry.pas',
  GtVisual in 'GtVisual.pas',
  FormAbout in 'FormAbout.pas' {FormAboutYetAnother},
  FormFind in 'FormFind.pas' {FormFindReplace},
  FormSettings in 'FormSettings.pas' {FormSettings},
  FormColors in 'FormColors.pas' {FormColors},
  FrameScriptEdit in 'FrameScriptEdit.pas' {FrameScriptEdit: TFrame},
  FormFormatter in 'FormFormatter.pas' {MainForm},
  SqlVersion in '..\SqlFormat\SqlVersion.pas';

{$R *.res}

begin
  VER_NAME := 'SQL Formatter';

  Application.Initialize;
  Application.Title := VER_NAME;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
