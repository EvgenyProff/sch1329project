unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  RichMemo, unit5;

type

  { TForm4 }

  TForm4 = class(TForm)
    Button1: TButton;
    RichMemo1: TRichMemo;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject; path : string);
    procedure StaticText2Click(Sender: TObject);
  private

  public

  end;
      sa = array[1..20] of string;
      procedure tl(p: string);
var
  Form4: TForm4;
  ans :sa;
  pup : sa;
  path : string;

implementation

{$R *.lfm}

{ TForm4 }

      procedure tl(p: string);
      begin
        path:= p;
        form4.show;
      end;

procedure TForm4.FormShow(Sender: TObject; path : string);
var rtf : textfile; nme, theory, practice, answers : string; i : integer;
begin
     path := getcurrentdir() + '/уроки' + path + '.rtf';
     assignfile(rtf, path);
     reset(rtf);
     readln(rtf, nme);
     nme := '';
     while nme<>'$' do
begin
statictext2.caption := statictext2.caption + nme;
readln(rtf, nme);
end;
readln(rtf, theory);
    theory := '';
     while theory<>'#' do
begin
statictext1.caption := statictext1.caption + theory;
readln(rtf, theory);
end;
readln(rtf, practice);
    practice := '';
     while practice<>'@' do
begin
statictext3.caption := statictext3.caption + practice;
readln(rtf, practice);
end;
practice := '#13 Вводите ответы по 1 на каждой строке, если вы не знаете правильного ответа - введите любой.';
  statictext3.caption := statictext3.caption + practice;
       readln(rtf, answers);
    answers := '';
i := 1;
     while answers<>'!'   do
begin
ans[i] := answers;
readln(rtf, answers);
end;
closefile(rtf);

end;

procedure TForm4.Button1Click(Sender: TObject);
var p : string; i, j : integer;
begin
  Button1.Visible := false;
   p := richmemo1.GetText(0, richmemo1.GetTextLen);
   i := 1;
   j := 1;
   while p[i] <> p[richmemo1.GetTextLen] do
begin
    if p[i] = '#13' then j := j + 1;
    pup[j] := pup[j] + p[i];
    end;
    transfer(ans, pup);
end;

procedure TForm4.StaticText2Click(Sender: TObject);
begin

end;

end.

