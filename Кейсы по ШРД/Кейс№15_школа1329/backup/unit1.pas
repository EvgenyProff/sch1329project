unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, unit4;

type

  { Tmain }

  Tmain = class(TForm)
    Inside: TBitBtn;
    Vybor: TRadioGroup;
    Schoolpic: TImage;
    Timer1: TTimer;
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure InsideClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure VyborClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  main: Tmain;



implementation

uses unit3, mainf;

{$R *.lfm}

{ Tmain }


procedure Tmain.Timer1Timer(Sender: TObject);
begin
  // запускаем формочку раскрываться по таймеру, сделали простейшую анимацию
  if main.width < Schoolpic.Width+3 then
     begin
       main.Width:=main.Width+7;
       main.Height:=main.Height+6;
     end
  else
    timer1.Enabled:=false;
end;

procedure Tmain.VyborClick(Sender: TObject);
begin
  if vybor.ItemIndex = 0 then
  begin
    main.Hide;
    teachers.show;
  end
  else
  if vybor.ItemIndex = 1 then
  begin
    main.Hide;
    f1.Show;
  end;
end;

procedure Tmain.InsideClick(Sender: TObject);
begin
  Vybor.Visible:=true;
  inside.visible:=false;
end;

procedure Tmain.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  if CloseProgram then
  begin
     CanClose:=true;
     Application.Terminate;
  end
  else
    CanClose:=false;
end;

end.


