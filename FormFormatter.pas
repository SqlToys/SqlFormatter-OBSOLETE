(* $Header: /SQL Toys/SqlFormatter/FormFormatter.pas 60    18-01-14 8:09 Tomek $
   (c) Tomasz Gierka, github.com/SqlToys, 2011.07.24                          *)
{--------------------------------------  --------------------------------------}
{$IFDEF RELEASE}
  {$DEBUGINFO OFF}
  {$LOCALSYMBOLS OFF}
{$ENDIF}
unit FormFormatter;

interface

uses Forms, ActnList, Menus, ComCtrls, Controls, ExtCtrls, Classes, Messages,
     System.Actions,
     Vcl.Ribbon, Vcl.ToolWin, Vcl.ImgList,
     Vcl.ActnMenus, Vcl.RibbonActnMenus, Vcl.StdActns,Vcl.ActnMan, Vcl.ActnCtrls,
     Vcl.RibbonLunaStyleActnCtrls, Vcl.PlatformDefaultStyleActnCtrls,
     SqlStructs,
     FrameScriptEdit, Vcl.RibbonObsidianStyleActnCtrls, Vcl.RibbonSilverStyleActnCtrls;

type
  TMainForm = class(TForm)
    ActionList: TActionList;
    actViewFontSizeUp: TAction;
    actViewFontSizeDown: TAction;

    FrameScriptEdit: TFrameScriptEdit;
    StatusBar: TStatusBar;
    TimerMain: TTimer;
    ActionManager: TActionManager;
    actMenuMinimize: TAction;

    actFilesNew: TAction;
    actFilesOpen: TAction;
    actFilesSave: TAction;
    actFilesSaveAs: TAction;
    actFilesExit: TAction;

    actEditPaste: TAction;
    actEditCut: TAction;
    actEditCopy: TAction;

    actEditFindReplace: TAction;

    actToolsFormat: TAction;
    actToolsCompact: TAction;
    actToolsQuoteToDelphi: TAction;
    actToolsQuoteFromDelphi: TAction;

    actHighlightQuery: TAction;
    actHighlightPrevQuery: TAction;
    actHighlightNextQuery: TAction;

    actToolsSettings: TAction;
    actToolsColors: TAction;
    actToolsFont: TAction;
    actToolsFullScreen: TAction;

    actHelpAbout: TAction;
    actHelpTest: TAction;

    ImageList16: TImageList;
    ImageList32: TImageList;
    ImageList16disabled: TImageList;
    ImageList32disabled: TImageList;

    Ribbon: TRibbon;
    RibbonQuickAccessToolbar1: TRibbonQuickAccessToolbar;
    RibbonApplicationMenuBar1: TRibbonApplicationMenuBar;

    RibbonPageGeneral: TRibbonPage;
    RibbonGroupClipboard: TRibbonGroup;
    RibbonGroupFindReplace: TRibbonGroup;
    RibbonGroupFormat: TRibbonGroup;
    RibbonGroupHighlight: TRibbonGroup;
    RibbonGroupPreferences: TRibbonGroup;
    RibbonGroupAbout: TRibbonGroup;

    RibbonPageConverters: TRibbonPage;
    actConvertExprAliasAddKeywordAs: TAction;
    actConvertExprAliasRemoveKeywordAs: TAction;

    RibbonGroupConvertTableAlias: TRibbonGroup;
    actConvertTableAliasAddKeywordAs: TAction;
    actConvertTableAliasRemoveKeywordAs: TAction;

    RibbonGroupConvertSortOrder: TRibbonGroup;
    actConvertSortOrderShortKeywords: TAction;
    actConvertSortOrderLongKeywords: TAction;
    actConvertSortOrderAddDefaultKeywords: TAction;
    actConvertSortOrderRemoveDefaultKeywords: TAction;

    RibbonGroupConvertDatatype: TRibbonGroup;
    actConvertDatatypeIntToInteger: TAction;
    actConvertDatatypeIntegerToInt: TAction;

    RibbonGroupConvertJoins: TRibbonGroup;
    actConvertJoinsAddInner: TAction;
    actConvertJoinsRemoveInner: TAction;
    actConvertJoinsAddOuter: TAction;
    actConvertJoinsRemoveOuter: TAction;
    actConvertReset: TAction;
    actConvertCaseKeywordUpper: TAction;
    actConvertCaseKeywordLower: TAction;
    RibbonGroupConvertExprAlias: TRibbonGroup;
    actConvertCaseTableLower: TAction;
    RibbonGroupConvertTableCase: TRibbonGroup;
    actConvertCaseTableUpper: TAction;
    actConvertCaseColumnUpper: TAction;
    actConvertCaseColumnLower: TAction;
    RibbonGroupConvertColumnCase: TRibbonGroup;
    RibbonGroupConvertTabAliasCase: TRibbonGroup;
    actConvertCaseTabAliasUpper: TAction;
    actConvertCaseTabAliasLower: TAction;
    RibbonGroupConvertColAliasCase: TRibbonGroup;
    actConvertCaseColAliasUpper: TAction;
    actConvertCaseColAliasLower: TAction;
    actConvertCaseParamLower: TAction;
    actConvertCaseParamUpper: TAction;
    RibbonGroupConvertParamCase: TRibbonGroup;
    RibbonGroupConvertFuncCase: TRibbonGroup;
    actConvertCaseFuncLower: TAction;
    actConvertCaseFuncUpper: TAction;
    actConvertCaseColQuoteAliasLower: TAction;
    actConvertCaseColQuoteAliasUpper: TAction;
    RibbonGroupConvertColQuotedAliasCase: TRibbonGroup;
    actConvertCaseIdentUpper: TAction;
    actConvertCaseIdentLower: TAction;
    RibbonGroupConvertIdentCase: TRibbonGroup;
    RibbonPageCase: TRibbonPage;
    actFilesExportXML: TAction;
    actFilesImportXml: TAction;
    RibbonPageOthers: TRibbonPage;
    actConvertJoinCondRefToLeft: TAction;
    RibbonGroupConvertJoinsCond: TRibbonGroup;

    { form & control events }
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;

    procedure actViewFontSizeUpExecute(Sender: TObject);
    procedure actViewFontSizeDownExecute(Sender: TObject);

    procedure TimerMainTimer(Sender: TObject);

    procedure ActionManagerUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure actMenuMinimizeExecute(Sender: TObject);

    procedure actToolsSettingsExecute(Sender: TObject);
    procedure actToolsColorsExecute(Sender: TObject);
    procedure actToolsFontExecute(Sender: TObject);
    procedure actViewFullScreenExecute(Sender: TObject);

    procedure actHelpAboutExecute(Sender: TObject);
    procedure actHelpTestExecute(Sender: TObject);

    procedure RibbonRecentItemClick(Sender: TObject; FileName: string; Index: Integer);

    procedure actToolsQuoteToDelphiExecute(Sender: TObject);
    procedure actToolsQuoteFromDelphiExecute(Sender: TObject);

    procedure actConvertExprAliasAddKeywordAsExecute(Sender: TObject);
    procedure actConvertExprAliasRemoveKeywordAsExecute(Sender: TObject);
    procedure actConvertTableAliasAddKeywordAsExecute(Sender: TObject);
    procedure actConvertTableAliasRemoveKeywordAsExecute(Sender: TObject);
    procedure actConvertSortOrderShortKeywordsExecute(Sender: TObject);
    procedure actConvertSortOrderLongKeywordsExecute(Sender: TObject);
    procedure actConvertSortOrderAddDefaultKeywordsExecute(Sender: TObject);
    procedure actConvertSortOrderRemoveDefaultKeywordsExecute(Sender: TObject);
    procedure actConvertDatatypeIntegerToIntExecute(Sender: TObject);
    procedure actConvertDatatypeIntToIntegerExecute(Sender: TObject);

    procedure actConvertJoinsAddInnerExecute(Sender: TObject);
    procedure actConvertJoinsRemoveInnerExecute(Sender: TObject);
    procedure actConvertJoinsAddOuterExecute(Sender: TObject);
    procedure actConvertJoinsRemoveOuterExecute(Sender: TObject);
    procedure actConvertResetExecute(Sender: TObject);
    procedure actConvertCaseKeywordUpperExecute(Sender: TObject);
    procedure actConvertCaseKeywordLowerExecute(Sender: TObject);
    procedure actConvertCaseTableLowerExecute(Sender: TObject);
    procedure actConvertCaseTableUpperExecute(Sender: TObject);
    procedure actConvertCaseColumnUpperExecute(Sender: TObject);
    procedure actConvertCaseColumnLowerExecute(Sender: TObject);
    procedure actConvertCaseTabAliasUpperExecute(Sender: TObject);
    procedure actConvertCaseTabAliasLowerExecute(Sender: TObject);
    procedure actConvertCaseColAliasLowerExecute(Sender: TObject);
    procedure actConvertCaseColAliasUpperExecute(Sender: TObject);
    procedure actConvertCaseParamUpperExecute(Sender: TObject);
    procedure actConvertCaseParamLowerExecute(Sender: TObject);
    procedure actConvertCaseFuncUpperExecute(Sender: TObject);
    procedure actConvertCaseFuncLowerExecute(Sender: TObject);
    procedure actConvertCaseColQuoteAliasLowerExecute(Sender: TObject);
    procedure actConvertCaseColQuoteAliasUpperExecute(Sender: TObject);
    procedure actConvertCaseIdentUpperExecute(Sender: TObject);
    procedure actConvertCaseIdentLowerExecute(Sender: TObject);
    procedure actConvertJoinCondRefToLeftExecute(Sender: TObject);
  public
    Before_FullScreen_State: TWindowState;
    Before_FullScreen_Top,   Before_FullScreen_Left,
    Before_FullScreen_Width, Before_FullScreen_Height: Integer;

    { internal methods }
    procedure SetVisibleControls;
    procedure Ribbon_RecentFiles_BuildMenu;
    procedure Ribbon_Minimize_Width;
    procedure Ribbon_Maximize_Width;
  end;

