(* $Header: /SQL Toys/SqlFormatter/FrameScriptEdit.pas 57    18-01-14 20:46 Tomek $
   (c) Tomasz Gierka, github.com/SqlToys, 2014.08.16                          *)
{--------------------------------------  --------------------------------------}
{$IFDEF RELEASE}
  {$DEBUGINFO OFF}
  {$LOCALSYMBOLS OFF}
{$ENDIF}
unit FrameScriptEdit;

interface

uses Forms, Menus, Classes, ActnList, ExtCtrls, Controls, StdCtrls, ComCtrls, Messages,
     System.Types, System.Actions, System.Character, System.RTLConsts,
     SqlStructs, SqlParser, SqlLister, SqlConverters;

type
  TGtOnHighlight = procedure (aQueryItem: TGtSqlNode) of object;
  TGtOnAction = procedure of object;

type
  TFrameScriptEdit = class(TFrame)
    ScriptEdit: TRichEdit;

    TimerDblClickRecognize: TTimer;
    TimerDblClickSelection: TTimer;

    ActionList: TActionList;
    actFilesNew: TAction;
    actFilesOpen: TAction;
    actFilesSave: TAction;
    actFilesSaveAs: TAction;
    actFilesSaveAll: TAction;
    actFilesClose: TAction;
    actFilesRecentClearAll: TAction;
    actFilesRecentClearNonExistent: TAction;
    actFilesExit: TAction;

    actEditUndo: TAction;
    actEditRedo: TAction;
    actEditCut: TAction;
    actEditCopy: TAction;
    actEditPaste: TAction;
    actEditSelectAll: TAction;
    actEditFindReplace: TAction;
    actEditFindReplaceNext: TAction;
    actEditPrevQuery: TAction;
    actEditNextQuery: TAction;
    actEditHighlightQuery: TAction;
    actEditHighlightSubQuery: TAction;
    actEditUpperCase: TAction;
    actEditLowerCase: TAction;
    actEditIntend: TAction;
    actEditUnIntend: TAction;
    actEditCtrlTab: TAction;
    actEditCtrlLeft: TAction;
    actEditCtrlRight: TAction;
    actEditCtrlShiftLeft: TAction;
    actEditCtrlShiftRight: TAction;
    actEditShiftLeft: TAction;
    actEditShiftRight: TAction;

    actToolsCompact: TAction;
    actToolsFormat: TAction;
    actToolsListByTokens: TAction;
    actFilesExportXML: TAction;
    actFilesImportXML: TAction;

    procedure ScriptEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    // procedure ScriptEditKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ScriptEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ScriptEditSelectionChange(Sender: TObject);

    procedure TimerDblClickRecognizeTimer(Sender: TObject);
    procedure TimerDblClickSelectionTimer(Sender: TObject);

    procedure actFilesNewExecute(Sender: TObject);
    procedure actFilesOpenExecute(Sender: TObject);
    procedure actFilesSaveExecute(Sender: TObject);
    procedure actFilesSaveAsExecute(Sender: TObject);
    procedure actFilesCloseExecute(Sender: TObject);
    procedure actFilesRecentExecute(Sender: TObject);
    procedure actFilesRecentClearAllExecute(Sender: TObject);
    procedure actFilesRecentClearNonExistentExecute(Sender: TObject);
    procedure actFilesExitExecute(Sender: TObject);

    procedure actEditUndoExecute(Sender: TObject);
    procedure actEditRedoExecute(Sender: TObject);
    procedure actEditCutExecute(Sender: TObject);
    procedure actEditCopyExecute(Sender: TObject);
    procedure actEditPasteExecute(Sender: TObject);
    procedure actEditSelectAllExecute(Sender: TObject);
    procedure actEditFindReplaceExecute(Sender: TObject);
    procedure actEditFindReplaceNextExecute(Sender: TObject);
    procedure actEditPrevQueryExecute(Sender: TObject);
    procedure actEditNextQueryExecute(Sender: TObject);
    procedure actEditHighlightQueryExecute(Sender: TObject);
    procedure actEditHighlightSubQueryExecute(Sender: TObject);
    procedure actEditUpperCaseExecute(Sender: TObject);
    procedure actEditLowerCaseExecute(Sender: TObject);
    procedure actEditIntendExecute(Sender: TObject);
    procedure actEditUnIntendExecute(Sender: TObject);
    procedure actEditCtrlTabExecute(Sender: TObject);
    procedure actEditCtrlLeftExecute(Sender: TObject);
    procedure actEditCtrlRightExecute(Sender: TObject);
    procedure actEditCtrlShiftLeftExecute(Sender: TObject);
    procedure actEditCtrlShiftRightExecute(Sender: TObject);
    procedure actEditShiftLeftExecute(Sender: TObject);
    procedure actEditShiftRightExecute(Sender: TObject);

    procedure actToolsCompactExecute(Sender: TObject);
    procedure actToolsFormatExecute(Sender: TObject);
    procedure actToolsListByTokensExecute(Sender: TObject);
    procedure actFilesExportXMLExecute(Sender: TObject);
    procedure actFilesImportXMLExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Parser: TGtSqlParser;
    ScriptFileName: String;

    ScriptEditFormatted, ScriptEditInsertMode: Boolean;

    ScopeSelectionStart, ScopeSelectionLength: Integer;
    ScopeSelectionLeft, ScopeSelectionRight: Boolean;

    RecentFiles: TStringList;

    OnParse, OnRecentFiles_BuildMenu: TGtOnAction;
    OnHighlightScriptByQueryItem: TGtOnHighlight;

    procedure FrameCreate;

    procedure StringListToScriptEdit(aSL: TStrings); { D7 to XE7, TRichEdit compatibility }

    procedure ParseScript(aSL: TStrings = nil; aOnParseAction: Boolean=True); overload;
    procedure ParseScript(aQuery: String; aOnParseAction: Boolean=True); overload;
    procedure ListScriptByToken;
    procedure FormatScript(aScriptFormat: Boolean = True);
    procedure ScriptConvert(aScriptFormat: Boolean = True; aProc: TSqlNodeProcedure = nil);

    function  ChangeCaseWoStringComment(aStr: String; aUpperCase: Boolean): String;
    function  AnsiLetterOrIdentifierChar(Ch: Char): Boolean;

    function  ScriptCloseFile: Boolean;
    procedure ScriptOpenFromFile (aFileName: String);
    procedure ScriptSaveToFile;
    procedure ScriptTabToSpaces(aSL: TStrings);

    function  ScriptEdit_ActiveControl: Boolean;
    function  ScriptEdit_GetCurrQuery: TGtSqlNode;
    function  ScriptEdit_CurrPositionToStr: String;
    procedure ScriptEdit_LinesClear;

    function  ScriptEdit_GetChar(aCaret: TPoint): Char;
    function  ScriptEdit_GetPrevChar(aCaret: TPoint): Char;
    procedure ScriptEdit_GetCurrPosition(var aCaret: TPoint);
    procedure ScriptEdit_ValidatePosition(var aCaret: TPoint);

    function  ScriptEdit_IsItValidPosition(aCaret: TPoint): Boolean;
    function  ScriptEdit_IsItStartOfAWord(aCaret: TPoint): Boolean;
    function  ScriptEdit_IsItEndOfAWord(aCaret: TPoint): Boolean;

    procedure ScriptEdit_MoveToNextChar(var aCaret: TPoint);
    procedure ScriptEdit_MoveToPrevChar(var aCaret: TPoint);

    procedure ScriptEdit_MoveToStartOfAWord;
    procedure ScriptEdit_MoveToStartOfNextWord;
    procedure ScriptEdit_MoveToEndOfAWord;
    procedure ScriptEdit_MoveToEndOfAPrevWord;

    procedure RecentFiles_ReadFromRegistry;
    procedure RecentFiles_SaveToRegistry;
    procedure RecentFiles_Add(aFileName: String);
    procedure RecentFiles_Remove(aFileName: String);
    procedure RecentFiles_BuildMenu;
    procedure RecentFiles_BuildMenu_Classic(mmFilesRecentFiles: TMenuItem);

    procedure WMDropFiles(var Msg: TWMDropFiles); // message WM_DROPFILES;

    procedure HighlightScriptByQueryItem(aQueryItem: TGtSqlNode; aOnHighlightAction: Boolean=True);

    procedure FrameScriptEdit_Visible;
  end;

