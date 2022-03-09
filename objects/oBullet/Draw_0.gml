enableLive;

for(var i = 0; i < array_length(image); i++) {
	var _wave = 0;
	draw_sprite_ext(sprite_index,image_index,image[i][0]+lengthdir_x(_wave,image_angle+90),image[i][1]+lengthdir_y(_wave,image_angle+90),1,1,image[i][3],image_blend,image[i][2]);
	image[i][2] -= 0.15;
	if(image[i][2] <= 0) {
		array_delete(image,i,1);
		i--;	
	}
}