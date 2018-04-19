
type
  generic TRecordStorage<K, T> = class
    strict private
      type
        TRecord = record
          key: K;
          data: T;
          createdOn: TDateTime;
          modifiedOn: TDateTime;
          active: Boolean;
        end;
    strict private
      type PRecord = ^TRecord;
    strict private
      type TRecordFile = File of TRecord;
    strict private
      type PT = ^T;
    strict private
      filePath: AnsiString;
    strict protected
      function seekKey(var f: TRecordFile; const key: K): Boolean; virtual;
    public
      constructor Create(const newFilePath: AnsiString);
      destructor Destroy(); override;
      procedure createFileStorage(); virtual;
      function getFilePath(): AnsiString; virtual;
      procedure addRecord(const key: K; const value: PT); virtual;
      procedure removeRecord(const key: K); virtual;
      procedure updateRecord(const key: K; const newValue: PT); virtual;
      function findRecord(const key: K): PT; virtual;
      procedure compact(); virtual;
  end;
