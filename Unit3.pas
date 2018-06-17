unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm3 = class(TForm)
    Edit2: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Label3: TLabel;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Updatelbls();
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses
  Unit1, Unit2;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);    //Changing game parameters
begin
  if strtoint(Edit2.text)<0 then ShowMessage('bet cannot be negative') else begin
    if (StrToInt(Edit3.Text)<>1) and (StrToInt(Edit3.Text)<>2) and (StrToInt(Edit3.Text)<>3) and (StrToInt(Edit3.Text)<>4) then ShowMessage('There is no horse with this number in the game') else begin
      Form2.Bet:=strtoint(Edit2.text);
      Form2.HorseNum:=strtoint(Edit3.text);
      Form2.Show;
      Updatelbls;
      Close;
    end;
  end;
end;

procedure TForm3.Updatelbls();     //Updating the UI
begin
  Form2.Label2.Caption:=IntToStr(Form2.Money);
  Form2.Label4.Caption:=IntToStr(Form2.Bet);
  Form2.Label6.Caption:=IntToStr(Form2.Wins);
  Form2.Label8.Caption:=IntToStr(Form2.Loses);
  Form2.Label10.Caption:=inttostr(Form2.HorseNum);
end;



procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if strtoint(Edit2.text)<0 then ShowMessage('bet cannot be negative') else begin
    if (StrToInt(Edit3.Text)<>1) and (StrToInt(Edit3.Text)<>2) and (StrToInt(Edit3.Text)<>3) and (StrToInt(Edit3.Text)<>4) then ShowMessage('There is no horse with this number in the game') else begin
      Form2.Bet:=strtoint(Edit2.text);
      Form2.HorseNum:=strtoint(Edit3.text);
      Form2.Show;
      Updatelbls;
    end;
  end;
end;

end.
