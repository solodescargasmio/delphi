inherited frCons_Medidas: TfrCons_Medidas
  Caption = 'Consulta Medidas'
  ClientHeight = 383
  ClientWidth = 469
  FormStyle = fsMDIChild
  Visible = True
  WindowState = wsNormal
  ExplicitWidth = 485
  ExplicitHeight = 422
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnParametros: TPanel
    Top = -14
    Width = 469
    Height = 151
    ExplicitTop = -14
    ExplicitWidth = 469
    ExplicitHeight = 151
    inherited Image1: TImage
      Left = 290
      Top = -25
      Width = 179
      Height = 175
      ExplicitLeft = 352
      ExplicitTop = -25
      ExplicitWidth = 179
      ExplicitHeight = 175
    end
    inherited rgFecha: TRadioGroup
      Visible = False
    end
    inherited edCodigo: TLabeledEdit
      Visible = False
    end
    inherited pnPeriodo: TPanel
      Visible = False
    end
  end
  inherited pnDatos: TPanel
    Top = 127
    Width = 469
    Height = 210
    ExplicitTop = 127
    ExplicitWidth = 469
    ExplicitHeight = 210
    inherited grConsulta: TDBGrid
      Top = 16
      Height = 257
      DataSource = suCodigo
      Columns = <
        item
          Expanded = False
          FieldName = 'Nombre'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Simbolo'
          Visible = True
        end>
    end
  end
  inherited pnPie: TPanel
    Top = 343
    Width = 482
    Height = 42
    ExplicitTop = 343
    ExplicitWidth = 482
    ExplicitHeight = 42
    inherited btnActualizar: TButton
      Left = 273
      Top = 7
      Enabled = False
      ExplicitLeft = 273
      ExplicitTop = 7
    end
    inherited btnCancelar: TButton
      Left = 371
      Top = 7
      Enabled = False
      ExplicitLeft = 371
      ExplicitTop = 7
    end
  end
  inherited qrCodigo: TFDQuery
    Connection = con.Mysql
    SQL.Strings = (
      'Select * from medida')
    object qrCodigoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrCodigoNombre: TStringField
      FieldName = 'Nombre'
      Origin = 'Nombre'
      Required = True
    end
    object qrCodigoSimbolo: TStringField
      FieldName = 'Simbolo'
      Origin = 'Simbolo'
      Required = True
      Size = 5
    end
  end
  inherited suCodigo: TDataSource
    DataSet = qrCodigo
  end
  inherited FDQuery1: TFDQuery
    Left = 216
    Top = 200
  end
  inherited DataSource1: TDataSource
    Left = 272
    Top = 184
  end
end
