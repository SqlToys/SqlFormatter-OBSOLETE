(* $Header: /SQL Toys/SqlFormatter/FormSettings.pas 98    18-01-08 9:37 Tomek $
   (c) Tomasz Gierka, github.com/SqlToys, 2012.03.31                          *)
{--------------------------------------  --------------------------------------}
{$IFDEF RELEASE}
  {$DEBUGINFO OFF}
  {$LOCALSYMBOLS OFF}
{$ENDIF}
unit FormSettings;

interface

uses Forms, Controls, StdCtrls, ComCtrls, Classes, ExtCtrls, Graphics,
     SqlTokenizers, SqlLister, SqlCommon;

type
  TYaSettingsAction = ( yacsGetFromRegistry, yacsPutToRegistry, yacsDefault );

type
  TFormSettings = class(TForm)

    PanelBtn: TPanel;
    BtnCancel: TButton;
    BtnOK: TButton;
    BtnReset: TButton;
    BtnStored: TButton;
    ButtonEditFont: TButton;
    ButtonGridFont: TButton;
    GroupBoxLines: TGroupBox;
    Label2: TLabel;
    ChkBoxEmptyLineAfterQuery: TCheckBox;
    ChkBoxEmptyLinesBeforeClauses: TCheckBox;
    ChkBoxEmptyLinesAroundUnion: TCheckBox;
    ChkBoxEmptyLinesBeforeClausesExcSubqueries: TCheckBox;
    ChkBoxEmptyLinesBeforeClausesExcShortQuery: TCheckBox;
    EditShortQuery: TEdit;
    EditLinesNoAfterQuery: TEdit;
    ChkBoxLinesNoAfterQuery: TCheckBox;
    GroupBoxSpacings: TGroupBox;
    ChkBoxSpaceBeforeComma: TCheckBox;
    ChkBoxSpaceBeforeSemicolon: TCheckBox;
    ChkBoxSpaceOutsideBrackets: TCheckBox;
    ChkBoxSpaceInsideBrackets: TCheckBox;
    ChkBoxSpaceAroundOperator: TCheckBox;
    ChkBoxSpaceAfterComma: TCheckBox;
    ChkBoxSpaceInsideBracketsSkipOnFun: TCheckBox;
    ChkBoxSpaceInsideBracketsSkipOnDatatype: TCheckBox;
    GroupBoxIntendation: TGroupBox;
    LabelSetMaxLen: TLabel;
    ChkBoxOneExprOnLine: TCheckBox;
    ChkBoxCommaAtNewLine: TCheckBox;
    ChkBoxOneCondOnLine: TCheckBox;
    ChkBoxSetLeftExprIntend: TCheckBox;
    EditSetMaxLen: TEdit;
    GroupBox3: TGroupBox;
    LabelTableNameCase: TLabel;
    LabelColumnNameCase: TLabel;
    LabelTableAliasCase: TLabel;
    LabelColumnAliasCase: TLabel;
    LabelParameterCase: TLabel;
    LabelIdentifierCase: TLabel;
    LabelKeywordCase: TLabel;
    LabelColumnQuotedAliasCase: TLabel;
    LabelFunctionCase: TLabel;
    ComboBoxTableNameCase: TComboBox;
    ComboBoxColumnNameCase: TComboBox;
    ComboBoxTableAliasCase: TComboBox;
    ComboBoxColumnAliasCase: TComboBox;
    ComboBoxParameterCase: TComboBox;
    ComboBoxIdentifierCase: TComboBox;
    ComboBoxKeywordCase: TComboBox;
    ComboBoxColumnQuotedAliasCase: TComboBox;
    ComboBoxFunctionCase: TComboBox;
    GroupBox4: TGroupBox;
    ChkBoxCaseAtNewLine: TCheckBox;
    ChkBoxCaseWhenAtNewLine: TCheckBox;
    ChkBoxCaseThenAtNewLine: TCheckBox;
    ChkBoxCaseElseAtNewLine: TCheckBox;
    ChkBoxCaseEndAtNewLine: TCheckBox;
    GroupBox2: TGroupBox;
    ChkBoxSelectAliasIntend: TCheckBox;
    ChkBoxExprAs: TCheckBox;
    CheckBoxExtQueryKeywordStyle: TCheckBox;
    GroupBox1: TGroupBox;
    LabelTableMaxLen: TLabel;
    LabelAliasMaxLen: TLabel;
    ChkBoxFromTableAndAliasIntend: TCheckBox;
    EditTableMaxLen: TEdit;
    EditAliasMaxLen: TEdit;
    ChkBoxOnCondIntend: TCheckBox;
    CheckBoxJoinCondLeftSideOrder: TCheckBox;
    ChkBoxInnerJoins: TCheckBox;
    ChkBoxOuterJoins: TCheckBox;
    ChkBoxTableAs: TCheckBox;
    CheckBoxJoinCondRefsFirst: TCheckBox;
    GroupBoxCreateTable: TGroupBox;
    LabelColMaxLen: TLabel;
    LabelMaxDatatypeLen: TLabel;
    CheckBoxCreateTableColConstrBreakLine: TCheckBox;
    CheckBoxCreateTableColConstrNewLineAfter: TCheckBox;
    ChkBoxCreateTableColDatatypeIntend: TCheckBox;
    EditColMaxLen: TEdit;
    EditMaxDataTypeLen: TEdit;
    ChkBoxCreateTableEmptyLineBeforeComplexContraints: TCheckBox;
    GroupBoxOrderBy: TGroupBox;
    ChkBoxSortShort: TCheckBox;
    ChkBoxSkipAscending: TCheckBox;
    GroupBox5: TGroupBox;
    LabelMaxClauseKeywordIntend: TLabel;
    LabelMaxIdentifierLength: TLabel;
    ChkBoxNoSemicolonOnSingleQuery: TCheckBox;
    ChkBoxColumnConstraint: TCheckBox;
    ChkBoxRightIntend: TCheckBox;
    EditMaxClauseKeywordIntend: TEdit;
    EditMaxIdentifierLength: TEdit;

    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);

    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure BtnResetClick(Sender: TObject);
    procedure BtnStoredClick(Sender: TObject);

    procedure ButtonEditFontClick(Sender: TObject);

    procedure ChkBoxAction       (aAction: TYaSettingsAction);
    procedure ComboAction        (aAction: TYaSettingsAction);
    procedure EditAction         (aAction: TYaSettingsAction);
    procedure ButtonGridFontClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ScriptEditFont, DBGridFont: TFont;
  end;

