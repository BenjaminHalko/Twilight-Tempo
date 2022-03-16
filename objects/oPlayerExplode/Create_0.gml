/// @desc
explodeArray = array_create(1024,0);

for(var i = 0; i < 32; i++) {
	for(var j = 0; j < 32; j++) {
		explodeArray[i*32+j] = [
			i div 2,
			j div 2,
			x,
			y,
			random(4),
			point_direction(0,0,-16+i,-16+j)+random_range(-10,10),
			0,
			irandom_range(40,160)
		]
	}
}