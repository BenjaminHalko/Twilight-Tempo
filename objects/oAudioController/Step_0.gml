/// @desc
enableLive;

if(instance_exists(oEnemy)) {
	audio_emitter_position(test,oEnemy.x,oEnemy.y,0);
	audio_emitter_gain(test,abs(angle_difference(point_direction(oEnemy.x,oEnemy.y,room_width/2,room_height/2),oPlayer.dir))/180);
}