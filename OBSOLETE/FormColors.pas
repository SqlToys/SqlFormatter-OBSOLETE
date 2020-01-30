(* $Header: /SQL Toys/SqlFormatter/FormColors.pas 9     18-04-08 15:18 Tomek $
   (c) Tomasz Gierka, github.com/SqlToys, 2012.03.31                          *)
{--------------------------------------  --------------------------------------}
{$IFDEF RELEASE}
  {$DEBUGINFO OFF}
  {$LOCALSYMBOLS OFF}
{$ENDIF}
unit FormColors;

interface

uses Forms, Controls, StdCtrls, ComCtrls, Classes, ExtCtrls, Graphics,
     GtTokenizers, SqlCommon, SqlLister;

type
  TYaSettingsAction = ( yacsGetFromRegistry, yacsPutToRegistry, yacsDefault );

type
  TFormColors = class(TForm)

    PanelBtn: TPanel;
    BtnCancel: TButton;
    BtnOK: TButton;
    BtnReset: TButton;
    BtnStored: TButton;
    PanelColorStylesMain: TPanel;
    LabelDisabled: TLabel;
    LabelErrors: TLabel;
    LabelComments: TLabel;
    LabelPlainText: TLabel;
    LabelBoldItalicUnderlineMain: TLabel;
    LabelIdentifier: TLabel;
    LabelKeywords: TLabel;
    LabelNumbers: TLabel;
    LabelStrings: TLabel;
    LabelOperators: TLabel;
    EditColorPlainText: TEdit;
    EditColorComments: TEdit;
    EditColorErrors: TEdit;
    EditColorDisabled: TEdit;
    ButtonColorPlainText: TButton;
    ButtonColorComments: TButton;
    ButtonColorErrors: TButton;
    ButtonColorDisabled: TButton;
    CheckBoxUnderlineDisabled: TCheckBox;
    CheckBoxItalicDisabled: TCheckBox;
    CheckBoxBoldDisabled: TCheckBox;
    CheckBoxBoldErrors: TCheckBox;
    CheckBoxItalicErrors: TCheckBox;
    CheckBoxUnderlineErrors: TCheckBox;
    CheckBoxUnderlineComments: TCheckBox;
    CheckBoxItalicComments: TCheckBox;
    CheckBoxBoldComments: TCheckBox;
    CheckBoxBoldPlainText: TCheckBox;
    CheckBoxItalicPlainText: TCheckBox;
    CheckBoxUnderlinePlainText: TCheckBox;
    EditColorIdentifiers: TEdit;
    ButtonColorIdentifiers: TButton;
    CheckBoxBoldIdentifiers: TCheckBox;
    CheckBoxItalicIdentifiers: TCheckBox;
    CheckBoxUnderlineIdentifiers: TCheckBox;
    EditColorKeywords: TEdit;
    ButtonColorKeywords: TButton;
    CheckBoxBoldKeywords: TCheckBox;
    CheckBoxItalicKeywords: TCheckBox;
    CheckBoxUnderlineKeywords: TCheckBox;
    EditColorOperators: TEdit;
    EditColorStrings: TEdit;
    EditColorNumbers: TEdit;
    ButtonColorNumbers: TButton;
    ButtonColorStrings: TButton;
    ButtonColorOperators: TButton;
    CheckBoxBoldOperators: TCheckBox;
    CheckBoxItalicOperators: TCheckBox;
    CheckBoxUnderlineOperators: TCheckBox;
    CheckBoxUnderlineStrings: TCheckBox;
    CheckBoxItalicStrings: TCheckBox;
    CheckBoxBoldStrings: TCheckBox;
    CheckBoxBoldNumbers: TCheckBox;
    CheckBoxItalicNumbers: TCheckBox;
    CheckBoxUnderlineNumbers: TCheckBox;
    PanelColorStylesIdentifiers: TPanel;
    LabelTable: TLabel;
    LabelColumn: TLabel;
    LabelTableAlias: TLabel;
    LabelColumnAlias: TLabel;
    LabelFunctions: TLabel;
    LabelBoldItalicUnderlineIdentifiers: TLabel;
    LabelView: TLabel;
    LabelSynonym: TLabel;
    LabelConstraint: TLabel;
    LabelParameters: TLabel;
    LabelTransaction: TLabel;
    LabelExtQueryAliasOrTable: TLabel;
    LabelAggrFunctions: TLabel;
    LabelFunParameters: TLabel;
    EditColorFunctions: TEdit;
    EditColorColumnAliases: TEdit;
    EditColorTableAliases: TEdit;
    EditColorColumns: TEdit;
    EditColorTables: TEdit;
    ButtonColorTables: TButton;
    ButtonColorColumns: TButton;
    ButtonColorTableAliases: TButton;
    ButtonColorColumnAliases: TButton;
    ButtonColorFunctions: TButton;
    CheckBoxUnderlineTables: TCheckBox;
    CheckBoxItalicTables: TCheckBox;
    CheckBoxBoldTables: TCheckBox;
    CheckBoxBoldColumns: TCheckBox;
    CheckBoxBoldTableAliases: TCheckBox;
    CheckBoxBoldColumnAliases: TCheckBox;
    CheckBoxBoldFunctions: TCheckBox;
    CheckBoxItalicFunctions: TCheckBox;
    CheckBoxUnderlineFunctions: TCheckBox;
    CheckBoxItalicColumnAliases: TCheckBox;
    CheckBoxUnderlineColumnAliases: TCheckBox;
    CheckBoxUnderlineTableAliases: TCheckBox;
    CheckBoxItalicTableAliases: TCheckBox;
    CheckBoxItalicColumns: TCheckBox;
    CheckBoxUnderlineColumns: TCheckBox;
    EditColorViews: TEdit;
    ButtonColorViews: TButton;
    CheckBoxBoldViews: TCheckBox;
    CheckBoxItalicViews: TCheckBox;
    CheckBoxUnderlineViews: TCheckBox;
    EditColorSynonyms: TEdit;
    ButtonColorSynonyms: TButton;
    CheckBoxBoldSynonyms: TCheckBox;
    CheckBoxItalicSynonyms: TCheckBox;
    CheckBoxUnderlineSynonyms: TCheckBox;
    EditColorConstraints: TEdit;
    ButtonColorConstraints: TButton;
    CheckBoxBoldConstraints: TCheckBox;
    CheckBoxItalicConstraints: TCheckBox;
    CheckBoxUnderlineConstraints: TCheckBox;
    CheckBoxIdentifiers: TCheckBox;
    EditColorParameters: TEdit;
    ButtonColorParameters: TButton;
    CheckBoxBoldParameters: TCheckBox;
    CheckBoxItalicParameters: TCheckBox;
    CheckBoxUnderlineParameters: TCheckBox;
    EditColorTransactions: TEdit;
    ButtonColorTransactions: TButton;
    CheckBoxBoldTransactions: TCheckBox;
    CheckBoxItalicTransactions: TCheckBox;
    CheckBoxUnderlineTransactions: TCheckBox;
    EditColorExtQueryAliasOrTable: TEdit;
    ButtonColorExtQueryAliasOrTable: TButton;
    CheckBoxBoldExtQueryAliasOrTable: TCheckBox;
    CheckBoxItalicExtQueryAliasOrTable: TCheckBox;
    CheckBoxUnderlineExtQueryAliasOrTable: TCheckBox;
    EditColorAggrFunctions: TEdit;
    ButtonColorAggrFunctions: TButton;
    CheckBoxBoldAggrFunctions: TCheckBox;
    CheckBoxItalicAggrFunctions: TCheckBox;
    CheckBoxUnderlineAggrFunctions: TCheckBox;
    EditColorFunParameters: TEdit;
    ButtonColorFunParameters: TButton;
    CheckBoxBoldFunParameters: TCheckBox;
    CheckBoxItalicFunParameters: TCheckBox;
    CheckBoxUnderlineFunParameters: TCheckBox;
    PanelColorStylesKeywords: TPanel;
    LabelDatatypes: TLabel;
    LabelBoldItalicUnderlineKeywords: TLabel;
    LabelDmlSelect: TLabel;
    LabelDmlInsert: TLabel;
    LabelDmlUpdate: TLabel;
    LabelDmlDelete: TLabel;
    LabelDdlCreate: TLabel;
    LabelDcl: TLabel;
    LabelDdlDrop: TLabel;
    LabelUnion: TLabel;
    LabelDdlModify: TLabel;
    LabelTcl: TLabel;
    LabelNull: TLabel;
    LabelPrior: TLabel;
    LabelDdlCreateView: TLabel;
    EditColorDatatypes: TEdit;
    ButtonColorDatatypes: TButton;
    CheckBoxBoldDatatypes: TCheckBox;
    CheckBoxUnderlineDatatypes: TCheckBox;
    CheckBoxItalicDatatypes: TCheckBox;
    EditColorDmlSelect: TEdit;
    ButtonColorDmlSelect: TButton;
    CheckBoxBoldDmlSelect: TCheckBox;
    CheckBoxItalicDmlSelect: TCheckBox;
    CheckBoxUnderlineDmlSelect: TCheckBox;
    EditColorDmlInsert: TEdit;
    ButtonColorDmlInsert: TButton;
    CheckBoxBoldDmlInsert: TCheckBox;
    CheckBoxItalicDmlInsert: TCheckBox;
    CheckBoxUnderlineDmlInsert: TCheckBox;
    EditColorDmlUpdate: TEdit;
    ButtonColorDmlUpdate: TButton;
    CheckBoxBoldDmlUpdate: TCheckBox;
    CheckBoxItalicDmlUpdate: TCheckBox;
    CheckBoxUnderlineDmlUpdate: TCheckBox;
    EditColorDmlDelete: TEdit;
    ButtonColorDmlDelete: TButton;
    CheckBoxBoldDmlDelete: TCheckBox;
    CheckBoxItalicDmlDelete: TCheckBox;
    CheckBoxUnderlineDmlDelete: TCheckBox;
    EditColorDdlCreate: TEdit;
    ButtonColorDdlCreate: TButton;
    CheckBoxBoldDdlCreate: TCheckBox;
    CheckBoxItalicDdlCreate: TCheckBox;
    CheckBoxUnderlineDdlCreate: TCheckBox;
    EditColorDcl: TEdit;
    ButtonColorDcl: TButton;
    CheckBoxBoldDcl: TCheckBox;
    CheckBoxItalicDcl: TCheckBox;
    CheckBoxUnderlineDcl: TCheckBox;
    EditColorDdlDrop: TEdit;
    ButtonColorDdlDrop: TButton;
    CheckBoxBoldDdlDrop: TCheckBox;
    CheckBoxItalicDdlDrop: TCheckBox;
    CheckBoxUnderlineDdlDrop: TCheckBox;
    EditColorUnion: TEdit;
    ButtonColorUnion: TButton;
    CheckBoxBoldUnions: TCheckBox;
    CheckBoxItalicUnions: TCheckBox;
    CheckBoxUnderlineUnions: TCheckBox;
    EditColorDdlModify: TEdit;
    ButtonColorDdlModify: TButton;
    CheckBoxBoldDdlModify: TCheckBox;
    CheckBoxItalicDdlModify: TCheckBox;
    CheckBoxUnderlineDdlModify: TCheckBox;
    EditColorTcl: TEdit;
    ButtonColorTcl: TButton;
    CheckBoxBoldTcl: TCheckBox;
    CheckBoxItalicTcl: TCheckBox;
    CheckBoxUnderlineTcl: TCheckBox;
    CheckBoxKeywords: TCheckBox;
    EditColorNull: TEdit;
    ButtonColorNull: TButton;
    CheckBoxBoldNull: TCheckBox;
    CheckBoxItalicNull: TCheckBox;
    CheckBoxUnderlineNull: TCheckBox;
    EditColorPrior: TEdit;
    ButtonColorPrior: TButton;
    CheckBoxBoldPrior: TCheckBox;
    CheckBoxItalicPrior: TCheckBox;
    CheckBoxUnderlinePrior: TCheckBox;
    EditColorDdlCreateView: TEdit;
    ButtonColorDdlCreateView: TButton;
    CheckBoxBoldDdlCreateView: TCheckBox;
    CheckBoxItalicDdlCreateView: TCheckBox;
    CheckBoxUnderlineDdlCreateView: TCheckBox;
    PanelColorStylesBrackets: TPanel;
    LabelBrackets6: TLabel;
    LabelBrackets5: TLabel;
    LabelBrackets4: TLabel;
    LabelBrackets3: TLabel;
    LabelBrackets1: TLabel;
    LabelBrackets2: TLabel;
    LabelBoldItalicUnderlineBrackets: TLabel;
    EditColorBrackets1: TEdit;
    EditColorBrackets2: TEdit;
    EditColorBrackets3: TEdit;
    EditColorBrackets4: TEdit;
    EditColorBrackets5: TEdit;
    EditColorBrackets6: TEdit;
    ButtonColorBrackets6: TButton;
    ButtonColorBrackets5: TButton;
    ButtonColorBrackets4: TButton;
    ButtonColorBrackets3: TButton;
    ButtonColorBrackets2: TButton;
    ButtonColorBrackets1: TButton;
    CheckBoxBoldBrackets1: TCheckBox;
    CheckBoxItalicBrackets1: TCheckBox;
    CheckBoxUnderlineBrackets1: TCheckBox;
    CheckBoxUnderlineBrackets2: TCheckBox;
    CheckBoxItalicBrackets2: TCheckBox;
    CheckBoxBoldBrackets2: TCheckBox;
    CheckBoxBoldBrackets3: TCheckBox;
    CheckBoxItalicBrackets3: TCheckBox;
    CheckBoxUnderlineBrackets3: TCheckBox;
    CheckBoxUnderlineBrackets4: TCheckBox;
    CheckBoxItalicBrackets4: TCheckBox;
    CheckBoxBoldBrackets4: TCheckBox;
    CheckBoxBoldBrackets5: TCheckBox;
    CheckBoxItalicBrackets5: TCheckBox;
    CheckBoxUnderlineBrackets5: TCheckBox;
    CheckBoxUnderlineBrackets6: TCheckBox;
    CheckBoxItalicBrackets6: TCheckBox;
    CheckBoxBoldBrackets6: TCheckBox;
    CheckBoxBrackets: TCheckBox;
    PanelColorStylesCases: TPanel;
    LabelCases6: TLabel;
    LabelCases5: TLabel;
    LabelCases4: TLabel;
    LabelCases3: TLabel;
    LabelCases1: TLabel;
    LabelCases2: TLabel;
    LabelBoldItalicUnderlineCases: TLabel;
    EditColorCases1: TEdit;
    EditColorCases2: TEdit;
    EditColorCases3: TEdit;
    EditColorCases4: TEdit;
    EditColorCases5: TEdit;
    EditColorCases6: TEdit;
    ButtonColorCases6: TButton;
    ButtonColorCases5: TButton;
    ButtonColorCases4: TButton;
    ButtonColorCases3: TButton;
    ButtonColorCases2: TButton;
    ButtonColorCases1: TButton;
    CheckBoxBoldCases1: TCheckBox;
    CheckBoxItalicCases1: TCheckBox;
    CheckBoxUnderlineCases1: TCheckBox;
    CheckBoxUnderlineCases2: TCheckBox;
    CheckBoxItalicCases2: TCheckBox;
    CheckBoxBoldCases2: TCheckBox;
    CheckBoxBoldCases3: TCheckBox;
    CheckBoxItalicCases3: TCheckBox;
    CheckBoxUnderlineCases3: TCheckBox;
    CheckBoxUnderlineCases4: TCheckBox;
    CheckBoxItalicCases4: TCheckBox;
    CheckBoxBoldCases4: TCheckBox;
    CheckBoxBoldCases5: TCheckBox;
    CheckBoxItalicCases5: TCheckBox;
    CheckBoxUnderlineCases5: TCheckBox;
    CheckBoxUnderlineCases6: TCheckBox;
    CheckBoxItalicCases6: TCheckBox;
    CheckBoxBoldCases6: TCheckBox;
    CheckBoxCases: TCheckBox;

    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);

    procedure FormKeyPress(Sender: TObject; var Key: Char);

    procedure EditColorChange(Sender: TObject);

    procedure BtnResetClick(Sender: TObject);
    procedure BtnStoredClick(Sender: TObject);

    procedure EditColorButtonClick(Sender: TObject);

    procedure ColorAndStyleAction(aAction: TYaSettingsAction);
    procedure ChkBoxAction       (aAction: TYaSettingsAction);
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

