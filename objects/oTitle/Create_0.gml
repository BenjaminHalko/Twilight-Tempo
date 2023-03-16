/// @desc

window_set_size(320*2,224*2);

enum Menu {
	Main,
	Normal,
	Hard
}

show = false;
selected = 0;
logoY = 0;
logoX = 0;
stars = [];
bpm = 130;
song = noone;
lastTime = 100;
bounce = 1;

menuType = Menu.Main;
draw_set_font(GuiFont);

function Button(_sprite,_name,_width=-1,_iconOverText=false,_textSize=1,_height=-1) constructor {
	x = 0;
	y = 0;
	index = 0;
	sprite = _sprite;
	name = _name;
	iconOverText = _iconOverText;
	width = _width;
	textSize = _textSize;
	if is_undefined(_sprite) {
		spriteWidth = 0;
		spriteHeight = 0;
	} else {
		spriteWidth = sprite_get_width(_sprite);
		spriteHeight = sprite_get_height(_sprite);
	}
	textWidth = string_width(_name)*textSize;
	textHeight = string_height(_name)*textSize;
	margin = 3;
	widthHalf = 0;
	heightHalf = 0;
	originalWidth = width;
	height = _height;
	originalHeight = height;
	iconOnRight = false;
	
	borderWidthHalf = 0;
	borderHeightHalf = 0;
	
	coloredBorder = c_white;
	
	updateText = function(_newText) {
		name = _newText;
		textWidth = string_width(_newText)*textSize;
		textHeight = string_height(_newText)*textSize;
	}
	
	draw = function(_dontDrawText=false) {
		if iconOverText {
			widthHalf = width / 2;
			heightHalf = ceil((spriteHeight+textHeight+4)/2);
			borderWidthHalf = widthHalf+margin;
			borderHeightHalf = heightHalf+margin;
			draw_set_color(coloredBorder);
			draw_set_font(GuiFont);
			draw_set_halign(fa_center);
			draw_set_valign(fa_bottom);
			draw_roundrect(x-widthHalf-margin,y-heightHalf-margin,x+widthHalf+margin,y+heightHalf+margin,true);
			draw_sprite(sprite,index,x-spriteWidth/2,y-heightHalf);
			draw_set_color(c_white);
			draw_text(x+1,y+heightHalf-2,name);
		} else {
			var _col = coloredBorder;
			heightHalf = max(spriteHeight/2,textHeight/2);
			if height != -1 heightHalf = height/2;
			if name == "" {
				widthHalf = spriteWidth/2;
				_col = c_gray;
			}
			else if is_undefined(sprite) widthHalf = ceil(textWidth/2)+2;
			else widthHalf = ceil((spriteWidth+textWidth+4+8*(coloredBorder != -1))/2);
			borderWidthHalf = widthHalf+margin;
			borderHeightHalf = heightHalf+margin;
			if width != -1 borderWidthHalf = width/2+margin;
			draw_set_color(_col);
			draw_set_font(GuiFont);
			draw_set_halign(fa_right);
			if iconOnRight draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			draw_set_color(coloredBorder == -1 ? (global.hardMode ? #FE0054 : #00F0F0): _col);
			draw_roundrect(x-borderWidthHalf,y-borderHeightHalf,x+borderWidthHalf,y+borderHeightHalf,true);
			draw_set_color(c_white);
			if coloredBorder != c_white _col = c_white;
			if !is_undefined(sprite) draw_sprite_ext(sprite,index,x-widthHalf*(1-iconOnRight*2)-spriteWidth*iconOnRight,y-spriteHeight/2,1,1,0,_col,1);
			if name != "" and !_dontDrawText draw_text_transformed(x+widthHalf*(1-iconOnRight*2),y+1,name,textSize,textSize,0);
		}
	}
	
	clicked = function() {
		return point_in_rectangle(mouse_x,mouse_y,x-borderWidthHalf,y-borderHeightHalf,x+borderWidthHalf,y+borderHeightHalf);	
	}
	
	draw();
}

achievements = new Button(sGooglePlay,"");
back = new Button(sBack,"");

normal = new Button(sNormal,"NORMAL",120,true);
hard = new Button(sHard,"HARD",120,true);

leaderboard = new Button(sGooglePlay,"LEADERBOARD",130);

start = new Button(undefined,"START",130,false,2,50);
practice = new Button(undefined,"PRACTICE (HPx2)",-1,false,1,18);
tutorial = new Button(sTutorial,"SKIP TUTORIAL",130);
pb = new Button(undefined,"HISCORE: 0000",130,false,1,leaderboard.heightHalf*2);
tutorial.index = !global.start;

start.coloredBorder = -1;
practice.coloredBorder = -1;
tutorial.coloredBorder = -1;
leaderboard.coloredBorder = -1;
pb.coloredBorder = -1;
normal.coloredBorder = #00F0F0;
hard.coloredBorder = #FE0054;
hard.iconOnRight = true;

audio_play_sound(snIntro,2,false);

event_user(0);