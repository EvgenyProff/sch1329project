unit Unit4;

{$mode objfpc}{$H+}

interface


   uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, ExtCtrls;
type

  { TForm4 }

  TForm4 = class(TForm)
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Image1: TImage;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    OpenDialog1: TOpenDialog;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure send(mode:integer);
  private

  public


  end;

var
  Form4: TForm4;
  mode_type:integer;
  answ : array[1..100] of string;
  mist : integer;
  all : integer;

implementation
                procedure send(mode:integer);      //аналогичная хрень, узнаю режим показа урока
begin
     mode_type:=mode;
end;
{$R *.lfm}

{ TForm4 }



procedure TForm4.BitBtn1Click(Sender: TObject);
var tf: textfile; i, perc, right: integer; path: string;
begin
     if mode_type <> 1 then                                         // если надо сохранить
     begin
     path:=edit1.text + '.rtf';
     assignfile(tf, path);
     rewrite(tf);
     writeln(tf, '!');
     writeln(tf, edit1.text);
     writeln(tf, '!');
     writeln(tf, '@');
     for i:=0 to memo1.Lines.Count - 1 do
     begin
     writeln(tf, memo1.Lines[i]);
     end;
     writeln(tf, '@');
     writeln(tf, '#');
     for i:=0 to memo2.Lines.Count - 1 do
     begin
     writeln(tf, memo2.Lines[i]);
     end;
     writeln(tf, '#');
     writeln(tf, '$');
     for i:=0 to memo3.Lines.Count - 1 do
     begin
     writeln(tf, memo3.Lines[i]);
     end;
     writeln(tf, '$');
     writeln(tf, '');
     closefile(tf);
     showmessage('Урок успешно сохранен!' + #13#10 + '(в текущей директории программы)');
     form4.close;
   end
     else                                                        //костыли для проверки: читаем массив, когда в тексте ответов перенос строки - переходим в след ячейку массива, а так - по 1 символу ((9(
     begin
     mist := 0;
     all := all;
     for i:= 0 to memo3.Lines.count do
     begin
     if memo3.Lines[i] <> answ[i] then mist := mist + 1;
     end;
     right := all - mist;
     perc:= (right * 100);
     perc:= perc div all;
     memo3.Clear;
     memo3.Text:='Здесь Ваши ответы.'+#13#10+'По 1 в каждой строке.'+#13#10+'1-ый ответ: 1-ая строка.'+#13#10+'2-ой ответ: 2-ая строка.'+#13#10+'После каждого ответа переходите на новую строку (enter) без пробелов.';
     form4.close;
     showmessage('Вы правильно ответили на ' + inttostr(right) + ' вопросов из ' + inttostr(all) + #13#10 + 'Правильных ответов: ' + inttostr(perc) + '%');
     end;
end;

procedure TForm4.FormShow(Sender: TObject);
var tf: textfile; pass, nam, theory, tasks, ans: string; i: integer;
begin
  if mode_type=1 then //просмотр
  begin
  edit1.ReadOnly:=true;
  memo1.ReadOnly:=true; //переведу все в режим чтения
  memo2.ReadOnly:=true;
  if opendialog1.Execute then
  begin
       pass:=opendialog1.FileName;
       assignfile(tf, pass);
       reset(tf);
       readln(tf, nam);      //начну просто считывать по 1 строке и добавлять на экран в ричмемо
       nam:='';
       edit1.Text:='';
       readln(tf, nam);
       edit1.text:=nam;
       readln(tf, nam);
       readln(tf, theory);
       theory:='';
       memo1.Clear;
       while theory <> '@' do
       begin
         memo1.Lines.Add(theory);
         readln(tf, theory);
       end;
       readln(tf, tasks);
       memo2.Clear;
       tasks:='';
       while tasks <> '#' do
       begin
         memo2.Lines.Add(tasks);
         readln(tf, tasks);
       end;
       readln(tf, ans);
       i:= 0;
       all := 0;
       readln(tf, ans);
       while ans <> '$' do     //ответы запомню в массив
       begin
         answ[i]:=ans;
         readln(tf, ans);
         i:=i + 1;
         all:= all + 1;
       end;
       closefile(tf);
       memo3.clear;
       bitbtn1.Caption:='Проверить ответы';
  end
  else
  begin
    showmessage('Урок не выбран!');
    form4.close;
  end;
  end;
  if mode_type=2 then          //создание
  begin
       bitbtn1.Caption:='Сохранить урок';
       memo3.Clear;
       memo3.Text:='Здесь Ваши ответы.'+#13#10+'По 1 в каждой строке.'+#13#10+'1-ый ответ: 1-ая строка.'+#13#10+'2-ой ответ: 2-ая строка.'+#13#10+'После каждого ответа переходите на новую строку (enter) без пробелов.';
       memo2.clear;
       memo2.text:='Здесь задачи урока';
       memo1.clear;
       memo1.Text:='Здесь теория урока';
       edit1.Clear;
       edit1.Text:='Здесь название урока';
  end;
  if mode_type=3 then                          //редактирование
  begin
       bitbtn1.Caption:='Сохранить урок';
       if opendialog1.Execute then
  begin
       pass:=opendialog1.FileName;   //баг именно с открытием файла для чтения, для сохранения то же самое
       assignfile(tf, pass);
       reset(tf);
       readln(tf, nam);      //начну просто считывать по 1 строке и добавлять на экран в ричмемо
       nam:='';
       edit1.Text:='';
       readln(tf, nam);
       edit1.text:=nam;
       readln(tf, nam);
       readln(tf, theory);
       theory:='';
       memo1.Clear;
       while theory <> '@' do
       begin
         memo1.Lines.Add(theory);
         readln(tf, theory);
       end;
       readln(tf, tasks);
       memo2.Clear;
       tasks:='';
       while tasks <> '#' do
       begin
         memo2.Lines.Add(tasks);
         readln(tf, tasks);
       end;
       memo3.Clear;
       readln(tf, ans);    //покажу ответиксы
       ans:='';
       while ans <> '$' do
       begin
         memo3.lines.add(ans);
         readln(tf, ans);
       end;
       closefile(tf);
  end
  else
  begin
    showmessage('Урок не выбран!');
    form4.close;
  end;
  end;
end;

procedure TForm4.Image1Click(Sender: TObject);
begin

end;

procedure TForm4.send(mode: integer);
begin
   mode_type:=mode;
end;

end.