{------------------------------- Default Values -------------------------------}

implementation

uses Dialogs, SysUtils,
     GtStandard, GtRegistry,
     SqlVersion;

{$R *.dfm}

{ form show }
procedure TFormColors.FormShow(Sender: TObject);
begin
  Caption := VER_NAME + ' - Colors...';

  BtnStoredClick(Sender);
end;

{ button OK }
procedure TFormColors.BtnOKClick(Sender: TObject);
begin
  rguDeleteKey( YA_SETTINGS_KEY );
  rguPutStr(YA_VERSION_KEY, VER_NUMBER);

  { commons }
  ChkBoxAction(yacsPutToRegistry);
  ColorAndStyleAction(yacsPutToRegistry);

  { Close }
  Close;
end;

{ Form Key Press Event }
procedure TFormColors.FormKeyPress(Sender: TObject; var Key: Char);
begin
  { Escape key - Close Form }
  if Key = #27 then Close;
end;

{ Edit Color On Change }
procedure TFormColors.EditColorChange(Sender: TObject);

  procedure DoIt(aPanel: TPanel);
  var i: Integer;
  begin
    for i := 0 to aPanel.ControlCount - 1 do
      if aPanel.Controls [i] is TEdit then begin

        TEdit(aPanel.Controls [i]).StyleElements := [seClient, seBorder];

        TEdit(aPanel.Controls [i]).Font.Color := $2000000 +
          RGB_SwapRandB( HexToInt( TEdit(aPanel.Controls [i]).Text   ) );
      end;
  end;

