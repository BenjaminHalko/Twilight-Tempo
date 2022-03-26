if(index != 0) {
	for(var i = 0; i < array_length(global.stars); i++) {
		draw_set_alpha(Wave(global.stars[i].alpha1,global.stars[i].alpha2,global.stars[i].alphaSpeed,global.stars[i].alphaOffset)*index/4);
		draw_point_color(global.stars[i].x,global.stars[i].y,global.stars[i].col);
		draw_set_alpha(1);
	}
}

draw_sprite_ext(sBackground,4,0,0,1,1,0,cloudColors[min(4,index)],1);

if(index < 4) draw_sprite(sBackground,index,0,0);