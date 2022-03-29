draw_set_font(GuiFont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

draw_text(6,6,"SCORE\n  "+string_replace_all(string_format(global.score,4,0)," ","0"));
draw_set_halign(fa_center);
if(global.start) draw_text(room_width/2,6,"TUTORIAL\nLEVEL");
else if(global.hintMode) draw_text(room_width/2,6,"PRACTICE\nMODE");
else draw_text(room_width/2,6,"HIGH SCORE\n"+string_replace_all(string_format(global.hiScore[global.hardMode][# 0,0],5,0)," ","0"));

for(var i = 0; i < 3; i++) {
	draw_sprite_ext(sLife,median(0,(global.lives-i*4*(1+global.hintMode))*(2-global.hintMode),8),room_width-10-i*14,10,scale[i],scale[i],0,c_white,1);
	scale[i] = Approach(scale[i],1,0.05);
}

if(gameoverNum > 0) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	
	if(newHighscore) {
		
	} else {
		draw_text_transformed(room_width/2,room_height/2-35,"GAME OVER",2,2,0);
	
		var _text = "CONTINUE?\n\n";
		_text += string(20-ceil(gameoverNum));
	
		draw_text(room_width/2,room_height/2+10,_text);
	
		draw_set_halign(fa_right);
		var _text = "YES";
		if(gameoverChoice == 0) _text = ">YES";
		draw_text(room_width/2-20,room_height/2+40,_text);
	
		_text = "NO";
		if(gameoverChoice == 1) _text = ">NO";
		draw_text(room_width/2+40,room_height/2+40,_text);
	}
} else if(newHighscore != -1) {
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	var _col = [c_white,c_yellow];
	
	var _rankX = room_width/2-60;
	var _nameX = room_width/2-20;
	var _scoreX = room_width/2+20;
	draw_set_halign(fa_left);
		
	var _headerY = 48;
	draw_text(_rankX,_headerY,"RANK");
	draw_text(_nameX,_headerY,"NAME");
	draw_text(_scoreX,_headerY,"SCORE");
		
	_headerY += 12;
	var _numName;
	for(var i = 0; i < 10; i++)
	{
		switch (i) {
			case 0: _numName = "ST";
			break;
			case 1: _numName = "ND";
			break;
			case 2: _numName = "RD";
			break;
			default: _numName = "TH";
			break;
		}
		
		
		draw_set_color(_col[i == newHighscore]);
		draw_text(_rankX,_headerY+i*10,string(i+1)+_numName);
		draw_text(_nameX,_headerY+i*10,global.hiScore[global.hardMode][# 1,i]);
		draw_text(_scoreX,_headerY+i*10,string_replace_all(string_format(global.hiScore[global.hardMode][# 0,i],5,0)," ","0"));
	}
	
	draw_set_halign(fa_center);
	
	draw_set_color(c_white);
	draw_text(room_width/2,room_height*0.75,"ENTER YOUR NAME");
	
	for(var i = 0; i < 3; i++) {
		draw_set_color(_col[i == selected]);
		draw_text_transformed(room_width/2+(i-1)*30,room_height*0.75+24,chr(name[i]),3,3,0);
	}
}

if(global.demo && floor(global.time % 2) == 0) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_white);
	draw_text(room_width/2,room_height*.9,"PRESS START");
}