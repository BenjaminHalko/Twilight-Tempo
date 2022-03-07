enableLive;

stars = [];

repeat(120) array_push(stars,{
	x: random(room_width),
    y: random(room_height),
	col: choose(#d2de8e,#60205a),
	alpha1: random(1),
	alpha2: random(1),
	alphaSpeed: random_range(1,5),
	alphaOffset: random(1)
});