draw_set_font(GuiFont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

var _squish = oGlobalController.width / oGlobalController.height < 1.1;
var _guiX = GUIX+global.notchLeftTop;
var _guiY = GUIY+global.notchTop;
var _width = WIDTH-global.notchLeftTop-global.notchRightTop;
var _spacing = floor((_width-MaxResolution)/5)
	
draw_text(_guiX+7+_spacing,_guiY+6,"SCORE\n "+(_squish ? "" : " ")+string_replace_all(string_format(global.score,4,0)," ","0"));

draw_set_halign(fa_center);
if(global.start) draw_text(_guiX+_width/2+2*_squish,_guiY+6,"TUTORIAL\nLEVEL");
else if(global.hintMode) draw_text(_guiX+_width/2+2*_squish,_guiY+6,"PRACTICE\nMODE");
else {
	
	draw_text(_guiX+_width/2+2*_squish,_guiY+6,(_squish ? "HI" : "HIGH ")+"SCORE\n"+string_replace_all(string_format(global.hiScore[global.hardMode],5,0)," ","0"));
}

for(var i = 0; i < 3; i++) {
	draw_sprite_ext(sLife,median(0,(global.lives-i*4*(1+global.hintMode))*(2-global.hintMode),8),_guiX+_width-11-i*14-_spacing,_guiY+10,scale[i],scale[i],0,c_white,1);
}

if(gameoverNum > 0) and !global.pause {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_transformed(GUIX+WIDTH/2,GUIY+HEIGHT/2-35,"GAME OVER",2,2,0);
	
	draw_set_color(c_red);
	if(newRecord % 2) draw_text(_guiX+_width/2,_guiY+30,"NEW RECORD");
	draw_set_color(c_white);
	
	var _text = "TAP TO CONTINUE\n\n"; 
	_text += string(max(0,21-ceil(gameoverNum)));
	
	draw_text(GUIX+WIDTH/2,GUIY+HEIGHT/2+10,_text);
}