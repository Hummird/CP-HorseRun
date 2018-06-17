unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
  TForm4 = class(TForm)
    Timer1: TTimer;
    PanelMenu: TPanel;
    Button1: TButton;
    Button2: TButton;
    PaintBoxMenu: TPaintBox;
    Panel2: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    RadioGroup1: TRadioGroup;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    PaintBox5: TPaintBox;
    PaintBox1: TPaintBox;
    PaintBox2: TPaintBox;
    PaintBox3: TPaintBox;
    PaintBox4: TPaintBox;
    Button6: TButton;
    PaintBox6: TPaintBox;
    PaintBox7: TPaintBox;
    PaintBox8: TPaintBox;
    Timer2: TTimer;
    PaintBox10: TPaintBox;
    PaintBox11: TPaintBox;
    PaintBox12: TPaintBox;
    PaintBox13: TPaintBox;
    PaintBox14: TPaintBox;
    PaintBox15: TPaintBox;
    PaintBox16: TPaintBox;
    PaintBox17: TPaintBox;
    PaintBox18: TPaintBox;
    PaintBox19: TPaintBox;
    PaintBox9: TPaintBox;
    PaintBox20: TPaintBox;
    PanelGame: TPanel;
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Updatelbls();
    procedure Race();
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Win();
    procedure Lose();
    procedure betanim();
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    Bet:Integer;
    Money:Integer;
    Wins:Integer;
    Loses:Integer;
    HorseNum:Integer;  // betting on this number
    basepoint:Integer; // horse position in race
    a:array[1..4] of Real; // horse speeds
    br:Boolean;  // race stop handler
    pause:Integer;  // pause handler
    worl:Boolean;  // win or lose
    horseanim:integer; // anomation images switcher
    n:byte; // victorious horse
    stand:Boolean; // are the horses standing or not
    bm1,bm2,bm3,bm4:TBitmap; // horse animation images
    flee:Boolean; // flee trigger
    betani:Boolean; // money decreasing animation
    uppoint,upanim:Integer; // moving the numbers of money,wining and losing
    b1,b2,b3,b4,b5:TBitmap; // balloon/sad faces animation images
  end;

var
  Form4: TForm4;
  MainCount:Integer;

implementation

{$R *.dfm}





procedure TForm4.Button2Click(Sender: TObject);
begin
  Form4.Close;
end;

procedure Tform4.betanim();  // animation of money decreasing
var
  betm:Tbitmap;
begin
  betm:=TBitmap.Create;
  betm.Width:=105;
  betm.Height:=23;

  with betm, Canvas do begin
    Brush.Style:=bsSolid;
    Brush.Color:=RGB(240,240,240);
    FillRect(ClientRect);
    Font.Size:=14;
    TextOut(0,0,'-'+inttostr(bet));
  end;
  with PaintBox6, Canvas do begin
    Brush.Style:=bsSolid;
    Brush.Color:=RGB(240,240,240);
    FillRect(Rect(0,0,uppoint,Height));
    Draw(0,8-uppoint,betm);
  end;

  if uppoint=30 then begin
    Timer2.Enabled:=False;
    uppoint:=0;
  end;
end;

procedure TForm4.Win();
var
  UpMoney,UpWins:TBitmap;
