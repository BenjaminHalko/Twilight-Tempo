enableLive;

if(dead) {
	speed = 0;
	deadPercent = Approach(deadPercent,1,0.1);
	circlePercent = Approach(circlePercent,1,0.05);

	if(circlePercent == 1) instance_destroy();
}

if(hit or global.alive != 1) {
	if(hit) {
		image_xscale += 0.05;
		image_yscale += 0.05;
		speed *= 0.8;
	} else speed = -4*global.alive;
	
	image_alpha -= 0.2;
	if(image_alpha <= 0) instance_destroy();
}