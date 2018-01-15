(* $Header: /SQL Toys/SqlFormatter/SqlConverters.pas 20    18-01-14 20:46 Tomek $
   (c) Tomasz Gierka, github.com/SqlToys, 2015.06.14                          *)
{--------------------------------------  --------------------------------------}
unit SqlConverters;

interface

uses SqlTokenizers, SqlStructs, SqlLister;

{---------------------------- Navigation procedures ---------------------------}

type TSqlNodeProcedure = procedure (aNode: TGtSqlNode);
type TSqlNodeCaseProcedure = procedure (aNode: TGtSqlNode; aCase: TGtSqlCaseOption);

{ TODO: move to TGtSqlNode.ForEach, TGtSqlNode.ForEachAndDeepInside }
procedure SqlToysExec_ForEach_Node       ( aProc: TSqlNodeProcedure;       aNode: TGtSqlNode;
                                           aKind: TGtSqlNodeKind=gtsiNone; aKeyword: TGtLexTokenDef=nil; aName: String='');
procedure SqlToysExec_ForEach_Node_Case  ( aProc: TSqlNodeCaseProcedure;   aNode: TGtSqlNode;
                                           aCase: TGtSqlCaseOption = gtcoNoChange;
                                           aKind: TGtSqlNodeKind=gtsiNone; aKeyword: TGtLexTokenDef=nil; aName: String='');
procedure SqlToysExec_ForEach_DeepInside ( aProc: TSqlNodeProcedure; aNode: TGtSqlNode;
                                           aKind: TGtSqlNodeKind=gtsiNone; aKeyword: TGtLexTokenDef=nil; aName: String='');

{----------------------------------- General ----------------------------------}

//procedure SqlToysConvert_ExecuteAll(aNode: TGtSqlNode; aOptions: TGtListerSettingsArray;
//                                    aCaseOpt: TGtListerCaseSettingsArray);

{------------------------------ Alias Converters ------------------------------}

procedure SqlToysConvert_ExprAlias_AddKeyword_AS(aNode: TGtSqlNode);
procedure SqlToysConvert_ExprAlias_RemoveKeyword_AS(aNode: TGtSqlNode);

procedure SqlToysConvert_TableAlias_AddKeyword_AS(aNode: TGtSqlNode);
procedure SqlToysConvert_TableAlias_RemoveKeyword_AS(aNode: TGtSqlNode);

{------------------------------ Case Converters -------------------------------}

