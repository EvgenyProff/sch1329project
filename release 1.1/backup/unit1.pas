unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    RadioGroup1: TRadioGroup;
    Timer1: TTimer;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormHide(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  teach: boolean;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  if radiogroup1.ItemIndex=1 then
     begin
       teach := true;
     end
  else
      begin
        teach := false;
      end;
      form1.hide;
      form2.show;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  radiogroup1.Visible:=true;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  showmessage('Создано Бортниковым Е.А. и Беловой Н.С.' + #13#10 + 'Copyright© 2018');
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  application.terminate;
end;

procedure TForm1.FormHide(Sender: TObject);
begin
   form2.mode(teach);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
// запускаем формочку раскрываться по таймеру, сделали простейшую анимацию
  if form1.width < image1.Width then
     begin
       form1.Width:=form1.Width+5;
       form1.Height:=form1.Height+5;
     end
  else
    timer1.Enabled:=false;
end;

end.

