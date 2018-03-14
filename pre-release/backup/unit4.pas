unit Unit4;

{$mode objfpc}{$H+}

interface


   uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, ExtCtrls, RichMemo;
type

  { TForm4 }

  TForm4 = class(TForm)
    BitBtn1: TBitBtn;
    Image1: TImage;
    OpenDialog1: TOpenDialog;
    RichMemo1: TRichMemo;
    RichMemo2: TRichMemo;
    RichMemo3: TRichMemo;
    RichMemo4: TRichMemo;
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
var tf: textfile; i, j, ind : integer; flag : boolean;
begin
     if mode_type <> 1 then                                         // если надо сохранить
     begin
     assignfile(tf, getcurrentdir() + richmemo2.Text + '.rtf');
     rewrite(tf);
     writeln('!');
     writeln(richmemo2.gettext(0, richmemo2.GetTextLen));
     writeln('!');
     writeln('@');
     writeln(richmemo3.gettext(0, richmemo3.GetTextLen));
     writeln('@');
     writeln('#');
     writeln(richmemo4.gettext(0, richmemo4.GetTextLen));
     writeln('#');
     writeln('$');
     writeln(richmemo1.gettext(0, richmemo1.GetTextLen));
     writeln('$');
     writeln('');
     closefile(tf);
     showmessage('Урок успешно сохранен в текущей директории!');
   end
     else                                                        //костыли для проверки: читаем массив, когда в тексте ответов перенос строки - переходим в след ячейку массива, а так - по 1 символу ((9(
     begin
     ind := 0;
     j:= 0;
     mist := 0;
     flag:=false;
     for i:=0 to richmemo1.gettextlen do
     begin
     if richmemo1.text[i] = '#13#10' then
     begin
     j := 0;
     ind:= ind + 1;
     flag:= true;
     end;
     if (richmemo1.text[i] <> answ[j]) and flag then
     begin
     flag:= false;
     mist := mist + 1;                                   //если был флажок перехода на другую строку - значит ошибка уже в другом ответе и тогда увеличиваем
     end;
     end;
     showmessage('Вы правильно ответили на ' + inttostr(all - mist) + ' вопросов из ' + inttostr(all) + ', правильных ответов: ' + inttostr((all - mist) * 100 div all) + '%');
     end;
end;

procedure TForm4.FormShow(Sender: TObject);
var tf: textfile; pass, nam, theory, tasks, ans: string; i: integer;
begin
  if mode_type=1 then //просмотр
  begin
  richmemo2.ReadOnly:=true; //переведу все в режим чтения
  richmemo3.ReadOnly:=true;
  richmemo4.ReadOnly:=true;
  if opendialog1.Execute then
  begin
       pass:=opendialog1.FileName;   //баг именно с открытием файла для чтения, для сохранения то же самое
       assignfile(tf, pass);
       reset(tf);
       readln(tf, nam);      //начну просто считывать по 1 строке и добавлять на экран в ричмемо
       nam:='';
       richmemo2.Text:='';
       while name <> '!' do
       begin
         richmemo2.text := richmemo2.text + nam;
         readln(tf, nam);
       end;
       readln(tf, theory);
       theory:='';
       richmemo3.Text:='';
       while theory <> '@' do
       begin
         richmemo3.text:=richmemo3.text + theory;
         readln(tf, theory);
       end;
       readln(tf, tasks);
       richmemo4.text:='';
       tasks:='';
       while tasks <> '#' do
       begin
         richmemo4.text:= richmemo4.text + tasks;
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
  end
  else
  begin
    showmessage('Fatal error with opening file!');
    application.Terminate;
  end;
  end;
  if mode_type=2 then          //создание
  begin
       bitbtn1.Caption:='Сохранить урок';
  end;
  if mode_type=3 then                          //редактирование
  begin
       bitbtn1.Caption:='Сохранить урок';
       if opendialog1.Execute then
  begin
       pass:=opendialog1.FileName;
       assignfile(tf, pass);
       reset(tf);
       readln(tf, nam);                        //то же самое у просмотра
       nam:='';
       richmemo2.Text:='';
       while name <> '!' do
       begin
         richmemo2.text := richmemo2.text + nam;
         readln(tf, nam);
       end;
       readln(tf, theory);
       theory:='';
       richmemo3.Text:='';
       while theory <> '@' do
       begin
         richmemo3.text:=richmemo3.text + theory;
         readln(tf, theory);
       end;
       readln(tf, tasks);
       richmemo4.text:='';
       tasks:='';
       while tasks <> '#' do
       begin
         richmemo4.text:= richmemo4.text + tasks;
         readln(tf, tasks);
       end;
       readln(tf, ans);                        //ответиксы покажу на экране
       richmemo1.text:='';
       ans:='';
       while ans <> '$' do
       begin
         richmemo1.text:= richmemo1.text + ans;
         readln(tf, ans);
       end;
       closefile(tf);
  end
  else
  begin
    showmessage('Fatal error with opening file!');
    application.Terminate;
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

