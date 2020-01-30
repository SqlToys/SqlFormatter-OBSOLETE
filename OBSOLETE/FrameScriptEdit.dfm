object FrameScriptEdit: TFrameScriptEdit
  Left = 0
  Top = 0
  Width = 451
  Height = 302
  Align = alClient
  AutoSize = True
  TabOrder = 0
  object ScriptEdit: TRichEdit
    Left = 0
    Top = 0
    Width = 451
    Height = 302
    Cursor = crIBeam
    Align = alClient
    BorderStyle = bsNone
    Font.Charset = EASTEUROPE_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    HideSelection = False
    MaxLength = 1048576
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
    WantTabs = True
    WordWrap = False
    StyleElements = [seClient, seBorder]
    Zoom = 100
    OnKeyDown = ScriptEditKeyDown
    OnMouseDown = ScriptEditMouseDown
    OnSelectionChange = ScriptEditSelectionChange
  end
  object TimerDblClickRecognize: TTimer
    Enabled = False
    Interval = 300
    OnTimer = TimerDblClickRecognizeTimer
    Left = 93
  end
  object TimerDblClickSelection: TTimer
    Enabled = False
    Interval = 100
    OnTimer = TimerDblClickSelectionTimer
    Left = 123
  end
  object ActionList: TActionList
    Left = 63
    object actFilesNew: TAction
      Category = 'Files'
      Caption = '&New'
      ShortCut = 16462
      OnExecute = actFilesNewExecute
    end
    object actFilesOpen: TAction
      Category = 'Files'
      Caption = '&Open...'
      ShortCut = 16463
      OnExecute = actFilesOpenExecute
    end
    object actFilesSave: TAction
      Category = 'Files'
      Caption = '&Save'
      ShortCut = 16467
      OnExecute = actFilesSaveExecute
    end
    object actFilesSaveAs: TAction
      Category = 'Files'
      Caption = 'Save &As...'
      OnExecute = actFilesSaveAsExecute
    end
    object actFilesSaveAll: TAction
      Category = 'Files'
      Caption = 'Sa&ve All'
      Enabled = False
      ShortCut = 24659
    end
    object actFilesClose: TAction
      Category = 'Files'
      Caption = '&Close'
      ShortCut = 16499
      OnExecute = actFilesCloseExecute
    end
    object actFilesRecentClearAll: TAction
      Category = 'Files'
      Caption = 'Recent files - clear all'
      OnExecute = actFilesRecentClearAllExecute
    end
    object actFilesRecentClearNonExistent: TAction
      Category = 'Files'
      Caption = 'Recent files - clear non existent'
      OnExecute = actFilesRecentClearNonExistentExecute
    end
    object actFilesExit: TAction
      Category = 'Files'
      Caption = 'E&xit'
      ShortCut = 32883
      OnExecute = actFilesExitExecute
    end
    object actEditUndo: TAction
      Category = 'Edit'
      Caption = '&Undo'
      ShortCut = 16474
      OnExecute = actEditUndoExecute
    end
    object actEditRedo: TAction
      Category = 'Edit'
      Caption = '&Redo'
      Enabled = False
      OnExecute = actEditRedoExecute
    end
    object actEditCut: TAction
      Category = 'Edit'
      Caption = 'Cu&t'
      ShortCut = 16472
      OnExecute = actEditCutExecute
    end
    object actEditCopy: TAction
      Category = 'Edit'
      Caption = '&Copy'
      ShortCut = 16451
      OnExecute = actEditCopyExecute
    end
    object actEditPaste: TAction
      Category = 'Edit'
      Caption = '&Paste'
      ShortCut = 16470
      OnExecute = actEditPasteExecute
    end
    object actEditSelectAll: TAction
      Category = 'Edit'
      Caption = 'Select A&ll'
      ShortCut = 16449
      OnExecute = actEditSelectAllExecute
    end
    object actEditFindReplace: TAction
      Category = 'Edit'
      Caption = '&Find and replace'
      ShortCut = 16454
      OnExecute = actEditFindReplaceExecute
    end
    object actEditFindReplaceNext: TAction
      Category = 'Edit'
      Caption = 'Find and replace &next'
      SecondaryShortCuts.Strings = (
        'F3')
      ShortCut = 16460
      OnExecute = actEditFindReplaceNextExecute
    end
    object actEditPrevQuery: TAction
      Category = 'Edit'
      Caption = 'Pre&v Query'
      ShortCut = 32806
      OnExecute = actEditPrevQueryExecute
    end
    object actEditNextQuery: TAction
      Category = 'Edit'
      Caption = 'Ne&xt Query'
      ShortCut = 32808
      OnExecute = actEditNextQueryExecute
    end
    object actEditHighlightQuery: TAction
      Category = 'Edit'
      Caption = 'Highlight &Query'
      ShortCut = 8312
      OnExecute = actEditHighlightQueryExecute
    end
    object actEditHighlightSubQuery: TAction
      Category = 'Edit'
      Caption = 'Highlight &Subquery'
      Enabled = False
      OnExecute = actEditHighlightSubQueryExecute
    end
    object actEditUpperCase: TAction
      Category = 'Edit'
      Caption = 'Upper case'
      ShortCut = 24661
      OnExecute = actEditUpperCaseExecute
    end
    object actEditLowerCase: TAction
      Category = 'Edit'
      Caption = 'Lower case'
      ShortCut = 24652
      OnExecute = actEditLowerCaseExecute
    end
    object actEditIntend: TAction
      Category = 'Edit'
      Caption = 'Intend'
      ShortCut = 9
      OnExecute = actEditIntendExecute
    end
    object actEditUnIntend: TAction
      Category = 'Edit'
      Caption = 'Unintend'
      ShortCut = 8201
      OnExecute = actEditUnIntendExecute
    end
    object actEditCtrlTab: TAction
      Category = 'Edit'
      Caption = 'actEditCtrlTab'
      ShortCut = 16393
      OnExecute = actEditCtrlTabExecute
    end
    object actEditCtrlLeft: TAction
      Category = 'Edit'
      Caption = 'Move cursor to begin of a word'
      ShortCut = 16421
      OnExecute = actEditCtrlLeftExecute
    end
    object actEditCtrlRight: TAction
      Category = 'Edit'
      Caption = 'Move cursor to end of a word'
      ShortCut = 16423
      OnExecute = actEditCtrlRightExecute
    end
    object actEditCtrlShiftLeft: TAction
      Category = 'Edit'
      Caption = 'Select to begin of a word'
      ShortCut = 24613
      OnExecute = actEditCtrlShiftLeftExecute
    end
    object actEditCtrlShiftRight: TAction
      Category = 'Edit'
      Caption = 'Select to end of a word'
      ShortCut = 24615
      OnExecute = actEditCtrlShiftRightExecute
    end
    object actEditShiftLeft: TAction
      Category = 'Edit'
      Caption = 'Selects to left'
      ShortCut = 8229
      OnExecute = actEditShiftLeftExecute
    end
    object actEditShiftRight: TAction
      Category = 'Edit'
      Caption = 'Selects to right'
      ShortCut = 8231
      OnExecute = actEditShiftRightExecute
    end
    object actToolsCompact: TAction
      Category = 'Tools'
      Caption = '&Compact'
      ShortCut = 117
      OnExecute = actToolsCompactExecute
    end
    object actToolsFormat: TAction
      Category = 'Tools'
      Caption = '&Format'
      ShortCut = 118
      OnExecute = actToolsFormatExecute
    end
    object actToolsListByTokens: TAction
      Category = 'Tools'
      Caption = 'List By &Tokens'
      ShortCut = 119
      OnExecute = actToolsListByTokensExecute
    end
    object actFilesExportXML: TAction
      Category = 'Files'
      Caption = 'Export to XML'
      OnExecute = actFilesExportXMLExecute
    end
    object ActFilesImportXML: TAction
      Category = 'Files'
      Caption = 'Import from XML'
      OnExecute = ActFilesImportXMLExecute
    end
  end
end
