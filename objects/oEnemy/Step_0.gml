enableLive;

if(dead) {
	speed = 0;
	deadPercent = Approach(deadPercent,1,0.1);
	circlePercent = Approach(circlePercent,1,0.05);

	if(circlePercent == 1) instance_destroy();
}

if(hit) {
	speed *= 0.8;
	image_xscale += 0.05;
	image_yscale += 0.05;
	image_alpha -= 0.2;
	if(image_alpha <= 0) instance_destroy();
}