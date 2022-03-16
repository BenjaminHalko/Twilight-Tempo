draw_set_font(GuiFont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
	
draw_text(6,6,"SCORE\n  "+string_replace_all(string_format(global.score,4,0)," ","0"));

draw_set_halign(fa_center);
if(global.start) draw_text(room_width/2,6,"TUTORIAL\nLEVEL");
else draw_text(room_width/2,6,"HIGH SCORE\n"+string_replace_all(string_format(global.hiScore,5,0)," ","0"));

for(var i = 0; i < 3; i++) {
	draw_sprite_ext(sLife,median(0,global.lives-i*4,4),room_width-10-i*14,10,scale[i],scale[i],0,c_white,1);
	scale[i] = Approach(scale[i],1,0.05);
}

if(gameoverNum > 0) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(room_width/2,room_height/2-35,"GAME OVER",2,2,0);
	
	draw_set_color(c_red);
	if(newRecord % 2) draw_text(room_width/2,30,"NEW RECORD");
	draw_set_color(c_white);
	
	draw_text(room_width/2,room_height/2+10,"CONTINUE?\n\n"+string(20-ceil(gameoverNum)));
	
	draw_set_halign(fa_right);
	var _text = "YES";
	if(gameoverChoice == 0) _text = ">YES";
	draw_text(room_width/2-20,room_height/2+40,_text);
	
	_text = "NO";
	if(gameoverChoice == 1) _text = ">NO";
	draw_text(room_width/2+40,room_height/2+40,_text);
}