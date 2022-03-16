for(var i = 0; i < array_length(image); i++) {
	draw_sprite_ext(sprite_index,image_index,image[i][0],image[i][1],1,1,image[i][3],image_blend,image[i][2]);
	
	//Remove Dark
	if(image[i][3] == direction and oShadow.darkness != 0) {
		if(!surface_exists(oShadow.darkSurface)) oShadow.darkSurface = surface_create(room_width,room_height);
		surface_set_target(oShadow.darkSurface);
		gpu_set_blendmode(bm_subtract);
		for(var j = 0; j < 6; j++) {
			draw_sprite_ext(sprite_index,image_index,image[i][0],image[i][1],1,2+j*2,image[i][3],image_blend,(1-j*0.1)*image[i][2]);
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