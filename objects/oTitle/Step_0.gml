/// @desc

if(audio_is_playing(song)) {
	var _time = floor(audio_sound_get_track_position(song)/60*bpm);
	if(_time != lastTime) bounce = 1.2;
	
	lastTime = _time;
}

bounce = ApproachFade(bounce,1,0.05,0.6)

if(show && selected == 0) {
	Input();

	if(key_select) {
		if(choice == 2) {
			global.hintMode = !global.hintMode;
			audio_play_sound(snBlip,1,false);
		}
		else {
			global.hardMode = choice;
			selected = 1;
			alarm[0] = 5;
			audio_stop_sound(song);
			audio_play_sound(snSelect,1,false);
		}
	}
	
	if(global.challenge == undefined) {
		if(key_up_pressed or key_left_pressed) {
			choice--;
			if(choice < 0) choice = 2;
			audio_play_sound(snBlip,1,false);
		}
	
		if(key_down_pressed or key_right_pressed) {
			choice++;
			if(choice > 2) choice = 0;
			audio_play_sound(snBlip,1,false);
		}
	}
}

logoY = ApproachFade(logoY,1,0.02,0.85);

if(logoY >= 1) {
	if(logoX == 0) audio_play_sound(snIntro2,1,false);
	logoX = Approach(logoX,2,0.05);
}

if(logoX >= 2 && !show) {
	show = true;
	song = audio_play_sound(mSong,1,true);
}

if(array_length(stars) < 150) array_push(stars,{
	x: random(room_width),
    y: random(room_height),
	col: choose(#d2de8e,#60205a),
	alpha1: random(1),
	alpha2: random(1),
	alphaSpeed: random_range(1,5),
	alphaOffset: random(1),
	far: random(1)
});