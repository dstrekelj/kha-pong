class Entity {
    public var x : Float;
    public var y : Float;
    public var width : Float;
    public var height : Float;
    
    public function new(x : Float, y : Float, width : Float, height : Float) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }
    
    public inline function positionCenter(x : Float, y : Float) : Void {
        this.x = x - width / 2;
        this.y = y - height / 2;
    }
    
    public inline function overlapsPoint(px : Float, py : Float) : Bool {
        if (x > px) return false;
        if (y > py) return false;
        if ((x + width) < px) return false;
        if ((y + height) < py) return false;
        return true;
    }
    
    public inline function overlapsEntity(e : Entity) : Bool {
        if (x > (e.x + e.width)) return false;
        if (y > (e.y + e.height)) return false;
        if ((x + width) < e.x) return false;
        if ((y + height) < e.y) return false;
        return true;
    }
}