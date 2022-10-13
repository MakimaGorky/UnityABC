uses Input, GraphABC, Timers;

const FrameCountBeforeClear = 0;

var framePassed := 0;
var x, y : integer;

procedure Update();
begin
  var hAxis := GetAxisHorizontal();
  var vAxis := GetAxisVertical();
  
  x += 3 * hAxis;
  y += 3 * vAxis;
  
  if framePassed > FrameCountBeforeClear then
  begin
    framePassed := 0;
    ClearWindow();
  end;
  
  FillCircle(x, y, 10); 
  
  framePassed += 1;
end;

begin
  (x, y) := (50, 50);
  
  Window.Title := 'Паскаль юнити';
  Window.Init(0, 0, 500, 500, Color.Firebrick);
  
  FillCircle(600, 600, 10); 
  Timers.CreateTimerAndStart(1, Update);
end.