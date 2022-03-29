/// @desc

choice = 0;

show = global.demo;

selected = 0;

logoY = 0;
logoX = 0;

stars = [];

bpm = 130;

lastTime = 100;

bounce = 1;

audio_play_sound(snIntro,2,false);
if(global.demo) {
	while(array_length(stars) < 150) array_push(stars,{
		x: random(room_width),
	    y: random(room_height),
		col: choose(#d2de8e,#60205a),
		alpha1: random(1),
		alpha2: random(1),
		alphaSpeed: random_range(1,5),
		alphaOffset: random(1),
		far: random(1)
	});
}