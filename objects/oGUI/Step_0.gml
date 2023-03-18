/// @desc
if global.pause exit;

if(gameoverNum > 0) {
	if(gameoverNum > 20 || InputSelect()) {
		game_restart();
	}
}

if(!instance_exists(oPlayer) and timer <= 0) {
	timer = 30;
	if(newRecord != 0) newRecord++;
	if gameoverNum == 0 SaveScore();
	gameoverNum += 0.5;
}


for(var i = 0; i < 3; i++) {
	scale[i] = Approach(scale[i],1,0.05);
}