unit uCons_Material;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase_Consulta, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Datasnap.Provider, Datasnap.DBClient,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TfrCons_Material = class(TfrBase_Consulta)
    qrCodigoDescripcion: TStringField;
    qrCodigoNombre: TStringField;
    qrCodigoCantidad: TFloatField;
    qrCodigoMedida: TStringField;
    procedure btnActualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCons_Material: TfrCons_Material;

implementation

{$R *.dfm}

uses udm,uMensage;



procedure TfrCons_Material.btnActualizarClick(Sender: TObject);
var
  lOk:Boolean;

begin
  inherited;

  IniciarFecha;

  if ValidarFechas(dtConfInicio.DateTime,dtConfFin.DateTime) then
  begin
    with qrCodigo do
    begin
      SQL.Clear;
      SQL.Add('select t.Descripcion,m.Nombre,sum(ms.Cantidad) as Cantidad,me.Nombre as Medida'+
              ' from tarea t ' +
              ' inner join materiales ms on ms.idTarea=t.id '+
              ' inner join material m on m.id=ms.idMaterial '+
              ' inner join medida me on me.id=m.idMedida ');
      case rgFecha.ItemIndex of
        0:begin
           SQL.Add('  where iniTarea = :paIniTar');
           ParamByName('paIniTar').Value := FormatDateTime('yyyy-MM-dd',dtConfInicio.Date);
        end;
        1:begin
           SQL.Add(' where t.iniTarea >= :paIniTar and t.iniTarea <= :paFinTar');
           ParamByName('paFinTar').Value := dtConfFin.DateTime;
           ParamByName('paIniTar').Value := dtConfInicio.DateTime;
        end;
        2:begin
           SQL.Add('  where t.iniTarea >= :paIniTar and t.iniTarea <= :paFinTar');
           ParamByName('paFinTar').Value := dtConfFin.DateTime;
           ParamByName('paIniTar').Value := dtConfInicio.DateTime;
        end;
        3:begin

        end;
      end;
      SQL.Add(' order by t.iniTarea ');
      SQL.Add(' group by m.Nombre ');
      Open;
     end;

  end
  else
  begin
    MsgAviso('LAS FECHAS SON INCORRECTAS');
    dt_Inicio.SetFocus;
  end;

end;

end.
