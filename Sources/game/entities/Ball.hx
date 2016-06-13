package game.entities;

import kha.System;
import kha.graphics2.Graphics;
import kha.math.Random.Default;

class Ball extends Entity {
    var dx : Int;
    var dy : Int;
    var v : Float;
    
    public function new() {
        super(0, 0, 16, 16);
        
        dx = Default.GetIn(0, 1) == 0 ? -1 : 1;
        dy = Default.GetIn(0, 1) == 0 ? -1 : 1;
        
        v = 5;
    }
    
    public function update() : Void {
        x += dx * v;
        y += dy * v;
        
        if (((y + height) > System.windowHeight()) || (y < 0)) {
            dy *= -1;
        }
    }
    
    public function draw(g : Graphics) : Void {
        g.fillRect(x, y, width, height);
    }
    
    public function checkCollision(p : Paddle) {
        if (this.overlapsEntity(p)) {
            dx *= -1;
            
            if (y < (p.y + 0.3 * p.height)) {
                dy = -1;
            } else if (y > (p.y + 0.6 * p.height)) {
                dy = 1;
            } else {
                dy = 0;
            }
        }
    }
}
