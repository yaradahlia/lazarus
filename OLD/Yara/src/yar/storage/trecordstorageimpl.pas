
constructor TRecordStorage.Create(const newFilePath: AnsiString);
begin
  inherited Create();
  self.filePath := newFilePath;
end;

destructor TRecordStorage.Destroy();
begin
  freeAndNil(self.filePath);
  Inherited;
end;

function TRecordStorage.getFilePath(): AnsiString;
begin
  exit(self.filePath);
end;

procedure TRecordStorage.createFileStorage();
var output: File of TRecordStorage.TRecord;
begin
  assignFile(output, self.getFilePath());
  try
     rewrite(output);
  finally
    closeFile(output);
  end;
end;

procedure TRecordStorage.addRecord(const key: K; const value: PT);
var pRec: TRecordStorage.PRecord;
    output: File of TRecordStorage.TRecord;
begin
  New(pRec);
  pRec^.key := key;
  pRec^.data := value^;
  pRec^.active := true;
  pRec^.createdOn := now();
  pRec^.modifiedOn := now();
  assignFile(output, self.getFilePath());
  try
     reset(output);
     seek(output, FileSize(output));
     write(output, pRec^);
  finally
    closeFile(output);
  end;
end;

procedure TRecordStorage.removeRecord(const key: K);
var existingRecord: TRecordStorage.TRecord;
    input: File of TRecordStorage.TRecord;
begin
  assignFile(input, self.getFilePath());
  try
     reset(input);
     if self.seekKey(input, key) then
     begin
       read(input, existingRecord);
       existingRecord.active := false;
       self.seekKey(input, key);
       write(input, existingRecord);
     end;
  finally
    closeFile(input);
  end;
end;

procedure TRecordStorage.updateRecord(const key: K; const newValue: PT);
var existingRecord: TRecordStorage.TRecord;
    input: File of TRecordStorage.TRecord;
begin
  assignFile(input, self.getFilePath());
  try
     reset(input);
     if self.seekKey(input, key) then
     begin
       read(input, existingRecord);
       existingRecord.data := newValue^;
       self.seekKey(input, key);
       write(input, existingRecord);
     end;
  finally
    closeFile(input);
  end;
end;

function TRecordStorage.findRecord(const key: K): PT;
var existingRecord: TRecordStorage.TRecord;
    input: File of TRecordStorage.TRecord;
begin
  assignFile(input, self.getFilePath());
  try
     reset(input);
     if self.seekKey(input, key) then
     begin
       read(input, existingRecord);
       result := @existingRecord.data;
     end;
  finally
    closeFile(input);
  end;
  exit(result);
end;

procedure TRecordStorage.compact();
begin
  { TODO : Implement this method. }
  raise Exception.Create('Compact is not implemented yet.');
end;

{ TODO : Implement smart find, by a key index or something }
function TRecordStorage.seekKey(var f: TRecordStorage.TRecordFile; const key: K): Boolean;
var existingRecord: TRecordStorage.TRecord;
begin
  result := false;
  seek(f, 0);
  while not eof(f) do
  begin
    read(f, existingRecord);
    if existingRecord.key = key then
    begin
       result := true;
       break;
    end;
  end;
  exit(result);
end;

