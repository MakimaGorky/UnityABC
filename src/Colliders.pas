unit Colliders;

type RectCollider = class
  public
    x, y, width, height: real;
    
    constructor Create(xx, yy, wwidth, hheight: real);
    begin
      x := xx;
      y := yy;
      width := wwidth;
      height := hheight;
    end;
    
    property xMax : real Read x + width;
    property yMax : real Read y + height;
end;

type CircleCollider = class
  public
    x, y, radius: real;
    
    constructor Create(xx, yy, rradius: real);
    begin
      x := xx;
      y := yy;
      radius := rradius;
    end;
end;

end.