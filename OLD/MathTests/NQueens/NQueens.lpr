program NQueens;

const n = 4;

var temp: array[1 .. n] of Byte;

procedure printSolution();
var i, j: Byte;
begin
  for i := 1 to n do
  begin
    for j := 1 to temp[i] - 1 do
      Write('0':4);
    Write('*');
    for j := temp[i] + 1 to n do
      Write('0':4);
    WriteLn();
  end;
  WriteLn();
end;

procedure init();
var i: Byte;
begin
  for i := 1 to n do
    temp[i] := 0;
end;

function isPartialSolution(const row, col: Byte): Boolean;
var i: Byte;
    sameCol: Boolean;
    sameDiag: Boolean;
begin
  result := ((row <= n) AND (col <= n));
  if result then
    for i := 1 to row - 1 do
    begin
      sameCol := (temp[i] = col);
      sameDiag := (abs(col - temp[i]) = abs(row - i));
      if sameCol OR sameDiag then
      begin
        result := false;
        break;
      end;
    end;
  exit(result);
end;

procedure findSolutions();
var row, col: Byte;
begin
  row := 1;
  col := 1;
  while (row < n) OR (col < n) do
  begin
    WriteLn('debug: row: ', row, ' col: ', col);
    if isPartialSolution(row, col) then
    begin
      temp[row] := col;
      if row < n then
        row := row + 1
      else
        printSolution();
    end
    else
    begin
      if col < n then
        col := col + 1
      else
      begin
        row := row - 1;
        col := temp[row];
      end;
    end;
  end;
end;

begin
   init();
   WriteLn();
   findSolutions();
end.

