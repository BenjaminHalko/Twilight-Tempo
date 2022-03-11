enableLive;

var _realTime = audio_sound_get_track_position(song)/60*global.bpm;
var _time = floor((_realTime % (numberOfBeats*2)) * numberOfBeats/4);
var _aheadTime = floor(((_realTime+.75) % (numberOfBeats*2)) * numberOfBeats/4);

if(_time != lastTime) oPlayer.cannonMove = 2;

if(_time < lastTime) for(var i = 0; i < numberOfBeats; i++) global.beats[i] = irandom(3);
if(_time != lastTime && _time < numberOfBeats^2/4) {
	if(global.beats[floor(_time)] != 4) {
		var _dir = global.beats[floor(_time)]*90;
		instance_create_layer(room_width/2+lengthdir_x(100,_dir),room_height/2+lengthdir_y(100,_dir),"Enemy",oTest);
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