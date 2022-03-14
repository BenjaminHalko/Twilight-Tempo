if(global.alive != 1) {
	audio_stop_sound(song);
	exit;
}

enableLive;

if(audio_is_playing(song) && !audio_is_paused(song)) {
	global.time = audio_sound_get_track_position(song)/60*bpm;
	var _time = floor((global.time % numberOfBeats));
	var _aheadTime = floor(((global.time+0.73) % numberOfBeats));

	if(_time < lastTime) {
		if(specialBeat) {
			oBackground.mode = 1;
			if(oGUI.heartAmount != 8) audio_play_sound(snChallengeFail,2,false);
		}
		numberOfBeats = 8-(oBackground.mode or global.start)*4;
		specialBeat = oBackground.mode == 0 and !global.start;
		barNumber++;
		
		if(barNumber == 5 && global.start) {
			audio_pause_sound(song);
			exit;
		}
		else if(barNumber == 4 && global.start) beats = [0,3,2,1,2,3,0,1];
		else for(var i = 0; i < numberOfBeats/2; i++) {
			if(global.hardMode && irandom(4) == 0) beats[i] = 4;
			else beats[i] = irandom(3);
		}
	}
	
	show_debug_message(numberOfBeats);
	
	if(_time != lastTime) {
		oPlayer.cannonMove = 2;
		if(_time < numberOfBeats/2) {
			if(beats[_time] != 4) {
				var _dir = beats[_time]*90;
				if(oBackground.mode == 0) instance_create_layer(room_width/2+lengthdir_x(room_width/2-16,_dir),room_height/2+lengthdir_y(room_height/2-16,_dir),"GUI",oWarning);
				audio_play_sound(global.dirSounds[beats[_time]],2,false);
			}
		} /*else if(lastTime < numberOfBeats^2/4 && irandom(2) == 0 && !global.start) {
			oBackground.mode = 0;
			oGUI.heartAmount = 0;
		}*/
	}

	if(_aheadTime != aheadLastTime && _aheadTime >= numberOfBeats/2 && beats[_aheadTime-numberOfBeats] != 4) {
		var _dir = beats[_aheadTime-numberOfBeats]*90;
		with(instance_create_layer(room_width/2+lengthdir_x(150,_dir),room_height/2+lengthdir_y(150,_dir),"Enemy",oEnemy)) {
			direction = _dir;
			speed = -4+global.hardMode*2;
		}
	}

	lastTime = _time;
	aheadLastTime = _aheadTime
}