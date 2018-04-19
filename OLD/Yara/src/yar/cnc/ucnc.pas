unit UCnc;

{$mode objfpc}{$H+}

interface

uses
  SysUtils;

type
  TCommandString = String[255];
  TRpmSpeed = 0 .. 30000;

{$Include tacommand.pas}
{$Include tspindlespeed.pas}

implementation

{$Include tacommandimpl.pas}
{$Include tspindlespeedimpl.pas}

end.

