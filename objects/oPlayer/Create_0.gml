drawDir = 0;
dir = 0;

shootPercent = 1;
cannonLength = 10;
bulletLength = 11;

shake = array_create(4,0);
generalShake = 0;

cannonMove = 0;

deathSpd = 45;

penalty = 0;

shoot = false;

startScale = 0;
curve = animcurve_get_channel(PlayerStartCurve,0);

explodeArray = array_create(1024,0);
for(var i = 0; i < 32; i++) {
	for(var j = 0; j < 32; j++) {
		explodeArray[i*32+j] = [
			x,
			y,
			random(4),
			point_direction(0,0,-16+i,-16+j)+random_range(-10,10),
			0,
			irandom_range(40,160),
			(i div 2)*16 + j div 2
		]
	}
}