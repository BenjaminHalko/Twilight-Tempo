/// @desc
if(global.lives <= 0) exit;
dir = ((point_direction(room_width/2,room_height/2,mouse_x,mouse_y)+45) div 90) * 90;
shoot = true;