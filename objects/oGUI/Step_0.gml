/// @desc
if(gameoverNum > 0) {
	Input();
	
	if(gameoverNum > 20) {
		key_select = true;
		gameoverChoice = 1;
	}
	if(key_select) {
		if(gameoverChoice == 0) room_restart();
		else game_restart();
	}
	
	if(key_up or key_down or key_left or key_right) {
		gameoverChoice = !gameoverChoice;
		audio_play_sound(snBlip,1,false);
	}
}
else if(newHighscore != -1) {
	Input();
	if(selected != 3) {
		if(key_up or key_down) {
			name[selected] -= key_down-key_up;
			if(name[selected] < 65) name[selected] = 90;
			else if(name[selected] > 90) name[selected] = 65;
			global.hiScore[global.hardMode][# 1,newHighscore] = chr(name[0])+chr(name[1])+chr(name[2]);
			alarm[1] = 20;
		}
	
		if(key_select or key_right or key_left) {
			audio_play_sound(snBlip,2,false);
			var _amount = (key_select or key_right) - key_left;
			if(_amount != 0) and (selected != 0 or _amount == 1) and (key_select or key_left or selected != 2) {
				alarm[1] = -1;
				selected += _amount;
			}
			
			if(selected == 3) alarm[0] = 1;
		}
	}
}

if(!instance_exists(oPlayer) and alarm[0] <= 0 and (newHighscore == -1 or selected == 3)) alarm[0] = 30;