begin

  Button5.Enabled:=false;   //disabling the start button

  // creating bitmaps and assigning sizes
  b1:=TBitmap.Create;
  b1.Width:=49;
  b1.Height:=126;

  b2:=TBitmap.Create;
  b2.Width:=49;
  b2.Height:=126;

  b3:=TBitmap.Create;
  b3.Width:=49;
  b3.Height:=126;

  b4:=TBitmap.Create;
  b4.Width:=49;
  b4.Height:=126;

  b5:=TBitmap.Create;
  b5.Width:=49;
  b5.Height:=126;

  UpWins:=TBitmap.Create;
  UpWins.Width:=105;
  UpWins.Height:=23;

  UpMoney:=TBitmap.Create;
  UpMoney.Width:=105;
  UpMoney.Height:=23;

  with UpMoney, Canvas do begin        // money increasing
    Brush.Style:=bsSolid;
    Brush.Color:=RGB(240,240,240);
    FillRect(ClientRect);
    Font.Size:=14;
    TextOut(0,0,'+'+inttostr(bet*2));
  end;
  with PaintBox6, Canvas do begin
    Brush.Style:=bsSolid;
    Brush.Color:=RGB(240,240,240);
    FillRect(Rect(0,0,uppoint,Height));
    Draw(0,8-uppoint,UpMoney);
  end;

  with UpWins, Canvas do begin  // wins increasing
    Brush.Style:=bsSolid;
    Brush.Color:=RGB(240,240,240);
    FillRect(ClientRect);
    Font.Size:=14;
    TextOut(0,0,'+1');
  end;
  with PaintBox7, Canvas do begin
    Brush.Style:=bsSolid;
    Brush.Color:=RGB(240,240,240);
    FillRect(Rect(0,0,uppoint,Height));
    Draw(0,8-uppoint,UpWins);
  end;

  //drawing balloon animations in table 7х18 with 7РХх7РХ cells
  //Rectangle(({Column}-1)*7,({Row}-1)*7,{Column}*7,{Row}*7);
  with b1, Canvas do begin
    Brush.Style:=bsSolid;
    Brush.Color:=RGB(240,240,240);
    FillRect(ClientRect);
      Brush.Color:=clYellow;   //balloon
      //Column 1
      Rectangle(({Column}1-1)*7,({Row}3-1)*7,{Column}1*7,{Row}3*7);
      Rectangle(({Column}1-1)*7,({Row}4-1)*7,{Column}1*7,{Row}4*7);
      Rectangle(({Column}1-1)*7,({Row}5-1)*7,{Column}1*7,{Row}5*7);
      Rectangle(({Column}1-1)*7,({Row}6-1)*7,{Column}1*7,{Row}6*7);
      Rectangle(({Column}1-1)*7,({Row}7-1)*7,{Column}1*7,{Row}7*7);
      Rectangle(({Column}1-1)*7,({Row}8-1)*7,{Column}1*7,{Row}8*7);
      //Column 2
      Rectangle(({Column}2-1)*7,({Row}2-1)*7,{Column}2*7,{Row}2*7);
      Rectangle(({Column}2-1)*7,({Row}3-1)*7,{Column}2*7,{Row}3*7);
      Rectangle(({Column}2-1)*7,({Row}4-1)*7,{Column}2*7,{Row}4*7);
      Rectangle(({Column}2-1)*7,({Row}5-1)*7,{Column}2*7,{Row}5*7);
      Rectangle(({Column}2-1)*7,({Row}6-1)*7,{Column}2*7,{Row}6*7);
      Rectangle(({Column}2-1)*7,({Row}7-1)*7,{Column}2*7,{Row}7*7);
      Rectangle(({Column}2-1)*7,({Row}8-1)*7,{Column}2*7,{Row}8*7);
      Rectangle(({Column}2-1)*7,({Row}9-1)*7,{Column}2*7,{Row}9*7);
      //Column 3
      Rectangle(({Column}3-1)*7,({Row}2-1)*7,{Column}3*7,{Row}2*7);
      Rectangle(({Column}3-1)*7,({Row}3-1)*7,{Column}3*7,{Row}3*7);
      Rectangle(({Column}3-1)*7,({Row}4-1)*7,{Column}3*7,{Row}4*7);
      Rectangle(({Column}3-1)*7,({Row}5-1)*7,{Column}3*7,{Row}5*7);
      Rectangle(({Column}3-1)*7,({Row}6-1)*7,{Column}3*7,{Row}6*7);
      Rectangle(({Column}3-1)*7,({Row}7-1)*7,{Column}3*7,{Row}7*7);
      Rectangle(({Column}3-1)*7,({Row}8-1)*7,{Column}3*7,{Row}8*7);
      Rectangle(({Column}3-1)*7,({Row}9-1)*7,{Column}3*7,{Row}9*7);
      //Column 4
      Rectangle(({Column}4-1)*7,({Row}1-1)*7,{Column}4*7,{Row}1*7);
      Rectangle(({Column}4-1)*7,({Row}2-1)*7,{Column}4*7,{Row}2*7);
      Rectangle(({Column}4-1)*7,({Row}3-1)*7,{Column}4*7,{Row}3*7);
      Rectangle(({Column}4-1)*7,({Row}4-1)*7,{Column}4*7,{Row}4*7);
      Rectangle(({Column}4-1)*7,({Row}5-1)*7,{Column}4*7,{Row}5*7);
      Rectangle(({Column}4-1)*7,({Row}6-1)*7,{Column}4*7,{Row}6*7);
      Rectangle(({Column}4-1)*7,({Row}7-1)*7,{Column}4*7,{Row}7*7);
      Rectangle(({Column}4-1)*7,({Row}8-1)*7,{Column}4*7,{Row}8*7);
      Rectangle(({Column}4-1)*7,({Row}9-1)*7,{Column}4*7,{Row}9*7);
      Rectangle(({Column}4-1)*7,({Row}10-1)*7,{Column}4*7,{Row}10*7);
      //Column 5
      Rectangle(({Column}5-1)*7,({Row}2-1)*7,{Column}5*7,{Row}2*7);
      Rectangle(({Column}5-1)*7,({Row}4-1)*7,{Column}5*7,{Row}4*7);
      Rectangle(({Column}5-1)*7,({Row}5-1)*7,{Column}5*7,{Row}5*7);
      Rectangle(({Column}5-1)*7,({Row}6-1)*7,{Column}5*7,{Row}6*7);
      Rectangle(({Column}5-1)*7,({Row}7-1)*7,{Column}5*7,{Row}7*7);
      Rectangle(({Column}5-1)*7,({Row}8-1)*7,{Column}5*7,{Row}8*7);
      Rectangle(({Column}5-1)*7,({Row}9-1)*7,{Column}5*7,{Row}9*7);
      //Column 6
      Rectangle(({Column}6-1)*7,({Row}2-1)*7,{Column}6*7,{Row}2*7);
      Rectangle(({Column}6-1)*7,({Row}3-1)*7,{Column}6*7,{Row}3*7);
      Rectangle(({Column}6-1)*7,({Row}5-1)*7,{Column}6*7,{Row}5*7);
      Rectangle(({Column}6-1)*7,({Row}6-1)*7,{Column}6*7,{Row}6*7);
      Rectangle(({Column}6-1)*7,({Row}7-1)*7,{Column}6*7,{Row}7*7);
      Rectangle(({Column}6-1)*7,({Row}8-1)*7,{Column}6*7,{Row}8*7);
      Rectangle(({Column}6-1)*7,({Row}9-1)*7,{Column}6*7,{Row}9*7);
      //Column 7
      Rectangle(({Column}7-1)*7,({Row}3-1)*7,{Column}7*7,{Row}3*7);
      Rectangle(({Column}7-1)*7,({Row}4-1)*7,{Column}7*7,{Row}4*7);
      Rectangle(({Column}7-1)*7,({Row}5-1)*7,{Column}7*7,{Row}5*7);
      Rectangle(({Column}7-1)*7,({Row}6-1)*7,{Column}7*7,{Row}6*7);
      Rectangle(({Column}7-1)*7,({Row}7-1)*7,{Column}7*7,{Row}7*7);
      Rectangle(({Column}7-1)*7,({Row}8-1)*7,{Column}7*7,{Row}8*7);

      //glare
      Brush.Color:=clWhite;
      Rectangle(({Column}5-1)*7,({Row}3-1)*7,{Column}5*7,{Row}3*7);
      Rectangle(({Column}6-1)*7,({Row}4-1)*7,{Column}6*7,{Row}4*7);

      //string
      Brush.Color:=clGray;
    if upanim<10 then begin
      Rectangle(({Column}3-1)*7,({Row}14-1)*7,{Column}3*7,{Row}14*7);
      Rectangle(({Column}3-1)*7,({Row}14-1)*7,{Column}3*7,{Row}14*7);
      Rectangle(({Column}4-1)*7,({Row}11-1)*7,{Column}4*7,{Row}11*7);
      Rectangle(({Column}4-1)*7,({Row}13-1)*7,{Column}4*7,{Row}13*7);
      Rectangle(({Column}4-1)*7,({Row}16-1)*7,{Column}4*7,{Row}16*7);
      Rectangle(({Column}4-1)*7,({Row}18-1)*7,{Column}4*7,{Row}18*7);
      Rectangle(({Column}5-1)*7,({Row}12-1)*7,{Column}5*7,{Row}12*7);
      Rectangle(({Column}5-1)*7,({Row}17-1)*7,{Column}5*7,{Row}17*7);
    end
    else if (upanim>10) and (upanim<20) then begin
      Rectangle(({Column}3-1)*7,({Row}12-1)*7,{Column}3*7,{Row}12*7);
      Rectangle(({Column}3-1)*7,({Row}17-1)*7,{Column}3*7,{Row}17*7);
      Rectangle(({Column}4-1)*7,({Row}11-1)*7,{Column}4*7,{Row}11*7);
      Rectangle(({Column}4-1)*7,({Row}13-1)*7,{Column}4*7,{Row}13*7);
      Rectangle(({Column}4-1)*7,({Row}14-1)*7,{Column}4*7,{Row}14*7);
      Rectangle(({Column}4-1)*7,({Row}18-1)*7,{Column}4*7,{Row}18*7);
      Rectangle(({Column}4-1)*7,({Row}16-1)*7,{Column}4*7,{Row}16*7);
      Rectangle(({Column}5-1)*7,({Row}15-1)*7,{Column}5*7,{Row}15*7);
    end
    else if upanim>20 then begin
      Rectangle(({Column}3-1)*7,({Row}13-1)*7,{Column}3*7,{Row}13*7);
      Rectangle(({Column}4-1)*7,({Row}11-1)*7,{Column}4*7,{Row}11*7);
      Rectangle(({Column}4-1)*7,({Row}12-1)*7,{Column}4*7,{Row}12*7);
      Rectangle(({Column}4-1)*7,({Row}14-1)*7,{Column}4*7,{Row}14*7);
      Rectangle(({Column}4-1)*7,({Row}18-1)*7,{Column}4*7,{Row}18*7);
      Rectangle(({Column}5-1)*7,({Row}15-1)*7,{Column}5*7,{Row}15*7);
      Rectangle(({Column}5-1)*7,({Row}17-1)*7,{Column}5*7,{Row}17*7);
      Rectangle(({Column}6-1)*7,({Row}16-1)*7,{Column}6*7,{Row}16*7);
    end;
  end;

  with PaintBox13, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(Rect(0,0,uppoint,Height));
      Draw(0,Height-round(uppoint*1.4),b1);
  end;

  with PaintBox16, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(Rect(0,0,uppoint,Height));
      Draw(0,Height-round(uppoint*1.7),b1);
  end;

  with b2, Canvas do begin
    Brush.Style:=bsSolid;
    Brush.Color:=RGB(240,240,240);
    FillRect(ClientRect);
      Brush.Color:=clBlue;   //balloon
      //Column 1
      Rectangle(({Column}1-1)*7,({Row}3-1)*7,{Column}1*7,{Row}3*7);
      Rectangle(({Column}1-1)*7,({Row}4-1)*7,{Column}1*7,{Row}4*7);
      Rectangle(({Column}1-1)*7,({Row}5-1)*7,{Column}1*7,{Row}5*7);
      Rectangle(({Column}1-1)*7,({Row}6-1)*7,{Column}1*7,{Row}6*7);
      Rectangle(({Column}1-1)*7,({Row}7-1)*7,{Column}1*7,{Row}7*7);
      Rectangle(({Column}1-1)*7,({Row}8-1)*7,{Column}1*7,{Row}8*7);
      //Column 2
      Rectangle(({Column}2-1)*7,({Row}2-1)*7,{Column}2*7,{Row}2*7);
      Rectangle(({Column}2-1)*7,({Row}3-1)*7,{Column}2*7,{Row}3*7);
      Rectangle(({Column}2-1)*7,({Row}4-1)*7,{Column}2*7,{Row}4*7);
      Rectangle(({Column}2-1)*7,({Row}5-1)*7,{Column}2*7,{Row}5*7);
      Rectangle(({Column}2-1)*7,({Row}6-1)*7,{Column}2*7,{Row}6*7);
      Rectangle(({Column}2-1)*7,({Row}7-1)*7,{Column}2*7,{Row}7*7);
      Rectangle(({Column}2-1)*7,({Row}8-1)*7,{Column}2*7,{Row}8*7);
      Rectangle(({Column}2-1)*7,({Row}9-1)*7,{Column}2*7,{Row}9*7);
      //Column 3
      Rectangle(({Column}3-1)*7,({Row}2-1)*7,{Column}3*7,{Row}2*7);
      Rectangle(({Column}3-1)*7,({Row}3-1)*7,{Column}3*7,{Row}3*7);
      Rectangle(({Column}3-1)*7,({Row}4-1)*7,{Column}3*7,{Row}4*7);
      Rectangle(({Column}3-1)*7,({Row}5-1)*7,{Column}3*7,{Row}5*7);
      Rectangle(({Column}3-1)*7,({Row}6-1)*7,{Column}3*7,{Row}6*7);
      Rectangle(({Column}3-1)*7,({Row}7-1)*7,{Column}3*7,{Row}7*7);
      Rectangle(({Column}3-1)*7,({Row}8-1)*7,{Column}3*7,{Row}8*7);
      Rectangle(({Column}3-1)*7,({Row}9-1)*7,{Column}3*7,{Row}9*7);
      //Column 4
      Rectangle(({Column}4-1)*7,({Row}1-1)*7,{Column}4*7,{Row}1*7);
      Rectangle(({Column}4-1)*7,({Row}2-1)*7,{Column}4*7,{Row}2*7);
      Rectangle(({Column}4-1)*7,({Row}3-1)*7,{Column}4*7,{Row}3*7);
      Rectangle(({Column}4-1)*7,({Row}4-1)*7,{Column}4*7,{Row}4*7);
      Rectangle(({Column}4-1)*7,({Row}5-1)*7,{Column}4*7,{Row}5*7);
      Rectangle(({Column}4-1)*7,({Row}6-1)*7,{Column}4*7,{Row}6*7);
      Rectangle(({Column}4-1)*7,({Row}7-1)*7,{Column}4*7,{Row}7*7);
      Rectangle(({Column}4-1)*7,({Row}8-1)*7,{Column}4*7,{Row}8*7);
      Rectangle(({Column}4-1)*7,({Row}9-1)*7,{Column}4*7,{Row}9*7);
      Rectangle(({Column}4-1)*7,({Row}10-1)*7,{Column}4*7,{Row}10*7);
      //Column 5
      Rectangle(({Column}5-1)*7,({Row}2-1)*7,{Column}5*7,{Row}2*7);
      Rectangle(({Column}5-1)*7,({Row}4-1)*7,{Column}5*7,{Row}4*7);
      Rectangle(({Column}5-1)*7,({Row}5-1)*7,{Column}5*7,{Row}5*7);
      Rectangle(({Column}5-1)*7,({Row}6-1)*7,{Column}5*7,{Row}6*7);
      Rectangle(({Column}5-1)*7,({Row}7-1)*7,{Column}5*7,{Row}7*7);
      Rectangle(({Column}5-1)*7,({Row}8-1)*7,{Column}5*7,{Row}8*7);
      Rectangle(({Column}5-1)*7,({Row}9-1)*7,{Column}5*7,{Row}9*7);
      //Column 6
      Rectangle(({Column}6-1)*7,({Row}2-1)*7,{Column}6*7,{Row}2*7);
      Rectangle(({Column}6-1)*7,({Row}3-1)*7,{Column}6*7,{Row}3*7);
      Rectangle(({Column}6-1)*7,({Row}5-1)*7,{Column}6*7,{Row}5*7);
      Rectangle(({Column}6-1)*7,({Row}6-1)*7,{Column}6*7,{Row}6*7);
      Rectangle(({Column}6-1)*7,({Row}7-1)*7,{Column}6*7,{Row}7*7);
      Rectangle(({Column}6-1)*7,({Row}8-1)*7,{Column}6*7,{Row}8*7);
      Rectangle(({Column}6-1)*7,({Row}9-1)*7,{Column}6*7,{Row}9*7);
      //Column 7
      Rectangle(({Column}7-1)*7,({Row}3-1)*7,{Column}7*7,{Row}3*7);
      Rectangle(({Column}7-1)*7,({Row}4-1)*7,{Column}7*7,{Row}4*7);
      Rectangle(({Column}7-1)*7,({Row}5-1)*7,{Column}7*7,{Row}5*7);
      Rectangle(({Column}7-1)*7,({Row}6-1)*7,{Column}7*7,{Row}6*7);
      Rectangle(({Column}7-1)*7,({Row}7-1)*7,{Column}7*7,{Row}7*7);
      Rectangle(({Column}7-1)*7,({Row}8-1)*7,{Column}7*7,{Row}8*7);

      //glare
      Brush.Color:=clWhite;
      Rectangle(({Column}5-1)*7,({Row}3-1)*7,{Column}5*7,{Row}3*7);
      Rectangle(({Column}6-1)*7,({Row}4-1)*7,{Column}6*7,{Row}4*7);

      //string
      Brush.Color:=clGray;
    if upanim<10 then begin
      Rectangle(({Column}3-1)*7,({Row}12-1)*7,{Column}3*7,{Row}12*7);
      Rectangle(({Column}3-1)*7,({Row}17-1)*7,{Column}3*7,{Row}17*7);
      Rectangle(({Column}4-1)*7,({Row}11-1)*7,{Column}4*7,{Row}11*7);
      Rectangle(({Column}4-1)*7,({Row}13-1)*7,{Column}4*7,{Row}13*7);
      Rectangle(({Column}4-1)*7,({Row}14-1)*7,{Column}4*7,{Row}14*7);
      Rectangle(({Column}4-1)*7,({Row}18-1)*7,{Column}4*7,{Row}18*7);
      Rectangle(({Column}4-1)*7,({Row}16-1)*7,{Column}4*7,{Row}16*7);
      Rectangle(({Column}5-1)*7,({Row}15-1)*7,{Column}5*7,{Row}15*7);
    end
    else if (upanim>10) and (upanim<20) then begin
      Rectangle(({Column}3-1)*7,({Row}14-1)*7,{Column}3*7,{Row}14*7);
      Rectangle(({Column}3-1)*7,({Row}14-1)*7,{Column}3*7,{Row}14*7);
      Rectangle(({Column}4-1)*7,({Row}11-1)*7,{Column}4*7,{Row}11*7);
      Rectangle(({Column}4-1)*7,({Row}13-1)*7,{Column}4*7,{Row}13*7);
      Rectangle(({Column}4-1)*7,({Row}16-1)*7,{Column}4*7,{Row}16*7);
      Rectangle(({Column}4-1)*7,({Row}18-1)*7,{Column}4*7,{Row}18*7);
      Rectangle(({Column}5-1)*7,({Row}12-1)*7,{Column}5*7,{Row}12*7);
      Rectangle(({Column}5-1)*7,({Row}17-1)*7,{Column}5*7,{Row}17*7);
    end
    else if upanim>20 then begin
      Rectangle(({Column}3-1)*7,({Row}13-1)*7,{Column}3*7,{Row}13*7);
      Rectangle(({Column}4-1)*7,({Row}11-1)*7,{Column}4*7,{Row}11*7);
      Rectangle(({Column}4-1)*7,({Row}12-1)*7,{Column}4*7,{Row}12*7);
      Rectangle(({Column}4-1)*7,({Row}14-1)*7,{Column}4*7,{Row}14*7);
      Rectangle(({Column}4-1)*7,({Row}18-1)*7,{Column}4*7,{Row}18*7);
      Rectangle(({Column}5-1)*7,({Row}15-1)*7,{Column}5*7,{Row}15*7);
      Rectangle(({Column}5-1)*7,({Row}17-1)*7,{Column}5*7,{Row}17*7);
      Rectangle(({Column}6-1)*7,({Row}16-1)*7,{Column}6*7,{Row}16*7);
    end;
  end;

  with PaintBox11, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(Rect(0,0,uppoint,Height));
      Draw(0,Height-round(uppoint*2.0),b2);
  end;

  with PaintBox15, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(Rect(0,0,uppoint,Height));
      Draw(0,Height-round(uppoint*1.0),b2);
  end;

  with b3, Canvas do begin
    Brush.Style:=bsSolid;
    Brush.Color:=RGB(240,240,240);
    FillRect(ClientRect);
      Brush.Color:=clGreen;   //balloon
      //Column 1
      Rectangle(({Column}1-1)*7,({Row}3-1)*7,{Column}1*7,{Row}3*7);
      Rectangle(({Column}1-1)*7,({Row}4-1)*7,{Column}1*7,{Row}4*7);
      Rectangle(({Column}1-1)*7,({Row}5-1)*7,{Column}1*7,{Row}5*7);
      Rectangle(({Column}1-1)*7,({Row}6-1)*7,{Column}1*7,{Row}6*7);
      Rectangle(({Column}1-1)*7,({Row}7-1)*7,{Column}1*7,{Row}7*7);
      Rectangle(({Column}1-1)*7,({Row}8-1)*7,{Column}1*7,{Row}8*7);
      //Column 2
      Rectangle(({Column}2-1)*7,({Row}2-1)*7,{Column}2*7,{Row}2*7);
      Rectangle(({Column}2-1)*7,({Row}3-1)*7,{Column}2*7,{Row}3*7);
      Rectangle(({Column}2-1)*7,({Row}4-1)*7,{Column}2*7,{Row}4*7);
      Rectangle(({Column}2-1)*7,({Row}5-1)*7,{Column}2*7,{Row}5*7);
      Rectangle(({Column}2-1)*7,({Row}6-1)*7,{Column}2*7,{Row}6*7);
      Rectangle(({Column}2-1)*7,({Row}7-1)*7,{Column}2*7,{Row}7*7);
      Rectangle(({Column}2-1)*7,({Row}8-1)*7,{Column}2*7,{Row}8*7);
      Rectangle(({Column}2-1)*7,({Row}9-1)*7,{Column}2*7,{Row}9*7);
      //Column 3
      Rectangle(({Column}3-1)*7,({Row}2-1)*7,{Column}3*7,{Row}2*7);
      Rectangle(({Column}3-1)*7,({Row}3-1)*7,{Column}3*7,{Row}3*7);
      Rectangle(({Column}3-1)*7,({Row}4-1)*7,{Column}3*7,{Row}4*7);
      Rectangle(({Column}3-1)*7,({Row}5-1)*7,{Column}3*7,{Row}5*7);
      Rectangle(({Column}3-1)*7,({Row}6-1)*7,{Column}3*7,{Row}6*7);
      Rectangle(({Column}3-1)*7,({Row}7-1)*7,{Column}3*7,{Row}7*7);
      Rectangle(({Column}3-1)*7,({Row}8-1)*7,{Column}3*7,{Row}8*7);
      Rectangle(({Column}3-1)*7,({Row}9-1)*7,{Column}3*7,{Row}9*7);
      //Column 4
      Rectangle(({Column}4-1)*7,({Row}1-1)*7,{Column}4*7,{Row}1*7);
      Rectangle(({Column}4-1)*7,({Row}2-1)*7,{Column}4*7,{Row}2*7);
      Rectangle(({Column}4-1)*7,({Row}3-1)*7,{Column}4*7,{Row}3*7);
      Rectangle(({Column}4-1)*7,({Row}4-1)*7,{Column}4*7,{Row}4*7);
      Rectangle(({Column}4-1)*7,({Row}5-1)*7,{Column}4*7,{Row}5*7);
      Rectangle(({Column}4-1)*7,({Row}6-1)*7,{Column}4*7,{Row}6*7);
      Rectangle(({Column}4-1)*7,({Row}7-1)*7,{Column}4*7,{Row}7*7);
      Rectangle(({Column}4-1)*7,({Row}8-1)*7,{Column}4*7,{Row}8*7);
      Rectangle(({Column}4-1)*7,({Row}9-1)*7,{Column}4*7,{Row}9*7);
      Rectangle(({Column}4-1)*7,({Row}10-1)*7,{Column}4*7,{Row}10*7);
      //Column 5
      Rectangle(({Column}5-1)*7,({Row}2-1)*7,{Column}5*7,{Row}2*7);
      Rectangle(({Column}5-1)*7,({Row}4-1)*7,{Column}5*7,{Row}4*7);
      Rectangle(({Column}5-1)*7,({Row}5-1)*7,{Column}5*7,{Row}5*7);
      Rectangle(({Column}5-1)*7,({Row}6-1)*7,{Column}5*7,{Row}6*7);
      Rectangle(({Column}5-1)*7,({Row}7-1)*7,{Column}5*7,{Row}7*7);
      Rectangle(({Column}5-1)*7,({Row}8-1)*7,{Column}5*7,{Row}8*7);
      Rectangle(({Column}5-1)*7,({Row}9-1)*7,{Column}5*7,{Row}9*7);
      //Column 6
      Rectangle(({Column}6-1)*7,({Row}2-1)*7,{Column}6*7,{Row}2*7);
      Rectangle(({Column}6-1)*7,({Row}3-1)*7,{Column}6*7,{Row}3*7);
      Rectangle(({Column}6-1)*7,({Row}5-1)*7,{Column}6*7,{Row}5*7);
      Rectangle(({Column}6-1)*7,({Row}6-1)*7,{Column}6*7,{Row}6*7);
      Rectangle(({Column}6-1)*7,({Row}7-1)*7,{Column}6*7,{Row}7*7);
      Rectangle(({Column}6-1)*7,({Row}8-1)*7,{Column}6*7,{Row}8*7);
      Rectangle(({Column}6-1)*7,({Row}9-1)*7,{Column}6*7,{Row}9*7);
      //Column 7
      Rectangle(({Column}7-1)*7,({Row}3-1)*7,{Column}7*7,{Row}3*7);
      Rectangle(({Column}7-1)*7,({Row}4-1)*7,{Column}7*7,{Row}4*7);
      Rectangle(({Column}7-1)*7,({Row}5-1)*7,{Column}7*7,{Row}5*7);
      Rectangle(({Column}7-1)*7,({Row}6-1)*7,{Column}7*7,{Row}6*7);
      Rectangle(({Column}7-1)*7,({Row}7-1)*7,{Column}7*7,{Row}7*7);
      Rectangle(({Column}7-1)*7,({Row}8-1)*7,{Column}7*7,{Row}8*7);

      //glare
      Brush.Color:=clWhite;
      Rectangle(({Column}5-1)*7,({Row}3-1)*7,{Column}5*7,{Row}3*7);
      Rectangle(({Column}6-1)*7,({Row}4-1)*7,{Column}6*7,{Row}4*7);

      //string
      Brush.Color:=clGray;
    if upanim<10 then begin
      Rectangle(({Column}3-1)*7,({Row}14-1)*7,{Column}3*7,{Row}14*7);
      Rectangle(({Column}3-1)*7,({Row}14-1)*7,{Column}3*7,{Row}14*7);
      Rectangle(({Column}4-1)*7,({Row}11-1)*7,{Column}4*7,{Row}11*7);
      Rectangle(({Column}4-1)*7,({Row}13-1)*7,{Column}4*7,{Row}13*7);
      Rectangle(({Column}4-1)*7,({Row}16-1)*7,{Column}4*7,{Row}16*7);
      Rectangle(({Column}4-1)*7,({Row}18-1)*7,{Column}4*7,{Row}18*7);
      Rectangle(({Column}5-1)*7,({Row}12-1)*7,{Column}5*7,{Row}12*7);
      Rectangle(({Column}5-1)*7,({Row}17-1)*7,{Column}5*7,{Row}17*7);
    end
    else if (upanim>10) and (upanim<20) then begin
      Rectangle(({Column}3-1)*7,({Row}13-1)*7,{Column}3*7,{Row}13*7);
      Rectangle(({Column}4-1)*7,({Row}11-1)*7,{Column}4*7,{Row}11*7);
      Rectangle(({Column}4-1)*7,({Row}12-1)*7,{Column}4*7,{Row}12*7);
      Rectangle(({Column}4-1)*7,({Row}14-1)*7,{Column}4*7,{Row}14*7);
      Rectangle(({Column}4-1)*7,({Row}18-1)*7,{Column}4*7,{Row}18*7);
      Rectangle(({Column}5-1)*7,({Row}15-1)*7,{Column}5*7,{Row}15*7);
      Rectangle(({Column}5-1)*7,({Row}17-1)*7,{Column}5*7,{Row}17*7);
      Rectangle(({Column}6-1)*7,({Row}16-1)*7,{Column}6*7,{Row}16*7);
    end
    else if upanim>20 then begin
      Rectangle(({Column}3-1)*7,({Row}12-1)*7,{Column}3*7,{Row}12*7);
      Rectangle(({Column}3-1)*7,({Row}17-1)*7,{Column}3*7,{Row}17*7);
      Rectangle(({Column}4-1)*7,({Row}11-1)*7,{Column}4*7,{Row}11*7);
      Rectangle(({Column}4-1)*7,({Row}13-1)*7,{Column}4*7,{Row}13*7);
      Rectangle(({Column}4-1)*7,({Row}14-1)*7,{Column}4*7,{Row}14*7);
      Rectangle(({Column}4-1)*7,({Row}18-1)*7,{Column}4*7,{Row}18*7);
      Rectangle(({Column}4-1)*7,({Row}16-1)*7,{Column}4*7,{Row}16*7);
      Rectangle(({Column}5-1)*7,({Row}15-1)*7,{Column}5*7,{Row}15*7);
    end;
  end;

  with PaintBox10, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(Rect(0,0,uppoint,Height));
      Draw(0,Height-round(uppoint*1.9),b3);
  end;

  with PaintBox17, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(Rect(0,0,uppoint,Height));
      Draw(0,Height-round(uppoint*1.1),b3);
  end;

  with b4, Canvas do begin
    Brush.Style:=bsSolid;
    Brush.Color:=RGB(240,240,240);
    FillRect(ClientRect);
      Brush.Color:=clFuchsia;   //balloon
      //Column 1
      Rectangle(({Column}1-1)*7,({Row}3-1)*7,{Column}1*7,{Row}3*7);
      Rectangle(({Column}1-1)*7,({Row}4-1)*7,{Column}1*7,{Row}4*7);
      Rectangle(({Column}1-1)*7,({Row}5-1)*7,{Column}1*7,{Row}5*7);
      Rectangle(({Column}1-1)*7,({Row}6-1)*7,{Column}1*7,{Row}6*7);
      Rectangle(({Column}1-1)*7,({Row}7-1)*7,{Column}1*7,{Row}7*7);
      Rectangle(({Column}1-1)*7,({Row}8-1)*7,{Column}1*7,{Row}8*7);
      //Column 2
      Rectangle(({Column}2-1)*7,({Row}2-1)*7,{Column}2*7,{Row}2*7);
      Rectangle(({Column}2-1)*7,({Row}3-1)*7,{Column}2*7,{Row}3*7);
      Rectangle(({Column}2-1)*7,({Row}4-1)*7,{Column}2*7,{Row}4*7);
      Rectangle(({Column}2-1)*7,({Row}5-1)*7,{Column}2*7,{Row}5*7);
      Rectangle(({Column}2-1)*7,({Row}6-1)*7,{Column}2*7,{Row}6*7);
      Rectangle(({Column}2-1)*7,({Row}7-1)*7,{Column}2*7,{Row}7*7);
      Rectangle(({Column}2-1)*7,({Row}8-1)*7,{Column}2*7,{Row}8*7);
      Rectangle(({Column}2-1)*7,({Row}9-1)*7,{Column}2*7,{Row}9*7);
      //Column 3
      Rectangle(({Column}3-1)*7,({Row}2-1)*7,{Column}3*7,{Row}2*7);
      Rectangle(({Column}3-1)*7,({Row}3-1)*7,{Column}3*7,{Row}3*7);
      Rectangle(({Column}3-1)*7,({Row}4-1)*7,{Column}3*7,{Row}4*7);
      Rectangle(({Column}3-1)*7,({Row}5-1)*7,{Column}3*7,{Row}5*7);
      Rectangle(({Column}3-1)*7,({Row}6-1)*7,{Column}3*7,{Row}6*7);
      Rectangle(({Column}3-1)*7,({Row}7-1)*7,{Column}3*7,{Row}7*7);
      Rectangle(({Column}3-1)*7,({Row}8-1)*7,{Column}3*7,{Row}8*7);
      Rectangle(({Column}3-1)*7,({Row}9-1)*7,{Column}3*7,{Row}9*7);
      //Column 4
      Rectangle(({Column}4-1)*7,({Row}1-1)*7,{Column}4*7,{Row}1*7);
      Rectangle(({Column}4-1)*7,({Row}2-1)*7,{Column}4*7,{Row}2*7);
      Rectangle(({Column}4-1)*7,({Row}3-1)*7,{Column}4*7,{Row}3*7);
      Rectangle(({Column}4-1)*7,({Row}4-1)*7,{Column}4*7,{Row}4*7);
      Rectangle(({Column}4-1)*7,({Row}5-1)*7,{Column}4*7,{Row}5*7);
      Rectangle(({Column}4-1)*7,({Row}6-1)*7,{Column}4*7,{Row}6*7);
      Rectangle(({Column}4-1)*7,({Row}7-1)*7,{Column}4*7,{Row}7*7);
      Rectangle(({Column}4-1)*7,({Row}8-1)*7,{Column}4*7,{Row}8*7);
      Rectangle(({Column}4-1)*7,({Row}9-1)*7,{Column}4*7,{Row}9*7);
      Rectangle(({Column}4-1)*7,({Row}10-1)*7,{Column}4*7,{Row}10*7);
      //Column 5
      Rectangle(({Column}5-1)*7,({Row}2-1)*7,{Column}5*7,{Row}2*7);
      Rectangle(({Column}5-1)*7,({Row}4-1)*7,{Column}5*7,{Row}4*7);
      Rectangle(({Column}5-1)*7,({Row}5-1)*7,{Column}5*7,{Row}5*7);
      Rectangle(({Column}5-1)*7,({Row}6-1)*7,{Column}5*7,{Row}6*7);
      Rectangle(({Column}5-1)*7,({Row}7-1)*7,{Column}5*7,{Row}7*7);
      Rectangle(({Column}5-1)*7,({Row}8-1)*7,{Column}5*7,{Row}8*7);
      Rectangle(({Column}5-1)*7,({Row}9-1)*7,{Column}5*7,{Row}9*7);
      //Column 6
      Rectangle(({Column}6-1)*7,({Row}2-1)*7,{Column}6*7,{Row}2*7);
      Rectangle(({Column}6-1)*7,({Row}3-1)*7,{Column}6*7,{Row}3*7);
      Rectangle(({Column}6-1)*7,({Row}5-1)*7,{Column}6*7,{Row}5*7);
      Rectangle(({Column}6-1)*7,({Row}6-1)*7,{Column}6*7,{Row}6*7);
      Rectangle(({Column}6-1)*7,({Row}7-1)*7,{Column}6*7,{Row}7*7);
      Rectangle(({Column}6-1)*7,({Row}8-1)*7,{Column}6*7,{Row}8*7);
      Rectangle(({Column}6-1)*7,({Row}9-1)*7,{Column}6*7,{Row}9*7);
      //Column 7
      Rectangle(({Column}7-1)*7,({Row}3-1)*7,{Column}7*7,{Row}3*7);
      Rectangle(({Column}7-1)*7,({Row}4-1)*7,{Column}7*7,{Row}4*7);
      Rectangle(({Column}7-1)*7,({Row}5-1)*7,{Column}7*7,{Row}5*7);
      Rectangle(({Column}7-1)*7,({Row}6-1)*7,{Column}7*7,{Row}6*7);
      Rectangle(({Column}7-1)*7,({Row}7-1)*7,{Column}7*7,{Row}7*7);
      Rectangle(({Column}7-1)*7,({Row}8-1)*7,{Column}7*7,{Row}8*7);

      //glare
      Brush.Color:=clWhite;
      Rectangle(({Column}5-1)*7,({Row}3-1)*7,{Column}5*7,{Row}3*7);
      Rectangle(({Column}6-1)*7,({Row}4-1)*7,{Column}6*7,{Row}4*7);

      //string
      Brush.Color:=clGray;
    if upanim<10 then begin
      Rectangle(({Column}3-1)*7,({Row}13-1)*7,{Column}3*7,{Row}13*7);
      Rectangle(({Column}4-1)*7,({Row}11-1)*7,{Column}4*7,{Row}11*7);
      Rectangle(({Column}4-1)*7,({Row}12-1)*7,{Column}4*7,{Row}12*7);
      Rectangle(({Column}4-1)*7,({Row}14-1)*7,{Column}4*7,{Row}14*7);
      Rectangle(({Column}4-1)*7,({Row}18-1)*7,{Column}4*7,{Row}18*7);
      Rectangle(({Column}5-1)*7,({Row}15-1)*7,{Column}5*7,{Row}15*7);
      Rectangle(({Column}5-1)*7,({Row}17-1)*7,{Column}5*7,{Row}17*7);
      Rectangle(({Column}6-1)*7,({Row}16-1)*7,{Column}6*7,{Row}16*7);
    end
    else if (upanim>10) and (upanim<20) then begin
      Rectangle(({Column}3-1)*7,({Row}12-1)*7,{Column}3*7,{Row}12*7);
      Rectangle(({Column}3-1)*7,({Row}17-1)*7,{Column}3*7,{Row}17*7);
      Rectangle(({Column}4-1)*7,({Row}11-1)*7,{Column}4*7,{Row}11*7);
      Rectangle(({Column}4-1)*7,({Row}13-1)*7,{Column}4*7,{Row}13*7);
      Rectangle(({Column}4-1)*7,({Row}14-1)*7,{Column}4*7,{Row}14*7);
      Rectangle(({Column}4-1)*7,({Row}18-1)*7,{Column}4*7,{Row}18*7);
      Rectangle(({Column}4-1)*7,({Row}16-1)*7,{Column}4*7,{Row}16*7);
      Rectangle(({Column}5-1)*7,({Row}15-1)*7,{Column}5*7,{Row}15*7);
    end
    else if upanim>20 then begin
      Rectangle(({Column}3-1)*7,({Row}14-1)*7,{Column}3*7,{Row}14*7);
      Rectangle(({Column}3-1)*7,({Row}14-1)*7,{Column}3*7,{Row}14*7);
      Rectangle(({Column}4-1)*7,({Row}11-1)*7,{Column}4*7,{Row}11*7);
      Rectangle(({Column}4-1)*7,({Row}13-1)*7,{Column}4*7,{Row}13*7);
      Rectangle(({Column}4-1)*7,({Row}16-1)*7,{Column}4*7,{Row}16*7);
      Rectangle(({Column}4-1)*7,({Row}18-1)*7,{Column}4*7,{Row}18*7);
      Rectangle(({Column}5-1)*7,({Row}12-1)*7,{Column}5*7,{Row}12*7);
      Rectangle(({Column}5-1)*7,({Row}17-1)*7,{Column}5*7,{Row}17*7);
    end;
  end;

  with PaintBox14, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(Rect(0,0,uppoint,Height));
      Draw(0,Height-round(uppoint*1.8),b4);
  end;

  with PaintBox19, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(Rect(0,0,uppoint,Height));
      Draw(0,Height-round(uppoint*1.3),b4);
  end;

  with b5, Canvas do begin
    Brush.Style:=bsSolid;
    Brush.Color:=RGB(240,240,240);
    FillRect(ClientRect);
      Brush.Color:=clRed;   //balloon
      //Column 1
      Rectangle(({Column}1-1)*7,({Row}3-1)*7,{Column}1*7,{Row}3*7);
      Rectangle(({Column}1-1)*7,({Row}4-1)*7,{Column}1*7,{Row}4*7);
      Rectangle(({Column}1-1)*7,({Row}5-1)*7,{Column}1*7,{Row}5*7);
      Rectangle(({Column}1-1)*7,({Row}6-1)*7,{Column}1*7,{Row}6*7);
      Rectangle(({Column}1-1)*7,({Row}7-1)*7,{Column}1*7,{Row}7*7);
      Rectangle(({Column}1-1)*7,({Row}8-1)*7,{Column}1*7,{Row}8*7);
      //Column 2
      Rectangle(({Column}2-1)*7,({Row}2-1)*7,{Column}2*7,{Row}2*7);
      Rectangle(({Column}2-1)*7,({Row}3-1)*7,{Column}2*7,{Row}3*7);
      Rectangle(({Column}2-1)*7,({Row}4-1)*7,{Column}2*7,{Row}4*7);
      Rectangle(({Column}2-1)*7,({Row}5-1)*7,{Column}2*7,{Row}5*7);
      Rectangle(({Column}2-1)*7,({Row}6-1)*7,{Column}2*7,{Row}6*7);
      Rectangle(({Column}2-1)*7,({Row}7-1)*7,{Column}2*7,{Row}7*7);
      Rectangle(({Column}2-1)*7,({Row}8-1)*7,{Column}2*7,{Row}8*7);
      Rectangle(({Column}2-1)*7,({Row}9-1)*7,{Column}2*7,{Row}9*7);
      //Column 3
      Rectangle(({Column}3-1)*7,({Row}2-1)*7,{Column}3*7,{Row}2*7);
      Rectangle(({Column}3-1)*7,({Row}3-1)*7,{Column}3*7,{Row}3*7);
      Rectangle(({Column}3-1)*7,({Row}4-1)*7,{Column}3*7,{Row}4*7);
      Rectangle(({Column}3-1)*7,({Row}5-1)*7,{Column}3*7,{Row}5*7);
      Rectangle(({Column}3-1)*7,({Row}6-1)*7,{Column}3*7,{Row}6*7);
      Rectangle(({Column}3-1)*7,({Row}7-1)*7,{Column}3*7,{Row}7*7);
      Rectangle(({Column}3-1)*7,({Row}8-1)*7,{Column}3*7,{Row}8*7);
      Rectangle(({Column}3-1)*7,({Row}9-1)*7,{Column}3*7,{Row}9*7);
      //Column 4
      Rectangle(({Column}4-1)*7,({Row}1-1)*7,{Column}4*7,{Row}1*7);
      Rectangle(({Column}4-1)*7,({Row}2-1)*7,{Column}4*7,{Row}2*7);
      Rectangle(({Column}4-1)*7,({Row}3-1)*7,{Column}4*7,{Row}3*7);
      Rectangle(({Column}4-1)*7,({Row}4-1)*7,{Column}4*7,{Row}4*7);
      Rectangle(({Column}4-1)*7,({Row}5-1)*7,{Column}4*7,{Row}5*7);
      Rectangle(({Column}4-1)*7,({Row}6-1)*7,{Column}4*7,{Row}6*7);
      Rectangle(({Column}4-1)*7,({Row}7-1)*7,{Column}4*7,{Row}7*7);
      Rectangle(({Column}4-1)*7,({Row}8-1)*7,{Column}4*7,{Row}8*7);
      Rectangle(({Column}4-1)*7,({Row}9-1)*7,{Column}4*7,{Row}9*7);
      Rectangle(({Column}4-1)*7,({Row}10-1)*7,{Column}4*7,{Row}10*7);
      //Column 5
      Rectangle(({Column}5-1)*7,({Row}2-1)*7,{Column}5*7,{Row}2*7);
      Rectangle(({Column}5-1)*7,({Row}4-1)*7,{Column}5*7,{Row}4*7);
      Rectangle(({Column}5-1)*7,({Row}5-1)*7,{Column}5*7,{Row}5*7);
      Rectangle(({Column}5-1)*7,({Row}6-1)*7,{Column}5*7,{Row}6*7);
      Rectangle(({Column}5-1)*7,({Row}7-1)*7,{Column}5*7,{Row}7*7);
      Rectangle(({Column}5-1)*7,({Row}8-1)*7,{Column}5*7,{Row}8*7);
      Rectangle(({Column}5-1)*7,({Row}9-1)*7,{Column}5*7,{Row}9*7);
      //Column 6
      Rectangle(({Column}6-1)*7,({Row}2-1)*7,{Column}6*7,{Row}2*7);
      Rectangle(({Column}6-1)*7,({Row}3-1)*7,{Column}6*7,{Row}3*7);
      Rectangle(({Column}6-1)*7,({Row}5-1)*7,{Column}6*7,{Row}5*7);
      Rectangle(({Column}6-1)*7,({Row}6-1)*7,{Column}6*7,{Row}6*7);
      Rectangle(({Column}6-1)*7,({Row}7-1)*7,{Column}6*7,{Row}7*7);
      Rectangle(({Column}6-1)*7,({Row}8-1)*7,{Column}6*7,{Row}8*7);
      Rectangle(({Column}6-1)*7,({Row}9-1)*7,{Column}6*7,{Row}9*7);
      //Column 7
      Rectangle(({Column}7-1)*7,({Row}3-1)*7,{Column}7*7,{Row}3*7);
      Rectangle(({Column}7-1)*7,({Row}4-1)*7,{Column}7*7,{Row}4*7);
      Rectangle(({Column}7-1)*7,({Row}5-1)*7,{Column}7*7,{Row}5*7);
      Rectangle(({Column}7-1)*7,({Row}6-1)*7,{Column}7*7,{Row}6*7);
      Rectangle(({Column}7-1)*7,({Row}7-1)*7,{Column}7*7,{Row}7*7);
      Rectangle(({Column}7-1)*7,({Row}8-1)*7,{Column}7*7,{Row}8*7);

      //glare
      Brush.Color:=clWhite;
      Rectangle(({Column}5-1)*7,({Row}3-1)*7,{Column}5*7,{Row}3*7);
      Rectangle(({Column}6-1)*7,({Row}4-1)*7,{Column}6*7,{Row}4*7);

      //string
      Brush.Color:=clGray;
    if upanim<10 then begin
      Rectangle(({Column}3-1)*7,({Row}14-1)*7,{Column}3*7,{Row}14*7);
      Rectangle(({Column}3-1)*7,({Row}14-1)*7,{Column}3*7,{Row}14*7);
      Rectangle(({Column}4-1)*7,({Row}11-1)*7,{Column}4*7,{Row}11*7);
      Rectangle(({Column}4-1)*7,({Row}13-1)*7,{Column}4*7,{Row}13*7);
      Rectangle(({Column}4-1)*7,({Row}16-1)*7,{Column}4*7,{Row}16*7);
      Rectangle(({Column}4-1)*7,({Row}18-1)*7,{Column}4*7,{Row}18*7);
      Rectangle(({Column}5-1)*7,({Row}12-1)*7,{Column}5*7,{Row}12*7);
      Rectangle(({Column}5-1)*7,({Row}17-1)*7,{Column}5*7,{Row}17*7);
    end
    else if (upanim>10) and (upanim<20) then begin
      Rectangle(({Column}3-1)*7,({Row}13-1)*7,{Column}3*7,{Row}13*7);
      Rectangle(({Column}4-1)*7,({Row}11-1)*7,{Column}4*7,{Row}11*7);
      Rectangle(({Column}4-1)*7,({Row}12-1)*7,{Column}4*7,{Row}12*7);
      Rectangle(({Column}4-1)*7,({Row}14-1)*7,{Column}4*7,{Row}14*7);
      Rectangle(({Column}4-1)*7,({Row}18-1)*7,{Column}4*7,{Row}18*7);
      Rectangle(({Column}5-1)*7,({Row}15-1)*7,{Column}5*7,{Row}15*7);
      Rectangle(({Column}5-1)*7,({Row}17-1)*7,{Column}5*7,{Row}17*7);
      Rectangle(({Column}6-1)*7,({Row}16-1)*7,{Column}6*7,{Row}16*7);
    end
    else if upanim>20 then begin
      Rectangle(({Column}3-1)*7,({Row}12-1)*7,{Column}3*7,{Row}12*7);
      Rectangle(({Column}3-1)*7,({Row}17-1)*7,{Column}3*7,{Row}17*7);
      Rectangle(({Column}4-1)*7,({Row}11-1)*7,{Column}4*7,{Row}11*7);
      Rectangle(({Column}4-1)*7,({Row}13-1)*7,{Column}4*7,{Row}13*7);
      Rectangle(({Column}4-1)*7,({Row}14-1)*7,{Column}4*7,{Row}14*7);
      Rectangle(({Column}4-1)*7,({Row}18-1)*7,{Column}4*7,{Row}18*7);
      Rectangle(({Column}4-1)*7,({Row}16-1)*7,{Column}4*7,{Row}16*7);
      Rectangle(({Column}5-1)*7,({Row}15-1)*7,{Column}5*7,{Row}15*7);
    end;
  end;

  with PaintBox12, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(Rect(0,0,uppoint,Height));
      Draw(0,Height-round(uppoint*1.4),b5);
  end;

  with PaintBox18, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(Rect(0,0,uppoint,Height));
      Draw(0,Height-round(uppoint*1.5),b5);
  end;


  if flee=true then
  with PaintBox9, Canvas do begin
    Font.Size:=11;
    TextOut(0,0,'You had fleed from the race, but you were told that');
  end;
  with PaintBox20, Canvas do begin
    Font.Size:=24;
    TextOut(0,0,'You won!');
  end;

    b1.Free;
    b2.Free;
    b3.Free;
    b4.Free;
    b5.Free;

  if uppoint=280 then begin   //stopping the animation
    Timer2.Enabled:=False;
    uppoint:=0;
    Button5.Enabled:=True; // enabling start button
    with PaintBox9, Canvas do begin    // clearing the paintboxes
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(ClientRect);
    end;
    with PaintBox20, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(ClientRect);
    end;
  end;
