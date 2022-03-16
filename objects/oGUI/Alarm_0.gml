/// @desc
if(newRecord != 0) newRecord++;
if(gameoverNum == 0 && !global.start && global.score > global.hiScore) {
	newRecord++;
	global.hiScore = global.score;
	if(os_type == os_operagx) gxc_challenge_submit_score(global.score,undefined,{challengeId:global.challengeID[global.hardMode]});
	else {
		ini_open("save.ini");
		ini_write_real("scores",global.modeName[global.hardMode],global.hiScore);
		ini_close();
	}
}
gameoverNum += 0.5;