/// @desc
if(global.lives <= 0) exit;
dir = ((point_direction(room_width/2,room_height/2,device_mouse_x(0),device_mouse_y(0))+45) div 90) * 90;
shoot = true;