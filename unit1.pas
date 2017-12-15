unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Unit2;

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
begin
     if radiogroup1.itemindex = 1 then
     begin
       form1.hide;
       Form2.show;
       DynamoCreate(Memo1.Lines.Count);
     end
     else
end;



end.

