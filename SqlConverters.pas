(* $Header: /SQL Toys/SqlFormatter/SqlConverters.pas 30    18-03-11 21:50 Tomek $
   (c) Tomasz Gierka, github.com/SqlToys, 2015.06.14                          *)
{--------------------------------------  --------------------------------------}
unit SqlConverters;

interface

uses SqlTokenizers, SqlStructs, SqlLister;

const { converters settings values, same as icon numbers }
  SQCV_NONE     = 0;
  SQCV_GROUP    = 1;
  SQCV_ADD      = 2;
  SQCV_REMOVE   = 3;
  SQCV_UPPER    = 4;
  SQCV_LOWER    = 5;
  SQCV_SHORT    = 6;
  SQCV_LONG     = 7;

  { converter groups }
  SQCG_NONE     = 0;
  SQCG_MAX      = 8;

  SQCG_GENERAL  = 1;
  SQCG_CASES    = 2;
  SQCG_KEYWORD  = 3;
  SQCG_DATA     = 4;
  SQCG_JOIN     = 5;
  SQCG_ORDER    = 6;
  SQCG_LINES    = 7;
  SQCG_EMPTY    = 8;

  { converters = converter items }
  SQCC_NONE              =  0;
  SQCC_MAX               = 12;

  SQCC_GEN_SEMICOLON     = 1;
  SQCC_GEN_SEMICOLON_SQ  = 2;

  SQCC_CASE_KEYWORD      = 1;
  SQCC_CASE_TABLE        = 2;
  SQCC_CASE_TABLE_ALIAS  = 3;
  SQCC_CASE_COLUMN       = 4;
  SQCC_CASE_COLUMN_ALIAS = 5;
  SQCC_CASE_COLUMN_QUOTE = 6;
  SQCC_CASE_PARAM        = 7;
  SQCC_CASE_FUNC         = 8;
  SQCC_CASE_IDENT        = 9;

  SQCC_KWD_AS_TABLES     = 1;
  SQCC_KWD_AS_COLUMNS    = 2;

  SQCC_DATA_INT          = 1;

  SQCC_JOIN_INNER        = 1;
  SQCC_JOIN_OUTER        = 2;
  SQCC_JOIN_ON_LEFT      = 3;

  SQCC_ORDER_KWD_LEN     = 1;
  SQCC_ORDER_KWD_DEF     = 2;

//SQCC_LINE_CASE_CASE    = 1;
  SQCC_LINE_CASE_WHEN    = 2; {should be subnode}
  SQCC_LINE_CASE_THEN    = 3; {should be subnode}
  SQCC_LINE_CASE_ELSE    = 4; {should be subnode}
//SQCC_LINE_CASE_END     = 5; {should be subnode}
  SQCC_LINE_BEF_CONSTR   = 6;
//SQCC_LINE_AFT_CONSTR   = 7;

  SQCC_EMPTY_BEF_CLAUSE  = 1;
  SQCC_EXC_SUBQUERY      = 2; {should be subnode}
//SQCC_EXC_SHORT_QUERY   = 3; {should be subnode}
  SQCC_EMPTY_AROUND_UNION= 4;
  SQCC_EMPTY_CMPLX_CONSTR= 5;

procedure SqlConvertExecute( aGroup, aItem, aState: Integer; aNode: TGtSqlNode );

{---------------------------- Navigation procedures ---------------------------}

//type TSqlNodeProcedure = procedure (aNode: TGtSqlNode);
//type TSqlNodeCaseProcedure = procedure (aNode: TGtSqlNode; aCase: TGtSqlCaseOption);

{ TODO: move to TGtSqlNode.ForEach, TGtSqlNode.ForEachAndDeepInside }
//procedure SqlToysExec_ForEach_Node       ( aProc: TSqlNodeProcedure;       aNode: TGtSqlNode;
//                                           aKind: TGtSqlNodeKind=gtsiNone; aKeyword: TGtLexTokenDef=nil; aName: String='');
//procedure SqlToysExec_ForEach_Node_Case  ( aProc: TSqlNodeCaseProcedure;   aNode: TGtSqlNode;
//                                           aCase: TGtSqlCaseOption = gtcoNoChange;
//                                           aKind: TGtSqlNodeKind=gtsiNone; aKeyword: TGtLexTokenDef=nil; aName: String='');
//procedure SqlToysExec_ForEach_DeepInside ( aProc: TSqlNodeProcedure; aNode: TGtSqlNode;
//                                           aKind: TGtSqlNodeKind=gtsiNone; aKeyword: TGtLexTokenDef=nil; aName: String='');

{----------------------------------- General ----------------------------------}

//procedure SqlToysConvert_ExecuteAll(aNode: TGtSqlNode; aOptions: TGtListerSettingsArray;
//                                    aCaseOpt: TGtListerCaseSettingsArray);

{------------------------------ Alias Converters ------------------------------}

//procedure SqlToysConvert_ExprAlias_AddKeyword_AS(aNode: TGtSqlNode);
//procedure SqlToysConvert_ExprAlias_RemoveKeyword_AS(aNode: TGtSqlNode);

//procedure SqlToysConvert_TableAlias_AddKeyword_AS(aNode: TGtSqlNode);
//procedure SqlToysConvert_TableAlias_RemoveKeyword_AS(aNode: TGtSqlNode);

{------------------------------ Case Converters -------------------------------}

//procedure SqlToysConvert_CaseKeyword(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
//procedure SqlToysConvert_CaseKeyword_Lower(aNode: TGtSqlNode);
//procedure SqlToysConvert_CaseKeyword_Upper(aNode: TGtSqlNode);

//procedure SqlToysConvert_CaseTableName(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
//procedure SqlToysConvert_CaseTableName_Lower(aNode: TGtSqlNode);
//procedure SqlToysConvert_CaseTableName_Upper(aNode: TGtSqlNode);

//procedure SqlToysConvert_CaseColumnName(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
//procedure SqlToysConvert_CaseColumnName_Lower(aNode: TGtSqlNode);
//procedure SqlToysConvert_CaseColumnName_Upper(aNode: TGtSqlNode);

//procedure SqlToysConvert_CaseTableAlias(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
//procedure SqlToysConvert_CaseTableAlias_Lower(aNode: TGtSqlNode);
//procedure SqlToysConvert_CaseTableAlias_Upper(aNode: TGtSqlNode);

//procedure SqlToysConvert_CaseColumnAlias(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
//procedure SqlToysConvert_CaseColumnAlias_Lower(aNode: TGtSqlNode);
//procedure SqlToysConvert_CaseColumnAlias_Upper(aNode: TGtSqlNode);

//procedure SqlToysConvert_CaseColumnQuotedAlias(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
//procedure SqlToysConvert_CaseColumnQuotedAlias_Lower(aNode: TGtSqlNode);
//procedure SqlToysConvert_CaseColumnQuotedAlias_Upper(aNode: TGtSqlNode);

