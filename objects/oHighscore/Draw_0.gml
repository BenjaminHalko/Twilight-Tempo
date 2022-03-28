draw_set_font(GuiFont);
draw_set_color(c_white);
draw_set_valign(fa_middle);

if(selected != 3) {
	draw_set_halign(fa_left);
	draw_text_transformed(room_width/2+(selected-1)*30-2,room_height/2-24,">",4,4,90);
	draw_set_halign(fa_right);
	draw_text_transformed(room_width/2+(selected-1)*30,room_height/2+20,">",4,4,-90);
}

draw_set_halign(fa_center);
for(var i = 0; i < 3; i++) {
	draw_text_transformed(room_width/2+(i-1)*30,room_height/2,chr(name[i]),4,4,0);
}