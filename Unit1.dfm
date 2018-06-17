object Form1: TForm1
  Left = 510
  Top = 270
  BorderStyle = bsSingle
  Caption = 'Main menu'
  ClientHeight = 169
  ClientWidth = 250
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 8
    Top = 8
    Width = 153
    Height = 153
  end
  object Button1: TButton
    Left = 168
    Top = 8
    Width = 75
    Height = 73
    Caption = 'Start'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button3: TButton
    Left = 168
    Top = 88
    Width = 75
    Height = 73
    Caption = 'Quit'
    TabOrder = 1
    OnClick = Button3Click
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 16
    Top = 16
  end
end