procedure SqlToysConvert_CaseKeyword(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
procedure SqlToysConvert_CaseKeyword_Lower(aNode: TGtSqlNode);
procedure SqlToysConvert_CaseKeyword_Upper(aNode: TGtSqlNode);

procedure SqlToysConvert_CaseTableName(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
procedure SqlToysConvert_CaseTableName_Lower(aNode: TGtSqlNode);
procedure SqlToysConvert_CaseTableName_Upper(aNode: TGtSqlNode);

procedure SqlToysConvert_CaseColumnName(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
procedure SqlToysConvert_CaseColumnName_Lower(aNode: TGtSqlNode);
procedure SqlToysConvert_CaseColumnName_Upper(aNode: TGtSqlNode);

procedure SqlToysConvert_CaseTableAlias(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
procedure SqlToysConvert_CaseTableAlias_Lower(aNode: TGtSqlNode);
procedure SqlToysConvert_CaseTableAlias_Upper(aNode: TGtSqlNode);

procedure SqlToysConvert_CaseColumnAlias(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
procedure SqlToysConvert_CaseColumnAlias_Lower(aNode: TGtSqlNode);
procedure SqlToysConvert_CaseColumnAlias_Upper(aNode: TGtSqlNode);

procedure SqlToysConvert_CaseColumnQuotedAlias(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
procedure SqlToysConvert_CaseColumnQuotedAlias_Lower(aNode: TGtSqlNode);
procedure SqlToysConvert_CaseColumnQuotedAlias_Upper(aNode: TGtSqlNode);

procedure SqlToysConvert_CaseParam(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
procedure SqlToysConvert_CaseParam_Lower(aNode: TGtSqlNode);
procedure SqlToysConvert_CaseParam_Upper(aNode: TGtSqlNode);

procedure SqlToysConvert_CaseFunc(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
procedure SqlToysConvert_CaseFunc_Lower(aNode: TGtSqlNode);
procedure SqlToysConvert_CaseFunc_Upper(aNode: TGtSqlNode);

procedure SqlToysConvert_CaseIdentifier(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
procedure SqlToysConvert_CaseIdentifier_Lower(aNode: TGtSqlNode);
procedure SqlToysConvert_CaseIdentifier_Upper(aNode: TGtSqlNode);

{---------------------------- Sort Order Converters ---------------------------}

procedure SqlToysConvert_SortOrder_ShortKeywords(aNode: TGtSqlNode);
procedure SqlToysConvert_SortOrder_LongKeywords(aNode: TGtSqlNode);

procedure SqlToysConvert_SortOrder_AddDefaultKeywords(aNode: TGtSqlNode);
procedure SqlToysConvert_SortOrder_RemoveDefaultKeywords(aNode: TGtSqlNode);

{---------------------------- Datatype Converters -----------------------------}

procedure SqlToysConvert_DataType_IntToInteger(aNode: TGtSqlNode);
procedure SqlToysConvert_DataType_IntegerToInt(aNode: TGtSqlNode);

{------------------------------- JOIN Converters ------------------------------}

procedure SqlToysConvert_Joins_AddInner(aNode: TGtSqlNode);
procedure SqlToysConvert_Joins_RemoveInner(aNode: TGtSqlNode);
procedure SqlToysConvert_Joins_AddOuter(aNode: TGtSqlNode);
procedure SqlToysConvert_Joins_RemoveOuter(aNode: TGtSqlNode);

{-------------------------- JOIN condition Converters -------------------------}

procedure SqlToysConvert_JoinCond_RefToLeft(aNode: TGtSqlNode);

implementation

uses SysUtils;

{----------------------------------- General ----------------------------------}

procedure SqlToysConvert_ExecuteAll(aNode: TGtSqlNode; aOptions: TGtListerSettingsArray;
                                    aCaseOpt: TGtListerCaseSettingsArray);
begin
{------------------------------ Alias Converters ------------------------------}
  if aOptions[ gtstTableAsKeywordCONVERTER ]
    then SqlToysConvert_TableAlias_AddKeyword_AS( aNode )
    else SqlToysConvert_TableAlias_RemoveKeyword_AS( aNode );

  if aOptions[ gtstExprAsKeywordCONVERTER ]
    then SqlToysConvert_ExprAlias_AddKeyword_AS( aNode )
    else SqlToysConvert_ExprAlias_RemoveKeyword_AS( aNode );
{------------------------------ Case Converters -------------------------------}
//procedure SqlToysConvert_CaseKeyword_Lower(aNode: TGtSqlNode);
//procedure SqlToysConvert_CaseKeyword_Upper(aNode: TGtSqlNode);

  SqlToysConvert_CaseTableName( aNode, aCaseOpt[ gtlcTableCONVERTER ] );
//  case aCaseOpt[ gtlcTableCONVERTER ] of
//    gtcoNoChange       : ;
//    gtcoUpperCase      : SqlToysConvert_CaseTableName_Upper( aNode );
//    gtcoLowerCase      : SqlToysConvert_CaseTableName_Lower( aNode );
//    gtcoFirstCharUpper : ;
//    gtcoFirstUseCase   : ;
//  end;

  SqlToysConvert_CaseColumnName( aNode, aCaseOpt[ gtlcColumnCONVERTER ] );
//  case aCaseOpt[ gtlcColumnCONVERTER ] of
//    gtcoNoChange       : ;
//    gtcoUpperCase      : SqlToysConvert_CaseColumnName_Upper( aNode );
//    gtcoLowerCase      : SqlToysConvert_CaseColumnName_Lower( aNode );
//    gtcoFirstCharUpper : ;
//    gtcoFirstUseCase   : ;
//  end;

  SqlToysConvert_CaseTableAlias( aNode, aCaseOpt[ gtlcTableAliasCONVERTER ] );
//  case aCaseOpt[ gtlcTableAliasCONVERTER ] of
//    gtcoNoChange       : ;
//    gtcoUpperCase      : SqlToysConvert_CaseTableAlias_Upper( aNode );
//    gtcoLowerCase      : SqlToysConvert_CaseTableAlias_Lower( aNode );
//    gtcoFirstCharUpper : ;
//    gtcoFirstUseCase   : ;
//  end;

  SqlToysConvert_CaseColumnAlias( aNode, aCaseOpt[ gtlcColumnAliasCONVERTER ] );
//  case aCaseOpt[ gtlcColumnAliasCONVERTER ] of
//    gtcoNoChange       : ;
//    gtcoUpperCase      : SqlToysConvert_CaseColumnAlias_Upper( aNode );
//    gtcoLowerCase      : SqlToysConvert_CaseColumnAlias_Lower( aNode );
//    gtcoFirstCharUpper : ;
//    gtcoFirstUseCase   : ;
//  end;

  SqlToysConvert_CaseColumnQuotedAlias( aNode, aCaseOpt[ gtlcColumnQuotedAliasCONVERTER ] );
//  case aCaseOpt[ gtlcColumnQuotedAliasCONVERTER ] of
//    gtcoNoChange       : ;
//    gtcoUpperCase      : SqlToysConvert_CaseColumnQuotedAlias_Upper( aNode );
//    gtcoLowerCase      : SqlToysConvert_CaseColumnQuotedAlias_Lower( aNode );
//    gtcoFirstCharUpper : ;
//    gtcoFirstUseCase   : ;
//  end;

  SqlToysConvert_CaseParam( aNode, aCaseOpt[ gtlcParameterCONVERTER ] );
//  case aCaseOpt[ gtlcParameterCONVERTER ] of
//    gtcoNoChange       : ;
//    gtcoUpperCase      : SqlToysConvert_CaseParam_Upper( aNode );
//    gtcoLowerCase      : SqlToysConvert_CaseParam_Lower( aNode );
//    gtcoFirstCharUpper : ;
//    gtcoFirstUseCase   : ;
//  end;

  SqlToysConvert_CaseFunc( aNode, aCaseOpt[ gtlcFunctionCONVERTER ] );
//  case aCaseOpt[ gtlcFunctionCONVERTER ] of
//    gtcoNoChange       : ;
//    gtcoUpperCase      : SqlToysConvert_CaseFunc_Upper( aNode );
//    gtcoLowerCase      : SqlToysConvert_CaseFunc_Lower( aNode );
//    gtcoFirstCharUpper : ;
//    gtcoFirstUseCase   : ;
//  end;

  SqlToysConvert_CaseIdentifier( aNode, aCaseOpt[ gtlcIdentifierCONVERTER ] );
//  case aCaseOpt[ gtlcIdentifierCONVERTER ] of
//    gtcoNoChange       : ;
//    gtcoUpperCase      : SqlToysConvert_CaseIdentifier_Upper( aNode );
//    gtcoLowerCase      : SqlToysConvert_CaseIdentifier_Lower( aNode );
//    gtcoFirstCharUpper : ;
//    gtcoFirstUseCase   : ;
//  end;
{---------------------------- Sort Order Converters ---------------------------}
  if aOptions[ gtstSortShortCONVERTER ]
    then SqlToysConvert_SortOrder_ShortKeywords( aNode )
    else SqlToysConvert_SortOrder_LongKeywords( aNode );

  if aOptions[ gtstSkipAscendingCONVERTER ]
    then SqlToysConvert_SortOrder_RemoveDefaultKeywords( aNode )
    else SqlToysConvert_SortOrder_AddDefaultKeywords( aNode );
{---------------------------- Datatype Converters -----------------------------}

//procedure SqlToysConvert_DataType_IntToInteger(aNode: TGtSqlNode);
//procedure SqlToysConvert_DataType_IntegerToInt(aNode: TGtSqlNode);

{------------------------------- JOIN Converters ------------------------------}
  if aOptions[ gtstInnerJoinCONVERTER ]
    then SqlToysConvert_Joins_AddInner( aNode )
    else SqlToysConvert_Joins_RemoveInner( aNode );

  if aOptions[ gtstOuterJoinCONVERTER ]
    then SqlToysConvert_Joins_AddOuter( aNode )
    else SqlToysConvert_Joins_RemoveOuter( aNode );
{-------------------------- JOIN condition Converters -------------------------}
//  if aOptions[ gtstOnCondRefsFirstCONVERTER ]
  if aOptions[ gtstJoinCondLeftSideOrderCONVERTER ]
    then SqlToysConvert_JoinCond_RefToLeft( aNode );
end;

{---------------------------- Navigation procedures ---------------------------}

{ calls aProc for each node in aNode list }
procedure SqlToysExec_ForEach_Node;
var i: Integer;
begin
  if not Assigned(aNode) then Exit;

  for i := 0 to aNode.Count -1 do
    if aNode[i].Check(aKind, aKeyword, aName) then aProc(aNode[i]);
end;

procedure SqlToysExec_ForEach_Node_Case;
var i: Integer;
begin
  if not Assigned(aNode) then Exit;

  for i := 0 to aNode.Count -1 do
    if aNode[i].Check(aKind, aKeyword, aName) then aProc(aNode[i], aCase);
end;

{ calls aProc for each node and its subnodes in aNode list }
procedure SqlToysExec_ForEach_DeepInside;
var i: Integer;
begin
  if not Assigned(aNode) then Exit;

  for i := 0 to aNode.Count -1 do begin
    if aNode[i].Check(aKind, aKeyword, aName) then aProc(aNode[i]);

    { recursive call for each node }
    SqlToysExec_ForEach_DeepInside( aProc, aNode[i], aKind, aKeyword, aName );
  end;
end;

{--------------------------------- Converters ---------------------------------}

{ procedure for SELECT expr list iteration }
procedure SqlToysConvert_ExprAlias_Iteration(aProc: TSqlNodeProcedure; aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiExprList, gtkwSelect) then begin
    SqlToysExec_ForEach_Node( aProc, aNode, gtsiExpr );
    SqlToysExec_ForEach_Node( aProc, aNode, gtsiExprTree );
  end else
  if aNode.Check(gtsiDml, gtkwSelect) then begin
    SqlToysExec_ForEach_Node( aProc, aNode, gtsiExprList, gtkwSelect );
  end else
  if aNode.Check(gtsiQueryList) then begin
    SqlToysExec_ForEach_Node( aProc, aNode, gtsiDml, gtkwSelect );
  end;
end;

{ procedure adds keyword AS to each top level expression in SELECT clause }
procedure SqlToysConvert_ExprAlias_AddKeyword_AS;
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiExpr) or aNode.Check(gtsiExprTree) then begin
    aNode.AliasAsToken := aNode.AliasName <> '';
  end else begin
    SqlToysConvert_ExprAlias_Iteration( SqlToysConvert_ExprAlias_AddKeyword_AS, aNode );
  end;
end;

{ procedure removes keyword AS from each top level expression in SELECT clause }
procedure SqlToysConvert_ExprAlias_RemoveKeyword_AS;
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiExpr) or aNode.Check(gtsiExprTree) then begin
    aNode.AliasAsToken := False;
  end else begin
    SqlToysConvert_ExprAlias_Iteration( SqlToysConvert_ExprAlias_RemoveKeyword_AS, aNode );
  end;
end;

{ procedure for tables in FROM, UPDATE or DELETE clause iteration }
procedure SqlToysConvert_TableAlias_Iteration(aProc: TSqlNodeProcedure; aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiClauseTables) then begin
    SqlToysExec_ForEach_Node( aProc, aNode, gtsiTableRef );
  end else
  if aNode.Check(gtsiDml, gtkwSelect) then begin
    SqlToysExec_ForEach_Node( aProc, aNode, gtsiClauseTables );
  end else
  if aNode.Check(gtsiQueryList) then begin
    SqlToysExec_ForEach_Node( aProc, aNode, gtsiDml, gtkwSelect );
  end;
end;

{ procedure adds keyword AS to each table in FROM, UPDATE or DELETE clause }
procedure SqlToysConvert_TableAlias_AddKeyword_AS(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiTableRef) then begin
    aNode.AliasAsToken := aNode.AliasName <> '';
  end else begin
    SqlToysConvert_TableAlias_Iteration( SqlToysConvert_TableAlias_AddKeyword_AS, aNode );
  end;
end;

{ procedure removes keyword AS from each table in FROM, UPDATE or DELETE clause }
procedure SqlToysConvert_TableAlias_RemoveKeyword_AS(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiTableRef) then begin
    aNode.AliasAsToken := False;
  end else begin
    SqlToysConvert_TableAlias_Iteration( SqlToysConvert_TableAlias_RemoveKeyword_AS, aNode );
  end;
end;

{------------------------------ Case Converters -------------------------------}

procedure SqlToysConvert_CaseKeyword(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Keyword <> gttkNone then aNode.Keyword := aNode.Keyword ;

  SqlToysExec_ForEach_Node_Case( SqlToysConvert_CaseKeyword, aNode, aCase );
end;

{ procedure changes upper case keywords to lower case }
procedure SqlToysConvert_CaseKeyword_Lower(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  SqlToysExec_ForEach_Node( SqlToysConvert_CaseKeyword_Lower, aNode );
end;

{ procedure changes upper case keywords to lower case }
procedure SqlToysConvert_CaseKeyword_Upper(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Keyword <> gttkNone then aNode.Keyword := aNode.Keyword ;

  SqlToysExec_ForEach_Node( SqlToysConvert_CaseKeyword_Upper, aNode );
end;

procedure SqlToysConvert_CaseTableName(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Kind = gtsiTableRef
    then aNode.Name := UpperLowerStr( aNode.Name, aCase );

  SqlToysExec_ForEach_Node_Case( SqlToysConvert_CaseTableName, aNode, aCase );
end;

procedure SqlToysConvert_CaseTableName_Lower(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Kind = gtsiTableRef
    then aNode.Name := AnsiLowerCase( aNode.Name );

  SqlToysExec_ForEach_Node( SqlToysConvert_CaseTableName_Lower, aNode );
end;

procedure SqlToysConvert_CaseTableName_Upper(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Kind = gtsiTableRef
    then aNode.Name := AnsiUpperCase( aNode.Name );

  SqlToysExec_ForEach_Node( SqlToysConvert_CaseTableName_Upper, aNode );
end;

procedure SqlToysConvert_CaseTableAlias(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Kind = gtsiTableRef
    then aNode.AliasName := UpperLowerStr( aNode.AliasName, aCase );

  SqlToysExec_ForEach_Node_Case( SqlToysConvert_CaseTableAlias, aNode, aCase );
end;

procedure SqlToysConvert_CaseTableAlias_Lower(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Kind = gtsiTableRef
    then aNode.AliasName := AnsiLowerCase( aNode.AliasName );

  SqlToysExec_ForEach_Node( SqlToysConvert_CaseTableAlias_Lower, aNode );
end;

procedure SqlToysConvert_CaseTableAlias_Upper(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Kind = gtsiTableRef
    then aNode.AliasName := AnsiUpperCase( aNode.AliasName );

  SqlToysExec_ForEach_Node( SqlToysConvert_CaseTableAlias_Upper, aNode );
end;

procedure SqlToysConvert_CaseColumnName(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Keyword <> gttkParameterName) and (aNode.Name <> '')
                             and (aNode.Keyword <> gtkwFunction)
    then aNode.Name := UpperLowerStr( aNode.Name, aCase );

  SqlToysExec_ForEach_Node_Case( SqlToysConvert_CaseColumnName, aNode, aCase );
end;

procedure SqlToysConvert_CaseColumnName_Lower(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Keyword <> gttkParameterName) and (aNode.Name <> '')
                             and (aNode.Keyword <> gtkwFunction)
    then aNode.Name := AnsiLowerCase( aNode.Name );

  SqlToysExec_ForEach_Node( SqlToysConvert_CaseColumnName_Lower, aNode );
end;

procedure SqlToysConvert_CaseColumnName_Upper(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Keyword <> gttkParameterName) and (aNode.Name <> '')
                             and (aNode.Keyword <> gtkwFunction)
    then aNode.Name := AnsiUpperCase( aNode.Name );

  SqlToysExec_ForEach_Node( SqlToysConvert_CaseColumnName_Upper, aNode );
end;

procedure SqlToysConvert_CaseColumnAlias(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExprTree) and (aNode.AliasName <> '') and (Copy(aNode.AliasName,1,1) <> '"')
    then aNode.AliasName := UpperLowerStr( aNode.AliasName, aCase );

  SqlToysExec_ForEach_Node_Case( SqlToysConvert_CaseColumnAlias, aNode, aCase );
end;

procedure SqlToysConvert_CaseColumnAlias_Lower(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExprTree) and (aNode.AliasName <> '') and (Copy(aNode.AliasName,1,1) <> '"')
    then aNode.AliasName := AnsiLowerCase( aNode.AliasName );

  SqlToysExec_ForEach_Node( SqlToysConvert_CaseColumnAlias_Lower, aNode );
end;

procedure SqlToysConvert_CaseColumnAlias_Upper(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExprTree) and (aNode.AliasName <> '') and (Copy(aNode.AliasName,1,1) <> '"')
    then aNode.AliasName := AnsiUpperCase( aNode.AliasName );

  SqlToysExec_ForEach_Node( SqlToysConvert_CaseColumnAlias_Upper, aNode );
end;

procedure SqlToysConvert_CaseParam(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Keyword = gttkParameterName) and (aNode.Name <> '')
    then aNode.Name := UpperLowerStr( aNode.Name, aCase );

  SqlToysExec_ForEach_Node_Case( SqlToysConvert_CaseParam, aNode, aCase );
end;

procedure SqlToysConvert_CaseParam_Lower(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Keyword = gttkParameterName) and (aNode.Name <> '')
    then aNode.Name := AnsiLowerCase( aNode.Name );

  SqlToysExec_ForEach_Node( SqlToysConvert_CaseParam_Lower, aNode );
end;

procedure SqlToysConvert_CaseParam_Upper(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Keyword = gttkParameterName) and (aNode.Name <> '')
    then aNode.Name := AnsiUpperCase( aNode.Name );

  SqlToysExec_ForEach_Node( SqlToysConvert_CaseParam_Upper, aNode );
end;

procedure SqlToysConvert_CaseFunc(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Name <> '') and (aNode.Keyword = gtkwFunction)
    then aNode.Name := UpperLowerStr( aNode.Name, aCase );

  SqlToysExec_ForEach_Node_Case( SqlToysConvert_CaseFunc, aNode, aCase );
end;

procedure SqlToysConvert_CaseFunc_Lower(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Name <> '') and (aNode.Keyword = gtkwFunction)
    then aNode.Name := AnsiLowerCase( aNode.Name );

  SqlToysExec_ForEach_Node( SqlToysConvert_CaseFunc_Lower, aNode );
end;

procedure SqlToysConvert_CaseFunc_Upper(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Name <> '') and (aNode.Keyword = gtkwFunction)
    then aNode.Name := AnsiUpperCase( aNode.Name );

  SqlToysExec_ForEach_Node( SqlToysConvert_CaseFunc_Upper, aNode );
end;

procedure SqlToysConvert_CaseColumnQuotedAlias(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExprTree) and (aNode.AliasName <> '') and (Copy(aNode.AliasName,1,1) = '"')
    then aNode.AliasName := UpperLowerStr( aNode.AliasName, aCase );

  SqlToysExec_ForEach_Node_Case( SqlToysConvert_CaseColumnQuotedAlias, aNode, aCase );
end;

procedure SqlToysConvert_CaseColumnQuotedAlias_Lower(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExprTree) and (aNode.AliasName <> '') and (Copy(aNode.AliasName,1,1) = '"')
    then aNode.AliasName := AnsiLowerCase( aNode.AliasName );

  SqlToysExec_ForEach_Node( SqlToysConvert_CaseColumnQuotedAlias_Lower, aNode );
end;

procedure SqlToysConvert_CaseColumnQuotedAlias_Upper(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExprTree) and (aNode.AliasName <> '') and (Copy(aNode.AliasName,1,1) = '"')
    then aNode.AliasName := AnsiUpperCase( aNode.AliasName );

  SqlToysExec_ForEach_Node( SqlToysConvert_CaseColumnQuotedAlias_Upper, aNode );
end;

procedure SqlToysConvert_CaseIdentifier(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Name <> '') and (aNode.Keyword = gttkIdentifier)
    then aNode.Name := UpperLowerStr( aNode.Name, aCase );

  SqlToysExec_ForEach_Node_Case( SqlToysConvert_CaseIdentifier, aNode, aCase );
end;

procedure SqlToysConvert_CaseIdentifier_Lower(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Name <> '') and (aNode.Keyword = gttkIdentifier)
    then aNode.Name := AnsiLowerCase( aNode.Name );

  SqlToysExec_ForEach_Node( SqlToysConvert_CaseIdentifier_Lower, aNode );
end;

procedure SqlToysConvert_CaseIdentifier_Upper(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Name <> '') and (aNode.Keyword = gttkIdentifier)
    then aNode.Name := AnsiUpperCase( aNode.Name );

  SqlToysExec_ForEach_Node( SqlToysConvert_CaseIdentifier_Upper, aNode );
end;

{---------------------------- Sort Order Converters ---------------------------}

{ procedure for ORDER BY iteration }
procedure SqlToysConvert_SortOrder_Iteration(aProc: TSqlNodeProcedure; aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiExprList, gtkwOrder_By) then begin
    SqlToysExec_ForEach_Node( aProc, aNode, gtsiExpr );
    SqlToysExec_ForEach_Node( aProc, aNode, gtsiExprTree );
  end else
  if aNode.Check(gtsiDml, gtkwSelect) then begin
    SqlToysExec_ForEach_Node( aProc, aNode, gtsiExprList, gtkwOrder_By );
  end else
  if aNode.Check(gtsiQueryList) then begin
    SqlToysExec_ForEach_Node( aProc, aNode, gtsiDml, gtkwSelect );
  end;
end;

{ procedure removes uses short ASC/DESC keywords in ORDER BY clause }
procedure SqlToysConvert_SortOrder_ShortKeywords(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiExpr) or aNode.Check(gtsiExprTree) then begin
    if aNode.SortOrder = gtkwAscending  then aNode.SortOrder := gtkwAsc else
    if aNode.SortOrder = gtkwDescending then aNode.SortOrder := gtkwDesc ;
  end else begin
    SqlToysConvert_SortOrder_Iteration( SqlToysConvert_SortOrder_ShortKeywords, aNode );
  end;
end;

{ procedure removes uses long ASCENDING/DESCENDING keywords in ORDER BY clause }
procedure SqlToysConvert_SortOrder_LongKeywords(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiExpr) or aNode.Check(gtsiExprTree) then begin
    if aNode.SortOrder = gtkwAsc  then aNode.SortOrder := gtkwAscending else
    if aNode.SortOrder = gtkwDesc then aNode.SortOrder := gtkwDescending ;
  end else begin
    SqlToysConvert_SortOrder_Iteration( SqlToysConvert_SortOrder_LongKeywords, aNode );
  end;
end;

{ procedure adds ASC keywords in ORDER BY clause with no sort order specified }
procedure SqlToysConvert_SortOrder_AddDefaultKeywords(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiExpr) or aNode.Check(gtsiExprTree) then begin
    if aNode.SortOrder = gttkNone then aNode.SortOrder := gtkwAscending;
  end else begin
    SqlToysConvert_SortOrder_Iteration( SqlToysConvert_SortOrder_AddDefaultKeywords, aNode );
  end;
end;

{ procedure removes ASC keywords in ORDER BY clause }
procedure SqlToysConvert_SortOrder_RemoveDefaultKeywords(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiExpr) or aNode.Check(gtsiExprTree) then begin
    if (aNode.SortOrder = gtkwAsc) or (aNode.SortOrder = gtkwAscending) then aNode.SortOrder := gttkNone;
  end else begin
    SqlToysConvert_SortOrder_Iteration( SqlToysConvert_SortOrder_RemoveDefaultKeywords, aNode );
  end;
end;

{---------------------------- Datatype Converters -----------------------------}

{ converter changes datatype keyword from INT to INTEGER }
procedure SqlToysConvert_DataType_IntToInteger(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.DataType = gtkwInt then begin
    aNode.DataType := gtkwInteger;
  end;

  SqlToysExec_ForEach_DeepInside ( SqlToysConvert_DataType_IntToInteger, aNode );
end;

{ converter changes datatype keyword from INTEGER to INT }
procedure SqlToysConvert_DataType_IntegerToInt(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.DataType = gtkwInteger then begin
    aNode.DataType := gtkwInt;
  end;

  SqlToysExec_ForEach_DeepInside ( SqlToysConvert_DataType_IntegerToInt, aNode );
end;

{------------------------------- JOIN Converters ------------------------------}

{ converter changes JOIN to INNER JOIN }
procedure SqlToysConvert_Joins_AddInner(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.JoinOp = gtkwInner then aNode.JoinInnerKeyword := True;

  SqlToysExec_ForEach_DeepInside ( SqlToysConvert_Joins_AddInner, aNode );
end;

{ converter changes INNER JOIN to JOIN }
procedure SqlToysConvert_Joins_RemoveInner(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.JoinOp = gtkwInner then aNode.JoinInnerKeyword := False;

  SqlToysExec_ForEach_DeepInside ( SqlToysConvert_Joins_RemoveInner, aNode );
end;

{ converter changes LEFT/RIGHT JOIN to LEFT/RIGHT OUTER JOIN }
procedure SqlToysConvert_Joins_AddOuter(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.JoinOp = gtkwLeft) or (aNode.JoinOp = gtkwRight) or (aNode.JoinOp = gtkwFull) then aNode.JoinOuterKeyword := True;

  SqlToysExec_ForEach_DeepInside ( SqlToysConvert_Joins_AddOuter, aNode );
end;

{ converter changes LEFT/RIGHT OUTER JOIN to LEFT/RIGHT JOIN }
procedure SqlToysConvert_Joins_RemoveOuter(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.JoinOp = gtkwLeft) or (aNode.JoinOp = gtkwRight) or (aNode.JoinOp = gtkwFull) then aNode.JoinOuterKeyword := False;

  SqlToysExec_ForEach_DeepInside ( SqlToysConvert_Joins_RemoveOuter, aNode );
end;

{-------------------------- JOIN condition Converters -------------------------}

{ converts join condition }
procedure SqlToysConvert_JoinCond_RefToLeft(aNode: TGtSqlNode);
// gtstJoinCondLeftSideOrder => gtloCondLeftSideOrder => gtloCondEqualSwap
// gtstOnCondRefsFirst => moves conds w. refs to top and conds wo. refs to bottom

var sTableNameOrAlias: String;

  procedure CheckAndSwapCondExpressions(aCond: TGtSqlNode);
  begin
    if not Assigned(aCond) then Exit;
    if aCond.Kind <> gtsiCond then Exit;
    if aCond.CompOp <> gttkEqual then Exit;
    if aCond.Count <> 2 then Exit;

    if aCond[0].ExprHasReferenceTo(sTableNameOrAlias) then Exit;
    if not aCond[1].ExprHasReferenceTo(sTableNameOrAlias) then Exit;

    { swaps condition sides }
    aCond[0].Name := '2';
    aCond[1].Name := '1';
  end;

  procedure CondTreeGoDeepInside(aCondTree: TGtSqlNode);
  var i: Integer;
  begin
    if not Assigned(aCondTree) then Exit;

    for i := 0 to aCondTree.Count - 1 do
      if aCondTree[i].Kind = gtsiCond then CheckAndSwapCondExpressions(aCondTree[i]) else
      if aCondTree[i].Kind = gtsiCondTree then CondTreeGoDeepInside(aCondTree[i]);
  end;

begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiCondTree) and (aNode.Keyword = gtkwOn) then begin
    sTableNameOrAlias := aNode.OwnerTableNameOrAlias ;
    CondTreeGoDeepInside(aNode);
  end else begin
    SqlToysExec_ForEach_DeepInside ( SqlToysConvert_JoinCond_RefToLeft, aNode );
  end;
end;

end.

