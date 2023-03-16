/// @desc
if global.pause exit;

if(gameoverNum > 0) {
	if(gameoverNum > 20) {
		game_restart();
	}
}

if(!instance_exists(oPlayer) and timer <= 0) {
	timer = 30;
	if(newRecord != 0) newRecord++;
	if(!global.hintMode) {
		if(gameoverNum == 0 && !global.start) {
			if global.score > global.hiScore[global.hardMode] {
				newRecord++;
				global.hiScore[global.hardMode] = global.score;
				ini_open("save.ini");
				ini_write_real("scores",global.hardMode,global.hiScore[global.hardMode]);
				ini_close();
			}
		
			GooglePlayServices_Leaderboard_SubmitScore(global.hardMode ? HardLeaderboard : NormalLeaderboard,global.score,"");
		}
	}
	gameoverNum += 0.5;
}


for(var i = 0; i < 3; i++) {
	scale[i] = Approach(scale[i],1,0.05);
}