var
  MainForm: TMainForm;

implementation

uses Windows, ShellApi, Graphics, SysUtils, Dialogs,
     GtStandard, GtVisual, GtRegistry, SqlTokenizers, GtExtUnit,
     {$IFDEF DEBUG} SqlTest0, {$ENDIF}
     SqlCommon, SqlLister, SqlConverters, SqlVersion,
     FormSettings, FormColors, FormAbout;

{$R *.dfm}

const
  sb_position   = 0;
  sb_keystate   = 1;
  sb_memory     = 2;
  sb_connection = 3;
  sb_log        = 4;

{ Form Create Event }
procedure TMainForm.FormCreate(Sender: TObject);
var lModified: Boolean;
begin
  FrameScriptEdit.FrameCreate;

  Ribbon.Font.Size := 8;

  {$IFDEF RELEASE}
  actHelpTest.Visible := False;
//RibbonGroupAbout.Items[1].Visible := False;
  RibbonGroupAbout.Items.Delete(1);
  {$ELSE}
  actHelpTest.Visible := True;
  RibbonGroupAbout.Items[1].Visible := True;
  {$ENDIF}

  actFilesNew.OnExecute           := FrameScriptEdit.actFilesNewExecute;
  actFilesOpen.OnExecute          := FrameScriptEdit.actFilesOpenExecute;
  actFilesSave.OnExecute          := FrameScriptEdit.actFilesSaveExecute;
  actFilesSaveAs.OnExecute        := FrameScriptEdit.actFilesSaveAsExecute;
  actFilesExit.OnExecute          := FrameScriptEdit.actFilesExitExecute;
  actFilesExportXML.OnExecute     := FrameScriptEdit.actFilesExportXMLExecute;
  actFilesImportXML.OnExecute     := FrameScriptEdit.actFilesImportXMLExecute;

  actToolsFormat.OnExecute        := FrameScriptEdit.actToolsFormatExecute;
  actToolsCompact.OnExecute       := FrameScriptEdit.actToolsCompactExecute;

  actEditCopy.OnExecute           := FrameScriptEdit.actEditCopyExecute;
  actEditCut.OnExecute            := FrameScriptEdit.actEditCutExecute;
  actEditPaste.OnExecute          := FrameScriptEdit.actEditPasteExecute;

  actEditFindReplace.OnExecute    := FrameScriptEdit.actEditFindReplaceExecute;

  actHighlightQuery.OnExecute     := FrameScriptEdit.actEditHighlightQueryExecute;
  actHighlightPrevQuery.OnExecute := FrameScriptEdit.actEditPrevQueryExecute;
  actHighlightNextQuery.OnExecute := FrameScriptEdit.actEditNextQueryExecute;

  Caption := VER_CAPTION;
  Before_FullScreen_State := wsNormal;

  DragAcceptFiles(Handle, True);

  try
    FrameScriptEdit.ScriptEdit_LinesClear;
    if ParamCount > 0 then FrameScriptEdit.ScriptOpenFromFile( ParamStr(1) );
  finally
    FrameScriptEdit.ScriptTabToSpaces(FrameScriptEdit.ScriptEdit.Lines);
    FrameScriptEdit.ScriptEdit.Modified := False;
  end;

  Top    := YaRegistryGetInt(yastWindowTop,    Top);
  Left   := YaRegistryGetInt(yastWindowLeft,   Left);
  Height := YaRegistryGetInt(yastWindowHeight, Height);
  Width  := YaRegistryGetInt(yastWindowWidth,  Width);

  if YaRegistryGetBool(yastShowFullScreen)
    then actViewFullScreenExecute(Self)
    else SetVisibleControls;

  { restores font name and size }
  lModified := FrameScriptEdit.ScriptEdit.Modified;
  FrameScriptEdit.ScriptEdit.Font.Name      := YaRegistryGetStr(yastEditFontName);
  FrameScriptEdit.ScriptEdit.Font.Size      := YaRegistryGetInt(yastEditFontSize);
  FrameScriptEdit.ScriptEdit.Modified       := lModified;

  FrameScriptEdit.RecentFiles_ReadFromRegistry;
  FrameScriptEdit.OnRecentFiles_BuildMenu := Ribbon_RecentFiles_BuildMenu;
  Ribbon_RecentFiles_BuildMenu;

  { Merge Action List }
  ActionsMove(FrameScriptEdit.ActionList, ActionList);

  RichEditSetPosition(FrameScriptEdit.ScriptEdit, 0,0);
  Ribbon_Maximize_Width;

  Ribbon.Font.Height := -11;
  Ribbon.Font.Size   := 8;

  actConvertResetExecute(Sender);