//procedure SqlToysConvert_CaseParam(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
//procedure SqlToysConvert_CaseParam_Lower(aNode: TGtSqlNode);
//procedure SqlToysConvert_CaseParam_Upper(aNode: TGtSqlNode);

//procedure SqlToysConvert_CaseFunc(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
//procedure SqlToysConvert_CaseFunc_Lower(aNode: TGtSqlNode);
//procedure SqlToysConvert_CaseFunc_Upper(aNode: TGtSqlNode);

//procedure SqlToysConvert_CaseIdentifier(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
//procedure SqlToysConvert_CaseIdentifier_Lower(aNode: TGtSqlNode);
//procedure SqlToysConvert_CaseIdentifier_Upper(aNode: TGtSqlNode);

{---------------------------- Sort Order Converters ---------------------------}

//procedure SqlToysConvert_SortOrder_ShortKeywords(aNode: TGtSqlNode);
//procedure SqlToysConvert_SortOrder_LongKeywords(aNode: TGtSqlNode);

//procedure SqlToysConvert_SortOrder_AddDefaultKeywords(aNode: TGtSqlNode);
//procedure SqlToysConvert_SortOrder_RemoveDefaultKeywords(aNode: TGtSqlNode);

{---------------------------- Datatype Converters -----------------------------}

//procedure SqlToysConvert_DataType_IntToInteger(aNode: TGtSqlNode);
//procedure SqlToysConvert_DataType_IntegerToInt(aNode: TGtSqlNode);

{------------------------------- JOIN Converters ------------------------------}

//procedure SqlToysConvert_Joins_AddInner(aNode: TGtSqlNode);
//procedure SqlToysConvert_Joins_RemoveInner(aNode: TGtSqlNode);
//procedure SqlToysConvert_Joins_AddOuter(aNode: TGtSqlNode);
//procedure SqlToysConvert_Joins_RemoveOuter(aNode: TGtSqlNode);

{-------------------------- JOIN condition Converters -------------------------}

//procedure SqlToysConvert_JoinCond_RefToLeft(aNode: TGtSqlNode);

implementation

uses SysUtils;

{----------------------------------- General ----------------------------------}

{ adds semicolon to query }
procedure SqlToysConvert_Semicolon_Add(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind in [gtsiDml, gtsiDdl, gtsiDcl, gtsiTcl]) then aNode.Semicolon := True;
end;

{ removes semicolon from query }
procedure SqlToysConvert_Semicolon_Remove(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind in [gtsiDml, gtsiDdl, gtsiDcl, gtsiTcl]) then aNode.Semicolon := False;
end;

{ adds semicolon to single query }
procedure SqlToysConvert_Semicolon_SingleQuery_Add(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind in [gtsiDml, gtsiDdl, gtsiDcl, gtsiTcl]) and
     (aNode.Owner.Kind = gtsiQueryList) and (aNode.Owner.Count = 1)
      then aNode.Semicolon := True;
end;

{ removed semicolon from single query }
procedure SqlToysConvert_Semicolon_SingleQuery_Remove(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind in [gtsiDml, gtsiDdl, gtsiDcl, gtsiTcl]) and
     (aNode.Owner.Kind = gtsiQueryList) and (aNode.Owner.Count = 1)
      then aNode.Semicolon := False;
end;

//procedure SqlToysConvert_ExecuteAll(aNode: TGtSqlNode; aOptions: TGtListerSettingsArray;
//                                    aCaseOpt: TGtListerCaseSettingsArray);
//begin
//{------------------------------ Alias Converters ------------------------------}
//  if aOptions[ gtstTableAsKeywordCONVERTER ]
//    then SqlToysConvert_TableAlias_AddKeyword_AS( aNode )
//    else SqlToysConvert_TableAlias_RemoveKeyword_AS( aNode );
//
//  if aOptions[ gtstExprAsKeywordCONVERTER ]
//    then SqlToysConvert_ExprAlias_AddKeyword_AS( aNode )
//    else SqlToysConvert_ExprAlias_RemoveKeyword_AS( aNode );
//{------------------------------ Case Converters -------------------------------}
////procedure SqlToysConvert_CaseKeyword_Lower(aNode: TGtSqlNode);
////procedure SqlToysConvert_CaseKeyword_Upper(aNode: TGtSqlNode);
//
//  SqlToysConvert_CaseTableName( aNode, aCaseOpt[ gtlcTableCONVERTER ] );
////  case aCaseOpt[ gtlcTableCONVERTER ] of
////    gtcoNoChange       : ;
////    gtcoUpperCase      : SqlToysConvert_CaseTableName_Upper( aNode );
////    gtcoLowerCase      : SqlToysConvert_CaseTableName_Lower( aNode );
////    gtcoFirstCharUpper : ;
////    gtcoFirstUseCase   : ;
////  end;
//
//  SqlToysConvert_CaseColumnName( aNode, aCaseOpt[ gtlcColumnCONVERTER ] );
////  case aCaseOpt[ gtlcColumnCONVERTER ] of
////    gtcoNoChange       : ;
////    gtcoUpperCase      : SqlToysConvert_CaseColumnName_Upper( aNode );
////    gtcoLowerCase      : SqlToysConvert_CaseColumnName_Lower( aNode );
////    gtcoFirstCharUpper : ;
////    gtcoFirstUseCase   : ;
////  end;
//
//  SqlToysConvert_CaseTableAlias( aNode, aCaseOpt[ gtlcTableAliasCONVERTER ] );
////  case aCaseOpt[ gtlcTableAliasCONVERTER ] of
////    gtcoNoChange       : ;
////    gtcoUpperCase      : SqlToysConvert_CaseTableAlias_Upper( aNode );
////    gtcoLowerCase      : SqlToysConvert_CaseTableAlias_Lower( aNode );
////    gtcoFirstCharUpper : ;
////    gtcoFirstUseCase   : ;
////  end;
//
//  SqlToysConvert_CaseColumnAlias( aNode, aCaseOpt[ gtlcColumnAliasCONVERTER ] );
////  case aCaseOpt[ gtlcColumnAliasCONVERTER ] of
////    gtcoNoChange       : ;
////    gtcoUpperCase      : SqlToysConvert_CaseColumnAlias_Upper( aNode );
////    gtcoLowerCase      : SqlToysConvert_CaseColumnAlias_Lower( aNode );
////    gtcoFirstCharUpper : ;
////    gtcoFirstUseCase   : ;
////  end;
//
//  SqlToysConvert_CaseColumnQuotedAlias( aNode, aCaseOpt[ gtlcColumnQuotedAliasCONVERTER ] );
////  case aCaseOpt[ gtlcColumnQuotedAliasCONVERTER ] of
////    gtcoNoChange       : ;
////    gtcoUpperCase      : SqlToysConvert_CaseColumnQuotedAlias_Upper( aNode );
////    gtcoLowerCase      : SqlToysConvert_CaseColumnQuotedAlias_Lower( aNode );
////    gtcoFirstCharUpper : ;
////    gtcoFirstUseCase   : ;
////  end;
//
//  SqlToysConvert_CaseParam( aNode, aCaseOpt[ gtlcParameterCONVERTER ] );
////  case aCaseOpt[ gtlcParameterCONVERTER ] of
////    gtcoNoChange       : ;
////    gtcoUpperCase      : SqlToysConvert_CaseParam_Upper( aNode );
////    gtcoLowerCase      : SqlToysConvert_CaseParam_Lower( aNode );
////    gtcoFirstCharUpper : ;
////    gtcoFirstUseCase   : ;
////  end;
//
//  SqlToysConvert_CaseFunc( aNode, aCaseOpt[ gtlcFunctionCONVERTER ] );
////  case aCaseOpt[ gtlcFunctionCONVERTER ] of
////    gtcoNoChange       : ;
////    gtcoUpperCase      : SqlToysConvert_CaseFunc_Upper( aNode );
////    gtcoLowerCase      : SqlToysConvert_CaseFunc_Lower( aNode );
////    gtcoFirstCharUpper : ;
////    gtcoFirstUseCase   : ;
////  end;
//
//  SqlToysConvert_CaseIdentifier( aNode, aCaseOpt[ gtlcIdentifierCONVERTER ] );
////  case aCaseOpt[ gtlcIdentifierCONVERTER ] of
////    gtcoNoChange       : ;
////    gtcoUpperCase      : SqlToysConvert_CaseIdentifier_Upper( aNode );
////    gtcoLowerCase      : SqlToysConvert_CaseIdentifier_Lower( aNode );
////    gtcoFirstCharUpper : ;
////    gtcoFirstUseCase   : ;
////  end;
//{---------------------------- Sort Order Converters ---------------------------}
//  if aOptions[ gtstSortShortCONVERTER ]
//    then SqlToysConvert_SortOrder_ShortKeywords( aNode )
//    else SqlToysConvert_SortOrder_LongKeywords( aNode );
//
//  if aOptions[ gtstSkipAscendingCONVERTER ]
//    then SqlToysConvert_SortOrder_RemoveDefaultKeywords( aNode )
//    else SqlToysConvert_SortOrder_AddDefaultKeywords( aNode );
//{---------------------------- Datatype Converters -----------------------------}
//
////procedure SqlToysConvert_DataType_IntToInteger(aNode: TGtSqlNode);
////procedure SqlToysConvert_DataType_IntegerToInt(aNode: TGtSqlNode);
//
//{------------------------------- JOIN Converters ------------------------------}
//  if aOptions[ gtstInnerJoinCONVERTER ]
//    then SqlToysConvert_Joins_AddInner( aNode )
//    else SqlToysConvert_Joins_RemoveInner( aNode );
//
//  if aOptions[ gtstOuterJoinCONVERTER ]
//    then SqlToysConvert_Joins_AddOuter( aNode )
//    else SqlToysConvert_Joins_RemoveOuter( aNode );
//{-------------------------- JOIN condition Converters -------------------------}
////  if aOptions[ gtstOnCondRefsFirstCONVERTER ]
//  if aOptions[ gtstJoinCondLeftSideOrderCONVERTER ]
//    then SqlToysConvert_JoinCond_RefToLeft( aNode );
//end;

