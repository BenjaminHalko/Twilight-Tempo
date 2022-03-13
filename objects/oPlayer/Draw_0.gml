enableLive;

var _x = x + random_range(-shake[0]-generalShake,shake[2]+generalShake);
var _y = y + random_range(-shake[3]-generalShake,shake[1]+generalShake);

var _x2 = x + random_range(-shake[0]-generalShake,shake[2]+generalShake);
var _y2 = y + random_range(-shake[3]-generalShake,shake[1]+generalShake);

draw_sprite_ext(sprite_index,image_index,_x+2,_y+2,image_xscale*(1-generalShake/12),image_yscale*(1-generalShake/12),image_angle,c_black,0.5);
draw_sprite_ext(sCannon,0,_x2+2+lengthdir_x(lerp(cannonLength-1,cannonLength,shootPercent)*image_xscale-cannonMove*1.1,drawDir),_y2+2+lengthdir_y(lerp(cannonLength-1,cannonLength,shootPercent)*image_yscale-cannonMove*1.1,drawDir),lerp(0.1,1,shootPercent),1,drawDir,c_black,0.5);

draw_sprite_ext(sCannon,0,_x2+lengthdir_x(lerp(cannonLength-1,cannonLength,shootPercent)*image_xscale-cannonMove*1.1,drawDir),_y2+lengthdir_y(lerp(cannonLength-1,cannonLength,shootPercent)*image_yscale-cannonMove*1.1,drawDir),lerp(0.1,1,shootPercent),1,drawDir,merge_color(c_white,c_red,min(1,generalShake/2)),1);
draw_sprite_ext(sprite_index,image_index,_x,_y,image_xscale*(1-generalShake/12),image_yscale*(1-generalShake/12),image_angle,merge_color(c_white,c_red,min(1,generalShake/2)),image_alpha);