end;

procedure TForm4.Lose();
var
  UpLoses:TBitmap;
begin

  Button5.Enabled:=false;   //disabling start button
  //creating bitmap and assigning sizes
  UpLoses:=TBitmap.Create;
  UpLoses.Width:=105;
  UpLoses.Height:=23;

  with UpLoses, Canvas do begin // increasing loses animation
    Brush.Style:=bsSolid;
    Brush.Color:=RGB(240,240,240);
    FillRect(ClientRect);
    Font.Size:=14;
    TextOut(0,0,'+1');
  end;
  with PaintBox8, Canvas do begin
    Brush.Style:=bsSolid;
    Brush.Color:=RGB(240,240,240);
    FillRect(Rect(0,0,uppoint,Height));
    Draw(0,8-uppoint,UpLoses);
  end;

  // sad faces
    with PaintBox10, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(ClientRect);
      Pen.Width:=2;
      Pen.Color:=clBlack;
      Pen.Style:=psSolid;

      Ellipse(0,0+round(uppoint*1.5),49,49+round(uppoint*1.5));
      Ellipse(10,10+round(uppoint*1.5),24,24+round(uppoint*1.5));
      Ellipse(39,10+round(uppoint*1.5),24,49-24+round(uppoint*1.5));
      Ellipse(49 div 2 -10,49 div 2 +5+round(uppoint*1.5),49 div 2 +10,49 div 2 +25+round(uppoint*1.5));
      Pen.Color:=RGB(240,240,240);
      Rectangle(49 div 2 -10,49 div 2 +15+round(uppoint*1.5),49 div 2 +10,49 div 2 +22+round(uppoint*1.5));
  end;
    with PaintBox11, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(ClientRect);
      Pen.Width:=2;
      Pen.Color:=clBlack;
      Pen.Style:=psSolid;

      Ellipse(0,0+round(uppoint*1.8),49,49+round(uppoint*1.8));
      Ellipse(10,10+round(uppoint*1.8),24,24+round(uppoint*1.8));
      Ellipse(39,10+round(uppoint*1.8),24,49-24+round(uppoint*1.8));
      Ellipse(49 div 2 -10,49 div 2 +5+round(uppoint*1.8),49 div 2 +10,49 div 2 +25+round(uppoint*1.8));
      Pen.Color:=RGB(240,240,240);
      Rectangle(49 div 2 -10,49 div 2 +15+round(uppoint*1.8),49 div 2 +10,49 div 2 +22+round(uppoint*1.8));
  end;
    with PaintBox12, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(ClientRect);
      Pen.Width:=2;
      Pen.Color:=clBlack;
      Pen.Style:=psSolid;

      Ellipse(0,0+round(uppoint*1.0),49,49+round(uppoint*1.0));
      Ellipse(10,10+round(uppoint*1.0),24,24+round(uppoint*1.0));
      Ellipse(39,10+round(uppoint*1.0),24,49-24+round(uppoint*1.0));
      Ellipse(49 div 2 -10,49 div 2 +5+round(uppoint*1.0),49 div 2 +10,49 div 2 +25+round(uppoint*1.0));
      Pen.Color:=RGB(240,240,240);
      Rectangle(49 div 2 -10,49 div 2 +15+round(uppoint*1.0),49 div 2 +10,49 div 2 +22+round(uppoint*1.0));
  end;
    with PaintBox13, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(ClientRect);
      Pen.Width:=2;
      Pen.Color:=clBlack;
      Pen.Style:=psSolid;

      Ellipse(0,0+round(uppoint*1.4),49,49+round(uppoint*1.4));
      Ellipse(10,10+round(uppoint*1.4),24,24+round(uppoint*1.4));
      Ellipse(39,10+round(uppoint*1.4),24,49-24+round(uppoint*1.4));
      Ellipse(49 div 2 -10,49 div 2 +5+round(uppoint*1.4),49 div 2 +10,49 div 2 +25+round(uppoint*1.4));
      Pen.Color:=RGB(240,240,240);
      Rectangle(49 div 2 -10,49 div 2 +15+round(uppoint*1.4),49 div 2 +10,49 div 2 +22+round(uppoint*1.4));
  end;
    with PaintBox14, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(ClientRect);
      Pen.Width:=2;
      Pen.Color:=clBlack;
      Pen.Style:=psSolid;

      Ellipse(0,0+round(uppoint*1.7),49,49+round(uppoint*1.7));
      Ellipse(10,10+round(uppoint*1.7),24,24+round(uppoint*1.7));
      Ellipse(39,10+round(uppoint*1.7),24,49-24+round(uppoint*1.7));
      Ellipse(49 div 2 -10,49 div 2 +5+round(uppoint*1.7),49 div 2 +10,49 div 2 +25+round(uppoint*1.7));
      Pen.Color:=RGB(240,240,240);
      Rectangle(49 div 2 -10,49 div 2 +15+round(uppoint*1.7),49 div 2 +10,49 div 2 +22+round(uppoint*1.7));
  end;
    with PaintBox15, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(ClientRect);
      Pen.Width:=2;
      Pen.Color:=clBlack;
      Pen.Style:=psSolid;

      Ellipse(0,0+round(uppoint*1.9),49,49+round(uppoint*1.9));
      Ellipse(10,10+round(uppoint*1.9),24,24+round(uppoint*1.9));
      Ellipse(39,10+round(uppoint*1.9),24,49-24+round(uppoint*1.9));
      Ellipse(49 div 2 -10,49 div 2 +5+round(uppoint*1.9),49 div 2 +10,49 div 2 +25+round(uppoint*1.9));
      Pen.Color:=RGB(240,240,240);
      Rectangle(49 div 2 -10,49 div 2 +15+round(uppoint*1.9),49 div 2 +10,49 div 2 +22+round(uppoint*1.9));
  end;
    with PaintBox16, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(ClientRect);
      Pen.Width:=2;
      Pen.Color:=clBlack;
      Pen.Style:=psSolid;

      Ellipse(0,0+round(uppoint*1.6),49,49+round(uppoint*1.6));
      Ellipse(10,10+round(uppoint*1.6),24,24+round(uppoint*1.6));
      Ellipse(39,10+round(uppoint*1.6),24,49-24+round(uppoint*1.6));
      Ellipse(49 div 2 -10,49 div 2 +5+round(uppoint*1.6),49 div 2 +10,49 div 2 +25+round(uppoint*1.6));
      Pen.Color:=RGB(240,240,240);
      Rectangle(49 div 2 -10,49 div 2 +15+round(uppoint*1.6),49 div 2 +10,49 div 2 +22+round(uppoint*1.6));
  end;
    with PaintBox17, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(ClientRect);
      Pen.Width:=2;
      Pen.Color:=clBlack;
      Pen.Style:=psSolid;

      Ellipse(0,0+round(uppoint*1.2),49,49+round(uppoint*1.2));
      Ellipse(10,10+round(uppoint*1.2),24,24+round(uppoint*1.2));
      Ellipse(39,10+round(uppoint*1.2),24,49-24+round(uppoint*1.2));
      Ellipse(49 div 2 -10,49 div 2 +5+round(uppoint*1.2),49 div 2 +10,49 div 2 +25+round(uppoint*1.2));
      Pen.Color:=RGB(240,240,240);
      Rectangle(49 div 2 -10,49 div 2 +15+round(uppoint*1.2),49 div 2 +10,49 div 2 +22+round(uppoint*1.2));
  end;
    with PaintBox18, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(ClientRect);
      Pen.Width:=2;
      Pen.Color:=clBlack;
      Pen.Style:=psSolid;

      Ellipse(0,0+round(uppoint*2.0),49,49+round(uppoint*2.0));
      Ellipse(10,10+round(uppoint*2.0),24,24+round(uppoint*2.0));
      Ellipse(39,10+round(uppoint*2.0),24,49-24+round(uppoint*2.0));
      Ellipse(49 div 2 -10,49 div 2 +5+round(uppoint*2.0),49 div 2 +10,49 div 2 +25+round(uppoint*2.0));
      Pen.Color:=RGB(240,240,240);
      Rectangle(49 div 2 -10,49 div 2 +15+round(uppoint*2.0),49 div 2 +10,49 div 2 +22+round(uppoint*2.0));
  end;
    with PaintBox19, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(ClientRect);
      Pen.Width:=2;
      Pen.Color:=clBlack;
      Pen.Style:=psSolid;

      Ellipse(0,0+round(uppoint*1.1),49,49+round(uppoint*1.1));
      Ellipse(10,10+round(uppoint*1.1),24,24+round(uppoint*1.1));
      Ellipse(39,10+round(uppoint*1.1),24,49-24+round(uppoint*1.1));
      Ellipse(49 div 2 -10,49 div 2 +5+round(uppoint*1.1),49 div 2 +10,49 div 2 +25+round(uppoint*1.1));
      Pen.Color:=RGB(240,240,240);
      Rectangle(49 div 2 -10,49 div 2 +15+round(uppoint*1.1),49 div 2 +10,49 div 2 +22+round(uppoint*1.1));
  end;

  if flee=true then
  with PaintBox9, Canvas do begin
    Font.Size:=11;
    TextOut(0,0,'You fled from race but you were told that');
  end;
  with PaintBox20, Canvas do begin
    Font.Size:=24;
    TextOut(0,0,'You lost');
  end;


  if uppoint=200 then begin
    Timer2.Enabled:=False;
    uppoint:=0;
    Button5.Enabled:=True;
    with PaintBox9, Canvas do begin 
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(ClientRect);
    end;
    with PaintBox20, Canvas do begin
      Brush.Style:=bsSolid;
      Brush.Color:=RGB(240,240,240);
      FillRect(ClientRect);
    end;
  end;;
