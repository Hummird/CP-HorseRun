unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    PaintBox1: TPaintBox;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  MainCount:Integer;

implementation

uses
  Unit2, Unit3;

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);   //epileptic main menu animation
begin
  MainCount := (MainCount + 1) mod Height;
  with PaintBox1, Canvas do begin
    //fill with background color
        Brush.color:=rgb(240,240,240);
        Brush.Style := bsSolid;
        FillRect(ClientRect);
    if (MainCount mod 2 = 0) then begin
       Font.Height:=36;
       Font.Color:=clBlack;
       TextOut(0,30,'HORSE');
    end else begin
       Font.Height:=40;
       Font.Color:=clRed;
       TextOut(10,65,'RUN');
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  MainCount:=0;
end;


procedure TForm1.Button1Click(Sender: TObject); //Game start
begin
  //assigning default values
  Form2.Show;
  Form2.Bet:=10;
  Form2.HorseNum:=1;
  Form3.Updatelbls;
  Form3.Show;
  Form2.FormCreate(Sender);
  Form1.Visible:=false;
end;

procedure TForm1.Button3Click(Sender: TObject);  //quit
begin
 close;
end;

procedure TForm1.Button2Click(Sender: TObject);  //settings
begin
  Form3.Show;
end;

end.
