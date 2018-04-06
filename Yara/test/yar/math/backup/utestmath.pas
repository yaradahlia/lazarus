unit UTestMath;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, UMath;

procedure testFactorial();
procedure testPower();

implementation

procedure testFactorial();
var value: UMath.TIntU20;
begin
  WriteLn('UMath.factorial test...');
  Write('value [', low(UMath.TIntU20), ', ', high(UMath.TIntU20), '] = ');
  Read(value);
  WriteLn();
  WriteLn('UMath.factorial(', value , ') = ', UMath.factorial(value));
end;

procedure testPower();
begin
  WriteLn('sqrt(2)= ', UMath.power(2, 1/2));
  Writeln('2^1/3= ', UMath.power(2, 1/3));
  WriteLn('2^1= ', UMath.power(2, 1));
  WriteLn('2^0= ', UMath.power(2, 0));
  WriteLn('0^1= ', UMath.power(0, 1));
  WriteLn('0^0= ', UMath.power(0, 1));
end;

end.

