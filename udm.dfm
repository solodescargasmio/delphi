object con: Tcon
  Left = 0
  Top = 0
  Caption = 'con'
  ClientHeight = 318
  ClientWidth = 331
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Mysql: TFDConnection
    Params.Strings = (
      'Database=tapiceria'
      'User_Name=root'
      'Password=eranoespico1234'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 48
  end
  object Mysql_Web: TFDConnection
    LoginPrompt = False
    Left = 184
    Top = 48
  end
  object FDCommand1: TFDCommand
    Connection = Mysql
    Left = 48
    Top = 128
  end
  object FDCommand2: TFDCommand
    Connection = Mysql
    Left = 192
    Top = 128
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Left = 48
    Top = 232
  end
  object ADOCommand1: TADOCommand
    Parameters = <>
    Left = 192
    Top = 224
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 128
    Top = 184
  end
  object FDQuery1: TFDQuery
    Connection = Mysql
    Left = 96
    Top = 16
  end
  object FDQuery2: TFDQuery
    Connection = Mysql
    Left = 264
    Top = 32
  end
end
