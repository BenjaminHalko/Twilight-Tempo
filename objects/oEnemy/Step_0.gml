if global.pause exit;

if(dead) {
	spd = 0;
	deadPercent = Approach(deadPercent,1,0.1);
	circlePercent = Approach(circlePercent,1,0.05);

	if(circlePercent == 1) instance_destroy();
}

if(hit or global.lives <= 0) {
	if(hit) {
		image_index = 1;
		image_xscale += 0.05;
		image_yscale += 0.05;
		spd *= 0.7;
		image_alpha -= 0.2;
		image_angle -= 20;
	} else {
		spd = ApproachFade(spd,0,0.1,0.6);
		image_alpha -= 0.05;
	}
	
	if(image_alpha <= 0) instance_destroy();
} else {
	appear = ApproachFade(appear,1,0.1,0.7);
	image_angle = lerp(360*(1-(direction <= 90)*2),0,appear);
	image_alpha = appear;
}

x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);