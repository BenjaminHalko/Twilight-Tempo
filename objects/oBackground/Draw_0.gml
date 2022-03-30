if(index != 0) {
	for(var i = 0; i < array_length(global.stars); i++) {
		draw_set_alpha(Wave(global.stars[i].alpha1,global.stars[i].alpha2,global.stars[i].alphaSpeed,global.stars[i].alphaOffset)*index/4);
		draw_point_color(global.stars[i].x,global.stars[i].y,global.stars[i].col);
		draw_set_alpha(1);
	}
}

function drawClouds(_x,_y) { draw_sprite_ext(sBackground,4,room_width/2+_x,room_height+_y,1,1,0,cloudColors[min(4,index)],1); }

drawClouds(0,0);
var _width = room_width - 40;
var _height = room_height - 20;
if (WIDTH > 256) {
	drawClouds(-_width*(WIDTH > 256),0);
	drawClouds(_width*(WIDTH > 256),0);
}
if(HEIGHT > 224) {
	drawClouds(0,-_height*(HEIGHT > 224));
	drawClouds(0,_height*(HEIGHT > 224));
}

if(index < 4) draw_sprite(sBackground,index,room_width/2,HEIGHT+GUIY);