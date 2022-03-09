/// @desc Shoot

//Input
Input();

//Direction
if(key_right-key_left != 0 or key_down-key_up != 0)
	dir = point_direction(0,0,key_right-key_left,key_down-key_up);

//Shooting
if(key_shoot_pressed) {
	with(instance_create_layer(x+lengthdir_x(bulletLength,dir),y+lengthdir_y(bulletLength,dir),"Bullet",oBullet)) {
		direction = other.dir;
		image_angle = other.dir;
	}
	
	shootPercent = 0;
}

drawDir = ApproachCircleEase(drawDir,dir,40,0.6);
shootPercent = ApproachFade(shootPercent,1,0.1,0.6);