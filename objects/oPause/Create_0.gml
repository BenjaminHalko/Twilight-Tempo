/// @desc

global.pause = false;
x = GUIX+WIDTH-24;
y = GUIY+HEIGHT-24;
alarm[0] = 1;

countdown = 0;

function Button(_name) constructor {
	x = room_width/2;
	y = 0;
	name = _name;
	widthHalf = 40;
	heightHalf = 10;
	
	draw = function() {
		draw_set_font(GuiFont);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_color(c_white);
		draw_roundrect(x-widthHalf,y-heightHalf,x+widthHalf,y+heightHalf,true);
		draw_text(x,y,name);
	}
	
	clicked = function() {
		return point_in_rectangle(mouse_x,mouse_y,x-widthHalf,y-heightHalf,x+widthHalf,y+heightHalf);
	}
}

resume = new Button("RESUME");
restart = new Button("RESTART");
quit = new Button("QUIT");