end;

procedure Tform4.Race();   // actually race
var
  i:Integer;
begin
    //Drawing horses in 10х10 table with 11PXx11PX cells
    //Rectangle((Column-1)*11,(Row-1)*11,Column*11,Row*11)

    //creating bitmaps and assigning sizes
    bm1:=TBitmap.Create;
    bm1.Width:=110;
    bm1.Height:=110;
    bm2:=TBitmap.Create;
    bm2.Width:=110;
    bm2.Height:=110;
    bm3:=TBitmap.Create;
    bm3.Width:=110;
    bm3.Height:=110;
    bm4:=TBitmap.Create;
    bm4.Width:=111;
    bm4.Height:=110;

    with bm1, Canvas do begin
      Brush.color:=rgb(240,240,240);
      Brush.Style := bsSolid;
      FillRect(ClientRect);
      Brush.Style:=bsSolid;
      Pen.Style:=psSolid;
      Pen.Width:=1;
      Pen.Color:=clBlack;
      if horseanim<10 then begin
        
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,44,11,55);
        Rectangle(0,55,11,66);
        //Column 2
        Rectangle(11,33,22,44);
        Rectangle(11,44,22,55);
        Rectangle(11,99,22,110);
        //Column 3
        Rectangle(22,44,33,55);
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        Rectangle(22,88,33,99);
        //Column 4
        Rectangle(33,55,44,66);
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        //Column 6
        Rectangle(55,44,66,55);
        //Column 7
        Rectangle(66,33,77,44);
        Rectangle(66,55,77,66);
        Rectangle(66,66,77,77);
        //Column 8
        Rectangle(77,22,88,33);
        Rectangle(77,44,88,55);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        Rectangle(77,77,88,88);
        Rectangle(77,99,88,110);
        //Column 9
        Rectangle(88,11,99,22);
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,77,99,88);
        Rectangle(88,88,99,99);
        //Column 10
        Rectangle(99,33,110,44);
        Rectangle(99,44,110,55);

        Brush.Color:=clRed; //horse wear
        Rectangle(44,55,55,66);
        Rectangle(44,66,55,77);
        Rectangle(55,55,66,66);
        Rectangle(55,66,66,77);
        Rectangle(66,44,77,55);
        Rectangle(77,33,88,44);
      end
      else if (horseanim>10) and (horseanim<20) then begin
        //1-2
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,33,11,44);
        Rectangle(0,44,11,55);
        //Column 2
        Rectangle(11,44,22,55);
        Rectangle(11,99,22,110);
        //Column 3
        Rectangle(22,44,33,55);
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        Rectangle(22,88,33,99);
        //Column 4
        Rectangle(33,55,44,66);
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        //Column 7
        Rectangle(66,33,77,44);
        Rectangle(66,55,77,66);
        Rectangle(66,66,77,77);
        //Column 8
        Rectangle(77,22,88,33);
        Rectangle(77,44,88,55);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        //Column 9
        Rectangle(88,11,99,22);
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,66,99,77);
        Rectangle(88,88,99,99);
        //Column 10
        Rectangle(99,33,110,44);
        Rectangle(99,44,110,55);
        Rectangle(99,77,110,88);

        Brush.Color:=clRed; //horse wear
        Rectangle(44,55,55,66);
        Rectangle(44,66,55,77);
        Rectangle(55,55,66,66);
        Rectangle(55,66,66,77);
        Rectangle(66,44,77,55);
        Rectangle(77,33,88,44);
      end
      else if (horseanim>20) and (horseanim<30) then begin
        //1-3
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,33,11,44);
        Rectangle(0,44,11,55);
        Rectangle(0,66,11,77);
        //Column 2
        Rectangle(11,22,22,33);
        Rectangle(11,33,22,44);
        Rectangle(11,77,22,88);
        //Column 3
        Rectangle(22,33,33,44);
        Rectangle(22,44,33,55);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        //Column 4
        Rectangle(33,44,44,55);
        Rectangle(33,55,44,66);
        Rectangle(33,66,44,77);
        //Column 6
        Rectangle(55,33,66,44);
        //Column 7
        Rectangle(66,22,77,33);
        Rectangle(66,44,77,55);
        Rectangle(66,55,77,66);
        //Column 8
        Rectangle(77,11,88,22);
        Rectangle(77,33,88,44);
        Rectangle(77,44,88,55);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        //Column 9
        Rectangle(88,0,99,11);
        Rectangle(88,11,99,22);
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,66,99,77);
        Rectangle(88,77,99,88);
        //Column 10
        Rectangle(99,22,110,33);
        Rectangle(99,33,110,44);
        Rectangle(99,88,110,99);

        Brush.Color:=clRed; //horse wear
        Rectangle(44,44,55,55);
        Rectangle(44,55,55,66);
        Rectangle(55,44,66,55);
        Rectangle(55,55,66,66);
        Rectangle(66,33,77,44);
        Rectangle(77,22,88,33);
      end
      else if (horseanim>30) and (horseanim<40) then begin
        //1-4
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,44,11,55);
        Rectangle(0,55,11,66);
        Rectangle(0,88,11,99);
        //Column 2
        Rectangle(11,55,22,66);
        Rectangle(11,77,22,88);
        Rectangle(11,88,22,99);
        //Column 3
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        //Column 4
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        //Column 7
        Rectangle(66,44,77,55);
        Rectangle(66,66,77,77);
        Rectangle(66,77,77,88);
        //Column 8
        Rectangle(77,33,88,44);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        Rectangle(77,77,88,88);
        Rectangle(77,88,88,99);
        //Column 9
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,55,99,66);
        Rectangle(88,88,99,99);
        Rectangle(88,99,99,110);
        //Column 10
        Rectangle(99,44,110,55);
        Rectangle(99,55,110,66);

        Brush.Color:=clRed; //horse wear
        Rectangle(44,66,55,77);
        Rectangle(44,77,55,88);
        Rectangle(55,66,66,77);
        Rectangle(55,77,66,88);
        Rectangle(66,55,77,66);
        Rectangle(77,44,88,55);
      end
      else if (horseanim>40) then begin
        //1-5
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,55,11,66);
        Rectangle(0,66,11,77);
        //Column 2
        Rectangle(11,44,22,55);
        Rectangle(11,55,22,66);
        //Column 3
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        Rectangle(22,88,33,99);
        Rectangle(22,99,33,110);
        //Column 4
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        Rectangle(33,88,44,99);
        //Column 6
        Rectangle(55,55,66,66);
        //Column 7
        Rectangle(66,44,77,66);
        Rectangle(66,66,77,77);
        Rectangle(66,77,77,88);
        //Column 8
        Rectangle(77,33,88,44);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        Rectangle(77,77,88,88);
        Rectangle(77,88,88,99);
        //Column 9
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,55,99,66);
        Rectangle(88,88,99,99);
        Rectangle(88,99,99,110);
        //Column 10
        Rectangle(99,44,110,55);
        Rectangle(99,55,110,66);

        Brush.Color:=clRed; //horse wear
        Rectangle(44,66,55,77);
        Rectangle(44,77,55,88);
        Rectangle(55,66,66,77);
        Rectangle(55,77,66,88);
        Rectangle(66,55,77,66);
        Rectangle(77,44,88,55);
      end;
    end;
     PaintBox1.Canvas.Brush.Style:=bsSolid;
     PaintBox1.Canvas.Brush.color:=rgb(240,240,240);
     PaintBox1.Canvas.FillRect(Rect(0,0,Round(basepoint*a[1]),Height));
     PaintBox1.Canvas.Draw(Round(basepoint*a[1]),0,bm1);

    with bm2, Canvas do begin
      Brush.color:=rgb(240,240,240);
      Brush.Style := bsSolid;
      FillRect(ClientRect);
      Brush.Style:=bsSolid;
      Pen.Style:=psSolid;
      Pen.Width:=1;
      Pen.Color:=clBlack;
      if horseanim<10 then begin
        
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,44,11,55);
        Rectangle(0,55,11,66);
        //Column 2
        Rectangle(11,33,22,44);
        Rectangle(11,44,22,55);
        Rectangle(11,99,22,110);
        //Column 3
        Rectangle(22,44,33,55);
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        Rectangle(22,88,33,99);
        //Column 4
        Rectangle(33,55,44,66);
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        //Column 6
        Rectangle(55,44,66,55);
        //Column 7
        Rectangle(66,33,77,44);
        Rectangle(66,55,77,66);
        Rectangle(66,66,77,77);
        //Column 8
        Rectangle(77,22,88,33);
        Rectangle(77,44,88,55);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        Rectangle(77,77,88,88);
        Rectangle(77,99,88,110);
        //Column 9
        Rectangle(88,11,99,22);
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,77,99,88);
        Rectangle(88,88,99,99);
        //Column 10
        Rectangle(99,33,110,44);
        Rectangle(99,44,110,55);

        Brush.Color:=clYellow; //horse wear
        Rectangle(44,55,55,66);
        Rectangle(44,66,55,77);
        Rectangle(55,55,66,66);
        Rectangle(55,66,66,77);
        Rectangle(66,44,77,55);
        Rectangle(77,33,88,44);
      end
      else if (horseanim>10) and (horseanim<20) then begin
        //1-2
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,33,11,44);
        Rectangle(0,44,11,55);
        //Column 2
        Rectangle(11,44,22,55);
        Rectangle(11,99,22,110);
        //Column 3
        Rectangle(22,44,33,55);
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        Rectangle(22,88,33,99);
        //Column 4
        Rectangle(33,55,44,66);
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        //Column 7
        Rectangle(66,33,77,44);
        Rectangle(66,55,77,66);
        Rectangle(66,66,77,77);
        //Column 8
        Rectangle(77,22,88,33);
        Rectangle(77,44,88,55);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        //Column 9
        Rectangle(88,11,99,22);
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,66,99,77);
        Rectangle(88,88,99,99);
        //Column 10
        Rectangle(99,33,110,44);
        Rectangle(99,44,110,55);
        Rectangle(99,77,110,88);

        Brush.Color:=clYellow; //horse wear
        Rectangle(44,55,55,66);
        Rectangle(44,66,55,77);
        Rectangle(55,55,66,66);
        Rectangle(55,66,66,77);
        Rectangle(66,44,77,55);
        Rectangle(77,33,88,44);
      end
      else if (horseanim>20) and (horseanim<30) then begin
        //1-3
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,33,11,44);
        Rectangle(0,44,11,55);
        Rectangle(0,66,11,77);
        //Column 2
        Rectangle(11,22,22,33);
        Rectangle(11,33,22,44);
        Rectangle(11,77,22,88);
        //Column 3
        Rectangle(22,33,33,44);
        Rectangle(22,44,33,55);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        //Column 4
        Rectangle(33,44,44,55);
        Rectangle(33,55,44,66);
        Rectangle(33,66,44,77);
        //Column 6
        Rectangle(55,33,66,44);
        //Column 7
        Rectangle(66,22,77,33);
        Rectangle(66,44,77,55);
        Rectangle(66,55,77,66);
        //Column 8
        Rectangle(77,11,88,22);
        Rectangle(77,33,88,44);
        Rectangle(77,44,88,55);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        //Column 9
        Rectangle(88,0,99,11);
        Rectangle(88,11,99,22);
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,66,99,77);
        Rectangle(88,77,99,88);
        //Column 10
        Rectangle(99,22,110,33);
        Rectangle(99,33,110,44);
        Rectangle(99,88,110,99);

        Brush.Color:=clYellow; //horse wear
        Rectangle(44,44,55,55);
        Rectangle(44,55,55,66);
        Rectangle(55,44,66,55);
        Rectangle(55,55,66,66);
        Rectangle(66,33,77,44);
        Rectangle(77,22,88,33);
      end
      else if (horseanim>30) and (horseanim<40) then begin
        //1-4
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,44,11,55);
        Rectangle(0,55,11,66);
        Rectangle(0,88,11,99);
        //Column 2
        Rectangle(11,55,22,66);
        Rectangle(11,77,22,88);
        Rectangle(11,88,22,99);
        //Column 3
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        //Column 4
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        //Column 7
        Rectangle(66,44,77,55);
        Rectangle(66,66,77,77);
        Rectangle(66,77,77,88);
        //Column 8
        Rectangle(77,33,88,44);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        Rectangle(77,77,88,88);
        Rectangle(77,88,88,99);
        //Column 9
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,55,99,66);
        Rectangle(88,88,99,99);
        Rectangle(88,99,99,110);
        //Column 10
        Rectangle(99,44,110,55);
        Rectangle(99,55,110,66);

        Brush.Color:=clYellow; //horse wear
        Rectangle(44,66,55,77);
        Rectangle(44,77,55,88);
        Rectangle(55,66,66,77);
        Rectangle(55,77,66,88);
        Rectangle(66,55,77,66);
        Rectangle(77,44,88,55);
      end
      else if (horseanim>40) then begin
        //1-5
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,55,11,66);
        Rectangle(0,66,11,77);
        //Column 2
        Rectangle(11,44,22,55);
        Rectangle(11,55,22,66);
        //Column 3
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        Rectangle(22,88,33,99);
        Rectangle(22,99,33,110);
        //Column 4
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        Rectangle(33,88,44,99);
        //Column 6
        Rectangle(55,55,66,66);
        //Column 7
        Rectangle(66,44,77,66);
        Rectangle(66,66,77,77);
        Rectangle(66,77,77,88);
        //Column 8
        Rectangle(77,33,88,44);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        Rectangle(77,77,88,88);
        Rectangle(77,88,88,99);
        //Column 9
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,55,99,66);
        Rectangle(88,88,99,99);
        Rectangle(88,99,99,110);
        //Column 10
        Rectangle(99,44,110,55);
        Rectangle(99,55,110,66);

        Brush.Color:=clYellow; //horse wear
        Rectangle(44,66,55,77);
        Rectangle(44,77,55,88);
        Rectangle(55,66,66,77);
        Rectangle(55,77,66,88);
        Rectangle(66,55,77,66);
        Rectangle(77,44,88,55);
      end;
    end;
     PaintBox2.Canvas.Brush.Style:=bsSolid;
     PaintBox2.Canvas.Brush.color:=rgb(240,240,240);
     PaintBox2.Canvas.FillRect(Rect(0,0,Round(basepoint*a[2]),Height));
     PaintBox2.Canvas.Draw(Round(basepoint*a[2]),0,bm2);

    with bm3, Canvas do begin
      Brush.color:=rgb(240,240,240);
      Brush.Style := bsSolid;
      FillRect(ClientRect);
      Brush.Style:=bsSolid;
      Pen.Style:=psSolid;
      Pen.Width:=1;
      Pen.Color:=clBlack;
      if horseanim<10 then begin
        
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,44,11,55);
        Rectangle(0,55,11,66);
        //Column 2
        Rectangle(11,33,22,44);
        Rectangle(11,44,22,55);
        Rectangle(11,99,22,110);
        //Column 3
        Rectangle(22,44,33,55);
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        Rectangle(22,88,33,99);
        //Column 4
        Rectangle(33,55,44,66);
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        //Column 6
        Rectangle(55,44,66,55);
        //Column 7
        Rectangle(66,33,77,44);
        Rectangle(66,55,77,66);
        Rectangle(66,66,77,77);
        //Column 8
        Rectangle(77,22,88,33);
        Rectangle(77,44,88,55);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        Rectangle(77,77,88,88);
        Rectangle(77,99,88,110);
        //Column 9
        Rectangle(88,11,99,22);
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,77,99,88);
        Rectangle(88,88,99,99);
        //Column 10
        Rectangle(99,33,110,44);
        Rectangle(99,44,110,55);

        Brush.Color:=clBlue; //horse wear
        Rectangle(44,55,55,66);
        Rectangle(44,66,55,77);
        Rectangle(55,55,66,66);
        Rectangle(55,66,66,77);
        Rectangle(66,44,77,55);
        Rectangle(77,33,88,44);
      end
      else if (horseanim>10) and (horseanim<20) then begin
        //1-2
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,33,11,44);
        Rectangle(0,44,11,55);
        //Column 2
        Rectangle(11,44,22,55);
        Rectangle(11,99,22,110);
        //Column 3
        Rectangle(22,44,33,55);
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        Rectangle(22,88,33,99);
        //Column 4
        Rectangle(33,55,44,66);
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        //Column 7
        Rectangle(66,33,77,44);
        Rectangle(66,55,77,66);
        Rectangle(66,66,77,77);
        //Column 8
        Rectangle(77,22,88,33);
        Rectangle(77,44,88,55);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        //Column 9
        Rectangle(88,11,99,22);
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,66,99,77);
        Rectangle(88,88,99,99);
        //Column 10
        Rectangle(99,33,110,44);
        Rectangle(99,44,110,55);
        Rectangle(99,77,110,88);

        Brush.Color:=clBlue; //horse wear
        Rectangle(44,55,55,66);
        Rectangle(44,66,55,77);
        Rectangle(55,55,66,66);
        Rectangle(55,66,66,77);
        Rectangle(66,44,77,55);
        Rectangle(77,33,88,44);
      end
      else if (horseanim>20) and (horseanim<30) then begin
        //1-3
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,33,11,44);
        Rectangle(0,44,11,55);
        Rectangle(0,66,11,77);
        //Column 2
        Rectangle(11,22,22,33);
        Rectangle(11,33,22,44);
        Rectangle(11,77,22,88);
        //Column 3
        Rectangle(22,33,33,44);
        Rectangle(22,44,33,55);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        //Column 4
        Rectangle(33,44,44,55);
        Rectangle(33,55,44,66);
        Rectangle(33,66,44,77);
        //Column 6
        Rectangle(55,33,66,44);
        //Column 7
        Rectangle(66,22,77,33);
        Rectangle(66,44,77,55);
        Rectangle(66,55,77,66);
        //Column 8
        Rectangle(77,11,88,22);
        Rectangle(77,33,88,44);
        Rectangle(77,44,88,55);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        //Column 9
        Rectangle(88,0,99,11);
        Rectangle(88,11,99,22);
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,66,99,77);
        Rectangle(88,77,99,88);
        //Column 10
        Rectangle(99,22,110,33);
        Rectangle(99,33,110,44);
        Rectangle(99,88,110,99);

        Brush.Color:=clBlue; //horse wear
        Rectangle(44,44,55,55);
        Rectangle(44,55,55,66);
        Rectangle(55,44,66,55);
        Rectangle(55,55,66,66);
        Rectangle(66,33,77,44);
        Rectangle(77,22,88,33);
      end
      else if (horseanim>30) and (horseanim<40) then begin
        //1-4
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,44,11,55);
        Rectangle(0,55,11,66);
        Rectangle(0,88,11,99);
        //Column 2
        Rectangle(11,55,22,66);
        Rectangle(11,77,22,88);
        Rectangle(11,88,22,99);
        //Column 3
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        //Column 4
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        //Column 7
        Rectangle(66,44,77,55);
        Rectangle(66,66,77,77);
        Rectangle(66,77,77,88);
        //Column 8
        Rectangle(77,33,88,44);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        Rectangle(77,77,88,88);
        Rectangle(77,88,88,99);
        //Column 9
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,55,99,66);
        Rectangle(88,88,99,99);
        Rectangle(88,99,99,110);
        //Column 10
        Rectangle(99,44,110,55);
        Rectangle(99,55,110,66);

        Brush.Color:=clBlue; //horse wear
        Rectangle(44,66,55,77);
        Rectangle(44,77,55,88);
        Rectangle(55,66,66,77);
        Rectangle(55,77,66,88);
        Rectangle(66,55,77,66);
        Rectangle(77,44,88,55);
      end
      else if (horseanim>40) then begin
        //1-5
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,55,11,66);
        Rectangle(0,66,11,77);
        //Column 2
        Rectangle(11,44,22,55);
        Rectangle(11,55,22,66);
        //Column 3
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        Rectangle(22,88,33,99);
        Rectangle(22,99,33,110);
        //Column 4
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        Rectangle(33,88,44,99);
        //Column 6
        Rectangle(55,55,66,66);
        //Column 7
        Rectangle(66,44,77,66);
        Rectangle(66,66,77,77);
        Rectangle(66,77,77,88);
        //Column 8
        Rectangle(77,33,88,44);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        Rectangle(77,77,88,88);
        Rectangle(77,88,88,99);
        //Column 9
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,55,99,66);
        Rectangle(88,88,99,99);
        Rectangle(88,99,99,110);
        //Column 10
        Rectangle(99,44,110,55);
        Rectangle(99,55,110,66);

        Brush.Color:=clBlue; //horse wear
        Rectangle(44,66,55,77);
        Rectangle(44,77,55,88);
        Rectangle(55,66,66,77);
        Rectangle(55,77,66,88);
        Rectangle(66,55,77,66);
        Rectangle(77,44,88,55);
      end;
    end;
     PaintBox3.Canvas.Brush.Style:=bsSolid;
     PaintBox3.Canvas.Brush.color:=rgb(240,240,240);
     PaintBox3.Canvas.FillRect(Rect(0,0,Round(basepoint*a[3]),Height));
     PaintBox3.Canvas.Draw(Round(basepoint*a[3]),0,bm3);

    with bm4, Canvas do begin
      Brush.color:=rgb(240,240,240);
      Brush.Style := bsSolid;
      FillRect(ClientRect);
      Brush.Style:=bsSolid;
      Pen.Style:=psSolid;
      Pen.Width:=1;
      Pen.Color:=clBlack;
      if horseanim<10 then begin
        
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,44,11,55);
        Rectangle(0,55,11,66);
        //Column 2
        Rectangle(11,33,22,44);
        Rectangle(11,44,22,55);
        Rectangle(11,99,22,110);
        //Column 3
        Rectangle(22,44,33,55);
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        Rectangle(22,88,33,99);
        //Column 4
        Rectangle(33,55,44,66);
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        //Column 6
        Rectangle(55,44,66,55);
        //Column 7
        Rectangle(66,33,77,44);
        Rectangle(66,55,77,66);
        Rectangle(66,66,77,77);
        //Column 8
        Rectangle(77,22,88,33);
        Rectangle(77,44,88,55);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        Rectangle(77,77,88,88);
        Rectangle(77,99,88,110);
        //Column 9
        Rectangle(88,11,99,22);
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,77,99,88);
        Rectangle(88,88,99,99);
        //Column 10
        Rectangle(99,33,110,44);
        Rectangle(99,44,110,55);

        Brush.Color:=clGreen; //horse wear
        Rectangle(44,55,55,66);
        Rectangle(44,66,55,77);
        Rectangle(55,55,66,66);
        Rectangle(55,66,66,77);
        Rectangle(66,44,77,55);
        Rectangle(77,33,88,44);
      end
      else if (horseanim>10) and (horseanim<20) then begin
        //1-2
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,33,11,44);
        Rectangle(0,44,11,55);
        //Column 2
        Rectangle(11,44,22,55);
        Rectangle(11,99,22,110);
        //Column 3
        Rectangle(22,44,33,55);
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        Rectangle(22,88,33,99);
        //Column 4
        Rectangle(33,55,44,66);
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        //Column 7
        Rectangle(66,33,77,44);
        Rectangle(66,55,77,66);
        Rectangle(66,66,77,77);
        //Column 8
        Rectangle(77,22,88,33);
        Rectangle(77,44,88,55);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        //Column 9
        Rectangle(88,11,99,22);
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,66,99,77);
        Rectangle(88,88,99,99);
        //Column 10
        Rectangle(99,33,110,44);
        Rectangle(99,44,110,55);
        Rectangle(99,77,110,88);

        Brush.Color:=clGreen; //horse wear
        Rectangle(44,55,55,66);
        Rectangle(44,66,55,77);
        Rectangle(55,55,66,66);
        Rectangle(55,66,66,77);
        Rectangle(66,44,77,55);
        Rectangle(77,33,88,44);
      end
      else if (horseanim>20) and (horseanim<30) then begin
        //1-3
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,33,11,44);
        Rectangle(0,44,11,55);
        Rectangle(0,66,11,77);
        //Column 2
        Rectangle(11,22,22,33);
        Rectangle(11,33,22,44);
        Rectangle(11,77,22,88);
        //Column 3
        Rectangle(22,33,33,44);
        Rectangle(22,44,33,55);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        //Column 4
        Rectangle(33,44,44,55);
        Rectangle(33,55,44,66);
        Rectangle(33,66,44,77);
        //Column 6
        Rectangle(55,33,66,44);
        //Column 7
        Rectangle(66,22,77,33);
        Rectangle(66,44,77,55);
        Rectangle(66,55,77,66);
        //Column 8
        Rectangle(77,11,88,22);
        Rectangle(77,33,88,44);
        Rectangle(77,44,88,55);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        //Column 9
        Rectangle(88,0,99,11);
        Rectangle(88,11,99,22);
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,66,99,77);
        Rectangle(88,77,99,88);
        //Column 10
        Rectangle(99,22,110,33);
        Rectangle(99,33,110,44);
        Rectangle(99,88,110,99);

        Brush.Color:=clGreen; //horse wear
        Rectangle(44,44,55,55);
        Rectangle(44,55,55,66);
        Rectangle(55,44,66,55);
        Rectangle(55,55,66,66);
        Rectangle(66,33,77,44);
        Rectangle(77,22,88,33);
      end
      else if (horseanim>30) and (horseanim<40) then begin
        //1-4
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,44,11,55);
        Rectangle(0,55,11,66);
        Rectangle(0,88,11,99);
        //Column 2
        Rectangle(11,55,22,66);
        Rectangle(11,77,22,88);
        Rectangle(11,88,22,99);
        //Column 3
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        //Column 4
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        //Column 7
        Rectangle(66,44,77,55);
        Rectangle(66,66,77,77);
        Rectangle(66,77,77,88);
        //Column 8
        Rectangle(77,33,88,44);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        Rectangle(77,77,88,88);
        Rectangle(77,88,88,99);
        //Column 9
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,55,99,66);
        Rectangle(88,88,99,99);
        Rectangle(88,99,99,110);
        //Column 10
        Rectangle(99,44,110,55);
        Rectangle(99,55,110,66);

        Brush.Color:=clGreen; //horse wear
        Rectangle(44,66,55,77);
        Rectangle(44,77,55,88);
        Rectangle(55,66,66,77);
        Rectangle(55,77,66,88);
        Rectangle(66,55,77,66);
        Rectangle(77,44,88,55);
      end
      else if (horseanim>40) then begin
        //1-5
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,55,11,66);
        Rectangle(0,66,11,77);
        //Column 2
        Rectangle(11,44,22,55);
        Rectangle(11,55,22,66);
        //Column 3
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        Rectangle(22,88,33,99);
        Rectangle(22,99,33,110);
        //Column 4
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        Rectangle(33,88,44,99);
        //Column 6
        Rectangle(55,55,66,66);
        //Column 7
        Rectangle(66,44,77,66);
        Rectangle(66,66,77,77);
        Rectangle(66,77,77,88);
        //Column 8
        Rectangle(77,33,88,44);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        Rectangle(77,77,88,88);
        Rectangle(77,88,88,99);
        //Column 9
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,55,99,66);
        Rectangle(88,88,99,99);
        Rectangle(88,99,99,110);
        //Column 10
        Rectangle(99,44,110,55);
        Rectangle(99,55,110,66);

        Brush.Color:=clGreen; //horse wear
        Rectangle(44,66,55,77);
        Rectangle(44,77,55,88);
        Rectangle(55,66,66,77);
        Rectangle(55,77,66,88);
        Rectangle(66,55,77,66);
        Rectangle(77,44,88,55);
      end;
    end;
     PaintBox4.Canvas.Brush.Style:=bsSolid;
     PaintBox4.Canvas.Brush.color:=rgb(240,240,240);
     PaintBox4.Canvas.FillRect(Rect(0,0,Round(basepoint*a[4]),Height));
     PaintBox4.Canvas.Draw(Round(basepoint*a[4]),0,bm4);

     bm1.Free;
     bm2.Free;
     bm3.Free;
     bm4.Free;

    for i:=1 to 4 do begin         //обработка останоки гонки по приходе на финиш одной одной из лошадей
      if (Round(basepoint*a[i]))>=(PaintBox1.Width-10) then
        if i=HorseNum then begin     //победа
            //ShowMessage('Поздравляем с победой!');
            money:=money+bet*2;
            wins:=wins+1;
            Updatelbls;
            worl:=True;//игрок победил
            br:=true;//остановка цикла
          end
        else begin  //поражение
          loses:=loses+1;
          n:=i;
          Updatelbls;
          worl:=false;//игрок проиграл
          br:=True;//остановка цикла
          end;
      if br=True then Break;
    end;

    if br=True then begin  //остановка гонки
      Button5.Caption:='Старт';
      Button3.Caption:='Пауза';
      stand:=True;
      betani:=False;
      for i:=1 to 4 do a[i]:=0;
      Button5.Enabled:=True;
      Button4.Enabled:=True;
      RadioGroup1.Enabled:=True;
      Button3.Enabled:=False;
      Edit1.Enabled:=true;

      //запуск анимации сообщения победы/поражения
      uppoint:=0;
      Timer2.Enabled:=True;

      with PaintBox1, Canvas do begin
        Brush.Style:=bsSolid;
        Brush.Color:=RGB(240,240,240);
        FillRect(ClientRect);
      end;

      with PaintBox2, Canvas do begin
        Brush.Style:=bsSolid;
        Brush.Color:=RGB(240,240,240);
        FillRect(ClientRect);
      end;

      with PaintBox3, Canvas do begin
        Brush.Style:=bsSolid;
        Brush.Color:=RGB(240,240,240);
        FillRect(ClientRect);
      end;

      with PaintBox4, Canvas do begin
        Brush.Style:=bsSolid;
        Brush.Color:=RGB(240,240,240);
        FillRect(ClientRect);
      end;

      Exit;
    end;
