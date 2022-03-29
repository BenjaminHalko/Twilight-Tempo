/// @desc

if(!global.hintMode && !global.start && !newHighscore) {
	if(global.score > global.hiScore[global.hardMode][# 0,9] or true) {
		newHighscore = AddScore();
		global.hiScore[global.hardMode][# 1,newHighscore] = chr(name[0])+chr(name[1])+chr(name[2]);
		exit;
	}
}
gameoverNum += 0.5;