implementation

uses SysUtils, Dialogs, Windows, Clipbrd, ShellApi,
     System.UITypes, System.Contnrs,
     GtStandard, GtVisual, GtRegistry, SqlTokenizers,
     SqlCommon, SqlVersion, SqlXmlTree, FormFind, FormSettings
     {$IFDEF GtGarbageCollector} , GtGarbageCollector {$ENDIF} ;

{$R *.dfm}

const
  Ya_Demo_Limit = 8192;
  Ya_Demo_Message = 'Script size exceeds demo version limit (8 kB)';

{ instead constructor }
procedure TFrameScriptEdit.FrameCreate;
begin
  Parser := nil;
  OnParse := nil;
  OnRecentFiles_BuildMenu := nil;
  OnHighlightScriptByQueryItem := nil;

  ScriptFileName := '';

  ScriptEditInsertMode := True;
  ScriptEditFormatted := False;

  ScopeSelectionStart := -1;
  ScopeSelectionLength:= -1;
  ScopeSelectionLeft := False;
  ScopeSelectionRight := False;

  RecentFiles := TStringList.Create;
  RecentFiles.Duplicates := dupIgnore;
end;

{ assigns string list to script edit via stream, D7 to XE7 transition RichEdit compatibility }
procedure TFrameScriptEdit.StringListToScriptEdit(aSL: TStrings);
var TMS: TMemoryStream;
begin
  TMS := TMemoryStream.Create;
  try
    ScriptEdit_LinesClear;

    aSL.SaveToStream(TMS);
    TMS.Seek(0, soFromBeginning);

    // ScriptEdit.PlainText := False;
    ScriptEdit.Lines.LoadFromStream(TMS);
  finally
    TMS.Free;
  end;
end;

{ Parses Script - internal }
procedure TFrameScriptEdit.ParseScript(aQuery: String; aOnParseAction: Boolean=True);
var lSL: TStringList;
begin
  lSL := TStringList.Create;
  try
    lSL.Text := aQuery;
    ParseScript(lSL, aOnParseAction);
  finally
    lSL.Free;
  end;
end;

{ Parses Script - internal }
procedure TFrameScriptEdit.ParseScript(aSL: TStrings = nil; aOnParseAction: Boolean=True);
var lSL: TStringList;
begin
  FreeAndNil(Parser);

  {$IFDEF GtGarbageCollector}
  if Assigned(GarbageCollector) then begin
    GarbageCollector.ClearLog;
    GarbageCollector.DoNotLog := True;
  end;
  {$ENDIF}

  { z odrebna lista ponizej 1 sek }
  lSL := TStringList.Create;
  if Assigned(aSL)
    then lSL.AddStrings( aSL )
    else lSL.AddStrings( ScriptEdit.Lines );

  GtSqlNodeCount := 0;
  Parser := TGtSqlParser.Create( nil, lSL );

  Parser.BuildTokenList := True;//False;//True; // zmieniac tylko przy testach wydajnosci

  StatusLogStartTime;
  Parser.Tokenize_Script;
  Parser.Parse_Statements;
  StatusLogStopTime('Parser');

//  ListScriptByToken;
  if aOnParseAction and Assigned(OnParse) then OnParse;
end;

{ listuje skrypt wg tokenów }
procedure TFrameScriptEdit.ListScriptByToken;
var ScriptLister: TGtSqlTokenLister;
    lLine, lCol: Integer;
    lModified: Boolean;
begin
  lLine     := ScriptEdit.CaretPos.Y;
  lCol      := ScriptEdit.CaretPos.X;
  lModified := ScriptEdit.Modified;

  ScriptLister := TGtSqlTokenLister.Create;
  try
    SetScriptListerOptions(ScriptLister);

    StatusLogStartTime;
    ScriptLister.List(Parser.TokenList);
    StatusLogStopTime('List');

    StatusLogStartTime;
    ScriptEdit.Font.Style := [];
    StringListToScriptEdit(ScriptLister.SL);

    StatusLogStopTime('Memo');
  finally
    ScriptLister.Free;
  end;

  RichEditSetPosition(ScriptEdit, lLine, lCol);
  ScriptEdit.Modified := lModified;
end;

{ formatuje skrypt }
procedure TFrameScriptEdit.FormatScript(aScriptFormat: Boolean = True);
var ScriptLister: TGtSqlFormatLister;
begin
  StatusLogStopTime('|');
  ScriptLister := TGtSqlFormatLister.Create;
  try
    ScriptLister.FormattingMode  := gtfoText;

    SetScriptListerOptions(ScriptLister);
    SetScriptFormatOptions(ScriptLister, aScriptFormat);

    StatusLogStartTime;
  //SqlToysConvert_ExecuteAll(Parser.QueryList, ScriptLister.Options, ScriptLister.CaseOpt);
    SqlConvertExecuteAll(Parser.QueryList);
    StatusLogStopTime('Converts');

    StatusLogStartTime;
    ScriptLister.List_SqlParser(Parser);
    StatusLogStopTime('Format');

    ScriptEdit.Font.Style := [];

    ParseScript(ScriptLister.SL);
    ListScriptByToken;
  finally
    ScriptLister.Free;
  end;
end;

{ uppers/lowers case wo. strings and comments }
function TFrameScriptEdit.ChangeCaseWoStringComment(aStr: String; aUpperCase: Boolean): String;
// var lChangeStr, lChangeCmm: Boolean;
begin
  { MOVE TO SETTINGS and/or change case form }
//  lChangeStr := False;
//  lChangeCmm := False;

  { GO }
  if aUpperCase then Result := AnsiUpperCase(aStr) else Result := AnsiLowerCase(aStr);

  { NIC - TEST }
//  ScriptEdit.SelStart := 0;
//  ScriptEdit.SelLength := 0;
end;

