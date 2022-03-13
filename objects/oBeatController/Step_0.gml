if(global.alive != 1) {
	audio_stop_sound(song);
	exit;
}

if(audio_is_playing(song)) {
	global.time = audio_sound_get_track_position(song)/60*bpm;
	var _time = floor((global.time % 8) * numberOfBeats/4);
	var _aheadTime = floor(((global.time+0.73) % 8) * numberOfBeats/4);

	if(_time != lastTime) oPlayer.cannonMove = 2;

	if(_time < lastTime) for(var i = 0; i < numberOfBeats; i++) beats[i] = irandom(3);
	if(_time != lastTime && _time < numberOfBeats^2/4) {

		if(beats[_time] != 4) {
			var _dir = beats[_time]*90;
			instance_create_layer(room_width/2+lengthdir_x(room_width/2-16,_dir),room_height/2+lengthdir_y(room_height/2-16,_dir),"Enemy",oWarning);
		}
	}

	if(_aheadTime != aheadLastTime && _aheadTime >= numberOfBeats^2/4) {
		if(beats[_aheadTime-numberOfBeats] != 4) {
			var _dir = beats[_aheadTime-numberOfBeats]*90;
			with(instance_create_layer(room_width/2+lengthdir_x(150,_dir),room_height/2+lengthdir_y(150,_dir),"Enemy",oEnemy)) {
				direction = _dir;
				speed = -4;
			}
		}
	}

	lastTime = _time;
	aheadLastTime = _aheadTime

	audio_sound_pitch(song,global.alive);
}