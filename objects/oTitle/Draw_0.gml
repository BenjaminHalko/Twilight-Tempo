/// @desc

enableLive;

for(var i = 0; i < array_length(stars); i++) {
	draw_set_alpha(Wave(stars[i].alpha1,stars[i].alpha2,stars[i].alphaSpeed,stars[i].alphaOffset));
	draw_point_color(stars[i].x,stars[i].y,stars[i].col);
	draw_set_alpha(1);
	stars[i].x -= stars[i].far*5*logoX;
	while(stars[i].x < 0) stars[i].x += room_width;
}

if(show) {
	

	draw_set_font(GuiFont);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);

	draw_text(85,150+20*choice,">");

	draw_text(100,150,"NORMAL");
	draw_text(100,170,"HARD");
}

draw_sprite_ext(sTwilight,0,room_width/2,lerp(100,40,logoY),lerp(1.5,1,logoY),1,0,c_white,logoY);
draw_sprite_part(sTempo,0,0,0,sprite_get_width(sTempo)*logoX,sprite_get_height(sTempo),room_width/2-10,50);