end;

{ Form Destroy Event }
procedure TMainForm.FormDestroy(Sender: TObject);
begin
  DragAcceptFiles(Handle, False);
end;

{ Form Show Event }
procedure TMainForm.FormShow(Sender: TObject);
begin
  if FrameScriptEdit.ScriptEdit.Visible then FrameScriptEdit.ScriptEdit.SetFocus;
  Self.SetFocus;
end;

{ Form Close Event }
procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  { store file }
  if not FrameScriptEdit.ScriptCloseFile then begin
    Action := caNone;
    Exit;
  end;

  { stores recent files }
  FrameScriptEdit.RecentFiles_SaveToRegistry;

  { stores visible controls }
  YaRegistryPutBool(yastShowFullScreen, actToolsFullScreen.Checked, True);
  if actToolsFullScreen.Checked then begin
    YaRegistryPutInt(yastWindowState,   Ord(WindowState));
  end;

  { stores font name and size }
  YaRegistryPutInt(yastEditFontSize,  FrameScriptEdit.ScriptEdit.Font.Size);
  YaRegistryPutStr(yastEditFontName,  FrameScriptEdit.ScriptEdit.Font.Name);

  if WindowState = wsMinimized then Exit;

  YaRegistryPutInt(yastWindowState,   Ord(WindowState));

  if WindowState = wsNormal then begin
    YaRegistryPutInt(yastWindowTop,    Top);
    YaRegistryPutInt(yastWindowLeft,   Left);
    YaRegistryPutInt(yastWindowHeight, Height);
    YaRegistryPutInt(yastWindowWidth,  Width);
  end;
