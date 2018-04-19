constructor TSpindleSpeed.Create(const newRpm: TRpmSpeed);
begin
  inherited Create();
  self.rpm := newRpm;
end;

destructor TSpindleSpeed.Destroy;
begin
  FreeAndNil(rpm);
  inherited;
end;

function TSpindleSpeed.getRpm(): TRpmSpeed;
begin
  exit(self.rpm);
end;

function TSpindleSpeed.getValue(): TCommandString;
begin
  exit('S ' + IntToStr(self.getRpm()));
end;
