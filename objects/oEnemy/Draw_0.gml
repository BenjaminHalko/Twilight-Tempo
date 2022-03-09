/// @desc
enableLive;

for(var i = 0; i < 4; i++) {
	var _length = lerp(Wave(4,6,.5,i/4),10,deadPercent);
	draw_sprite_ext(sEnemySpike,0,x+lengthdir_x(_length,i*90+45),y+lengthdir_y(_length,i*90+45),1,1,i*90+45,c_white,1-deadPercent);
}

if(!dead) draw_self();