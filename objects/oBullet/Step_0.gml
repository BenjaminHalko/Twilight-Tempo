enableLive;
if(draw) {
	if(startdir != -1) {
		var _from = startdir-range;
		var _to = startdir+range;
		
		array_push(image,[x,y,1,image_angle])
		var _wave = _from + (_to - _from) * 0.5 + sin(((time/60 + 0.2 * 0.3) / 0.2) * (pi*2)) * (_to - _from) * 0.5;
		direction = _wave;
		image_angle = _wave;
		time++;
	} else for(var i = 0; i < 4; i++) array_push(image,[x-lengthdir_x(i*speed/4,direction),y-lengthdir_y(i*speed/4,direction),1,direction]);
} else if(array_length(image) == 0) instance_destroy();
if(speed == 0) draw = false;