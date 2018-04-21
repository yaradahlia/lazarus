
type
  generic TRecordStorage<K, T> = class
    strict private
      type
        TRecordDefinition = record
          storageName: TString100;
          fileIndex: Integer;
        end;
      type
        TRecord = record
          key: K;
          data: T;
          createdOn: TDateTime;
          modifiedOn: TDateTime;
          active: Boolean;
        end;
      type PRecord = ^TRecord;
      type TRecordFile = File of TRecord;
    public
      type PT = ^T;
    strict private
      bazeDirectory: AnsiString;
    strict protected
      function seekKey(var f: TRecordFile; const key: K): Boolean; virtual;
    public
      constructor Create(const newBazeDirectory: AnsiString);
      destructor Destroy(); override;
      function getBazeDirectory(): AnsiString; virtual;
      procedure createStorage(const storageName: AnsiString); virtual;
      procedure removeStorage(const storageName: AnsiString); virtual;
      procedure compactStorage(const storageName: AnsiString); virtual;
      procedure addRecord(const storageName: AnsiString; const key: K; const value: PT); virtual;
      procedure removeRecord(const storageName: AnsiString; const key: K); virtual;
      procedure updateRecord(const storageName: AnsiString; const key: K; const newValue: PT); virtual;
      function hasKey(const storageName: AnsiString; const key: K): Boolean; virtual;
      function findRecord(const storageName: AnsiString; const key: K): PT; virtual;
  end;
