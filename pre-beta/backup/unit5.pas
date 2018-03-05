unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm5 }

  TForm5 = class(TForm)
    Button1: TButton;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);

    procedure FormShow(Sender: TObject);
  private

  public

  end;
  procedure transfer(ans : array of string; pup : array of string);
var
  Form5: TForm5;
  ons: array[1..20] of string;
  pip: array[1..20] of string;

implementation

{$R *.lfm}

{ TForm5 }
procedure transfer(ans : array of string; pup : array of string);
var i : integer;
begin
     for i := 1 to 20 do
     begin
      pip[i] := pup[i];
      ons[i] := ans[i];
     end;
     form5.Show;
end;

procedure TForm5.FormShow(Sender: TObject);
var right, miss, total, kek, i : integer;
begin
    right := 0;
    miss := 0;
    i := 0;
    for i := i + 1 to 20 do
    begin
     if ons[i] <> pip[i] then
     begin
       statictext2.caption := statictext2.caption + '#13' + 'Задание ' + IntToStr(i) + ' правильный ответ: ' + ons[i] + '; Ваш ответ: ' + pip[i] + ';';
       miss := miss + 1;
     end
     else right := right + 1;
end;
    total := miss + right;
    kek := (right * 100) div total;
    statictext1.caption := statictext1.caption + IntToStr(right) + '/' + IntToStr(total) + ' : ' + IntToStr(kek) + '%';
    end;
procedure TForm5.FormHide(Sender: TObject);
begin

end;

procedure TForm5.Button1Click(Sender: TObject);
begin

end;

procedure TForm5.FormCreate(Sender: TObject);
begin

end;



end.

