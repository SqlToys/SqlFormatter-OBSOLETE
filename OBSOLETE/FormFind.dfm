object FormFindReplace: TFormFindReplace
  Left = 143
  Top = 109
  BorderStyle = bsDialog
  Caption = 'Find & Replace ...'
  ClientHeight = 192
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LeftPanel: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 175
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object FindReplacePanel: TPanel
      Left = 0
      Top = 0
      Width = 400
      Height = 70
      Align = alTop
      TabOrder = 0
      DesignSize = (
        400
        70)
      object FindTextLabel: TLabel
        Left = 24
        Top = 13
        Width = 56
        Height = 13
        Alignment = taRightJustify
        Caption = '&Text to find:'
        FocusControl = FindTextComboBox
      end
      object ReplaceTextLabel: TLabel
        Left = 10
        Top = 43
        Width = 70
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Replace &with:'
        FocusControl = ReplaceTextComboBox
      end
      object FindTextComboBox: TComboBox
        Left = 85
        Top = 10
        Width = 300
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
      object ReplaceTextComboBox: TComboBox
        Left = 85
        Top = 40
        Width = 300
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
      end
    end
    object OptionsPanel: TPanel
      Left = 0
      Top = 70
      Width = 400
      Height = 105
      Align = alClient
      TabOrder = 1
      DesignSize = (
        400
        105)
      object OptionsGroupBox: TGroupBox
        Left = 10
        Top = 10
        Width = 185
        Height = 85
        Anchors = [akLeft, akTop, akBottom]
        Caption = ' Options '
        TabOrder = 0
        object CaseSesitiveCheckBox: TCheckBox
          Left = 10
          Top = 20
          Width = 170
          Height = 17
          Caption = 'Case sesitive'
          TabOrder = 0
        end
        object WholeWordsCheckBox: TCheckBox
          Left = 10
          Top = 40
          Width = 170
          Height = 17
          Caption = 'Whole words only'
          TabOrder = 1
        end
        object PromptOnReplace: TCheckBox
          Left = 10
          Top = 60
          Width = 171
          Height = 17
          Caption = 'Prompt on replace'
          TabOrder = 2
        end
      end
      object DirectionGroupBox: TGroupBox
        Left = 205
        Top = 10
        Width = 185
        Height = 85
        Anchors = [akLeft, akTop, akBottom]
        Caption = ' Direction '
        TabOrder = 1
        object ForwardRadioButton: TRadioButton
          Left = 10
          Top = 20
          Width = 113
          Height = 17
          Caption = 'Forwar&d'
          TabOrder = 0
        end
        object BackwardRadioButton: TRadioButton
          Left = 10
          Top = 40
          Width = 113
          Height = 17
          Caption = '&Backward'
          TabOrder = 1
        end
      end
    end
  end
  object ButtonsPanel: TPanel
    Left = 400
    Top = 0
    Width = 96
    Height = 175
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object FindButton: TButton
      Left = 10
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Find'
      Default = True
      TabOrder = 0
      OnClick = FindButtonClick
    end
    object ReplaceButton: TButton
      Left = 10
      Top = 80
      Width = 75
      Height = 25
      Caption = '&Replace'
      TabOrder = 1
      OnClick = ReplaceButtonClick
    end
    object ReplaceAllButton: TButton
      Left = 10
      Top = 110
      Width = 75
      Height = 25
      Caption = 'Replace &All'
      TabOrder = 2
      OnClick = ReplaceAllButtonClick
    end
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 175
    Width = 496
    Height = 17
    Align = alBottom
    Smooth = True
    TabOrder = 2
  end
  object ActionList1: TActionList
    Left = 432
    Top = 37
    object actFindCopy: TAction
      Caption = 'Copy'
      ShortCut = 16451
      OnExecute = actFindCopyExecute
    end
    object actFindPaste: TAction
      Caption = 'Paste'
      ShortCut = 16470
      OnExecute = actFindPasteExecute
    end
    object actFindCut: TAction
      Caption = 'actFindCut'
      ShortCut = 16472
      OnExecute = actFindCutExecute
    end
  end
end
