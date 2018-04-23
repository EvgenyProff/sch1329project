unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, ExtCtrls,Unit3, unit1, unit4;

type

  { Tf2 }

  Tf2 = class(TForm)
    back: TBitBtn;
    ClFrm: TBitBtn;
    Gotomain: TBitBtn;
    fon1: TImage;
    fultime: TLabel;
    timeL: TLabel;
    TestAgain: TBitBtn;
    Clform: TBitBtn;
    showmistakes: TBitBtn;
    correct: TLabel;
    Label1: TLabel;
    percent: TLabel;
    incorrect: TLabel;
    total: TLabel;
    procedure backClick(Sender: TObject);
    procedure ClFrmClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure showmistakesClick(Sender: TObject);
    procedure TestAgainClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;


MassivStrok = array[0..10] of array[0..50] of string;
procedure peredacha(i:integer; str2:massivStrok; flag:integer);
var
  f2: Tf2;
 str:massivStrok;
 check:boolean = true;

implementation

{$R *.lfm}
Uses mainf;

{ Tf2 }

procedure peredacha(i: integer; Str2:MassivStrok; flag:integer);
var
  q,j:integer;
  resultFileName, str1, timeStart:string;
  ResulttxtFile:TextFile;
begin
  q:=0;
  for i:=0 to 50 do
   for j:=1 to 10 do
    begin
      str1:=str2[j,i];
      if str1<>'' then
      if (str1[1]='#') and (str1[2]='%') then
        q:=q+1;
    end;
 finish:=now;
 timestart:=formatdatetime('nn',start);
 f2.percent.caption:=inttostr(round(q/flag*100))+'% правльных ответов';
 f2.incorrect.caption:=inttostr(flag-q)+' ошибки(ок)';
 f2.total.caption:=inttostr(flag)+' вопроса(ов) пройдено';
 f2.correct.Caption:=inttostr(q)+' правильных ответа(ов)';
 f2.timeL.Caption:=FormatDateTime('nn:ss',finish-Start)+' время выполнения теста';
 resultfilename:=copy(fname,1,length(fname)-4)+'_р-т'+'_'+timestart+'.txt';
 assignfile(ResulttxtFile, resultfilename);
 rewrite(ResulttxtFile);
 writeln(ResulttxtFile, Shifrovka(formatdatetime('c',start)+' начало теста'));
 writeln(ResulttxtFile, Shifrovka(f2.percent.caption));
 writeln(ResulttxtFile, Shifrovka(f2.incorrect.caption));
 writeln(ResulttxtFile, Shifrovka(f2.total.caption));
 writeln(ResulttxtFile, Shifrovka(f2.correct.Caption));
 writeln(ResulttxtFile, Shifrovka(f2.timeL.Caption));
 closefile(ResulttxtFile);
  if q=flag then
    f2.showmistakes.enabled:=false
  else
    f2.showmistakes.enabled:=true;
  str:=str2;
end;

procedure Tf2.showmistakesClick(Sender: TObject);
begin
  mistakesinfo(str);
  if KolOsh <> step then
    f3.show;
end;

procedure Tf2.TestAgainClick(Sender: TObject);
begin
  check:=false;
  f2.close;
  f1.show;
end;

procedure Tf2.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  if check then
  begin
    if CloseProgram then
    begin
      CanClose:=true;
      Application.Terminate;
    end
    else
      CanClose:=false;
  end
  else
    CanClose:=true;
end;

procedure Tf2.ClFrmClick(Sender: TObject);
begin
  check:=true;
  close;
end;

procedure Tf2.backClick(Sender: TObject);
begin
  f2.back.Visible:=false;
  f2.showmistakes.Visible:=true;
  f2.ClFrm.visible:=true;
  f2.Gotomain.Visible:=true;
  f2.Height:=f2.height+90;
  f2.fultime.caption:='';
  f2.hide;
  teachers.show;

end;

end.

