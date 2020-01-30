object FormColors: TFormColors
  Left = 247
  Top = 63
  BorderStyle = bsDialog
  ClientHeight = 350
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
    Top = 314
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
  end
  object PanelColorStylesMain: TPanel
    Left = 5
    Top = 0
    Width = 196
    Height = 211
    BevelOuter = bvNone
    TabOrder = 1
    object LabelDisabled: TLabel
      Left = 0
      Top = 183
      Width = 44
      Height = 13
      Caption = 'Disabled:'
      FocusControl = EditColorDisabled
    end
    object LabelErrors: TLabel
      Left = 0
      Top = 163
      Width = 30
      Height = 13
      Caption = 'Errors:'
      FocusControl = EditColorErrors
    end
    object LabelComments: TLabel
      Left = 0
      Top = 143
      Width = 52
      Height = 13
      Caption = 'Comments:'
      FocusControl = EditColorComments
    end
    object LabelPlainText: TLabel
      Left = 0
      Top = 23
      Width = 46
      Height = 13
      Caption = 'Plain text:'
      FocusControl = EditColorPlainText
    end
    object LabelBoldItalicUnderlineMain: TLabel
      Left = 150
      Top = 10
      Width = 36
      Height = 13
      Caption = 'B   I   U'
    end
    object LabelIdentifier: TLabel
      Left = 0
      Top = 63
      Width = 48
      Height = 13
      Caption = 'Identifiers:'
      FocusControl = EditColorIdentifiers
    end
    object LabelKeywords: TLabel
      Left = 0
      Top = 43
      Width = 49
      Height = 13
      Caption = 'Keywords:'
      FocusControl = EditColorKeywords
    end
    object LabelNumbers: TLabel
      Left = 0
      Top = 83
      Width = 45
      Height = 13
      Caption = 'Numbers:'
      FocusControl = EditColorNumbers
    end
    object LabelStrings: TLabel
      Left = 0
      Top = 103
      Width = 35
      Height = 13
      Caption = 'Strings:'
      FocusControl = EditColorStrings
    end
    object LabelOperators: TLabel
      Left = 0
      Top = 123
      Width = 49
      Height = 13
      Caption = 'Operators:'
      FocusControl = EditColorOperators
    end
    object EditColorPlainText: TEdit
      Left = 75
      Top = 20
      Width = 50
      Height = 21
      TabOrder = 0
      Text = '000000'
      OnChange = EditColorChange
    end
    object EditColorComments: TEdit
      Left = 75
      Top = 140
      Width = 50
      Height = 21
      TabOrder = 30
      Text = '000000'
      OnChange = EditColorChange
    end
    object EditColorErrors: TEdit
      Left = 75
      Top = 160
      Width = 50
      Height = 21
      TabOrder = 35
      Text = '000000'
      OnChange = EditColorChange
    end
    object EditColorDisabled: TEdit
      Left = 75
      Top = 180
      Width = 50
      Height = 21
      TabOrder = 40
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorPlainText: TButton
      Left = 124
      Top = 20
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 1
      OnClick = EditColorButtonClick
    end
    object ButtonColorComments: TButton
      Left = 124
      Top = 140
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 31
      OnClick = EditColorButtonClick
    end
    object ButtonColorErrors: TButton
      Left = 124
      Top = 160
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 36
      OnClick = EditColorButtonClick
    end
    object ButtonColorDisabled: TButton
      Left = 124
      Top = 180
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 41
      OnClick = EditColorButtonClick
    end
    object CheckBoxUnderlineDisabled: TCheckBox
      Left = 175
      Top = 182
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 44
    end
    object CheckBoxItalicDisabled: TCheckBox
      Left = 160
      Top = 182
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 43
    end
    object CheckBoxBoldDisabled: TCheckBox
      Left = 145
      Top = 182
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 42
    end
    object CheckBoxBoldErrors: TCheckBox
      Left = 145
      Top = 162
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 37
    end
    object CheckBoxItalicErrors: TCheckBox
      Left = 160
      Top = 162
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 38
    end
    object CheckBoxUnderlineErrors: TCheckBox
      Left = 175
      Top = 162
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 39
    end
    object CheckBoxUnderlineComments: TCheckBox
      Left = 175
      Top = 142
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 34
    end
    object CheckBoxItalicComments: TCheckBox
      Left = 160
      Top = 142
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 33
    end
    object CheckBoxBoldComments: TCheckBox
      Left = 145
      Top = 142
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 32
    end
    object CheckBoxBoldPlainText: TCheckBox
      Left = 145
      Top = 22
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 2
    end
    object CheckBoxItalicPlainText: TCheckBox
      Left = 160
      Top = 22
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 3
    end
    object CheckBoxUnderlinePlainText: TCheckBox
      Left = 175
      Top = 22
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 4
    end
    object EditColorIdentifiers: TEdit
      Left = 75
      Top = 60
      Width = 50
      Height = 21
      TabOrder = 10
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorIdentifiers: TButton
      Left = 124
      Top = 60
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 11
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldIdentifiers: TCheckBox
      Left = 145
      Top = 62
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 12
    end
    object CheckBoxItalicIdentifiers: TCheckBox
      Left = 160
      Top = 62
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 13
    end
    object CheckBoxUnderlineIdentifiers: TCheckBox
      Left = 175
      Top = 62
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 14
    end
    object EditColorKeywords: TEdit
      Left = 75
      Top = 40
      Width = 50
      Height = 21
      TabOrder = 5
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorKeywords: TButton
      Left = 124
      Top = 40
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 6
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldKeywords: TCheckBox
      Left = 145
      Top = 42
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 7
    end
    object CheckBoxItalicKeywords: TCheckBox
      Left = 160
      Top = 42
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 8
    end
    object CheckBoxUnderlineKeywords: TCheckBox
      Left = 175
      Top = 42
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 9
    end
    object EditColorOperators: TEdit
      Left = 75
      Top = 120
      Width = 50
      Height = 21
      TabOrder = 25
      Text = '000000'
      OnChange = EditColorChange
    end
    object EditColorStrings: TEdit
      Left = 75
      Top = 100
      Width = 50
      Height = 21
      TabOrder = 20
      Text = '000000'
      OnChange = EditColorChange
    end
    object EditColorNumbers: TEdit
      Left = 75
      Top = 80
      Width = 50
      Height = 21
      TabOrder = 15
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorNumbers: TButton
      Left = 124
      Top = 80
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 16
      OnClick = EditColorButtonClick
    end
    object ButtonColorStrings: TButton
      Left = 124
      Top = 100
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 21
      OnClick = EditColorButtonClick
    end
    object ButtonColorOperators: TButton
      Left = 124
      Top = 120
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 26
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldOperators: TCheckBox
      Left = 145
      Top = 122
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 27
    end
    object CheckBoxItalicOperators: TCheckBox
      Left = 160
      Top = 122
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 28
    end
    object CheckBoxUnderlineOperators: TCheckBox
      Left = 175
      Top = 122
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 29
    end
    object CheckBoxUnderlineStrings: TCheckBox
      Left = 175
      Top = 102
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 24
    end
    object CheckBoxItalicStrings: TCheckBox
      Left = 160
      Top = 102
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 23
    end
    object CheckBoxBoldStrings: TCheckBox
      Left = 145
      Top = 102
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 22
    end
    object CheckBoxBoldNumbers: TCheckBox
      Left = 145
      Top = 82
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 17
    end
    object CheckBoxItalicNumbers: TCheckBox
      Left = 160
      Top = 82
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 18
    end
    object CheckBoxUnderlineNumbers: TCheckBox
      Left = 175
      Top = 82
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 19
    end
  end
  object PanelColorStylesIdentifiers: TPanel
    Left = 205
    Top = 0
    Width = 196
    Height = 301
    BevelOuter = bvNone
    TabOrder = 2
    object LabelTable: TLabel
      Left = 0
      Top = 23
      Width = 35
      Height = 13
      Caption = 'Tables:'
      FocusControl = EditColorTables
    end
    object LabelColumn: TLabel
      Left = 0
      Top = 83
      Width = 43
      Height = 13
      Caption = 'Columns:'
      FocusControl = EditColorColumns
    end
    object LabelTableAlias: TLabel
      Left = 0
      Top = 63
      Width = 60
      Height = 13
      Caption = 'Tab. aliases:'
      FocusControl = EditColorTableAliases
    end
    object LabelColumnAlias: TLabel
      Left = 0
      Top = 103
      Width = 56
      Height = 13
      Caption = 'Col. aliases:'
      FocusControl = EditColorColumnAliases
    end
    object LabelFunctions: TLabel
      Left = 0
      Top = 123
      Width = 49
      Height = 13
      Caption = 'Functions:'
      FocusControl = EditColorFunctions
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LabelBoldItalicUnderlineIdentifiers: TLabel
      Left = 150
      Top = 10
      Width = 36
      Height = 13
      Caption = 'B   I   U'
    end
    object LabelView: TLabel
      Left = 0
      Top = 43
      Width = 31
      Height = 13
      Caption = 'Views:'
      FocusControl = EditColorViews
    end
    object LabelSynonym: TLabel
      Left = 0
      Top = 183
      Width = 51
      Height = 13
      Caption = 'Synonyms:'
      FocusControl = EditColorSynonyms
    end
    object LabelConstraint: TLabel
      Left = 0
      Top = 163
      Width = 55
      Height = 13
      Caption = 'Constraints:'
      FocusControl = EditColorConstraints
    end
    object LabelParameters: TLabel
      Left = 0
      Top = 223
      Width = 56
      Height = 13
      Caption = 'Parameters:'
      FocusControl = EditColorParameters
    end
    object LabelTransaction: TLabel
      Left = 0
      Top = 203
      Width = 64
      Height = 13
      Caption = 'Transactions:'
      FocusControl = EditColorTransactions
    end
    object LabelExtQueryAliasOrTable: TLabel
      Left = 0
      Top = 263
      Width = 71
      Height = 13
      Caption = 'Ext query alias:'
      FocusControl = EditColorExtQueryAliasOrTable
    end
    object LabelAggrFunctions: TLabel
      Left = 0
      Top = 143
      Width = 55
      Height = 13
      Caption = 'Aggr. func.:'
      FocusControl = EditColorAggrFunctions
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LabelFunParameters: TLabel
      Left = 0
      Top = 243
      Width = 58
      Height = 13
      Caption = 'Fun params:'
      FocusControl = EditColorFunParameters
    end
    object EditColorFunctions: TEdit
      Left = 75
      Top = 120
      Width = 50
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 26
      Text = '000000'
      OnChange = EditColorChange
    end
    object EditColorColumnAliases: TEdit
      Left = 75
      Top = 100
      Width = 50
      Height = 21
      TabOrder = 21
      Text = '000000'
      OnChange = EditColorChange
    end
    object EditColorTableAliases: TEdit
      Left = 75
      Top = 60
      Width = 50
      Height = 21
      TabOrder = 11
      Text = '000000'
      OnChange = EditColorChange
    end
    object EditColorColumns: TEdit
      Left = 75
      Top = 80
      Width = 50
      Height = 21
      TabOrder = 16
      Text = '000000'
      OnChange = EditColorChange
    end
    object EditColorTables: TEdit
      Left = 75
      Top = 20
      Width = 50
      Height = 21
      TabOrder = 1
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorTables: TButton
      Left = 124
      Top = 20
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 2
      OnClick = EditColorButtonClick
    end
    object ButtonColorColumns: TButton
      Left = 124
      Top = 80
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 17
      OnClick = EditColorButtonClick
    end
    object ButtonColorTableAliases: TButton
      Left = 124
      Top = 60
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 12
      OnClick = EditColorButtonClick
    end
    object ButtonColorColumnAliases: TButton
      Left = 124
      Top = 100
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 22
      OnClick = EditColorButtonClick
    end
    object ButtonColorFunctions: TButton
      Left = 124
      Top = 120
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 27
      OnClick = EditColorButtonClick
    end
    object CheckBoxUnderlineTables: TCheckBox
      Left = 175
      Top = 22
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 5
    end
    object CheckBoxItalicTables: TCheckBox
      Left = 160
      Top = 22
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 4
    end
    object CheckBoxBoldTables: TCheckBox
      Left = 145
      Top = 22
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 3
    end
    object CheckBoxBoldColumns: TCheckBox
      Left = 145
      Top = 82
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 18
    end
    object CheckBoxBoldTableAliases: TCheckBox
      Left = 145
      Top = 62
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 13
    end
    object CheckBoxBoldColumnAliases: TCheckBox
      Left = 145
      Top = 102
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 23
    end
    object CheckBoxBoldFunctions: TCheckBox
      Left = 145
      Top = 122
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 28
    end
    object CheckBoxItalicFunctions: TCheckBox
      Left = 160
      Top = 122
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 29
    end
    object CheckBoxUnderlineFunctions: TCheckBox
      Left = 175
      Top = 122
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 30
    end
    object CheckBoxItalicColumnAliases: TCheckBox
      Left = 160
      Top = 102
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 24
    end
    object CheckBoxUnderlineColumnAliases: TCheckBox
      Left = 175
      Top = 102
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 25
    end
    object CheckBoxUnderlineTableAliases: TCheckBox
      Left = 175
      Top = 62
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 15
    end
    object CheckBoxItalicTableAliases: TCheckBox
      Left = 160
      Top = 62
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 14
    end
    object CheckBoxItalicColumns: TCheckBox
      Left = 160
      Top = 82
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 19
    end
    object CheckBoxUnderlineColumns: TCheckBox
      Left = 175
      Top = 82
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 20
    end
    object EditColorViews: TEdit
      Left = 75
      Top = 40
      Width = 50
      Height = 21
      TabOrder = 6
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorViews: TButton
      Left = 124
      Top = 40
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 7
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldViews: TCheckBox
      Left = 145
      Top = 42
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 8
    end
    object CheckBoxItalicViews: TCheckBox
      Left = 160
      Top = 42
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 9
    end
    object CheckBoxUnderlineViews: TCheckBox
      Left = 175
      Top = 42
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 10
    end
    object EditColorSynonyms: TEdit
      Left = 75
      Top = 180
      Width = 50
      Height = 21
      TabOrder = 41
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorSynonyms: TButton
      Left = 124
      Top = 180
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 42
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldSynonyms: TCheckBox
      Left = 145
      Top = 182
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 43
    end
    object CheckBoxItalicSynonyms: TCheckBox
      Left = 160
      Top = 182
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 44
    end
    object CheckBoxUnderlineSynonyms: TCheckBox
      Left = 175
      Top = 182
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 45
    end
    object EditColorConstraints: TEdit
      Left = 75
      Top = 160
      Width = 50
      Height = 21
      TabOrder = 36
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorConstraints: TButton
      Left = 124
      Top = 160
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 37
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldConstraints: TCheckBox
      Left = 145
      Top = 162
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 38
    end
    object CheckBoxItalicConstraints: TCheckBox
      Left = 160
      Top = 162
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 39
    end
    object CheckBoxUnderlineConstraints: TCheckBox
      Left = 175
      Top = 162
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 40
    end
    object CheckBoxIdentifiers: TCheckBox
      Left = 0
      Top = 0
      Width = 97
      Height = 17
      Caption = 'Identifiers'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object EditColorParameters: TEdit
      Left = 75
      Top = 220
      Width = 50
      Height = 21
      TabOrder = 51
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorParameters: TButton
      Left = 124
      Top = 220
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 52
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldParameters: TCheckBox
      Left = 145
      Top = 222
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 53
    end
    object CheckBoxItalicParameters: TCheckBox
      Left = 160
      Top = 222
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 54
    end
    object CheckBoxUnderlineParameters: TCheckBox
      Left = 175
      Top = 222
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 55
    end
    object EditColorTransactions: TEdit
      Left = 75
      Top = 200
      Width = 50
      Height = 21
      TabOrder = 46
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorTransactions: TButton
      Left = 124
      Top = 200
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 47
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldTransactions: TCheckBox
      Left = 145
      Top = 202
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 48
    end
    object CheckBoxItalicTransactions: TCheckBox
      Left = 160
      Top = 202
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 49
    end
    object CheckBoxUnderlineTransactions: TCheckBox
      Left = 175
      Top = 202
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 50
    end
    object EditColorExtQueryAliasOrTable: TEdit
      Left = 75
      Top = 260
      Width = 50
      Height = 21
      TabOrder = 56
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorExtQueryAliasOrTable: TButton
      Left = 124
      Top = 260
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 57
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldExtQueryAliasOrTable: TCheckBox
      Left = 145
      Top = 262
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 58
    end
    object CheckBoxItalicExtQueryAliasOrTable: TCheckBox
      Left = 160
      Top = 262
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 59
    end
    object CheckBoxUnderlineExtQueryAliasOrTable: TCheckBox
      Left = 175
      Top = 262
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 60
    end
    object EditColorAggrFunctions: TEdit
      Left = 75
      Top = 140
      Width = 50
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 31
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorAggrFunctions: TButton
      Left = 124
      Top = 140
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 32
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldAggrFunctions: TCheckBox
      Left = 145
      Top = 142
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 33
    end
    object CheckBoxItalicAggrFunctions: TCheckBox
      Left = 160
      Top = 142
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 34
    end
    object CheckBoxUnderlineAggrFunctions: TCheckBox
      Left = 175
      Top = 142
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 35
    end
    object EditColorFunParameters: TEdit
      Left = 75
      Top = 240
      Width = 50
      Height = 21
      TabOrder = 61
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorFunParameters: TButton
      Left = 124
      Top = 240
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 62
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldFunParameters: TCheckBox
      Left = 145
      Top = 242
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 63
    end
    object CheckBoxItalicFunParameters: TCheckBox
      Left = 160
      Top = 242
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 64
    end
    object CheckBoxUnderlineFunParameters: TCheckBox
      Left = 175
      Top = 242
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 65
    end
  end
  object PanelColorStylesKeywords: TPanel
    Left = 405
    Top = 0
    Width = 196
    Height = 305
    BevelOuter = bvNone
    TabOrder = 3
    object LabelDatatypes: TLabel
      Left = 0
      Top = 23
      Width = 51
      Height = 13
      Caption = 'Datatypes:'
      FocusControl = EditColorDatatypes
    end
    object LabelBoldItalicUnderlineKeywords: TLabel
      Left = 150
      Top = 10
      Width = 36
      Height = 13
      Caption = 'B   I   U'
    end
    object LabelDmlSelect: TLabel
      Left = 0
      Top = 43
      Width = 44
      Height = 13
      Caption = 'SELECT:'
      FocusControl = EditColorDmlSelect
    end
    object LabelDmlInsert: TLabel
      Left = 0
      Top = 63
      Width = 43
      Height = 13
      Caption = 'INSERT:'
      FocusControl = EditColorDmlInsert
    end
    object LabelDmlUpdate: TLabel
      Left = 0
      Top = 83
      Width = 47
      Height = 13
      Caption = 'UPDATE:'
      FocusControl = EditColorDmlUpdate
    end
    object LabelDmlDelete: TLabel
      Left = 0
      Top = 103
      Width = 45
      Height = 13
      Caption = 'DELETE:'
      FocusControl = EditColorDmlDelete
    end
    object LabelDdlCreate: TLabel
      Left = 0
      Top = 123
      Width = 71
      Height = 13
      Caption = 'DDL CREATE:'
      FocusControl = EditColorDdlCreate
    end
    object LabelDcl: TLabel
      Left = 0
      Top = 223
      Width = 24
      Height = 13
      Caption = 'DCL:'
      FocusControl = EditColorDcl
    end
    object LabelDdlDrop: TLabel
      Left = 0
      Top = 163
      Width = 59
      Height = 13
      Caption = 'DDL DROP:'
      FocusControl = EditColorDdlDrop
    end
    object LabelUnion: TLabel
      Left = 0
      Top = 243
      Width = 45
      Height = 13
      Caption = 'UNIONS:'
      FocusControl = EditColorUnion
    end
    object LabelDdlModify: TLabel
      Left = 0
      Top = 183
      Width = 69
      Height = 13
      Caption = 'DDL MODIFY:'
      FocusControl = EditColorDdlModify
    end
    object LabelTcl: TLabel
      Left = 0
      Top = 203
      Width = 23
      Height = 13
      Caption = 'TCL:'
      FocusControl = EditColorTcl
    end
    object LabelNull: TLabel
      Left = 0
      Top = 263
      Width = 37
      Height = 13
      Caption = 'NULL:'
      FocusControl = EditColorNull
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelPrior: TLabel
      Left = 0
      Top = 283
      Width = 37
      Height = 13
      Caption = 'PRIOR:'
      FocusControl = EditColorPrior
    end
    object LabelDdlCreateView: TLabel
      Left = 0
      Top = 143
      Width = 69
      Height = 13
      Caption = 'DDL C. VIEW:'
      FocusControl = EditColorDdlCreateView
    end
    object EditColorDatatypes: TEdit
      Left = 75
      Top = 20
      Width = 50
      Height = 21
      TabOrder = 1
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorDatatypes: TButton
      Left = 124
      Top = 20
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 2
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldDatatypes: TCheckBox
      Left = 145
      Top = 22
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 3
    end
    object CheckBoxUnderlineDatatypes: TCheckBox
      Left = 175
      Top = 22
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 5
    end
    object CheckBoxItalicDatatypes: TCheckBox
      Left = 160
      Top = 22
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 4
    end
    object EditColorDmlSelect: TEdit
      Left = 75
      Top = 40
      Width = 50
      Height = 21
      TabOrder = 6
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorDmlSelect: TButton
      Left = 124
      Top = 40
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 7
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldDmlSelect: TCheckBox
      Left = 145
      Top = 42
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 8
    end
    object CheckBoxItalicDmlSelect: TCheckBox
      Left = 160
      Top = 42
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 9
    end
    object CheckBoxUnderlineDmlSelect: TCheckBox
      Left = 175
      Top = 42
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 10
    end
    object EditColorDmlInsert: TEdit
      Left = 75
      Top = 60
      Width = 50
      Height = 21
      TabOrder = 11
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorDmlInsert: TButton
      Left = 124
      Top = 60
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 12
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldDmlInsert: TCheckBox
      Left = 145
      Top = 62
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 13
    end
    object CheckBoxItalicDmlInsert: TCheckBox
      Left = 160
      Top = 62
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 14
    end
    object CheckBoxUnderlineDmlInsert: TCheckBox
      Left = 175
      Top = 62
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 15
    end
    object EditColorDmlUpdate: TEdit
      Left = 75
      Top = 80
      Width = 50
      Height = 21
      TabOrder = 16
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorDmlUpdate: TButton
      Left = 124
      Top = 80
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 17
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldDmlUpdate: TCheckBox
      Left = 145
      Top = 82
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 18
    end
    object CheckBoxItalicDmlUpdate: TCheckBox
      Left = 160
      Top = 82
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 19
    end
    object CheckBoxUnderlineDmlUpdate: TCheckBox
      Left = 175
      Top = 82
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 20
    end
    object EditColorDmlDelete: TEdit
      Left = 75
      Top = 100
      Width = 50
      Height = 21
      TabOrder = 21
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorDmlDelete: TButton
      Left = 124
      Top = 100
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 22
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldDmlDelete: TCheckBox
      Left = 145
      Top = 102
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 23
    end
    object CheckBoxItalicDmlDelete: TCheckBox
      Left = 160
      Top = 102
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 24
    end
    object CheckBoxUnderlineDmlDelete: TCheckBox
      Left = 175
      Top = 102
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 25
    end
    object EditColorDdlCreate: TEdit
      Left = 75
      Top = 120
      Width = 50
      Height = 21
      TabOrder = 26
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorDdlCreate: TButton
      Left = 124
      Top = 120
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 27
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldDdlCreate: TCheckBox
      Left = 145
      Top = 122
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 28
    end
    object CheckBoxItalicDdlCreate: TCheckBox
      Left = 160
      Top = 122
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 29
    end
    object CheckBoxUnderlineDdlCreate: TCheckBox
      Left = 175
      Top = 122
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 30
    end
    object EditColorDcl: TEdit
      Left = 75
      Top = 220
      Width = 50
      Height = 21
      TabOrder = 51
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorDcl: TButton
      Left = 124
      Top = 220
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 52
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldDcl: TCheckBox
      Left = 145
      Top = 222
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 53
    end
    object CheckBoxItalicDcl: TCheckBox
      Left = 160
      Top = 222
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 54
    end
    object CheckBoxUnderlineDcl: TCheckBox
      Left = 175
      Top = 222
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 55
    end
    object EditColorDdlDrop: TEdit
      Left = 75
      Top = 160
      Width = 50
      Height = 21
      TabOrder = 36
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorDdlDrop: TButton
      Left = 124
      Top = 160
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 37
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldDdlDrop: TCheckBox
      Left = 145
      Top = 162
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 38
    end
    object CheckBoxItalicDdlDrop: TCheckBox
      Left = 160
      Top = 162
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 39
    end
    object CheckBoxUnderlineDdlDrop: TCheckBox
      Left = 175
      Top = 162
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 40
    end
    object EditColorUnion: TEdit
      Left = 75
      Top = 240
      Width = 50
      Height = 21
      TabOrder = 56
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorUnion: TButton
      Left = 124
      Top = 240
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 57
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldUnions: TCheckBox
      Left = 145
      Top = 242
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 58
    end
    object CheckBoxItalicUnions: TCheckBox
      Left = 160
      Top = 242
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 59
    end
    object CheckBoxUnderlineUnions: TCheckBox
      Left = 175
      Top = 242
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 60
    end
    object EditColorDdlModify: TEdit
      Left = 75
      Top = 180
      Width = 50
      Height = 21
      TabOrder = 41
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorDdlModify: TButton
      Left = 124
      Top = 180
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 42
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldDdlModify: TCheckBox
      Left = 145
      Top = 182
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 43
    end
    object CheckBoxItalicDdlModify: TCheckBox
      Left = 160
      Top = 182
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 44
    end
    object CheckBoxUnderlineDdlModify: TCheckBox
      Left = 175
      Top = 182
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 45
    end
    object EditColorTcl: TEdit
      Left = 75
      Top = 200
      Width = 50
      Height = 21
      TabOrder = 46
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorTcl: TButton
      Left = 124
      Top = 200
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 47
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldTcl: TCheckBox
      Left = 145
      Top = 202
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 48
    end
    object CheckBoxItalicTcl: TCheckBox
      Left = 160
      Top = 202
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 49
    end
    object CheckBoxUnderlineTcl: TCheckBox
      Left = 175
      Top = 202
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 50
    end
    object CheckBoxKeywords: TCheckBox
      Left = 0
      Top = 0
      Width = 73
      Height = 17
      Caption = 'Keywords'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object EditColorNull: TEdit
      Left = 75
      Top = 260
      Width = 50
      Height = 21
      TabOrder = 61
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorNull: TButton
      Left = 124
      Top = 260
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 62
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldNull: TCheckBox
      Left = 145
      Top = 262
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 63
    end
    object CheckBoxItalicNull: TCheckBox
      Left = 160
      Top = 262
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 64
    end
    object CheckBoxUnderlineNull: TCheckBox
      Left = 175
      Top = 262
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 65
    end
    object EditColorPrior: TEdit
      Left = 75
      Top = 280
      Width = 50
      Height = 21
      TabOrder = 66
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorPrior: TButton
      Left = 124
      Top = 280
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 67
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldPrior: TCheckBox
      Left = 145
      Top = 282
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 68
    end
    object CheckBoxItalicPrior: TCheckBox
      Left = 160
      Top = 282
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 69
    end
    object CheckBoxUnderlinePrior: TCheckBox
      Left = 175
      Top = 282
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 70
    end
    object EditColorDdlCreateView: TEdit
      Left = 75
      Top = 140
      Width = 50
      Height = 21
      TabOrder = 31
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorDdlCreateView: TButton
      Left = 124
      Top = 140
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 32
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldDdlCreateView: TCheckBox
      Left = 145
      Top = 142
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 33
    end
    object CheckBoxItalicDdlCreateView: TCheckBox
      Left = 160
      Top = 142
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 34
    end
    object CheckBoxUnderlineDdlCreateView: TCheckBox
      Left = 175
      Top = 142
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 35
    end
  end
  object PanelColorStylesBrackets: TPanel
    Left = 603
    Top = 3
    Width = 196
    Height = 151
    BevelOuter = bvNone
    TabOrder = 4
    object LabelBrackets6: TLabel
      Left = 0
      Top = 123
      Width = 38
      Height = 13
      Caption = 'Level 6:'
      FocusControl = EditColorBrackets6
    end
    object LabelBrackets5: TLabel
      Left = 0
      Top = 103
      Width = 38
      Height = 13
      Caption = 'Level 5:'
      FocusControl = EditColorBrackets5
    end
    object LabelBrackets4: TLabel
      Left = 0
      Top = 83
      Width = 38
      Height = 13
      Caption = 'Level 4:'
      FocusControl = EditColorBrackets4
    end
    object LabelBrackets3: TLabel
      Left = 0
      Top = 63
      Width = 38
      Height = 13
      Caption = 'Level 3:'
      FocusControl = EditColorBrackets3
    end
    object LabelBrackets1: TLabel
      Left = 0
      Top = 23
      Width = 38
      Height = 13
      Caption = 'Level 1:'
      FocusControl = EditColorBrackets1
    end
    object LabelBrackets2: TLabel
      Left = 0
      Top = 43
      Width = 38
      Height = 13
      Caption = 'Level 2:'
      FocusControl = EditColorBrackets2
    end
    object LabelBoldItalicUnderlineBrackets: TLabel
      Left = 150
      Top = 10
      Width = 36
      Height = 13
      Caption = 'B   I   U'
    end
    object EditColorBrackets1: TEdit
      Left = 75
      Top = 20
      Width = 50
      Height = 21
      TabOrder = 0
      Text = '000000'
      OnChange = EditColorChange
    end
    object EditColorBrackets2: TEdit
      Left = 75
      Top = 40
      Width = 50
      Height = 21
      TabOrder = 5
      Text = '000000'
      OnChange = EditColorChange
    end
    object EditColorBrackets3: TEdit
      Left = 75
      Top = 60
      Width = 50
      Height = 21
      TabOrder = 10
      Text = '000000'
      OnChange = EditColorChange
    end
    object EditColorBrackets4: TEdit
      Left = 75
      Top = 80
      Width = 50
      Height = 21
      TabOrder = 15
      Text = '000000'
      OnChange = EditColorChange
    end
    object EditColorBrackets5: TEdit
      Left = 75
      Top = 100
      Width = 50
      Height = 21
      TabOrder = 20
      Text = '000000'
      OnChange = EditColorChange
    end
    object EditColorBrackets6: TEdit
      Left = 75
      Top = 120
      Width = 50
      Height = 21
      TabOrder = 25
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorBrackets6: TButton
      Left = 124
      Top = 120
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 26
      OnClick = EditColorButtonClick
    end
    object ButtonColorBrackets5: TButton
      Left = 124
      Top = 100
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 21
      OnClick = EditColorButtonClick
    end
    object ButtonColorBrackets4: TButton
      Left = 124
      Top = 80
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 16
      OnClick = EditColorButtonClick
    end
    object ButtonColorBrackets3: TButton
      Left = 124
      Top = 60
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 11
      OnClick = EditColorButtonClick
    end
    object ButtonColorBrackets2: TButton
      Left = 124
      Top = 40
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 6
      OnClick = EditColorButtonClick
    end
    object ButtonColorBrackets1: TButton
      Left = 124
      Top = 20
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 1
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldBrackets1: TCheckBox
      Left = 145
      Top = 22
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 2
    end
    object CheckBoxItalicBrackets1: TCheckBox
      Left = 160
      Top = 22
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 3
    end
    object CheckBoxUnderlineBrackets1: TCheckBox
      Left = 175
      Top = 22
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 4
    end
    object CheckBoxUnderlineBrackets2: TCheckBox
      Left = 175
      Top = 42
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 9
    end
    object CheckBoxItalicBrackets2: TCheckBox
      Left = 160
      Top = 42
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 8
    end
    object CheckBoxBoldBrackets2: TCheckBox
      Left = 145
      Top = 42
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 7
    end
    object CheckBoxBoldBrackets3: TCheckBox
      Left = 145
      Top = 62
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 12
    end
    object CheckBoxItalicBrackets3: TCheckBox
      Left = 160
      Top = 62
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 13
    end
    object CheckBoxUnderlineBrackets3: TCheckBox
      Left = 175
      Top = 62
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 14
    end
    object CheckBoxUnderlineBrackets4: TCheckBox
      Left = 175
      Top = 82
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 19
    end
    object CheckBoxItalicBrackets4: TCheckBox
      Left = 160
      Top = 82
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 18
    end
    object CheckBoxBoldBrackets4: TCheckBox
      Left = 145
      Top = 82
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 17
    end
    object CheckBoxBoldBrackets5: TCheckBox
      Left = 145
      Top = 102
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 22
    end
    object CheckBoxItalicBrackets5: TCheckBox
      Left = 160
      Top = 102
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 23
    end
    object CheckBoxUnderlineBrackets5: TCheckBox
      Left = 175
      Top = 102
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 24
    end
    object CheckBoxUnderlineBrackets6: TCheckBox
      Left = 175
      Top = 122
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 29
    end
    object CheckBoxItalicBrackets6: TCheckBox
      Left = 160
      Top = 122
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 28
    end
    object CheckBoxBoldBrackets6: TCheckBox
      Left = 145
      Top = 122
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 27
    end
    object CheckBoxBrackets: TCheckBox
      Left = 0
      Top = 0
      Width = 141
      Height = 17
      Caption = 'Nested Brackets'
      Checked = True
      State = cbChecked
      TabOrder = 30
    end
  end
  object PanelColorStylesCases: TPanel
    Left = 605
    Top = 160
    Width = 196
    Height = 151
    BevelOuter = bvNone
    TabOrder = 5
    object LabelCases6: TLabel
      Left = 0
      Top = 123
      Width = 38
      Height = 13
      Caption = 'Level 6:'
      FocusControl = EditColorCases6
    end
    object LabelCases5: TLabel
      Left = 0
      Top = 103
      Width = 38
      Height = 13
      Caption = 'Level 5:'
      FocusControl = EditColorCases5
    end
    object LabelCases4: TLabel
      Left = 0
      Top = 83
      Width = 38
      Height = 13
      Caption = 'Level 4:'
      FocusControl = EditColorCases4
    end
    object LabelCases3: TLabel
      Left = 0
      Top = 63
      Width = 38
      Height = 13
      Caption = 'Level 3:'
      FocusControl = EditColorCases3
    end
    object LabelCases1: TLabel
      Left = 0
      Top = 23
      Width = 38
      Height = 13
      Caption = 'Level 1:'
      FocusControl = EditColorCases1
    end
    object LabelCases2: TLabel
      Left = 0
      Top = 43
      Width = 38
      Height = 13
      Caption = 'Level 2:'
      FocusControl = EditColorCases2
    end
    object LabelBoldItalicUnderlineCases: TLabel
      Left = 150
      Top = 10
      Width = 36
      Height = 13
      Caption = 'B   I   U'
      Visible = False
    end
    object EditColorCases1: TEdit
      Left = 75
      Top = 20
      Width = 50
      Height = 21
      TabOrder = 1
      Text = '000000'
      OnChange = EditColorChange
    end
    object EditColorCases2: TEdit
      Left = 75
      Top = 40
      Width = 50
      Height = 21
      TabOrder = 6
      Text = '000000'
      OnChange = EditColorChange
    end
    object EditColorCases3: TEdit
      Left = 75
      Top = 60
      Width = 50
      Height = 21
      TabOrder = 11
      Text = '000000'
      OnChange = EditColorChange
    end
    object EditColorCases4: TEdit
      Left = 75
      Top = 80
      Width = 50
      Height = 21
      TabOrder = 16
      Text = '000000'
      OnChange = EditColorChange
    end
    object EditColorCases5: TEdit
      Left = 75
      Top = 100
      Width = 50
      Height = 21
      TabOrder = 21
      Text = '000000'
      OnChange = EditColorChange
    end
    object EditColorCases6: TEdit
      Left = 75
      Top = 120
      Width = 50
      Height = 21
      TabOrder = 26
      Text = '000000'
      OnChange = EditColorChange
    end
    object ButtonColorCases6: TButton
      Left = 124
      Top = 120
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 27
      OnClick = EditColorButtonClick
    end
    object ButtonColorCases5: TButton
      Left = 124
      Top = 100
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 22
      OnClick = EditColorButtonClick
    end
    object ButtonColorCases4: TButton
      Left = 124
      Top = 80
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 17
      OnClick = EditColorButtonClick
    end
    object ButtonColorCases3: TButton
      Left = 124
      Top = 60
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 12
      OnClick = EditColorButtonClick
    end
    object ButtonColorCases2: TButton
      Left = 124
      Top = 40
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 7
      OnClick = EditColorButtonClick
    end
    object ButtonColorCases1: TButton
      Left = 124
      Top = 20
      Width = 20
      Height = 20
      Caption = '...'
      TabOrder = 2
      OnClick = EditColorButtonClick
    end
    object CheckBoxBoldCases1: TCheckBox
      Left = 145
      Top = 22
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 3
    end
    object CheckBoxItalicCases1: TCheckBox
      Left = 160
      Top = 22
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 4
    end
    object CheckBoxUnderlineCases1: TCheckBox
      Left = 175
      Top = 22
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 5
    end
    object CheckBoxUnderlineCases2: TCheckBox
      Left = 175
      Top = 42
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 10
    end
    object CheckBoxItalicCases2: TCheckBox
      Left = 160
      Top = 42
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 9
    end
    object CheckBoxBoldCases2: TCheckBox
      Left = 145
      Top = 42
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 8
    end
    object CheckBoxBoldCases3: TCheckBox
      Left = 145
      Top = 62
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 13
    end
    object CheckBoxItalicCases3: TCheckBox
      Left = 160
      Top = 62
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 14
    end
    object CheckBoxUnderlineCases3: TCheckBox
      Left = 175
      Top = 62
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 15
    end
    object CheckBoxUnderlineCases4: TCheckBox
      Left = 175
      Top = 82
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 20
    end
    object CheckBoxItalicCases4: TCheckBox
      Left = 160
      Top = 82
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 19
    end
    object CheckBoxBoldCases4: TCheckBox
      Left = 145
      Top = 82
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 18
    end
    object CheckBoxBoldCases5: TCheckBox
      Left = 145
      Top = 102
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 23
    end
    object CheckBoxItalicCases5: TCheckBox
      Left = 160
      Top = 102
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 24
    end
    object CheckBoxUnderlineCases5: TCheckBox
      Left = 175
      Top = 102
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 25
    end
    object CheckBoxUnderlineCases6: TCheckBox
      Left = 175
      Top = 122
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 30
    end
    object CheckBoxItalicCases6: TCheckBox
      Left = 160
      Top = 122
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 29
    end
    object CheckBoxBoldCases6: TCheckBox
      Left = 145
      Top = 122
      Width = 15
      Height = 15
      TabStop = False
      TabOrder = 28
    end
    object CheckBoxCases: TCheckBox
      Left = 0
      Top = 0
      Width = 151
      Height = 17
      Caption = 'Nested CASES, DECODES'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
  end
end