end;

{ Sets Visible Controls }
{ calls: FormShow ?? }
procedure TMainForm.SetVisibleControls;
begin
  { main window border and main menu }
  if actToolsFullScreen.Checked then begin
    BorderStyle := bsNone;
    // Menu := nil;
    Ribbon.Visible := False;
    GlassFrame.Enabled := False;
  end else begin
    BorderStyle := bsSizeable;
    // Menu := MainMenu;
    Ribbon.Visible := True;
    GlassFrame.Enabled := True;
  end;
end;

{ Ribbon, Recent Files }
procedure TMainForm.RibbonRecentItemClick(Sender: TObject; FileName: string; Index: Integer);
begin
  if not FrameScriptEdit.ScriptCloseFile then Exit; { silent recent menu rebuild }
  FrameScriptEdit.ScriptOpenFromFile( FileName );
  Ribbon_RecentFiles_BuildMenu;

  if FrameScriptEdit.ScriptEdit.Visible then FrameScriptEdit.ScriptEdit.SetFocus;
end;

{ Ribbon, Recent Files }
procedure TMainForm.Ribbon_RecentFiles_BuildMenu;
var i: Integer;
begin
  Ribbon.ClearRecentItems;

  for i := FrameScriptEdit.RecentFiles.Count - 1 downto 0 do
    Ribbon.AddRecentItem(FrameScriptEdit.RecentFiles[i]);
end;

{ message WM_DROPFILES, otwiera przeciagniêty plik w aplikacji }
procedure TMainForm.WMDropFiles;
begin
  inherited;

  FrameScriptEdit.WMDropFiles(Msg);
end;

{ Timer Event - refresh used memory, memo position and current scope }
procedure TMainForm.TimerMainTimer(Sender: TObject);
var KeyState : TKeyboardState;
begin
  { disable/enable action Save }
  FrameScriptEdit.actFilesSave.Enabled := FrameScriptEdit.ScriptEdit.Modified;

  { Script Memo position }
  StatusBar.Panels[sb_position].Text := FrameScriptEdit.ScriptEdit_CurrPositionToStr;

  { Status bar - CAPS LOCK, INSERT }
  GetKeyboardState(KeyState);
  StatusBar.Panels[sb_keystate].Text := strif(KeyState[VK_CAPITAL] = 1, 'CAPS') +
                                        strif(FrameScriptEdit.ScriptEditInsertMode, ' INS', ' OVR');

  { Status bar - Mem used }
  StatusBar.Panels[sb_memory].Text := 'Script: ' + GtFileOrMemSizeToStr(Length(FrameScriptEdit.ScriptEdit.Lines.Text), 0) +
                                    ', Memory: ' + GtFileOrMemSizeToStr(GtExtUnit.AllocMemSize) +
                                    ', nodes: '  + IntToStr(GtSqlNodeCount);

  { Status bar = Log }
  {$IFDEF DEBUG}
  StatusBar.Panels[sb_log].Text := StatusLogText;
  {$ENDIF}
end;

{ Tools: Quote from Delphi or Pascal }
procedure TMainForm.actToolsQuoteFromDelphiExecute(Sender: TObject);
var lSL: TStringList;
    i: Integer;
