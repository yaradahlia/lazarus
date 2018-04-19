unit UTestStorage;

{$mode objfpc}{$H+}

interface

uses
  sysutils, UStorage;

procedure testStorage();

implementation

procedure testStorage();

type
  TString100 = String[100];
  TArrayByte1024 = array[1 .. 1024] of Byte;

type
  PTestRecord = ^TTestRecord;
  TTestRecord = packed record
    name: TString100;
    key: TArrayByte1024;
  end;

type
  TTestRecordStorage = specialize TRecordStorage<TString100, TTestRecord>;

var ptrRecord: PTestRecord;
    storage: TTestRecordStorage;
    fileName: AnsiString;
begin
  fileName := ExpandFileName('~/') + '.recordStorageTest/test001.dat';
  storage := TTestRecordStorage.Create(fileName);
  storage.createFileStorage();
  new(ptrRecord);
  ptrRecord^.key[1] := 1;
  ptrRecord^.key[2] := 2;
  ptrRecord^.name := 'Test 1';
  storage.addRecord(ptrRecord^.name, ptrRecord);
  storage.addRecord(ptrRecord^.name, ptrRecord);
  storage.addRecord(ptrRecord^.name, ptrRecord);
end;

end.

