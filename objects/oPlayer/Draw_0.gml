enableLive;

var _x = x+random_range(-1,1)*chargeDraw/2;
var _y = y+random_range(-1,1)*chargeDraw/2;

draw_sprite_ext(sprite_index,image_index,_x+2,_y+2,1+chargeDraw/5,lerp(0.5,1,shootPercent)+chargeDraw/5,image_angle,c_black,0.5);
draw_sprite_ext(sCannon,0,x+2+lengthdir_x(lerp(cannonLength[2],cannonLength[0],shootPercent),dir),y+2+lengthdir_y(lerp(cannonLength[1],cannonLength[0],shootPercent),dir),lerp(0.1,1,shootPercent),1,dir,c_black,0.5);

draw_sprite_ext(sprite_index,image_index,_x,_y,1+chargeDraw/5,lerp(0.5,1,shootPercent)+chargeDraw/5,image_angle,merge_color(c_white,c_aqua,chargeDraw/2),image_alpha);
draw_sprite_ext(sCannon,0,x+lengthdir_x(lerp(cannonLength[2],cannonLength[0],shootPercent)+chargeDraw*2,dir),y+lengthdir_y(lerp(cannonLength[1],cannonLength[0],shootPercent)+chargeDraw*2,dir),lerp(0.1,1,shootPercent),1,dir,c_white,1);