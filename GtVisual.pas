(* $Header: /SQL Toys/SqlFormatter/GtVisual.pas 148   18-01-28 12:47 Tomek $
   (c) Tomasz Gierka, github.com/SqlToys, 2003.03.30                          *)
{--------------------------------------  --------------------------------------}
{$IFDEF RELEASE}
  {$DEBUGINFO OFF}
  {$LOCALSYMBOLS OFF}
{$ENDIF}
unit GtVisual;

interface

uses Classes, Controls, ActnList, Menus, Forms, ComCtrls, SysUtils, Graphics;
     // RzCommon;

{--------------------------------------  --------------------------------------}
{------------------------------- Klasy wyj¹tków -------------------------------}

// Dwie praktycznie identyczne klasy, bo maj¹ pe³niæ analogiczne funkcje

type
  EGtException = class(Exception)
    Title, Additional: String;

    constructor CreateTitle(aTitle, aMessage: String);
    constructor CreateTitleAdd(aTitle, aMessage, aAdditional: String);
  end;

//type
//  EGtWarning = class(Exception)
//    Title, Additional: String;
//
//    constructor CreateTitle(aTitle, aMessage: String);
//    constructor CreateTitleAdd(aTitle, aMessage, aAdditional: String);
//  end;

  EGtCanceled = class(EGtException);   // operacja anulowana

{--------------------------------------  --------------------------------------}
{------------------------------- Funkcje modu³u -------------------------------}

procedure SetCtlFocus(aComponent: TWinControl);

function  GetSenderTag(Sender: TObject): Integer;

function  ActionCreate (aOwner: TComponent; aActList: TCustomActionList; aTag: Integer;
                        aCapt,aShortCut: String; aOnExec: TNotifyEvent): TAction;
function  ActionTagFind(aActList: TActionList; aTag: Integer;var aAct: TAction): Boolean;
function  ActionTagExec(aActList: TActionList; aTag: Integer): Boolean;
function  ActionTagActive(aActList: TActionList; aTag: Integer): Boolean;

function  MsgBoxYesNoCanc(aCapt,aText: String;var aYesNo: Boolean): Boolean;
function  MsgBoxYesNo(aCapt,aText: String): Boolean;
procedure MsgBoxOK(aCapt: String; aText: String='');
procedure MsgBoxUwaga(aText: String);
function  MsgBoxWydruk(aText: String): Boolean;
procedure MsgBoxException(aTitle: String=''; aText: String='');

function  MenuItemCreate(aOwner: TComponent; aCapt: String; aOnClick: TNotifyEvent=nil; aVisible: Boolean=True): TMenuItem;
//function  MenuItemCopy(aMenuItem: TMenuItem; aNewOwner, aNewMenu: TComponent): TMenuItem;
//procedure MenuCopy(aMenuFrom: TMenu; aNewOwner: TComponent; aNewMenu: TMenu);
//procedure MenuItemMove(aMenuItem: TMenuItem; aMenuTo: TMenu);
procedure MenuMove(aMoveFrom, aMoveTo: TMenu);

procedure ActionsMove(aMoveFrom, aMoveTo: TActionList);

procedure WindowListAdd(Form: TForm);
procedure WindowListDel(Form: TForm);

const
  GtFileFilterAll =  'Wszystkie pliki (*.*)|*.*';
  GtFileFilterMdb =  'Baza danych (*.mdb)|*.mdb';
  GtFileFilterGfx =  'Wszystkie (*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf)|*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                   + '|Obrazy JPEG (*.jpg;*.jpeg)|*.jpg;*.jpeg'
                   + '|Bitmapy (*.bmp)|*.bmp'
                   + '|Ikony (*.ico)|*.ico';
  GtFileFilterXml =  'Pliki XML (*.xml)|*.xml';
  GtFileFilterPas =  'Pliki Delphi (Pascal) (.pas)|*.pas';

  GtFileFilterSql =  'SQL Script|*.sql';

function GtOpenFile(var aFileName: String; aDirectory: String=''; aDefExt: String=''; aFilter: String=''): Boolean;
function GtOpenGfxFile(var aFileName: String; aDirectory: String=''): Boolean;
function GtOpenMdbFile(var aFileName: String; aDirectory: String=''): Boolean;
function GtOpenXmlFile(var aFileName: String; aDirectory: String=''): Boolean;
function GtOpenPasFile(var aFileName: String; aDirectory: String=''): Boolean;
function GtOpenSqlFile(var aFileName: String; aDirectory: String=''): Boolean;

function GtSaveFile(var aFileName: String; aDirectory: String=''; aDefExt: String=''; aFilter: String=''): Boolean;
function GtSaveGfxFile(var aFileName: String; aDirectory: String=''): Boolean;
function GtSaveMdbFile(var aFileName: String; aDirectory: String=''): Boolean;
function GtSaveXmlFile(var aFileName: String; aDirectory: String=''): Boolean;
function GtSavePasFile(var aFileName: String; aDirectory: String=''): Boolean;
function GtSaveSqlFile(var aFileName: String; aDirectory: String=''): Boolean;

