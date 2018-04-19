unit UUtils;

{$mode objfpc}{$H+}

interface

uses
  SysUtils;

  function ifThen(const expression: Boolean; const trueResult: Byte; const falseResult: Byte): Byte;

implementation

function ifThen(const expression: Boolean; const trueResult: Byte; const falseResult: Byte): Byte;
begin
  result := trueResult;
  if not expression then
  begin
    result := falseResult;
  end;
  exit(result);
end;

end.