type
  TYaIntSettings = ( yastWindowTop, yastWindowLeft, yastWindowState, yastWindowHeight, yastWindowWidth,
                     yastSplitterWidth, yastSplitterHeight, yastEditFontSize, yastGridFontSize );

var
  YA_SET_INT_ARR : array [ TYaIntSettings ]
  of record Key: TYaRegKey; Reg: String; Def: Integer end
  = ( (Key: yarkCommon;   Reg: 'MainWindowTop';     Def: 0),
      (Key: yarkCommon;   Reg: 'MainWindowLeft';    Def: 0),
      (Key: yarkCommon;   Reg: 'MainWindowState';   Def: Ord(wsNormal)),
      (Key: yarkCommon;   Reg: 'MainWindowHeight';  Def: 600),
      (Key: yarkCommon;   Reg: 'MainWindowWidth';   Def: 800),
      (Key: yarkCommon;   Reg: 'TreePanelWidth';    Def: 200),
      (Key: yarkCommon;   Reg: 'TreePanelHeight';   Def: 100),
      (Key: yarkCommon;   Reg: 'EditFontSize';      Def: 13),
      (Key: yarkCommon;   Reg: 'GridFontSize';      Def: 13)
  );

procedure YaRegistryPutInt(aSett: TYaIntSettings; aValue: Integer; aForce: Boolean = False);
function  YaRegistryGetInt(aSett: TYaIntSettings; aValue: Integer = 0): Integer;

