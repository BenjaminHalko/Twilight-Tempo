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

explodeArray = array_create(256,0);
for(var i = 0; i < 16; i++) {
	for(var j = 0; j < 16; j++) {
		explodeArray[i*16+j] = [
			x,
			y,
			random(4),
			point_direction(0,0,-8+i,-8+j)+random_range(-10,10),
			0,
			irandom_range(40,160),
			i*16+j
		]
	}
}