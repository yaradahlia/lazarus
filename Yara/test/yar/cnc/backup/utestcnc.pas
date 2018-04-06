unit UTestCnc;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, UCnc;

procedure testSpindleSpeedValue();

implementation

procedure testSpindleSpeedValue();
var spindleSpeed: TSpindleSpeed;
begin
  spindleSpeed := TSpindleSpeed.Create(22345);
  WriteLn('Spindle speed command: ', spindleSpeed.getValue());
  WriteLn(spindleSpeed);
end;

end.

