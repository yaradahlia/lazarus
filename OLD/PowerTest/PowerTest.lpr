program PowerTest;

uses sysutils, dateutils;

function power(const base: Real; const exponent: Real): Real;
begin
  result := exp(exponent * ln(base));
end;

function powerTest(const outputDirectory: AnsiString; const iterations: Int64): Int64;
var startMillis: Int64;
    stopMillis: Int64;
    i, checkpoint: Int64;
    logFile: TextFile;
    squareRoot: Real;
begin
  if iterations >= 10 then
  begin
    startMillis := dateutils.MilliSecondsBetween(Now, 0);
    checkpoint := iterations DIV 10;
    AssignFile(logFile, outputDirectory + '/test_' + IntToStr(iterations) + '.log');
    Rewrite(logFile);
    try
      for i := 1 to iterations do
      begin
        squareRoot := power(i, 1/2);
        if i MOD checkpoint = 0 then
        begin
          WriteLn(logFile, i:10, ': ', squareRoot:10:5);
        end;
      end;
    finally
      CloseFile(logFile);
    end;
    stopMillis := dateutils.MilliSecondsBetween(Now, 0);
    result := stopMillis - startMillis;
  end
  else
  begin
    result := -1;
  end;
end;

procedure prepareOutput(const outputDirectory: AnsiString);
begin
  if Not DirectoryExists(outputDirectory) then
  begin
    CreateDir(outputDirectory);
  end;
end;

var currentDirectory: AnsiString;
    outputDirectory: AnsiString;
    iterations: Int64;
begin
  currentDirectory := GetCurrentDir;
  WriteLn('Power test');
  Writeln('Preparing...');
  WriteLn('Current working directory is: ', currentDirectory);
  outputDirectory := currentDirectory + '/output';
  WriteLn;
  WriteLn('Output directory is: ', outputDirectory);
  prepareOutput(outputDirectory);
  WriteLn('Starting...');
  WriteLn('Iterations', '       ', 'Run milliseconds');
  iterations := 10;
  while iterations <= 100000000 do
  begin
    //WriteLn(Format('%0.10D   %0.5F', [iterations, powerTest(outputDirectory, iterations)]));
    Write(Format('%0.10D', [iterations]));
    WriteLn('   ', FormatFloat('0.00###', powerTest(outputDirectory, iterations)));
    iterations *= 10;
  end;
  WriteLn('End of test.');
  Write('Press ENTER key to exit...');
  ReadLn;
  WriteLn('Ready.');
end.

