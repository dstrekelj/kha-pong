package;

import entities.*;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

class Project {
	var paddleL : Paddle;
	var paddleR : Paddle;
	var ball : Ball;
	
	public function new() {
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);
		
		kha.math.Random.init(20160611);
		
		paddleL = new Paddle(Player.PLAYER_1);
		paddleR = new Paddle(Player.PLAYER_2);
		ball = new Ball();
		
		init();
	}

	function update(): Void {
		paddleL.update();
		paddleR.update();
		ball.update();
		
		if (ball.x < 0 || ball.x > System.windowWidth()) {
			init();
		}
	}

	function render(framebuffer: Framebuffer): Void {
		var g2 = framebuffer.g2;
		g2.begin(kha.Color.Black);
		g2.color = kha.Color.White;
		
		g2.drawLine(System.windowWidth() / 2, 0, System.windowWidth() / 2, System.windowHeight());
		paddleL.draw(g2);
		paddleR.draw(g2);
		ball.draw(g2);
		
		g2.end();
	}
	
	function init() : Void {
		paddleL.positionCenter(128, System.windowHeight() / 2);
		paddleR.positionCenter(System.windowWidth() - 128, System.windowHeight() / 2);
		ball.positionCenter(System.windowWidth() / 2, System.windowHeight() / 2);
	}
}
