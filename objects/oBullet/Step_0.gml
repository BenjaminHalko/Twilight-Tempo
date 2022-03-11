enableLive;

function HitEnemy(_x,_y) {
	var _enemy = instance_position(_x,_y,oEnemy);
	if(_enemy != noone) {
		_enemy.dead = true;
		spd = 0;
		
		var _score = 100-round(sin((abs(lengthdir_x(abs(abs(_enemy.x-room_width/2)-room_width/4)/room_width*4,direction))+abs(lengthdir_y(abs(abs(_enemy.y-room_height/2)-room_height/4)/room_height*4,direction)))*(pi/2))*100);
		with(instance_create_layer(_enemy.x,_enemy.y,"GUI",oScore)) amount = string(_score);
		global.score += _score;
	}
}	

if(spd != 0) {
	
	var _from = startdir-5;
	var _to = startdir+5;
	for(var i = 0; i < 4; i++) {
		x += lengthdir_x(spd,direction);
		y += lengthdir_y(spd,direction);
		array_push(image,[x,y,1,direction]);
		
		HitEnemy(x,y);
		if(spd == 0) break;
	}
	
	for(var j = 0; j <= min(i+1,3); j++) {
		waveX += lengthdir_x(8,direction);
		waveY += lengthdir_y(8,direction);
		
		var _wave = (_from + (_to - _from) * 0.5 + sin(((time/60 + 0.15 * 0.3) / 0.15) * (pi*2)) * (_to - _from) * 0.5) * min(1,time / 2);
		
		var _x = waveX + lengthdir_x(_wave,direction+90);
		var _y = waveY + lengthdir_y(_wave,direction+90);
		
		array_push(image,[_x,_y,1,point_direction(lastX,lastY,_x,_y)]);
		lastX = _x;
		lastY = _y;
		
		time++;
	}
} else if(array_length(image) == 0) instance_destroy();