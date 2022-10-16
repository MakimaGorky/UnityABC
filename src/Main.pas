uses Input, GraphWPF, Timers, GameObject;

const GlobalTickValue = 1;
const FrameCountBeforeClear = 2;

var speed := 5;

var framePassed := 0;

var Player: GO;

var Gos: array of GO;

procedure Update();
begin
  var hAxis := GetAxisHorizontal();
  var vAxis := GetAxisVertical();
  
  Player.Move(speed * hAxis, speed * vAxis);
  
  if framePassed > FrameCountBeforeClear then
  begin
    framePassed := 0;
    Window.Clear();
  end;
  
  Gos[1].RenderSquare();  
  Gos[0].RenderCircle();
  
  framePassed += 1;
end;

begin
  Player := GO.Create(50, 50);
  var Obstacle := GO.Create(100, 100);
  
  Gos := new GO[2];
  Gos[0] := Player;
  Gos[1] := Obstacle;
  
  Window.Title := 'Паскаль юнити';
  
  FillCircle(600, 600, 10); 
  
  Timers.CreateTimerAndStart(GlobalTickValue, Update);
end.