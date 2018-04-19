program PermTest;

uses UMath, UUtils;

type
  ByteArray = array of byte;

function getPermutation(const n: UMath.TIntU20; const permutationIndex: QWord): ByteArray;
begin
  SetLength(result, n);

end;

var n: UMath.TIntU20;
    maxPermutations: QWord;
    i: LongInt;
begin
  WriteLn('Permutations generator test...');
  Write('n [', low(TIntU20), ' .. ', high(UMath.TIntU20), '] = ');
  ReadLn(n);
  maxPermutations := UMath.factorial(n);
  Writeln('maxPermutations = ', maxPermutations);
  Write('Press Enter key to terminate...');
  ReadLn;
  WriteLn;
  WriteLn('--- Ready');
end.
