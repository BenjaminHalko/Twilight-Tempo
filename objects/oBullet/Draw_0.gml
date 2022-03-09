if(speed != 0) draw_self();

for(var i = 0; i < array_length(image); i++) {
	draw_sprite_ext(sprite_index,image_index,image[i][0],image[i][1],1,1,image_angle,image_blend,image[i][2]);
	image[i][2] -= 0.15;
	if(image[i][2] <= 0) {
		array_delete(image,i,1);
		i--;	
	}
}