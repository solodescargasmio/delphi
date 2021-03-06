unit udm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  Data.Win.ADODB, FireDAC.Comp.Client, Data.DB, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  Tcon = class(TForm)
    Mysql: TFDConnection;
    Mysql_Web: TFDConnection;
    FDCommand1: TFDCommand;
    FDCommand2: TFDCommand;
    ADOConnection1: TADOConnection;
    ADOCommand1: TADOCommand;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  con: Tcon;
  uCodigoAyuda : Integer;
implementation

{$R *.dfm}

end.