{ checks if char is an ANSI letter char }
function  TFrameScriptEdit.AnsiLetterOrIdentifierChar(Ch: Char): Boolean;
begin
  Result := CharInSet(Ch, ['A'..'Z','a'..'z','_',{}'.',{}'0'..'9'])
        or (AnsiUpperCase(Ch) <> AnsiLowerCase(Ch));
end;

{ closes script file }
function TFrameScriptEdit.ScriptCloseFile: Boolean;
begin
  Result := True;

  RecentFiles_Add(ScriptFileName);

  if ScriptEdit.Modified then begin
    case MessageDlg('Save file ' + ScriptFileName + ' ?',
                    mtWarning, [mbYes, mbNo, mbCancel], 0) of
      mrCancel: Result := False;
      mrNo:     Result := True;
      mrYes:    begin
                  actFilesSaveExecute(Self);
                  Result := not ScriptEdit.Modified;
                end;
    end;
  end;
end;

{ opens non-RTF formatted Script from file }
{ UWAGA: nie dziala gdy sa wlaczone automatyczne akceleratory dla menu RecentFiles }
procedure TFrameScriptEdit.ScriptOpenFromFile;
var SL: TStringList;
    ScriptLister: TGtSqlFormatLister;
begin
  if not ScriptCloseFile then Exit;
  RecentFiles_Remove(aFileName);

  ScriptEdit.Lines.Clear;

  if not FileExists( aFileName ) then begin
    if Application.MainForm.Visible then ShowMessage('File "' + aFileName + '" does not exists.');
    Exit;
  end;

  ScriptFileName := aFileName;
  Application.MainForm.Caption := VER_CAPTION + ' - ' + ScriptFileName;

  if ExtractFileExt(aFileName) = '.xml' then begin
    if not Assigned(Parser) then ParseScript(nil, False);
    XmlToParseTree( aFileName, Parser.QueryList );

    ScriptLister := TGtSqlFormatLister.Create;
    try
      ScriptLister.FormattingMode  := gtfoText;
      SetScriptListerOptions(ScriptLister);
      SetScriptFormatOptions(ScriptLister, True);
      ScriptLister.List_SqlParser(Parser);
      ScriptEdit.Font.Style := [];
      ScriptTabToSpaces(ScriptLister.SL);
      StringListToScriptEdit(ScriptLister.SL);
    finally
      ScriptLister.Free;
    end;
  end else begin
    SL := TStringList.Create;
    try
      SL.LoadFromFile( ScriptFileName );
      ScriptTabToSpaces(SL);
      StringListToScriptEdit(SL);
    finally
      SL.Free;
    end;
  end;

  ParseScript;
  ListScriptByToken;

  ScriptEdit.Modified := False;

  RichEditSetPosition(ScriptEdit, 0,0);
  actFilesSave.Enabled := (ScriptFileName <> '');
end;

{ saves non-RTF formatted Script to file }
procedure TFrameScriptEdit.ScriptSaveToFile;
var lSL: TStringList;
    lBackupFileName, lBackupFileExt: String;
begin
  try
    { find proper backup file name }
    lBackupFileExt := StringReplace(ExtractFileExt(ScriptFileName), '.', '.~', [rfReplaceAll]);

    { do the backup }
    if lBackupFileExt <> '' then begin
      lBackupFileName := ExtractFilePath(ScriptFileName) +
                         ChangeFileExt(ExtractFileName(ScriptFileName), lBackupFileExt );

      SysUtils.DeleteFile(lBackupFileName);
      if FileExists(ScriptFileName) then RenameFile(ScriptFileName, lBackupFileName);
    end;
  except
  end;

  if ExtractFileExt(ScriptFileName) = '.xml' then begin
//    ParseScript(ScriptLister.SL);
//    ListScriptByToken;
    {if not Assigned(Parser) then} ParseScript(nil, False);
    ParseTreeToXml (Parser.QueryList, ScriptFileName);
  end else begin
    lSL := TStringList.Create;
    try
      lSL.AddStrings(ScriptEdit.Lines);
      lSL.SaveToFile(ScriptFileName);
    finally
      lSL.Free;
    end;
  end;

  Application.MainForm.Caption := VER_CAPTION + ' - ' + ScriptFileName;
  if ScriptEdit.Visible then ScriptEdit.SetFocus;
end;

{ changes tabs to spaces }
procedure TFrameScriptEdit.ScriptTabToSpaces;
var i, j: Integer;
    s: String;