function GtFileSize(aFileName: String): Integer;
function GtFileDate(aFileName: String): TDateTime;

function GtFileOrMemSizeToStr(aSize: Integer; aPrec: Integer=-1): String;

var
  WindowListMenu: TMenuItem;

// aplikacja
//  ApplicationName: String = '';

{--------------------------------------  --------------------------------------}
{---------------------------------- RichEdit ----------------------------------}

procedure RichEditSetPosition(aRichEdit: TRichEdit; aLine, aCol: Integer);
procedure RichEditSetSelection(aRichEdit: TRichEdit; aLine1, aCol1, aLine2, aCol2: Integer); overload;
procedure RichEditSetSelection(aRichEdit: TRichEdit; aLine, aCol, aLen: Integer); overload;

{--------------------------------------  --------------------------------------}
{----------------------------------- Kolory -----------------------------------}

const
  gtRgbWhite   = $FFFFFF;
  gtRgbBlack   = $000000;

  // kolory systemowe - szare
  gtRgbSilver  = $C0C0C0;  // aka: clLtGray
  gtRgbGray    = $808080;  // aka: clDkGray

  // kolory systemowe - pelne
  gtRgbRed     = $FF0000;
  gtRgbLime    = $00FF00;  // Lime green
  gtRgbBlue    = $0000FF;

  gtRgbYellow  = $FFFF00;
  gtRgbFuchsia = $FF00FF;
  gtRgbAqua    = $00FFFF;

  // kolory systemowe - srednie
  gtRgbMaroon  = $800000;
  gtRgbGreen   = $008000;
  gtRgbNavy    = $000080;

  gtRgbOlive   = $808000;  // Olive green
  gtRgbPurple  = $800080;
  gtRgbTeal    = $008080;

{--------------------------------------  --------------------------------------}
{------------------------------ Wartosci binarne ------------------------------}

const
  gt2P0  = 1;
  gt2    = 2;
  gt2P1  = 2;             // $00000002 =          2
  gt2P2  = gt2P1  shl 1;  // $00000004 =          4
  gt2P3  = gt2P2  shl 1;  // $00000008 =          8
  gt2P4  = gt2P3  shl 1;  // $00000010 =         16
  gt2P5  = gt2P4  shl 1;  // $00000020 =         32
  gt2P6  = gt2P5  shl 1;  // $00000040 =         64
  gt2P7  = gt2P6  shl 1;  // $00000080 =        128
  gt2P8  = gt2P7  shl 1;  // $00000100 =        256
  gt2P9  = gt2P8  shl 1;  // $00000200 =        512
  gt2P10 = gt2P9  shl 1;  // $00000400 =       1024
  gt2P11 = gt2P10 shl 1;  // $00000800 =       2048
  gt2P12 = gt2P11 shl 1;  // $00001000 =       4096
  gt2P13 = gt2P12 shl 1;  // $00002000 =       8192
  gt2P14 = gt2P13 shl 1;  // $00004000 =      16384
  gt2P15 = gt2P14 shl 1;  // $00008000 =      32768
  gt2P16 = gt2P15 shl 1;  // $00010000 =      65536
  gt2P17 = gt2P16 shl 1;  // $00020000 =     131072
  gt2P18 = gt2P17 shl 1;  // $00040000 =     262144
  gt2P19 = gt2P18 shl 1;  // $00080000 =     524288
  gt2P20 = gt2P19 shl 1;  // $00100000 =    1048576
  gt2P21 = gt2P20 shl 1;  // $00200000 =    2097152
  gt2P22 = gt2P21 shl 1;  // $00400000 =    4194304
  gt2P23 = gt2P22 shl 1;  // $00800000 =    8388608
  gt2P24 = gt2P23 shl 1;  // $01000000 =   16777216
  gt2P25 = gt2P24 shl 1;  // $02000000 =   33554432
  gt2P26 = gt2P25 shl 1;  // $04000000 =   67108864
  gt2P27 = gt2P26 shl 1;  // $08000000 =  134217728
  gt2P28 = gt2P27 shl 1;  // $10000000 =  268435456
  gt2P29 = gt2P28 shl 1;  // $20000000 =  536870912
  gt2P30 = gt2P29 shl 1;  // $40000000 = 1073741824
  gt2P31 = gt2P30 shl 1;  // $80000000 = 2147483648
  gt2P32 = gt2P31 shl 1;  //$100000000 = 4294967296

function binGetByte(aBinValue: Integer; aByteNo: Integer = 0): Integer; overload;
function binGetByte(aBinValue: Cardinal; aByteNo: Integer = 0): Integer; overload;