end;

procedure TForm4.Timer1Timer(Sender: TObject);
var
  i:Integer;
begin
  if PanelMenu.Visible=True then begin
    Timer1.Interval:=500;
    MainCount := (MainCount + 1) mod Height;
    with PaintBoxMenu, Canvas do begin
          Brush.color:=rgb(240,240,240);
          Brush.Style := bsSolid;
          FillRect(ClientRect);
      if (MainCount mod 2 = 0) then begin
         Font.Height:=200;
         Font.Color:=clBlack;
         TextOut(0,60,'БЕГ');
      end else begin
         Font.Height:=160;
         Font.Color:=clRed;
         TextOut(10,280,'ЛОШАДЕЙ');
      end;
    end;
  end else if stand=True then begin
   for i:=1 to 19 do
    with PaintBox5, Canvas do begin
      Brush.Style:=bsSolid;
      if i mod 2 = 0 then begin
        Brush.Color:=clBlack;
        Rectangle(0,25*(i-1),25,25*i);
        Brush.Color:=clWhite;
        Rectangle(25,25*(i-1),Width,25*i);
      end else begin
        Brush.Color:=clWhite;
        Rectangle(0,25*(i-1),25,25*i);
        Brush.Color:=clBlack;
        Rectangle(25,25*(i-1),Width,25*i);
      end;
    end;

    bm1:=TBitmap.Create;
    bm1.Width:=110;
    bm1.Height:=110;
    bm2:=TBitmap.Create;
    bm2.Width:=110;
    bm2.Height:=110;
    bm3:=TBitmap.Create;
    bm3.Width:=110;
    bm3.Height:=110;
    bm4:=TBitmap.Create;
    bm4.Width:=111;
    bm4.Height:=110;

    with bm1, Canvas do begin
      Brush.color:=rgb(240,240,240);
      Brush.Style := bsSolid;
      FillRect(ClientRect);
      Brush.Style:=bsSolid;
      Pen.Style:=psSolid;
      Pen.Width:=1;
      Pen.Color:=clBlack;
      
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,44,11,55);
        Rectangle(0,55,11,66);
        //Column 2
        Rectangle(11,33,22,44);
        Rectangle(11,44,22,55);
        Rectangle(11,99,22,110);
        //Column 3
        Rectangle(22,44,33,55);
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        Rectangle(22,88,33,99);
        //Column 4
        Rectangle(33,55,44,66);
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        //Column 6
        Rectangle(55,44,66,55);
        //Column 7
        Rectangle(66,33,77,44);
        Rectangle(66,55,77,66);
        Rectangle(66,66,77,77);
        //Column 8
        Rectangle(77,22,88,33);
        Rectangle(77,44,88,55);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        Rectangle(77,77,88,88);
        Rectangle(77,99,88,110);
        //Column 9
        Rectangle(88,11,99,22);
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,77,99,88);
        Rectangle(88,88,99,99);
        //Column 10
        Rectangle(99,33,110,44);
        Rectangle(99,44,110,55);

        Brush.Color:=clRed; //horse wear
        Rectangle(44,55,55,66);
        Rectangle(44,66,55,77);
        Rectangle(55,55,66,66);
        Rectangle(55,66,66,77);
        Rectangle(66,44,77,55);
        Rectangle(77,33,88,44);

    end;
     PaintBox1.Canvas.Draw(10,0,bm1);

    with bm2, Canvas do begin
      Brush.color:=rgb(240,240,240);
      Brush.Style := bsSolid;
      FillRect(ClientRect);
      Brush.Style:=bsSolid;
      Pen.Style:=psSolid;
      Pen.Width:=1;
      Pen.Color:=clBlack;
      
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,44,11,55);
        Rectangle(0,55,11,66);
        //Column 2
        Rectangle(11,33,22,44);
        Rectangle(11,44,22,55);
        Rectangle(11,99,22,110);
        //Column 3
        Rectangle(22,44,33,55);
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        Rectangle(22,88,33,99);
        //Column 4
        Rectangle(33,55,44,66);
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        //Column 6
        Rectangle(55,44,66,55);
        //Column 7
        Rectangle(66,33,77,44);
        Rectangle(66,55,77,66);
        Rectangle(66,66,77,77);
        //Column 8
        Rectangle(77,22,88,33);
        Rectangle(77,44,88,55);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        Rectangle(77,77,88,88);
        Rectangle(77,99,88,110);
        //Column 9
        Rectangle(88,11,99,22);
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,77,99,88);
        Rectangle(88,88,99,99);
        //Column 10
        Rectangle(99,33,110,44);
        Rectangle(99,44,110,55);

        Brush.Color:=clYellow; //horse wear
        Rectangle(44,55,55,66);
        Rectangle(44,66,55,77);
        Rectangle(55,55,66,66);
        Rectangle(55,66,66,77);
        Rectangle(66,44,77,55);
        Rectangle(77,33,88,44);

    end;
     PaintBox2.Canvas.Draw(10,0,bm2);

    with bm3, Canvas do begin
      Brush.color:=rgb(240,240,240);
      Brush.Style := bsSolid;
      FillRect(ClientRect);
      Brush.Style:=bsSolid;
      Pen.Style:=psSolid;
      Pen.Width:=1;
      Pen.Color:=clBlack;
      
        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,44,11,55);
        Rectangle(0,55,11,66);
        //Column 2
        Rectangle(11,33,22,44);
        Rectangle(11,44,22,55);
        Rectangle(11,99,22,110);
        //Column 3
        Rectangle(22,44,33,55);
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        Rectangle(22,88,33,99);
        //Column 4
        Rectangle(33,55,44,66);
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        //Column 6
        Rectangle(55,44,66,55);
        //Column 7
        Rectangle(66,33,77,44);
        Rectangle(66,55,77,66);
        Rectangle(66,66,77,77);
        //Column 8
        Rectangle(77,22,88,33);
        Rectangle(77,44,88,55);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        Rectangle(77,77,88,88);
        Rectangle(77,99,88,110);
        //Column 9
        Rectangle(88,11,99,22);
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,77,99,88);
        Rectangle(88,88,99,99);
        //Column 10
        Rectangle(99,33,110,44);
        Rectangle(99,44,110,55);

        Brush.Color:=clBlue; //horse wear
        Rectangle(44,55,55,66);
        Rectangle(44,66,55,77);
        Rectangle(55,55,66,66);
        Rectangle(55,66,66,77);
        Rectangle(66,44,77,55);
        Rectangle(77,33,88,44);

    end;
     PaintBox3.Canvas.Draw(10,0,bm3);

    with bm4, Canvas do begin
      Brush.color:=rgb(240,240,240);
      Brush.Style := bsSolid;
      FillRect(ClientRect);
      Brush.Style:=bsSolid;
      Pen.Style:=psSolid;
      Pen.Width:=1;
      Pen.Color:=clBlack;

        brush.Color:=clGray; //horse body
        //Column 1
        Rectangle(0,44,11,55);
        Rectangle(0,55,11,66);
        //Column 2
        Rectangle(11,33,22,44);
        Rectangle(11,44,22,55);
        Rectangle(11,99,22,110);
        //Column 3
        Rectangle(22,44,33,55);
        Rectangle(22,55,33,66);
        Rectangle(22,66,33,77);
        Rectangle(22,77,33,88);
        Rectangle(22,88,33,99);
        //Column 4
        Rectangle(33,55,44,66);
        Rectangle(33,66,44,77);
        Rectangle(33,77,44,88);
        //Column 6
        Rectangle(55,44,66,55);
        //Column 7
        Rectangle(66,33,77,44);
        Rectangle(66,55,77,66);
        Rectangle(66,66,77,77);
        //Column 8
        Rectangle(77,22,88,33);
        Rectangle(77,44,88,55);
        Rectangle(77,55,88,66);
        Rectangle(77,66,88,77);
        Rectangle(77,77,88,88);
        Rectangle(77,99,88,110);
        //Column 9
        Rectangle(88,11,99,22);
        Rectangle(88,22,99,33);
        Rectangle(88,33,99,44);
        Rectangle(88,44,99,55);
        Rectangle(88,77,99,88);
        Rectangle(88,88,99,99);
        //Column 10
        Rectangle(99,33,110,44);
        Rectangle(99,44,110,55);

        Brush.Color:=clGreen; //horse wear
        Rectangle(44,55,55,66);
        Rectangle(44,66,55,77);
        Rectangle(55,55,66,66);
        Rectangle(55,66,66,77);
        Rectangle(66,44,77,55);
        Rectangle(77,33,88,44);

    end;
     PaintBox4.Canvas.Draw(10,0,bm4);

     bm1.Free;
     bm2.Free;
     bm3.Free;
     bm4.Free;
  end else begin
    Timer1.Interval:=10;
    Randomize;
    for i:= 1 to 4 do if Random(3000) = 1328 then a[i]:=a[1]+1.5;//sudden acceleration
    Inc(horseanim);
    if horseanim>50 then horseanim:=0;
    Inc(basepoint); //increasing of base point
    Race;
  end;

