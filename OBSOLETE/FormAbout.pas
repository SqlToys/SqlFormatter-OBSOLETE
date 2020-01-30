(* $Header: /SQL Toys/SqlFormatter/FormAboutGitHub.pas 2     18-01-28 12:47 Tomek $
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

    procedure FormShow(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses SysUtils, GtExternals, SqlCommon, SqlVersion;

{$R *.dfm}

{ form show }
procedure TFormAboutYetAnother.FormShow(Sender: TObject);
begin
  LabelVersion.Caption := VER_VERSION;
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

end.

