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
		if(gameoverChoice == 0) room_restart();
		else game_restart();
	}
	
	if(key_up_pressed or key_down_pressed or key_left_pressed or key_right_pressed) gameoverChoice = !gameoverChoice;
}

heartAlpha = ApproachFade(heartAlpha,heartAppear,0.05,0.6);

if(oBeatController.specialBeat) {
	heartAppear = 1;
	heartMovement = 0;
} else {
	if(heartAmount == 8) {
		heartMovement = ApproachFade(heartMovement,1,0.05,0.6);
		if(heartMovement == 1) {
			heartAppear = 1;
			heartAlpha = 0;
		}
	} else heartAppear = 0;
}