end;



procedure TForm4.FormCreate(Sender: TObject);
begin
  // assigning default values
  MainCount:=0;
  Money:=100;
  Wins:=0;
  Loses:=0;
  basepoint:=10;
  pause:=1;
  HorseNum:=1;
  Bet:=10;
  Updatelbls();
end;

procedure TForm4.Updatelbls();     //updating the UI
begin
  Label2.Caption:=IntToStr(Money);
  Edit1.Text:=IntToStr(Bet);
  Label8.Caption:=IntToStr(Wins);
  Label10.Caption:=IntToStr(Loses);
  RadioGroup1.ItemIndex:=HorseNum-1;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
  PanelMenu.Visible:=False;
  PanelGame.Visible:=True;
  stand:=True;
end;

procedure TForm4.Button5Click(Sender: TObject);
begin
  pause:=1;
  flee:=False;
  betani:=False;
  Button6.Enabled:=True;
  Button5.Caption:='Start';
  Button3.Caption:='Pause';
  basepoint:=10;
  horseanim:=0;
  br:=False; //removing game stop

   if money-bet<0 then begin     //not enough money
    bet:=Money;
    Money:=0;
    Updatelbls;
  end else money:=money-bet;
  Updatelbls;   //updating the UI
  


  betani:=True;
  Timer2.Enabled:=True;

    // assigning horse speeds
    repeat
      randomize;
      a[1]:=Random(3)-(Random(10)/10);
    until (a[1]>=0.9);

    repeat
      repeat
        randomize;
        a[2]:=Random(3)-(Random(10)/10);
      until (a[2]>=0.9);
    until (a[2]<>a[1]) ;

    repeat
      repeat
        randomize;
        a[3]:=Random(3)-(Random(10)/10);
      until (a[3]>=0.9);
    until (a[3]<>a[1]) and (a[3]<>a[2]);

    repeat
      repeat
        randomize;
        a[4]:=Random(3)-(Random(10)/10);
      until (a[4]>=0.9);
    until (a[4]<>a[1]) and (a[4]<>a[2]) and (a[4]<>a[3]);

    Button4.Enabled:=False;
    Button5.Enabled:=False;
    RadioGroup1.Enabled:=False;
    Button3.Enabled:=True;
    Edit1.Enabled:=False;
    stand:=False; //Start the race
