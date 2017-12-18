object FormSettings: TFormSettings
  Left = 247
  Top = 63
  BorderStyle = bsDialog
  ClientHeight = 349
  ClientWidth = 817
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelBtn: TPanel
    Left = 0
    Top = 313
    Width = 817
    Height = 36
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      817
      36)
    object BtnCancel: TButton
      Left = 729
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 3
    end
    object BtnOK: TButton
      Left = 648
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 2
      OnClick = BtnOKClick
    end
    object BtnReset: TButton
      Left = 10
      Top = 5
      Width = 91
      Height = 25
      Caption = 'Default values'
      TabOrder = 0
      OnClick = BtnResetClick
    end
    object BtnStored: TButton
      Left = 105
      Top = 5
      Width = 101
      Height = 25
      Caption = 'Stored values'
      TabOrder = 1
      OnClick = BtnStoredClick
    end
    object ButtonEditFont: TButton
      Left = 290
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Edit Font'
      TabOrder = 4
      Visible = False
      OnClick = ButtonEditFontClick
    end
    object ButtonGridFont: TButton
      Left = 371
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Grid Font'
      Enabled = False
      TabOrder = 5
      Visible = False
      OnClick = ButtonGridFontClick
    end
  end
  object GroupBoxLines: TGroupBox
    Left = 0
    Top = 0
    Width = 200
    Height = 136
    Caption = ' Empty lines '
    TabOrder = 1
    object Label2: TLabel
      Left = 44
      Top = 95
      Width = 58
      Height = 13
      Caption = 'below (lines)'
    end
    object ChkBoxEmptyLineAfterQuery: TCheckBox
      Left = 10
      Top = 15
      Width = 150
      Height = 17
      Caption = 'Empty line after query'
      TabOrder = 0
    end
    object ChkBoxEmptyLinesBeforeClauses: TCheckBox
      Left = 10
      Top = 50
      Width = 176
      Height = 17
      Caption = 'Empty lines before clauses'
      TabOrder = 1
    end
    object ChkBoxEmptyLinesAroundUnion: TCheckBox
      Left = 25
      Top = 115
      Width = 171
      Height = 17
      Caption = 'Empty lines around UNION, etc.'
      TabOrder = 5
    end
    object ChkBoxEmptyLinesBeforeClausesExcSubqueries: TCheckBox
      Left = 25
      Top = 65
      Width = 161
      Height = 17
      Caption = 'except subqueries'
      TabOrder = 2
    end
    object ChkBoxEmptyLinesBeforeClausesExcShortQuery: TCheckBox
      Left = 25
      Top = 80
      Width = 161
      Height = 17
      Caption = 'except short queries'
      TabOrder = 3
    end
    object EditShortQuery: TEdit
      Left = 109
      Top = 92
      Width = 25
      Height = 21
      TabOrder = 4
      Text = '20'
    end
    object EditLinesNoAfterQuery: TEdit
      Left = 109
      Top = 30
      Width = 25
      Height = 21
      TabOrder = 6
      Text = '1'
    end
    object ChkBoxLinesNoAfterQuery: TCheckBox
      Left = 25
      Top = 32
      Width = 81
      Height = 17
      Caption = 'Lines no'
      TabOrder = 7
    end
  end
  object GroupBoxSpacings: TGroupBox
    Left = 0
    Top = 140
    Width = 200
    Height = 140
    Caption = ' Spaces '
    TabOrder = 2
    object ChkBoxSpaceBeforeComma: TCheckBox
      Left = 10
      Top = 105
      Width = 150
      Height = 17
      Caption = 'Space before comma'
      TabOrder = 6
    end
    object ChkBoxSpaceBeforeSemicolon: TCheckBox
      Left = 10
      Top = 15
      Width = 150
      Height = 17
      Caption = 'Space before semicolon'
      TabOrder = 0
    end
    object ChkBoxSpaceOutsideBrackets: TCheckBox
      Left = 10
      Top = 75
      Width = 176
      Height = 17
      Caption = 'Space outside brackets'
      TabOrder = 4
    end
    object ChkBoxSpaceInsideBrackets: TCheckBox
      Left = 10
      Top = 30
      Width = 176
      Height = 17
      Caption = 'Space inside brackets'
      TabOrder = 1
    end
    object ChkBoxSpaceAroundOperator: TCheckBox
      Left = 10
      Top = 90
      Width = 176
      Height = 17
      Caption = 'Space around operator'
      TabOrder = 5
    end
    object ChkBoxSpaceAfterComma: TCheckBox
      Left = 10
      Top = 120
      Width = 176
      Height = 17
      Caption = 'Space after comma'
      TabOrder = 7
    end
    object ChkBoxSpaceInsideBracketsSkipOnFun: TCheckBox
      Left = 25
      Top = 45
      Width = 161
      Height = 17
      Caption = 'except single param functions'
      TabOrder = 2
    end
    object ChkBoxSpaceInsideBracketsSkipOnDatatype: TCheckBox
      Left = 25
      Top = 60
      Width = 161
      Height = 17
      Caption = 'except datatypes'
      TabOrder = 3
    end
  end
  object GroupBoxIntendation: TGroupBox
    Left = 200
    Top = 0
    Width = 200
    Height = 96
    Caption = ' Expressions && conditions '
    TabOrder = 3
    object LabelSetMaxLen: TLabel
      Left = 30
      Top = 75
      Width = 36
      Height = 13
      Caption = 'max len'
    end
    object ChkBoxOneExprOnLine: TCheckBox
      Left = 10
      Top = 15
      Width = 176
      Height = 17
      Caption = 'One expression on line'
      TabOrder = 0
    end
    object ChkBoxCommaAtNewLine: TCheckBox
      Left = 25
      Top = 30
      Width = 161
      Height = 17
      Caption = 'Comma at new line left side'
      TabOrder = 1
    end
    object ChkBoxOneCondOnLine: TCheckBox
      Left = 10
      Top = 45
      Width = 176
      Height = 17
      Caption = 'One condition on line'
      TabOrder = 2
    end
    object ChkBoxSetLeftExprIntend: TCheckBox
      Left = 10
      Top = 60
      Width = 176
      Height = 17
      Caption = 'SET left expression intend'
      TabOrder = 3
    end
    object EditSetMaxLen: TEdit
      Left = 75
      Top = 72
      Width = 25
      Height = 21
      TabOrder = 4
      Text = '20'
    end
  end
  object GroupBox3: TGroupBox
    Left = 200
    Top = 100
    Width = 200
    Height = 206
    Caption = ' Upper && lower case '
    TabOrder = 4
    object LabelTableNameCase: TLabel
      Left = 10
      Top = 40
      Width = 56
      Height = 13
      Caption = 'Table name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object LabelColumnNameCase: TLabel
      Left = 10
      Top = 59
      Width = 64
      Height = 13
      Caption = 'Column name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object LabelTableAliasCase: TLabel
      Left = 10
      Top = 80
      Width = 51
      Height = 13
      Caption = 'Table alias'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object LabelColumnAliasCase: TLabel
      Left = 10
      Top = 100
      Width = 59
      Height = 13
      Caption = 'Column alias'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object LabelParameterCase: TLabel
      Left = 10
      Top = 140
      Width = 48
      Height = 13
      Caption = 'Parameter'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object LabelIdentifierCase: TLabel
      Left = 10
      Top = 161
      Width = 40
      Height = 13
      Caption = 'Identifier'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object LabelKeywordCase: TLabel
      Left = 10
      Top = 20
      Width = 41
      Height = 13
      Caption = 'Keyword'
    end
    object LabelColumnQuotedAliasCase: TLabel
      Left = 10
      Top = 120
      Width = 78
      Height = 13
      Caption = 'Col. quoted alias'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object LabelFunctionCase: TLabel
      Left = 10
      Top = 180
      Width = 41
      Height = 13
      Caption = 'Function'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
    end
    object ComboBoxTableNameCase: TComboBox
      Left = 100
      Top = 36
      Width = 90
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 1
      Text = 'No Change'
      Items.Strings = (
        'No Change'
        'Upper'
        'Lower'
        'First char upper'
        'Same as first use')
    end
    object ComboBoxColumnNameCase: TComboBox
      Left = 100
      Top = 56
      Width = 90
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 2
      Text = 'No Change'
      Items.Strings = (
        'No Change'
        'Upper'
        'Lower'
        'First char upper')
    end
    object ComboBoxTableAliasCase: TComboBox
      Left = 100
      Top = 76
      Width = 90
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 3
      Text = 'No Change'
      Items.Strings = (
        'No Change'
        'Upper'
        'Lower'
        'First char upper'
        'Same as first use')
    end
    object ComboBoxColumnAliasCase: TComboBox
      Left = 100
      Top = 96
      Width = 90
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 4
      Text = 'No Change'
      Items.Strings = (
        'No Change'
        'Upper'
        'Lower'
        'First char upper')
    end
    object ComboBoxParameterCase: TComboBox
      Left = 100
      Top = 136
      Width = 90
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 5
      Text = 'No Change'
      Items.Strings = (
        'No Change'
        'Upper'
        'Lower'
        'First char upper')
    end
    object ComboBoxIdentifierCase: TComboBox
      Left = 100
      Top = 156
      Width = 90
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 6
      Text = 'No Change'
      Items.Strings = (
        'No Change'
        'Upper'
        'Lower'
        'First char upper')
    end
    object ComboBoxKeywordCase: TComboBox
      Left = 100
      Top = 16
      Width = 90
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'No Change'
      Items.Strings = (
        'No Change'
        'Upper'
        'Lower'
        'First char upper')
    end
    object ComboBoxColumnQuotedAliasCase: TComboBox
      Left = 100
      Top = 116
      Width = 90
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 7
      Text = 'No Change'
      Items.Strings = (
        'No Change'
        'Upper'
        'Lower'
        'First char upper')
    end
    object ComboBoxFunctionCase: TComboBox
      Left = 100
      Top = 176
      Width = 90
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 8
      Text = 'No Change'
      Items.Strings = (
        'No Change'
        'Upper'
        'Lower'
        'First char upper')
    end
  end
  object GroupBox4: TGroupBox
    Left = 400
    Top = 0
    Width = 200
    Height = 96
    Caption = ' CASE expr. '
    TabOrder = 5
    object ChkBoxCaseAtNewLine: TCheckBox
      Left = 10
      Top = 15
      Width = 171
      Height = 17
      Caption = 'CASE at new line'
      TabOrder = 0
    end
    object ChkBoxCaseWhenAtNewLine: TCheckBox
      Left = 10
      Top = 30
      Width = 161
      Height = 17
      Caption = 'WHEN at new line'
      TabOrder = 1
    end
    object ChkBoxCaseThenAtNewLine: TCheckBox
      Left = 10
      Top = 45
      Width = 161
      Height = 17
      Caption = 'THEN at new line'
      TabOrder = 2
    end
    object ChkBoxCaseElseAtNewLine: TCheckBox
      Left = 10
      Top = 60
      Width = 156
      Height = 17
      Caption = 'ELSE at new line'
      TabOrder = 3
    end
    object ChkBoxCaseEndAtNewLine: TCheckBox
      Left = 10
      Top = 75
      Width = 156
      Height = 17
      Caption = 'END at new line'
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 400
    Top = 100
    Width = 200
    Height = 66
    Caption = ' SELECT '
    TabOrder = 6
    object ChkBoxSelectAliasIntend: TCheckBox
      Left = 10
      Top = 15
      Width = 181
      Height = 17
      Caption = 'Expressions alias intend'
      TabOrder = 0
    end
    object ChkBoxExprAs: TCheckBox
      Left = 10
      Top = 30
      Width = 176
      Height = 17
      Caption = 'Expression alias w. AS keyword'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
      TabOrder = 1
    end
    object CheckBoxExtQueryKeywordStyle: TCheckBox
      Left = 10
      Top = 45
      Width = 176
      Height = 17
      Caption = 'Ext. query keyword style'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object GroupBox1: TGroupBox
    Left = 400
    Top = 168
    Width = 200
    Height = 141
    Caption = ' FROM '
    TabOrder = 7
    object LabelTableMaxLen: TLabel
      Left = 30
      Top = 46
      Width = 62
      Height = 13
      Caption = 'table max len'
    end
    object LabelAliasMaxLen: TLabel
      Left = 125
      Top = 46
      Width = 21
      Height = 13
      Caption = 'alias'
    end
    object ChkBoxFromTableAndAliasIntend: TCheckBox
      Left = 10
      Top = 30
      Width = 171
      Height = 17
      Caption = 'Table and alias intend'
      TabOrder = 1
    end
    object EditTableMaxLen: TEdit
      Left = 95
      Top = 43
      Width = 25
      Height = 21
      TabOrder = 2
      Text = '30'
    end
    object EditAliasMaxLen: TEdit
      Left = 150
      Top = 43
      Width = 25
      Height = 21
      TabOrder = 3
      Text = '10'
    end
    object ChkBoxOnCondIntend: TCheckBox
      Left = 10
      Top = 62
      Width = 171
      Height = 17
      Caption = 'ON condition intend'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object CheckBoxJoinCondLeftSideOrder: TCheckBox
      Left = 10
      Top = 75
      Width = 176
      Height = 17
      Caption = 'ON cond. left side references'
      TabOrder = 4
    end
    object ChkBoxInnerJoins: TCheckBox
      Left = 10
      Top = 105
      Width = 171
      Height = 17
      Caption = 'Use INNER keyword for joins'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
      TabOrder = 7
    end
    object ChkBoxOuterJoins: TCheckBox
      Left = 10
      Top = 120
      Width = 176
      Height = 17
      Caption = 'Use OUTER keyword for joins'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
      TabOrder = 8
    end
    object ChkBoxTableAs: TCheckBox
      Left = 10
      Top = 15
      Width = 171
      Height = 17
      Caption = 'Table alias with AS keyword'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
      TabOrder = 0
    end
    object CheckBoxJoinCondRefsFirst: TCheckBox
      Left = 10
      Top = 90
      Width = 181
      Height = 17
      Caption = 'ON cond. references first'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
  end
  object GroupBoxCreateTable: TGroupBox
    Left = 600
    Top = 0
    Width = 200
    Height = 101
    Caption = ' CREATE TABLE '
    TabOrder = 8
    object LabelColMaxLen: TLabel
      Left = 30
      Top = 30
      Width = 36
      Height = 13
      Caption = 'max len'
    end
    object LabelMaxDatatypeLen: TLabel
      Left = 105
      Top = 30
      Width = 41
      Height = 13
      Caption = 'datatype'
    end
    object CheckBoxCreateTableColConstrBreakLine: TCheckBox
      Left = 10
      Top = 50
      Width = 176
      Height = 12
      Caption = 'Column constraint at new line'
      TabOrder = 3
    end
    object CheckBoxCreateTableColConstrNewLineAfter: TCheckBox
      Left = 25
      Top = 65
      Width = 169
      Height = 12
      Caption = 'New line after column constraint'
      TabOrder = 4
    end
    object ChkBoxCreateTableColDatatypeIntend: TCheckBox
      Left = 10
      Top = 15
      Width = 176
      Height = 17
      Caption = 'Intend columns and datatypes'
      TabOrder = 0
    end
    object EditColMaxLen: TEdit
      Left = 75
      Top = 28
      Width = 25
      Height = 21
      TabOrder = 1
      Text = '20'
    end
    object EditMaxDataTypeLen: TEdit
      Left = 150
      Top = 28
      Width = 25
      Height = 21
      TabOrder = 2
      Text = '20'
    end
    object ChkBoxCreateTableEmptyLineBeforeComplexContraints: TCheckBox
      Left = 9
      Top = 80
      Width = 182
      Height = 12
      Caption = 'Empty line before complex contraints'
      TabOrder = 5
    end
  end
  object GroupBoxOrderBy: TGroupBox
    Left = 600
    Top = 105
    Width = 200
    Height = 51
    Caption = ' ORDER BY '
    TabOrder = 9
    object ChkBoxSortShort: TCheckBox
      Left = 10
      Top = 15
      Width = 172
      Height = 17
      Caption = 'Short sorting keywords'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
      TabOrder = 0
    end
    object ChkBoxSkipAscending: TCheckBox
      Left = 10
      Top = 30
      Width = 176
      Height = 17
      Caption = 'Skip ASC,ASCENDING keywords'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
      TabOrder = 1
    end
  end
  object GroupBox5: TGroupBox
    Left = 600
    Top = 158
    Width = 200
    Height = 104
    Caption = ' General '
    TabOrder = 10
    object LabelMaxClauseKeywordIntend: TLabel
      Left = 28
      Top = 60
      Width = 132
      Height = 13
      Caption = 'Max. clause keyword intend'
    end
    object LabelMaxIdentifierLength: TLabel
      Left = 28
      Top = 80
      Width = 94
      Height = 13
      Caption = 'Max identifier length'
    end
    object ChkBoxNoSemicolonOnSingleQuery: TCheckBox
      Left = 10
      Top = 15
      Width = 176
      Height = 17
      Caption = 'No semicolon on single query'
      TabOrder = 0
    end
    object ChkBoxColumnConstraint: TCheckBox
      Left = 10
      Top = 30
      Width = 176
      Height = 17
      Caption = 'Columns with their constraints'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object ChkBoxRightIntend: TCheckBox
      Left = 10
      Top = 45
      Width = 150
      Height = 17
      Caption = 'Right justify clauses'
      TabOrder = 2
    end
    object EditMaxClauseKeywordIntend: TEdit
      Left = 166
      Top = 57
      Width = 25
      Height = 21
      TabOrder = 3
      Text = '15'
    end
    object EditMaxIdentifierLength: TEdit
      Left = 166
      Top = 77
      Width = 25
      Height = 21
      TabOrder = 4
      Text = '15'
    end
  end
end
