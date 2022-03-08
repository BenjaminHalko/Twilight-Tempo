/// @desc Shoot

//Input
Input();

//Direction
dir += (key_left-key_right) * 8 * allowCharge;

dir = Wrap(dir,0,360);

//Shooting
if(key_shoot_pressed and allowCharge) or (!key_shoot and charge > 0) {
	var _amount = 3+max((charge > 0)*3,0);
	for(var i = 0; i < _amount; i++) {
		var _map = ds_map_create();
		ds_map_add(_map,"x",x+lengthdir_x(bulletLength,dir));
		ds_map_add(_map,"y",y+lengthdir_y(bulletLength,dir));
		ds_map_add(_map,"dir",dir);
		ds_map_add(_map,"dead",false);
		ds_map_add_list(_map,"image",ds_list_create());
		ds_map_add(_map,"starttime",dir);
		ds_map_add(_map,"time",0);
		ds_map_add(_map,"offset",i/_amount+current_time*0.001);
		ds_map_add(_map,"maxtime",2+max((charge > 0)*2,0));
		ds_list_add(oBullet.bulletList,_map);
		ds_list_mark_as_map(oBullet.bulletList,ds_list_size(oBullet.bulletList)-1);
	}
	
	allowCharge = false;
	shootPercent = 0;
}

if(key_shoot and allowCharge) charge = ApproachFade(charge,1,0.1,0.6);
else {
	charge = Approach(charge,0,0.04);
	if(charge <= 0) {
		charge = chargeLow;
		allowCharge = true;
	}
}


chargeDraw = max(0,charge);

drawDir = ApproachCircleEase(drawDir,dir,40,0.6);
shootPercent = ApproachFade(shootPercent,1,0.1,0.6);