{---------------------------- Navigation procedures ---------------------------}

{ calls aProc for each node in aNode list }
//procedure SqlToysExec_ForEach_Node       ( aProc: TSqlNodeProcedure;       aNode: TGtSqlNode;
//                                           aKind: TGtSqlNodeKind=gtsiNone; aKeyword: TGtLexTokenDef=nil; aName: String='');
////var i: Integer;
//begin
//  if not Assigned(aNode) then Exit;
//
//  aNode.ForEach( aProc, False, {aNode,} aKind, aKeyword, aName );
//
////  if not Assigned(aNode) then Exit;
////
////  for i := 0 to aNode.Count -1 do
////    if aNode[i].Check(aKind, aKeyword, aName) then aProc(aNode[i]);
//end;

//procedure SqlToysExec_ForEach_Node_Case  ( aProc: TSqlNodeCaseProcedure;   aNode: TGtSqlNode;
//                                           aCase: TGtSqlCaseOption = gtcoNoChange;
//                                           aKind: TGtSqlNodeKind=gtsiNone; aKeyword: TGtLexTokenDef=nil; aName: String='');
//var i: Integer;
//begin
//  if not Assigned(aNode) then Exit;
//
//  for i := 0 to aNode.Count -1 do
//    if aNode[i].Check(aKind, aKeyword, aName) then aProc(aNode[i], aCase);
//end;

{ calls aProc for each node and its subnodes in aNode list }
//procedure SqlToysExec_ForEach_DeepInside ( aProc: TSqlNodeProcedure; aNode: TGtSqlNode;
//                                           aKind: TGtSqlNodeKind=gtsiNone; aKeyword: TGtLexTokenDef=nil; aName: String='');
////var i: Integer;
//begin
//  if not Assigned(aNode) then Exit;
//
//  aNode.ForEach( aProc, {aNode,} aKind, aKeyword, aName, True );
//
////  for i := 0 to aNode.Count -1 do begin
////    if aNode[i].Check(aKind, aKeyword, aName) then aProc(aNode[i]);
////
////    { recursive call for each node }
////    SqlToysExec_ForEach_DeepInside( aProc, aNode[i], aKind, aKeyword, aName );
////  end;
//end;

{--------------------------------- Converters ---------------------------------}

{ procedure for SELECT expr list iteration }
procedure SqlToysConvert_ExprAlias_Iteration(aProc: TSqlNodeProcedure; aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiExprList, gtkwSelect) then begin
    aNode.ForEach( aProc, False, gtsiExpr );
    aNode.ForEach( aProc, False, gtsiExprTree );
  end else
  if aNode.Check(gtsiDml, gtkwSelect) then begin
    aNode.ForEach( aProc, False, gtsiExprList, gtkwSelect );
  end else
  if aNode.Check(gtsiQueryList) then begin
    aNode.ForEach( aProc, False, gtsiDml, gtkwSelect );
  end;
end;

{ procedure adds keyword AS to each top level expression in SELECT clause }
procedure SqlToysConvert_ExprAlias_AddKeyword_AS(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiExpr) or aNode.Check(gtsiExprTree) then begin
    aNode.AliasAsToken := aNode.AliasName <> '';
  end else begin
    SqlToysConvert_ExprAlias_Iteration( SqlToysConvert_ExprAlias_AddKeyword_AS, aNode );
  end;
end;

