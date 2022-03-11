enableLive;

if(global.alive != 1) exit;

var _realTime = audio_sound_get_track_position(song)/60*global.bpm;
var _time = floor((_realTime % (numberOfBeats*2)) * numberOfBeats/4);
var _aheadTime = floor(((_realTime+0.73) % (numberOfBeats*2)) * numberOfBeats/4);

if(_time != lastTime) oPlayer.cannonMove = 2;

if(_time < lastTime) for(var i = 0; i < numberOfBeats; i++) global.beats[i] = irandom(3);
if(_time != lastTime && _time < numberOfBeats^2/4) {
	if(global.beats[floor(_time)] != 4) {
		var _dir = global.beats[floor(_time)]*90;
		instance_create_layer(room_width/2+lengthdir_x(100,_dir),room_height/2+lengthdir_y(100,_dir),"GUI",oTest);
	}
}
if(_aheadTime != aheadLastTime && _aheadTime >= numberOfBeats^2/4) {
	if(global.beats[floor(_aheadTime)-numberOfBeats] != 4) {
		var _dir = global.beats[floor(_aheadTime)-numberOfBeats]*90;
		with(instance_create_layer(room_width/2+lengthdir_x(150,_dir),room_height/2+lengthdir_y(150,_dir),"Enemy",oEnemy)) {
			direction = _dir;
			speed = -4;
		}
	}
}

lastTime = _time;
aheadLastTime = _aheadTime

audio_sound_pitch(song,global.alive);

var _score = 100-sin((abs(lengthdir_x(abs(abs(mouse_x-room_width/2)-room_width/4)/room_width*4,direction))+abs(lengthdir_y(abs(abs(mouse_y-room_height/2)-room_height/4)/room_height*4,direction)))*(pi/2))*100;
show_debug_message(_score);