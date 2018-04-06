type
  TACommand = class abstract
    strict private
    strict protected
    public
      constructor Create;
      destructor Destroy; override;
      function getValue(): String255; virtual; abstract;
  end;

