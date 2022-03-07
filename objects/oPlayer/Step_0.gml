/// @desc Shoot
enableLive;

//Input
Input();

//Direction
dir += (key_left-key_right) * 10;

//Shooting
if(key_shoot) {
	with(instance_create_layer(x+lengthdir_x(bulletLength,dir),y+lengthdir_y(bulletLength,dir),"Bullet",oBullet)) {
		direction = other.dir;
		image_angle = other.dir;
	}
	
	shootPercent = 0;
}



drawDir = ApproachCircleEase(drawDir,dir,40,0.6);
shootPercent = ApproachFade(shootPercent,1,0.1,0.6);