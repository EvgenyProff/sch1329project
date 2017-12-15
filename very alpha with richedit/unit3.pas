unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ActnList,
  StdCtrls, ComCtrls, ExtCtrls, Buttons, RichMemo, Spin, Types;

type

  { TForm3 }

  TForm3 = class(TForm)
    ActionList1: TActionList;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    PageControl1: TPageControl;
    Panel1: TPanel;
    RichMemo1: TRichMemo;
    SpinEdit1: TSpinEdit;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);

    procedure PageControl1Change(Sender: TObject);
    procedure RichMemo1Change(Sender: TObject);
    procedure RichMemo2Change(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form3: TForm3;
  tf : textfile;

implementation

{$R *.lfm}

{ TForm3 }





procedure TForm3.BitBtn1Click(Sender: TObject);
begin
  form3.hide;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
var
  sf : tfont;
begin
          sf := richmemo1.font;
          if sf.Bold = true then sf.Bold := false
          else sf.Bold := true;
  richmemo1.SetTextAttributes(richmemo1.SelStart, richmemo1.SelLength, sf);

end;

procedure TForm3.BitBtn3Click(Sender: TObject);
var
  sf : tfont;
begin
          sf := richmemo1.font;
          if sf.Italic = true then sf.Bold := false
          else sf.Italic := true;
  richmemo1.SetTextAttributes(richmemo1.SelStart, richmemo1.SelLength, sf);

end;

procedure TForm3.BitBtn4Click(Sender: TObject);
var
  sf : tfont;
begin
          sf := richmemo1.font;
          if sf.Underline = true then sf.underline := false
          else sf.underline := true;
  richmemo1.SetTextAttributes(richmemo1.SelStart, richmemo1.SelLength, sf);

end;

procedure TForm3.ComboBox1Change(Sender: TObject);
var
  sf : tfont;
begin
          sf := richmemo1.font;
          sf.Name:=combobox1.Text;
  richmemo1.SetTextAttributes(richmemo1.SelStart, richmemo1.SelLength, sf);

end;

procedure TForm3.Edit1Change(Sender: TObject);
begin

end;

procedure TForm3.Edit1Enter(Sender: TObject);
var
  FileName: string;
begin
  {assignfile(tf, GetCurrentDir() + '\Уроки\1.txt');
  fileName:=ExtractFileName(tf);
  if fileExists(filename) then
    append(tf)
  else
    rewrite(tf); //Append не подходит, т.к. работает  только с существующим файлом
  writeln(tf, edit1.caption);
  closefile(tf); }
end;






procedure TForm3.FormCreate(Sender: TObject);
begin
  Combobox1.Items:=Screen.Fonts;
end;

procedure TForm3.GroupBox1Click(Sender: TObject);
begin

end;







procedure TForm3.PageControl1Change(Sender: TObject);
begin

end;

procedure TForm3.RichMemo1Change(Sender: TObject);
begin

end;

procedure TForm3.RichMemo2Change(Sender: TObject);
begin

end;

procedure TForm3.SpinEdit1Change(Sender: TObject);
var
  sf : tfont;
begin
          sf := richmemo1.font;
          sf.size := spinedit1.Value;
  richmemo1.SetTextAttributes(richmemo1.SelStart, richmemo1.SelLength, sf);

end;

procedure TForm3.TabSheet1ContextPopup(Sender: TObject; MousePos: TPoint);
  var Handled: Boolean;
begin

end;

end.

