/// @desc

if global.pause exit;

for(var i = 0; i < 4; i++) {
	var _length = lerp(Wave(4,6,.5,i/4),10,deadPercent)*appear;
	draw_sprite_ext(sEnemySpike,0,x+lengthdir_x(_length,i*90+45),y+lengthdir_y(_length,i*90+45),1,1,i*90+45,c_white,appear-deadPercent);
}

if(!dead) draw_self();
else if(oShadow.darkness != 0) {
	//Remove Dark
	if(!surface_exists(oShadow.darkSurface)) oShadow.darkSurface = surface_create(WIDTH,HEIGHT);
	surface_set_target(oShadow.darkSurface);
	gpu_set_blendmode(bm_subtract);
	drawCircle(x-GUIX,y-GUIY,16,1-circlePercent);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}
if(appear != 1) draw_sprite_ext(sprite_index,1,x,y,image_xscale,image_yscale,image_angle,image_blend,1-appear);