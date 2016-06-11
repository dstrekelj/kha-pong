package entities;

class Paddle {
    var x : Float;
    var y : Float;
    var width : Float;
    var height : Float;
    
    public function new(x : Float, y : Float) {
        this.x = x;
        this.y = y;
        
        width = 16;
        height = 64;
    }
    
    public function update() : Void {
        
    }
    
    public function draw(g : kha.graphics2.Graphics) : Void {
        g.fillRect(x - width / 2, y - height / 2, width, height);
    }
}