begin
  DoIt( PanelColorStylesMain );
  DoIt( PanelColorStylesIdentifiers );
  DoIt( PanelColorStylesKeywords );
  DoIt( PanelColorStylesBrackets );
  DoIt( PanelColorStylesCases );
end;

{ reset to defaults }
procedure TFormColors.BtnResetClick(Sender: TObject);
begin
  { commons }
  ChkBoxAction(yacsDefault);
  ColorAndStyleAction(yacsDefault);

  EditColorChange(Sender);
end;

{ recall stored values }
procedure TFormColors.BtnStoredClick(Sender: TObject);
begin
  { commons }
  ChkBoxAction(yacsGetFromRegistry);
  ColorAndStyleAction(yacsGetFromRegistry);

  EditColorChange(Sender);
end;

{ calls Color Dialog }
procedure TFormColors.EditColorButtonClick(Sender: TObject);
var Dlg : TColorDialog;
    Edt: TEdit;
begin
  try
    Edt := FindNextControl(TWinControl(Sender), False, True, False) as TEdit;
  except
    Edt := nil;
  end;

  if not Assigned(Edt) then Exit;

  Dlg := TColorDialog.Create(Self);
  try
    Dlg.Color := Edt.Font.Color and $FFFFFF;
    Dlg.Options := [cdFullOpen, cdAnyColor{, cdShowHelp}];

    if Dlg.Execute then begin
      Edt.Text := IntToHex( RGB_SwapRandB( Integer(Dlg.Color) ), 6 );

      EditColorChange(Self);
    end;
  finally
    Dlg.Free;
  end;
