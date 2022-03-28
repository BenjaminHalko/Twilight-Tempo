/// @desc
if(global.song == noone) exit;
global.time = audio_sound_get_track_position(global.song)/60*global.bpm;
if((global.demo or room == rTitle) && floor(global.time) > lastWaitTime) {
	if(waitTimer == (room == rTitle)) {
		waitTimer = maxWait;
		global.demo = true;
		if(room == rTitle) {
			waitTimer = 65;
			room_goto(rGame);
		}
		else room_goto(rTitle);
	}
	waitTimer--;
	
	lastWaitTime = floor(global.time);
}

if(global.demo && room != rTitle) {
	Input();
	if(key_select or key_left or key_right or key_up or key_down) game_restart();
}