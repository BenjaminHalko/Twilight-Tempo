/// @desc

if global.pause {
	if countdown == 0 {
		if mouse_check_button_pressed(mb_left) {
			if resume.clicked() {
				countdown = 20*3;
				audio_play_sound(snBlip,1,false);
			} else if restart.clicked() {
				audio_stop_all();
				audio_play_sound(snBlip,1,false);
				room_restart();
			} else if quit.clicked() {
				audio_play_sound(snBlip,1,false);
				game_restart();
			}
		}
	} else if(--countdown <= 0) {
		global.pause = false;
		audio_resume_all();
	}
	
	if keyboard_check_pressed(vk_backspace) game_restart();
} else if keyboard_check_pressed(vk_backspace) global.pause = true;