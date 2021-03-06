unit uCons_Medidas;

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
  TfrCons_Medidas = class(TfrBase_Consulta)
    qrCodigoid: TIntegerField;
    qrCodigoNombre: TStringField;
    qrCodigoSimbolo: TStringField;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frCons_Medidas: TfrCons_Medidas;

implementation
uses udm;
{$R *.dfm}

procedure TfrCons_Medidas.FormActivate(Sender: TObject);
begin
  inherited;

  qrCodigo.Open;

end;

end.