begin
  lSL := TStringList.Create;
  try
    for i := 0 to FrameScriptEdit.ScriptEdit.Lines.Count -1 do begin
      lSL.Add(  strBreakOnLast1( '''',
                strBreakOnFirst2( '''',
                StringReplace(
                FrameScriptEdit.ScriptEdit.Lines[i]
                , gttkApostrophe.Text + gttkApostrophe.Text, gttkApostrophe.Text, [rfReplaceAll])
                ) ) );
    end;

    FrameScriptEdit.ScriptEdit.SelectAll;
    FrameScriptEdit.ScriptEdit.SelText := lSL.Text;
  finally
    lSL.Free;
  end;
end;

{ Tools: Quote to Delphi or Pascal }
procedure TMainForm.actToolsQuoteToDelphiExecute(Sender: TObject);
var lSL: TStringList;
    i: Integer;
begin
  lSL := TStringList.Create;
  try
    lSL.Text := FrameScriptEdit.ScriptEdit.Lines.Text;

    { dla unitu testów }
//    for i := 0 to lSL.Count -1 do
//      lSL[i] := strif(i=0, '  TestQuery( ', '             ') +
//                gttkApostrophe.Text +
//                StringReplace(lSL[i], gttkApostrophe.Text, gttkApostrophe.Text + gttkApostrophe.Text, [rfReplaceAll]) +
//                gttkApostrophe.Text +
//                strif(i=lSL.Count-1, ' );', '#13#10 +');
//
//    if FrameScriptEdit.ScriptFileName <> '' then
//      lSL.Insert(0, '  { date: ' + DateToStr(GtFileDate(FrameScriptEdit.ScriptFileName)) +
//                    ', file: ' + ExtractFileName(FrameScriptEdit.ScriptFileName) + {'.' + ExtractFileExt(FrameScriptEdit.ScriptFileName) +} ' }' );

    { normalnie }
    for i := 0 to lSL.Count -1 do
      lSL[i] := gttkApostrophe.Text +
                StringReplace(lSL[i], gttkApostrophe.Text, gttkApostrophe.Text + gttkApostrophe.Text, [rfReplaceAll]) +
                gttkApostrophe.Text + strif(i=lSL.Count-1, ';', '#13#10 +');

    FrameScriptEdit.ScriptEdit.SelectAll;
    FrameScriptEdit.ScriptEdit.SelText := lSL.Text;
  finally
    lSL.Free;
  end;
end;

{ action View, Full Screen }
procedure TMainForm.actViewFullScreenExecute(Sender: TObject);
begin
  if not actToolsFullScreen.Checked then begin
    Before_FullScreen_State := WindowState;
    Before_FullScreen_Top   := Top;
    Before_FullScreen_Left  := Left;
    Before_FullScreen_Width := Width;
    Before_FullScreen_Height:= Height;
  end else begin
    Hide;
  end;

  actToolsFullScreen.Checked := not actToolsFullScreen.Checked;

  Hide;

  SetVisibleControls; // calls: FormShow ??

  if actToolsFullScreen.Checked then begin
    WindowState             := wsMaximized;
  end else begin
    WindowState             := Before_FullScreen_State;

    Top    := Before_FullScreen_Top;
    Left   := Before_FullScreen_Left;
    Width  := Before_FullScreen_Width;
    Height := Before_FullScreen_Height;

    WindowState             := Before_FullScreen_State; // XE7 transition ??
  end;

  // Hide i Show - zapobiegaja mruganiu formy przy przejsciu z/do FullScreen.
  Show;
end;

{ action View, Font Size Up }
procedure TMainForm.actViewFontSizeUpExecute(Sender: TObject);
var lModified: Boolean;
begin
  StatusLogStartTime;

  lModified := FrameScriptEdit.ScriptEdit.Modified;

  FontSizeUp(FrameScriptEdit.ScriptEdit.Font, YA_MAX_FONT_SIZE);

  FrameScriptEdit.actToolsListByTokensExecute(Sender);
  FrameScriptEdit.ScriptEdit.Modified := lModified;

  StatusLogStopTime('FontSizeUp');
end;

{ action View, Font Size Down }
procedure TMainForm.actViewFontSizeDownExecute(Sender: TObject);
var lModified: Boolean;
begin
  StatusLogStartTime;

  lModified := FrameScriptEdit.ScriptEdit.Modified;

  FontSizeDown(FrameScriptEdit.ScriptEdit.Font, YA_MIN_FONT_SIZE);

  FrameScriptEdit.actToolsListByTokensExecute(Sender);
  FrameScriptEdit.ScriptEdit.Modified := lModified;

  StatusLogStopTime('FontSizeDown');
end;

{ action Preferences, Colors }
procedure TMainForm.actToolsColorsExecute(Sender: TObject);
var lForm: TFormColors;
begin
  lForm := TFormColors.Create(Application);
  lForm.ScriptEditFont :=  FrameScriptEdit.ScriptEdit.Font;

  lForm.ShowModal;

  FrameScriptEdit.ScriptEdit.Font := lForm.ScriptEditFont;
  lForm.Free;

  FrameScriptEdit.ParseScript;
  FrameScriptEdit.ListScriptByToken;

  Self.SetFocus;