{ procedure removes keyword AS from each top level expression in SELECT clause }
procedure SqlToysConvert_ExprAlias_RemoveKeyword_AS(aNode: TGtSqlNode);
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
    aNode.ForEach( aProc, False, gtsiTableRef );
  end else
  if aNode.Check(gtsiDml, gtkwSelect) then begin
    aNode.ForEach( aProc, False, gtsiClauseTables );
  end else
  if aNode.Check(gtsiQueryList) then begin
    aNode.ForEach( aProc, False, gtsiDml, gtkwSelect );
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

//procedure SqlToysConvert_CaseKeyword(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
//begin
//  if not Assigned(aNode) then Exit;
//
//  if aNode.Keyword <> gttkNone then aNode.Keyword := aNode.Keyword ;
//
//  SqlToysExec_ForEach_Node_Case( SqlToysConvert_CaseKeyword, aNode, aCase );
//end;

{ procedure changes upper case keywords to lower case }
procedure SqlToysConvert_CaseKeyword_Lower(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

//  SqlToysExec_ForEach_Node( SqlToysConvert_CaseKeyword_Lower, aNode );
end;

{ procedure changes upper case keywords to lower case }
procedure SqlToysConvert_CaseKeyword_Upper(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Keyword <> gttkNone then aNode.Keyword := aNode.Keyword ;

//  SqlToysExec_ForEach_Node( SqlToysConvert_CaseKeyword_Upper, aNode );
end;

//procedure SqlToysConvert_CaseTableName(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
//begin
//  if not Assigned(aNode) then Exit;
//
//  if aNode.Kind = gtsiTableRef
//    then aNode.Name := UpperLowerStr( aNode.Name, aCase );
//
//  SqlToysExec_ForEach_Node_Case( SqlToysConvert_CaseTableName, aNode, aCase );
//end;

procedure SqlToysConvert_CaseTableName_Lower(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Kind = gtsiTableRef
    then aNode.Name := AnsiLowerCase( aNode.Name );

//  SqlToysExec_ForEach_Node( SqlToysConvert_CaseTableName_Lower, aNode );
end;

procedure SqlToysConvert_CaseTableName_Upper(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Kind = gtsiTableRef
    then aNode.Name := AnsiUpperCase( aNode.Name );

//  SqlToysExec_ForEach_Node( SqlToysConvert_CaseTableName_Upper, aNode );
end;

//procedure SqlToysConvert_CaseTableAlias(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
//begin
//  if not Assigned(aNode) then Exit;
//
//  if aNode.Kind = gtsiTableRef
//    then aNode.AliasName := UpperLowerStr( aNode.AliasName, aCase );
//
//  SqlToysExec_ForEach_Node_Case( SqlToysConvert_CaseTableAlias, aNode, aCase );
//end;

procedure SqlToysConvert_CaseTableAlias_Lower(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Kind = gtsiTableRef
    then aNode.AliasName := AnsiLowerCase( aNode.AliasName );

//  SqlToysExec_ForEach_Node( SqlToysConvert_CaseTableAlias_Lower, aNode );
end;

procedure SqlToysConvert_CaseTableAlias_Upper(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Kind = gtsiTableRef
    then aNode.AliasName := AnsiUpperCase( aNode.AliasName );

//  SqlToysExec_ForEach_Node( SqlToysConvert_CaseTableAlias_Upper, aNode );
end;

//procedure SqlToysConvert_CaseColumnName(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
//begin
//  if not Assigned(aNode) then Exit;
//
//  if (aNode.Kind = gtsiExpr) and (aNode.Keyword <> gttkParameterName) and (aNode.Name <> '')
//                             and (aNode.Keyword <> gtkwFunction)
//    then aNode.Name := UpperLowerStr( aNode.Name, aCase );
//
//  SqlToysExec_ForEach_Node_Case( SqlToysConvert_CaseColumnName, aNode, aCase );
//end;

procedure SqlToysConvert_CaseColumnName_Lower(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Keyword <> gttkParameterName) and (aNode.Name <> '')
                             and (aNode.Keyword <> gtkwFunction)
    then aNode.Name := AnsiLowerCase( aNode.Name );

//  SqlToysExec_ForEach_Node( SqlToysConvert_CaseColumnName_Lower, aNode );
end;

procedure SqlToysConvert_CaseColumnName_Upper(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Keyword <> gttkParameterName) and (aNode.Name <> '')
                             and (aNode.Keyword <> gtkwFunction)
    then aNode.Name := AnsiUpperCase( aNode.Name );

//  SqlToysExec_ForEach_Node( SqlToysConvert_CaseColumnName_Upper, aNode );
end;

//procedure SqlToysConvert_CaseColumnAlias(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
//begin
//  if not Assigned(aNode) then Exit;
//
//  if (aNode.Kind = gtsiExprTree) and (aNode.AliasName <> '') and (Copy(aNode.AliasName,1,1) <> '"')
//    then aNode.AliasName := UpperLowerStr( aNode.AliasName, aCase );
//
//  SqlToysExec_ForEach_Node_Case( SqlToysConvert_CaseColumnAlias, aNode, aCase );
//end;

procedure SqlToysConvert_CaseColumnAlias_Lower(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExprTree) and (aNode.AliasName <> '') and (Copy(aNode.AliasName,1,1) <> '"')
    then aNode.AliasName := AnsiLowerCase( aNode.AliasName );

//  SqlToysExec_ForEach_Node( SqlToysConvert_CaseColumnAlias_Lower, aNode );
end;

procedure SqlToysConvert_CaseColumnAlias_Upper(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExprTree) and (aNode.AliasName <> '') and (Copy(aNode.AliasName,1,1) <> '"')
    then aNode.AliasName := AnsiUpperCase( aNode.AliasName );

//  SqlToysExec_ForEach_Node( SqlToysConvert_CaseColumnAlias_Upper, aNode );
end;

//procedure SqlToysConvert_CaseParam(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
//begin
//  if not Assigned(aNode) then Exit;
//
//  if (aNode.Kind = gtsiExpr) and (aNode.Keyword = gttkParameterName) and (aNode.Name <> '')
//    then aNode.Name := UpperLowerStr( aNode.Name, aCase );
//
//  SqlToysExec_ForEach_Node_Case( SqlToysConvert_CaseParam, aNode, aCase );
//end;

procedure SqlToysConvert_CaseParam_Lower(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Keyword = gttkParameterName) and (aNode.Name <> '')
    then aNode.Name := AnsiLowerCase( aNode.Name );

//  SqlToysExec_ForEach_Node( SqlToysConvert_CaseParam_Lower, aNode );
end;

procedure SqlToysConvert_CaseParam_Upper(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Keyword = gttkParameterName) and (aNode.Name <> '')
    then aNode.Name := AnsiUpperCase( aNode.Name );

//  SqlToysExec_ForEach_Node( SqlToysConvert_CaseParam_Upper, aNode );
end;

//procedure SqlToysConvert_CaseFunc(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
//begin
//  if not Assigned(aNode) then Exit;
//
//  if (aNode.Kind = gtsiExpr) and (aNode.Name <> '') and (aNode.Keyword = gtkwFunction)
//    then aNode.Name := UpperLowerStr( aNode.Name, aCase );
//
//  SqlToysExec_ForEach_Node_Case( SqlToysConvert_CaseFunc, aNode, aCase );
//end;

procedure SqlToysConvert_CaseFunc_Lower(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Name <> '') and (aNode.Keyword = gtkwFunction)
    then aNode.Name := AnsiLowerCase( aNode.Name );

//  SqlToysExec_ForEach_Node( SqlToysConvert_CaseFunc_Lower, aNode );
end;

procedure SqlToysConvert_CaseFunc_Upper(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Name <> '') and (aNode.Keyword = gtkwFunction)
    then aNode.Name := AnsiUpperCase( aNode.Name );

//  SqlToysExec_ForEach_Node( SqlToysConvert_CaseFunc_Upper, aNode );
end;

//procedure SqlToysConvert_CaseColumnQuotedAlias(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
//begin
//  if not Assigned(aNode) then Exit;
//
//  if (aNode.Kind = gtsiExprTree) and (aNode.AliasName <> '') and (Copy(aNode.AliasName,1,1) = '"')
//    then aNode.AliasName := UpperLowerStr( aNode.AliasName, aCase );
//
//  SqlToysExec_ForEach_Node_Case( SqlToysConvert_CaseColumnQuotedAlias, aNode, aCase );
//end;

procedure SqlToysConvert_CaseColumnQuotedAlias_Lower(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExprTree) and (aNode.AliasName <> '') and (Copy(aNode.AliasName,1,1) = '"')
    then aNode.AliasName := AnsiLowerCase( aNode.AliasName );

//  SqlToysExec_ForEach_Node( SqlToysConvert_CaseColumnQuotedAlias_Lower, aNode );
end;

procedure SqlToysConvert_CaseColumnQuotedAlias_Upper(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExprTree) and (aNode.AliasName <> '') and (Copy(aNode.AliasName,1,1) = '"')
    then aNode.AliasName := AnsiUpperCase( aNode.AliasName );

//  SqlToysExec_ForEach_Node( SqlToysConvert_CaseColumnQuotedAlias_Upper, aNode );
end;

//procedure SqlToysConvert_CaseIdentifier(aNode: TGtSqlNode; aCase: TGtSqlCaseOption = gtcoNoChange);
//begin
//  if not Assigned(aNode) then Exit;
//
//  if (aNode.Kind = gtsiExpr) and (aNode.Name <> '') and (aNode.Keyword = gttkIdentifier)
//    then aNode.Name := UpperLowerStr( aNode.Name, aCase );
//
//  SqlToysExec_ForEach_Node_Case( SqlToysConvert_CaseIdentifier, aNode, aCase );
//end;

procedure SqlToysConvert_CaseIdentifier_Lower(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Name <> '') and (aNode.Keyword = gttkIdentifier)
    then aNode.Name := AnsiLowerCase( aNode.Name );

//  SqlToysExec_ForEach_Node( SqlToysConvert_CaseIdentifier_Lower, aNode );
end;

procedure SqlToysConvert_CaseIdentifier_Upper(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiExpr) and (aNode.Name <> '') and (aNode.Keyword = gttkIdentifier)
    then aNode.Name := AnsiUpperCase( aNode.Name );

//  SqlToysExec_ForEach_Node( SqlToysConvert_CaseIdentifier_Upper, aNode );
end;

{---------------------------- Sort Order Converters ---------------------------}

{ procedure for ORDER BY iteration }
procedure SqlToysConvert_SortOrder_Iteration(aProc: TSqlNodeProcedure; aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiExprList, gtkwOrder_By) then begin
    aNode.ForEach( aProc, False, gtsiExpr );
    aNode.ForEach( aProc, False, gtsiExprTree );
  end else
  if aNode.Check(gtsiDml, gtkwSelect) then begin
    aNode.ForEach( aProc, False, gtsiExprList, gtkwOrder_By );
  end else
  if aNode.Check(gtsiQueryList) then begin
    aNode.ForEach( aProc, False, gtsiDml, gtkwSelect );
  end;
end;

{ procedure removes uses short ASC/DESC keywords in ORDER BY clause }
procedure SqlToysConvert_SortOrder_ShortKeywords(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiExpr) or aNode.Check(gtsiExprTree) then begin
    if aNode.SortOrder = gtkwAscending  then aNode.SortOrder := gtkwAsc else
    if aNode.SortOrder = gtkwDescending then aNode.SortOrder := gtkwDesc ;
//  end else begin
//    SqlToysConvert_SortOrder_Iteration( SqlToysConvert_SortOrder_ShortKeywords, aNode );
  end;
end;

{ procedure removes uses long ASCENDING/DESCENDING keywords in ORDER BY clause }
procedure SqlToysConvert_SortOrder_LongKeywords(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiExpr) or aNode.Check(gtsiExprTree) then begin
    if aNode.SortOrder = gtkwAsc  then aNode.SortOrder := gtkwAscending else
    if aNode.SortOrder = gtkwDesc then aNode.SortOrder := gtkwDescending ;
//  end else begin
//    SqlToysConvert_SortOrder_Iteration( SqlToysConvert_SortOrder_LongKeywords, aNode );
  end;
end;

{ procedure adds ASC keywords in ORDER BY clause with no sort order specified }
procedure SqlToysConvert_SortOrder_AddDefaultKeywords(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiExpr) or aNode.Check(gtsiExprTree) then begin
    if aNode.SortOrder = gttkNone then aNode.SortOrder := gtkwAscending;
//  end else begin
//    SqlToysConvert_SortOrder_Iteration( SqlToysConvert_SortOrder_AddDefaultKeywords, aNode );
  end;
end;

{ procedure removes ASC keywords in ORDER BY clause }
procedure SqlToysConvert_SortOrder_RemoveDefaultKeywords(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiExpr) or aNode.Check(gtsiExprTree) then begin
    if (aNode.SortOrder = gtkwAsc) or (aNode.SortOrder = gtkwAscending) then aNode.SortOrder := gttkNone;
//  end else begin
//    SqlToysConvert_SortOrder_Iteration( SqlToysConvert_SortOrder_RemoveDefaultKeywords, aNode );
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

//  SqlToysExec_ForEach_DeepInside ( SqlToysConvert_DataType_IntToInteger, aNode );
end;

{ converter changes datatype keyword from INTEGER to INT }
procedure SqlToysConvert_DataType_IntegerToInt(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.DataType = gtkwInteger then begin
    aNode.DataType := gtkwInt;
  end;

//  SqlToysExec_ForEach_DeepInside ( SqlToysConvert_DataType_IntegerToInt, aNode );
end;

{------------------------------- JOIN Converters ------------------------------}

{ converter changes JOIN to INNER JOIN }
procedure SqlToysConvert_Joins_AddInner(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.{JoinOp} Operand = gtkwInner then aNode.JoinInnerKeyword := True;

//  SqlToysExec_ForEach_DeepInside ( SqlToysConvert_Joins_AddInner, aNode );
end;

{ converter changes INNER JOIN to JOIN }
procedure SqlToysConvert_Joins_RemoveInner(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.{JoinOp} Operand = gtkwInner then aNode.JoinInnerKeyword := False;

//  SqlToysExec_ForEach_DeepInside ( SqlToysConvert_Joins_RemoveInner, aNode );
end;

{ converter changes LEFT/RIGHT JOIN to LEFT/RIGHT OUTER JOIN }
procedure SqlToysConvert_Joins_AddOuter(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.{JoinOp} Operand = gtkwLeft) or (aNode.{JoinOp} Operand = gtkwRight) or (aNode.{JoinOp} Operand = gtkwFull) then aNode.JoinOuterKeyword := True;

//  SqlToysExec_ForEach_DeepInside ( SqlToysConvert_Joins_AddOuter, aNode );
end;

{ converter changes LEFT/RIGHT OUTER JOIN to LEFT/RIGHT JOIN }
procedure SqlToysConvert_Joins_RemoveOuter(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.{JoinOp} Operand = gtkwLeft) or (aNode.{JoinOp} Operand = gtkwRight) or (aNode.{JoinOp} Operand = gtkwFull) then aNode.JoinOuterKeyword := False;

//  SqlToysExec_ForEach_DeepInside ( SqlToysConvert_Joins_RemoveOuter, aNode );
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
    if aCond.{CompOp} Operand <> gttkEqual then Exit;
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
//  end else begin
//    SqlToysExec_ForEach_DeepInside ( SqlToysConvert_JoinCond_RefToLeft, aNode );
  end;
end;

{--------------------------------- Empty lines --------------------------------}

{ procedure adds empty line before clause }
procedure SqlToysConvert_EmptyLine_Clause_Add(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Owner.Kind = gtsiDml) and not aNode.IsSubQuery and not aNode.IsShortQuery and aNode.IsClauseKeyword
//     ((aNode.Keyword = gtkwSelect) or
//      (aNode.Keyword = gtkwFrom) or (aNode.Keyword = gtkwWhere) or (aNode.Keyword = gtkwGroup_By) or
//      (aNode.Keyword = gtkwHaving) or (aNode.Keyword = gtkwOrder_By) or (aNode.Keyword = gtkwConnect_By) or
//      (aNode.Keyword = gtkwSet) or (aNode.Keyword = gtkwValues))
    then aNode.EmptyLineBefore := True;
end;

{ procedure removes empty line before clause }
procedure SqlToysConvert_EmptyLine_Clause_Remove(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Owner.Kind = gtsiDml) and not aNode.IsSubQuery and not aNode.IsShortQuery and aNode.IsClauseKeyword
//     ((aNode.Keyword = gtkwSelect) or
//      (aNode.Keyword = gtkwFrom) or (aNode.Keyword = gtkwWhere) or (aNode.Keyword = gtkwGroup_By) or
//      (aNode.Keyword = gtkwHaving) or (aNode.Keyword = gtkwOrder_By) or (aNode.Keyword = gtkwConnect_By) or
//      (aNode.Keyword = gtkwSet) or (aNode.Keyword = gtkwValues))
    then aNode.EmptyLineBefore := False;
end;

{ procedure adds empty line before clause in subqueries }
procedure SqlToysConvert_EmptyLine_ClauseSubquery_Add(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Owner.Kind = gtsiDml) and aNode.IsSubQuery and not aNode.IsShortQuery and aNode.IsClauseKeyword
//     ((aNode.Keyword = gtkwSelect) or
//      (aNode.Keyword = gtkwFrom) or (aNode.Keyword = gtkwWhere) or (aNode.Keyword = gtkwGroup_By) or
//      (aNode.Keyword = gtkwHaving) or (aNode.Keyword = gtkwOrder_By) or (aNode.Keyword = gtkwConnect_By) or
//      (aNode.Keyword = gtkwSet) or (aNode.Keyword = gtkwValues))
    then aNode.EmptyLineBefore := True;
end;

{ procedure removes empty line before clause in subqueries }
procedure SqlToysConvert_EmptyLine_ClauseSubquery_Remove(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Owner.Kind = gtsiDml) and aNode.IsSubQuery and not aNode.IsShortQuery and aNode.IsClauseKeyword
//     ((aNode.Keyword = gtkwSelect) or
//      (aNode.Keyword = gtkwFrom) or (aNode.Keyword = gtkwWhere) or (aNode.Keyword = gtkwGroup_By) or
//      (aNode.Keyword = gtkwHaving) or (aNode.Keyword = gtkwOrder_By) or (aNode.Keyword = gtkwConnect_By) or
//      (aNode.Keyword = gtkwSet) or (aNode.Keyword = gtkwValues))
    then aNode.EmptyLineBefore := False;
end;

{ procedure adds empty line before clause in short queries }
procedure SqlToysConvert_EmptyLine_ClauseShortQuery_Add(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Owner.Kind = gtsiDml) and not aNode.IsSubQuery and aNode.IsShortQuery and aNode.IsClauseKeyword
//     ((aNode.Keyword = gtkwSelect) or
//      (aNode.Keyword = gtkwFrom) or (aNode.Keyword = gtkwWhere) or (aNode.Keyword = gtkwGroup_By) or
//      (aNode.Keyword = gtkwHaving) or (aNode.Keyword = gtkwOrder_By) or (aNode.Keyword = gtkwConnect_By) or
//      (aNode.Keyword = gtkwSet) or (aNode.Keyword = gtkwValues))
    then aNode.EmptyLineBefore := True;
end;

{ procedure removes empty line before clause in short queries }
procedure SqlToysConvert_EmptyLine_ClauseShortQuery_Remove(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Owner.Kind = gtsiDml) and not aNode.IsSubQuery and aNode.IsShortQuery and aNode.IsClauseKeyword
//     ((aNode.Keyword = gtkwSelect) or
//      (aNode.Keyword = gtkwFrom) or (aNode.Keyword = gtkwWhere) or (aNode.Keyword = gtkwGroup_By) or
//      (aNode.Keyword = gtkwHaving) or (aNode.Keyword = gtkwOrder_By) or (aNode.Keyword = gtkwConnect_By) or
//      (aNode.Keyword = gtkwSet) or (aNode.Keyword = gtkwValues))
    then aNode.EmptyLineBefore := False;
end;

{ procedure adds empty line around UNION, MINUS, etc }
procedure SqlToysConvert_EmptyLine_Union_Add(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiUnions) then begin
    aNode.EmptyLineBefore := True;
    aNode.EmptyLineAfter  := True;
  end;
end;

{ procedure adds empty line around UNION, MINUS, etc }
procedure SqlToysConvert_EmptyLine_Union_Remove(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if (aNode.Kind = gtsiUnions) then begin
    aNode.EmptyLineBefore := False;
    aNode.EmptyLineAfter  := False;
  end;
end;

{ procedure adds empty line before CASE }
//procedure SqlToysConvert_NewLine_Case_Add(aNode: TGtSqlNode);
//begin
//  if not Assigned(aNode) then Exit;
//
//  if aNode.Check(gtsiExpr, gtkwCase) then aNode.NewLineBefore := True;
//end;

{ procedure removes empty line before CASE }
//procedure SqlToysConvert_NewLine_Case_Remove(aNode: TGtSqlNode);
//begin
//  if not Assigned(aNode) then Exit;
//
//  if aNode.Check(gtsiExpr, gtkwCase) then aNode.NewLineBefore := False;
//end;

{ procedure adds empty line before WHEN }
procedure SqlToysConvert_NewLine_When_Add(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiCondTree, gtkwWhen) or aNode.Check(gtsiExprTree, gtkwWhen)
    then aNode.NewLineBefore := True;
end;

{ procedure removes empty line before WHEN }
procedure SqlToysConvert_NewLine_When_Remove(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiCondTree, gtkwWhen) or aNode.Check(gtsiExprTree, gtkwWhen)
    then aNode.NewLineBefore := False;
end;

{ procedure adds empty line before THEN }
procedure SqlToysConvert_NewLine_Then_Add(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiExprTree, gtkwThen) then aNode.NewLineBefore := True;
end;

{ procedure removes empty line before THEN }
procedure SqlToysConvert_NewLine_Then_Remove(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiExprTree, gtkwThen) then aNode.NewLineBefore := False;
end;

{ procedure adds empty line before ELSE }
procedure SqlToysConvert_NewLine_Else_Add(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiExprTree, gtkwElse) then aNode.NewLineBefore := True;
end;

{ procedure removes empty line before ELSE }
procedure SqlToysConvert_NewLine_Else_Remove(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiExprTree, gtkwElse) then aNode.NewLineBefore := False;
end;

{ procedure adds empty line before END }
//procedure SqlToysConvert_NewLine_End_Add(aNode: TGtSqlNode);
//begin
//  if not Assigned(aNode) then Exit;
//
//  if aNode.Check(gtsiExpr, gtkwEnd) then aNode.NewLineBefore := True;
//end;

{ procedure removes empty line before END }
//procedure SqlToysConvert_NewLine_End_Remove(aNode: TGtSqlNode);
//begin
//  if not Assigned(aNode) then Exit;
//
//  if aNode.Check(gtsiExpr, gtkwEnd) then aNode.NewLineBefore := False;
//end;

{ adds empty line before CREATE TABLE CONSTRAINT }
procedure SqlToysConvert_NewLine_Bef_Constraint_Add(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiConstraint) then aNode.NewLineBefore := True;
end;

{ removes empty line before CREATE TABLE CONSTRAINT }
procedure SqlToysConvert_NewLine_Bef_Constraint_Remove(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiConstraint) then aNode.NewLineBefore := False;
end;

{ adds empty line after CREATE TABLE CONSTRAINT }
procedure SqlToysConvert_NewLine_Aft_Constraint_Add(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiConstraint) then aNode.NewLineAfter := True;
end;

{ removes empty line after CREATE TABLE CONSTRAINT }
procedure SqlToysConvert_NewLine_Aft_Constraint_Remove(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiConstraint) then aNode.NewLineAfter := False;
end;

{ adds empty line before complex CONSTRAINT }
procedure SqlToysConvert_EmptyLine_Complex_Constraint_Add(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiConstraint) and not aNode.SingleColumnConstraint
    then aNode.EmptyLineBefore := True;
end;

{ removes empty line before complex CONSTRAINT }
procedure SqlToysConvert_EmptyLine_Complex_Constraint_Remove(aNode: TGtSqlNode);
begin
  if not Assigned(aNode) then Exit;

  if aNode.Check(gtsiConstraint) and not aNode.SingleColumnConstraint
    then aNode.EmptyLineBefore := False;
end;

{----------------------------------- General ----------------------------------}

{ executes converter }
procedure SqlConvertExecute( aGroup, aItem, aState: Integer; aNode: TGtSqlNode ); overload;
begin
  case aGroup of
    SQCG_GENERAL  : case aItem of
                      SQCC_GEN_SEMICOLON     : case aState of
                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_Semicolon_Add, False {True} );
                                                 SQCV_REMOVE : aNode.ForEach( SqlToysConvert_Semicolon_Remove, False {True} );
                                               end;
                      SQCC_GEN_SEMICOLON_SQ  : case aState of
                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_Semicolon_SingleQuery_Add, False {True} );
                                                 SQCV_REMOVE : aNode.ForEach( SqlToysConvert_Semicolon_SingleQuery_Remove, False {True} );
                                               end;
                    end;
    SQCG_CASES    : case aItem of
                      SQCC_CASE_KEYWORD      : case aState of
                                                 SQCV_UPPER  : aNode.ForEach( SqlToysConvert_CaseKeyword_Upper, True );
                                                 SQCV_LOWER  : aNode.ForEach( SqlToysConvert_CaseKeyword_Lower, True );
                                               end;
                      SQCC_CASE_TABLE        : case aState of
                                                 SQCV_UPPER  : aNode.ForEach( SqlToysConvert_CaseTableName_Upper, True );
                                                 SQCV_LOWER  : aNode.ForEach( SqlToysConvert_CaseTableName_Lower, True );
                                               end;
                      SQCC_CASE_TABLE_ALIAS  : case aState of
                                                 SQCV_UPPER  : aNode.ForEach( SqlToysConvert_CaseTableAlias_Upper, True );
                                                 SQCV_LOWER  : aNode.ForEach( SqlToysConvert_CaseTableAlias_Lower, True );
                                               end;
                      SQCC_CASE_COLUMN       : case aState of
                                                 SQCV_UPPER  : aNode.ForEach( SqlToysConvert_CaseColumnName_Upper, True );
                                                 SQCV_LOWER  : aNode.ForEach( SqlToysConvert_CaseColumnName_Lower, True );
                                               end;
                      SQCC_CASE_COLUMN_ALIAS : case aState of
                                                 SQCV_UPPER  : aNode.ForEach( SqlToysConvert_CaseColumnAlias_Upper, True );
                                                 SQCV_LOWER  : aNode.ForEach( SqlToysConvert_CaseColumnAlias_Lower, True );
                                               end;
                      SQCC_CASE_COLUMN_QUOTE : case aState of
                                                 SQCV_UPPER  : aNode.ForEach( SqlToysConvert_CaseColumnQuotedAlias_Upper, True );
                                                 SQCV_LOWER  : aNode.ForEach( SqlToysConvert_CaseColumnQuotedAlias_Lower, True );
                                               end;
                      SQCC_CASE_PARAM        : case aState of
                                                 SQCV_UPPER  : aNode.ForEach( SqlToysConvert_CaseParam_Upper, True );
                                                 SQCV_LOWER  : aNode.ForEach( SqlToysConvert_CaseParam_Lower, True );
                                               end;
                      SQCC_CASE_FUNC         : case aState of
                                                 SQCV_UPPER  : aNode.ForEach( SqlToysConvert_CaseFunc_Upper, True );
                                                 SQCV_LOWER  : aNode.ForEach( SqlToysConvert_CaseFunc_Lower, True );
                                               end;
                      SQCC_CASE_IDENT        : case aState of
                                                 SQCV_UPPER  : aNode.ForEach( SqlToysConvert_CaseIdentifier_Upper, True );
                                                 SQCV_LOWER  : aNode.ForEach( SqlToysConvert_CaseIdentifier_Lower, True );
                                               end;
                    end;
    SQCG_KEYWORD  : case aItem of
                      SQCC_KWD_AS_TABLES     : case aState of
                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_TableAlias_AddKeyword_AS, True );
                                                 SQCV_REMOVE : aNode.ForEach( SqlToysConvert_TableAlias_RemoveKeyword_AS, True );
                                               end;
                      SQCC_KWD_AS_COLUMNS    : case aState of
                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_ExprAlias_AddKeyword_AS, True );
                                                 SQCV_REMOVE : aNode.ForEach( SqlToysConvert_ExprAlias_RemoveKeyword_AS, True );
                                               end;
                    end;
    SQCG_DATA     : case aItem of
                      SQCC_DATA_INT          : case aState of
                                                 SQCV_SHORT  : aNode.ForEach( SqlToysConvert_DataType_IntegerToInt, True );
                                                 SQCV_LONG   : aNode.ForEach( SqlToysConvert_DataType_IntToInteger, True );
                                               end;
                    end;
    SQCG_JOIN     : case aItem of
                      SQCC_JOIN_INNER        : case aState of
                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_Joins_AddInner, True );
                                                 SQCV_REMOVE : aNode.ForEach( SqlToysConvert_Joins_RemoveInner, True );
                                               end;
                      SQCC_JOIN_OUTER        : case aState of
                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_Joins_AddOuter, True );
                                                 SQCV_REMOVE : aNode.ForEach( SqlToysConvert_Joins_RemoveOuter, True );
                                               end;
                      SQCC_JOIN_ON_LEFT      : case aState of
                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_JoinCond_RefToLeft, True );
                                               end;
                    end;
    SQCG_ORDER    : case aItem of
                      SQCC_ORDER_KWD_LEN     : case aState of
                                                 SQCV_SHORT  : aNode.ForEach( SqlToysConvert_SortOrder_ShortKeywords, True );
                                                 SQCV_LONG   : aNode.ForEach( SqlToysConvert_SortOrder_LongKeywords, True );
                                               end;
                      SQCC_ORDER_KWD_DEF     : case aState of
                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_SortOrder_AddDefaultKeywords, True );
                                                 SQCV_REMOVE : aNode.ForEach( SqlToysConvert_SortOrder_RemoveDefaultKeywords, True );
                      end;
                    end;
    SQCG_LINES    : case aItem of
//                      SQCC_LINE_CASE_CASE    : case aState of
//                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_NewLine_Case_Add, True );
//                                                 SQCV_REMOVE : aNode.ForEach( SqlToysConvert_NewLine_Case_Remove, True );
//                                               end;
                      SQCC_LINE_CASE_WHEN    : case aState of
                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_NewLine_When_Add, True );
                                                 SQCV_REMOVE : aNode.ForEach( SqlToysConvert_NewLine_When_Remove, True );
                                               end;
                      SQCC_LINE_CASE_THEN    : case aState of
                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_NewLine_Then_Add, True );
                                                 SQCV_REMOVE : aNode.ForEach( SqlToysConvert_NewLine_Then_Remove, True );
                                               end;
                      SQCC_LINE_CASE_ELSE    : case aState of
                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_NewLine_Else_Add, True );
                                                 SQCV_REMOVE : aNode.ForEach( SqlToysConvert_NewLine_Else_Remove, True );
                                               end;
