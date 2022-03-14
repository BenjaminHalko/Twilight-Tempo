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
		audio_sound_pitch(audio_play_sound(snPlayerShoot,2,false),random_range(0.5,1.3));
		
		with(instance_create_layer(x+lengthdir_x(bulletLength,dir),y+lengthdir_y(bulletLength,dir),"Bullet",oBullet)) {
			direction = other.dir;
			image_angle = other.dir;
			amountOfPoints = round(abs((global.time % 1) - 0.5)*200);
		}
	
		if((dir div 90) % 2 == 0) image_xscale = 0.3;
		else image_yscale = 0.3;
	
		shootPercent = 0;
	}

	drawDir = ApproachCircleEase(drawDir,dir,50,0.6);
	generalShake = Approach(generalShake,0,0.06);
}
else {
	if(global.alive == 0) deathSpd = ApproachFade(deathSpd,0,0.3,0.5);
	drawDir -= deathSpd*1.5;
	generalShake = Approach(generalShake,deathSpd/15,0.06);
	if(deathSpd == 0) {
		instance_create_depth(x,y,layer_get_depth(layer_get_id("Shadow"))-1,oPlayerExplode);
		audio_play_sound(snPlayerExplode,2,false);
		instance_destroy();
	}
}


cannonMove = ApproachFade(cannonMove,0,0.3,0.6);
shootPercent = ApproachFade(shootPercent,1,0.1,0.6);
if(startScale == 1.6) {
	image_xscale = ApproachFade(image_xscale,1+cannonMove/3*(image_xscale > 0.75)+(1-deathSpd/30),0.05,0.3);
	image_yscale = ApproachFade(image_yscale,1+cannonMove/3*(image_yscale > 0.75)+(1-deathSpd/30),0.05,0.3);
} else {
	startScale = Approach(startScale,1.6,0.05);
	image_xscale = animcurve_channel_evaluate(curve,min(1,startScale));
	image_yscale = animcurve_channel_evaluate(curve,min(1,startScale));
	if(startScale == 1.6) oBeatController.song = audio_play_sound(TestSong,1,true);
}
for(var i = 0; i < 4; i++) shake[i] = Approach(shake[i],0,0.06);

