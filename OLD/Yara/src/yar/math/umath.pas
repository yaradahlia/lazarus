unit UMath;

{$mode objfpc}{$H+}

interface

uses
  SysUtils;

Type
  TIntU20 = 0 .. 20;

function factorial(const value: TIntU20): QWord;
function power(const base, exponent: Extended): Extended;

implementation

function factorial(const value: TIntU20): QWord;
var i: TIntU20;
begin
  result := 1;
  if value > 1 then
    for i := 2 to value do
        result := result * i;
  exit(result);
end;

function power(const base, exponent: Extended): Extended;
begin
  result := 1;
  if exponent <> 0 then
  begin
    result := 0;
    if base <> 0 then
    begin
      result := base;
      if exponent <> 1 then
        result := exp(exponent * ln(base));
    end;
  end;
  exit(result);
end;

end.

