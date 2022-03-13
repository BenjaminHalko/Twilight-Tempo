/// @desc
if(gameoverNum > 0) {
	Input();
	
	if(gameoverNum > 10) {
		key_select = true;
		gameoverChoice = 1;
	}
	
	if(key_select) {
		global.score = 0;
		global.lives = 12;
		global.alive = 1;
		if(true) room_restart();
		else {
			global.hiScore = 0;
			room_goto(rTitle);
		}
	}
	
	if(key_up_pressed or key_down_pressed or key_left_pressed or key_right_pressed) gameoverChoice = !gameoverChoice;
}