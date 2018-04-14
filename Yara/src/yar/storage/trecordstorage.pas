
type
  generic TRecordStorage<K, T> = class
    strict private
      type
        TRecord = packed record
          key: K;
          data: T;
          createdOn: TDateTime;
          modifiedOn: TDateTime;
          active: Boolean;
        end;
    strict private
      type PRecord = ^TRecord;
    strict private
      type PT = ^T;
    strict private
      filePath: AnsiString;
    strict protected
      function seekKey(f: File of TRecordStorage.TRecord; const key: K): Boolean; virtual;
    public
      constructor Create(const newFilePath: AnsiString);
      destructor Destroy(); override;
      function getFilePath(): AnsiString; virtual;
      procedure addRecord(const key: K; const value: PT); virtual;
      procedure removeRecord(const key: K); virtual;
      procedure updateRecord(const key: K; const newValue: PT); virtual;
      function findRecord(const key: K): PT; virtual;
      procedure compact(); virtual
  end;
