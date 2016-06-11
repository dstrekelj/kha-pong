package entities;

import kha.math.Random.Default;

class Ball {
    var x : Float;
    var y : Float;
    var r : Float;
    var dx : Int;
    var dy : Int;
    var v : Float;
    
    public function new(x : Float, y : Float) {
        this.x = x;
        this.y = y;
        
        dx = Default.GetIn(0, 1) == 0 ? -1 : 1;
        dy = Default.GetIn(0, 1) == 0 ? -1 : 1;
        
        v = 4;
        r = 8;
    }
    
    public function update() : Void {
        handleWindowCollision();
        
        x += dx * v;
        y += dy * v;
    }
    
    public function draw(g : kha.graphics2.Graphics) : Void {
        g.fillRect(x - r, y - r, r * 2, r * 2);
    }
    
    function handleWindowCollision() : Void {
        if (((x + r) > kha.System.windowWidth()) || ((x - r) < 0)) {
            dx *= -1;
        }
        
        if (((y + r) > kha.System.windowHeight()) || ((y - r) < 0)) {
            dy *= -1;
        }
    }
}