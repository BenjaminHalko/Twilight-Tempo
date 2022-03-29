/// @desc
if(TOUCH && show && selected == 0 && !mouse_check_button_pressed(mb_left)) {
	if(event_data[? "posX"] >= room_width/2) {
		if(event_data[? "posY"] >= room_height/2) {
			choice--;
			if(choice < 0) choice = 2;
			audio_play_sound(snBlip,1,false);
		} else {
			choice++;
			if(choice > 2) choice = 0;
			audio_play_sound(snBlip,1,false);
		}
	} else if(choice == 2) {
		global.hintMode = !global.hintMode;
		audio_play_sound(snBlip,1,false);
	} else {
		global.hardMode = choice;
		selected = 1;
		alarm[0] = 5;
		audio_stop_sound(song);
		audio_play_sound(snSelect,1,false);
	}
}