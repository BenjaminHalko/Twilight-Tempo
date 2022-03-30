if(global.lives > 0) {
	audio_play_sound(snPlayerDie,3,false);
	global.lives = 0;
}