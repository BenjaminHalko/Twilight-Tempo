/// @desc
if(newRecord != 0) newRecord++;
if(!global.hintMode) {
	if(gameoverNum == 0 && !global.start && global.score > global.hiScore) {
		newRecord++;
		global.hiScore = global.score;
		if(os_type != os_operagx) {
			ini_open("save.ini");
			ini_write_real("scores",global.modeName[global.hardMode],global.hiScore);
			ini_close();
		}
	}
	if(gameoverNum == 0 and os_type == os_operagx and !global.start) gxc_challenge_submit_score(global.score,undefined,{challengeId: global.challengeID[global.hardMode]});
}
gameoverNum += 0.5;