end;

{ action Preferences, Font }
procedure TMainForm.actToolsFontExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptEdit.Font.Assign( YaFontDialog( FrameScriptEdit.ScriptEdit.Font ) );
end;

{ action Preferences, Settings }
procedure TMainForm.actToolsSettingsExecute(Sender: TObject);
var lForm: TFormSettings;
begin
  lForm := TFormSettings.Create(Application);
  lForm.ScriptEditFont :=  FrameScriptEdit.ScriptEdit.Font;

  lForm.ShowModal;

  FrameScriptEdit.ScriptEdit.Font := lForm.ScriptEditFont;
  lForm.Free;

  FrameScriptEdit.ParseScript;
  FrameScriptEdit.ListScriptByToken;

  Self.SetFocus;
end;

{ action Convert: RESET converters }
procedure TMainForm.actConvertResetExecute(Sender: TObject);
begin
  actConvertExprAliasAddKeywordAs.Enabled             := True;
  actConvertExprAliasRemoveKeywordAs.Enabled          := True;
//actConvertExprAliasChangeKeywordAs.ImageIndex       := actConvertExprAliasAddKeywordAs.ImageIndex;

  actConvertTableAliasAddKeywordAs.Enabled            := True;
  actConvertTableAliasRemoveKeywordAs.Enabled         := True;
//actConvertTableAliasChangeKeywordAs.ImageIndex      := actConvertTableAliasAddKeywordAs.ImageIndex;

  actConvertSortOrderShortKeywords.Enabled            := True;
  actConvertSortOrderLongKeywords.Enabled             := True;
//actConvertSortOrderChangeKeywords.ImageIndex        := actConvertSortOrderLongKeywords.ImageIndex;

  actConvertSortOrderAddDefaultKeywords.Enabled       := True;
  actConvertSortOrderRemoveDefaultKeywords.Enabled    := True;
//actConvertSortOrderChangeDefaultKeywords.ImageIndex := actConvertSortOrderAddDefaultKeywords.ImageIndex;

  actConvertDatatypeIntToInteger.Enabled              := True;
  actConvertDatatypeIntegerToInt.Enabled              := True;
//actConvertDatatypeIntChange.ImageIndex              := actConvertDatatypeIntToInteger.ImageIndex;

  actConvertJoinsAddInner.Enabled                     := True;
  actConvertJoinsRemoveInner.Enabled                  := True;
//actConvertJoinsChangeInner.ImageIndex               := actConvertJoinsAddInner.ImageIndex;

  actConvertJoinsAddOuter.Enabled                     := True;
  actConvertJoinsRemoveOuter.Enabled                  := True;
//actConvertJoinsChangeOuter.ImageIndex               := actConvertJoinsAddOuter.ImageIndex;
end;

{ action Convert }
procedure TMainForm.actConvertDatatypeIntegerToIntExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_Datatype_IntegerToInt );

  actConvertDatatypeIntToInteger.Enabled := True;
  actConvertDatatypeIntegerToInt.Enabled := False;
end;

{ action Convert }
procedure TMainForm.actConvertDatatypeIntToIntegerExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_Datatype_IntToInteger );

  actConvertDatatypeIntToInteger.Enabled := False;
  actConvertDatatypeIntegerToInt.Enabled := True;
end;

{ action Convert }
procedure TMainForm.actConvertCaseColAliasLowerExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_CaseColumnAlias_Lower );

  actConvertCaseColAliasLower.Enabled := False;
  actConvertCaseColAliasUpper.Enabled := True;
end;

procedure TMainForm.actConvertCaseColAliasUpperExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_CaseColumnAlias_Upper );

  actConvertCaseColAliasLower.Enabled := True;
  actConvertCaseColAliasUpper.Enabled := False;
end;

procedure TMainForm.actConvertCaseColQuoteAliasLowerExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_CaseColumnQuotedAlias_Lower );

  actConvertCaseColQuoteAliasLower.Enabled := False;
  actConvertCaseColQuoteAliasUpper.Enabled := True;
end;

procedure TMainForm.actConvertCaseColQuoteAliasUpperExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_CaseColumnQuotedAlias_Upper );

  actConvertCaseColQuoteAliasLower.Enabled := True;
  actConvertCaseColQuoteAliasUpper.Enabled := False;
end;

procedure TMainForm.actConvertCaseColumnLowerExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_CaseColumnName_Lower );

  actConvertCaseColumnLower.Enabled := False;
  actConvertCaseColumnUpper.Enabled := True;
end;

procedure TMainForm.actConvertCaseColumnUpperExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_CaseColumnName_Upper );

  actConvertCaseColumnUpper.Enabled := False;
  actConvertCaseColumnLower.Enabled := True;
