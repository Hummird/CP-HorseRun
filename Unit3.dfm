object Form3: TForm3
  Left = 599
  Top = 296
  BorderStyle = bsSingle
  Caption = 'Settings'
  ClientHeight = 104
  ClientWidth = 230
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 16
    Height = 13
    Caption = 'Bet'
  end
  object Label3: TLabel
    Left = 16
    Top = 40
    Width = 67
    Height = 13
    Caption = 'Horse number'
  end
  object Edit2: TEdit
    Left = 104
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '10'
  end
  object Button1: TButton
    Left = 72
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit3: TEdit
    Left = 104
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '1'
  end
end