type
  TYaStrSettings = ( yastEditFontName, yastLastConnection, yastGridFontName );

var
  YA_SET_STR_ARR : array [ TYaStrSettings ]
  of record Key: TYaRegKey; Reg: String; Def: String end
  = ( (Key: yarkCommon;   Reg: 'EditFontName';      Def: 'Courier New'),
      (Key: yarkCommon;   Reg: 'LastConnection';    Def: ''),
      (Key: yarkCommon;   Reg: 'GridFontName';      Def: 'Courier New')
  );

procedure YaRegistryPutStr(aSett: TYaStrSettings; aValue: String; aForce: Boolean = False);
function  YaRegistryGetStr(aSett: TYaStrSettings; aValue: String = ''): String;

{------------------------------- Font functions -------------------------------}

const
  YA_MIN_FONT_SIZE = 8;
  YA_MAX_FONT_SIZE = 24;

function YaFontDialog(aFont: TFont): TFont;

{------------------------------- Default Values -------------------------------}

implementation

uses Dialogs, SysUtils,
     GtRegistry,
     SqlVersion;

{$R *.dfm}

{ form show }
procedure TFormSettings.FormShow(Sender: TObject);
begin
  Caption := VER_NAME + ' - Settings...';

  BtnStoredClick(Sender);
end;

{ button OK }
procedure TFormSettings.BtnOKClick(Sender: TObject);
begin
  rguDeleteKey( YA_SETTINGS_KEY );
  rguPutStr(YA_VERSION_KEY, VER_NUMBER);

  { commons }
  EditAction(yacsPutToRegistry);
  ComboAction(yacsPutToRegistry);
  ChkBoxAction(yacsPutToRegistry);

  { Close }
  Close;
end;

{ Form Key Press Event }
procedure TFormSettings.FormKeyPress(Sender: TObject; var Key: Char);
begin
  { Escape key - Close Form }
  if Key = #27 then Close;
end;

{ reset to defaults }
procedure TFormSettings.BtnResetClick(Sender: TObject);
begin
  { commons }
  EditAction(yacsDefault);
  ComboAction(yacsDefault);
  ChkBoxAction(yacsDefault);
end;

{ recall stored values }
procedure TFormSettings.BtnStoredClick(Sender: TObject);
begin
  { commons }
  EditAction(yacsGetFromRegistry);
  ComboAction(yacsGetFromRegistry);
  ChkBoxAction(yacsGetFromRegistry);
end;

{ calls Font Dialog for Edit }
procedure TFormSettings.ButtonEditFontClick(Sender: TObject);
begin
  ScriptEditFont := YaFontDialog( ScriptEditFont );
end;

{ calls Font Dialog for Grid }
procedure TFormSettings.ButtonGridFontClick(Sender: TObject);
begin
  DBGridFont := YaFontDialog( DBGridFont );
end;

{ puts YA Integer Setting }
procedure YaRegistryPutInt(aSett: TYaIntSettings; aValue: Integer; aForce: Boolean = False);
begin
  if aForce or (aValue <> YA_SET_INT_ARR [ aSett ].Def)
    then rguPutInt(YaRegKey(YA_SET_INT_ARR [ aSett ].Key) + YA_SET_INT_ARR [ aSett ].Reg, aValue)
    else rguDeleteVal(YaRegKey(YA_SET_INT_ARR [ aSett ].Key) + YA_SET_INT_ARR [ aSett ].Reg);
end;

