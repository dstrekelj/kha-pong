package;

import kha.System;

class Main {
	public static function main() {
		System.init({title: "kha-pong", width: 1024, height: 768}, function () {
			kha.Assets.loadEverything(function() {
				new Project();
			});
		});
	}
}
