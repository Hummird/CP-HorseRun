unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm2 = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    PaintBox1: TPaintBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    PaintBox2: TPaintBox;
    PaintBox3: TPaintBox;
    PaintBox4: TPaintBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label20: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Race();
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    Bet:Integer;
    Money:Integer;
    Wins:Integer;
    Loses:Integer;
    HorseNum:Integer;  //betting on this number
    basepoint:Integer; //hose position in race
    a:array[1..4] of Real; //horse speeds
    br:Boolean;  //race stop handler
    pause:Integer;  //pause handler
    worl:Boolean;  //win or lose
    horseanim:integer; //tooggler horse animation images
    q:array[1..4] of Integer; //animation shift
    n:byte;//victorious horse
  end;

var
  Form2: TForm2;


implementation

uses
  Unit1, Unit3;

{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.show;
end;



procedure TForm2.FormCreate(Sender: TObject); //assigning default values
begin
  Money:=100;
  Wins:=0;
  Loses:=0;
  basepoint:=10;
  pause:=1;
  Timer1.Enabled:=False;
  Button4.Enabled:=False;
  Button2.Enabled:=True;
  Form3.Updatelbls();
end;

procedure TForm2.Button3Click(Sender: TObject);   //opening settings
begin
 Form3.Show;
end;

procedure TForm2.Button1Click(Sender: TObject);     //Exit to menu
begin
  Form1.Show;
  Form2.Close;
end;

procedure TForm2.Race();   //actually race
var
  i:Integer;
begin


    {Drawing horse animations}

    with PaintBox1, Canvas do begin
      Brush.color:=rgb(240,240,240);
      Brush.Style := bsSolid;
      FillRect(ClientRect);
      Pen.Color:=clBlack;
      Pen.Style:=psSolid;
      Brush.color:=clBlue;
      if horseanim-q[1]<20 then
        Polygon([
           Point(Round(basepoint*a[1])+50,92)
          ,Point(Round(basepoint*a[1])+45,97)
          ,Point(Round(basepoint*a[1])+25,84)
          ,Point(Round(basepoint*a[1])+33,65)
          ,Point(Round(basepoint*a[1])+25,57)
          ,Point(Round(basepoint*a[1])+17,70)
          ,Point(Round(basepoint*a[1])+9,68)
          ,Point(Round(basepoint*a[1])+17,49)
          ,Point(Round(basepoint*a[1])+25,49)
          ,Point(Round(basepoint*a[1])+49,41)
          ,Point(Round(basepoint*a[1])+65,49)
          ,Point(Round(basepoint*a[1])+73,33)
          ,Point(Round(basepoint*a[1])+89,25)
          ,Point(Round(basepoint*a[1])+105,41)
          ,Point(Round(basepoint*a[1])+97,49)
          ,Point(Round(basepoint*a[1])+81,43)
          ,Point(Round(basepoint*a[1])+77,65)
          ,Point(Round(basepoint*a[1])+89,73)
          ,Point(Round(basepoint*a[1])+94,80)
          ,Point(Round(basepoint*a[1])+100,92)
          ,Point(Round(basepoint*a[1])+95,97)
          ,Point(Round(basepoint*a[1])+87,85)
          ,Point(Round(basepoint*a[1])+81,73)
          ,Point(Round(basepoint*a[1])+57,65)
          ,Point(Round(basepoint*a[1])+37,69)
          ,Point(Round(basepoint*a[1])+33,81)
        ]) else
        Polygon([
           Point(Round(basepoint*a[1])+15,97)
          ,Point(Round(basepoint*a[1])+10,92)
          ,Point(Round(basepoint*a[1])+25,81)
          ,Point(Round(basepoint*a[1])+33,65)
          ,Point(Round(basepoint*a[1])+25,57)
          ,Point(Round(basepoint*a[1])+17,70)
          ,Point(Round(basepoint*a[1])+9,68)
          ,Point(Round(basepoint*a[1])+17,49)
          ,Point(Round(basepoint*a[1])+25,49)
          ,Point(Round(basepoint*a[1])+49,41)
          ,Point(Round(basepoint*a[1])+65,49)
          ,Point(Round(basepoint*a[1])+73,33)
          ,Point(Round(basepoint*a[1])+89,25)
          ,Point(Round(basepoint*a[1])+105,41)
          ,Point(Round(basepoint*a[1])+97,49)
          ,Point(Round(basepoint*a[1])+81,43)
          ,Point(Round(basepoint*a[1])+77,65)
          ,Point(Round(basepoint*a[1])+89,73)
          ,Point(Round(basepoint*a[1])+94,85)
          ,Point(Round(basepoint*a[1])+83,97)
          ,Point(Round(basepoint*a[1])+78,92)
          ,Point(Round(basepoint*a[1])+87,80)
          ,Point(Round(basepoint*a[1])+81,73)
          ,Point(Round(basepoint*a[1])+57,65)
          ,Point(Round(basepoint*a[1])+37,69)
          ,Point(Round(basepoint*a[1])+28,84)
        ]);
    end;
    with PaintBox2, Canvas do begin
      Brush.color:=rgb(240,240,240);
      Brush.Style := bsSolid;
      FillRect(ClientRect);
      Pen.Color:=clBlack;
      Pen.Style:=psSolid;
      Brush.color:=clGreen;
      if horseanim-q[2]<20 then   // fist image
        Polygon([
           Point(Round(basepoint*a[2])+50,92)
          ,Point(Round(basepoint*a[2])+45,97)
          ,Point(Round(basepoint*a[2])+25,84)
          ,Point(Round(basepoint*a[2])+33,65)
          ,Point(Round(basepoint*a[2])+25,57)
          ,Point(Round(basepoint*a[2])+17,70)
          ,Point(Round(basepoint*a[2])+9,68)
          ,Point(Round(basepoint*a[2])+17,49)
          ,Point(Round(basepoint*a[2])+25,49)
          ,Point(Round(basepoint*a[2])+49,41)
          ,Point(Round(basepoint*a[2])+65,49)
          ,Point(Round(basepoint*a[2])+73,33)
          ,Point(Round(basepoint*a[2])+89,25)
          ,Point(Round(basepoint*a[2])+105,41)
          ,Point(Round(basepoint*a[2])+97,49)
          ,Point(Round(basepoint*a[2])+81,43)
          ,Point(Round(basepoint*a[2])+77,65)
          ,Point(Round(basepoint*a[2])+89,73)
          ,Point(Round(basepoint*a[2])+94,80)
          ,Point(Round(basepoint*a[2])+100,92)
          ,Point(Round(basepoint*a[2])+95,97)
          ,Point(Round(basepoint*a[2])+87,85)
          ,Point(Round(basepoint*a[2])+81,73)
          ,Point(Round(basepoint*a[2])+57,65)
          ,Point(Round(basepoint*a[2])+37,69)
          ,Point(Round(basepoint*a[2])+33,81)
        ]) else                  // second image
        Polygon([
           Point(Round(basepoint*a[2])+15,97)
          ,Point(Round(basepoint*a[2])+10,92)
          ,Point(Round(basepoint*a[2])+25,81)
          ,Point(Round(basepoint*a[2])+33,65)
          ,Point(Round(basepoint*a[2])+25,57)
          ,Point(Round(basepoint*a[2])+17,70)
          ,Point(Round(basepoint*a[2])+9,68)
          ,Point(Round(basepoint*a[2])+17,49)
          ,Point(Round(basepoint*a[2])+25,49)
          ,Point(Round(basepoint*a[2])+49,41)
          ,Point(Round(basepoint*a[2])+65,49)
          ,Point(Round(basepoint*a[2])+73,33)
          ,Point(Round(basepoint*a[2])+89,25)
          ,Point(Round(basepoint*a[2])+105,41)
          ,Point(Round(basepoint*a[2])+97,49)
          ,Point(Round(basepoint*a[2])+81,43)
          ,Point(Round(basepoint*a[2])+77,65)
          ,Point(Round(basepoint*a[2])+89,73)
          ,Point(Round(basepoint*a[2])+94,85)
          ,Point(Round(basepoint*a[2])+83,97)
          ,Point(Round(basepoint*a[2])+78,92)
          ,Point(Round(basepoint*a[2])+87,80)
          ,Point(Round(basepoint*a[2])+81,73)
          ,Point(Round(basepoint*a[2])+57,65)
          ,Point(Round(basepoint*a[2])+37,69)
          ,Point(Round(basepoint*a[2])+28,84)
        ]);
    end;
     with PaintBox3, Canvas do begin
      Brush.color:=rgb(240,240,240);
      Brush.Style := bsSolid;
      FillRect(ClientRect);
      Pen.Color:=clBlack;
      Pen.Style:=psSolid;
      Brush.color:=clRed;
      if horseanim-q[3]<20 then  // first image
        Polygon([
           Point(Round(basepoint*a[3])+50,92)
          ,Point(Round(basepoint*a[3])+45,97)
          ,Point(Round(basepoint*a[3])+25,84)
          ,Point(Round(basepoint*a[3])+33,65)
          ,Point(Round(basepoint*a[3])+25,57)
          ,Point(Round(basepoint*a[3])+17,70)
          ,Point(Round(basepoint*a[3])+9,68)
          ,Point(Round(basepoint*a[3])+17,49)
          ,Point(Round(basepoint*a[3])+25,49)
          ,Point(Round(basepoint*a[3])+49,41)
          ,Point(Round(basepoint*a[3])+65,49)
          ,Point(Round(basepoint*a[3])+73,33)
          ,Point(Round(basepoint*a[3])+89,25)
          ,Point(Round(basepoint*a[3])+105,41)
          ,Point(Round(basepoint*a[3])+97,49)
          ,Point(Round(basepoint*a[3])+81,43)
          ,Point(Round(basepoint*a[3])+77,65)
          ,Point(Round(basepoint*a[3])+89,73)
          ,Point(Round(basepoint*a[3])+94,80)
          ,Point(Round(basepoint*a[3])+100,92)
          ,Point(Round(basepoint*a[3])+95,97)
          ,Point(Round(basepoint*a[3])+87,85)
          ,Point(Round(basepoint*a[3])+81,73)
          ,Point(Round(basepoint*a[3])+57,65)
          ,Point(Round(basepoint*a[3])+37,69)
          ,Point(Round(basepoint*a[3])+33,81)
        ]) else         // second image
        Polygon([
           Point(Round(basepoint*a[3])+15,97)
          ,Point(Round(basepoint*a[3])+10,92)
          ,Point(Round(basepoint*a[3])+25,81)
          ,Point(Round(basepoint*a[3])+33,65)
          ,Point(Round(basepoint*a[3])+25,57)
          ,Point(Round(basepoint*a[3])+17,70)
          ,Point(Round(basepoint*a[3])+9,68)
          ,Point(Round(basepoint*a[3])+17,49)
          ,Point(Round(basepoint*a[3])+25,49)
          ,Point(Round(basepoint*a[3])+49,41)
          ,Point(Round(basepoint*a[3])+65,49)
          ,Point(Round(basepoint*a[3])+73,33)
          ,Point(Round(basepoint*a[3])+89,25)
          ,Point(Round(basepoint*a[3])+105,41)
          ,Point(Round(basepoint*a[3])+97,49)
          ,Point(Round(basepoint*a[3])+81,43)
          ,Point(Round(basepoint*a[3])+77,65)
          ,Point(Round(basepoint*a[3])+89,73)
          ,Point(Round(basepoint*a[3])+94,85)
          ,Point(Round(basepoint*a[3])+83,97)
          ,Point(Round(basepoint*a[3])+78,92)
          ,Point(Round(basepoint*a[3])+87,80)
          ,Point(Round(basepoint*a[3])+81,73)
          ,Point(Round(basepoint*a[3])+57,65)
          ,Point(Round(basepoint*a[3])+37,69)
          ,Point(Round(basepoint*a[3])+28,84)
        ]);
    end;
     with PaintBox4, Canvas do begin
      Brush.color:=rgb(240,240,240);
      Brush.Style := bsSolid;
      FillRect(ClientRect);
      Pen.Color:=clBlack;
      Pen.Style:=psSolid;
      Brush.color:=clFuchsia;
      if horseanim-q[4]<20 then // first image
        Polygon([
           Point(Round(basepoint*a[4])+50,92)
          ,Point(Round(basepoint*a[4])+45,97)
          ,Point(Round(basepoint*a[4])+25,84)
          ,Point(Round(basepoint*a[4])+33,65)
          ,Point(Round(basepoint*a[4])+25,57)
          ,Point(Round(basepoint*a[4])+17,70)
          ,Point(Round(basepoint*a[4])+9,68)
          ,Point(Round(basepoint*a[4])+17,49)
          ,Point(Round(basepoint*a[4])+25,49)
          ,Point(Round(basepoint*a[4])+49,41)
          ,Point(Round(basepoint*a[4])+65,49)
          ,Point(Round(basepoint*a[4])+73,33)
          ,Point(Round(basepoint*a[4])+89,25)
          ,Point(Round(basepoint*a[4])+105,41)
          ,Point(Round(basepoint*a[4])+97,49)
          ,Point(Round(basepoint*a[4])+81,43)
          ,Point(Round(basepoint*a[4])+77,65)
          ,Point(Round(basepoint*a[4])+89,73)
          ,Point(Round(basepoint*a[4])+94,80)
          ,Point(Round(basepoint*a[4])+100,92)
          ,Point(Round(basepoint*a[4])+95,97)
          ,Point(Round(basepoint*a[4])+87,85)
          ,Point(Round(basepoint*a[4])+81,73)
          ,Point(Round(basepoint*a[4])+57,65)
          ,Point(Round(basepoint*a[4])+37,69)
          ,Point(Round(basepoint*a[4])+33,81)
        ]) else     // second image
        Polygon([
           Point(Round(basepoint*a[4])+15,97)
          ,Point(Round(basepoint*a[4])+10,92)
          ,Point(Round(basepoint*a[4])+25,81)
          ,Point(Round(basepoint*a[4])+33,65)
          ,Point(Round(basepoint*a[4])+25,57)
          ,Point(Round(basepoint*a[4])+17,70)
          ,Point(Round(basepoint*a[4])+9,68)
          ,Point(Round(basepoint*a[4])+17,49)
          ,Point(Round(basepoint*a[4])+25,49)
          ,Point(Round(basepoint*a[4])+49,41)
          ,Point(Round(basepoint*a[4])+65,49)
          ,Point(Round(basepoint*a[4])+73,33)
          ,Point(Round(basepoint*a[4])+89,25)
          ,Point(Round(basepoint*a[4])+105,41)
          ,Point(Round(basepoint*a[4])+97,49)
          ,Point(Round(basepoint*a[4])+81,43)
          ,Point(Round(basepoint*a[4])+77,65)
          ,Point(Round(basepoint*a[4])+89,73)
          ,Point(Round(basepoint*a[4])+94,85)
          ,Point(Round(basepoint*a[4])+83,97)
          ,Point(Round(basepoint*a[4])+78,92)
          ,Point(Round(basepoint*a[4])+87,80)
          ,Point(Round(basepoint*a[4])+81,73)
          ,Point(Round(basepoint*a[4])+57,65)
          ,Point(Round(basepoint*a[4])+37,69)
          ,Point(Round(basepoint*a[4])+28,84)
        ]);
    end;

    for i:=1 to 4 do begin //handling race stop upon horse finishing
      if (Round(basepoint*a[i]))>=(PaintBox1.Width-10) then
        if i=HorseNum then begin     //win
            money:=money+bet*2;
            wins:=wins+1;
            Form3.Updatelbls;
            worl:=True;//player won
            br:=true;//loop break
          end
        else begin  //lose
          loses:=loses+1;
          n:=i;
          Form3.Updatelbls;
          worl:=false;//player lost
          br:=True;//loop break
          end;
      if br=True then Break;
    end;

    if br=True then begin  //race stop
      Button2.Caption:='Start';
      Button4.Caption:='Pause';
      Timer1.Enabled:=False;
      for i:=1 to 4 do a[i]:=0;
      Button4.Enabled:=False;
      Button2.Enabled:=True;
      Button3.Enabled:=True;
      Button1.Enabled:=True;
      if worl=True then ShowMessage('You won! Congrats') else ShowMessage('You lost :( Horse ¹'+inttostr(n)+' won');
      Exit;
    end;
end;


procedure TForm2.Timer1Timer(Sender: TObject);
var
  i:integer;
begin
  Randomize;
  for i:= 1 to 4 do if Random(3000) = 1328 then a[i]:=a[1]+1.5;//sudden acceleration
  Inc(horseanim);
  if horseanim>40 then horseanim:=0;
  Inc(basepoint); //increasing base point
  Race;           //race start
end;

procedure TForm2.Button2Click(Sender: TObject); //game start handler
var
  i:Integer;
begin
  for i:=1 to 4 do q[i]:=random(15); //assigning animation shift
  pause:=1;
  Button2.Caption:='Start';
  Button4.Caption:='Pause';
  basepoint:=10;
  horseanim:=0;
  br:=False; //removing race stop
  form3.Updatelbls;   //updating UI
  if money-bet<=0 then begin     //Not enough money
    ShowMessage('Not enough money. Your bet was decreased');
    bet:=Money;
    money:=0;
    Form3.Updatelbls;
  end else begin
    money:=money-bet;
    Form3.Updatelbls;
  end;

    //assigning horse speeds
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

    Button2.Enabled:=False;
    Button3.Enabled:=False;
    Button1.Enabled:=False;
    Button4.Enabled:=True;

    Timer1.Enabled:=True; //race start
end;


procedure TForm2.Button4Click(Sender: TObject); //pause
begin
  Button2.Caption:='Start over';
  Button4.Caption:='Continue';
  pause:=(Pause+1)mod 2;
  Timer1.Enabled:=Boolean(pause);
  Button2.Enabled:=True;
  Button1.Enabled:=True;
  Button2.Enabled:=False;
end;

end.

