(* $Header: /SQL Toys/SqlFormatter/FormAbout.pas 17    17-12-14 21:25 Tomek $
   (c) Tomasz Gierka, github.com/SqlToys, 2012.08.11                          *)
{--------------------------------------  --------------------------------------}
{$IFDEF RELEASE}
  {$DEBUGINFO OFF}
  {$LOCALSYMBOLS OFF}
{$ENDIF}
unit FormAbout;

interface

uses Forms, StdCtrls, Graphics, Classes, Controls, ExtCtrls, ShellAPI, Windows,
     Vcl.Imaging.pngimage;

type
  TFormAboutYetAnother = class(TForm)
    Image1: TImage;
    LabelVersion: TLabel;
    {GitHub: REMOVE >>>}
    LabelRegistered: TLabel;
    LabelCompany: TLabel;
    LabelName: TLabel;
    LabelCompany2: TLabel;
    LabelName2: TLabel;
    {GitHub: REMOVE <<<}

    procedure FormShow(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{GitHub: REMOVE >>>}
{--------------------------------------  --------------------------------------}
{------------------------------- dawne GtLicence ------------------------------}

function GtLicenceFileCheck(aFileName, aProduct{, aRelease}: String;
                        var aCompany, aName, aEmail, aPurchase, aUsersCount: String): Boolean;

//function GtLicenceFileScan(aFileNameMask, aProduct{, aRelease}: String;
//                        var aCompany, aName, aEmail, aPurchase, aUsersCount: String): Boolean;
{GitHub: REMOVE <<<}

implementation

uses SysUtils, GtExtUnit, SqlCommon, SqlVersion;

{$R *.dfm}

{GitHub: REMOVE >>>}
var
  LIC_Registered: Boolean = False;
  LIC_Company, LIC_Name, LIC_Email, LIC_Purchase, LIC_UsersCount: String;
{GitHub: REMOVE <<<}

{ form show }
procedure TFormAboutYetAnother.FormShow(Sender: TObject);
begin
  LabelVersion.Caption := VER_VERSION;

  {GitHub: REMOVE >>>}
  LabelRegistered.Visible:= LIC_Registered;
  LabelCompany.Visible   := LIC_Registered;
  LabelName.Visible      := LIC_Registered;

  LabelCompany2.Caption   := LIC_Company;
  LabelName2.Caption      := LIC_Name;

  LabelCompany2.Visible   := LIC_Registered;
  LabelName2.Visible      := LIC_Registered;

  {GitHub: should have loaded another image}
  if not LIC_Registered then begin
    AutoSize := False;
    Height := Height - 50;
  end;
  {GitHub: REMOVE <<<}
end;

{ form close }
procedure TFormAboutYetAnother.FormClick(Sender: TObject);
begin
//ShellExecute(Handle, 'open', 'http://sites.google.com/site/sqlformatter/', nil, nil, SW_SHOWNORMAL);
  ShellExecute(Handle, 'open', 'https://github.com/SqlToys/SqlFormatter/releases', nil, nil, SW_SHOWNORMAL);
  Close;
end;

{ form key down }
procedure TFormAboutYetAnother.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  Close;
end;

{GitHub: REMOVE >>>}
{--------------------------------------  --------------------------------------}
{------------------------------- dawne GtLicence ------------------------------}

{ Returns licence code for licence numbers, each param should be 25 bit long }
function GtLicenceCode(aCard0: Cardinal; aCard1: Cardinal = 0; aCard2: Cardinal = 0; aCard3: Cardinal = 0): String;

  function IntCardToCode(aCard: Cardinal): String;
  (* VALUES SHOULD BE MIXEDUP FOR EACH RELEASE *)
  const chars: array[0..31] of char = ('A','C','D','E','F','H','J','K','L','M','N','P','R','T','U','V','W','X','Y','0','1','2','3','4','5','6','7','8','9','#','$','%');
  begin
    Result := chars[ (aCard shr 20) and $1F ]
            + chars[ (aCard shr 15) and $1F ]
            + chars[ (aCard shr 10) and $1F ]
            + chars[ (aCard shr  5) and $1F ]
            + chars[  aCard         and $1F ];
  end;

begin
  Result := '';
  if (aCard3 <> 0)                   then Result := '-' + IntCardToCode(aCard3);
  if (aCard2 <> 0) or (Result <> '') then Result := '-' + IntCardToCode(aCard2) + Result;
  if (aCard1 <> 0) or (Result <> '') then Result := '-' + IntCardToCode(aCard1) + Result;
  if (aCard0 <> 0) or (Result <> '') then Result :=       IntCardToCode(aCard0) + Result;
end;

{ Checks licence file }
function GtLicenceFileCheck;
var lSL: TStringList;
begin
  Result := False;

  lSL := TStringList.Create;
  try
    try
      lSL.LoadFromFile(aFileName);
      if lSL.Count <> 7 then Exit;

      if Copy(lSL[0],1,14) <> 'Company:      ' then Exit;
      if Copy(lSL[1],1,14) <> 'Name:         ' then Exit;
      if Copy(lSL[2],1,14) <> 'Email:        ' then Exit;
      if Copy(lSL[3],1,14) <> 'Product:      ' then Exit;
      if Copy(lSL[4],1,14) <> 'Purchase:     ' then Exit;
      if Copy(lSL[5],1,14) <> 'Users Count:  ' then Exit;
      if Copy(lSL[6],1,14) <> 'Code:         ' then Exit;

      lSL[0] := Copy(lSL[0], 15, MaxInt);
      lSL[1] := Copy(lSL[1], 15, MaxInt);
      lSL[2] := Copy(lSL[2], 15, MaxInt);
      lSL[3] := Copy(lSL[3], 15, MaxInt);
      lSL[4] := Copy(lSL[4], 15, MaxInt);
      lSL[5] := Copy(lSL[5], 15, MaxInt);
      lSL[6] := Copy(lSL[6], 15, MaxInt);

      (* VALUES SHOULD BE MIXEDUP FOR EACH RELEASE *)
      if not(GtLicenceCode(  miscel_crc32(lSL[0])
                          ,  miscel_crc32(lSL[1])
                          , (miscel_crc16(lSL[2]) shl 8) or miscel_crc8(lSL[3])
                          , (miscel_crc16(lSL[4]) shl 8) or miscel_crc8(lSL[5])
                          ) = lSL[6]) then Exit;

      if lSL[3] <> aProduct then Exit;

      aCompany    := lSL[0];
      aName       := lSL[1];
      aEmail      := lSL[2];
      aPurchase   := lSL[4];
      aUsersCount := lSL[5];

      Result      := True;
    except
    end;
  finally
    lSL.Free;
  end;
end;

//function GtLicenceFileScan(aFileNameMask, aProduct{, aRelease}: String;
//                        var aCompany, aName, aEmail, aPurchase, aUsersCount: String): Boolean;
//var sr: TSearchRec;
//begin
//  Result := False;
//
//  if SysUtils.FindFirst(aFileNameMask, faAnyFile, sr) = 0 then
//  repeat
//    Result := GtLicenceFileCheck(sr.Name, aProduct, aCompany, aName, aEmail, aPurchase, aUsersCount);
//  until Result or (FindNext(sr) <> 0);
//  FindClose(sr);
//end;
{GitHun: REMOVE <<<}

{GitHub: REMOVE >>>}
initialization
  LIC_Registered := GtLicenceFileCheck(ChangeFileExt(ParamStr(0), '.lic' ), VER_NAME, LIC_Company, LIC_Name, LIC_Email, LIC_Purchase, LIC_UsersCount);
{GitHun: REMOVE <<<}

end.

