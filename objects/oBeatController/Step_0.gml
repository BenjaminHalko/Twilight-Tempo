if(global.lives <= 0) {
	audio_stop_sound(song);
	exit;
}

if(audio_is_playing(song) or (global.start && barNumber != 9-4*global.hardMode && song != noone)) {
	global.time = audio_sound_get_track_position(song)/60*bpm;
	var _time = floor(global.time % numberOfBeats*2);
	var _aheadTime = floor(((global.time+0.73) % numberOfBeats*2));

	if(_time < lastTime) {
		barNumber++;
		
		if(barNumber == 9-4*global.hardMode && global.start) exit;
		else if(barNumber == 8-4*global.hardMode && global.start) beats = [0,4,3,4,2,4,1,4,2,4,3,4,0,4,1,4];
		else {
			ds_list_shuffle(extraBeat);
			for(var i = 0; i < numberOfBeats; i++) {
				if(i % 2) {
					if(!global.start && extraBeat[| i div 2] != -1 && irandom(max(0,8-barNumber)+extraBeat[| i div 2]) == 0) beats[i] = irandom(3);
					else beats[i] = 4;
				} else beats[i] = irandom(3);
			}
		}
	}
	
	if(_time != lastTime) {
		if(_time % 2 == 0) oPlayer.cannonMove = 2;
		if(_time < numberOfBeats) {
			if(beats[_time] != 4) {
				var _dir = beats[_time]*90;
				if(oBackground.mode == 0) instance_create_layer(room_width/2+lengthdir_x(room_width/2-32,_dir),room_height/2+lengthdir_y(room_height/2-32,_dir),"GUI",oWarning);
				audio_play_sound(global.dirSounds[beats[_time]],2,false);
			}
		}
	}

	if(_aheadTime != aheadLastTime && _aheadTime >= numberOfBeats && beats[_aheadTime-numberOfBeats] != 4) {
		var _dir = beats[_aheadTime-numberOfBeats]*90;
		with(instance_create_layer(room_width/2+lengthdir_x(150,_dir),room_height/2+lengthdir_y(150,_dir),"Enemy",oEnemy)) direction = _dir;
	}

	lastTime = _time;
	aheadLastTime = _aheadTime
}