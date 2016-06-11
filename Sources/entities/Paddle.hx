package entities;

class Paddle {
    var x : Float;
    var y : Float;
    var dy : Float;
    var v : Float;
    var width : Float;
    var height : Float;
    
    var ball : Ball;
    var player : Player;
    
    public function new(x : Float, y : Float, player : Player) {
        this.x = x;
        this.y = y;
        this.player = player;
        
        dy = 0;
        
        v = 6;
        
        width = 16;
        height = 64;
        
        if (kha.input.Keyboard.get() != null) kha.input.Keyboard.get().notify(handleKeyDown, handleKeyUp);
    }
    
    public function update() : Void {
        handleBallCollision(ball);
        y += dy;
    }
    
    public function draw(g : kha.graphics2.Graphics) : Void {
        g.fillRect(x - width / 2, y - height / 2, width, height);
    }
    
    public function willCollideWith(ball : Ball) {
        this.ball = ball;
    }
    
    public function handleKeyDown(key : kha.Key, char : String) {
        if (player == Player.PLAYER_1) {
            switch (char) {
                case "w": dy = -v;
                case "s": dy = v;
            }
        } else {
            switch (char) {
                case "o": dy = -v;
                case "l": dy = v;
            }
        }
    }
    
    public function handleKeyUp(key : kha.Key, char : String) {
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
    
    @:access(entities.Ball)
    function handleBallCollision(ball : Ball) : Void {
        if (hitTest(ball)) {
            ball.dx *= -1;
        }
    }
    
    @:access(entities.Ball)
    function hitTest(ball : Ball) : Bool {
        var paddleL = x - width / 2;
        var paddleR = x + width / 2;
        var paddleT = y - height / 2;
        var paddleB = y + height / 2;
        
        var ballL = ball.x - ball.r;
        var ballR = ball.x + ball.r;
        var ballT = ball.y - ball.r;
        var ballB = ball.y + ball.r;
        
        return (ballL >= paddleL) && (ballR <= paddleR) && (ballT >= paddleT) && (ballB <= paddleB);
    }
}