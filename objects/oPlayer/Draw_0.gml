enableLive;

draw_sprite_ext(sprite_index,image_index,x+2,y+2,1,lerp(0.5,1,shootPercent),image_angle,c_black,0.5);
draw_sprite_ext(sCannon,0,x+2+lengthdir_x(lerp(cannonLength[2],cannonLength[0],shootPercent),dir),y+2+lengthdir_y(lerp(cannonLength[1],cannonLength[0],shootPercent),dir),lerp(0.1,1,shootPercent),1,dir,c_black,0.5);

draw_sprite_ext(sprite_index,image_index,x,y,1,lerp(0.5,1,shootPercent),image_angle,image_blend,image_alpha);
draw_sprite_ext(sCannon,0,x+lengthdir_x(lerp(cannonLength[2],cannonLength[0],shootPercent),dir),y+lengthdir_y(lerp(cannonLength[1],cannonLength[0],shootPercent),dir),lerp(0.1,1,shootPercent),1,dir,c_white,1);