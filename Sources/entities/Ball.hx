package entities;

class Ball {
    var x : Float;
    var y : Float;
    var r : Float;
    
    public function new(x : Float, y : Float) {
        this.x = x;
        this.y = y;
        
        r = 8;
    }
    
    public function update() : Void {
        
    }
    
    public function draw(g : kha.graphics2.Graphics) : Void {
        g.fillRect(x - r, y - r, r * 2, r * 2);
    }
}