for(var i = 0; i < ds_list_size(bulletList); i++) {
	if(!bulletList[| i][? "dead"]) draw_sprite_ext(sBullet,0,bulletList[| i][? "x"],bulletList[| i][? "y"],1,1,bulletList[| i][? "dir"],c_white,1);
	
	for(var j = 0; j < ds_list_size(bulletList[| i][? "image"]); j++) {
		draw_sprite_ext(sBullet,0,bulletList[| i][? "image"][| j][? "x"],bulletList[| i][? "image"][| j][? "y"],1,1,bulletList[| i][? "image"][| j][? "dir"],c_white,bulletList[| i][? "image"][| j][? "alpha"]);
		bulletList[| i][? "image"][| j][? "alpha"] -= 0.15;
		if(bulletList[| i][? "image"][| j][? "alpha"] <= 0) {
			ds_list_delete(bulletList[| i][? "image"],j);
			j--;
		}
	}
}