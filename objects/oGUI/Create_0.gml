scale = array_create(3,1);
gameoverNum = 0;

gameoverChoice = 0;

if(os_type == os_operagx) {
	gxc_challenge_get_global_scores(undefined,{challengeId: global.challengeID[global.hardMode],pageSize: 1});
}
else {
	ini_open("save.ini");
	global.hiScore = ini_read_real("scores",global.modeName[global.hardMode],0);
	ini_close();
}