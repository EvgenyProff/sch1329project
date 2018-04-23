unit mainf;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ComCtrls, ExtCtrls, Menus, Buttons,Unit2, LConvEncoding, Unit1, Unit5;

type

  { Tf1 }

  Tf1 = class(TForm)
    back: TBitBtn;
    showPic: TBitBtn;
    time: TLabel;
    Lprogress: TLabel;
    save: TBitBtn;
    forward: TBitBtn;
    od1: TOpenDialog;
    Progress: TProgressBar;
    questions: TRadioGroup;
    Timer1: TTimer;
    procedure backClick(Sender: TObject);
    procedure showPicClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure forwardClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure QuestionsClick(Sender: TObject);
    procedure saveClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

MassivStrok = array[0..10] of array[0..50] of string;
//процедура очистки radiobutton
procedure cleanRad;
//процедура выведения теста
procedure vopros(i: integer; Str2: MassivStrok);
//функция шифрования
function shifrovka (S : String): String;
//функция расшифровки теста
function deshifrovka(str3:string; shifr:boolean):string;

var
  f1: Tf1;
  Str2: MassivStrok;
  i,flag:integer;
  start, finish:Tdatetime;
  FName:string;
  pictures:array[0..50]of string;

implementation

{$R *.lfm}

{ Tf1 }
Function shifrovka(S : String): String;
Var i : Integer;
Begin
  For i := 1 to Length(S) do
    S[i] := Chr(Ord(S[i])+10);
  Result := S;
End;

function deshifrovka(str3:string; shifr:boolean):string;
var
  s:integer;
  t:string;
begin
if shifr <> true then
 begin
 for s:=1 to length(str3) do
  str3[s]:=chr(ord(str3[s])-10);
 end;
 result:=str3;
end;

procedure cleanRad;
begin
 f1.questions.ItemIndex:=-1;
 f1.questions.Items.Clear;
end;

procedure vopros(i: integer; Str2: MassivStrok);
var
  j, count:integer;
  str1:string;
begin
  f1.questions.caption:=str2[0,i];
  count:=-1;
  for j:=1 to 10 do
   begin
    if str2[j,i]<>'' then
    begin
      str1:=str2[j,i];
      if (str1[1]='%') then
      begin
        str1:= copy(str1,2,length(str1));
        f1.questions.Items.Add(str1);
      end
        else
        begin
          if str1[1]='#'  then
          begin
            count:=j-1;
            if str1[2]='%' then
              str1:= copy(str1,3,length(str1))
            else
              str1:= copy(str1,2,length(str1));
            f1.questions.Items.Add(str1);
          end
          else
           f1.questions.Items.Add(str2[j,i]);
        end;
    end;
   end;
  if count>=0 then
    f1.questions.ItemIndex:=count;
  f1.progress.Width:=f1.width;
  if pictures[i]<>'' then
  begin
    f1.showPic.Visible:=true;
    pic.Image1.Picture.LoadFromFile(pictures[i]);
  end
  else
    f1.showPic.Visible:=false;
end;


procedure Tf1.QuestionsClick(Sender: TObject);
  var
  j,otmetka:integer;
  str1:string;
begin
  if questions.ItemIndex>-1 then
  begin
    for j:=1 to 10 do
     begin
       str1:=str2[j,i];
       if (str1<>'') and (str1[1]='#') then
         str2[j,i]:=copy(str1,2,length(str1));
     end;
    otmetka:=questions.ItemIndex+1;
    str1:= str2[otmetka,i];
    str1:='#'+str1;
    str2[otmetka,i]:=str1;
  end;
end;


procedure Tf1.saveClick(Sender: TObject);
begin
  pic.close;
  if questions.ItemIndex=-1 then
    showmessage ('Введите ответ!')
  else
  begin
  If MessageDlg('Сохранение результатов','Вы уверены?',
    mtConfirmation,mbYesNo,1)=mryes then
  begin
    peredacha(i,str2, flag);
    f2.Show;
    f1.hide;
  end;
  end;
end;

procedure Tf1.Timer1Timer(Sender: TObject);
begin
  time.Caption:=FormatDateTime('nn:ss',Now-Start);
end;


procedure Tf1.forwardClick(Sender: TObject);
var
  proverka: integer;
begin
if questions.ItemIndex = -1 then
  Showmessage ('Выберите ответ!')
else
begin
  cleanrad;
  i:=i+1;
  proverka:=i+1;
  if i>0 then
    f1.back.enabled:=true
  else
    f1.Back.enabled:=false;
  if proverka<flag then
    f1.forward.Enabled:=true
  else
    begin
      f1.forward.Enabled:=false;
      f1.save.visible:=true;
    end;
   f1.Progress.Max:=flag-1;
   f1.Progress.Position:=i;
   f1.Lprogress.caption:='Выполнено:'+' '+inttostr(i)+'/'+inttostr(flag);
   pic.close;
  vopros(i,str2);
end;
end;

procedure Tf1.backClick(Sender: TObject);
begin
  pic.close;
  cleanrad;
  i:=i-1;
  if i>0  then
    begin
      f1.back.enabled:=true;
      f1.save.visible:=false;
    end
  else
    f1.Back.enabled:=false;
  f1.forward.Enabled:=true;
     f1.Progress.Max:=flag;
  f1.Progress.Position:=i;
  f1.Lprogress.caption:='Выполнено:'+' '+inttostr(i)+'/'+inttostr(flag);
  vopros(i,str2);
end;

procedure Tf1.showPicClick(Sender: TObject);
begin
  pic.Show;
  pic.Height:=pic.Image1.Height;
  pic.Width:=pic.Image1.Width;
end;

procedure Tf1.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  application.Terminate;
end;


procedure Tf1.FormShow(Sender: TObject);
var
  fil:textfile;//файловая переменная
  str, t:string;
  j, r, c:integer;
  notshifr:boolean;
begin
// очищение массива на случай, если будет повторное прохождение теста
  for c:=0 to 50  do
   begin
     for r:=1 to 10 do
       str2[r,c]:='';
     pictures[c]:='';
   end;
cleanRad;
flag:=0;
back.Enabled:=false;
forward.Enabled:=true;
save.Visible:=false;
f1.Progress.Max:=flag;
 If od1.Execute then
   begin
     FName:= od1.FileName;
     t:=copy(fname,length(fname)-6,length(fname));
     if t<>'new.txt'then
       notshifr:=true
     else
       notshifr:=false;
     // привязка имени фала к файловой переменной
     assignFile(fil,FName);
     reset(fil);
     i:=0;
     while not eof(fil) do
       begin
       j:=1;
       readln(fil, str);
       str:=deshifrovka(str,notshifr);
       str:= CP1251ToUTF8(str);
       while not (str[1]='$') do
       begin
         if (str[1]='?') then
           str2[0,i]:=copy(str,2,length(str))
         else
           if (str[1]='#') then
               pictures[i]:=copy(str,2,length(str))
           else
           begin
             str2[j,i]:=str;
             j:=j+1;
           end;
         if not eof(fil) then
         begin
           readln(fil, str);
           str:=deshifrovka(str,notshifr);
           str:= CP1251ToUTF8(str);
         end;
        end;
       i:=i+1;
       end;
    closefile(fil);
    flag:=i;
   end
else
 begin
  showmessage ('Файл теста не выбран!'+#13+'Без выбора файла работать невозможно!');
  main.show;
  f1.Hide;
 end;
 i:=0;
 vopros(i,str2);
 //запуск таймера выполнения теста
 start:=now;
end;


end.


