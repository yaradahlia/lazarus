unit UMath;

{$mode objfpc}{$H+}

interface

uses
  SysUtils;

type
  TIntExtendedU = LongInt;
  TIntU20 = 0 .. 20;

function factorial(const n: TIntU20): QWord;

implementation

function factorial(const n: TIntU20): QWord;
var i: Byte;
begin
  result := 1;
  if n > 1 then
  begin
    for i := 2 to n do
    begin
      result := result * i;
    end;
  end;
  exit(result);
end;

end.

