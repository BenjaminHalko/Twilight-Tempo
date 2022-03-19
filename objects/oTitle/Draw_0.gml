/// @desc

for(var i = 0; i < array_length(stars); i++) {
	draw_set_alpha(Wave(stars[i].alpha1,stars[i].alpha2,stars[i].alphaSpeed,stars[i].alphaOffset));
	draw_point_color(stars[i].x,stars[i].y,stars[i].col);
	draw_set_alpha(1);
	stars[i].x -= stars[i].far*5*logoX;
	while(stars[i].x < 0) {
		stars[i].x += room_width;
		stars[i].y = irandom(room_height);
	}
}

if(show) {
	draw_set_font(GuiFont);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_color(c_white);
	draw_text(98,120+20*choice+10*(choice == 2),">");
	
	var _col = [c_white,c_dkgray];
	draw_set_color(_col[choice != 0 and global.challenge != undefined]);
	if(choice == 1 or selected % 2 == 0) draw_text(113,120,"NORMAL");
	
	draw_set_color(_col[choice != 1 and global.challenge != undefined]);
	if(choice == 0 or selected % 2 == 0) draw_text(113,140,"HARD");
	
	draw_set_color(_col[global.challenge != undefined]);
	var _onoff = ["OFF","ON"];
	draw_text(113,170,"PRACTICE: "+_onoff[global.hintMode]);
	
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	
	draw_text(room_width/2,200,"© 2022 BENJAMIN HALKO");
	draw_text(room_width/2,210,"ALL RIGHTS RESERVED");
}

draw_sprite_ext(sTwilight,0,room_width/2,lerp(100,40,logoY),lerp(1.5,1,logoY)*bounce,bounce,0,c_white,logoY);
draw_sprite_part(sTempo,0,0,0,sprite_get_width(sTempo)*logoX,sprite_get_height(sTempo),room_width/2-10,50);