function FontSizeUp(aFont: TFont; aMaxSize: Integer = 0): Boolean;
function FontSizeDown(aFont: TFont; aMinSize: Integer = 0): Boolean;

// function StringList_Distance(aSL: TStrings; aLine1, aPos1, aLine2, aPos2: Integer): Integer; overload;
function StringList_Distance(aSL: TStrings; aStart, aStop: Integer): Integer; overload;
procedure StringList_Abs_to_Line_Pos(aSL: TStrings; aAbs: Integer; var aLine, aPos{, aRest}: Integer);

{$IF CompilerVersion >= 24}
{$ELSE}
type gtstdcharset = set of char;
function CharInSet(ch: Char; chset: gtstdcharset): Boolean;
{$IFEND}

implementation

uses Windows, Dialogs, ExtDlgs, Messages, ComObj,
     GtExternals
     {$IF CompilerVersion >= 24} , System.Actions {$ELSE}  {$IFEND} ;

{--------------------------------------  --------------------------------------}
{------------------------------- Klasy wyj¹tków -------------------------------}

{ kreator wyj¹tku z tytu³em }
constructor EGtException.CreateTitle(aTitle, aMessage: String);
begin
  Title:=aTitle;
  Additional:='';
  Create(aMessage);
end;

{ kreator wyj¹tku z tytu³em i informacjami dodatkowymi }
constructor EGtException.CreateTitleAdd(aTitle, aMessage, aAdditional: String);
begin
  Title:=aTitle;
  Additional:=aAdditional;
  Create(aMessage);
end;

{--------------------------------------  --------------------------------------}
{------------------------------- Funkcje modu³u -------------------------------}

{ ustawia Focus na kontrolce }
{ dodatkowo wymusza zaznacza zawartoœæ kontrolek edycyjnych na wypadek gdyby otrzyma³y Focus wczeœniej i w miêdzyczasie zmieni³a siê ich zawartoœæ }
procedure SetCtlFocus(aComponent: TWinControl);
begin
  if not Assigned(aComponent) then Exit;
  if not aComponent.Enabled then Exit;
  aComponent.SetFocus;
{ Raize }
//  if aComponent is TRzEdit then TRzEdit(aComponent).SelectAll else
//  if aComponent is TRzButtonEdit then TRzButtonEdit(aComponent).SelectAll else
//  if aComponent is TRzNumericEdit then TRzEdit(aComponent).SelectAll else
end;

{ wzraca Tag wskazanego obiektu, funkcja niepotrzebna ale u³atwia zrozumienie i czytelnoœæ kodu ;-) }
function  GetSenderTag(Sender: TObject): Integer;
begin
  Result := 0;
  try
    if (Sender is TAction) then Result := (Sender as TAction).Tag;
    if (Sender is TMenuItem) then Result := (Sender as TMenuItem).Tag;
    // if (Sender is TRzCustomStatusPane) then Result := (Sender as TRzCustomStatusPane).Tag;
  except
  end;
end;

{ buduje akcjê }
function  ActionCreate (aOwner: TComponent; aActList: TCustomActionList; aTag: Integer;
                        aCapt,aShortCut: String; aOnExec: TNotifyEvent): TAction;
begin
  Result:=TAction.Create(aOwner);
  Result.Tag       := aTag;
  Result.Caption   := aCapt;
  Result.OnExecute := aOnExec;
  Result.ActionList:= aActList;
  Result.ShortCut  := TextToShortCut(aShortCut);
end;

{ szuka akcji w ActionList o podanym Tag-u }
function  ActionTagFind(aActList: TActionList; aTag: Integer;var aAct: TAction): Boolean;
var i: Integer;
begin
  Result:=False;
  aAct  :=nil;
  if aTag=0 then Exit;             // tylko konkretne tagi !!!

  // gdy kolejno wpisywane akcje : akcja 0 ma tag=1
  if (aTag <= aActList.ActionCount) and Assigned(aActList.Actions[aTag-1]) and
     (aActList.Actions[aTag-1].Tag = aTag) then begin

    aAct  := aActList.Actions[aTag-1] as TAction;
    Result:= True;
  end else begin

    i:=0;
    while not Result and (i<aActList.ActionCount)do begin
      if Assigned(aActList.Actions[i]) and (aActList.Actions[i].Tag=aTag) then begin
        aAct  := aActList.Actions[i] as TAction;
        Result:= True;
      end;
      Inc(i);
    end;
  end;
end;

{ uruchamia akcjê z ActionList-y o podanym Tag-u }
function  ActionTagExec(aActList: TActionList; aTag: Integer): Boolean;
var Act: TAction;
begin
  Result:=ActionTagFind(aActList, aTag, Act) and Act.Enabled;
  if Result then Result:=Act.Execute;
end;

