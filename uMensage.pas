unit uMensage;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase_Mantenimiento, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Datasnap.Provider, Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList,
  Vcl.ExtDlgs,System.IOUtils,System.Types;
procedure MsgError(Mensaje :string);
procedure MsgAviso(Mensaje :string);
function MsgConfirmacion(Mensaje :string):Boolean;

implementation
procedure MsgError(Mensaje: string);
begin

  MessageDlg(Mensaje, mtError,[mbOk], 0, mbOk);


end;

procedure MsgAviso(Mensaje: string);
begin

  MessageDlg(Mensaje, mtInformation,[mbOk], 0, mbOk);

end;

function MsgConfirmacion(Mensaje: string):Boolean;
begin
    if MessageDlg(Mensaje, mtWarning, [mbYes, mbNo], 0) = mrYes then
       Result:=True
    else
       Result:=False;

end;

end.



