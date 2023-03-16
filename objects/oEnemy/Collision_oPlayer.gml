if(hit or global.lives <= 0 or dead or global.pause) exit;
hit = true;

oPlayer.shake[direction div 90] = 2;
oPlayer.generalShake = 2;
global.lives--;
oGUI.scale[global.lives div (4*(1+global.hintMode))] = 1.4;

var _sound = audio_play_sound(snPlayerHurt,2,false);
audio_sound_pitch(_sound,random_range(0.8,1.2));
if(global.lives == 0) {
	if(!global.start) oBackground.mode = 1;
	audio_play_sound(snPlayerDie,3,false);
}