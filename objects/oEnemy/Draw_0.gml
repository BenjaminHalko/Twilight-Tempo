/// @desc
enableLive;

for(var i = 0; i < 4; i++) {
	var _length = lerp(Wave(4,6,.5,i/4),10,deadPercent);
	draw_sprite_ext(sEnemySpike,0,x+lengthdir_x(_length,i*90+45),y+lengthdir_y(_length,i*90+45),1,1,i*90+45,c_white,1-deadPercent);
}

if(!dead) draw_self();
else {
	//Remove Dark
	if(!surface_exists(oShadow.darkSurface)) oShadow.darkSurface = surface_create(room_width,room_height);
	surface_set_target(oShadow.darkSurface);
	gpu_set_blendmode(bm_subtract);
	for(var i = 0; i < 6; i++) {
		draw_set_alpha((0.8-i*0.1)*(1-circlePercent));
		draw_circle(x-1,y-1,16+i*3,false);
	}
	draw_set_alpha(1);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}