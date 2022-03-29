/// @desc
if(newRecord != 0) newRecord++;
if(!global.hintMode) {
	if(gameoverNum == 0 && !global.start && global.score > global.hiScore[global.hardMode]) {
		newRecord++;
		global.hiScore[global.hardMode] = global.score;
		ini_open("save.ini");
		ini_write_real("scores",global.hardMode,global.hiScore[global.hardMode]);
		ini_close();
	}
}
gameoverNum += 0.5;