end;

{ sets chain between visual color and style controls and their ids }
procedure TFormColors.ColorAndStyleAction(aAction: TYaSettingsAction);

  procedure ColorAndStyleSingleAction(aAction: TYaSettingsAction; aStyle: TGtLexTokenStyle; aColorEdit: TEdit; aBoldEdit, aItalicEdit, aUnderlineEdit: TCheckBox);
  begin
    case aAction of
      yacsGetFromRegistry: begin
        aColorEdit.Text        := YaRegistryGetColor(aStyle);

        aBoldEdit.Checked      := YaRegistryGetBold(aStyle);
        aItalicEdit.Checked    := YaRegistryGetItalic(aStyle);
        aUnderlineEdit.Checked := YaRegistryGetUnderline(aStyle);
      end;

      yacsPutToRegistry: begin
        YaRegistryPutColor(aStyle, aColorEdit.Text);
        YaRegistryPutBIU  (aStyle, aBoldEdit.Checked, aItalicEdit.Checked, aUnderlineEdit.Checked);
      end;

      yacsDefault: begin
        aColorEdit.Text        := IntToHex( YA_SET_COLOR_ARR [aStyle].Color, 6 );

        aBoldEdit.Checked      := Pos('B',  YA_SET_COLOR_ARR [aStyle].Style) > 0;
        aItalicEdit.Checked    := Pos('I',  YA_SET_COLOR_ARR [aStyle].Style) > 0;
        aUnderlineEdit.Checked := Pos('U',  YA_SET_COLOR_ARR [aStyle].Style) > 0;
      end;
    end;
  end;

