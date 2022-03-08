for(var i = 0; i < ds_list_size(bulletList); i++) {
	if(bulletList[| i][? "dead"]) {
		if(ds_list_empty(bulletList[| i][? "image"])) {
			ds_list_delete(bulletList,i);
			i--;
		}
		continue;
	}
	
	var _from = bulletList[| i][? "starttime"]-range*min(bulletList[| i][? "maxtime"],bulletList[| i][? "time"]);
	var _to = bulletList[| i][? "starttime"]+range*min(bulletList[| i][? "maxtime"],bulletList[| i][? "time"]);
	bulletList[| i][? "dir"] = _from + (_to - _from) * 0.5 + sin(((bulletList[| i][? "time"]/60 + 0.5 * bulletList[| i][? "offset"]) / 0.5) * (pi*2)) * (_to - _from) * 0.5;
	bulletList[| i][? "x"] += lengthdir_x(spd,bulletList[| i][? "dir"]);
	bulletList[| i][? "y"] += lengthdir_y(spd,bulletList[| i][? "dir"]);

	var _map = ds_map_create();
	
	ds_map_add(_map,"x",bulletList[| i][? "x"]);
	ds_map_add(_map,"y",bulletList[| i][? "y"]);
	ds_map_add(_map,"dir",bulletList[| i][? "dir"]);
	ds_map_add(_map,"alpha",1);
	
	ds_list_add(bulletList[| i][? "image"],_map);
	ds_list_mark_as_map(bulletList[| i][? "image"],ds_list_size(bulletList[| i][? "image"])-1);
	
	if(bulletList[| i][? "x"] < 0 or bulletList[| i][? "x"] >= room_width or bulletList[| i][? "y"] < 0 or bulletList[| i][? "y"] >= room_height) bulletList[| i][? "dead"] = true;
	
	bulletList[| i][? "time"]++;
	
	var _enemy = instance_position(bulletList[| i][? "x"],bulletList[| i][? "y"],oEnemy);
	if(_enemy != noone) {
		bulletList[| i][? "dead"] = true;
		instance_destroy(_enemy);
	}
}