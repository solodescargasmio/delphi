inherited frCons_Material: TfrCons_Material
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta Materiales Utilizados'
  ClientHeight = 506
  ClientWidth = 621
  FormStyle = fsMDIChild
  Visible = True
  WindowState = wsNormal
  ExplicitWidth = 627
  ExplicitHeight = 535
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnParametros: TPanel
    Width = 621
    Height = 186
    ExplicitWidth = 621
    ExplicitHeight = 186
    inherited Image1: TImage
      Left = 484
      Top = 10
      ExplicitLeft = 404
      ExplicitTop = 10
    end
    inherited edCodigo: TLabeledEdit
      Top = 32
      EditLabel.ExplicitLeft = 122
      EditLabel.ExplicitTop = 34
      EditLabel.ExplicitWidth = 43
      EditLabel.ExplicitHeight = 16
      Visible = False
      ExplicitTop = 32
    end
  end
  inherited pnDatos: TPanel
    Width = 621
    Height = 283
    ExplicitWidth = 621
    ExplicitHeight = 283
    inherited grConsulta: TDBGrid
      Width = 621
      DataSource = suCodigo
    end
  end
  inherited pnPie: TPanel
    Width = 634
    Height = 60
    ExplicitWidth = 634
    ExplicitHeight = 60
    inherited btnActualizar: TButton
      Visible = False
      OnClick = btnActualizarClick
    end
  end
  inherited qrCodigo: TFDQuery
    Connection = con.Mysql
    SQL.Strings = (
      'select t.Descripcion,m.Nombre,sum(ms.Cantidad) as Cantidad,'
      'me.Nombre as Medida'#10
      'from tarea t'#13#10#10
      'inner join materiales ms on ms.idTarea=t.id'
      ' '#10'inner join material m on m.id=ms.idMaterial'#10
      'inner join medida me on me.id=m.idMedida'#10#10
      'group by m.Nombre')
    object qrCodigoDescripcion: TStringField
      FieldName = 'Descripcion'
      Origin = 'Descripcion'
      Required = True
      Size = 100
    end
    object qrCodigoNombre: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Nombre'
      Origin = 'Nombre'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qrCodigoCantidad: TFloatField
      AutoGenerateValue = arDefault
      FieldName = 'Cantidad'
      Origin = 'Cantidad'
      ProviderFlags = []
      ReadOnly = True
    end
    object qrCodigoMedida: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Medida'
      Origin = 'Nombre'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  inherited FDQuery1: TFDQuery
    Connection = con.Mysql
  end
end
