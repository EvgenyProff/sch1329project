unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Unit2, unit3;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
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


procedure TForm1.Button1Click(Sender: TObject);
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
  Attr := faAnyFile - faVolumeID - faDirectory;
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
begin
  c := memo1.lines.count;
  c := c - 1;
       i := 0;
  while i <= c do
     begin
     names[i] := memo1.lines[i];
     i := i + 1;
     end;
  form1.hide;
       Form2.show;
       DynamoCreate(Memo1.Lines.Count, names);
     if radiogroup1.itemindex = 2 then
     begin
     form3.Show;

     end;

end;



end.