{ sprawdza czy akcja z ActionListy o podanym Tag-u jest aktywna }
function  ActionTagActive(aActList: TActionList; aTag: Integer): Boolean;
var Act: TAction;
begin
  Result:=ActionTagFind(aActList, aTag, Act) and Act.Enabled;
end;

{ pokazuje MessageBox z przyciskami Tak, Nie, Cancel }
{ zwraca True jeœli wybrano Tak lub Nie }
function  MsgBoxYesNoCanc(aCapt,aText: String;var aYesNo: Boolean): Boolean;
var i: Integer;
begin
  i:=Application.MessageBox(PChar(aText), PChar(aCapt), MB_YESNOCANCEL);
  Result:= (i = IDYES) or (i = IDNO);
  aYesNo:= (i = IDYES);
end;

{ pokazuje MessageBox z przyciskiem OK }
procedure MsgBoxOK(aCapt: String; aText: String='');
begin
  if aText='' then aText:=aCapt;
  Application.MessageBox(PChar(aText), PChar(aCapt), MB_OK);
end;

{ pokazuje MessageBox z przyciskami Tak, Nie }
{ zwraca True jeœli wybrano Tak }
function  MsgBoxYesNo(aCapt,aText: String): Boolean;
var i: Integer;
begin
  i:=Application.MessageBox(PChar(aText), PChar(aCapt), MB_YESNO + MB_ICONQUESTION);
  Result:=   i = IDYES;
end;

{ pokazuje MessageBox UWAGA }
procedure MsgBoxUwaga(aText: String);
begin
  Application.MessageBox(PChar(aText), 'UWAGA', MB_ICONWARNING);
end;

{ pokazuje MessageBox WYDRUK }
function  MsgBoxWydruk(aText: String): Boolean;
begin
  Result := MsgBoxYesNo('WYDRUK', aText);
end;

{ otwiera MessgaeBox z informacj¹ o wyj¹tku }
procedure MsgBoxException(aTitle: String=''; aText: String='');
// var aTitle: String;
begin
  with ExceptObject as Exception do begin
    if aText='' then aText:=Message;

    if aTitle='' then begin
      aTitle:=ClassName;

      if ExceptObject is EOleException then aTitle:=aTitle + ': $' + IntToHex(EOleException(ExceptObject).ErrorCode, 8) else
      if(ExceptObject is EGtException) and (EGtException(ExceptObject).Title<>'')
        then aTitle:=EGtException(ExceptObject).Title else
    end;
  end;

  Application.MessageBox(PChar(aText), PChar(aTitle), MB_ICONWARNING);
end;

{ tworzy element menu }
function  MenuItemCreate(aOwner: TComponent; aCapt: String; aOnClick: TNotifyEvent=nil; aVisible: Boolean=True): TMenuItem;
begin
  Result:=TMenuItem.Create(aOwner);
  Result.Caption := aCapt;
  Result.OnClick := aOnClick;
  Result.Visible := aVisible;
  if aOwner is TMenu then TMenu(aOwner).Items.Add(Result);
end;

{ kopiuje elementy menu }
//function MenuItemCopy(aMenuItem: TMenuItem; aNewOwner, aNewMenu: TComponent): TMenuItem;
//var i: Integer;
//begin
//  Result := MenuItemCreate(aNewOwner, aMenuItem.Caption, aMenuItem.OnClick, aMenuItem.Visible);
//  // Result.Parent := aNewMenu;
//  if aNewMenu is TMenu then TMenu(aNewMenu).Items.Add(Result);
//
//  Result.AutoCheck := aMenuItem.AutoCheck;
//  Result.AutoHotkeys := aMenuItem.AutoHotkeys;
//  Result.AutoLineReduction := aMenuItem.AutoLineReduction;
//  Result.Bitmap := aMenuItem.Bitmap;
//  Result.Break := aMenuItem.Break;
//  // Result.Caption := aMenuItem.Caption;
//  Result.Checked := aMenuItem.Checked;
//  Result.Default := aMenuItem.Default;
//  Result.Enabled := aMenuItem.Enabled;
//  Result.GroupIndex := aMenuItem.GroupIndex;
//  Result.HelpContext := aMenuItem.HelpContext;
//  Result.Hint := aMenuItem.Hint;
//  Result.ImageIndex := aMenuItem.ImageIndex;
//  // Result.Name := aMenuItem.Name;
//  Result.RadioItem := aMenuItem.RadioItem;
//  Result.ShortCut := aMenuItem.ShortCut;
//  Result.Tag := aMenuItem.Tag;
//  // Result.Visible := aMenuItem.Visible;
//
//  Result.OnClick := aMenuItem.OnClick;
//  Result.OnDrawItem := aMenuItem.OnDrawItem;
//  Result.OnMeasureItem := aMenuItem.OnMeasureItem;
//  Result.OnAdvancedDrawItem := aMenuItem.OnAdvancedDrawItem;
//
//  Result.Action := aMenuItem.Action;
//  Result.SubMenuImages := aMenuItem.SubMenuImages;
//
//  for i := 0 to aMenuItem.Count - 1 do
//    MenuItemCopy(aMenuItem.Items[i], aNewOwner, Result);
//end;

