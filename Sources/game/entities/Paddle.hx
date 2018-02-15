package game.entities;

import kha.graphics2.Graphics;
import kha.input.KeyCode;
import kha.input.Keyboard;
import kha.System;

class Paddle extends Entity {
    var player : Player;
    var dy : Int;
    var v : Float;
    
    public function new(player : Player) {
        super(0, 0, 16, 64);
        
        this.player = player;
        
        dy = 0;
        
        v = 8;
        
        if (Keyboard.get() != null) {
            Keyboard.get().notify(onKeyDown, onKeyUp);
        }
    }
    
    public function update() : Void {
        y += dy * v;
        
        if (y < 0) {
            y = 0;
        } else if ((y + height) > System.windowHeight()) {
            y = System.windowHeight() - height;
        }
    }
    
    public function draw(g : Graphics) : Void {
        g.fillRect(x, y, width, height);
    }
    
    private function onKeyDown(keyCode:KeyCode):Void {
        if (player == Player.PLAYER_1) {
            switch (keyCode) {
                case KeyCode.W: dy = -1;
                case KeyCode.S: dy = 1;
            default: return;
            }
        } else {
            switch (keyCode) {
                case KeyCode.O: dy = -1;
                case KeyCode.L: dy = 1;
            default: return;
            }
        }
    }
    
    private function onKeyUp(keyCode:KeyCode):Void {
        if (player == Player.PLAYER_1) {
            switch (keyCode){
                case KeyCode.W: dy = 0;
                case KeyCode.S: dy = 0;
            default: return;
            }
        } else {
            switch (keyCode) {
                case KeyCode.O: dy = 0;
                case KeyCode.L: dy = 0;
            default: return;
            }
        }
    }
}
