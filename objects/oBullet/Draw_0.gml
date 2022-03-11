enableLive;

for(var i = 0; i < array_length(image); i++) {
	var _wave = 0;
	draw_sprite_ext(sprite_index,image_index,image[i][0]+lengthdir_x(_wave,image_angle+90),image[i][1]+lengthdir_y(_wave,image_angle+90),1,1,image[i][3],image_blend,image[i][2]);
	
	if(startdir == -1) {
		//Remove Dark
		if(!surface_exists(oShadow.darkSurface)) oShadow.darkSurface = surface_create(room_width,room_height);
		surface_set_target(oShadow.darkSurface);
		gpu_set_blendmode(bm_subtract);
		for(var j = 0; j < 6; j++) {
			draw_sprite_ext(sprite_index,image_index,image[i][0]+lengthdir_x(_wave,image_angle+90),image[i][1]+lengthdir_y(_wave,image_angle+90),0.8,16-j*2,image[i][3],image_blend,image[i][2]);
		}
		draw_set_alpha(1);
		gpu_set_blendmode(bm_normal);
		surface_reset_target();
	}
	
	image[i][2] -= 0.15;
	if(image[i][2] <= 0) {
		array_delete(image,i,1);
		i--;	
	}
}