if(global.lives <= 0) {
	audio_stop_sound(song);
	exit;
}

if(audio_is_playing(song) && (!global.start or barNumber < 9-4*global.hardMode)) {
	var _time = audio_sound_get_track_position(song)-startTime;
	if(_time < 0) _time += audio_sound_length(mSong);
	global.time = _time/60*bpm;
	var _time = floor(global.time % numberOfBeats*2);
	var _aheadTime = floor(((global.time+0.73) % numberOfBeats*2));

	if(_time < lastTime) {
		if(global.score >= 40000) {
			if(mode != 9) {
				ds_list_clear(extraBeat);
				ds_list_add(extraBeat,0,0,4,8);
			} mode = 9;
		} else if(global.score >= 35000) {
			if(mode != 8) {
				ds_list_clear(extraBeat);
				ds_list_add(extraBeat,0,0,8,8);
			} mode = 8;
		} else if(global.score >= 30000) {
			if(mode != 7) {
				ds_list_clear(extraBeat);
				ds_list_add(extraBeat,0,1,8,12);
			} mode = 7;
		} else if(global.score >= 20000) {
			if(mode != 6) {
				ds_list_clear(extraBeat);
				ds_list_add(extraBeat,0,1,8,16);
			} mode = 6;
		} else if(global.score >= 15000) {
			if(mode != 5) {
				ds_list_clear(extraBeat);
				ds_list_add(extraBeat,0,1,10,18);
			} mode = 5;
		} else if(global.score >= 10000) {
			if(mode != 4) {
				ds_list_clear(extraBeat);
				ds_list_add(extraBeat,0,6,12,24);
			} mode = 4;
		} else if(global.score >= 5000) {
			if(mode != 3) {
				ds_list_clear(extraBeat);
				ds_list_add(extraBeat,1,6,12,24);
			} mode = 3;
		} else if(global.score >= 3000) {
			if(mode < 2) {
				ds_list_clear(extraBeat);
				ds_list_add(extraBeat,-6,-1,-1,-1);
				mode = 2;
			} 
		} else if(global.score >= 600) mode = 1;
		
		if(global.hardMode and ds_list_size(extraBeat) != 8) ds_list_add(extraBeat,-1,-1,-1,-1);
		
		if(global.start or mode >= 3) barNumber++;
		
		if(barNumber == 9-4*global.hardMode && global.start) exit;
		else if(barNumber == 8-4*global.hardMode && global.start) beats = [0,4,3,4,2,4,1,4,2,4,3,4,0,4,1,4];
		else {
			ds_list_shuffle(extraBeat);
			for(var i = 0; i < numberOfBeats; i++) {
				if(i % 2) {
					if(!global.start && mode > 1 && extraBeat[| i div 2] != -1 && (irandom(max(0,8-barNumber)+extraBeat[| i div 2]) == 0 or mode == 2)) beats[i] = irandom(3);
					else beats[i] = 4;
				} else if(!global.start && i % 4 == 2 && mode == 0) beats[i] = 4;
				else beats[i] = irandom(3);
			}
		}
		
		if(mode == 2) mode = 2.5;
	}
	
	if(_time != lastTime) {
		if(_time % 2 == 0) oPlayer.cannonMove = 2;
		if(_time < numberOfBeats) {
			if(beats[_time] != 4) {
				var _dir = beats[_time]*90;
				if(global.start or global.hintMode) instance_create_layer(room_width/2+lengthdir_x(room_width/2-32,_dir),room_height/2+lengthdir_y(room_height/2-32,_dir),"GUI",oWarning);
				audio_play_sound(dirSounds[beats[_time]],3,false);
			}
		}
	}

	if(_aheadTime != aheadLastTime && _aheadTime >= numberOfBeats && beats[_aheadTime-numberOfBeats] != 4) {
		var _dir = beats[_aheadTime-numberOfBeats]*90;
		with(instance_create_layer(room_width/2+lengthdir_x(150,_dir),room_height/2+lengthdir_y(150,_dir),"Enemy",oEnemy)) direction = _dir;
	}

	lastTime = _time;
	aheadLastTime = _aheadTime
} else if(global.start && !audio_is_playing(song) && song != noone) barNumber = 9-4*global.hardMode;