unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  Buttons, RichMemo;

type

  { TForm3 }

  TForm3 = class(TForm)
    BitBtn1: TBitBtn;
    RichMemo1: TRichMemo;
    RichMemo2: TRichMemo;
    TabControl1: TTabControl;
    procedure RichMemo1Change(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
  private

  public

  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.RichMemo1Change(Sender: TObject);
begin

end;

procedure TForm3.TabControl1Change(Sender: TObject);
begin

end;

end.

