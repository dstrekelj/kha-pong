package game.entities;

import kha.graphics2.Graphics;
import kha.input.Keyboard;
import kha.Key;
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
    
    private function onKeyDown(key : Key, char : String) : Void {
        if (player == Player.PLAYER_1) {
            switch (char) {
                case "w": dy = -1;
                case "s": dy = 1;
            }
        } else {
            switch (char) {
                case "o": dy = -1;
                case "l": dy = 1;
            }
        }
    }
    
    private function onKeyUp(key : Key, char : String) : Void {
        if (player == Player.PLAYER_1) {
            switch (char) {
                case "w": dy = 0;
                case "s": dy = 0;
            }
        } else {
            switch (char) {
                case "o": dy = 0;
                case "l": dy = 0;
            }
        }
    }
}
