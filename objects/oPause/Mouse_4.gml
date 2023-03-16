/// @desc

if !global.pause {
	global.pause = true;
	audio_pause_all();
	audio_play_sound(snBlip,1,false);
}