(* $Header: /SQL Toys/SqlFormatter/FormFind.pas 24    17-12-16 19:57 Tomek $
   (c) Tomasz Gierka, github.com/SqlToys, 2012.04.11                          *)
{--------------------------------------  --------------------------------------}
{$IFDEF RELEASE}
  {$DEBUGINFO OFF}
  {$LOCALSYMBOLS OFF}
{$ENDIF}
unit FormFind;

interface

uses Forms, ComCtrls, StdCtrls, Controls, Classes, ExtCtrls, System.Actions,
     Vcl.ActnList;

type
  TFormFindReplace = class(TForm)
    LeftPanel: TPanel;

    FindReplacePanel: TPanel;
    FindTextLabel: TLabel;
    ReplaceTextLabel: TLabel;
    FindTextComboBox: TComboBox;
    ReplaceTextComboBox: TComboBox;

    OptionsPanel: TPanel;
    OptionsGroupBox: TGroupBox;
    CaseSesitiveCheckBox: TCheckBox;
    WholeWordsCheckBox: TCheckBox;
    PromptOnReplace: TCheckBox;

    DirectionGroupBox: TGroupBox;
    ForwardRadioButton: TRadioButton;
    BackwardRadioButton: TRadioButton;

    ButtonsPanel: TPanel;
    FindButton: TButton;
    ReplaceButton: TButton;
    ReplaceAllButton: TButton;

    ProgressBar1: TProgressBar;
    ActionList1: TActionList;
    actFindCopy: TAction;
    actFindPaste: TAction;
    actFindCut: TAction;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure StoreFindMRU;
    procedure StoreReplaceMRU;

    function  PositionInsideScanRange(var aLine, aPos: Integer): Boolean;
    procedure ExtendToWholeWord(var aLine, aPos, aLen: Integer; aLeftExtend, aRightExtend: Boolean);
    function  StringsEqual(aLine, aPos, aLen: Integer): Boolean;
    function  FindString(aLine, aPos, aLen: Integer): Integer;
    function  Find(aShowNotFoundMsg: Boolean = True; aSelectFoundStr: Boolean = True): Boolean;
    function  AskReplace: Integer;

    procedure FindButtonClick(Sender: TObject);
    procedure ReplaceButtonClick(Sender: TObject);
    procedure ReplaceAllButtonClick(Sender: TObject);
    procedure actFindCopyExecute(Sender: TObject);
    procedure actFindPasteExecute(Sender: TObject);
    procedure actFindCutExecute(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    ScriptEdit: TRichEdit;
    LastAction: Integer;
  end;

var
  FormFindReplace: TFormFindReplace;

implementation

uses Windows, SysUtils, Dialogs, System.UITypes, Clipbrd,
     GtVisual, GtRegistry, SqlCommon;

{$R *.dfm}

{ Form Create Event }
procedure TFormFindReplace.FormCreate(Sender: TObject);
var i: Integer;
    s: String;
begin
  { Options }
  CaseSesitiveCheckBox.Checked := rguGetBool(GT_FIND_REPLACE_KEY_OPT_CASE_SENSITIVE, False);
  WholeWordsCheckBox.Checked   := rguGetBool(GT_FIND_REPLACE_KEY_OPT_WHOLE_WORDS, False);
  PromptOnReplace.Checked      := rguGetBool(GT_FIND_REPLACE_KEY_OPT_PROMPT_REPLACE, True);

  { Direction }
  case rguGetInt(GT_FIND_REPLACE_KEY_OPT_DIRECTION, 0) of
    1: BackwardRadioButton.Checked := True;
  else ForwardRadioButton.Checked  := True;
  end;

  { MRU's }
  FindTextComboBox.Items.Clear;
  ReplaceTextComboBox.Items.Clear;
  for i := 0 to 9 do begin
    s := rguGetStr(GT_FIND_REPLACE_KEY_FIND_TEXT + IntToStr(i));
    if s <> '' then FindTextComboBox.Items.Insert(FindTextComboBox.Items.Count, s);

    s := rguGetStr(GT_FIND_REPLACE_KEY_REPLACE_TEXT + IntToStr(i));
    if s <> '' then ReplaceTextComboBox.Items.Insert(ReplaceTextComboBox.Items.Count, s);
  end;
end;

{ Form Show Event }
procedure TFormFindReplace.FormShow(Sender: TObject);
var {i, i2, j,} lstart, lstop: Integer;
    s: String;
begin
  LastAction := 0;

  { Find string }
  if ScriptEdit.SelLength > 0 then begin
    { get selected text }
    FindTextComboBox.Text := ScriptEdit.SelText;
  end else begin
    s := ScriptEdit.Lines[ScriptEdit.CaretPos.Y];

    { go back, to begin of a word }
    lstart := ScriptEdit.CaretPos.X + 1;
    while (lstart > 1) and CharInSet(s[lstart - 1], ['a'..'z','A'..'Z','0'..'9'])
       do Dec(lstart);

    { go forward, to end of a word }
    lstop := lstart;
    while (lstop + 1 <= Length(s)) and CharInSet(s[lstop + 1], ['a'..'z','A'..'Z','0'..'9'])
       do Inc(lstop);

    if lstop > lstart
      then FindTextComboBox.Text := Copy(s, lstart, lstop - lstart + 1)
      else FindTextComboBox.Text := '';
  end;
end;

{ Form Close Event }
procedure TFormFindReplace.FormClose(Sender: TObject; var Action: TCloseAction);
var i: Integer;
begin
  FormFindReplace := nil;
  Action := caHide;

  rguDeleteKey( GT_FIND_REPLACE_KEY );

  { Options }
  rguPutBool(GT_FIND_REPLACE_KEY_OPT_CASE_SENSITIVE, CaseSesitiveCheckBox.Checked);
  rguPutBool(GT_FIND_REPLACE_KEY_OPT_WHOLE_WORDS,    WholeWordsCheckBox.Checked);
  rguPutBool(GT_FIND_REPLACE_KEY_OPT_PROMPT_REPLACE, PromptOnReplace.Checked);

  { Direction }
  if BackwardRadioButton.Checked then rguPutInt(GT_FIND_REPLACE_KEY_OPT_DIRECTION, 1)
                                 else rguPutInt(GT_FIND_REPLACE_KEY_OPT_DIRECTION, 0);

  { Find Text MRU }
  for i := 0 to 9 do
    if i < FindTextComboBox.Items.Count
      then rguPutStr(GT_FIND_REPLACE_KEY_FIND_TEXT + IntToStr(i), FindTextComboBox.Items[i]);

  { Replace Text MRU }
  for i := 0 to 9 do
    if i < ReplaceTextComboBox.Items.Count
      then rguPutStr(GT_FIND_REPLACE_KEY_REPLACE_TEXT + IntToStr(i), ReplaceTextComboBox.Items[i]);
end;

{ Form Key Press Event }
procedure TFormFindReplace.FormKeyPress(Sender: TObject; var Key: Char);
begin
  { Escape key - Close Form }
  if Key = #27 then Close;
end;

{ Store Find Text value to MRU }
procedure TFormFindReplace.StoreFindMRU;
var s: String;
begin
  s := FindTextComboBox.Text;
  if Trim(s) = '' then Exit;

  // while FindTextComboBox.ItemIndex <> -1 do FindTextComboBox.Items.Delete(FindTextComboBox.ItemIndex);
  while FindTextComboBox.Items.IndexOf(s) <> -1
     do FindTextComboBox.Items.Delete(FindTextComboBox.Items.IndexOf(s));

  FindTextComboBox.Items.Insert( 0, s );
  FindTextComboBox.Text := s;
end;

{ Store Replace Text value to MRU }
procedure TFormFindReplace.StoreReplaceMRU;
begin
  while ReplaceTextComboBox.Items.IndexOf(ReplaceTextComboBox.Text) <> -1
     do ReplaceTextComboBox.Items.Delete(ReplaceTextComboBox.Items.IndexOf(ReplaceTextComboBox.Text));

  if Trim(ReplaceTextComboBox.Text) = '' then Exit;

  ReplaceTextComboBox.Items.Insert( 0, ReplaceTextComboBox.Text );
end;

{ validates position and checks scan range }
function TFormFindReplace.PositionInsideScanRange(var aLine, aPos: Integer): Boolean;
begin
  Result := False;

  if aLine < 0 then Exit;
  if aLine > ScriptEdit.Lines.Count then Exit;

  while aPos  < 0 do begin
    Dec(aLine);
    if (aLine < 0)
      then Exit
      else Inc(aPos, Length(ScriptEdit.Lines[aLine]));
  end;

  while (aPos >= Length(ScriptEdit.Lines[aLine])) and (ScriptEdit.Lines[aLine] <> '')do begin
    Dec(aPos, Length(ScriptEdit.Lines[aLine]));
    Inc(aLine);

    if aLine > ScriptEdit.Lines.Count -1 then Exit;
  end;

  Result := True;
end;

{ extends script reference to contain whole word }
procedure TFormFindReplace.ExtendToWholeWord(var aLine, aPos, aLen: Integer; aLeftExtend, aRightExtend: Boolean);
begin
  if WholeWordsCheckBox.Checked then begin
    { left side }
    while aLeftExtend and (aPos > 0)
       and CharInSet(ScriptEdit.Lines[aLine][aPos +1 -1], ['a'..'z','A'..'Z','0'..'9','_']) do begin
      Dec(aPos);
      Inc(aLen);
    end;

    { right side }
    while aRightExtend and (aPos +1 + aLen < Length(ScriptEdit.Lines[aLine]))
       and CharInSet(ScriptEdit.Lines[aLine][aPos +1 + aLen], ['a'..'z','A'..'Z','0'..'9','_']) do begin
      Inc(aLen);
    end;
  end;
end;

{ checks if strings are equal due to case and whole words rules }
function TFormFindReplace.StringsEqual(aLine, aPos, aLen: Integer): Boolean;
var lStr: String;
begin
  Result := False;

  ExtendToWholeWord(aLine, aPos, aLen, True, True);

  if aLen = Length(FindTextComboBox.Text) then begin
    lStr := Copy(ScriptEdit.Lines[aLine], aPos +1, aLen);

    if CaseSesitiveCheckBox.Checked
      then Result := lStr = FindTextComboBox.Text
      else Result := AnsiUpperCase(lStr) = AnsiUpperCase(FindTextComboBox.Text);
  end;
end;

{ find string - internal }
function TFormFindReplace.FindString(aLine, aPos, aLen: Integer): Integer;
var lStr: String;
    i, oPos: Integer;
begin
  Result := 0;
  if not Assigned(ScriptEdit.Lines) then Exit;

  oPos := aPos;
  repeat
    ExtendToWholeWord(aLine, aPos, aLen, BackwardRadioButton.Checked, ForwardRadioButton.Checked);

    lStr := Copy(ScriptEdit.Lines[aLine], aPos +1, aLen);

    if CaseSesitiveCheckBox.Checked
      then i := Pos(FindTextComboBox.Text, lStr)
      else i := Pos(AnsiUpperCase(FindTextComboBox.Text), AnsiUpperCase(lStr));

    if i > 0 then begin
      if StringsEqual(aLine, aPos + i -1, Length(FindTextComboBox.Text)) then begin
        Result := i + aPos - oPos;
      end else begin
        Inc(aPos, i-1 + Length(FindTextComboBox.Text));
        Dec(aLen, i-1 + Length(FindTextComboBox.Text));
      end;
    end;
  until (Result > 0) or (i = 0);
end;

{ Find - internal }
function TFormFindReplace.Find;
var i, lLine, lPos: Integer;
begin
  Result := False;
  if not Assigned(ScriptEdit.Lines) then Exit;

  lLine := ScriptEdit.CaretPos.Y;
  lPos  := ScriptEdit.CaretPos.X;

  if ForwardRadioButton.Checked then begin
    { Forward }
    while not Result and PositionInsideScanRange(lLine, lPos) do begin

      i := FindString(lLine, lPos, 999999);
      if i > 0 then begin
        { found }
        Inc(lPos, i-1);

        Result := True;
      end else begin
        { not found }
        Inc(lLine);
        lPos := 0;
      end;
    end;
  end else begin
    { Backward }
    if (ScriptEdit.SelLength <> 0) and
        StringsEqual(lLine, lPos - Length(FindTextComboBox.Text), Length(FindTextComboBox.Text)) then begin
      Dec(lPos, Length(FindTextComboBox.Text) + 1);
    end;

    while not Result and PositionInsideScanRange(lLine, lPos) do begin
      Result := StringsEqual(lLine, lPos, Length(FindTextComboBox.Text));
      if not Result then Dec(lPos);
    end;
  end;

  { set progress bar }
  ProgressBar1.Min       := 0;
  ProgressBar1.Max       := ScriptEdit.Lines.Count -1;
  ProgressBar1.Position  := lLine;

  { message - string not found }
  if not Result and aShowNotFoundMsg then ShowMessage('Search string not found.');

  { select found text }
  if Result and aSelectFoundStr then begin
    ScriptEdit.SelLength := 0;
    RichEditSetSelection(ScriptEdit, lLine, lPos, Length(FindTextComboBox.Text));
    // ScriptEdit.ScrollInView;
  end;
end;

{ Asks for replace }
function  TFormFindReplace.AskReplace: Integer;
begin
  Result := MessageDlg('Replace this occurence of ''' + FindTextComboBox.Text + '''?',
                       mtConfirmation, [mbYes, mbNo, mbCancel], 0);
end;

{ Button Find }
procedure TFormFindReplace.FindButtonClick(Sender: TObject);
begin
  LastAction := 1;

  if not Find then Exit;

  StoreFindMRU;
end;

{ Button Replace }
procedure TFormFindReplace.ReplaceButtonClick(Sender: TObject);
var lLine, lPos: Integer;
begin
  LastAction := 2;

  if ScriptEdit.SelLength = 0 then Exit;

  if not StringsEqual(ScriptEdit.CaretPos.Y, ScriptEdit.CaretPos.X - ScriptEdit.SelLength, ScriptEdit.SelLength) then Exit;

  if PromptOnReplace.Checked and (AskReplace <> mrYes) then Exit;

  StoreReplaceMRU;

  ScriptEdit.SelText := '';

  lLine := ScriptEdit.CaretPos.Y;
  lPos  := ScriptEdit.CaretPos.X;

  ScriptEdit.SelText := ReplaceTextComboBox.Text;

  RichEditSetSelection(ScriptEdit, lLine, lPos, Length(ReplaceTextComboBox.Text));

  // ScriptEdit.ScrollInView;
end;

{ Button Replace All }
procedure TFormFindReplace.ReplaceAllButtonClick(Sender: TObject);
var Cnt: Integer;
begin
  LastAction := 3;

  Cnt := 0;

  while Find(Cnt=0, True) do begin
    Inc(Cnt);

    if PromptOnReplace.Checked then begin
      case AskReplace of
        mrYes    : ScriptEdit.SelText := ReplaceTextComboBox.Text;
        mrNo     : ;
        mrCancel : Break;
      end;
    end else begin
      ScriptEdit.SelText := ReplaceTextComboBox.Text;
    end;
  end;

  if Cnt > 0 then begin
    StoreReplaceMRU;
    ShowMessage( IntToStr(Cnt) + ' strings replaced.');
  end;
end;

procedure TFormFindReplace.actFindCopyExecute(Sender: TObject);
begin
  if Self.ActiveControl = FindTextComboBox then Clipboard.AsText := FindTextComboBox.SelText;
  if Self.ActiveControl = ReplaceTextComboBox then Clipboard.AsText := ReplaceTextComboBox.SelText;
end;

procedure TFormFindReplace.actFindCutExecute(Sender: TObject);
begin
  actFindCopyExecute(Sender);

  if Self.ActiveControl = FindTextComboBox then FindTextComboBox.SelText := '';
  if Self.ActiveControl = ReplaceTextComboBox then ReplaceTextComboBox.SelText := '';
end;

procedure TFormFindReplace.actFindPasteExecute(Sender: TObject);
begin
  if not Clipboard.HasFormat( CF_TEXT ) then Exit;

  if Self.ActiveControl = FindTextComboBox then FindTextComboBox.SelText := Clipboard.AsText;
  if Self.ActiveControl = ReplaceTextComboBox then ReplaceTextComboBox.SelText := Clipboard.AsText;
end;

end.

