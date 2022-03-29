/// @desc
if(newRecord != 0) newRecord++;
if(!global.hintMode) {
	if(gameoverNum == 0 && !global.start && global.score > global.hiScore) {
		newRecord++;
		global.hiScore = global.score;
		ini_open("save.ini");
		ini_write_real("scores",global.modeName[global.hardMode],global.hiScore);
		ini_close();
	}
}
gameoverNum += 0.5;