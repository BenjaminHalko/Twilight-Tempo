enableLive;

var _x = x + random_range(-shake[0]-generalShake,shake[2]+generalShake);
var _y = y + random_range(-shake[3]-generalShake,shake[1]+generalShake);

draw_sprite_ext(sprite_index,image_index,_x+2,_y+2,image_xscale,image_yscale,image_angle,c_black,0.5);
draw_sprite_ext(sCannon,0,x+2+lengthdir_x(lerp(cannonLength[1],cannonLength[0],shootPercent)*image_xscale,drawDir),y+2+lengthdir_y(lerp(cannonLength[1],cannonLength[0],shootPercent)*image_yscale,drawDir),lerp(0.1,1,shootPercent),1,drawDir,c_black,0.5);

draw_sprite_ext(sCannon,0,x+lengthdir_x(lerp(cannonLength[1],cannonLength[0],shootPercent)*image_xscale-cannonMove*1.1,drawDir),y+lengthdir_y(lerp(cannonLength[1],cannonLength[0],shootPercent)*image_yscale-cannonMove*1.1,drawDir),lerp(0.1,1,shootPercent),1,drawDir,c_white,1);
draw_sprite_ext(sprite_index,image_index,_x,_y,image_xscale,image_yscale,image_angle,c_white,image_alpha);