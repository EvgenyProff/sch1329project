unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus;

type

  { TForm2 }

  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem2: TMenuItem;
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

  procedure DynamoCreate(CountLines : integer);

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure DynamoCreate(CountLines : integer);
var
  i : integer;
  sub : TMenuItem;
begin
   i := 0;
   if CountLines = 0 then showmessage('Нет ни одного урока для изучения.'+#13#10+'Обратитесь к учителю')
   else
   Form2.hide;

          for i := i + 1 to CountLines-1 do
          begin
          sub := TMenuItem.create(Form2.MainMenu1);

          sub.Caption:='Lesson 1';

          Form2.Mainmenu1.Items.Insert(i, sub) ;
          end;
          Form2.show;
end;

end.

