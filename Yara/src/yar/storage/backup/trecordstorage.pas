

type
  generic TRecordStorage<K, T> = class
    private
      type
        TRecord = packed record
          key: K;
          data: T;
          createdOn: TDateTime;
          modifiedOn: TDateTime;
          active: Boolean;
        end;
    strict private
      filePath: AnsiString;
    strict protected
    public
      constructor Create(const newFilePath: AnsiString);
      destructor Destroy; override;
      procedure addRecord(const key: K; const value: T); final;
      procedure removeRecord(const key: K); final;
      procedure updateRecord(const key: K; const newValue: T); final;
      function findRecord(const key: K): T; final;
  end;
