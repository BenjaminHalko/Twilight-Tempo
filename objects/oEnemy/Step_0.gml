enableLive;

var _dir = point_direction(x,y,room_width/2,room_height/2);
x = Approach(x,room_width/2,abs(lengthdir_x(0.2,_dir)));
y = Approach(y,room_height/2,abs(lengthdir_y(0.2,_dir)));