{ kopiuje menu }
//procedure MenuCopy(aMenuFrom: TMenu; aNewOwner: TComponent; aNewMenu: TMenu);
//var i: Integer;
//begin
//  for i := 0 to aMenuFrom.Items.Count - 1 do
//    MenuItemCopy(aMenuFrom.Items[i], aNewOwner, aNewMenu);
//end;

{ przenosi Menu item do innego menu, wykorzystuje w³asnoœæ GroupIndex }
{ TODO: co jeœli pozycja o danej nazwie ju¿ istnieje ??? }
procedure MenuItemMove(aMenuItem, aMoveTo: TMenuItem);
var i, j: Integer;
begin
  aMenuItem.Parent.Remove(aMenuItem);

//  lAddTo := aMoveTo.Items.Find( lItem.Caption );
//  if Assigned(lAddTo) then begin
//    while lItem.Count > 0 do MenuItemMove(lItem[0], lAddTo);
//    lItem.Free;
//  end else
  if (aMenuItem.GroupIndex = 0) or (aMoveTo.Count = 0)then begin
    aMoveTo.Add(aMenuItem);
  end else begin
    j := aMoveTo.Count - 1;

    if aMenuItem.GroupIndex <> 0 then
      for i := 0 to aMoveTo.Count - 1 do
        if aMoveTo.Items[i].GroupIndex <= aMenuItem.GroupIndex then j := i;

    aMoveTo.Insert(j+1,aMenuItem);
  end;
end;

{ przenosi ca³e menu do innego }
procedure MenuMove(aMoveFrom, aMoveTo: TMenu);
var lItem, lAddTo: TMenuItem;
    i, j: Integer;
begin
  while aMoveFrom.Items.Count > 0 do begin
    lItem := aMoveFrom.Items[0];
    lItem.Parent.Remove(lItem);

    lAddTo := aMoveTo.Items.Find( lItem.Caption );
    if Assigned(lAddTo) then begin
      while lItem.Count > 0 do MenuItemMove(lItem[0], lAddTo);
      lItem.Free;
    end else
    if (lItem.GroupIndex = 0) or (aMoveTo.Items.Count = 0)then begin
      aMoveTo.Items.Add(lItem);
    end else begin
      j := aMoveTo.Items.Count - 1;

      if lItem.GroupIndex <> 0 then
        for i := 0 to aMoveTo.Items.Count - 1 do
          if aMoveTo.Items[i].GroupIndex <= lItem.GroupIndex then j := i;

      aMoveTo.Items.Insert(j+1, lItem);
    end;
  end;
end;

{ przenosi akcje do innej Action List }
procedure ActionsMove(aMoveFrom, aMoveTo: TActionList);
begin
  while aMoveFrom.ActionCount > 0 do begin
    aMoveFrom.Actions[ aMoveFrom.ActionCount - 1 ].ActionList := aMoveTo;
  end;
end;

{ dodaje formê do listy otwartych okienek }
procedure WindowListAdd(Form: TForm);
var NewItem: TMenuItem;
    i,j,k: Integer;
    B: Boolean;
begin
  if not Assigned(WindowListMenu)then Exit;
  if WindowListMenu.Count > 99 then Exit;

  k:=1;
  i:=WindowListMenu.Count;
  while i>0 do begin
    Dec(i);
    B:=False;
    j:=WindowListMenu.Count;
    while not B and (j>0) do begin
      Dec(j);
      B:=B or (WindowListMenu.Items[i].Tag+1 = WindowListMenu.Items[j].Tag);
    end;
    if not B then k:=WindowListMenu.Items[i].Tag +1;
  end;

  NewItem := TMenuItem.Create(WindowListMenu);
  NewItem.Caption := Form.Caption;
  NewItem.OnClick := WindowListMenu.OnClick;
  NewItem.Tag := k;
  Form.Tag    := k;

  WindowListMenu.Add(NewItem);
  WindowListMenu.Visible:= WindowListMenu.Count>1;
end;

{ usuwa formê z listy otwartych okienek }
procedure WindowListDel(Form: TForm);
var i: Integer;
    B: Boolean;
begin
  if not Assigned(WindowListMenu)then Exit;

  B:=False;
  i:=WindowListMenu.Count;
  while not B and (i>0) do begin
    Dec(i);
    B:= WindowListMenu.Items[i].Tag = Form.Tag;
    if B then WindowListMenu.Delete( i );
  end;

  WindowListMenu.Visible:= WindowListMenu.Count>1;
end;