{ gets YA Integer Setting }
function  YaRegistryGetInt(aSett: TYaIntSettings; aValue: Integer = 0): Integer;
begin
  if aValue = 0 then aValue := YA_SET_INT_ARR [ aSett ].Def;
  Result := rguGetInt(YaRegKey(YA_SET_INT_ARR [ aSett ].Key) + YA_SET_INT_ARR [ aSett ].Reg, aValue);
end;

{ puts YA Integer Setting }
procedure YaRegistryPutStr(aSett: TYaStrSettings; aValue: String; aForce: Boolean = False);
begin
  if aForce or (aValue <> YA_SET_STR_ARR [ aSett ].Def)
    then rguPutStr(YaRegKey(YA_SET_STR_ARR [ aSett ].Key) + YA_SET_STR_ARR [ aSett ].Reg, aValue)
    else rguDeleteVal(YaRegKey(YA_SET_STR_ARR [ aSett ].Key) + YA_SET_STR_ARR [ aSett ].Reg);
end;

{ gets YA Integer Setting }
function  YaRegistryGetStr(aSett: TYaStrSettings; aValue: String = ''): String;
begin
  if aValue = '' then aValue := YA_SET_STR_ARR [ aSett ].Def;
  Result := rguGetStr(YaRegKey(YA_SET_STR_ARR [ aSett ].Key) + YA_SET_STR_ARR [ aSett ].Reg, aValue);
end;

{ sets chain between visual controls and their ids }
procedure TFormSettings.ChkBoxAction(aAction: TYaSettingsAction);

  procedure LocalAction(aAction: TYaSettingsAction; aSetting: TGtListerSettings; aCheckBox: TCheckBox);
  begin
    case aAction of
      yacsGetFromRegistry:  aCheckBox.Checked := GtRegistryGetBool (aSetting);
      yacsPutToRegistry:    GtRegistryPutBool(aSetting, aCheckBox.Checked);
      yacsDefault:          aCheckBox.Checked := GT_SET_BOOL_ARR [aSetting].Def;
    end;
  end;

  procedure LocalAction2(aAction: TYaSettingsAction; aSetting: TYaBoolSettings; aCheckBox: TCheckBox);
  begin
    case aAction of
      yacsGetFromRegistry:  aCheckBox.Checked := YaRegistryGetBool (aSetting);
      yacsPutToRegistry:    YaRegistryPutBool(aSetting, aCheckBox.Checked);
      yacsDefault:          aCheckBox.Checked := YA_SET_BOOL_ARR [aSetting].Def;
    end;
  end;