//                      SQCC_LINE_CASE_END     : case aState of
//                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_NewLine_End_Add, True );
//                                                 SQCV_REMOVE : aNode.ForEach( SqlToysConvert_NewLine_End_Remove, True );
//                                               end;
                      SQCC_LINE_BEF_CONSTR   : case aState of
                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_NewLine_Bef_Constraint_Add, True );
                                                 SQCV_REMOVE : aNode.ForEach( SqlToysConvert_NewLine_Bef_Constraint_Remove, True );
                                               end;
//                      SQCC_LINE_AFT_CONSTR   : case aState of
//                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_NewLine_Aft_Constraint_Add, True );
//                                                 SQCV_REMOVE : aNode.ForEach( SqlToysConvert_NewLine_Aft_Constraint_Remove, True );
//                                               end;
                    end;
    SQCG_EMPTY    : case aItem of
                      SQCC_EMPTY_BEF_CLAUSE  : case aState of
                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_EmptyLine_Clause_Add, True );
                                                 SQCV_REMOVE : aNode.ForEach( SqlToysConvert_EmptyLine_Clause_Remove, True );
                                               end;
                      SQCC_EXC_SUBQUERY      : case aState of
                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_EmptyLine_ClauseSubquery_Add, True );
                                                 SQCV_REMOVE : aNode.ForEach( SqlToysConvert_EmptyLine_ClauseSubquery_Remove, True );
                                               end;
//                      SQCC_EXC_SHORT_QUERY   : case aState of
//                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_EmptyLine_ClauseShortQuery_Add, True );
//                                                 SQCV_REMOVE : aNode.ForEach( SqlToysConvert_EmptyLine_ClauseShortQuery_Remove, True );
//                                               end;
                      SQCC_EMPTY_AROUND_UNION: case aState of
                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_EmptyLine_Union_Add, True );
                                                 SQCV_REMOVE : aNode.ForEach( SqlToysConvert_EmptyLine_Union_Remove, True );
                                               end;
                      SQCC_EMPTY_CMPLX_CONSTR: case aState of
                                                 SQCV_ADD    : aNode.ForEach( SqlToysConvert_EmptyLine_Complex_Constraint_Add, True );
                                                 SQCV_REMOVE : aNode.ForEach( SqlToysConvert_EmptyLine_Complex_Constraint_Remove, True );
                                               end;
                    end;
  end;
end;

end.

