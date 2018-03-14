unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, Unit4;

type

  { TForm2 }

  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Image1: TImage;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure mode(teach: boolean);
  private

  public

  end;

var
  Form2: TForm2;
  acc: boolean;
  mode_type: integer;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.Image1Click(Sender: TObject);
begin

end;

procedure TForm2.mode(teach: boolean);   //из 1 формы узнаю тип аккаунта
begin
   acc:= teach;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  form4.send(2);
  form2.hide;
  form4.show;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
  form4.send(3);
  form2.hide;
  form4.show;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.FormShow(Sender: TObject);    //по типу аккаунта настрою функционал
begin
  if acc=true then
  begin
       bitbtn2.Visible:=true;
       bitbtn3.visible:=true;
  end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  form4.send(1);
  form2.hide;
  form4.show;
end;

procedure mode(teach: boolean);         //без этой хрени не рабило, локальные баги в компиляторе
begin
  acc:=teach;
end;

end.

