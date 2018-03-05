unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, IDEWindowIntf, Forms, Controls, Graphics,
  Dialogs, Menus, XMLPropStorage, StdCtrls, unit3, XMLConf, xmlresourcefile, Unit4;

type

  { TForm2 }

  TForm2 = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem2: TMenuItem;
    OpenDialog1: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure Mainmenu1Items1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
   procedure MenuItem5Click(Sender: TObject);
   procedure XMLPropStorage1RestoreProperties(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

//процедура, которая описывает поведение меню при нажатии
procedure DynamoCreate(CountLines : integer; fnames : array of string; TeachOrPupl:boolean);
  //дополнительный признак TeachOrPupl = True - УЧИТЕЛЬ, иначе - УЧЕНИК

  //type lessons(string:name, string:task, string:theory, string:stat);

var
  Form2: TForm2;
  IndexMenu: array[0..2] of Boolean;

implementation

{$R *.lfm}

{ TForm2 }

procedure MenuEvent(Self: TObject; Sender: TObject);
begin
   if indexMenu[1] = TRUE THEN
     begin
       form3.show;
       form2.hide;
     end;

end;

procedure main(p1: pointer; ind : integer);
begin
        tl(form2.MenuItem2.Items[0].Items[ind].caption);
end;

{procedure create_node(now: XMLDOMNode; type: integer);  //creates a new node in existing xml
var new : XMLDOMNode, txt : string, is_closed: boolean;
begin
    now.appendChild(new)
    if type = 1 then    //text
      begin
      Form2.TEdit1.Show();
       Form2.TEdit1.OnChange(txt);
       is_closed := false;
       while is_closed = false then begin end;
       new.nodeValue := txt;
        end;

    if type = 2 then        //movie
      begin
      new.nodeValue := TForm2.OpenDialog.OnSelectionChange();
        end;

      if type = 3 then      //picture
        begin
        new.nodeValue :=  TForm2.OpenDialog.OnSelectionChange();
          end;
end;

 procedure parsing(loc_url : string; vote1: boolean; vote2: boolean; vote3: boolean);  //starts the parcing of existing xml
 begin
XMLDocument1.LoadFromFile(loc_url);
XMLDocument1.Active := true;
//Edit1.Text := XMLDocument1.DocumentElement.ChildNodes['population'].Text;
//Edit2.Text := VarToStr(XMLDocument1.DocumentElement.ChildNodes['bases'].Attributes['ind']);
//Edit3.Text := VarToStr(XMLDocument1.DocumentElement.ChildNodes['bases'].Attributes['tra']);
//Edit4.Text := VarToStr(XMLDocument1.DocumentElement.ChildNodes['bases'].Attributes['sec']);
//Edit5.Text := VarToStr(XMLDocument1.DocumentElement.ChildNodes['bases'].Attributes['env']);
if vote1 = true then create_node(XMLDocument1.documentElement(); 1);
  if vote2 = true then create_node(XMLDocument1.documentElement(); 2);
  if vote3 = true then create_node(XMLDocument1.documentElement(); 3);
XMLDocument1.Active := false;
 end;



 procedure Form2.TEdit1.OnChange(txt : string);
 begin
     txt := Form2.TEdit1.Memo();
     end;

 procedure Form2.TEdit1.OnEnter(Sender: Tobject; is_closed: boolean);
 begin
     Form2.TEdit1.hide();
     is_closed := true;
     end;

 procedure TForm2.OpenDialog.OnSelectionChange(); }

procedure DynamoCreate(CountLines : integer; fnames : array of string; TeachOrPupl:boolean);
var
  items_count : integer;
  i1 : integer;
  sub1 : TMenuItem;
  //sub2 : TmenuItem;
  //sub3 : TMenuItem;
  lf : TextFile;
  add : string;
  method: TMethod;
  i : integer;
begin
   add:='';
   i1 := -1;
   items_count := 0;
   if CountLines = 0 then
     showmessage('Нет ни одного урока для изучения.'+#13#10+'Обратитесь к учителю')
   else
     Form2.hide;
   for i1 := i1 + 1 to CountLines - 1 do
   begin
     assignfile(lf, GetCurrentDir() + '\Уроки\' + fnames[i1]);
     reset(lf);
     // динамическое создание меню, в зависимости от того, под кем зашел человек под учеником или учителем
     sub1 := TMenuItem.create(Form2.MainMenu1);
     //sub2 := TMenuItem.create(Form2.MainMenu1);
     //sub3 := TMenuItem.create(Form2.MainMenu1);
   if not EOF (lf) then
   begin
     //readln(lf, add);
     sub1.Caption := fnames[i1];
     //readln(lf, add);
     //sub2.caption := add;
     //readln(lf, add);
     //sub3.caption :=add;
     Form2.Mainmenu1.Items[0].add(sub1);
     //form2.mainmenu1.items[0].items[items_count].add(sub2);
     //form2.mainmenu1.items[0].items[items_count].add(sub3);
     inc(items_count);
   end
   else
     showMessage('Файл '+ fnames[i1]+' ПУСТ'); //добавить сюда какую-то реакцию,
                                               //например удалить файл или отредактировать
   end;

     sub1:= TMenuItem.create(Form2.MainMenu1);
     sub1.Caption:='Создать урок';
     Form2.Mainmenu1.Items.Insert(1,sub1);
      if TeachOrPupl = false then
   begin
      form2.MainMenu1.Items[1].Visible := false;;
   end;
   Form2.show;
   //создание абстрактного метода, благодаря которому
   //можно делать клик по динамически создаваемомоу меню
   method.Code := @MenuEvent;
   method.Data := nil;
   IndexMenu[1]:=True;
   Form2.Mainmenu1.Items[1].OnClick:= TNotifyEvent(method);
   for i:=0 to form2.mainmenu1.items[0].count do
   begin
   @form2.mainmenu1.items[0].Items[i].OnClick:=@main(form2.mainmenu1.Items[0].items[0].ClassInfo, i);
   end;

end;

end.

