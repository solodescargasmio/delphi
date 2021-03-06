unit uCons_Vehiculo;

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
  TfrCons_Vehiculo = class(TfrBase_Consulta)
    procedure FormActivate(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure qrCodigoAfterOpen(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCons_Vehiculo: TfrCons_Vehiculo;

implementation

{$R *.dfm}

uses udm;

procedure TfrCons_Vehiculo.edCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

   qrCodigo.Close;
  with qrCodigo do
  begin
    SQL.Clear;
    SQL.Text := 'select v.id,v.Matricula,v.Marca,v.Anio,concat(c.Nombre," ",c.Apellido) as Nombre, '+
                ' t.Descripcion,t.iniTarea,t.finTarea,sum(dp.Importe) as Presupuesto '+
                ' from vehiculo v '+
                ' left join cliente c on c.id=v.idCliente '+
                ' left join tarea t on t.idVehiculo=v.id '+
                ' left join detalle_presupuesto dp on dp.idTarea=t.id '+
                ' where v.Matricula like "%'+UpperCase(edCodigo.Text)+'%" or '+
                ' v.Marca like "%'+UpperCase(edCodigo.Text)+'%" or '+
                ' v.Anio like "%'+UpperCase(edCodigo.Text)+'%"';

    Open;
  end;



end;

procedure TfrCons_Vehiculo.FormActivate(Sender: TObject);
begin
  inherited;

  qrCodigo.Open;

end;



procedure TfrCons_Vehiculo.qrCodigoAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if not qrCodigo.IsEmpty then
  begin

  end;

end;

end.
