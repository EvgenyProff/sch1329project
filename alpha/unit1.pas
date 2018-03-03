unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons, Unit2, unit3;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button2: TButton;
    Image1: TImage;
    Label1: TLabel;
    Memo1: TMemo;
    RadioGroup1: TRadioGroup;
    Timer1: TTimer;
    procedure BitBtn2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }

  end;
procedure ScanDir(FilePath:String);

var
  Form1: TForm1;



implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
   showmessage('created by... Moscow 2017');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  RadioGroup1.Visible:= true;
end;

procedure ScanDir(FilePath : String);
     var
  Sr : TSearchRec;
  Attr : Integer;

begin
  FilePath := IncludeTrailingPathDelimiter(FilePath);
  Attr := faAnyFile - faDirectory;
  try
    if FindFirst(FilePath + '*', Attr, Sr) = 0 then
    repeat
      Form1.Memo1.Lines.Add(Sr.Name);
    until FindNext(Sr) <> 0;
  finally
    FindClose(Sr);
  end;
end;
procedure TForm1.FormShow(Sender: TObject);
begin
  ScanDir(GetCurrentDir() + '\Уроки');
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

procedure TForm1.RadioButton1Change(Sender: TObject);
begin

end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
var
   names : array[0..200] of string;
   i : integer;
   c : integer;
   teach: boolean;
begin
  c := memo1.lines.count;
  c := c - 1;
       i := 0;
  while i <= c do
     begin
     names[i] := memo1.lines[i];
     i := i + 1;
     end;
  if radiogroup1.itemindex = 0 then
    teach := True;
  form1.hide;
  Form2.show;
  DynamoCreate(Memo1.Lines.Count, names, Teach);
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

