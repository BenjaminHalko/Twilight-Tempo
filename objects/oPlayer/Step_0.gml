/// @desc Shoot

if(global.lives > 0) {
	//Input
	Input();

	//Direction
	if(abs(key_right_pressed-key_left_pressed) != abs(key_down_pressed-key_up_pressed))
		dir = point_direction(0,0,key_right_pressed-key_left_pressed,key_down_pressed-key_up_pressed);

	//Shooting
	if(key_left_pressed or key_right_pressed or key_down_pressed or key_up_pressed) {
		if(collision_line(x,y,x+lengthdir_x(150,dir),y+lengthdir_y(150,dir),oEnemy,false,false) == noone) {
			penalty -= 100;
			with(instance_create_layer(x,y-10,"GUI",oScore)) amount = string(other.penalty);
			global.score = max(0,global.score+penalty);
			audio_stop_sound(snPlayerShootFail);
			audio_sound_pitch(audio_play_sound(snPlayerShootFail,2,false),random_range(0.4,0.5));
		} else {
			penalty = 0;
			audio_sound_pitch(audio_play_sound(snPlayerShoot,2,false),random_range(0.5,1.3));
			audio_play_sound(snEnemyDestroy,2,false);
		}
		
		with(instance_create_layer(x+lengthdir_x(bulletLength,dir),y+lengthdir_y(bulletLength,dir),"Bullet",oBullet)) {
			direction = other.dir;
			image_angle = other.dir;
			amountOfPoints = round(abs((global.time % 1) - 0.5)*200);
			for(var i = 0; i < 3; i++) {
				var _time = median(0,floor(global.time % oBeatController.numberOfBeats*2 + (i-1)*0.5) - oBeatController.numberOfBeats,oBeatController.numberOfBeats);
				if(_time % 2 && oBeatController.beats[_time] != 4) {
					amountOfPoints = round(abs((global.time % 0.5)*2 - 0.5)*200);
					exit;
				}
			}
			
		}
	
		if((dir div 90) % 2 == 0) image_xscale = 0.3;
		else image_yscale = 0.3;
	
		shootPercent = 0;
	}

	drawDir = ApproachCircleEase(drawDir,dir,50,0.6);
	generalShake = Approach(generalShake,0,0.06);
}
else {
	Rumble(0.7*min(15,deathSpd)/15,1);
	deathSpd = ApproachFade(deathSpd,0,0.3,0.5);
	drawDir -= min(30,deathSpd)*1.5;
	generalShake = Approach(generalShake,min(30,deathSpd)/15,0.06);
	if(deathSpd == 0) {
		Rumble(1,40);
		instance_create_depth(x,y,layer_get_depth(layer_get_id("Shadow"))-1,oPlayerExplode);
		audio_play_sound(snPlayerExplode,2,false);
		instance_destroy();
	}
}


cannonMove = ApproachFade(cannonMove,0,0.3,0.6);
shootPercent = ApproachFade(shootPercent,1,0.1,0.6);
if(startScale == 1.6) {
	image_xscale = ApproachFade(image_xscale,1+cannonMove/3*(image_xscale > 0.75)+(1-min(30,deathSpd)/30),0.05,0.3);
	image_yscale = ApproachFade(image_yscale,1+cannonMove/3*(image_yscale > 0.75)+(1-min(30,deathSpd)/30),0.05,0.3);
} else {
	startScale = Approach(startScale,1.6,0.05);
	image_xscale = animcurve_channel_evaluate(curve,min(1,startScale));
	image_yscale = animcurve_channel_evaluate(curve,min(1,startScale));
	if(startScale == 1.6) {
		if(global.start) oBeatController.song = audio_play_sound(mTutorial,1,false);
		else {
			oBeatController.song = audio_play_sound(mSong,1,true);
			oBeatController.startTime = choose(0,29.538,66.461);
			audio_sound_set_track_position(oBeatController.song, oBeatController.startTime);
		}
	}
}
for(var i = 0; i < 4; i++) shake[i] = Approach(shake[i],0,0.06);


