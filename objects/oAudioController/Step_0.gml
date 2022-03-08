/// @desc
enableLive;

if(instance_exists(oEnemy)) {
	
	var _dir = angle_difference(point_direction(room_width/2,room_height/2,oEnemy.x,oEnemy.y),oPlayer.dir);
	audio_emitter_position(test,median(1,-1,_dir/100),0,0);
	audio_emitter_gain(test,1-abs(_dir/180));
}