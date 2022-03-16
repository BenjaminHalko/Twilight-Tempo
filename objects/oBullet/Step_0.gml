function HitEnemy(_x,_y) {
	var _enemyList = ds_list_create();
	
	var _enemy = noone;
	var _dist = -1;
	for(var i = 0; i < instance_position_list(_x,_y,oEnemy,_enemyList,false); i++) {
		if(_enemy == noone or point_distance(room_width/2,room_height/2,_enemyList[| i].x,_enemyList[| i].y) < _dist) and (!_enemyList[| i].dead) {
			_enemy = _enemyList[| i];
			_dist = point_distance(room_width/2,room_height/2,_enemyList[| i].x,_enemyList[| i].y);
		}
	}
	
	ds_list_destroy(_enemyList);
	
	if(_enemy != noone) {
		if(!_enemy.dead) {
			_enemy.dead = true;
			spd = 0;
			
			if(_enemy.sprite_index = sEnemy) {
				with(instance_create_layer(_enemy.x,_enemy.y,"GUI",oScore)) amount = string(other.amountOfPoints);
				global.score += amountOfPoints;
			} else if(oGUI.heartAppear) oGUI.heartAmount++;
		}
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