begin
  ColorAndStyleSingleAction(aAction, gtlsPlainText,   EditColorPlainText,    CheckBoxBoldPlainText,    CheckBoxItalicPlainText,    CheckBoxUnderlinePlainText);
  ColorAndStyleSingleAction(aAction, gtlsComment,     EditColorComments,     CheckBoxBoldComments,     CheckBoxItalicComments,     CheckBoxUnderlineComments);
  ColorAndStyleSingleAction(aAction, gtlsError,       EditColorErrors,       CheckBoxBoldErrors,       CheckBoxItalicErrors,       CheckBoxUnderlineErrors);
  ColorAndStyleSingleAction(aAction, gtlsDisabled,    EditColorDisabled,     CheckBoxBoldDisabled,     CheckBoxItalicDisabled,     CheckBoxUnderlineDisabled);
  ColorAndStyleSingleAction(aAction, gtlsNumber,      EditColorNumbers,      CheckBoxBoldNumbers,      CheckBoxItalicNumbers,      CheckBoxUnderlineNumbers);
  ColorAndStyleSingleAction(aAction, gtlsString,      EditColorStrings,      CheckBoxBoldStrings,      CheckBoxItalicStrings,      CheckBoxUnderlineStrings);
  ColorAndStyleSingleAction(aAction, gtlsOperator,    EditColorOperators,    CheckBoxBoldOperators,    CheckBoxItalicOperators,    CheckBoxUnderlineOperators);

  ColorAndStyleSingleAction(aAction, gtlsIdentifier,  EditColorIdentifiers,  CheckBoxBoldIdentifiers,  CheckBoxItalicIdentifiers,  CheckBoxUnderlineIdentifiers);
  ColorAndStyleSingleAction(aAction, gtlsConstraint,  EditColorConstraints,  CheckBoxBoldConstraints,  CheckBoxItalicConstraints,  CheckBoxUnderlineConstraints);
  ColorAndStyleSingleAction(aAction, gtlsTable,       EditColorTables,       CheckBoxBoldTables,       CheckBoxItalicTables,       CheckBoxUnderlineTables);
  ColorAndStyleSingleAction(aAction, gtlsView,        EditColorViews,        CheckBoxBoldViews,        CheckBoxItalicViews,        CheckBoxUnderlineViews);
  ColorAndStyleSingleAction(aAction, gtlsSynonym,     EditColorSynonyms,     CheckBoxBoldSynonyms,     CheckBoxItalicSynonyms,     CheckBoxUnderlineSynonyms);
  ColorAndStyleSingleAction(aAction, gtlsColumn,      EditColorColumns,      CheckBoxBoldColumns,      CheckBoxItalicColumns,      CheckBoxUnderlineColumns);
  ColorAndStyleSingleAction(aAction, gtlsTableAlias,  EditColorTableAliases, CheckBoxBoldTableAliases, CheckBoxItalicTableAliases, CheckBoxUnderlineTableAliases);
  ColorAndStyleSingleAction(aAction, gtlsColumnAlias, EditColorColumnAliases,CheckBoxBoldColumnAliases,CheckBoxItalicColumnAliases,CheckBoxUnderlineColumnAliases);
  // ColorAndStyleSingleAction(aAction, gtlsRefColumn,   EditColorRefColumns,   CheckBoxBoldRefColumns,   CheckBoxItalicRefColumns,   CheckBoxUnderlineRefColumns);
  ColorAndStyleSingleAction(aAction, gtlsFunction,    EditColorFunctions,    CheckBoxBoldFunctions,    CheckBoxItalicFunctions,    CheckBoxUnderlineFunctions);
  ColorAndStyleSingleAction(aAction, gtlsAggrFunction,EditColorAggrFunctions,CheckBoxBoldAggrFunctions,CheckBoxItalicFunctions,    CheckBoxUnderlineAggrFunctions);
  ColorAndStyleSingleAction(aAction, gtlsTransaction, EditColorTransactions, CheckBoxBoldTransactions, CheckBoxItalicTransactions, CheckBoxUnderlineTransactions);
  ColorAndStyleSingleAction(aAction, gtlsParameter,   EditColorParameters,   CheckBoxBoldParameters,   CheckBoxItalicParameters,   CheckBoxUnderlineParameters);
  ColorAndStyleSingleAction(aAction, gtlsFunParameter,EditColorFunParameters,CheckBoxBoldFunParameters,CheckBoxItalicParameters,   CheckBoxUnderlineFunParameters);
  ColorAndStyleSingleAction(aAction, gtlsExtQueryAliasOrTable,EditColorExtQueryAliasOrTable,CheckBoxBoldExtQueryAliasOrTable,CheckBoxItalicExtQueryAliasOrTable,CheckBoxUnderlineExtQueryAliasOrTable);

  ColorAndStyleSingleAction(aAction, gtlsKeyword,      EditColorKeywords,     CheckBoxBoldKeywords,     CheckBoxItalicKeywords,     CheckBoxUnderlineKeywords);
  ColorAndStyleSingleAction(aAction, gtlsDataType,     EditColorDataTypes,    CheckBoxBoldDatatypes,    CheckBoxItalicDatatypes,    CheckBoxUnderlineDatatypes);
  ColorAndStyleSingleAction(aAction, gtlsDmlSelect,    EditColorDmlSelect,    CheckBoxBoldDmlSelect,    CheckBoxItalicDmlSelect,    CheckBoxUnderlineDmlSelect);
  ColorAndStyleSingleAction(aAction, gtlsDmlInsert,    EditColorDmlInsert,    CheckBoxBoldDmlInsert,    CheckBoxItalicDmlInsert,    CheckBoxUnderlineDmlInsert);
  ColorAndStyleSingleAction(aAction, gtlsDmlUpdate,    EditColorDmlUpdate,    CheckBoxBoldDmlUpdate,    CheckBoxItalicDmlUpdate,    CheckBoxUnderlineDmlUpdate);
  ColorAndStyleSingleAction(aAction, gtlsDmlDelete,    EditColorDmlDelete,    CheckBoxBoldDmlDelete,    CheckBoxItalicDmlDelete,    CheckBoxUnderlineDmlDelete);
  ColorAndStyleSingleAction(aAction, gtlsDdlCreate,    EditColorDdlCreate,    CheckBoxBoldDdlCreate,    CheckBoxItalicDdlCreate,    CheckBoxUnderlineDdlCreate);
  ColorAndStyleSingleAction(aAction, gtlsDdlCreateView,EditColorDdlCreateView,CheckBoxBoldDdlCreateView,CheckBoxItalicDdlCreate,    CheckBoxUnderlineDdlCreateView);
  ColorAndStyleSingleAction(aAction, gtlsDdlDrop,      EditColorDdlDrop,      CheckBoxBoldDdlDrop,      CheckBoxItalicDdlDrop,      CheckBoxUnderlineDdlDrop);
  ColorAndStyleSingleAction(aAction, gtlsDdlModify,    EditColorDdlModify,    CheckBoxBoldDdlModify,    CheckBoxItalicDdlModify,    CheckBoxUnderlineDdlModify);
  ColorAndStyleSingleAction(aAction, gtlsTcl,          EditColorTcl,          CheckBoxBoldTcl,          CheckBoxItalicTcl,          CheckBoxUnderlineTcl);
  ColorAndStyleSingleAction(aAction, gtlsDcl,          EditColorDcl,          CheckBoxBoldDcl,          CheckBoxItalicDcl,          CheckBoxUnderlineDcl);
  ColorAndStyleSingleAction(aAction, gtlsUnion,        EditColorUnion,        CheckBoxBoldUnions,       CheckBoxItalicUnions,       CheckBoxUnderlineUnions);
  ColorAndStyleSingleAction(aAction, gtlsNull,         EditColorNull,         CheckBoxBoldNull,         CheckBoxItalicNull,         CheckBoxUnderlineNull);
  ColorAndStyleSingleAction(aAction, gtlsPrior,        EditColorPrior,        CheckBoxBoldPrior,        CheckBoxItalicPrior,        CheckBoxUnderlinePrior);

  ColorAndStyleSingleAction(aAction, gtlsCaseWhen1,   EditColorCases1,       CheckBoxBoldCases1,       CheckBoxItalicCases1,       CheckBoxUnderlineCases1);
  ColorAndStyleSingleAction(aAction, gtlsCaseWhen2,   EditColorCases2,       CheckBoxBoldCases2,       CheckBoxItalicCases2,       CheckBoxUnderlineCases2);
  ColorAndStyleSingleAction(aAction, gtlsCaseWhen3,   EditColorCases3,       CheckBoxBoldCases3,       CheckBoxItalicCases3,       CheckBoxUnderlineCases3);
  ColorAndStyleSingleAction(aAction, gtlsCaseWhen4,   EditColorCases4,       CheckBoxBoldCases4,       CheckBoxItalicCases4,       CheckBoxUnderlineCases4);
  ColorAndStyleSingleAction(aAction, gtlsCaseWhen5,   EditColorCases5,       CheckBoxBoldCases5,       CheckBoxItalicCases5,       CheckBoxUnderlineCases5);
  ColorAndStyleSingleAction(aAction, gtlsCaseWhen6,   EditColorCases6,       CheckBoxBoldCases6,       CheckBoxItalicCases6,       CheckBoxUnderlineCases6);

  ColorAndStyleSingleAction(aAction, gtlsBracketOpen1,EditColorBrackets1,    CheckBoxBoldBrackets1,    CheckBoxItalicBrackets1,    CheckBoxUnderlineBrackets1);
  ColorAndStyleSingleAction(aAction, gtlsBracketOpen2,EditColorBrackets2,    CheckBoxBoldBrackets2,    CheckBoxItalicBrackets2,    CheckBoxUnderlineBrackets2);
  ColorAndStyleSingleAction(aAction, gtlsBracketOpen3,EditColorBrackets3,    CheckBoxBoldBrackets3,    CheckBoxItalicBrackets3,    CheckBoxUnderlineBrackets3);
  ColorAndStyleSingleAction(aAction, gtlsBracketOpen4,EditColorBrackets4,    CheckBoxBoldBrackets4,    CheckBoxItalicBrackets4,    CheckBoxUnderlineBrackets4);
  ColorAndStyleSingleAction(aAction, gtlsBracketOpen5,EditColorBrackets5,    CheckBoxBoldBrackets5,    CheckBoxItalicBrackets5,    CheckBoxUnderlineBrackets5);
  ColorAndStyleSingleAction(aAction, gtlsBracketOpen6,EditColorBrackets6,    CheckBoxBoldBrackets6,    CheckBoxItalicBrackets6,    CheckBoxUnderlineBrackets6);
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
procedure TFormColors.ChkBoxAction(aAction: TYaSettingsAction);

