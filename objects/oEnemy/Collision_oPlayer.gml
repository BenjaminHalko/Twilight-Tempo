enableLive;

if(hit or global.alive != 1 or dead) exit;
oPlayer.shake[direction div 90] = 2;
oPlayer.generalShake = 2;
hit = true;
global.lives--;
oGUI.scale[global.lives div 4] = 1.4;

var _sound = audio_play_sound(snPlayerHurt,2,false);
audio_sound_pitch(_sound,random_range(0.8,1.2));
if(global.lives == 0) {
	audio_play_sound(snPlayerDie,3,false);
	if(os_type == os_operagx) gxc_challenge_submit_score(global.score,undefined,{challengeId:global.challengeID[global.hardMode]});
	else {
		ini_open("save.ini");
		ini_write_real("scores",global.modeName[global.hardMode],global.hiScore);
		ini_close();
	}
}