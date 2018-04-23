unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, ExtCtrls,LConvEncoding, rules;

type

  { Tteachers }

  Tteachers = class(TForm)
    BitBtn1: TBitBtn;
    school2: TImage;
    zashifr: TBitBtn;
    prosmotr: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure prosmotrClick(Sender: TObject);
    procedure zashifrClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  teachers: Tteachers;

implementation

uses mainf, unit2, unit3, unit1;

{$R *.lfm}

{ Tteachers }

procedure Tteachers.zashifrClick(Sender: TObject);
var
  F, FNew:TextFile;
  FN, FNNew, str: String;
begin
  If f1.od1.Execute then
    begin
     FN:= f1.od1.FileName;
     FNNew:=copy(FN,1,length(FN)-4)+'_new.txt';
     // привязка имени фала к файловой переменной
     assignFile(F,FN);
     assignFile(FNew,FNNew);
     reset(F);
     rewrite(FNew);
     while not eof(F) do
     begin
       readln(F, str);
       writeln(Fnew, Shifrovka(str));
     end;
     CloseFile(f);
     CloseFile(FNew);
     showmessage('Шифрование завершено!');
    end
    else
      showmessage('Файл для шифровки не выбран!');
  end;

procedure Tteachers.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  teachers.hide;
  main.show;
  main.vybor.itemindex:=-1;
end;

procedure Tteachers.BitBtn1Click(Sender: TObject);
begin
  ruls.Show;
end;

procedure Tteachers.prosmotrClick(Sender: TObject);
var
  F:TextFile;
  FN, str: String;
  resmas:array[0..5]of string;
  poz:integer;
  notshifr:boolean;
begin
  teachers.hide;
  f2.showmistakes.Visible:=false;
  f2.ClFrm.Visible:=false;
  f2.Gotomain.visible:=false;
  f2.Height:=f2.height-90;
  If f1.od1.Execute then
   begin
     FN:= f1.od1.FileName;
     notshifr:=false;
     // привязка имени фала к файловой переменной
     assignFile(f,FN);
     reset(f);
     poz:=0;
     while not eof(f) do
       begin
       readln(f, str);
       str:=deshifrovka(str,notshifr);
       resmas[poz]:=str;
       poz:=poz+1;
       end;
    closefile(f);
    //разбор массива с результатами
    f2.fultime.caption:=resmas[0];
    f2.percent.caption:=resmas[1];
    f2.incorrect.caption:=resmas[2];
    f2.total.caption:= resmas[3];
    f2.correct.Caption:=resmas[4];
    f2.timeL.Caption:=resmas[5];
    f2.back.visible:=true;
    f2.Show;
   end
  else
    showmessage ('Файл теста не выбран!'+#13+'Без выбора файла работать невозможно!');
end;

end.

