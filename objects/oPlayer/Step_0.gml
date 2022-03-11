/// @desc Shoot
enableLive;

if(global.alive == 1) {
	//Input
	Input();

	//Direction
	if(abs(key_right_pressed-key_left_pressed) != abs(key_down_pressed-key_up_pressed))
		dir = point_direction(0,0,key_right_pressed-key_left_pressed,key_down_pressed-key_up_pressed);

	//Shooting
	if(key_left_pressed or key_right_pressed or key_down_pressed or key_up_pressed) {
		with(instance_create_layer(x+lengthdir_x(bulletLength,dir),y+lengthdir_y(bulletLength,dir),"Bullet",oBullet)) {
			direction = other.dir;
			image_angle = other.dir;
		}
	
		if((dir div 90) % 2 == 0) image_xscale = 0.3;
		else image_yscale = 0.3;
	
		shootPercent = 0;
	}

	drawDir = ApproachCircleEase(drawDir,dir,50,0.6);
	generalShake = Approach(generalShake,0,0.06);
}
else {
	if(global.alive == 0) deathSpd = ApproachFade(deathSpd,0,0.2,0.5);
	drawDir -= deathSpd;
	generalShake = deathSpd/15;
	if(deathSpd == 0) {
		for(var i = 0; i < 8; i++) {
			with(instance_create_depth(x,y,layer_get_depth(layer_get_id("GUI"))+1,oExplode)) direction = i*45;
		}
		instance_destroy();
	}
}

cannonMove = ApproachFade(cannonMove,0,0.3,0.6);
shootPercent = ApproachFade(shootPercent,1,0.1,0.6);
image_xscale = ApproachFade(image_xscale,1+cannonMove/3*(image_xscale > 0.75)+(1-deathSpd/30),0.05,0.3);
image_yscale = ApproachFade(image_yscale,1+cannonMove/3*(image_yscale > 0.75)+(1-deathSpd/30),0.05,0.3);
for(var i = 0; i < 4; i++) shake[i] = Approach(shake[i],0,0.06);