{ dialog otwierania pliku }
function GtOpenFile(var aFileName: String; aDirectory: String=''; aDefExt: String=''; aFilter: String=''): Boolean;
begin
  with TOpenDialog.Create(Application) do
    try
      if aDirectory<>'' then InitialDir := aDirectory;
      if aDefExt<>''    then DefaultExt := aDefExt    else DefaultExt := '*.*';
      if aFilter<>''    then Filter     := aFilter    else Filter     := GtFileFilterAll;

      FileName:=  aFileName;

      Options := [ofHideReadOnly, ofExtensionDifferent, ofPathMustExist, ofFileMustExist, ofEnableSizing, ofDontAddToRecent];

      Result:=Execute;

      if Result then aFileName := FileName;
    finally
      Free;
    end;
end;

{ dialog otwierania pliku graficznego }
function GtOpenGfxFile(var aFileName: String; aDirectory: String=''): Boolean;
begin
  with TOpenPictureDialog.Create(Application) do
    try
      if aDirectory <> '' then InitialDir := aDirectory;

      FileName   :=  aFileName;
      DefaultExt := '*.jpg';
      Filter     := GtFileFilterGfx;

      Options := [ofHideReadOnly, ofExtensionDifferent, ofPathMustExist, ofFileMustExist, ofEnableSizing, ofDontAddToRecent];

      Result := Execute;

      if Result then aFileName := FileName;
    finally
      Free;
    end;
end;

{ dialog otwierania pliku .MDB (MS Access) }
function GtOpenMdbFile(var aFileName: String; aDirectory: String=''): Boolean;
begin
  Result := GtOpenFile(aFileName, aDirectory, '*.mdb', GtFileFilterMdb);
end;

{ dialog otwierania pliku .XML }
function GtOpenXmlFile(var aFileName: String; aDirectory: String=''): Boolean;
begin
  Result := GtOpenFile(aFileName, aDirectory, '*.xml', GtFileFilterXml);
end;

{ dialog otwierania pliku .PAS }
function GtOpenPasFile(var aFileName: String; aDirectory: String=''): Boolean;
begin
  Result := GtOpenFile(aFileName, aDirectory, '*.pas', GtFileFilterPas);
end;

{ dialog otwierania pliku .SQL }
function GtOpenSqlFile(var aFileName: String; aDirectory: String=''): Boolean;
begin
  Result := GtOpenFile(aFileName, aDirectory, '*.sql', GtFileFilterSql);
  // Options = [ofPathMustExist, ofFileMustExist, ofEnableSizing, ofDontAddToRecent]
end;

