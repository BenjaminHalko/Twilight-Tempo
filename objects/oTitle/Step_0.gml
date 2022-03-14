/// @desc

enableLive;

if(show) {
	Input();

	if(key_select) {
		global.hardMode = choice;
		room_goto(rGame);
	}
	
	if(key_up_pressed or key_down_pressed or key_left_pressed or key_right_pressed) choice = !choice;
}

logoY = ApproachFade(logoY,1,0.02,0.85);

if(logoY >= 1) logoX = Approach(logoX,2,0.05);

if(logoX >= 2) show = true;

if(array_length(stars) < 150) array_push(stars,{
	x: random(room_width),
    y: random(room_height),
	col: choose(#d2de8e,#60205a),
	alpha1: random(1),
	alpha2: random(1),
	alphaSpeed: random_range(1,5),
	alphaOffset: random(1),
	far: random(1)
});