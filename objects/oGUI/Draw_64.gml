draw_set_font(GuiFont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
	
draw_text(6,6,"SCORE\n  "+string_replace_all(string_format(global.score,4,0)," ","0"));

draw_set_halign(fa_center);
if(global.start) draw_text(WIDTH/2,6,"TUTORIAL\nLEVEL");
else if(global.hintMode) draw_text(WIDTH/2,6,"PRACTICE\nMODE");
else draw_text(WIDTH/2,6,"HIGH SCORE\n"+string_replace_all(string_format(global.hiScore[global.hardMode],5,0)," ","0"));

for(var i = 0; i < 3; i++) {
	draw_sprite_ext(sLife,median(0,(global.lives-i*4*(1+global.hintMode))*(2-global.hintMode),8),WIDTH-10-i*14,10,scale[i],scale[i],0,c_white,1);
}

if(gameoverNum > 0) and !global.pause {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(WIDTH/2,HEIGHT/2-35,"GAME OVER",2,2,0);
	
	draw_set_color(c_red);
	if(newRecord % 2) draw_text(WIDTH/2,30,"NEW RECORD");
	draw_set_color(c_white);
	
	var _text = "TAP TO CONTINUE\n\n";
	_text += string(20-ceil(gameoverNum))
	
	draw_text(WIDTH/2,HEIGHT/2+10,_text);
}