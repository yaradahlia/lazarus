type
  TSpindleSpeed = class(TACommand)
    strict private
      rpm: TRpmSpeed;
    strict protected
    public
      constructor Create(const newRpm: TRpmSpeed);
      destructor Destroy; override;
      function getRpm(): TRpmSpeed; virtual;
      function getValue(): TCommandString; override;
  end;
