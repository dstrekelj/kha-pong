package;

import entities.*;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

class Project {
	var paddle1 : Paddle;
	var paddle2 : Paddle;
	var ball : Ball;
	
	public function new() {
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);
		
		paddle1 = new Paddle(100, System.windowHeight() / 2);
		paddle2 = new Paddle(System.windowWidth() - 100, System.windowHeight() / 2);
		ball = new Ball(System.windowWidth() / 2, System.windowHeight() / 2);
	}

	function update(): Void {
		paddle1.update();
		paddle2.update();
		ball.update();
	}

	function render(framebuffer: Framebuffer): Void {
		var g2 = framebuffer.g2;
		g2.begin(kha.Color.Black);
		g2.color = kha.Color.White;
		
		paddle1.draw(g2);
		paddle2.draw(g2);
		ball.draw(g2);
		
		g2.end();
	}
}