end;

procedure TForm4.Edit1Change(Sender: TObject);
var
  i:Integer;
  nums:set of Char;
  s:string;
begin
  if Edit1.Text<>'' then begin //continuing only if row's not empty

    nums:= ['0','1','2','3','4','5','6','7','8','9'];
    s:=Edit1.text;
    for i:=1 to length(Edit1.Text) do begin //deleting a symbol if not a number
      if not(s[i] in nums) then begin
        Delete(s,i,1);
        Edit1.Text:=s;
      end;
    end;

    if money-strtoint(Edit1.Text)<0 then begin     //not enough money
      bet:=Money;
      Updatelbls;
    end;

    Bet:=strtoint(Edit1.text);
    Updatelbls;
  end;
end;

procedure TForm4.RadioGroup1Click(Sender: TObject);
begin
  HorseNum:=RadioGroup1.ItemIndex+1;
  Updatelbls;
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
  PanelMenu.Visible:=True;
  PanelGame.Visible:=False;
  Timer1.Enabled:=True;
  RadioGroup1.Enabled:=True;
  Edit1.Enabled:=True;
end;

procedure TForm4.Button3Click(Sender: TObject);  //pause
begin
  pause:=(Pause+1)mod 2;
  Timer1.Enabled:=Boolean(pause);
  if Boolean(pause)= False then begin
    Button5.Caption:='Start over';
    Button3.Caption:='Continue';
    Button5.Enabled:=True;
    Button4.Enabled:=True;
    Button6.Enabled:=False;
  end else begin
    Button5.Caption:='Start';
    Button3.Caption:='Pause';
    Button5.Enabled:=False;
    Button4.Enabled:=False;
    Button6.Enabled:=True;
  end;
