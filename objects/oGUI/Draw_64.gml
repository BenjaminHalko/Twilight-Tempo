enableLive;

draw_set_font(GuiFont);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _scoreText = "Score: "+string(global.score);

draw_set_color(c_black);
draw_set_alpha(0.5);
draw_text(4,4,_scoreText);
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(2,2,_scoreText);

for(var i = 0; i < 3; i++) {
	draw_sprite_ext(sLife,median(0,global.lives-i*4,4),room_width-8-i*14,8,scale[i],scale[i],0,c_white,1);
	scale[i] = Approach(scale[i],1,0.05);
}