begin
  LocalAction (aAction, gtstExtQueryKeywordStyle,    CheckBoxExtQueryKeywordStyle);

  { general }
  LocalAction (aAction, gtstNoSemicolonOnSingleQuery,ChkBoxNoSemicolonOnSingleQuery);
  LocalAction (aAction, gtstJoinCondLeftSideOrderCONVERTER,CheckBoxJoinCondLeftSideOrder);
  LocalAction (aAction, gtstOnCondRefsFirstCONVERTER,CheckBoxJoinCondRefsFirst);

  { lines }
  LocalAction(aAction, gtstLineAfterQuery,          ChkBoxEmptyLineAfterQuery);
  LocalAction(aAction, gtstLinesNoAfterQuery,       ChkBoxLinesNoAfterQuery);
  LocalAction(aAction, gtstEmptyLineBeforeClause,   ChkBoxEmptyLinesBeforeClauses);
  LocalAction(aAction, gtstEmptyLineBeforeClauseSkipSubquery,ChkBoxEmptyLinesBeforeClausesExcSubqueries);
  LocalAction(aAction, gtstEmptyLineBeforeClauseSkipShort,ChkBoxEmptyLinesBeforeClausesExcShortQuery);
  LocalAction(aAction, gtstEmptyLineAroundUnion,    ChkBoxEmptyLinesAroundUnion);

  { CREATE TABLE }
  LocalAction(aAction, gtstCreateTable_ColConsBreakLine,CheckBoxCreateTableColConstrBreakLine);
  LocalAction(aAction, gtstCreateTable_ColConsNewLineAfter,CheckBoxCreateTableColConstrNewLineAfter);
  LocalAction(aAction, gtstCreateTable_Intend,       ChkBoxCreateTableColDatatypeIntend);
  LocalAction(aAction, gtstCreateTable_EmptyLineBefComplexConstr,ChkBoxCreateTableEmptyLineBeforeComplexContraints);

  { spacings }
  LocalAction(aAction, gtstRightIntend,             ChkBoxRightIntend);
  LocalAction(aAction, gtstSpaceBeforeSemicolon,    ChkBoxSpaceBeforeSemicolon);
  LocalAction(aAction, gtstSpaceInsideBrackets,     ChkBoxSpaceInsideBrackets);
  LocalAction(aAction, gtstSpaceInsideBracketsSkipFun,ChkBoxSpaceInsideBracketsSkipOnFun);
  LocalAction(aAction, gtstSpaceInsideBracketsSkipDatatype,ChkBoxSpaceInsideBracketsSkipOnDatatype);
  LocalAction(aAction, gtstSpaceOutsideBrackets,    ChkBoxSpaceOutsideBrackets);
  LocalAction(aAction, gtstSpaceAroundOperator,     ChkBoxSpaceAroundOperator);
  LocalAction(aAction, gtstSpaceBeforeComma,        ChkBoxSpaceBeforeComma);
  LocalAction(aAction, gtstSpaceAfterComma,         ChkBoxSpaceAfterComma);

  { intendation }
  LocalAction(aAction, gtstOneExprOnLine,           ChkBoxOneExprOnLine);
  LocalAction(aAction, gtstCommaAtNewLine,          ChkBoxCommaAtNewLine);
  LocalAction(aAction, gtstOneCondOnLine,           ChkBoxOneCondOnLine);
  LocalAction(aAction, gtstCaseAtNewLine,           ChkBoxCaseAtNewLine);
  LocalAction(aAction, gtstCaseWhenAtNewLine,       ChkBoxCaseWhenAtNewLine);
  LocalAction(aAction, gtstCaseThenAtNewLine,       ChkBoxCaseThenAtNewLine);
  LocalAction(aAction, gtstCaseElseAtNewLine,       ChkBoxCaseElseAtNewLine);
  LocalAction(aAction, gtstCaseEndAtNewLine,        ChkBoxCaseEndAtNewLine);
  LocalAction(aAction, gtstTableAndAliasIntend,     ChkBoxFromTableAndAliasIntend);
  LocalAction(aAction, gtstSetExprIntend,           ChkBoxSetLeftExprIntend);
  LocalAction(aAction, gtstOnCondIntend,            ChkBoxOnCondIntend);

  { keywords }
  LocalAction(aAction, gtstExprAsKeywordCONVERTER,  ChkBoxExprAs);
  LocalAction(aAction, gtstTableAsKeywordCONVERTER, ChkBoxTableAs);
  LocalAction(aAction, gtstColumnConstraint,        ChkBoxColumnConstraint);
  LocalAction(aAction, gtstInnerJoinCONVERTER,      ChkBoxInnerJoins);
  LocalAction(aAction, gtstOuterJoinCONVERTER,      ChkBoxOuterJoins);
  LocalAction(aAction, gtstSortShortCONVERTER,      ChkBoxSortShort);
  LocalAction(aAction, gtstSkipAscendingCONVERTER,  ChkBoxSkipAscending);

  { case }
  LocalAction(aAction, gtstSelectAliasIntend,       ChkBoxSelectAliasIntend);
end;

