type
  TACommand = class abstract
    strict private
    strict protected
    public
      constructor Create;
      destructor Destroy; override;
      function getValue(): TCommandString; virtual; abstract;
  end;