end;

procedure TForm4.Button6Click(Sender: TObject);
var
  i:Integer;
begin
  Button5.Caption:='Start';
  Button3.Caption:='Pause';
  stand:=True;
  betani:=False;
  Button6.Enabled:=False;
  for i:=1 to 4 do a[i]:=0;
  Button5.Enabled:=True;
  Button4.Enabled:=True;
  RadioGroup1.Enabled:=True;
  Button3.Enabled:=False;
  Edit1.Enabled:=true;
  flee:=True;
  Randomize;
  if Random(6)=3 then begin
    worl:=True;
    Inc(Wins);
    Money:=money+2*bet;
  end else begin
    worl:=False;
    Inc(loses);
  end;
  Timer2.Enabled:=True;

  with PaintBox1, Canvas do begin
    Brush.Style:=bsSolid;
    Brush.Color:=RGB(240,240,240);
    FillRect(ClientRect);
  end;

  with PaintBox2, Canvas do begin
    Brush.Style:=bsSolid;
    Brush.Color:=RGB(240,240,240);
    FillRect(ClientRect);
  end;

  with PaintBox3, Canvas do begin
    Brush.Style:=bsSolid;
    Brush.Color:=RGB(240,240,240);
    FillRect(ClientRect);
  end;

  with PaintBox4, Canvas do begin
    Brush.Style:=bsSolid;
    Brush.Color:=RGB(240,240,240);
    FillRect(ClientRect);
  end;

  if pause=0 then begin
    pause:=(Pause+1)mod 2;
    Timer1.Enabled:=Boolean(pause);
    Button5.Caption:='Start';
    Button3.Caption:='Pause';
    Button5.Enabled:=True;
    Button4.Enabled:=True;
    end;

end;

procedure TForm4.Timer2Timer(Sender: TObject);
begin
  Inc(uppoint);
  if betani=True then betanim() else begin
  Inc(upanim);
  if upanim>30 then upanim:=0;
  if worl=True then Win() else Lose();
  end;
end;




end.