begin
  i := 0;
  while i < aSL.Count do begin
    s := aSL[i];

    j := Pos(#9, s);
    while j > 0 do begin
      Delete(s, j, 1);
      Insert(StringOfChar(#32, 8 - ((j-1) mod 8)), s, j);

      j := Pos(#9, s);
    end;

    aSL[i] := s;

    Inc(i);
  end;
end;

{ checks if ScriptEdit is an MainForm ActiveControl }
function  TFrameScriptEdit.ScriptEdit_ActiveControl: Boolean;
begin
  Result := (Application.MainForm.ActiveControl = ScriptEdit) or
            (Application.MainForm.ActiveControl = Self {MainForm.FrameScriptEdit});
end;

{ gets current query }
function  TFrameScriptEdit.ScriptEdit_GetCurrQuery: TGtSqlNode;
var lToken: TGtLexToken;
    i: Integer;
begin
  Result := nil;
  if not Assigned(Parser) then Exit;

  lToken := Parser.FindNearestRelevantToken( ScriptEdit.CaretPos.Y, ScriptEdit.CaretPos.X + 1 );
  if not Assigned(lToken) then Exit;

  { token referuje do kwerendy }
  if lToken.IsReferenced then begin
    Result := TGtSqlNode(TGtLexTokenList(lToken.ReferencedBy[0]).Owner).GetQuery;
    Exit;
  end;

  { szukanie najblizszej kwerendy }
  if Parser.QueryList.Count = 0 then Exit;

  i := 0;
  while (i < Parser.QueryList.Count -1) and ((i=0) or (TGtSqlNode(Parser.QueryList[i]).Kind = gtssOtherNotRecognized))
    do Inc(i);

  lToken := TGtSqlNode(Parser.QueryList[i]).GetFirstToken;
  if not Assigned(lToken) then Exit;

  if (ScriptEdit.CaretPos.Y < lToken.Line) or
     (ScriptEdit.CaretPos.Y = lToken.Line) and (ScriptEdit.CaretPos.X + 1 <= lToken.Pos)
    then
      if i > 0
        then Result := Parser.QueryList[i-1] as TGtSqlNode
        else Result := Parser.QueryList[ i ] as TGtSqlNode;
end;

{ returns script edit position as string }
function  TFrameScriptEdit.ScriptEdit_CurrPositionToStr: String;
var lLine, lPos: Integer;
begin
  { Status bar - Cursor position }
  if ScopeSelectionRight
    then StringList_Abs_to_Line_Pos(ScriptEdit.Lines, ScriptEdit.SelStart + ScriptEdit.SelLength, lLine, lPos {, lRest})
    else StringList_Abs_to_Line_Pos(ScriptEdit.Lines, ScriptEdit.SelStart, lLine, lPos {, lRest});

  Result := IntToStr(lLine + 1) + ': ' + IntToStr(lPos  + 1) +
            strIf(ScriptEdit.Modified, '*', strIf(ScriptEditFormatted, '^', '')) +
            strIf(ScriptEdit.SelLength <> 0, ' (' + IntToStr(StringList_Distance(ScriptEdit.Lines, ScriptEdit.SelStart, ScriptEdit.SelStart + ScriptEdit.SelLength)) + ')');
end;

{ workaround for ScriptEdit.Lines.Clear }
procedure TFrameScriptEdit.ScriptEdit_LinesClear;
begin
  ScriptEdit.SelectAll;
  ScriptEdit.SelText := '';

  ScriptEdit.Modified := False;
  ScriptEditFormatted := False;
end;

{ Script Key Up }
//procedure TFrameScriptEdit.ScriptEditKeyUp(Sender: TObject;var Key: Word; Shift: TShiftState);
//begin
//  MainForm.HighlightNavigatorByQueryItem( FrameScriptEdit.ScriptEdit_GetCurrQuery );
//end;

{ Script Key Down }
procedure TFrameScriptEdit.ScriptEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_INSERT) and (Shift = []) then ScriptEditInsertMode := not ScriptEditInsertMode;
end;

{ Script Edit Double Click Event }
procedure TFrameScriptEdit.ScriptEditMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbLeft) then begin
    if TimerDblClickRecognize.Enabled then begin
      TimerDblClickRecognize.Enabled := False;
      TimerDblClickSelection.Enabled := True;
    end else begin
      TimerDblClickRecognize.Enabled := True;
    end;
  end;
end;

{ stores direction of an selection }
procedure TFrameScriptEdit.ScriptEditSelectionChange(Sender: TObject);
begin
  if ScriptEdit.SelLength > 0 then begin
    if (ScriptEdit.SelStart + ScriptEdit.SelLength = ScopeSelectionStart + ScopeSelectionLength) or
       (ScriptEdit.SelStart + ScriptEdit.SelLength <= ScopeSelectionStart) then begin
      ScopeSelectionLeft  := True;
      ScopeSelectionRight := False;
    end;
    if (ScriptEdit.SelStart = ScopeSelectionStart) or
       (ScriptEdit.SelStart >= ScopeSelectionStart + ScopeSelectionLength) then begin
      ScopeSelectionLeft  := False;
      ScopeSelectionRight := True;
    end;
  end else begin
    ScopeSelectionLeft  := False;
    ScopeSelectionRight := False;
  end;

  ScopeSelectionStart := ScriptEdit.SelStart;
  ScopeSelectionLength:= ScriptEdit.SelLength;
end;

{ Script Edit Double Click Recognize Timer }
procedure TFrameScriptEdit.TimerDblClickRecognizeTimer(Sender: TObject);
begin
  TimerDblClickRecognize.Enabled := False;
end;

{ Script Edit Double Click Selection Timer }
procedure TFrameScriptEdit.TimerDblClickSelectionTimer(Sender: TObject);
var s: String;
begin
  TimerDblClickSelection.Enabled := False;

  { wlasciwy Double Click }
  if ScriptEdit.SelLength > 0 then ScriptEdit.SelLength := 0;

  if ScriptEdit.CaretPos.X > 0 then begin
    s := Copy(ScriptEdit.Lines[ ScriptEdit.CaretPos.Y ], ScriptEdit.CaretPos.X, 1);
    if (s <> '') and AnsiLetterOrIdentifierChar(s[1]) then begin
      actEditCtrlLeftExecute(Sender);
    end;
  end;

  actEditCtrlShiftRightExecute(Sender);
end;

{ action Files, New }
procedure TFrameScriptEdit.actFilesNewExecute(Sender: TObject);
begin
  if not ScriptCloseFile then Exit;
  ScriptFileName := '';
  Application.MainForm.Caption := VER_CAPTION;

  actFilesSave.Enabled := False;

  ScriptEdit_LinesClear;
  ScriptEdit.Modified := False;
  ScriptEditFormatted := False;

  ParseScript;
  ListScriptByToken;
//  MainForm.FrameNavigator.ListNavigator;

  if ScriptEdit.Visible then ScriptEdit.SetFocus;
end;

{ action Files, Open }
procedure TFrameScriptEdit.actFilesOpenExecute(Sender: TObject);
var lFileName: String;
begin
  if not ScriptCloseFile then Exit;

  if GtOpenSqlFile( lFileName ) then ScriptOpenFromFile( lFileName );

  if ScriptEdit.Visible then ScriptEdit.SetFocus;
end;

{ action Files, Save }
procedure TFrameScriptEdit.actFilesSaveExecute(Sender: TObject);
begin
  if ScriptFileName <> '' then begin
    ScriptSaveToFile;
    ScriptEdit.Modified := False;
    ScriptEditFormatted:= False;
  end else begin
    actFilesSaveAsExecute(Sender);
  end;

  if ScriptEdit.Visible then ScriptEdit.SetFocus;
end;

{ action Files, Save As }
procedure TFrameScriptEdit.actFilesSaveAsExecute(Sender: TObject);
var lFileName: String;
begin
  lFileName := ScriptFileName;
  if not GtSaveSqlFile(lFileName) then Exit;
  if lFileName = '' then Exit;
  if FileExists(lFileName) and
    (MessageDlg('Overwrite file ' {+ lFileName} + ' ?', mtWarning, [mbYes, mbNo, mbCancel], 0) <> mrYes)
     then Exit;

  RecentFiles_Add(ScriptFileName);
  RecentFiles_Remove(lFileName);

  actFilesSave.Enabled := True;
  ScriptFileName := lFileName;

  ScriptSaveToFile;
  ScriptEdit.Modified := False;
  ScriptEditFormatted:= False;

  if ScriptEdit.Visible then ScriptEdit.SetFocus;
end;

{ action Files, Close }
procedure TFrameScriptEdit.actFilesCloseExecute(Sender: TObject);
begin
  actFilesNewExecute(Sender);
end;

{ action Files, Recent }
procedure TFrameScriptEdit.actFilesRecentExecute(Sender: TObject);
var lFileName: String;
begin
  if not(Sender is TMenuItem) then Exit;

  lFileName := TMenuItem(Sender).Caption;
  if not ScriptCloseFile then Exit; { silent recent menu rebuild }

  ScriptOpenFromFile( lFileName );

  if ScriptEdit.Visible then ScriptEdit.SetFocus;
end;

{ action Files, Recent files - clear all }
procedure TFrameScriptEdit.actFilesRecentClearAllExecute(Sender: TObject);
begin
  RecentFiles.Clear;
  RecentFiles_BuildMenu;
end;

{ action Files, Recent files - clear non existent files }
procedure TFrameScriptEdit.actFilesRecentClearNonExistentExecute(Sender: TObject);
var i: Integer;
begin
  i := 0;
  while i < RecentFiles.Count do begin
    if FileExists(RecentFiles[i]) then begin
      Inc(i);
    end else begin
      RecentFiles.Delete(i);
    end;
  end;
  RecentFiles_BuildMenu;
end;

{ action Files, Close }
procedure TFrameScriptEdit.actFilesExitExecute(Sender: TObject);
begin
  Application.MainForm.Close;
end;

{ action Files, Export to XML }
procedure TFrameScriptEdit.actFilesExportXMLExecute(Sender: TObject);
var lFileName: String;
begin
  lFileName := ScriptFileName;
  if not GtSaveXmlFile(lFileName) then Exit;
  if lFileName = '' then Exit;
  if FileExists(lFileName) and
    (MessageDlg('Overwrite file ' {+ lFileName} + ' ?', mtWarning, [mbYes, mbNo, mbCancel], 0) <> mrYes)
     then Exit;

  {if not Assigned(Parser) then} ParseScript(nil, False);
  ParseTreeToXml (Parser.QueryList, lFileName);

  if ScriptEdit.Visible then ScriptEdit.SetFocus;
end;

{ action Files, Import from XML }
procedure TFrameScriptEdit.actFilesImportXMLExecute(Sender: TObject);
var lFileName: String;
begin
  if not ScriptCloseFile then Exit;
  if not GtOpenXmlFile( lFileName ) then Exit;

  ScriptOpenFromFile (lFileName);

  if ScriptEdit.Visible then ScriptEdit.SetFocus;
end;

{ action Edit, Undo }
procedure TFrameScriptEdit.actEditUndoExecute(Sender: TObject);
begin
  StatusLogStartTime;
  ScriptEdit.Undo;
  StatusLogStopTime('Undo');
end;

{ action Edit, Redo }
procedure TFrameScriptEdit.actEditRedoExecute(Sender: TObject);
begin
  // ScriptEdit.Redo;
end;

{ action Edit, Cut }
procedure TFrameScriptEdit.actEditCutExecute(Sender: TObject);
begin
  if not ScriptEdit_ActiveControl then Exit;

  StatusLogStartTime;
  ScriptEdit.CutToClipboard;

  StatusLogStopTime('Cut');
end;

{ action Edit, Copy }
procedure TFrameScriptEdit.actEditCopyExecute(Sender: TObject);
begin
  if not ScriptEdit_ActiveControl then Exit;

  StatusLogStartTime;
  ScriptEdit.CopyToClipboard;
  StatusLogStopTime('Copy');
end;

{ action Edit, Paste }
procedure TFrameScriptEdit.actEditPasteExecute(Sender: TObject);
begin
  if not ScriptEdit_ActiveControl then Exit;
  if not Clipboard.HasFormat(CF_TEXT) then Exit;

  StatusLogStartTime;

  ScriptEdit.SelText := Clipboard.AsText;

  { kiedys wylaczylem, potem ponownie wlaczylem Parse + ListByTokens }
  ParseScript;
  ListScriptByToken;
//  MainForm.FrameNavigator.ListNavigator;
  StatusLogStopTime('Paste');
end;

{ action Edit, Select All }
procedure TFrameScriptEdit.actEditSelectAllExecute(Sender: TObject);
begin
  ScriptEdit.SelectAll;
end;

{ action Edit, Find & Replace }
procedure TFrameScriptEdit.actEditFindReplaceExecute(Sender: TObject);
begin
  if not Assigned(FormFindReplace) then begin
    FormFindReplace := TFormFindReplace.Create(Application);
    if not Assigned(FormFindReplace) then Exit;
    FormFindReplace.ScriptEdit := ScriptEdit;
  end;

  FormFindReplace.Show;
end;

{ action Edit, Find & Replace Next }
procedure TFrameScriptEdit.actEditFindReplaceNextExecute(Sender: TObject);
begin
  if not Assigned(FormFindReplace) then Exit;

  case FormFindReplace.LastAction of
    1: FormFindReplace.FindButtonClick(Sender);
    2: begin
         FormFindReplace.FindButtonClick(Sender);
         FormFindReplace.ReplaceButtonClick(Sender);
       end;
    3: FormFindReplace.ReplaceAllButtonClick(Sender);
  end;
end;

{ action Edit, Prev Query }
procedure TFrameScriptEdit.actEditPrevQueryExecute(Sender: TObject);
var i: Integer;
    lQuery: TGtSqlNode;
    lToken: TGtLexToken;
begin
  if not Assigned(Parser) then Exit;

  lQuery := ScriptEdit_GetCurrQuery;
  i := Parser.QueryList.GetIndex( lQuery );

  { omija problem pulapki podswietlenia ostatniej kwerendy }
  if (i = Parser.QueryList.Count-1) and (ScriptEdit.SelLength = 0) then begin
    lToken := lQuery.GetLastToken;

    { move over to highlight the same query then }
    if (lToken.Line < ScriptEdit.CaretPos.Y) or
       (lToken.Line = ScriptEdit.CaretPos.Y) and (lToken.Pos <= ScriptEdit.CaretPos.X + 1)
      then Inc(i);
  end;

  if i < 1 then else
  if i >= Parser.QueryList.Count then lQuery := Parser.QueryList[Parser.QueryList.Count-1] as TGtSqlNode
  else lQuery := Parser.QueryList[i-1] as TGtSqlNode;

  HighlightScriptByQueryItem(lQuery);
  // MainForm.FrameNavigator.HighlightNavigatorByQueryItem(lQuery);
end;

{ action Edit, Next Query }
procedure TFrameScriptEdit.actEditNextQueryExecute(Sender: TObject);
var i: Integer;
begin
  if not Assigned(Parser) then Exit;

  i := Parser.QueryList.GetIndex( ScriptEdit_GetCurrQuery );

  { omija problem przeskakiwania do drugiej kwerendy }
  if (i = 0) and (ScriptEdit.SelLength = 0)
    then
    else Inc(i);

  if i > Parser.QueryList.Count -1 then i := Parser.QueryList.Count - 1;

  HighlightScriptByQueryItem( Parser.QueryList[i] );
  // MainForm.FrameNavigator.HighlightNavigatorByQueryItem( Parser.QueryList[i] );
end;

{ action Edit, Highlight Query }
procedure TFrameScriptEdit.actEditHighlightQueryExecute(Sender: TObject);
var lQuery: TGtSqlNode;
begin
  lQuery := ScriptEdit_GetCurrQuery;

  HighlightScriptByQueryItem(lQuery);
  // MainForm.FrameNavigator.HighlightNavigatorByQueryItem(lQuery);
end;

{ action Edit, Highlight SubQuery }
procedure TFrameScriptEdit.actEditHighlightSubQueryExecute(Sender: TObject);
begin
//
end;

{ action Edit, Upper case }
procedure TFrameScriptEdit.actEditUpperCaseExecute(Sender: TObject);
begin
  StatusLogStartTime;

  // ScriptEdit.SelText := UpperCase(ScriptEdit.SelText);
  ScriptEdit.SelText := ChangeCaseWoStringComment(ScriptEdit.SelText, True);

  ParseScript;
  ListScriptByToken;
//  MainForm.FrameNavigator.ListNavigator;
  StatusLogStopTime('Uppercase');
end;

{ action Edit, Lower case }
procedure TFrameScriptEdit.actEditLowerCaseExecute(Sender: TObject);
begin
  StatusLogStartTime;

  ScriptEdit.SelText := ChangeCaseWoStringComment(ScriptEdit.SelText, False);

  ParseScript;
  ListScriptByToken;
//  MainForm.FrameNavigator.ListNavigator;
  StatusLogStopTime('Lowercase');
end;

{ action Edit, Intend }
procedure TFrameScriptEdit.actEditIntendExecute(Sender: TObject);
var lSL: TStringList;
    i, lSelStart, lSelLength: Integer;
    s: String;
begin
  { do not hool TAB on Find & Replace action }
  if Assigned(FormFindReplace) then begin
    PostMessage(FormFindReplace.Handle, wm_NextDlgCtl, 0, 0);
    Exit;
  end;

  StatusLogStartTime;

  if ScriptEdit.SelLength = 0 then begin
    { find nearest column in upper line }
    i := 1;
    if ScriptEdit.CaretPos.Y > 0
      then s := Copy(ScriptEdit.Lines[ ScriptEdit.CaretPos.Y-1 ], ScriptEdit.CaretPos.X + 1, 999999)
      else s := '';
    while (i <= Length(s)) and not CharInSet(s[i], [#32,#9]) do Inc(i);
    while (i <= Length(s)) and CharInSet(s[i], [#32,#9]) do Inc(i, intIf(s[i]=#32, 1, 4));
    ScriptEdit.SelText := StringOfChar(#32, intIf(i=1, 2, i-1));
  end else begin
    { intend text block }
    lSL := TStringList.Create;
    try
      lSL.Text := ScriptEdit.SelText;

      for i := 0 to lSL.Count - 1 do
        lSL[i] := '  ' + lSL[i];

      lSelStart := ScriptEdit.SelStart;
      lSelLength:= ScriptEdit.SelLength + 2*lSL.Count;

      ScriptEdit.SelText := lSL.Text;

      ParseScript;
      ListScriptByToken;
//      MainForm.FrameNavigator.ListNavigator;

      ScriptEdit.SelStart := lSelStart;
      ScriptEdit.SelLength:= lSelLength;
    finally
      lSL.Free;
    end;
  end;

  StatusLogStopTime('Intend');
end;

{ action Edit, Unintend }
procedure TFrameScriptEdit.actEditUnIntendExecute(Sender: TObject);
var lSL: TStringList;
    i, cnt, lSelStart, lSelLength: Integer;
begin
  if Assigned(FormFindReplace) then begin
    PostMessage(FormFindReplace.Handle, wm_NextDlgCtl, 1, 0);
    Exit;
  end;

  StatusLogStartTime;

  lSL := TStringList.Create;
  try
    lSL.Text := ScriptEdit.SelText;

    cnt := 0;
    for i := 0 to lSL.Count - 1 do begin
      if (Length(lSL[i]) > 0) and (lSl[i][1] = #32) then begin
        lSL[i] := Copy(lSL[i], 2, Length(lSL[i]) - 1);
        Inc(cnt);

        if (Length(lSL[i]) > 0) and (lSl[i][1] = #32) then begin
          lSL[i] := Copy(lSL[i], 2, Length(lSL[i]) - 1);
          Inc(cnt);
        end;
      end;
    end;

    lSelStart := ScriptEdit.SelStart;
    lSelLength:= ScriptEdit.SelLength;

    ScriptEdit.SelText := lSL.Text;

    ParseScript;
    ListScriptByToken;
//    MainForm.FrameNavigator.ListNavigator;

    ScriptEdit.SelStart := lSelStart;
    ScriptEdit.SelLength:= lSelLength - cnt;
  finally
    lSL.Free;
  end;

  StatusLogStopTime('Unintend');
end;

{ action Edit, Ctrl + Tab, prevents marked script deletes }
procedure TFrameScriptEdit.actEditCtrlTabExecute(Sender: TObject);
begin
//
end;

{ returns char at given script position }
function  TFrameScriptEdit.ScriptEdit_GetChar(aCaret: TPoint): Char;
begin
  if (aCaret.Y >= 0) and (aCaret.Y <= ScriptEdit.Lines.Count -1)
    then Result := ScriptEdit.Lines[ aCaret.Y ][ aCaret.X +1 ]
    else Result := #0;
end;

{ returns one char before given script position }
function  TFrameScriptEdit.ScriptEdit_GetPrevChar(aCaret: TPoint): Char;
begin
  if (aCaret.Y >= 0) and (aCaret.Y <= ScriptEdit.Lines.Count -1)
    then Result := ScriptEdit.Lines[ aCaret.Y ][ aCaret.X ]
    else Result := #0;
end;

{ checks if position is at start of a word }
function  TFrameScriptEdit.ScriptEdit_IsItStartOfAWord(aCaret: TPoint): Boolean;
begin
  Result := False;
  if aCaret.Y < 0 then Exit;
  if aCaret.Y > ScriptEdit.Lines.Count -1 then Exit;
  if aCaret.X < 0 then Exit;
  if aCaret.X > Length(ScriptEdit.Lines[ aCaret.Y ]) -1 then Exit;

  Result := AnsiLetterOrIdentifierChar(ScriptEdit_GetChar(aCaret))
    and not AnsiLetterOrIdentifierChar(ScriptEdit_GetPrevChar(aCaret));
end;

{ checks if position is at end of a word }
function  TFrameScriptEdit.ScriptEdit_IsItEndOfAWord(aCaret: TPoint): Boolean;
begin
  Result := False;
  if aCaret.X < 0 then Exit;

  Result := AnsiLetterOrIdentifierChar(ScriptEdit_GetPrevChar(aCaret))
    and not AnsiLetterOrIdentifierChar(ScriptEdit_GetChar(aCaret));
end;

{ returns current position }
procedure TFrameScriptEdit.ScriptEdit_GetCurrPosition(var aCaret: TPoint);
begin
  aCaret := ScriptEdit.CaretPos;
end;

{ checks if position is valid }
function  TFrameScriptEdit.ScriptEdit_IsItValidPosition(aCaret: TPoint): Boolean;
begin
  Result := False;

  if aCaret.Y < 0 then Exit;
  if aCaret.Y > ScriptEdit.Lines.Count -1 then Exit;
  if aCaret.X < 0 then Exit;
  if aCaret.X > Length(ScriptEdit.Lines[ aCaret.Y ]) {-1} then Exit;

  Result := True;
end;

{ validates position inside text }
procedure TFrameScriptEdit.ScriptEdit_ValidatePosition(var aCaret: TPoint);
begin
  if aCaret.Y < 0 then Exit;
  if aCaret.Y > ScriptEdit.Lines.Count -1 then Exit;

  if (aCaret.Y = 0) and (aCaret.X < 0) then Exit;
  if (aCaret.Y = ScriptEdit.Lines.Count -1) and (aCaret.X > Length(ScriptEdit.Lines[ aCaret.Y ]) -1) then Exit;

  RichEditSetPosition(ScriptEdit, aCaret.Y, aCaret.X);
  ScriptEdit_GetCurrPosition(aCaret);
end;

{ moves position to next char }
procedure TFrameScriptEdit.ScriptEdit_MoveToNextChar(var aCaret: TPoint);
begin
  Inc(aCaret.X);
  if not ScriptEdit_IsItValidPosition(aCaret) then ScriptEdit_ValidatePosition(aCaret);
end;

{ moves position to prev char }
procedure TFrameScriptEdit.ScriptEdit_MoveToPrevChar(var aCaret: TPoint);
begin
  Dec(aCaret.X);
  if not ScriptEdit_IsItValidPosition(aCaret) then ScriptEdit_ValidatePosition(aCaret);
end;

{ moves position to start of this or previous word }
procedure TFrameScriptEdit.ScriptEdit_MoveToStartOfAWord;
var aCaret, aOrgCaret: TPoint;
begin
  ScriptEdit_GetCurrPosition(aCaret);
  aOrgCaret := aCaret;

  if ScriptEdit_IsItStartOfAWord(aCaret) then ScriptEdit_MoveToPrevChar(aCaret);

  while ScriptEdit_IsItValidPosition(aCaret) and not ScriptEdit_IsItStartOfAWord(aCaret) do begin
    ScriptEdit_MoveToPrevChar(aCaret);
  end;

  if ScriptEdit_IsItStartOfAWord(aCaret) //and (aCaretY <= aOrgCaretY)
    then RichEditSetPosition(ScriptEdit, aCaret.Y, aCaret.X)
    else RichEditSetPosition(ScriptEdit, aOrgCaret.Y, aOrgCaret.X);
end;

{ moves position to start of next word }
procedure TFrameScriptEdit.ScriptEdit_MoveToStartOfNextWord;
var aCaret: TPoint;
begin
  ScriptEdit_GetCurrPosition(aCaret);

  if ScriptEdit_IsItStartOfAWord(aCaret) then ScriptEdit_MoveToNextChar(aCaret);

  while ScriptEdit_IsItValidPosition(aCaret) and not ScriptEdit_IsItStartOfAWord(aCaret) do begin
    ScriptEdit_MoveToNextChar(aCaret);
  end;

  if ScriptEdit_IsItStartOfAWord(aCaret)
    then RichEditSetPosition(ScriptEdit, aCaret.Y, aCaret.X);
end;

{ moves cursor to begin of a word }
procedure TFrameScriptEdit.actEditCtrlLeftExecute(Sender: TObject);
begin
  ScriptEdit_MoveToStartOfAWord;
end;

{ moves position to end of a word }
procedure TFrameScriptEdit.ScriptEdit_MoveToEndOfAWord;
var aCaret: TPoint;
begin
  ScriptEdit_GetCurrPosition(aCaret);

  if ScriptEdit_IsItEndOfAWord(aCaret) then ScriptEdit_MoveToNextChar(aCaret);

  while ScriptEdit_IsItValidPosition(aCaret) and not ScriptEdit_IsItEndOfAWord(aCaret) do begin
    ScriptEdit_MoveToNextChar(aCaret);
  end;

  RichEditSetPosition(ScriptEdit, aCaret.Y, aCaret.X);
end;

{ moves position to end of a previous word }
procedure TFrameScriptEdit.ScriptEdit_MoveToEndOfAPrevWord;
var aCaret: TPoint;
begin
  ScriptEdit_GetCurrPosition(aCaret);

  if ScriptEdit_IsItEndOfAWord(aCaret) then ScriptEdit_MoveToPrevChar(aCaret);

  while ScriptEdit_IsItValidPosition(aCaret) and not ScriptEdit_IsItEndOfAWord(aCaret) do begin
    ScriptEdit_MoveToPrevChar(aCaret);
  end;

  RichEditSetPosition(ScriptEdit, aCaret.Y, aCaret.X);
end;

{ moves cursor to end of a word }
procedure TFrameScriptEdit.actEditCtrlRightExecute(Sender: TObject);
begin
  ScriptEdit_MoveToEndOfAWord;
end;

{ select to begin of a word }
procedure TFrameScriptEdit.actEditCtrlShiftLeftExecute(Sender: TObject);
var lStart, lLength, lEnd: Integer;
begin
  lStart  := ScriptEdit.SelStart;
  lLength := ScriptEdit.SelLength;

  if ScopeSelectionLeft or not ScopeSelectionRight then begin
    ScriptEdit.SelLength := 0; // potrzebne ??

    ScriptEdit_MoveToStartOfAWord;

    ScriptEdit.SelLength := lStart - ScriptEdit.SelStart + lLength;
  end else
  if ScopeSelectionRight then begin
    ScriptEdit.SelLength := 0;
    ScriptEdit.SelStart  := lStart + lLength;

    ScriptEdit_MoveToEndOfAPrevWord;

    lEnd := ScriptEdit.SelStart;

    ScriptEdit.SelStart  := lStart;
    ScriptEdit.SelLength := lEnd - lStart;
  end;

  ScopeSelectionStart := lStart;
  ScopeSelectionLength := lLength;
  ScriptEditSelectionChange(Sender);
end;

{ select to end of a word }
procedure TFrameScriptEdit.actEditCtrlShiftRightExecute(Sender: TObject);
var lStart, lLength, lEnd: Integer;
begin
  lStart  := ScriptEdit.SelStart;
  lLength := ScriptEdit.SelLength;

  if ScopeSelectionLeft then begin
    ScriptEdit.SelLength := 0; // potrzebne ??

    ScriptEdit_MoveToStartOfNextWord;

    ScriptEdit.SelLength := lStart - ScriptEdit.SelStart + lLength;
  end else
  if ScopeSelectionRight or not ScopeSelectionLeft then begin
    ScriptEdit.SelLength := 0;
    ScriptEdit.SelStart  := lStart + lLength;

    ScriptEdit_MoveToEndOfAWord;

    lEnd := ScriptEdit.SelStart;

    ScriptEdit.SelStart  := lStart;
    ScriptEdit.SelLength := lEnd - lStart;
  end;

  ScopeSelectionStart := lStart;
  ScopeSelectionLength := lLength;
  ScriptEditSelectionChange(Sender);
end;

{ action Edit, Left selection }
procedure TFrameScriptEdit.actEditShiftLeftExecute(Sender: TObject);
var lStart, lLength: Integer;
begin
  lStart  := ScriptEdit.SelStart;
  lLength := ScriptEdit.SelLength;

  if ScopeSelectionLeft or not ScopeSelectionRight then begin
    ScriptEdit.SelStart  := lStart  - 1;
    ScriptEdit.SelLength := lLength + 1;
  end else
  if ScopeSelectionRight and (ScriptEdit.SelLength > 0) then begin
    ScriptEdit.SelLength := lLength - 1;
  end;

  ScopeSelectionStart := lStart;
  ScopeSelectionLength := lLength;
  ScriptEditSelectionChange(Sender);
end;

{ action Edit, Right selection }
procedure TFrameScriptEdit.actEditShiftRightExecute(Sender: TObject);
var lStart, lLength: Integer;
begin
  lStart  := ScriptEdit.SelStart;
  lLength := ScriptEdit.SelLength;

  if ScopeSelectionLeft and (lLength > 0) then begin
    ScriptEdit.SelStart  := lStart  + 1;
    ScriptEdit.SelLength := lLength - 1;
  end else
  if ScopeSelectionRight or not ScopeSelectionLeft then begin
    ScriptEdit.SelLength := lLength + 1;
    { end of line workaround }
    if ScriptEdit.SelLength = lLength then ScriptEdit.SelLength := lLength + 2;
  end;

  ScopeSelectionStart := lStart;
  ScopeSelectionLength := lLength;
  ScriptEditSelectionChange(Sender);
end;

{ formatuje skrypt, woła konwerter }
procedure TFrameScriptEdit.ScriptConvert(aScriptFormat: Boolean = True; aProc: TSqlNodeProcedure = nil);
var lModified: Boolean;
begin
  lModified := ScriptEdit.Modified;
  ParseScript(nil, False);

  if Assigned(aProc) then aProc( Parser.QueryList );

  FormatScript(aScriptFormat);

  ScriptEdit.Modified := lModified;
  ScriptEditFormatted:= True;
  if ScriptEdit.Visible then ScriptEdit.SetFocus;
end;

{ action Tools, Compact }
procedure TFrameScriptEdit.actToolsCompactExecute(Sender: TObject);
var lModified: Boolean;
begin
  lModified := ScriptEdit.Modified;
  ParseScript(nil, False);

  FormatScript(False);

  ScriptEdit.Modified := lModified;
  ScriptEditFormatted:= True;
  if ScriptEdit.Visible then ScriptEdit.SetFocus;
end;

{ action Tools, Format }
procedure TFrameScriptEdit.actToolsFormatExecute(Sender: TObject);
var lModified: Boolean;
begin
  lModified := ScriptEdit.Modified;
  ParseScript(nil, False);

  FormatScript(True);

  ScriptEdit.Modified := lModified;
  ScriptEditFormatted:= True;
  if ScriptEdit.Visible then ScriptEdit.SetFocus;
end;

{ action Tools, List By Tokens }
procedure TFrameScriptEdit.actToolsListByTokensExecute(Sender: TObject);
begin
  ParseScript;
  ListScriptByToken;
//  MainForm.FrameNavigator.ListNavigator;

  if ScriptEdit.Visible then ScriptEdit.SetFocus;
end;

{ restores recent files }
procedure TFrameScriptEdit.RecentFiles_ReadFromRegistry;
var i: Integer;
    s: String;
begin
  i := 1;
  while (i < 99) and (RecentFiles.Count < 10) do begin
    s := rguGetStr( YA_RECENT_FILES_KEY + IntToStr(i) );
    if (s <> '') and (RecentFiles.IndexOf(s) = -1) then RecentFiles.Add(s);

    Inc(i);
  end;

  RecentFiles_BuildMenu;
end;

{ store recent files }
procedure TFrameScriptEdit.RecentFiles_SaveToRegistry;
var i: Integer;
begin
  rguDeleteKey( YA_RECENT_FILES_KEY );

  for i := 0 to IntMin(9, RecentFiles.Count - 1) do
    rguPutStr( YA_RECENT_FILES_KEY + IntToStr(i+1), RecentFiles[i]);
end;

{ add file to recent files }
procedure TFrameScriptEdit.RecentFiles_Add;
var i: Integer;
begin
  if aFileName = '' then Exit;

  if Assigned(RecentFiles) and (aFileName <> '')then begin
    i := RecentFiles.IndexOf(aFileName);
    if i <> -1 then RecentFiles.Delete(i);
    RecentFiles.Insert(0, aFileName);
  end;

  RecentFiles_BuildMenu;
end;

{ removes file from recent files }
procedure TFrameScriptEdit.RecentFiles_Remove;
var i: Integer;
begin
  if aFileName = '' then Exit;

  i := RecentFiles.IndexOf(aFileName);
  if i <> -1 then RecentFiles.Delete( i );

  RecentFiles_BuildMenu;
end;

{ builds recent files menu }
procedure TFrameScriptEdit.RecentFiles_BuildMenu;
begin
  if Assigned(OnRecentFiles_BuildMenu) then OnRecentFiles_BuildMenu;
end;

{ builds recent files menu }
procedure TFrameScriptEdit.RecentFiles_BuildMenu_Classic(mmFilesRecentFiles: TMenuItem);
var i: Integer;
    lmi: TMenuItem;
begin
  if not Assigned(mmFilesRecentFiles) then Exit;

  mmFilesRecentFiles.Clear;
  for i := 0 to RecentFiles.Count - 1 do begin
      lmi := TMenuItem.Create(mmFilesRecentFiles);
      lmi.Caption := RecentFiles[i];
      lmi.OnClick := actFilesRecentExecute;
      lmi.Tag     := i;
      lmi.Enabled := FileExists(RecentFiles[i]);

      mmFilesRecentFiles.Add(lmi);
    end;

  mmFilesRecentFiles.Enabled := RecentFiles.Count > 0;
  actFilesRecentClearAll.Enabled := RecentFiles.Count > 0;
  actFilesRecentClearNonExistent.Enabled := RecentFiles.Count > 0;
end;

{ message WM_DROPFILES, took from: http://www.delphidabbler.com/articles?article=11 }
{ otwiera przeciagnięty plik w aplikacji }
procedure TFrameScriptEdit.WMDropFiles(var Msg: TWMDropFiles);
var i, DroppedFileCount, FileNameLength: Integer;
    DropH: HDROP;
    // DropPoint: TPoint;
    FileName: string;
begin
  // inherited;

  DropH := Msg.Drop;
  try
    DroppedFileCount := DragQueryFile(DropH, $FFFFFFFF, nil, 0);

    for i := 0 to DroppedFileCount -1 do begin
      FileNameLength := DragQueryFile(DropH, i, nil, 0);
      SetLength(FileName, FileNameLength);
      DragQueryFile(DropH, i, PChar(FileName), FileNameLength + 1);

      if ScriptCloseFile then ScriptOpenFromFile( FileName );
    end;

    // OPTIONAL: Get point at which files were dropped
    // DragQueryPoint(DropH, DropPoint);
    // ... do something with drop point here
  finally
    DragFinish(DropH);
  end;

  Msg.Result := 0;

  Application.BringToFront;
end;

{ wyróznia kwerende w edytorze }
procedure TFrameScriptEdit.HighlightScriptByQueryItem;
var lFirstToken, lLastToken: TGtLexToken;
begin
  ScriptEdit.SelLength := 0;

  if not Assigned(aQueryItem) then Exit;

  lFirstToken := aQueryItem.GetFirstToken;
  if Assigned(lFirstToken) then begin
    lLastToken := aQueryItem.GetLastToken;

    if Assigned(lLastToken)
      then RichEditSetSelection(ScriptEdit,
                                lFirstToken.Line, lFirstToken.Pos -1,
                                lLastToken.Line,  lLastToken.Pos  -1 + lLastToken.Len);
  end;

  if aOnHighlightAction and Assigned(OnHighlightScriptByQueryItem) then OnHighlightScriptByQueryItem(aQueryItem);

  if ScriptEdit.Visible then ScriptEdit.SetFocus;
end;

{ set frame visible }
procedure TFrameScriptEdit.FrameScriptEdit_Visible;
begin
  if Visible then SetFocus;
end;

end.

