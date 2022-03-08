/// @desc Shoot
enableLive;

//Input
Input();

//Direction
dir += (key_left-key_right) * 3.5;

dir = Wrap(dir,0,360);

audio_listener_orientation(sin(lengthdir_x(1,dir)), sin(lengthdir_y(1,dir)), 0, 0, 0, -1);

//Shooting
if(key_shoot_pressed) or (!key_shoot and charge > 0) {
	var _size = 10;
	var _amount = _size*3;
	for(var i = 0; i < _amount; i++) {
		with(instance_create_layer(x+lengthdir_x(bulletLength,dir),y+lengthdir_y(bulletLength,dir),"Bullet",oBullet)) {
			direction = other.dir+lerp(-_size,_size,i/(_amount-1));
			image_angle = other.dir+lerp(-_size,_size,i/(_amount-1));
		}
	}
	
	shootPercent = 0;
}

if(key_shoot) {
	charge = ApproachFade(charge,1,0.1,0.6);
	chargeDraw = max(0,charge);
} else {
	charge = -1.2;
	chargeDraw = Approach(chargeDraw,0,0.2);
}


drawDir = ApproachCircleEase(drawDir,dir,40,0.6);
shootPercent = ApproachFade(shootPercent,1,0.1,0.6);