{ TCenterSaveDialog - pobrane z internetu http://stackoverflow.com/questions/657388/tsavedialog-position }
//type
//  TCenterSaveDialog = class(TSaveDialog)
//  private
//    FCenterForm: TCustomForm;
//  protected
//    procedure WndProc(var Message: TMessage); override;
//  public
//    // When this property is assigned, the dialog will center
//    // itself over the given form each time the dialog appears.
//    property CenterForm: TCustomForm read FCenterForm write FCenterForm;
//  end;

//procedure TCenterSaveDialog.WndProc(var Message: TMessage);
//var
//  lpOfNotify: POFNotify;
//  FormRect, DialogRect: TRect;
//  NewLeft, NewTop: Integer;
//begin
//  inherited;
//  if (Message.Msg = wm_Notify) and Assigned(CenterForm) then begin
//    lpOfNotify := POFNotify(Message.LParam);
//    if lpOfNotify.hdr.code = cdn_InitDone then begin
//      GetWindowRect(CenterForm.Handle, FormRect);
//      GetWindowRect(lpOfNotify.hdr.hwndFrom, DialogRect);
//      NewLeft := FormRect.Left
//        + (FormRect.Right - FormRect.Left) div 2
//        - (DialogRect.Right - DialogRect.Left) div 2;
//      NewTop := FormRect.Top
//        + (FormRect.Bottom - FormRect.Top) div 2
//        - (DialogRect.Bottom - DialogRect.Top) div 2;
//      SetWindowPos(lpOfNotify.hdr.hwndFrom, 0,
//        NewLeft, NewTop, 0, 0,
//        swp_NoActivate or swp_NoOwnerZOrder or swp_NoSize or swp_NoZOrder);
//    end;
//  end;
//end;

{ dialog zapisywania pliku }
function GtSaveFile(var aFileName: String; aDirectory: String=''; aDefExt: String=''; aFilter: String=''): Boolean;
begin
  // with TCenterSaveDialog.Create(Application) do
  with TSaveDialog.Create(Application) do
    try
      // if Assigned(Application.MainForm) then CenterForm := Application.MainForm;

      if aDirectory<>'' then InitialDir := aDirectory;
      if aDefExt<>''    then DefaultExt := aDefExt    else DefaultExt := '*.*';
      if aFilter<>''    then Filter     := aFilter    else Filter     := GtFileFilterAll;

      FileName:=  aFileName;

      Options := [ofHideReadOnly, ofExtensionDifferent, ofPathMustExist, ofFileMustExist, ofEnableSizing, ofDontAddToRecent];

      Result  := Execute;

      if Result then aFileName := FileName;
    finally
      Free;
    end;
end;

{ dialog zapisywania pliku graficznego }
function GtSaveGfxFile(var aFileName: String; aDirectory: String=''): Boolean;
begin
  with TSavePictureDialog.Create(Application) do
    try
      if aDirectory<>'' then InitialDir := aDirectory;

      FileName   :=  aFileName;
      DefaultExt := '*.jpg';
      Filter     := GtFileFilterGfx;

      Options := [ofHideReadOnly, ofExtensionDifferent, ofPathMustExist, ofEnableSizing, ofDontAddToRecent];

      Result:=Execute;

      if Result then aFileName := FileName;
    finally
      Free;
    end;
end;

{ dialog zapisywania pliku .MDB (MS Access) }
function GtSaveMdbFile(var aFileName: String; aDirectory: String=''): Boolean;
begin
  Result := GtSaveFile(aFileName, aDirectory, '*.mdb', GtFileFilterMdb);
end;

{ dialog zapisywania pliku .XML }
function GtSaveXmlFile(var aFileName: String; aDirectory: String=''): Boolean;
begin
  Result := GtSaveFile(aFileName, aDirectory, '*.xml', GtFileFilterXml);
end;

{ dialog zapisywania pliku .PAS (Delphi/Pascal) }
function GtSavePasFile(var aFileName: String; aDirectory: String=''): Boolean;
begin
  Result := GtSaveFile(aFileName, aDirectory, '*.pas', GtFileFilterPas);
end;

{ dialog zapisywania pliku .SQL }
function GtSaveSqlFile(var aFileName: String; aDirectory: String=''): Boolean;
begin
  Result := GtSaveFile(aFileName, aDirectory, '*.sql', GtFileFilterSql);
  // Options = [ofPathMustExist, ofEnableSizing, ofDontAddToRecent]
end;

{ zwraca rozmiar pliku }
function GtFileSize(aFileName: String): Integer;
var F: file of Byte;
begin
  AssignFile(F, aFileName);
  Reset(F);
  try
    Result := FileSize(F);
  finally
    CloseFile(F);
  end;
end;

{ zwraca date pliku }
function GtFileDate(aFileName: String): TDateTime;
var LH: THandle;
begin
  LH := FileOpen(aFileName, fmOpenRead);
  Result := FileDateToDateTime(FileGetDate(LH));
  FileClose(LH);
end;

{ zwraca iloœæ zajêtej pamiêci jako string, odpowiednio sformatowany jako kB, MB, GB itp }
function GtFileOrMemSizeToStr(aSize: Integer; aPrec: Integer=-1): String;
begin
  if (aSize > 1024*1024*1024) and (aPrec = -1) or (aPrec = 3) then Result := Format('%.1n GiB', [aSize/1024/1024/1024]) else
  if (aSize >      1024*1024) and (aPrec = -1) or (aPrec = 2) then Result := Format('%.1n MiB', [aSize/1024/1024]) else
  if (aSize >           1024) and (aPrec = -1) or (aPrec = 1) then Result := Format('%.1n kiB', [aSize/1024]) else
                                                                   Result := Format('%d B',     [aSize]);
end;

{--------------------------------------  --------------------------------------}
{---------------------------------- RichEdit ----------------------------------}

{ Sets Script Memo Position }
procedure RichEditSetPosition(aRichEdit: TRichEdit; aLine, aCol: Integer);
begin
  if not Assigned(aRichEdit) then Exit;

  aRichEdit.SelStart := aRichEdit.Perform(EM_LINEINDEX, aLine, 0);
  aRichEdit.SelStart := aRichEdit.Perform(EM_LINEINDEX, aLine, 0) + aCol ;
end;

{ Makes a selection }
{ PROBLEM: RichEdit allows only forward selection }
procedure RichEditSetSelection(aRichEdit: TRichEdit; aLine1, aCol1, aLine2, aCol2: Integer);
var lSelStop{, lSelStart}: Integer;
begin
  if not Assigned(aRichEdit) then Exit;

  { forward selection }
  RichEditSetPosition(aRichEdit, aLine2, aCol2);
  lSelStop := aRichEdit.SelStart;

  RichEditSetPosition(aRichEdit, aLine1, aCol1);

  aRichEdit.SelLength := lSelStop - aRichEdit.SelStart;

  { backward selection - still ugly selection on long signle line queries }
  { visible begin of selected query expected }
//  RichEditSetPosition(aRichEdit, aLine1, aCol1);
//  lSelStart := aRichEdit.SelStart;
//
//  RichEditSetPosition(aRichEdit, aLine2, aCol2);
//
//  aRichEdit.SelLength := lSelStart - aRichEdit.SelStart;
end;

{ Makes a selection }
procedure RichEditSetSelection(aRichEdit: TRichEdit; aLine, aCol, aLen: Integer);
begin
  if not Assigned(aRichEdit) then Exit;

  RichEditSetPosition(aRichEdit, aLine, aCol);

  aRichEdit.SelLength := aLen;
end;

{--------------------------------------  --------------------------------------}
{--------------------------------------  --------------------------------------}

{ zwraca wskazany bajt z liczby binarnej }
function binGetByte(aBinValue: Integer; aByteNo: Integer = 0): Integer;
begin
  Result := (aBinValue shr (8 * aByteNo)) and $ff;
end;

{ zwraca wskazany bajt z liczby binarnej }
function binGetByte(aBinValue: Cardinal; aByteNo: Integer = 0): Integer;
begin
  Result := (aBinValue shr (8 * aByteNo)) and $ff;
end;

{ zwiêksza rozmiar fonta }
function FontSizeUp(aFont: TFont; aMaxSize: Integer = 0): Boolean;
begin
  Result := False;
  if not Assigned(aFont) then Exit;
  if (aMaxSize > 0) and (aFont.Size +1 > aMaxSize) then Exit;

  aFont.Size := aFont.Size + 1;
  Result := True;
end;

{ zmniejsza rozmiar fonta }
function FontSizeDown(aFont: TFont; aMinSize: Integer = 0): Boolean;
begin
  Result := False;
  if not Assigned(aFont) then Exit;
  if (aMinSize > 0) and (aFont.Size -1 < aMinSize) then Exit;

  aFont.Size := aFont.Size - 1;
  Result := True;
end;

{ wylicza dlugosc pomiedzy dwoma pozycjami skryptu }
{ od pozycji pierwszej (wlacznie) do pozycji drugiej (rozlacznie) }
//function StringList_Distance(aSL: TStrings; aLine1, aPos1, aLine2, aPos2: Integer): Integer;
//var i: Integer;
//begin
//  Result := 0;
//
//  { warunki startowe }
//  if not Assigned(aSL) then Exit;
//  if aLine1 < 0 then aLine1 := 0;
//  if aLine2 < 0 then aLine2 := 0;
//  if aPos1  < 0 then aPos1  := 0;
//  if aPos2  < 0 then aPos2  := 0;
//  if aLine1 > aSL.Count - 1 then aLine1 := aSL.Count - 1;
//  if aLine2 > aSL.Count - 1 then aLine2 := aSL.Count - 1;
//
//  if aLine1 = aLine2 then begin
//    Result := aPos2 - aPos1;
//  end else begin
//    Result := Result + Length( aSL[aLine1] ) - aPos1 + 1;
//
//    for i := aLine1 + 1 to aLine2 - 1 do
//      Result := Result + Length( aSL[ i ] ) + 1;
//
//    Result := Result + aPos2 {- 1};
//  end;
//end;

{ przelicza pozycje absolutna bufora na wiersz i kolumne }
procedure StringList_Abs_to_Line_Pos(aSL: TStrings; aAbs: Integer; var aLine, aPos {, aRest} : Integer);
begin
  aLine := 0;
  aPos  := 0;

  { warunki startowe }
  if aAbs <= 0 then Exit;
  if not Assigned(aSL) then Exit;
  if aSL.Count = 0 then Exit;

  { wylicza numer wiersza }
  while (aAbs > 0) and (aLine < aSL.Count) and (aAbs > Length(aSL[aLine]) {+ 1} {CR-LF} ) do begin
    Dec(aAbs, Length(aSL[aLine]) + 1 {CR-LF});
    Inc(aLine);
  end;

  { wylicza numer kolumny }
  if aAbs > 0 then begin
    if aAbs < Length(aSL[aLine]) + 1 then aPos := aAbs else aPos := Length(aSL[aLine]) -1;
  end;

  // aRest := aAbs;
end;

{ wylicza dlugosc pomiedzy dwoma pozycjami skryptu }
function StringList_Distance(aSL: TStrings; aStart, aStop: Integer): Integer;
//var aLine1, aPos1, aLine2, aPos2: Integer;
begin
  // StringList_Abs_to_Line_Pos(aSL, aStart, aLine1, aPos1);
  // StringList_Abs_to_Line_Pos(aSL, aStop,  aLine2, aPos2);
  // Result := StringList_Distance(aSL, aLine1, aPos1, aLine2, aPos2);
  Result := aStop - aStart;
end;

{$IF CompilerVersion >= 24}
{$ELSE}
function CharInSet(ch: Char; chset: gtstdcharset): Boolean;
begin
  Result := ch in chset;
end;
{$IFEND}

end.