//  procedure LocalAction(aAction: TYaSettingsAction; aSetting: TGtListerSettings; aCheckBox: TCheckBox);
//  begin
//    case aAction of
//      yacsGetFromRegistry:  aCheckBox.Checked := GtRegistryGetBool (aSetting);
//      yacsPutToRegistry:    GtRegistryPutBool(aSetting, aCheckBox.Checked);
//      yacsDefault:          aCheckBox.Checked := GT_SET_BOOL_ARR [aSetting].Def;
//    end;
//  end;

  procedure LocalAction2(aAction: TYaSettingsAction; aSetting: TYaBoolSettings; aCheckBox: TCheckBox);
  begin
    case aAction of
      yacsGetFromRegistry:  aCheckBox.Checked := YaRegistryGetBool (aSetting);
      yacsPutToRegistry:    YaRegistryPutBool(aSetting, aCheckBox.Checked);
      yacsDefault:          aCheckBox.Checked := YA_SET_BOOL_ARR [aSetting].Def;
    end;
  end;

begin
  { ext colors }
  LocalAction2(aAction, yastExtColorIdentifiers,     CheckBoxIdentifiers);
  LocalAction2(aAction, yastExtColorKeywords,        CheckBoxKeywords);
  LocalAction2(aAction, yastExtColorBrackets,        CheckBoxBrackets);
  LocalAction2(aAction, yastExtColorCases,           CheckBoxCases);
end;

end.

