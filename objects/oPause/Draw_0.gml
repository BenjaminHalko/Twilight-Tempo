/// @desc

if !global.pause draw_self();
else {
	draw_set_font(GuiFont);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	
	if countdown == 0 {
		draw_text_transformed(room_width/2,room_height/2-40,"PAUSED",2,2,0);
		resume.draw();
		restart.draw();
		quit.draw();
	} else {
		draw_text_transformed(room_width/2,room_height/2,string(ceil(countdown/20)),2,2,0);
	}
}