end;

procedure TMainForm.actConvertCaseFuncLowerExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_CaseFunc_Lower );

  actConvertCaseFuncLower.Enabled := False;
  actConvertCaseFuncUpper.Enabled := True;
end;

procedure TMainForm.actConvertCaseFuncUpperExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_CaseFunc_Upper );

  actConvertCaseFuncLower.Enabled := True;
  actConvertCaseFuncUpper.Enabled := False;
end;

procedure TMainForm.actConvertCaseIdentLowerExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_CaseIdentifier_Lower );

  actConvertCaseIdentLower.Enabled := False;
  actConvertCaseIdentUpper.Enabled := True;
end;

procedure TMainForm.actConvertCaseIdentUpperExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_CaseIdentifier_Upper );

  actConvertCaseIdentLower.Enabled := True;
  actConvertCaseIdentUpper.Enabled := False
end;

procedure TMainForm.actConvertCaseKeywordLowerExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_CaseKeyword_Lower );

  actConvertCaseKeywordLower.Enabled := False;
  actConvertCaseKeywordUpper.Enabled := True;
end;

procedure TMainForm.actConvertCaseKeywordUpperExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_CaseKeyword_Upper );

  actConvertCaseKeywordLower.Enabled := True;
  actConvertCaseKeywordUpper.Enabled := False;
end;

procedure TMainForm.actConvertCaseParamLowerExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_CaseParam_Lower );

  actConvertCaseParamLower.Enabled := False;
  actConvertCaseParamUpper.Enabled := True;
end;

procedure TMainForm.actConvertCaseParamUpperExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_CaseParam_Upper );

  actConvertCaseParamLower.Enabled := True;
  actConvertCaseParamUpper.Enabled := False;
end;

procedure TMainForm.actConvertCaseTabAliasLowerExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_CaseTableAlias_Lower );

  actConvertCaseTabAliasLower.Enabled := False;
  actConvertCaseTabAliasUpper.Enabled := True;
end;

procedure TMainForm.actConvertCaseTabAliasUpperExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_CaseTableAlias_Upper );

  actConvertCaseTabAliasUpper.Enabled := False;
  actConvertCaseTabAliasLower.Enabled := True;
end;

procedure TMainForm.actConvertCaseTableLowerExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_CaseTableName_Lower );

  actConvertCaseTableLower.Enabled := False;
  actConvertCaseTableUpper.Enabled := True;
end;

procedure TMainForm.actConvertCaseTableUpperExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_CaseTableName_Upper );

  actConvertCaseTableLower.Enabled := True;
  actConvertCaseTableUpper.Enabled := False;
end;

{ action Convert }
procedure TMainForm.actConvertExprAliasAddKeywordAsExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_ExprAlias_AddKeyword_AS );

  actConvertExprAliasAddKeywordAs.Enabled := False;
  actConvertExprAliasRemoveKeywordAs.Enabled := True;
end;

{ action Convert }
procedure TMainForm.actConvertExprAliasRemoveKeywordAsExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_ExprAlias_RemoveKeyword_AS );

  actConvertExprAliasAddKeywordAs.Enabled := True;
  actConvertExprAliasRemoveKeywordAs.Enabled := False;
end;

{ action Convert }
procedure TMainForm.actConvertJoinCondRefToLeftExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_JoinCond_RefToLeft );

//  actConvertDatatypeIntToInteger.Enabled := False;
//  actConvertDatatypeIntegerToInt.Enabled := True;
end;

procedure TMainForm.actConvertJoinsAddInnerExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_Joins_AddInner );

  actConvertJoinsAddInner.Enabled       := False;
  actConvertJoinsRemoveInner.Enabled    := True;
end;

{ action Convert }
procedure TMainForm.actConvertJoinsAddOuterExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_Joins_AddOuter );

  actConvertJoinsAddOuter.Enabled       := False;
  actConvertJoinsRemoveOuter.Enabled    := True;
end;

{ action Convert }
procedure TMainForm.actConvertJoinsRemoveInnerExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_Joins_RemoveInner );

  actConvertJoinsAddInner.Enabled       := True;
  actConvertJoinsRemoveInner.Enabled    := False;
end;

{ action Convert }
procedure TMainForm.actConvertJoinsRemoveOuterExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_Joins_RemoveOuter );

  actConvertJoinsAddOuter.Enabled       := True;
  actConvertJoinsRemoveOuter.Enabled    := False;
end;

{ action Convert }
procedure TMainForm.actConvertTableAliasAddKeywordAsExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_TableAlias_AddKeyword_AS );

  actConvertTableAliasAddKeywordAs.Enabled       := False;
  actConvertTableAliasRemoveKeywordAs.Enabled    := True;
end;

