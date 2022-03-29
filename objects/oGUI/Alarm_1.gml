/// @desc
InputHold();

if(key_up or key_down) and selected != 3 {
	name[selected] -= key_down-key_up;
	if(name[selected] < 65) name[selected] = 90;
	else if(name[selected] > 90) name[selected] = 65;
	global.hiScore[global.hardMode][# 1,newHighscore] = chr(name[0])+chr(name[1])+chr(name[2]);
	alarm[1] = 5;
}