{ sets chain between visual controls and their ids }
procedure TFormSettings.ComboAction(aAction: TYaSettingsAction);

  procedure LocalAction(aAction: TYaSettingsAction; aSetting: TGtListerCaseSettings; aComboBox: TComboBox);
  begin
    case aAction of
      yacsGetFromRegistry:  aComboBox.ItemIndex := Ord(GtRegistryGetCase(aSetting));
      yacsPutToRegistry:    GtRegistryPutCase(aSetting, aComboBox.ItemIndex);
      yacsDefault:          aComboBox.ItemIndex := Ord(GT_SET_CASE_ARR [aSetting].Def);
    end;
  end;

begin
  LocalAction (aAction, gtlcTableCONVERTER,            ComboBoxTableNameCase);
  LocalAction (aAction, gtlcColumnCONVERTER,           ComboBoxColumnNameCase);
  LocalAction (aAction, gtlcTableAliasCONVERTER,       ComboBoxTableAliasCase);
  LocalAction (aAction, gtlcColumnAliasCONVERTER,      ComboBoxColumnAliasCase);
  LocalAction (aAction, gtlcColumnQuotedAliasCONVERTER,ComboBoxColumnQuotedAliasCase);
  LocalAction (aAction, gtlcParameterCONVERTER,        ComboBoxParameterCase);
  LocalAction (aAction, gtlcIdentifierCONVERTER,       ComboBoxIdentifierCase);
  LocalAction (aAction, gtlcKeyword,                   ComboBoxKeywordCase);
  LocalAction (aAction, gtlcFunctionCONVERTER,         ComboBoxFunctionCase);
end;

{ sets chain between visual controls and their ids }
procedure TFormSettings.EditAction(aAction: TYaSettingsAction);

  procedure LocalAction(aAction: TYaSettingsAction; aReg: String; aEdit: TEdit; aDef: String);
  begin
    case aAction of
      yacsGetFromRegistry:  aEdit.Text := rguGetStr(aReg, aDef);
      yacsPutToRegistry:    rguPutStr(aReg, aEdit.Text);
      yacsDefault:          aEdit.Text := aDef;
    end;
  end;

begin
  LocalAction(aAction, YA_SET_KEY_TAB_MAX_LEN,          EditTableMaxLen, '30');
  LocalAction(aAction, YA_SET_KEY_ALIAS_MAX_LEN,        EditAliasMaxLen, '10');

  LocalAction(aAction, YA_SET_KEY_SET_MAX_LEN,          EditSetMaxLen,   '30'); // 20

  LocalAction(aAction, YA_SET_KEY_COL_MAX_LEN,          EditColMaxLen, '20');
  LocalAction(aAction, YA_SET_KEY_TYPE_MAX_LEN,         EditMaxDataTypeLen, '20');

  LocalAction(aAction, YA_SET_KEY_SHORT_QUERY,          EditShortQuery, '20');
  LocalAction(aAction, YA_SET_KEY_MAX_CLAUSE_KEYWORD_INT, EditMaxClauseKeywordIntend, '15');
  LocalAction(aAction, YA_SET_KEY_MAX_IDENTIFIER_LEN,   EditMaxIdentifierLength, '30');

  LocalAction(aAction, YA_SET_KEY_LINES_AFTER_QUERY,    EditLinesNoAfterQuery, '3');
end;

{------------------------------- Font functions -------------------------------}

{ calls Font Dialog for Edit }
function YaFontDialog(aFont: TFont): TFont;
var Dlg : TFontDialog;
begin
  Result := aFont;
  if Assigned(Result) then Result.Style := [];

  Dlg := TFontDialog.Create(Application.MainForm);
  try
    Dlg.Font.Assign( aFont );
    Dlg.Font.Style := [];
    Dlg.Options := [fdFixedPitchOnly, fdApplyButton, fdLimitSize];

    Dlg.MinFontSize := YA_MIN_FONT_SIZE;
    Dlg.MaxFontSize := YA_MAX_FONT_SIZE;

    if Dlg.Execute then begin
      Result.Assign( Dlg.Font );
      Result.Style := [];
    end;
  finally
    Dlg.Free;
  end;
end;

end.

