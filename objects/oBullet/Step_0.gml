enableLive;
if(draw) {
	if(startdir != -1) {
		for(var i = 0; i < 2; i++) {
			var _from = startdir-range;
			var _to = startdir+range;
		
			array_push(image,[x,y,1,image_angle])
			var _wave = _from + (_to - _from) * 0.5 + sin(((time/60 + 0.2 * 0.3) / 0.2) * (pi*2)) * (_to - _from) * 0.5;
			direction = _wave;
			image_angle = _wave;
			x += lengthdir_x(8,direction);
			y += lengthdir_y(8,direction);
			time++;
		}
	} else {
		x += lengthdir_x(spd,direction);
		y += lengthdir_y(spd,direction);	
		for(var i = 0; i < 4; i++) array_push(image,[x-lengthdir_x(i*spd/4,direction),y-lengthdir_y(i*spd/4,direction),1,direction]);
	}
} else if(array_length(image) == 0) instance_destroy();
if(spd == 0) draw = false;