{ action Convert }
procedure TMainForm.actConvertTableAliasRemoveKeywordAsExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_TableAlias_RemoveKeyword_AS );

  actConvertTableAliasAddKeywordAs.Enabled       := True;
  actConvertTableAliasRemoveKeywordAs.Enabled    := False;
end;

{ action Convert }
procedure TMainForm.actConvertSortOrderShortKeywordsExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_SortOrder_ShortKeywords );

  actConvertSortOrderShortKeywords.Enabled     := False;
  actConvertSortOrderLongKeywords.Enabled      := True;
end;

{ action Convert }
procedure TMainForm.actConvertSortOrderLongKeywordsExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_SortOrder_LongKeywords );

  actConvertSortOrderShortKeywords.Enabled     := True;
  actConvertSortOrderLongKeywords.Enabled      := False;
end;

{ action Convert }
procedure TMainForm.actConvertSortOrderAddDefaultKeywordsExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_SortOrder_AddDefaultKeywords );

  actConvertSortOrderAddDefaultKeywords.Enabled       := False;
  actConvertSortOrderRemoveDefaultKeywords.Enabled    := True;

  actConvertSortOrderShortKeywords.Enabled            := True;
  actConvertSortOrderLongKeywords.Enabled             := False;
end;

{ action Convert }
procedure TMainForm.actConvertSortOrderRemoveDefaultKeywordsExecute(Sender: TObject);
begin
  FrameScriptEdit.ScriptConvert(True, SqlToysConvert_SortOrder_RemoveDefaultKeywords );

  actConvertSortOrderAddDefaultKeywords.Enabled       := True;
  actConvertSortOrderRemoveDefaultKeywords.Enabled    := False;
end;

{ action Help, About }
procedure TMainForm.actHelpAboutExecute(Sender: TObject);
var lForm: TForm;
begin
  lForm := TFormAboutYetAnother.Create(Application);
  lForm.Left := Left + (Width - lForm.Width)   div 2;
  lForm.Top  := Top  + (Height - lForm.Height) div 2;

  lForm.ShowModal;
  lForm.Free;

  Self.SetFocus;
end;

{ action Help, Test }
procedure TMainForm.actHelpTestExecute(Sender: TObject);
begin
  {$IFDEF DEBUG}
  TestQueryCount := 0;
  TestQueryErrors := 0;
  StatusLogStartTime;

  GtSqlTestRun;

  StatusLogStopTime('Test');
  ShowMessage('Finished tests of ' + IntToStr(TestQueryCount) +
                    ' queries in ' + StatusLogLastTimeStr +
  strif(TestQueryErrors>0,' with ' + IntToStr(TestQueryErrors) + ' errors' +
                           ' and ' + IntToStr(TestQueryCount - TestQueryErrors) + ' fines.', '.' ));
  {$ENDIF}
end;

{ action manager, update }
procedure TMainForm.ActionManagerUpdate(Action: TBasicAction;var Handled: Boolean);
begin
  Ribbon.DocumentName := FrameScriptEdit.ScriptFileName;

  actFilesSave.Enabled :=(FrameScriptEdit.ScriptFileName <> '') and FrameScriptEdit.ScriptEdit.Modified;

  actEditCopy.Enabled  := FrameScriptEdit.ScriptEdit.SelLength <> 0;
  actEditCut.Enabled   := FrameScriptEdit.ScriptEdit.SelLength <> 0;

  actEditFindReplace.Enabled := FrameScriptEdit.ScriptEdit.Lines.Count <> 0;
end;

{ action Ribbon, Minimize }
procedure TMainForm.actMenuMinimizeExecute(Sender: TObject);
begin
  Ribbon.Minimized := not Ribbon.Minimized;
end;

{ Ribbon, Minimize }
procedure TMainForm.Ribbon_Minimize_Width;
var i,j,k: Integer;
begin
  for i := 0 to Ribbon.Tabs.Count -1 do
    for j := 0 to Ribbon.Tabs[i].Page.GroupCount -1 do
      for k := 0 to Ribbon.Tabs[i].Page.Groups[j].Items.Count-1 do begin
        Ribbon.Tabs[i].Page.Groups[j].Items[k].ShowCaption := False;
        TButtonProperties(Ribbon.Tabs[i].Page.Groups[j].Items[k].CommandProperties).ButtonSize := bsSmall;
      end;
end;

{ Ribbon, Maximize }
procedure TMainForm.Ribbon_Maximize_Width;
var i,j,k: Integer;
begin
  for i := 0 to Ribbon.Tabs.Count -1 do
    for j := 0 to Ribbon.Tabs[i].Page.GroupCount -1 do
      for k := 0 to Ribbon.Tabs[i].Page.Groups[j].Items.Count-1 do begin
        Ribbon.Tabs[i].Page.Groups[j].Items[k].ShowCaption := True;
        TButtonProperties(Ribbon.Tabs[i].Page.Groups[j].Items[k].CommandProperties).ButtonSize := bsLarge;
      end;
end;

end.

