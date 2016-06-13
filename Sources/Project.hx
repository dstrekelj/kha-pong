package;

import game.*;
import game.entities.*;

import kha.Assets;
import kha.Font;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

class Project {
	var font : Font;
	var scoreL : Int;
	var scoreR : Int;
	
	var paddleL : Paddle;
	var paddleR : Paddle;
	var ball : Ball;
	
	public function new() {
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);
		
		kha.math.Random.init(20160611);
		
		font = Assets.fonts.slkscr;
		scoreL = 0;
		scoreR = 0;
		
		paddleL = new Paddle(Player.PLAYER_1);
		paddleR = new Paddle(Player.PLAYER_2);
		ball = new Ball();
		
		paddleL.positionCenter(128, System.windowHeight() / 2);
		paddleR.positionCenter(System.windowWidth() - 128, System.windowHeight() / 2);
		
		init();
	}

	function update(): Void {
		paddleL.update();
		paddleR.update();
		ball.update();
		
		if (ball.x < 0 || ball.x > System.windowWidth()) {
			(ball.x < 0) ? scoreR += 1 : scoreL += 1;
			init();
		} else if (ball.x < System.windowWidth() / 2) {
			ball.checkCollision(paddleL);
		} else {
			ball.checkCollision(paddleR);
		}
	}

	function render(framebuffer: Framebuffer): Void {
		var g2 = framebuffer.g2;
		g2.begin(kha.Color.Black);
		g2.color = kha.Color.White;
		g2.font = font;
		g2.fontSize = 64;
		
		g2.drawLine(System.windowWidth() / 2, 0, System.windowWidth() / 2, System.windowHeight());
		paddleL.draw(g2);
		paddleR.draw(g2);
		ball.draw(g2);
		g2.drawString(Std.string(scoreL), System.windowWidth() / 3, 16);
		g2.drawString(Std.string(scoreR), System.windowWidth() * 2 / 3, 16);
		
		g2.end();
	}
	
	function init() : Void {
		ball.positionCenter(System.windowWidth() / 2, System.windowHeight() / 2);
	}
}
