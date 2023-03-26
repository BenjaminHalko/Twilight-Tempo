
/// @desc

for(var i = 0; i < array_length(stars); i++) {
	draw_set_alpha(Wave(stars[i].alpha1,stars[i].alpha2,stars[i].alphaSpeed,stars[i].alphaOffset));
	draw_point_color(stars[i].x+GUIX,stars[i].y+GUIY,stars[i].col);
	draw_set_alpha(1);
	stars[i].x -= stars[i].far*5*logoX;
	while(stars[i].x < 0) {
		stars[i].x += WIDTH;
		stars[i].y = irandom(HEIGHT);
		if menuType != Menu.Main and stars[i].colNumber == 2-global.hardMode
			stars[i].col = global.starColors[stars[i].colNumber+2];
		else
			stars[i].col = global.starColors[stars[i].colNumber];
	}
}

if(show) {
	draw_set_font(GuiFont);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text(room_width/2,HEIGHT-24+GUIY,"© 2023 BENJAMIN HALKO");
	draw_text(room_width/2,HEIGHT-14+GUIY,"ALL RIGHTS RESERVED");
	
	
	if menuType == Menu.Main {
		achievements.draw();
		normal.draw();
		hard.draw();
	} else {
		start.draw((selected % 2) * (!global.hintMode));
		practice.draw((selected % 2) * global.hintMode);
		tutorial.draw();
		leaderboard.draw();
		back.draw();
		pb.draw();
	}
}

draw_sprite_ext(sTwilight,0,room_width/2,60*(1-logoY)+GUIY+titleY,lerp(1.5,1,logoY)*bounce,bounce,0,c_white,logoY);
draw_sprite_part(sTempo,0,0,0,sprite_get_width(sTempo)*logoX,sprite_get_height(sTempo),room_width/2-10,titleY+10+GUIY);