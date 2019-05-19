unit uCons_Cliente;

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
  TfrCons_Cliente = class(TfrBase_Consulta)
    qrCodigoid: TFDAutoIncField;
    qrCodigoCI: TStringField;
    qrCodigoNombre: TStringField;
    qrCodigoDireccion: TStringField;
    qrCodigoTelefono: TStringField;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    qrVehiculo: TFDQuery;
    suVehiculo: TDataSource;
    qrVehiculoid: TFDAutoIncField;
    qrVehiculoMatricula: TStringField;
    qrVehiculoidCliente: TIntegerField;
    qrVehiculoTipo: TStringField;
    qrVehiculoMarca: TStringField;
    qrVehiculoAnio: TStringField;
    qrVehiculoDescripcion: TMemoField;
    FDQuery1id: TFDAutoIncField;
    FDQuery1idVehiculo: TIntegerField;
    FDQuery1Descripcion: TStringField;
    FDQuery1Comentario: TStringField;
    FDQuery1Presupuesto: TSingleField;
    FDQuery1iniTarea: TDateField;
    FDQuery1finTarea: TDateField;
    FDQuery1Estado: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure grConsultaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qrVehiculoAfterOpen(DataSet: TDataSet);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure qrCodigoAfterOpen(DataSet: TDataSet);
    procedure qrCodigoAfterClose(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure IniPant;
  public
    { Public declarations }
  end;

var
  frCons_Cliente: TfrCons_Cliente;

implementation

{$R *.dfm}
uses udm;
procedure TfrCons_Cliente.btnCancelarClick(Sender: TObject);
begin
  inherited;

  IniPant;

end;

procedure TfrCons_Cliente.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  nId : Integer;
begin
  inherited;

  nId := qrVehiculo.FieldByName('id').AsInteger;
  with FDQuery1 do
  begin
    Close;
    ParamByName('paId').Value := nId;
    Open;
  end;

end;

procedure TfrCons_Cliente.edCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  qrCodigo.Close;
  with qrCodigo do
  begin
    SQL.Clear;
    SQL.Text := 'select id,CI,concat(Nombre," ",Apellido) as Nombre, '+
                ' concat(Direccion,"  ",Ciudad) as Direccion, Telefono '+
                ' from cliente '+
                ' where CI like "%'+UpperCase(edCodigo.Text)+'%" or '+
                ' Apellido like "%'+UpperCase(edCodigo.Text)+'%"';

    Open;
  end;

end;

procedure TfrCons_Cliente.FormCreate(Sender: TObject);
begin
  inherited;

  qrCodigo.Open;

end;


procedure TfrCons_Cliente.grConsultaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  nId : Integer;
begin
  inherited;

  nId := qrCodigo.FieldByName('id').AsInteger;
  with qrVehiculo do
  begin
    Close;
    ParamByName('paId').Value := nId;
    Open;
  end;

end;

procedure TfrCons_Cliente.IniPant;
begin

  qrCodigo.Close;
  qrVehiculo.Close;
  FDQuery1.Close;
  edCodigo.Clear;
  edCodigo.SetFocus;

end;

procedure TfrCons_Cliente.qrCodigoAfterClose(DataSet: TDataSet);
begin
  inherited;

  qrVehiculo.Close;
  FDQuery1.Close;


end;

procedure TfrCons_Cliente.qrCodigoAfterOpen(DataSet: TDataSet);
var
  nId : Integer;

begin
  inherited;

  if not qrCodigo.IsEmpty then
  begin
     qrCodigo.First;
     nId := qrCodigo.FieldByName('id').AsInteger;
    with qrVehiculo do
    begin
      Close;
      ParamByName('paId').Value := nId;
      Open;
    end;
  end;



end;

procedure TfrCons_Cliente.qrVehiculoAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if not qrVehiculo.IsEmpty then
  begin
    with FDQuery1 do
    begin
      Close;
      ParamByName('paId').Value := qrCodigoid.AsInteger;
      Open;
    end;
  end;

end;

end.
