uses ABCButtons, GraphABC, Timers;

const FramesRendered = 4;

var x, y: integer;
var xVelocity, yVelocity: integer;
var framesPassed: integer;

procedure KeyDown(Key: integer);
begin
  if Key = 37 then
    xVelocity := -5
  else if Key = 38 then
    yVelocity := -5
  else if Key = 39 then
    xVelocity := 5
  else if Key = 40 then
    yVelocity := 5
  else
    (xVelocity, yVelocity) := (0, 0);
end;

procedure KeyUp(Key: integer);
begin
  if Key = 37 then
    xVelocity := 0
  else if Key = 38 then
    yVelocity := 0
  else if Key = 39 then
    xVelocity := 0
  else if Key = 40 then
    yVelocity := 0
end;

procedure Update();
begin
  x += xVelocity;
  y += yVelocity;
  framesPassed += 1;
  
  if framesPassed > FramesRendered then begin
    ClearWindow;
    framesPassed := 0;
  end;
  
  FillCircle(x, y, 10);  
end;

begin  
  (x, y) := (50, 50);
  Window.Title := 'Паскаль анрил';
  Window.Init(20, 20, 500, 500, Color.Fuchsia);
  
  {  
  var buttonRight := ButtonABC.Create(250, 250, 100, 100, 'Вправо!', GraphABC.Color.HotPink);
  var buttonDown := ButtonABC.Create(150, 250, 100, 100, 'Вниз!', GraphABC.Color.HotPink);  
  var buttonLeft := ButtonABC.Create(250, 150, 100, 100, 'Влево!!!', GraphABC.Color.HotPink);
  var buttonUp := ButtonABC.Create(150, 150, 100, 100, 'Вверх ↑!', GraphABC.Color.HotPink);
  }
  
  OnKeyDown := KeyDown;
  OnKeyUp := KeyUp;
  
  {
  buttonUp.OnClick := () -> (y -= 5);
  buttonDown.OnClick := () -> (y += 5);  
  buttonLeft.OnClick := () -> (x -= 5);
  buttonRight.OnClick := () -> (x += 5);
  }
  
  var timer := Timers.CreateTimerAndStart(1, Update);
end.