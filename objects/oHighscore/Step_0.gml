if(selected != 3) {
	Input();
	if(key_up or key_down) {
		name[selected] -= key_down-key_up;
		if(name[selected] < 65) name[selected] = 90;
		else if(name[selected] > 90) name[selected] = 65;
		alarm[0] = 20;
	}
	
	if(key_select or key_right or key_left) {
		audio_play_sound(snBlip,2,false);
		var _amount = (key_select or key_right) - key_left;
		if(_amount != 0) and (selected != 0 or _amount == 1) and (key_select or key_left or selected != 2) {
			alarm[0] = -1;
			selected += _amount;
		}
	}
}