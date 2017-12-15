unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus, unit3;

type

  { TForm2 }

  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
   procedure MenuItem5Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

  procedure DynamoCreate(CountLines : integer; fnames : array of string);

  //type lessons(string:name, string:task, string:theory, string:stat);

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.MenuItem1Click(Sender: TObject);
begin
     //ls(tmenuitem.IndexOf());
end;

procedure TForm2.MenuItem2Click(Sender: TObject);
begin

end;

procedure TForm2.MenuItem3Click(Sender: TObject);
begin

end;

procedure TForm2.MenuItem5Click(Sender: TObject);
begin
  //show from to check answers
end;

procedure DynamoCreate(CountLines : integer; fnames : array of string);
var
  items_count : integer;
  i1 : integer;
  sub1 : TMenuItem;
  sub2 : TmenuItem;
  sub3 : TMenuItem;
  lf : textfile;
  add : string;
begin
   i1 := -1;
   items_count := 0;
   if CountLines = 0 then showmessage('Нет ни одного урока для изучения.'+#13#10+'Обратитесь к учителю')
   else
   Form2.hide;

          for i1 := i1 + 1 to CountLines - 1 do
          begin
          assignfile(lf, GetCurrentDir() + '\Уроки\' + fnames[i1]);
          sub1 := TMenuItem.create(Form2.MainMenu1);
          sub2 := TMenuItem.create(Form2.MainMenu1);
          sub3 := TMenuItem.create(Form2.MainMenu1);
          read(lf, add);
          sub1.Caption := add;
          read(lf, add);
          sub2.caption :=     add;
          read(lf, add);
          sub3.caption :=add;


          Form2.Mainmenu1.Items[0].add(sub1);
          form2.mainmenu1.items[0].items[items_count].add(sub2);
          form2.mainmenu1.items[0].items[items_count].add(sub3);
          inc(items_count);
          end;
          Form2.show;
end;

end.

