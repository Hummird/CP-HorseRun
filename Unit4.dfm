object Form4: TForm4
  Left = 65
  Top = 11
  BorderStyle = bsSingle
  Caption = 'Horse Run'
  ClientHeight = 681
  ClientWidth = 1264
  Color = clBtnFace
  Constraints.MinHeight = 720
  Constraints.MinWidth = 1280
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMenu: TPanel
    Left = 8
    Top = 8
    Width = 1249
    Height = 665
    Align = alCustom
    TabOrder = 0
    object PaintBoxMenu: TPaintBox
      Left = 8
      Top = 8
      Width = 649
      Height = 649
    end
    object Button1: TButton
      Left = 664
      Top = 8
      Width = 577
      Height = 321
      Caption = 'Start the game'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -96
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 664
      Top = 336
      Width = 577
      Height = 321
      Caption = 'Exit'
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -96
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object PanelGame: TPanel
    Tag = 8
    Left = 8
    Top = 8
    Width = 1249
    Height = 665
    Align = alCustom
    Caption = 'PanelGame'
    TabOrder = 1
    Visible = False
    object Panel3: TPanel
      Left = 0
      Top = 488
      Width = 1249
      Height = 177
      Align = alCustom
      TabOrder = 0
      object Label1: TLabel
        Left = 224
        Top = 80
        Width = 108
        Height = 23
        Caption = 'Your money:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 336
        Top = 80
        Width = 10
        Height = 23
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 200
        Top = 16
        Width = 27
        Height = 23
        Caption = 'Bet'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 248
        Top = 112
        Width = 100
        Height = 23
        Caption = 'Wins count:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 352
        Top = 112
        Width = 10
        Height = 23
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 272
        Top = 144
        Width = 105
        Height = 23
        Caption = 'Loses count:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 384
        Top = 144
        Width = 10
        Height = 23
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object PaintBox6: TPaintBox
        Left = 336
        Top = 48
        Width = 105
        Height = 31
      end
      object PaintBox7: TPaintBox
        Left = 352
        Top = 80
        Width = 65
        Height = 31
      end
      object PaintBox8: TPaintBox
        Left = 384
        Top = 112
        Width = 57
        Height = 31
      end
      object PaintBox10: TPaintBox
        Left = 456
        Top = 16
        Width = 49
        Height = 153
      end
      object PaintBox11: TPaintBox
        Left = 512
        Top = 16
        Width = 49
        Height = 153
      end
      object PaintBox12: TPaintBox
        Left = 568
        Top = 16
        Width = 49
        Height = 153
      end
      object PaintBox13: TPaintBox
        Left = 624
        Top = 16
        Width = 49
        Height = 153
      end
      object PaintBox14: TPaintBox
        Left = 680
        Top = 16
        Width = 49
        Height = 153
      end
      object PaintBox15: TPaintBox
        Left = 736
        Top = 16
        Width = 49
        Height = 153
      end
      object PaintBox16: TPaintBox
        Left = 792
        Top = 16
        Width = 49
        Height = 153
      end
      object PaintBox17: TPaintBox
        Left = 848
        Top = 16
        Width = 49
        Height = 153
      end
      object PaintBox18: TPaintBox
        Left = 904
        Top = 16
        Width = 49
        Height = 153
      end
      object PaintBox19: TPaintBox
        Left = 960
        Top = 16
        Width = 49
        Height = 153
      end
      object PaintBox9: TPaintBox
        Left = 576
        Top = 48
        Width = 306
        Height = 18
      end
      object PaintBox20: TPaintBox
        Left = 632
        Top = 72
        Width = 209
        Height = 39
      end
      object Edit1: TEdit
        Left = 200
        Top = 40
        Width = 73
        Height = 31
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = Edit1Change
      end
      object RadioGroup1: TRadioGroup
        Left = 8
        Top = 8
        Width = 185
        Height = 161
        Caption = 'Bet on'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'Horse '#185'1'
          'Horse '#185'2'
          'Horse '#185'3'
          'Horse '#185'4')
        ParentFont = False
        TabOrder = 1
        OnClick = RadioGroup1Click
      end
      object Button3: TButton
        Left = 1072
        Top = 56
        Width = 169
        Height = 25
        Caption = 'Pause'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 1072
        Top = 136
        Width = 169
        Height = 25
        Caption = 'Exit to menu'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 1072
        Top = 16
        Width = 169
        Height = 25
        Caption = 'Start'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 1072
        Top = 96
        Width = 169
        Height = 25
        Caption = 'Flee'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = Button6Click
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 1249
      Height = 489
      Align = alCustom
      TabOrder = 1
      object Label11: TLabel
        Left = 8
        Top = 8
        Width = 52
        Height = 116
        Caption = '1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -96
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 8
        Top = 128
        Width = 52
        Height = 116
        Caption = '2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -96
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 8
        Top = 248
        Width = 52
        Height = 116
        Caption = '3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -96
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 8
        Top = 368
        Width = 52
        Height = 116
        Caption = '4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -96
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object PaintBox5: TPaintBox
        Left = 1208
        Top = 8
        Width = 50
        Height = 475
      end
      object PaintBox1: TPaintBox
        Left = 64
        Top = 8
        Width = 1145
        Height = 115
      end
      object PaintBox2: TPaintBox
        Left = 64
        Top = 128
        Width = 1145
        Height = 115
      end
      object PaintBox3: TPaintBox
        Left = 64
        Top = 248
        Width = 1145
        Height = 115
      end
      object PaintBox4: TPaintBox
        Left = 64
        Top = 368
        Width = 1145
        Height = 115
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 8
    Top = 8
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer2Timer
    Left = 40
    Top = 8
  end
end
